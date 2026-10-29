// See top-level comment in 'top.py' for usage information.
//
// The UI: a ring of cells round the screen (type, preset, the type's
// parameters as dials, setup) with a hub in the middle showing the selected
// item, its description, the control voltages and the engine's status.
//
// - Turn the encoder to move round the ring; click to change the selected
//   item (turn, then click again). A type is loaded on that click; presets
//   apply as you turn through them.
// - Hold the encoder on a parameter to set how far each modulation source
//   moves it: CV1 (in2); click for CV2 (in3), then the audio input's level,
//   bass and treble (followers); click again when done.
// - A type with a trigger (the spring's kick) has a button for it: click to
//   fire. A rising gate on CV1 or CV2 can fire it too (setup, kick gate).
// - Setup: output (reverb, bypass, mute), each CV input's range, the kick
//   gate, save, reset.
// - A type or preset chosen in the menu is saved by itself (with the
//   values it sets, the modulation depths and setup) a moment later, so the
//   next power-up starts with it; setup's save keeps other changes too.
//
// OUT0/1 are the type's mix of dry and reverb, OUT2/3 the reverb alone.
//
// The screen: a backdrop drawn by the gateware fills everything left black,
// its rings rippling with the reverb's level; the selected item pulses (an
// animated palette entry). A new type closes a curtain over the screen,
// loads, redraws behind it and opens it again; dials sweep to their values.

#![no_std]
#![no_main]

use core::cell::RefCell;
use core::fmt::Write;
use core::sync::atomic::{AtomicU32, Ordering};

use critical_section::Mutex;
use heapless::{String, Vec};
use irq::handler;
use log::{info, warn};
use riscv_rt::entry;
use tiliqua_hal::embedded_graphics::prelude::*;

use bfr_cpu::control::Control;
use bfr_cpu::cv::{self, FOLLOWERS, N_FOLLOWERS, N_SOURCES, SOURCE_NAMES};
use bfr_cpu::layout::{self, hub_chars, HELP_LINES, HELP_PITCH, HELP_Y, MAX_CELLS};
use bfr_cpu::program::{N_PROGRAMS, PROGRAMS};
use bfr_cpu::types::{ParamDecl, MAX_PARAMS};
use hal::pca9635::*;
use hal::pmod::EurorackPmod;
use opts::persistence::*;
use opts::OptionTrait;
use pac::constants::*;
use tiliqua_fw::busstats::BusStats;
use tiliqua_fw::engine::{Engine, Stats};
use tiliqua_fw::glyphs::{self, Face, Glyphs, SHEET_BYTES};
use tiliqua_fw::input::{accelerate, Event, Input};
use tiliqua_fw::options::*;
use tiliqua_fw::screen::{Cell, Highlight, Screen, View};
use tiliqua_fw::theme;
use tiliqua_fw::ui::{Backdrop, Fill};
use tiliqua_fw::*;
use tiliqua_hal as hal;
use tiliqua_lib::color::HI8;
use tiliqua_lib::*;
use tiliqua_pac as pac;

pub const TIMER0_ISR_PERIOD_MS: u32 = 5;
/// Screen updates per second at most (each draws only what changed).
const DRAW_HZ: u32 = 30;
/// CV smoothing: the fraction of the remaining distance moved each 5 ms
/// tick (a time constant of about 10 ms).
const CV_SMOOTHING: f64 = 0.4;
/// Parameters a tick may recompute for control voltages (menu changes
/// always apply at once).
const CV_UPDATES_PER_TICK: usize = 3;
/// How long a note ("saved") stays in the hub.
const NOTE_MS: u32 = 1500;

const SETUP_ITEMS: [&str; 7] = ["output", "cv1 range", "cv2 range", "kick gate", "save", "reset",
                                 "back"];
/// Setup items 0..SETUP_VALUES have values to edit.
const SETUP_VALUES: u8 = 4;
/// The curtain's close and open around a type change.
const CLOSE_MS: u32 = 160;
const OPEN_MS: u32 = 260;
/// The animations' frame (palette, rings, curtain).
const ANIMATE_MS: u32 = 16;
/// Each drawn frame, a dial moves this fraction of the way to its value.
const EASE: f32 = 0.45;
/// The kick button's flash falls by 1/e in this time.
const FLASH_MS: f64 = 160.0;
/// The gate threshold on CV1/CV2.
const GATE_VOLTS: f64 = 1.0;
/// A type loaded or a preset chosen from the menu is saved this long after
/// (the curtain is open again by then; turning through presets re-arms it).
const AUTOSAVE_MS: u32 = 1500;
/// A modulated dial's notch moves in steps of 1/NOTCH_STEPS of the sweep
/// (about a pixel at the ring's radius).
const NOTCH_STEPS: f32 = 128.0;
/// The motherboard's bargraph is updated at most this often (from the main
/// loop: its I2C transfer was most of the timer interrupt's time).
const LEDS_MS: u32 = 20;

#[derive(Clone, Copy, PartialEq, Eq)]
enum Mode {
    Browse,
    Edit,
    /// Setting source `c`'s (`cv::SOURCE_NAMES`) depth for the selected
    /// parameter.
    Cv(u8),
    Setup { cursor: u8, editing: bool },
}

/// A cell of the ring.
#[derive(Clone, Copy, PartialEq, Eq)]
enum Item {
    Type,
    Preset,
    /// Trigger `k` of the type (`Program::triggers`): a button.
    Kick(u8),
    /// Slot `j` (in `Opts::slots` order), holding one of the type's parameters.
    Slot(u8),
    Setup,
}

/// The ring for the loaded type.
fn items(opts: &Opts) -> Vec<Item, MAX_CELLS> {
    let mut v = Vec::new();
    v.push(Item::Type).ok();
    v.push(Item::Preset).ok();
    for k in 0..program().triggers.len() {
        v.push(Item::Kick(k as u8)).ok();
    }
    for (j, s) in opts.slots().enumerate() {
        if s.in_use() {
            v.push(Item::Slot(j as u8)).ok();
        }
    }
    v.push(Item::Setup).ok();
    v
}

/// Each source's amount: the CVs' (`cv::Range::amount`) for their smoothed
/// voltages, then the followers' envelopes.
fn amounts(opts: &Opts, volts: [f64; 2], follow: [f64; N_FOLLOWERS]) -> [f64; N_SOURCES] {
    let s = &opts.settings;
    let mut a = [0.0; N_SOURCES];
    a[0] = s.cv1_range.value.range().amount(volts[0]);
    a[1] = s.cv2_range.value.range().amount(volts[1]);
    a[FOLLOWERS..].copy_from_slice(&follow);
    a
}

/// The modulation's offset of slot `j`'s position.
fn cv_offset(opts: &Opts, j: usize, amounts: [f64; N_SOURCES]) -> f64 {
    (0..N_SOURCES).map(|c| opts.depths(c)[j].fraction() * amounts[c]).sum()
}

struct App {
    opts: Opts,
    encoder: Encoder0,
    input: Input,
    pmod: EurorackPmod0,
    ctl: Control,
    engine: Engine,
    /// The type loaded (index in `PROGRAMS`) and the preset last applied.
    active: usize,
    preset: u8,
    mode: Mode,
    selected: usize,
    /// The type chosen while editing the type cell (loaded on the click).
    type_choice: usize,
    /// Per slot: the grid index and position (with CV) last applied.
    applied: [(u16, f64); N_SLOTS],
    /// Where the CV pass resumes (it updates a few slots a tick).
    next_slot: usize,
    volts: [cv::Smoother; 2],
    /// The input followers' envelopes (level, bass, treble).
    follow: [cv::Follower; N_FOLLOWERS],
    counts_per_v: f64,
    output: Output,
    /// The delay memory cleared at the last load.
    cleared: bool,
    /// Frame count at which a load's warm-up ends and the outputs come back.
    unmute_at: Option<u32>,
    /// A load for the main loop to log: never log in the timer interrupt
    /// (the logger isn't interrupt-safe; a type switch hung the firmware).
    loaded: Option<(usize, bool)>,
    /// A save for the main loop (flash writes stay out of the interrupt).
    save: bool,
    /// A note for the hub, and when it goes.
    note: Option<(&'static str, u32)>,
    /// A type chosen in the menu, loaded once the curtain has closed.
    pending_type: Option<usize>,
    /// When a trigger last fired (the button's flash), and how often.
    kicked_ms: Option<u32>,
    kicks: u32,
    uptime_ms: u32,
    /// Parameters recomputed for the CVs since the last log.
    cv_updates: u32,
}

/// The application, in static RAM: the CPU's block RAM (32 KB) holds the
/// stack too, and moving a large App around on it overflowed.
static APP: Mutex<RefCell<Option<App>>> = Mutex::new(RefCell::new(None));

/// The longest control tick since the last log, in microseconds.
static TICK_US_MAX: AtomicU32 = AtomicU32::new(0);

/// Milliseconds since boot (the timer interrupt's count; it stops during a
/// load, which runs with interrupts off, so a load can't be timed by it).
static UPTIME_MS: AtomicU32 = AtomicU32::new(0);

fn uptime_ms() -> u32 {
    UPTIME_MS.load(Ordering::Relaxed)
}

impl App {
    fn new(opts: Opts) -> Self {
        let peripherals = unsafe { pac::Peripherals::steal() };
        let encoder = Encoder0::new(peripherals.ENCODER0);
        let mut pmod = EurorackPmod0::new(peripherals.PMOD0_PERIPH);
        pmod.led_all_auto();
        let counts_per_v = (pmod.counts_per_v() as f64).max(1.0);
        Self {
            opts,
            encoder,
            input: Input::default(),
            pmod,
            ctl: Control::new(PROGRAMS[0]),
            engine: Engine::new(peripherals.BFR),
            active: 0,
            preset: 0,
            mode: Mode::Browse,
            selected: 0,
            type_choice: 0,
            applied: [(UNSET, 0.0); N_SLOTS],
            next_slot: 0,
            volts: [cv::Smoother::default(); 2],
            follow: [cv::Follower::default(); N_FOLLOWERS],
            counts_per_v,
            output: Output::Reverb,
            cleared: false,
            unmute_at: None,
            loaded: None,
            save: false,
            note: None,
            pending_type: None,
            kicked_ms: None,
            kicks: 0,
            uptime_ms: 0,
            cv_updates: 0,
        }
    }

    /// Load type `k` into the engine. With `fresh`, every slot takes the
    /// type's default and the modulation depths are cleared (a type chosen in the
    /// menu); otherwise slots keep their values, clamped to the type's grid
    /// (restored options), and unset slots take the default. The outputs
    /// stay muted until the warm-up is over (`service_load`).
    fn load_type(&mut self, k: usize, fresh: bool) -> bool {
        set_active(k);
        let prog = PROGRAMS[active()];
        if fresh {
            self.opts.kind.preset.index = 0;
            for c in 0..N_SOURCES {
                for d in self.opts.depths_mut(c).iter_mut() {
                    d.percent = 0;
                }
            }
        }
        self.opts.kind.kind.index = k as u8;
        let mut values = [0.0f64; MAX_PARAMS];
        for (j, s) in self.opts.slots_mut().enumerate() {
            if let Some(d) = s.decl() {
                if fresh || s.index == UNSET {
                    s.index = d.default_index;
                }
                s.index = s.index.min(d.steps);
                values[s.param().unwrap()] = s.param_value();
                self.applied[j] = (s.index, d.t_of(s.index));
            }
        }
        self.active = active();
        self.type_choice = self.active;
        self.preset = self.opts.kind.preset.index;
        self.ctl.reset(prog);
        self.cleared = self.engine.load(&mut self.ctl, &values[..prog.params.len()]);
        let frames = self.engine.stats().frames;
        self.unmute_at = Some(frames.wrapping_add(Engine::warmup(prog)));
        self.loaded = Some((self.active, self.cleared));
        self.cleared
    }

    /// Choosing a preset sets every slot: its value, or the type's default.
    /// A type whose presets set follower depths (`Preset::mods`) sets them
    /// on every choice (the default: none); the CV depths are kept.
    fn apply_preset(&mut self, p: u8) {
        self.preset = p;
        self.opts.kind.preset.index = p;
        let prog = PROGRAMS[self.active];
        let preset = (p as usize).checked_sub(1).and_then(|i| prog.presets.get(i));
        for s in self.opts.slots_mut() {
            if let Some(d) = s.decl() {
                let i = s.param().unwrap();
                s.index = preset.and_then(|pr| pr.values.iter().find(|v| v.0 as usize == i))
                                .map(|v| v.1)
                                .unwrap_or(d.default_index);
            }
        }
        if prog.presets.iter().any(|pr| !pr.mods.is_empty()) {
            for c in FOLLOWERS..N_SOURCES {
                for d in self.opts.depths_mut(c).iter_mut() {
                    d.percent = 0;
                }
            }
            for &(src, pi, pct) in preset.map(|pr| pr.mods).unwrap_or(&[]) {
                let j = self.opts.slots().position(|s| s.param() == Some(pi as usize));
                if let Some(j) = j {
                    self.opts.depths_mut(src as usize)[j].percent = pct;
                }
            }
        }
    }

    /// Fire trigger `k` of the loaded type.
    fn kick(&mut self, k: usize) {
        if k < PROGRAMS[self.active].triggers.len() {
            self.ctl.trigger(&mut self.engine, k);
            self.kicked_ms = Some(self.uptime_ms);
            self.kicks += 1;
        }
    }

    /// The type's defaults, no modulation.
    fn reset(&mut self) {
        self.apply_preset(0);
        for c in 0..N_SOURCES {
            for d in self.opts.depths_mut(c).iter_mut() {
                d.percent = 0;
            }
        }
    }

    /// The end of a load's warm-up: crossfade rates, and the outputs back.
    fn service_load(&mut self) {
        if let Some(at) = self.unmute_at {
            if self.engine.stats().frames.wrapping_sub(at) as i32 >= 0 {
                self.unmute_at = None;
                let (run, mute) = output_mode(self.output);
                self.engine.finish_load(&self.ctl, run, mute);
            }
        }
    }

    fn handle(&mut self, e: Event) {
        let items = items(&self.opts);
        let n = items.len() as i32;
        self.selected = self.selected.min(items.len() - 1);
        let item = items[self.selected];
        match (self.mode, e) {
            (Mode::Browse, Event::Turn(t)) => {
                self.selected = (self.selected as i32 + t).rem_euclid(n) as usize;
            }
            (Mode::Browse, Event::Click) => {
                if let Item::Kick(k) = item {
                    self.kick(k as usize);
                    return;
                }
                self.mode = match item {
                    Item::Setup => Mode::Setup { cursor: 0, editing: false },
                    _ => Mode::Edit,
                };
                self.type_choice = self.active;
            }
            (Mode::Browse | Mode::Edit, Event::Hold) => {
                if let Item::Slot(_) = item {
                    self.mode = Mode::Cv(0);
                }
            }
            (Mode::Edit, Event::Turn(t)) => match item {
                Item::Type => {
                    self.type_choice = (self.type_choice as i32 + t).clamp(0, N_PROGRAMS as i32 - 1) as usize;
                }
                Item::Preset => {
                    let n_presets = PROGRAMS[self.active].presets.len() as i32 + 1;
                    let p = (self.preset as i32 + t).clamp(0, n_presets - 1) as u8;
                    if p != self.preset {
                        self.apply_preset(p);
                    }
                }
                Item::Slot(j) => {
                    if let Some(s) = self.opts.slots_mut().nth(j as usize) {
                        if let Some(d) = s.decl() {
                            s.index = (s.index as i32 + accelerate(t)).clamp(0, d.steps as i32) as u16;
                        }
                    }
                }
                Item::Kick(_) | Item::Setup => {}
            },
            (Mode::Edit, Event::Click) => {
                self.mode = Mode::Browse;
                if item == Item::Type && self.type_choice != self.active {
                    // (the main loop closes the curtain, then loads)
                    self.pending_type = Some(self.type_choice);
                }
            }
            (Mode::Cv(c), Event::Turn(t)) => {
                if let Item::Slot(j) = item {
                    self.opts.depths_mut(c as usize)[j as usize].step(accelerate(t));
                }
            }
            (Mode::Cv(c), Event::Click) if (c as usize) + 1 < N_SOURCES => self.mode = Mode::Cv(c + 1),
            (Mode::Cv(_), Event::Click | Event::Hold) => self.mode = Mode::Browse,
            (Mode::Setup { cursor, editing: false }, Event::Turn(t)) => {
                let cursor = (cursor as i32 + t).clamp(0, SETUP_ITEMS.len() as i32 - 1) as u8;
                self.mode = Mode::Setup { cursor, editing: false };
            }
            (Mode::Setup { cursor, editing: false }, Event::Click) => match cursor {
                c if c < SETUP_VALUES => self.mode = Mode::Setup { cursor, editing: true },
                4 => self.save = true,
                5 => {
                    self.reset();
                    self.note = Some(("reset to the defaults", self.uptime_ms + NOTE_MS));
                }
                _ => self.mode = Mode::Browse,
            },
            (Mode::Setup { cursor, editing: true }, Event::Turn(t)) => {
                let s = &mut self.opts.settings;
                let opt: &mut dyn OptionTrait = match cursor {
                    0 => &mut s.output,
                    1 => &mut s.cv1_range,
                    2 => &mut s.cv2_range,
                    _ => &mut s.kick_gate,
                };
                for _ in 0..t.abs() {
                    if t > 0 { opt.tick_up() } else { opt.tick_down() }
                }
            }
            (Mode::Setup { cursor, editing: true }, Event::Click) => {
                self.mode = Mode::Setup { cursor, editing: false };
            }
            (Mode::Setup { .. }, Event::Hold) => self.mode = Mode::Browse,
        }
    }

    /// Menu values and modulation -> the engine's parameters. A slot whose
    /// menu index changed applies at once; modulated changes are spread
    /// over ticks, a few slots each.
    fn apply_slots(&mut self) {
        let raw = self.pmod.sample_i();
        let mut volts = [0.0; 2];
        for c in 0..2 {
            volts[c] = self.volts[c].update(raw[2 + c] as f64 / self.counts_per_v, CV_SMOOTHING);
        }
        // (read every tick: reading clears the peaks)
        let peaks = self.engine.follow();
        let mut follow = [0.0; N_FOLLOWERS];
        for k in 0..N_FOLLOWERS {
            follow[k] = self.follow[k].update(peaks[k], TIMER0_ISR_PERIOD_MS as f64);
        }
        let amounts = amounts(&self.opts, volts, follow);
        let mut budget = CV_UPDATES_PER_TICK;
        for k in 0..N_SLOTS {
            let j = (self.next_slot + k) % N_SLOTS;
            let Some(s) = self.opts.slots().nth(j) else { continue };
            let (Some(d), Some(i)) = (s.decl(), s.param()) else { continue };
            let index = s.index;
            let offset = cv_offset(&self.opts, j, amounts);
            let t = cv::position(d, index, offset);
            let (old_index, old_t) = self.applied[j];
            let menu = index != old_index;
            if !menu && !cv::changed(d, old_t, t) {
                continue;
            }
            if !menu {
                if budget == 0 {
                    continue;
                }
                budget -= 1;
                self.cv_updates += 1;
                self.next_slot = (j + 1) % N_SLOTS;
            }
            self.applied[j] = (index, t);
            self.ctl.set_param(&mut self.engine, i, cv::value(d, index, offset));
        }
    }

    fn tick(&mut self) {
        self.uptime_ms = self.uptime_ms.wrapping_add(TIMER0_ISR_PERIOD_MS);
        UPTIME_MS.store(self.uptime_ms, Ordering::Relaxed);
        // (read every tick: reading clears the latched edges)
        let edges = self.engine.gate_edges();
        if edges & self.opts.settings.kick_gate.value.mask() != 0 {
            self.kick(0);
        }
        let pressed = unsafe { pac::ENCODER0::steal() }.button().read().bits() != 0;
        let mut events = Vec::new();
        self.input.poll(&mut self.encoder, pressed, TIMER0_ISR_PERIOD_MS, &mut events);
        let active = self.active;
        for e in events {
            self.handle(e);
        }
        if self.active != active {
            return; // a new type: the rest waits for the next tick
        }
        if self.opts.kind.preset.index != self.preset {
            self.apply_preset(self.opts.kind.preset.index);
        }
        self.apply_slots();
        self.ctl.service(&mut self.engine);

        let output = self.opts.settings.output.value;
        if output != self.output {
            self.output = output;
            if self.unmute_at.is_none() {
                let (run, mute) = output_mode(output);
                self.engine.set_output(run, mute);
            }
        }
        self.service_load();
    }
}

/// (run, mute) for an output mode: bypass stops the engine (IN0/1 straight
/// through, OUT2/3 silent), mute keeps it running silently.
fn output_mode(o: Output) -> (bool, bool) {
    match o {
        Output::Reverb => (true, false),
        Output::Bypass => (false, false),
        Output::Mute => (true, true),
    }
}

fn timer0_handler() {
    let timer = unsafe { Timer0::summon() };
    let start = timer.counter();
    critical_section::with(|cs| {
        let mut app = APP.borrow_ref_mut(cs);
        if let Some(app) = app.as_mut() {
            app.tick();
        }
    });
    let ticks = start.abs_diff(timer.counter());
    let us = ticks / (CLOCK_SYNC_HZ / 1_000_000);
    // (no atomic read-modify-write on rv32im: this interrupt is the only
    // writer, the main loop only reads and clears it in a critical section)
    if us > TICK_US_MAX.load(Ordering::Relaxed) {
        TICK_US_MAX.store(us, Ordering::Relaxed);
    }
}

/// What the main loop draws from: a copy of the App's state.
struct Snapshot {
    opts: Opts,
    active: usize,
    type_choice: usize,
    mode: Mode,
    selected: usize,
    volts: [f64; 2],
    follow: [f64; N_FOLLOWERS],
    note: Option<&'static str>,
    stats: Stats,
    cleared: bool,
    pending_type: Option<usize>,
    kicked_ms: Option<u32>,
}

fn s<const N: usize>(text: &str) -> String<N> {
    let mut out = String::new();
    for c in text.chars() {
        if out.push(c).is_err() {
            break;
        }
    }
    out
}

/// A title for a cell: no spaces ("Room/Hall").
fn compact<const N: usize>(text: &str) -> String<N> {
    let mut out = String::new();
    for c in text.chars().filter(|c| *c != ' ') {
        if out.push(c).is_err() {
            break;
        }
    }
    out
}

fn preset_name(prog_index: usize, p: u8) -> &'static str {
    match p {
        0 => "default",
        p => PROGRAMS[prog_index].presets.get(p as usize - 1).map(|pr| pr.name).unwrap_or("-"),
    }
}

/// The description lines: `text` wrapped to the hub.
fn wrapped(text: &str, color: HI8) -> Vec<(String<64>, HI8), HELP_LINES> {
    let mut widths = [0usize; HELP_LINES];
    for (i, w) in widths.iter_mut().enumerate() {
        *w = hub_chars(layout::TEXT, HELP_Y + HELP_PITCH * i as i32).min(64);
    }
    let mut parts = [("", false); HELP_LINES];
    let n = layout::wrap(text, &widths, &mut parts);
    let mut v = Vec::new();
    for (line, cut) in parts[..n].iter() {
        let mut l: String<64> = s(line);
        if *cut {
            l.push_str("..").ok();
        }
        v.push((l, color)).ok();
    }
    v
}

fn view(snap: &Snapshot, prog_status: &str, status_color: HI8) -> View {
    let opts = &snap.opts;
    let items = items(opts);
    let selected = snap.selected.min(items.len() - 1);
    let amounts = amounts(opts, snap.volts, snap.follow);
    let editing = !matches!(snap.mode, Mode::Browse);
    let mut cells = Vec::new();
    for item in items.iter() {
        let cell = match *item {
            Item::Type => {
                let k = if editing && items[selected] == Item::Type { snap.type_choice } else { snap.active };
                Cell { label: s("type"), value: compact(PROGRAMS[k].title), dial: None, modulated: None,
                       cv: [false; 3], accent: None }
            }
            Item::Preset => Cell { label: s("preset"), value: s(preset_name(snap.active, opts.kind.preset.index)),
                                   dial: None, modulated: None, cv: [false; 3], accent: None },
            Item::Kick(k) => {
                let name = PROGRAMS[snap.active].triggers.get(k as usize).map(|t| t.name).unwrap_or("kick");
                Cell { label: s(name), value: s("hit!"), dial: None, modulated: None, cv: [false; 3],
                       accent: Some(theme::KICK_RING) }
            }
            Item::Slot(j) => {
                // (a type switch in the interrupt can change the slots under
                // a view being built: the next view is right again)
                let j = j as usize;
                let Some(slot) = opts.slots().nth(j) else { continue };
                let Some(d) = slot.decl() else { continue };
                let on = |c: usize| opts.depths(c)[j].percent != 0;
                let cvs = [on(0), on(1), (FOLLOWERS..N_SOURCES).any(on)];
                // (in steps of about a pixel of the dial's arc: a follower
                // moves continuously, and each step repaints the dial)
                let modulated = cvs.contains(&true).then(|| {
                    let t = cv::position(d, slot.index, cv_offset(opts, j, amounts)) as f32;
                    (t * NOTCH_STEPS + 0.5) as i32 as f32 / NOTCH_STEPS
                });
                Cell { label: s(d.label), value: s(&slot.value()), dial: Some(d.t_of(slot.index) as f32),
                       modulated, cv: cvs, accent: None }
            }
            Item::Setup => Cell { label: s("setup"), value: s("menu"), dial: None, modulated: None,
                                  cv: [false; 3], accent: None },
        };
        cells.push(cell).ok();
    }

    let mut title: String<24> = s(PROGRAMS[snap.active].title);
    title.make_ascii_uppercase();
    let mut preset: String<40> = s("preset: ");
    preset.push_str(preset_name(snap.active, opts.kind.preset.index)).ok();
    let mut sel_label: String<40> = String::new();
    let mut sel_value: String<24> = String::new();
    let mut sel_value_color = theme::TEXT;
    let mut lines = Vec::new();
    // The inputs' readout (`--debug`: redrawn every frame they change), and
    // the selected parameter's modulated value.
    let mut cv_line: String<64> = String::new();
    if BFR_DEBUG {
        let pct = |x: f64| (x * 100.0 + 0.5) as u32;
        write!(cv_line, "CV1 {} V  CV2 {} V  L{:>3} B{:>3} T{:>3}", Fixed(snap.volts[0], 2, true),
               Fixed(snap.volts[1], 2, true), pct(snap.follow[0]), pct(snap.follow[1]),
               pct(snap.follow[2])).ok();
    }

    match (items[selected], snap.mode) {
        (Item::Type, mode) => {
            sel_label = s("type");
            let k = if mode == Mode::Edit { snap.type_choice } else { snap.active };
            sel_value = s(PROGRAMS[k].title);
            let mut text: String<200> = String::new();
            if mode == Mode::Edit {
                text.push_str("Turn to choose, click to load. ").ok();
            }
            text.push_str(PROGRAMS[k].description).ok();
            lines = wrapped(&text, theme::TEXT);
        }
        (Item::Preset, mode) => {
            sel_label = s("preset");
            sel_value = s(preset_name(snap.active, opts.kind.preset.index));
            lines = wrapped(if mode == Mode::Edit {
                "Presets apply as you turn: click when you have the one you want."
            } else {
                "A starting point for this type: choosing one sets every parameter."
            }, theme::TEXT);
        }
        (Item::Kick(k), _) => {
            let prog = PROGRAMS[snap.active];
            let t = prog.triggers.get(k as usize);
            sel_label = s(t.map(|t| t.name).unwrap_or("kick"));
            sel_value = s("click to hit");
            let mut text: String<200> = s(t.map(|t| t.help).unwrap_or(""));
            let gate = opts.settings.kick_gate.value;
            if gate == KickGate::Off {
                text.push_str(" A gate on CV1 or CV2 can hit it too: setup, kick gate.").ok();
            } else {
                write!(text, " A gate on {} hits it too.", <&str>::from(gate)).ok();
            }
            lines = wrapped(&text, theme::TEXT);
        }
        (Item::Slot(j), mode) => 'slot: {
            let j = j as usize;
            let Some(slot) = opts.slots().nth(j) else { break 'slot };
            let Some(d) = slot.decl() else { break 'slot };
            let d: &ParamDecl = d;
            sel_value = s(&slot.value());
            match mode {
                Mode::Cv(c) => {
                    let c = c as usize;
                    write!(sel_label, "{}: {} depth", d.label, SOURCE_NAMES[c]).ok();
                    sel_value = s(&opts.depths(c)[j].value());
                    sel_value_color = theme::CV;
                    let mut text: String<200> = String::new();
                    let _ = match c {
                        0 | 1 => write!(text, "How far CV{} (in{}) moves {} at its full scale: turn to set.",
                                        c + 1, c + 2, d.label),
                        2 => write!(text, "How far the input's level moves {}, from silence to loud \
                                           playing (negative: the other way): turn to set.", d.label),
                        3 => write!(text, "How far the input's bass (below about 240 Hz) moves {}, \
                                           from none to loud: turn to set.", d.label),
                        _ => write!(text, "How far the input's treble (above about 2 kHz) moves {}, \
                                           from none to loud: turn to set.", d.label),
                    };
                    match SOURCE_NAMES.get(c + 1) {
                        Some(next) => write!(text, " Click for {}.", next).ok(),
                        None => text.push_str(" Click when done.").ok(),
                    };
                    lines = wrapped(&text, theme::TEXT);
                }
                _ => {
                    sel_label = s(d.label);
                    let mut text: String<200> = s(d.help);
                    if mode == Mode::Browse {
                        text.push_str(" Click to change, hold to modulate.").ok();
                    }
                    lines = wrapped(&text, theme::TEXT);
                }
            }
            let offset = cv_offset(opts, j, amounts);
            if offset != 0.0 {
                let sep = if cv_line.is_empty() { "" } else { "    " };
                write!(cv_line, "{}now {}", sep, format_value(d, cv::value(d, slot.index, offset))).ok();
            }
        }
        (Item::Setup, Mode::Setup { cursor, editing }) => {
            sel_label = s("setup");
            let st = &opts.settings;
            // (more items than lines: the list scrolls with the cursor)
            let first = (cursor as usize).saturating_sub(HELP_LINES - 1);
            for (i, name) in SETUP_ITEMS.iter().enumerate().skip(first).take(HELP_LINES) {
                let mut l: String<64> = String::new();
                let value = match i {
                    0 => st.output.value(),
                    1 => st.cv1_range.value(),
                    2 => st.cv2_range.value(),
                    3 => st.kick_gate.value(),
                    _ => opts::OptionString::new(),
                };
                let mark = if i == cursor as usize { ">" } else { " " };
                write!(l, "{} {:<10} {:<8}", mark, name, value.as_str()).ok();
                let color = match (i == cursor as usize, editing) {
                    (true, true) => theme::VALUE,
                    (true, false) => theme::SELECTED,
                    _ => theme::TEXT,
                };
                lines.push((l, color)).ok();
            }
        }
        (Item::Setup, _) => {
            sel_label = s("setup");
            lines = wrapped("Output (reverb, bypass, mute), the CV inputs' ranges, the kick gate, \
                             save and reset. Click to open.", theme::TEXT);
        }
    }
    if let Some(note) = snap.note {
        sel_value = s(note);
        sel_value_color = theme::WARN;
    }
    let highlight = match snap.mode {
        Mode::Browse => Highlight::Selected,
        _ => Highlight::Editing,
    };
    View {
        layout_id: snap.active as u32,
        cells,
        selected,
        highlight,
        title,
        preset,
        sel_label,
        sel_value,
        sel_value_color,
        lines,
        cv_line,
        status: s(prog_status),
        status_color,
    }
}

/// The status line: what is wrong, if anything; with `--debug` first the
/// rate, the frame budget used and the control tick's longest time.
fn status(st: &Stats, cleared: bool, stalled: bool, stack_free: usize, tick_us: u32) -> (String<64>, HI8) {
    let mut s: String<64> = String::new();
    if BFR_DEBUG {
        let budget = CLOCK_SYNC_HZ / AUDIO_FS;
        write!(s, "{} kHz  dsp {}/{} clk  ui {}.{} ms", AUDIO_FS / 1000, st.frame_clocks_max, budget,
               tick_us / 1000, tick_us % 1000 / 100).ok();
    }
    let mut warn = false;
    let mut flag = |s: &mut String<64>, what: core::fmt::Arguments| {
        if !s.is_empty() {
            s.push_str("  ").ok();
        }
        s.write_fmt(what).ok();
        warn = true;
    };
    if st.late || st.overruns != 0 {
        flag(&mut s, format_args!("LATE"));
    }
    if !cleared {
        flag(&mut s, format_args!("CLEAR TIMEOUT"));
    }
    if stalled {
        flag(&mut s, format_args!("NO FRAMES"));
    }
    if stack_free < 2048 {
        flag(&mut s, format_args!("STACK {}", stack_free));
    }
    (s, if warn { theme::WARN } else { theme::STATUS })
}

/// Save every option to the flash; a note for the hub. `verbose` keeps the
/// options crate's line per option on the serial port (about 85 lines: half
/// a second of the main loop at 115200 baud).
fn save_options(persist: &mut Option<FlashOptionsPersistence<SPIFlash0>>, opts: &Opts,
                verbose: bool) -> &'static str {
    // (rv32im has no atomics, so only the racy setter: only the main loop
    // logs, never the interrupt)
    let level = log::max_level();
    if !verbose {
        unsafe { log::set_max_level_racy(log::LevelFilter::Warn) };
    }
    let ok = persist.as_mut().map(|f| f.save_options(opts).is_ok());
    unsafe { log::set_max_level_racy(level) };
    let note = match ok {
        Some(true) => "saved",
        Some(false) => "saving failed",
        None => "no option storage",
    };
    if ok != Some(true) {
        warn!("save: {}", note);
    }
    note
}

/// The centred bargraph on the motherboard: the selected dial's position.
fn bargraph(leds: &mut Pca9635Driver<I2c0>, t: Option<f32>) {
    const GREEN: [usize; 6] = [0, 2, 14, 12, 6, 4];
    const RED: [usize; 6] = [1, 3, 15, 13, 7, 5];
    for n in 0..16 {
        leds.leds[n] = 0;
    }
    if let Some(t) = t {
        for n in 0..6 {
            if (n as f32) * 0.5 / 6.0 + 0.5 < t {
                leds.leds[RED[n]] = 0xff;
            }
            if (n as f32) * -0.5 / 6.0 + 0.5 > t {
                leds.leds[GREEN[n]] = 0xff;
            }
        }
    }
    leds.push().ok();
}

/// The selected dial's position, if a dial is selected.
fn selected_dial(snap: &Snapshot) -> Option<f32> {
    let items = items(&snap.opts);
    match items.get(snap.selected.min(items.len() - 1)) {
        Some(Item::Slot(j)) => snap.opts.slots().nth(*j as usize)
            .and_then(|s| s.decl().map(|d| d.t_of(s.index) as f32)),
        _ => None,
    }
}

/// Bursts per frame since `last` (bursts, frames), times 100.
fn per_frame_x100(bursts: u32, frames: u32, last: &(u32, u32)) -> u32 {
    let df = frames.wrapping_sub(last.1).max(1) as u64;
    (bursts.wrapping_sub(last.0) as u64 * 100 / df) as u32
}

/// Wait for the blitter to have drawn what it was given (lines aren't used,
/// and pixels go straight to the plotter).
fn plotters_idle() {
    let blit = unsafe { pac::BLIT::steal() };
    while !blit.status().read().empty().bit() {}
    for _ in 0..20_000 {
        riscv::asm::nop(); // the plotter's last writes
    }
}

/// Blank the framebuffer with the fill engine (a few ms; the CPU took 60).
///
/// The plotter writes through a small cache, whose lines can outlive the
/// fill and be written back over it: 16 pixels of the old screen at a time
/// would come back. So first a pixel in each of 16 consecutive cache lines
/// along the top-left corner's edge (off the round screen) moves every cache
/// line there: whatever is written back after the fill lands where it can't
/// be seen.
fn clear_framebuffer<D: DrawTarget<Color = HI8>>(d: &mut D, fill: &mut Fill, words: usize) {
    plotters_idle();
    d.draw_iter((0..16).map(|k| Pixel(Point::new(16 * k, 0), HI8::BLACK))).ok();
    plotters_idle();
    if !fill.run(PSRAM_FB_BASE, words, 0) {
        let fb = PSRAM_FB_BASE as *mut u32;
        for i in 0..words {
            unsafe { fb.add(i).write_volatile(0) };
        }
    }
}

/// Where the curtain is.
#[derive(Clone, Copy, PartialEq)]
enum Iris {
    Open,
    /// Closing since (ms), for a new type.
    Closing(u32),
    /// Closed, the screen being drawn afresh behind it.
    Redraw,
    Opening(u32),
}

/// A boot step, on screen (below the centre, one line each) and on serial.
fn boot_msg<D: DrawTarget<Color = HI8> + OriginDimensions>(d: &mut D, line: i32, msg: &str) {
    info!("boot: {}", msg);
    let size = d.size();
    let x = size.width as i32 / 2 - glyphs::width(Face::Text, msg.len()) / 2;
    glyphs::draw(d, Face::Text, x, size.height as i32 / 2 + 20 * line, msg, theme::TEXT);
}

/// Free PSRAM for the font sheet while it is rendered and uploaded (after
/// the framebuffer, before the firmware, which the bootloader copies to
/// PSRAM_BASE + 2 MB): 4.7 KB the 32 KB block RAM (data and stack) can't
/// spare.
const SHEET_SCRATCH: usize = PSRAM_BASE + 0x0010_0000;

/// What the main loop needs from the boot.
struct Booted {
    timer: Timer0,
    bus: BusStats,
    display: DMAFramebuffer0,
    fill: Fill,
    backdrop: Backdrop,
    flash_persist_opt: Option<FlashOptionsPersistence<SPIFlash0>>,
    fb_words: usize,
    leds: Pca9635Driver<I2c0>,
}

#[entry]
fn main() -> ! {
    tiliqua_fw::stack::paint();
    let booted = boot();
    run(booted)
}

/// Peripherals, the screen, the saved options and the first type (the App
/// is left in APP). Not inlined: its temporaries (the options and the App
/// before they move to the static, several KB) are off the stack before
/// the main loop starts, which needs the room (a type switch).
#[inline(never)]
fn boot() -> Booted {
    let peripherals = pac::Peripherals::take().unwrap();

    let serial = Serial0::new(peripherals.UART0);
    tiliqua_fw::handlers::logger_init(serial);
    // Without `--debug`, warnings only on the serial port (no statistics,
    // no per-option lines on a save).
    if !BFR_DEBUG {
        unsafe { log::set_max_level_racy(log::LevelFilter::Warn) };
    }

    let sysclk = pac::clock::sysclk();
    let timer = Timer0::new(peripherals.TIMER0, sysclk);
    let bus = BusStats::new();
    let spiflash = SPIFlash0::new(peripherals.SPIFLASH_CTRL, SPIFLASH_BASE, SPIFLASH_SZ_BYTES);

    info!("Hello from Tiliqua BFR! {} types at {} Hz:", N_PROGRAMS, PROGRAMS[0].fs);
    for p in PROGRAMS.iter() {
        info!("  {}: {} instructions, {} presets", p.title, p.instrs.len(), p.presets.len());
    }

    let bootinfo = unsafe { bootinfo::BootInfo::from_addr(BOOTINFO_BASE) }.unwrap();
    let modeline = bootinfo.modeline.maybe_override_fixed(FIXED_MODELINE, CLOCK_DVI_HZ);
    let fb_words = modeline.h_active as usize * modeline.v_active as usize / 4;
    let mut fill = Fill::new(peripherals.FILL);
    let mut display = DMAFramebuffer0::new(
        peripherals.FRAMEBUFFER_PERIPH,
        peripherals.PALETTE_PERIPH,
        peripherals.BLIT,
        peripherals.PIXEL_PLOT,
        peripherals.LINE,
        PSRAM_FB_BASE,
        modeline.clone(),
        BLIT_MEM_BASE,
    );

    // The theme, a blank screen (whatever the bootloader left), and the
    // UI's font sheet in the blitter: never replaced, so no other text
    // drawing (embedded-graphics' would upload its own sheet).
    theme::write_palette(&mut display);
    clear_framebuffer(&mut display, &mut fill, fb_words);
    let backdrop = Backdrop::new(peripherals.BACKDROP, modeline.h_active as u32,
                                     modeline.v_active as u32);
    let glyph_sheet = Glyphs::new(unsafe { &mut *(SHEET_SCRATCH as *mut [u8; SHEET_BYTES]) });
    if !glyph_sheet.upload(&mut display) {
        warn!("font sheet too large for the blitter");
    }
    boot_msg(&mut display, 0, "bfr: starting");

    let leds = Pca9635Driver::new(I2c0::new(peripherals.I2C0));
    let mut i2cdev1 = I2c1::new(peripherals.I2C1);
    let mut pmod = EurorackPmod0::new(peripherals.PMOD0_PERIPH);
    calibration::CalibrationConstants::load_or_default(&mut i2cdev1, &mut pmod);
    boot_msg(&mut display, 1, "codec calibration loaded");

    // Saved options. Storage this firmware can't read (left in the slot by
    // another bitstream) is erased instead of stopping the boot.
    let mut opts = Opts::default();
    let mut restored = false;
    let flash_persist_opt =
        if let Some(storage_window) = bootinfo.manifest.get_option_storage_window() {
            let mut flash_persist = FlashOptionsPersistence::new(spiflash, storage_window.clone());
            if flash_persist.load_options(&mut opts).is_ok() {
                restored = true;
                boot_msg(&mut display, 2, "options loaded");
            } else {
                warn!("option storage unreadable: erasing it");
                opts = Opts::default();
                // (the storage's own erase walks its items, and fails on
                // contents it can't parse: then erase the sectors outright)
                let erased = flash_persist.erase_all().is_ok() || {
                    let mut raw = SPIFlash0::new(unsafe { pac::SPIFLASH_CTRL::steal() }, SPIFLASH_BASE,
                                                 SPIFLASH_SZ_BYTES);
                    hal::nor_flash::NorFlash::erase(&mut raw, storage_window.start, storage_window.end).is_ok()
                };
                boot_msg(&mut display, 2, if erased { "options unreadable: storage erased" }
                                          else { "options unreadable: erase failed" });
            }
            Some(flash_persist)
        } else {
            warn!("No option storage region: disable persistent storage");
            boot_msg(&mut display, 2, "no option storage");
            None
        };

    let kind = (opts.kind.kind.index as usize).min(N_PROGRAMS - 1);
    let mut app = App::new(opts);
    let gate = (GATE_VOLTS * app.counts_per_v) as i32;
    app.engine.set_gate_level(gate);
    boot_msg(&mut display, 3, "engine: loading");
    let cleared = app.load_type(kind, !restored);
    boot_msg(&mut display, 4, if cleared { "engine: delay memory cleared" }
                              else { "engine: CLEAR TIMEOUT (PSRAM?)" });
    critical_section::with(|cs| APP.borrow(cs).replace(Some(app)));
    Booted { timer, bus, display, fill, backdrop, flash_persist_opt, fb_words, leds }
}

/// The main loop: draws, animates, saves, logs (the timer interrupt runs
/// the controls).
#[inline(never)]
fn run(booted: Booted) -> ! {
    let Booted { mut timer, mut bus, mut display, mut fill, mut backdrop, mut flash_persist_opt,
                 fb_words, mut leds } = booted;
    // (painted again: the boot's frames are gone, and the log's "stack free"
    // is then what the main loop and the timer interrupt leave)
    tiliqua_fw::stack::paint();
    handler!(timer0 = || timer0_handler());

    irq::scope(|sc| {
        sc.register(handlers::Interrupt::TIMER0, timer0);
        timer.enable_tick_isr(TIMER0_ISR_PERIOD_MS, pac::Interrupt::TIMER0);

        let mut screen = Screen::new(display.size().width, display.size().height);
        let mut last_frames = 0u32;
        let mut frames_seen_ms = 0u32;
        let mut last_draw_ms = 0u32;
        let mut last_log = (0u32, 0u32);       // (frames, ms)
        let mut passes = 0u32;
        let mut draws = 0u32;
        let mut last_bursts = (0u32, 0u32);    // (bursts, frames) at the last log
        let mut tick_us = 0u32;
        let bfr_regs = unsafe { pac::BFR::steal() };
        let mut last_animate_ms = 0u32;
        // The first screen opens out of the backdrop, like a type change.
        backdrop.curtain(0);
        let mut iris = Iris::Redraw;
        let mut eased = [0.0f32; layout::MAX_CELLS];
        let mut eased_layout = u32::MAX;
        let mut redraw_ms = 0u32;
        let mut draw_ms_max = 0u32;
        let mut leds_ms = 0u32;
        let mut autosave_at: Option<u32> = None;
        let mut last_preset: Option<(usize, u8)> = None;
        let mut leds_shown: Option<Option<f32>> = None;

        loop {
            let (snap, save, loaded, now_ms, cv_updates) = critical_section::with(|cs| {
                let mut app = APP.borrow_ref_mut(cs);
                let app = app.as_mut().unwrap();
                let note = match app.note {
                    Some((_, until)) if app.uptime_ms.wrapping_sub(until) as i32 >= 0 => {
                        app.note = None;
                        None
                    }
                    Some((text, _)) => Some(text),
                    None => None,
                };
                let snap = Snapshot {
                    opts: app.opts.clone(),
                    active: app.active,
                    type_choice: app.type_choice,
                    mode: app.mode,
                    selected: app.selected,
                    volts: [app.volts[0].value, app.volts[1].value],
                    follow: app.follow.map(|f| f.value),
                    note,
                    stats: app.engine.stats(),
                    cleared: app.cleared,
                    pending_type: app.pending_type,
                    kicked_ms: app.kicked_ms,
                };
                let save = core::mem::take(&mut app.save);
                let cv_updates = core::mem::take(&mut app.cv_updates);
                (snap, save, app.loaded.take(), app.uptime_ms, cv_updates)
            });
            passes += 1;
            if BFR_DEBUG {
                bus.poll();
            }
            if let Some((k, ok)) = loaded {
                let prog = PROGRAMS[k];
                info!("type: {} ({} instructions, {} streams, block-RAM {} words){}", prog.title,
                      prog.instrs.len(), prog.streams.len(), prog.mem_words[1],
                      if ok { "" } else { ", CLEAR TIMEOUT" });
            }

            let st = &snap.stats;
            if st.frames != last_frames {
                last_frames = st.frames;
                frames_seen_ms = now_ms;
            }
            let stalled = now_ms.wrapping_sub(frames_seen_ms) > 500;
            let stack_free = tiliqua_fw::stack::free();

            if save {
                let note = save_options(&mut flash_persist_opt, &snap.opts, true);
                critical_section::with(|cs| {
                    let mut app = APP.borrow_ref_mut(cs);
                    let app = app.as_mut().unwrap();
                    app.note = Some((note, app.uptime_ms + NOTE_MS));
                });
            }
            // The type loaded or preset chosen, saved once things are still.
            let preset = (snap.active, snap.opts.kind.preset.index);
            if last_preset.is_some_and(|p| p != preset) {
                autosave_at = Some(now_ms.wrapping_add(AUTOSAVE_MS));
            }
            last_preset = Some(preset);
            if let Some(at) = autosave_at {
                if iris == Iris::Open && now_ms.wrapping_sub(at) as i32 >= 0 {
                    autosave_at = None;
                    let note = save_options(&mut flash_persist_opt, &snap.opts, false);
                    info!("autosave: {} ({})", PROGRAMS[snap.active].title, note);
                }
            }

            if now_ms.wrapping_sub(leds_ms) >= LEDS_MS {
                leds_ms = now_ms;
                let t = Some(selected_dial(&snap));
                if t != leds_shown {
                    leds_shown = t;
                    bargraph(&mut leds, t.flatten());
                }
            }

            // Animation: the selection's pulse and the kick's flash (palette),
            // the rings (the reverb's level), the curtain.
            if now_ms.wrapping_sub(last_animate_ms) >= ANIMATE_MS {
                let dt = now_ms.wrapping_sub(last_animate_ms);
                last_animate_ms = now_ms;
                let flash = snap.kicked_ms.map(|t| {
                    bfr_cpu::math::exp(-(now_ms.wrapping_sub(t) as f64) / FLASH_MS) as f32
                }).unwrap_or(0.0);
                theme::animate(&mut display, now_ms, flash);
                backdrop.follow(bfr_regs.wet_peak().read().peak().bits(), dt);
                match iris {
                    Iris::Open => {
                        if snap.pending_type.is_some() {
                            iris = Iris::Closing(now_ms);
                        }
                    }
                    Iris::Closing(t0) => {
                        let t = now_ms.wrapping_sub(t0) as f32 / CLOSE_MS as f32;
                        backdrop.curtain_at(1.0 - t);
                        if t >= 1.0 {
                            // Closed: load (the interrupt waits meanwhile), and
                            // draw the new screen behind the curtain.
                            let loaded = critical_section::with(|cs| {
                                let mut app = APP.borrow_ref_mut(cs);
                                let app = app.as_mut().unwrap();
                                let k = app.pending_type.take();
                                if let Some(k) = k {
                                    app.load_type(k, true);
                                    app.selected = 0;
                                }
                                k.is_some()
                            });
                            if loaded {
                                autosave_at = Some(now_ms.wrapping_add(AUTOSAVE_MS));
                            }
                            iris = Iris::Redraw;
                            continue; // a snapshot of the new type
                        }
                    }
                    Iris::Redraw => {}
                    Iris::Opening(t0) => {
                        let t = now_ms.wrapping_sub(t0) as f32 / OPEN_MS as f32;
                        backdrop.curtain_at(t);
                        if t >= 1.0 {
                            iris = Iris::Open;
                        }
                    }
                }
            }

            if iris == Iris::Redraw || now_ms.wrapping_sub(last_draw_ms) >= 1000 / DRAW_HZ {
                last_draw_ms = now_ms;
                draws += 1;
                let (status_text, status_color) = status(st, snap.cleared, stalled, stack_free, tick_us);
                let mut v = view(&snap, &status_text, status_color);
                // Dials glide to their values (from 0 on a new screen).
                if v.layout_id != eased_layout {
                    eased_layout = v.layout_id;
                    eased = [0.0; layout::MAX_CELLS];
                }
                for (k, c) in v.cells.iter_mut().enumerate() {
                    if let Some(t) = c.dial {
                        let e = &mut eased[k];
                        *e = if (t - *e).abs() < 0.004 { t } else { *e + (t - *e) * EASE };
                        c.dial = Some(*e);
                    }
                }
                let t0 = uptime_ms();
                let fresh = screen.draw(&mut display, &v, |d| clear_framebuffer(d, &mut fill, fb_words));
                let ms = uptime_ms().wrapping_sub(t0);
                draw_ms_max = draw_ms_max.max(ms);
                if fresh {
                    redraw_ms = ms;
                }
                if iris == Iris::Redraw {
                    plotters_idle();
                    iris = Iris::Opening(uptime_ms());
                }
            }

            // Statistics on the serial port once a second (`--debug`).
            if BFR_DEBUG && now_ms.wrapping_sub(last_log.1) >= 1000 {
                tick_us = critical_section::with(|_| {
                    let us = TICK_US_MAX.load(Ordering::Relaxed);
                    TICK_US_MAX.store(0, Ordering::Relaxed);
                    us
                });
                let bpf = per_frame_x100(st.bursts, st.frames, &last_bursts);
                info!("frames {} (+{})  clocks {}/{} max  overruns {}  bursts {} ({}.{:02}/frame)  lag {}/{}  scan lag {}  resyncs {}  late {}  wto {}",
                      st.frames, st.frames.wrapping_sub(last_log.0), st.frame_clocks,
                      st.frame_clocks_max, st.overruns, st.bursts, bpf / 100, bpf % 100,
                      st.max_lag, program().burst, st.scan_lag, st.resyncs, st.late,
                      st.write_timeouts);
                info!("cpu: {} loop passes, {} draws, longest tick {} us, cv updates {}, \
                       cv {} V {} V, follow {} {} {}, stack free {}",
                      passes, draws, tick_us, cv_updates, Fixed(snap.volts[0], 2, false),
                      Fixed(snap.volts[1], 2, false), Fixed(snap.follow[0], 2, false),
                      Fixed(snap.follow[1], 2, false), Fixed(snap.follow[2], 2, false), stack_free);
                info!("screen: longest draw {} ms, last full redraw {} ms", draw_ms_max, redraw_ms);
                draw_ms_max = 0;
                bus.log();
                last_log = (st.frames, now_ms);
                last_bursts = (st.bursts, st.frames);
                passes = 0;
                draws = 0;
            }
        }
    })
}
