//! NAM's firmware: pick a `.nam` from a USB drive and the engine plays it.
//!
//! The controls run on the timer interrupt; everything else, the drive, loading and drawing, in
//! the main loop. A profile loads in two steps (`nam_cpu::loader`): checked and quantised while
//! the last one keeps playing, then written into the engine, which is then run on silence for
//! a while (prewarm) before its input and output come up, so the delay lines start as they would
//! after silence rather than at zero.

#![no_std]
#![no_main]

use core::cell::RefCell;
use core::fmt::Write;
use core::sync::atomic::{AtomicU32, Ordering};

use critical_section::Mutex;
use guh_dma::DmaBuf;
use heapless::{String, Vec};
use irq::handler;
use log::{info, warn};
use riscv_rt::entry;
use tiliqua_hal::embedded_graphics::prelude::*;
use tiliqua_lib::color::HI8;

use nam_cpu::browser::{arrange, row_of, selectable, BrowserAction, BrowserCursor, DrivePath, Info, Row};
use nam_cpu::disk::{Entry, HOME_FOLDER, MAX_ENTRIES};
use nam_cpu::namfile::{self, Verdict};
use nam_cpu::controls::{meter_thresholds, tone_sections, AmpCursor, Change, Controls, Meter, Offers, Setting,
                        SystemCursor, ToneControls, ToneCursor, ToneSetting, THEMES};
use nam_cpu::gate::{self, Gate};
use nam_cpu::loader::{self, level_words, post_shift, Levels, Loaded, Prepared, Width, MAX_WEIGHTS};
use nam_cpu::program::{AUX_GAIN_IN, AUX_GAIN_OUT};
use nam_cpu::nav::{Event, Nav, Page};
use pac::constants::*;
use tiliqua_fw::engine::{self as engine_regs, Engine};
use tiliqua_fw::glyphs::{Glyphs, SHEET_BYTES};
use tiliqua_fw::input::Input;
use tiliqua_fw::screen::{clear_framebuffer, Fill, Lines};
use tiliqua_fw::theme;
use tiliqua_fw::ui::{self, AmpView, Arcs, BrowserView, Screen, ToneView, N_LINES};
use tiliqua_fw::usb::{Drive, DriveEvent};
use tiliqua_fw::*;
use tiliqua_lib::*;
use tiliqua_pac as pac;

const TIMER0_ISR_PERIOD_MS: u32 = 5;
/// The interrupt's tick is the gate's (`gate::TICK_US`); the controls run every this many, and
/// the clock counts milliseconds every this many.
const TICKS_PER_CONTROL: u32 = TIMER0_ISR_PERIOD_MS * 1000 / gate::TICK_US;
const TICKS_PER_MS: u32 = 1000 / gate::TICK_US;
/// A step of the output's rise after a load, in ms.
const RAMP_STEP_MS: u32 = 5;
const DRAW_MS: u32 = 40;
/// The engine's figures on the System screen are this often.
const FIGURES_MS: u32 = 500;
const LOG_MS: u32 = 5000;
/// Engine clocks a sample has at 48 kHz (the engine runs at twice the system clock).
const SAMPLE_CLOCKS: u32 = 2 * CLOCK_SYNC_HZ / AUDIO_FS;
/// How long a new profile runs on silence before it is heard: past its receptive field (6,347
/// samples, 132 ms), every delay line holds what silence leaves in it.
const PREWARM_MS: u32 = 250;
/// Then the output comes up in this many steps, one a control tick (80 ms).
const RAMP_STEPS: i32 = 16;

// PSRAM: the file buffer holds a profile as read from the drive, its end the quantised weights
// (and its start, while a folder is listed, each file's first bytes); the UI scratch, after the
// font sheet (used once, at boot), the directory listing, what each profile is, the list's rows
// and the lines on screen.
const WEIGHTS_BYTES: usize = 0x1_0000;
const FILE_BYTES: usize = PSRAM_FILE_BYTES - WEIGHTS_BYTES;
const FILE_ADDR: usize = PSRAM_BASE + PSRAM_FILE_BASE;
const WEIGHTS_ADDR: usize = FILE_ADDR + FILE_BYTES;
/// How much of each `.nam` a listing reads to see what it is: a network's config and metadata
/// come before its weights, 13 KB in for the example (one USB read). At the file buffer's end, so
/// the profile playing stays whole there (switching Lite and Full prepares it again).
const HEAD_BYTES: usize = 0x8000;
/// The weights as parsed, kept between the loader's two passes (f64s).
const VALUES_BYTES: usize = 0x2_0000;
const READ_BYTES: usize = FILE_BYTES - HEAD_BYTES - VALUES_BYTES;
const VALUES_ADDR: usize = FILE_ADDR + READ_BYTES;
const HEAD_ADDR: usize = VALUES_ADDR + VALUES_BYTES;
const _: () = assert!(MAX_WEIGHTS * 8 <= VALUES_BYTES);
const ENTRIES_ADDR: usize = PSRAM_BASE + PSRAM_UI_SCRATCH + 0x1_0000;
const INFOS_ADDR: usize = PSRAM_BASE + PSRAM_UI_SCRATCH + 0x2_0000;
const ROWS_ADDR: usize = PSRAM_BASE + PSRAM_UI_SCRATCH + 0x3_0000;
const ORDER_ADDR: usize = PSRAM_BASE + PSRAM_UI_SCRATCH + 0x3_1000;
const LINES_ADDR: usize = PSRAM_BASE + PSRAM_UI_SCRATCH + 0x3_8000;
/// The list's rows: every entry and a heading for each tone.
const MAX_ROWS: usize = MAX_ENTRIES + 6;
const _: () = assert!(MAX_WEIGHTS * 4 <= WEIGHTS_BYTES);
const _: () = assert!(HEAD_BYTES <= FILE_BYTES);
const _: () = assert!(SHEET_BYTES <= 0x1_0000);
const _: () = assert!(MAX_ENTRIES * core::mem::size_of::<Entry>() <= 0x1_0000);
const _: () = assert!(MAX_ENTRIES * core::mem::size_of::<Info>() <= 0x1_0000);
const _: () = assert!(MAX_ROWS * core::mem::size_of::<Row>() <= 0x1000);
const _: () = assert!(MAX_ENTRIES * 2 <= 0x7000);
/// The engine's PSRAM rings, as the program builder takes their place: a 32-bit word address.
const RINGS_BASE_WORDS: u32 = (PSRAM_RINGS_BASE / 4) as u32;

/// The controls: the interrupt's state, and what the main loop takes from it.
struct App {
    encoder: Encoder0,
    input: Input,
    nav: Nav,
    cursor: BrowserCursor,
    /// What the browser asked for, until the main loop takes it.
    action: Option<BrowserAction>,
    amp: AmpCursor,
    controls: Controls,
    /// The widths the profile playing has (the Amp screen's NETWORK setting).
    offers: Offers,
    /// What edits changed, until the main loop takes them.
    levels_changed: bool,
    width_changed: bool,
    tone_cursor: ToneCursor,
    tone: ToneControls,
    /// The noise gate, run every tick, and what it is applied to: the output gain word it scales
    /// (None while a profile loads or warms, when the main loop has the word), the word last
    /// written, the gain now (Q16), the input gain it adds to the input's level (1/256 dB).
    gate: Gate,
    out_base: Option<i32>,
    out_written: Option<i32>,
    gate_gain: u32,
    in_gain: i32,
    /// The meters' peaks since the main loop last took them.
    peaks: (u16, u16),
    ticks: u32,
    system_cursor: SystemCursor,
    theme: usize,
    /// Changes for the main loop: the theme (a palette write and a redraw), the tone stack's
    /// settings (its coefficients).
    theme_changed: bool,
    tone_changed: bool,
}

impl App {
    /// Every `gate::TICK_US`: the meters and the gate; every few, the controls.
    fn fast_tick(&mut self) {
        self.ticks = self.ticks.wrapping_add(1);
        if self.ticks % TICKS_PER_MS == 0 {
            UPTIME_MS.store(uptime_ms().wrapping_add(1), Ordering::Relaxed);
        }
        if self.ticks % TICKS_PER_CONTROL == 0 {
            self.tick();
        }
        let (i, o) = engine_regs::meters_from_isr();
        self.peaks = (self.peaks.0.max(i), self.peaks.1.max(o));
        self.gate.on = self.tone.gate;
        self.gate.threshold = self.tone.threshold_db * gate::DB;
        self.gate_gain = self.gate.tick(i, self.in_gain);
        if let Some(base) = self.out_base {
            let word = ((base as i64 * self.gate_gain as i64) >> 16) as i32;
            if self.out_written != Some(word) {
                engine_regs::write_aux_from_isr(AUX_GAIN_OUT, word);
                self.out_written = Some(word);
            }
        }
    }

    fn tick(&mut self) {
        let pressed = unsafe { pac::ENCODER0::steal() }.button().read().bits() != 0;
        let mut events: Vec<Event, 4> = Vec::new();
        self.input.poll(&mut self.encoder, pressed, TIMER0_ISR_PERIOD_MS, &mut events);
        for e in events {
            let Some(e) = self.nav.handle(e) else { continue };
            match self.nav.page() {
                Page::Browser => {
                    if let Some(a) = self.cursor.event(e) {
                        self.action = Some(a);
                    }
                }
                Page::Amp => match self.amp.event(e, &mut self.controls, self.offers) {
                    Some(Change::Levels) => self.levels_changed = true,
                    Some(Change::Width) => self.width_changed = true,
                    None => {}
                },
                // (the gate reads its settings every tick; the EQ's go to the main loop)
                Page::Tone => {
                    if self.tone_cursor.event(e, &mut self.tone) {
                        self.tone_changed = true;
                    }
                }
                Page::System => {
                    if self.system_cursor.event(e, &mut self.theme) {
                        self.theme_changed = true;
                    }
                }
                _ => {}
            }
        }
    }

    fn screen(&self) -> Screen {
        match self.nav.picking() {
            Some(_) => Screen::Switcher,
            None => Screen::Page(self.nav.page()),
        }
    }
}

static APP: Mutex<RefCell<Option<App>>> = Mutex::new(RefCell::new(None));
static UPTIME_MS: AtomicU32 = AtomicU32::new(0);

fn uptime_ms() -> u32 {
    UPTIME_MS.load(Ordering::Relaxed)
}

fn timer0_handler() {
    critical_section::with(|cs| {
        if let Some(app) = APP.borrow_ref_mut(cs).as_mut() {
            app.fast_tick();
        }
    });
}

fn with_app<R>(f: impl FnOnce(&mut App) -> R) -> R {
    critical_section::with(|cs| f(APP.borrow_ref_mut(cs).as_mut().unwrap()))
}

/// Whether `now` has reached `at` (both wrap).
fn reached(now: u32, at: u32) -> bool {
    now.wrapping_sub(at) as i32 >= 0
}

fn text<const N: usize>(s: &str) -> String<N> {
    let mut out = String::new();
    for c in s.chars() {
        if out.push(c).is_err() {
            break;
        }
    }
    out
}

/// What the engine is doing with the sound.
#[derive(Clone, Copy, PartialEq, Eq, Debug)]
enum Sound {
    /// No profile yet: the input passes straight through.
    Dry,
    /// A profile running on silence, not heard yet.
    Warming { until: u32 },
    /// Its input on, its output coming up a step a tick.
    Rising { step: i32, at: u32 },
    Playing,
}

/// The profile running.
struct Current {
    name: String<48>,
    about: String<64>,
    /// The program words holding the gains' shifts, as the engine has them.
    in_post: u64,
    out_post: u64,
    width: Width,
    channels: usize,
    has_lite: bool,
    has_full: bool,
    input_db: f64,
    output_db: f64,
    loaded: Loaded,
}

/// The engine and what it plays.
struct Player {
    engine: Engine,
    sound: Sound,
    current: Option<Current>,
    width: Width,
    levels: Levels,
    /// How long the last load took, from the click, and its steps: reading the file, finding the
    /// networks, parsing and quantising the weights, the checking build, writing the engine.
    load_ms: u32,
    steps: [u32; 6],
    /// The size of the profile playing, whole in the file buffer; None while a read has touched it.
    file: Option<usize>,
}

impl Player {
    /// Puts a prepared profile into the engine and starts it warming: silent until `advance`
    /// brings it up.
    #[inline(never)]
    fn install(&mut self, name: &str, about: &str, p: &Prepared, q: &[i32], now: u32) -> Result<(), &'static str> {
        with_app(|a| {
            a.out_base = None;
            a.out_written = None;
        });
        self.engine.enable(false);
        self.engine.bypass(false);
        // (it built once already, from the same weights: this can't fail, but if it did the
        // engine stays off, and the input passes through as with no profile)
        let loaded = match loader::write(p, q, &mut self.engine) {
            Ok(loaded) => loaded,
            Err(e) => {
                self.engine.bypass(true);
                self.current = None;
                self.sound = Sound::Dry;
                return Err(e.text());
            }
        };
        self.engine.configure(&loaded.built);
        self.engine.clear();
        self.engine.prefill();
        self.engine.set_gains(0, 0);
        self.engine.enable(true);
        self.engine.stats();
        self.sound = Sound::Warming { until: now.wrapping_add(PREWARM_MS) };
        info!("profile '{}': A2 {} ({} channels), {} segments, {} rows, in {} out {}", name, p.width.name(),
              p.channels(), loaded.built.n_segments, loaded.built.n_rows, loaded.gain_in, loaded.gain_out);
        // (the posts as built: the words for the levels built with are the same)
        let w = level_words(&loaded.basis, &self.levels);
        let in_gain = (w.input_db * gate::DB as f64) as i32;
        with_app(|a| a.in_gain = in_gain);
        self.current = Some(Current {
            name: text(name),
            about: text(about),
            in_post: w.in_post.1,
            out_post: w.out_post.1,
            width: p.width,
            channels: p.channels(),
            has_lite: p.has_lite,
            has_full: p.has_full,
            input_db: p.input_db,
            output_db: p.output_db,
            loaded,
        });
        Ok(())
    }

    /// New levels, live: each gain's shift and word written in the order that makes the sample
    /// that sees one without the other quieter (`loader::LevelWords`). While the profile is still
    /// coming up only the shifts go in; `advance` brings the new words up.
    #[inline(never)]
    fn set_levels(&mut self, levels: Levels) {
        self.levels = levels;
        let live = self.sound == Sound::Playing;
        let Some(c) = self.current.as_mut() else { return };
        let w = level_words(&c.loaded.basis, &levels);
        let engine = &mut self.engine;
        // The output's word is the gate's to write: in one critical section with it, the word
        // as the gate scales it and the shift, in the order that keeps a half-changed sample
        // quieter, and the gate's base after.
        critical_section::with(|cs| {
            let mut app = APP.borrow_ref_mut(cs);
            let app = app.as_mut().unwrap();
            app.in_gain = (w.input_db * gate::DB as f64) as i32;
            let gated = ((w.gain_out as i64 * app.gate_gain as i64) >> 16) as i32;
            for (aux, word, (index, post), old) in [
                (AUX_GAIN_IN, w.gain_in, w.in_post, &mut c.in_post),
                (AUX_GAIN_OUT, gated, w.out_post, &mut c.out_post),
            ] {
                let grows = post_shift(post) > post_shift(*old);
                if live && !grows {
                    engine.write_aux(aux, word);
                }
                if post != *old {
                    engine.write_program(index, post);
                    *old = post;
                }
                if live && grows {
                    engine.write_aux(aux, word);
                }
            }
            if live {
                app.out_base = Some(w.gain_out);
                app.out_written = Some(gated);
            }
        });
        c.loaded.gain_in = w.gain_in;
        c.loaded.gain_out = w.gain_out;
        c.input_db = w.input_db;
        c.output_db = w.output_db;
    }

    /// Prewarm, then the input on and the output up.
    fn advance(&mut self, now: u32) {
        let Some(c) = self.current.as_ref() else { return };
        let (gain_in, gain_out) = (c.loaded.gain_in, c.loaded.gain_out);
        match self.sound {
            Sound::Warming { until } if reached(now, until) => {
                self.engine.write_aux(AUX_GAIN_IN, gain_in);
                with_app(|a| a.out_base = Some(0));
                self.sound = Sound::Rising { step: 1, at: now };
            }
            Sound::Rising { step, at } if now.wrapping_sub(at) >= RAMP_STEP_MS => {
                self.engine.write_aux(AUX_GAIN_IN, gain_in);
                with_app(|a| a.out_base = Some(gain_out * step / RAMP_STEPS));
                self.sound = if step == RAMP_STEPS { Sound::Playing } else { Sound::Rising { step: step + 1, at: now } };
            }
            _ => {}
        }
    }
}

/// Work the browser asked for that blocks the main loop, done once the screen has said so.
#[derive(Clone, Copy, PartialEq, Eq, Debug)]
enum Job {
    /// List the folder it is on (reading each profile's start).
    List,
    /// Load the profile at this index of the listing.
    Load(usize),
    /// Load the profile playing again (another width).
    Reload,
}

/// What the browser shows of the drive, and the work it has asked for.
struct Shelf {
    entries: &'static mut [Entry],
    /// What each profile in `entries` is (same index).
    infos: &'static mut [Info],
    rows: &'static mut [Row],
    order: &'static mut [u16],
    count: usize,
    n_rows: usize,
    path: DrivePath,
    note: String<48>,
    note_color: HI8,
    job: Option<Job>,
    announced: bool,
    /// The last listing: how long, and how many files it looked at and left out.
    list_ms: u32,
    looked: u32,
    left_out: u32,
}

impl Shelf {
    fn new() -> Shelf {
        let entries = unsafe { core::slice::from_raw_parts_mut(ENTRIES_ADDR as *mut Entry, MAX_ENTRIES) };
        for e in entries.iter_mut() {
            *e = Entry::EMPTY;
        }
        let infos = unsafe {
            let p = INFOS_ADDR as *mut Info;
            for i in 0..MAX_ENTRIES {
                p.add(i).write(Info::EMPTY);
            }
            core::slice::from_raw_parts_mut(p, MAX_ENTRIES)
        };
        let rows = unsafe { core::slice::from_raw_parts_mut(ROWS_ADDR as *mut Row, MAX_ROWS) };
        rows.fill(Row::Up);
        let order = unsafe { core::slice::from_raw_parts_mut(ORDER_ADDR as *mut u16, MAX_ENTRIES) };
        order.fill(0);
        Shelf { entries, infos, rows, order, count: 0, n_rows: 0, path: DrivePath::default(), note: String::new(),
                note_color: theme::TEXT, job: None, announced: false, list_ms: 0, looked: 0, left_out: 0 }
    }

    /// Asks for `job`, saying so on the screen first.
    fn ask(&mut self, job: Job, note: &str) {
        self.set_note(note, theme::TEXT);
        self.job = Some(job);
        self.announced = false;
    }

    fn set_note(&mut self, s: &str, color: HI8) {
        self.note = text(s);
        self.note_color = color;
    }

    /// Lists the folder it is on, the highlight at the top: folders, and the `.nam` files whose
    /// start says they are A2 (or doesn't say), sorted by tone and title.
    #[inline(never)]
    fn relist(&mut self, drive: &mut Drive) {
        let started = uptime_ms();
        let head = unsafe { core::slice::from_raw_parts_mut(HEAD_ADDR as *mut u8, HEAD_BYTES) };
        let infos = &mut *self.infos;
        let (mut looked, mut left_out) = (0u32, 0u32);
        let listed = drive.list_with(self.path.as_str(), self.entries, head, |i, e, bytes, whole| {
            looked += 1;
            let s = namfile::summarise(bytes, whole);
            if let Verdict::NotA2(_) = s.verdict {
                left_out += 1;
                return false;
            }
            infos[i] = Info::new(e.name(), &s);
            true
        });
        self.count = match listed {
            Ok(n) => n,
            Err(e) => {
                warn!("drive: {:?} listing '{}'", e, self.path.as_str());
                self.set_note(e.text(), theme::WARN);
                0
            }
        };
        self.n_rows = arrange(&self.entries[..self.count], &self.infos[..self.count], &mut self.order[..self.count],
                              self.rows);
        self.list_ms = uptime_ms().wrapping_sub(started);
        (self.looked, self.left_out) = (looked, left_out);
        info!("drive: '{}' lists {} ({} files looked at, {} not A2) in {} ms", self.path.as_str(), self.count,
              looked, left_out, self.list_ms);
        let rows = selectable(&self.rows[..self.n_rows]);
        with_app(|app| app.cursor.reset(rows));
    }

    /// Starts in the drive's NAM folder, if it has one.
    #[inline(never)]
    fn go_home(&mut self, drive: &mut Drive) {
        self.path.clear();
        if let Ok(e) = drive.find(HOME_FOLDER) {
            if e.is_dir {
                self.path.enter(e.short(), e.name());
            }
        }
    }

    fn forget(&mut self) {
        self.count = 0;
        self.n_rows = 0;
        self.path.clear();
        self.note.clear();
        self.job = None;
        with_app(|app| app.cursor.reset(0));
    }

    /// The cursor's row (`at` counts only the rows it can be on) opened.
    fn open(&mut self, at: usize) {
        if self.job.is_some() {
            return;
        }
        let Some(r) = row_of(&self.rows[..self.n_rows], at) else { return };
        self.note.clear();
        match self.rows[r] {
            Row::Up => {
                self.path.up();
                self.ask(Job::List, "READING THE FOLDER");
            }
            Row::Folder(i) => {
                let e = self.entries[i as usize];
                if self.path.enter(e.short(), e.name()) {
                    self.ask(Job::List, "READING THE FOLDER");
                } else {
                    self.set_note("FOLDERS TOO DEEP", theme::WARN);
                }
            }
            Row::Profile(i) => {
                let mut s: String<48> = String::new();
                write!(s, "LOADING {}", self.infos[i as usize].title).ok();
                self.ask(Job::Load(i as usize), s.as_str());
            }
            Row::Heading(_) => {}
        }
    }
}

/// Reads and prepares the profile on `row`, and if it can run, puts it in the engine. (Out of
/// line, as the other big steps are: the stack is the CPU's 16 KB, and a frame holding all of
/// them at once would leave too little for the file system under it.)
#[inline(never)]
fn load(drive: &mut Drive, shelf: &mut Shelf, player: &mut Player, index: usize) -> Result<(), &'static str> {
    let e = shelf.entries[index];
    let path = shelf.path.of(e.short()).ok_or("PATH TOO LONG")?;
    let started = uptime_ms();
    let to = unsafe { DmaBuf::from_raw_parts(FILE_ADDR as *mut u8, READ_BYTES) };
    player.file = None;
    let size = drive.read_file(path.as_str(), to).map_err(|e| e.text())?;
    let bytes = unsafe { core::slice::from_raw_parts(FILE_ADDR as *const u8, size) };
    player.steps[0] = uptime_ms().wrapping_sub(started);
    let info = &shelf.infos[index];
    prepare_and_install(player, bytes, info.title.as_str(), info.detail.as_str())?;
    player.file = Some(size);
    info!("load: {} bytes, steps {:?} ms", size, player.steps);
    Ok(())
}

/// The loader's two steps from the file's bytes, timed into `player.steps[1..]`.
fn prepare_and_install(player: &mut Player, bytes: &[u8], name: &str, about: &str) -> Result<(), &'static str> {
    let q = unsafe { core::slice::from_raw_parts_mut(WEIGHTS_ADDR as *mut i32, MAX_WEIGHTS) };
    let values = unsafe { core::slice::from_raw_parts_mut(VALUES_ADDR as *mut f64, MAX_WEIGHTS) };
    let mut at = uptime_ms();
    let mut steps = [0u32; 4];
    let mut k = 0;
    let p = loader::prepare(bytes, player.width, &player.levels, RINGS_BASE_WORDS, q, values, &mut |_| {
        let now = uptime_ms();
        if k < steps.len() {
            steps[k] = now.wrapping_sub(at);
            k += 1;
        }
        at = now;
    });
    player.steps[1..5].copy_from_slice(&steps);
    let p = p.map_err(|e| e.text())?;
    let written = uptime_ms();
    player.install(name, about, &p, q, written)?;
    player.steps[5] = uptime_ms().wrapping_sub(written);
    Ok(())
}

/// The profile playing again, at the width now asked for, from the file buffer (no drive needed).
#[inline(never)]
fn reload(player: &mut Player) -> Result<(), &'static str> {
    let size = player.file.ok_or("LOAD THE PROFILE AGAIN")?;
    let (name, about) = match &player.current {
        Some(c) => (c.name.clone(), c.about.clone()),
        None => return Ok(()),
    };
    let bytes = unsafe { core::slice::from_raw_parts(FILE_ADDR as *const u8, size) };
    player.steps[0] = 0;
    prepare_and_install(player, bytes, name.as_str(), about.as_str())
}

/// What the System screen shows, refreshed every `FIGURES_MS`.
#[derive(Default)]
struct Figures {
    rows: [String<48>; 8],
}

impl Figures {
    #[inline(never)]
    fn update(&mut self, player: &mut Player, drive: &Drive, shelf: &Shelf, peaks: (u16, u16)) {
        let stats = player.engine.stats();
        let status = player.engine.status();
        let (in_peak, out_peak) = peaks;
        for r in self.rows.iter_mut() {
            r.clear();
        }
        write!(self.rows[0], "ENGINE {} OF {} CLOCKS", stats.clocks_max, SAMPLE_CLOCKS).ok();
        write!(self.rows[1], "OVERRUNS {}  LATE {}", stats.overruns, if status.late { "YES" } else { "NO" }).ok();
        write!(self.rows[2], "PEAKS IN {} OUT {}", in_peak, out_peak).ok();
        write!(self.rows[3], "STACK FREE {} BYTES", tiliqua_fw::stack::free()).ok();
        let d = drive.state.text();
        write!(self.rows[4], "DRIVE {}", if d.is_empty() { "READY" } else { d }).ok();
        write!(self.rows[5], "LIST {} MS ({} LOOKED AT, {} NOT A2)", shelf.list_ms, shelf.looked, shelf.left_out).ok();
        let s = player.steps;
        write!(self.rows[6], "LOAD {} MS: READ {} SCAN {} PARSE {} QUANT {} CHECK {} WRITE {}", player.load_ms,
               s[0], s[1], s[2], s[3], s[4], s[5]).ok();
        write!(self.rows[7], "BUILD {}", UI_TAG).ok();
    }
}

struct Booted {
    timer: Timer0,
    display: DMAFramebuffer0,
    fill: Fill,
    fb_words: usize,
    engine: Engine,
}

#[entry]
fn main() -> ! {
    tiliqua_fw::stack::paint();
    let booted = boot();
    run(booted)
}

#[inline(never)]
fn boot() -> Booted {
    let peripherals = pac::Peripherals::take().unwrap();

    let serial = Serial0::new(peripherals.UART0);
    tiliqua_fw::handlers::logger_init(serial);
    unsafe { log::set_max_level_racy(log::LevelFilter::Info) };
    info!("boot: NAM {} at {} Hz", UI_TAG, AUDIO_FS);

    let sysclk = pac::clock::sysclk();
    let timer = Timer0::new(peripherals.TIMER0, sysclk);

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
    info!("boot: display {} x {}", display.size().width, display.size().height);

    theme::write_palette(&mut display, 0);
    clear_framebuffer(&mut display, &mut fill, fb_words);
    let scratch = PSRAM_BASE + PSRAM_UI_SCRATCH;
    let glyph_sheet = Glyphs::new(unsafe { &mut *(scratch as *mut [u8; SHEET_BYTES]) });
    if !glyph_sheet.upload(&mut display) {
        warn!("boot: font sheet too large for the blitter");
    }
    info!("boot: screen ready");

    let mut i2cdev1 = I2c1::new(peripherals.I2C1);
    let mut pmod = EurorackPmod0::new(peripherals.PMOD0_PERIPH);
    calibration::CalibrationConstants::load_or_default(&mut i2cdev1, &mut pmod);
    info!("boot: codec calibration loaded");

    let mut engine = Engine::new(peripherals.NAM);
    engine.enable(false);
    engine.bypass(true);
    let app = App {
        encoder: Encoder0::new(peripherals.ENCODER0),
        input: Input::default(),
        nav: Nav::default(),
        cursor: BrowserCursor::default(),
        action: None,
        amp: AmpCursor::default(),
        controls: Controls::default(),
        offers: Offers::default(),
        levels_changed: false,
        width_changed: false,
        tone_cursor: ToneCursor::default(),
        tone: ToneControls::default(),
        gate: Gate::default(),
        out_base: None,
        out_written: None,
        gate_gain: 65536,
        in_gain: 0,
        peaks: (0, 0),
        ticks: 0,
        system_cursor: SystemCursor::default(),
        theme: 0,
        theme_changed: false,
        tone_changed: false,
    };
    critical_section::with(|cs| APP.borrow(cs).replace(Some(app)));
    Booted { timer, display, fill, fb_words, engine }
}

#[inline(never)]
fn run(booted: Booted) -> ! {
    let Booted { mut timer, mut display, mut fill, fb_words, engine } = booted;
    tiliqua_fw::stack::paint();
    handler!(timer0 = || timer0_handler());

    irq::scope(|sc| {
        sc.register(handlers::Interrupt::TIMER0, timer0);
        // (the HAL's tick is in whole milliseconds: this is its setup with the gate's period)
        {
            use tiliqua_hal::timer::{Event as TimerEvent, Mode};
            timer.disable();
            timer.listen(TimerEvent::TimeOut);
            timer.set_mode(Mode::Periodic);
            timer.set_timeout(core::time::Duration::from_micros(gate::TICK_US as u64));
            timer.enable();
            unsafe {
                riscv::register::mie::set_mext();
                riscv::interrupt::enable();
            }
        }

        let size = display.size();
        let (cx, cy) = (size.width as i32 / 2, size.height as i32 / 2);
        let lines: &'static mut Lines<N_LINES> = unsafe { Lines::place(LINES_ADDR) };
        let mut drive = Drive::new();
        let mut shelf = Shelf::new();
        let mut player = Player { engine, sound: Sound::Dry, current: None, width: Width::Full,
                                  levels: Levels::default(), load_ms: 0, steps: [0; 6], file: None };
        let mut arcs = Arcs::default();
        let mut switch_lit: Option<Page> = None;
        let thresholds = meter_thresholds();
        let (mut meter_in, mut meter_out) = (Meter::default(), Meter::default());
        let mut peaks = (0u16, 0u16);
        let mut figures = Figures::default();
        // (the gateware starts flat with the DC blocker; the settings are written all the same)
        player.engine.write_tone(&tone_sections(&ToneControls::default()));
        let mut shown: Option<Screen> = None;
        let (mut last_draw, mut last_figures, mut last_log) = (0u32, 0u32, 0u32);
        let mut force = true;

        loop {
            let now = uptime_ms();
            match drive.poll(now) {
                Some(DriveEvent::Mounted) => {
                    shelf.go_home(&mut drive);
                    shelf.ask(Job::List, "READING THE DRIVE");
                    if player.current.is_none() {
                        with_app(|app| app.nav.go(Page::Browser));
                    }
                    force = true;
                }
                Some(DriveEvent::Gone) => {
                    shelf.forget();
                    force = true;
                }
                None => {}
            }

            let (screen, cursor, action, amp, controls, levels_changed, width_changed) = with_app(|app| {
                let flags = (app.levels_changed, app.width_changed);
                app.levels_changed = false;
                app.width_changed = false;
                (app.screen(), app.cursor, app.action.take(), app.amp, app.controls, flags.0, flags.1)
            });
            let (theme_now, theme_changed, tone_now, tone_changed) = with_app(|app| {
                let flags = (app.theme_changed, app.tone_changed);
                app.theme_changed = false;
                app.tone_changed = false;
                (app.theme, flags.0, app.tone, flags.1)
            });
            if theme_changed {
                theme::write_palette(&mut display, theme_now);
                shown = None;
                force = true;
            }
            if tone_changed {
                player.engine.write_tone(&tone_sections(&tone_now));
            }
            if let Some(BrowserAction::Open(at)) = action {
                shelf.open(at);
                force = true;
            }
            player.width = controls.width;
            if levels_changed {
                player.set_levels(controls.levels());
                force = true;
            }
            if width_changed && player.current.is_some() && shelf.job.is_none() {
                shelf.ask(Job::Reload, "LOADING THE OTHER NETWORK");
                force = true;
            }

            // Work the screen has announced: blocks a second or so, the controls running.
            if let (Some(job), true) = (shelf.job, shelf.announced) {
                shelf.job = None;
                match job {
                    Job::List => {
                        shelf.note.clear();
                        shelf.relist(&mut drive);
                    }
                    Job::Load(_) | Job::Reload => {
                        let started = uptime_ms();
                        let done = match job {
                            Job::Load(index) => load(&mut drive, &mut shelf, &mut player, index),
                            _ => reload(&mut player),
                        };
                        match done {
                            Ok(()) => shelf.set_note("LOADED", theme::GOOD),
                            Err(why) => {
                                warn!("load: {}", why);
                                shelf.set_note(why, theme::WARN);
                            }
                        }
                        player.load_ms = uptime_ms().wrapping_sub(started);
                        let offers = player.current.as_ref()
                            .map_or(Offers::default(), |c| Offers { lite: c.has_lite, full: c.has_full });
                        with_app(|app| app.offers = offers);
                    }
                }
                force = true;
            }
            player.advance(now);

            if now.wrapping_sub(last_figures) >= FIGURES_MS {
                last_figures = now;
                figures.update(&mut player, &drive, &shelf, peaks);
                force = true;
            }

            if force || now.wrapping_sub(last_draw) >= DRAW_MS {
                last_draw = now;
                force = false;
                // The meters: the peaks since the last look (a read clears them).
                peaks = with_app(|a| core::mem::take(&mut a.peaks));
                meter_in.update(peaks.0, &thresholds);
                meter_out.update(peaks.1, &thresholds);
                if shown != Some(screen) {
                    clear_framebuffer(&mut display, &mut fill, fb_words);
                    lines.forget();
                    arcs.forget();
                    switch_lit = None;
                    ui::rim(&mut display, cx, cy, theme_now, match screen {
                        Screen::Page(p) => Some(p),
                        Screen::Switcher => None,
                    });
                    shown = Some(screen);
                }
                let amp_state = AmpState { cursor: amp, controls, meter_in, meter_out };
                draw(&mut display, lines, &mut arcs, &mut switch_lit, cx, cy, screen, cursor, &amp_state, &shelf, &player,
                     &drive, &figures);
                if shelf.job.is_some() {
                    shelf.announced = true;
                }
            }

            if now.wrapping_sub(last_log) >= LOG_MS {
                last_log = now;
                info!("up {} s, stack free {} bytes", now / 1000, tiliqua_fw::stack::free());
            }
        }
    })
}

/// The Amp screen's state, as the main loop has it this time round.
struct AmpState {
    cursor: AmpCursor,
    controls: Controls,
    meter_in: Meter,
    meter_out: Meter,
}

#[allow(clippy::too_many_arguments)]
#[inline(never)]
fn draw(d: &mut DMAFramebuffer0, lines: &mut Lines<N_LINES>, arcs: &mut Arcs, switch_lit: &mut Option<Page>,
        cx: i32, cy: i32, screen: Screen, cursor: BrowserCursor, amp: &AmpState, shelf: &Shelf, player: &Player,
        drive: &Drive, figures: &Figures) {
    match screen {
        Screen::Switcher => {
            let picked = with_app(|app| app.nav.picking()).unwrap_or(Page::Amp);
            let t = with_app(|app| app.theme);
            ui::switcher(d, lines, switch_lit, cx, cy, picked, t);
        }
        Screen::Page(Page::Amp) => {
            let mut detail: String<48> = String::new();
            let mut levels: String<48> = String::new();
            let about = player.current.as_ref().map_or("", |c| c.about.as_str());
            let name = match &player.current {
                Some(c) => {
                    write!(detail, "A2 {}, {} CHANNELS", c.width.name(), c.channels).ok();
                    if c.has_lite && c.has_full {
                        detail.push_str("  (LITE AND FULL)").ok();
                    }
                    write!(levels, "IN {:+.1} DB   OUT {:+.1} DB", c.input_db, c.output_db).ok();
                    c.name.as_str()
                }
                None => "NO PROFILE",
            };
            let loading = matches!(shelf.job, Some(Job::Load(_) | Job::Reload));
            let (status, color) = match (player.sound, loading) {
                (_, true) => ("LOADING", theme::TEXT),
                (Sound::Dry, _) if !drive.is_ready() => (drive.state.text(), theme::TEXT),
                (Sound::Dry, _) => ("PICK ONE ON THE PROFILES SCREEN", theme::DIM),
                (Sound::Warming { .. }, _) => ("WARMING UP", theme::TEXT),
                (Sound::Rising { .. } | Sound::Playing, _) if player.engine.status().late => ("ENGINE LATE", theme::WARN),
                (Sound::Rising { .. } | Sound::Playing, _) => ("PLAYING", theme::GOOD),
            };
            // The settings' values; the network as it runs when the profile has only one.
            let offers = player.current.as_ref().map_or(Offers::default(), |c| Offers { lite: c.has_lite, full: c.has_full });
            let mut values: [String<16>; Setting::ALL.len()] =
                core::array::from_fn(|i| amp.controls.text(Setting::ALL[i], offers));
            match &player.current {
                Some(c) if !(c.has_lite && c.has_full) => {
                    values[4].clear();
                    write!(values[4], "{} ONLY", c.width.name()).ok();
                }
                None => {
                    values[4].clear();
                    values[4].push_str("-").ok();
                }
                _ => {}
            }
            ui::amp(d, lines, arcs, cx, cy, &AmpView {
                name, detail: detail.as_str(), about, values: &values, cursor: amp.cursor, status, status_color: color,
                levels: levels.as_str(), meter_in: amp.meter_in, meter_out: amp.meter_out,
            });
        }
        Screen::Page(Page::Browser) => {
            let mut path: String<48> = String::new();
            path.push_str(shelf.path.shown(path.capacity() - 1)).ok();
            ui::browser(d, lines, cx, cy, &BrowserView {
                drive: drive.state.text(),
                path: path.as_str(),
                rows: &shelf.rows[..shelf.n_rows],
                entries: &shelf.entries[..shelf.count],
                infos: &shelf.infos[..shelf.count],
                at: cursor.at,
                note: shelf.note.as_str(),
                note_color: shelf.note_color,
            });
        }
        Screen::Page(Page::System) => {
            let rows: [&str; 8] = core::array::from_fn(|i| figures.rows[i].as_str());
            let (t, editing) = with_app(|app| (app.theme, app.system_cursor.editing));
            ui::system(d, lines, cx, cy, THEMES[t], editing, &rows);
        }
        Screen::Page(Page::Tone) => {
            let (cursor, tone, level, reduction) =
                with_app(|a| (a.tone_cursor, a.tone, a.gate.level(a.in_gain), a.gate.reduction()));
            let values: [String<16>; ToneSetting::ALL.len()] = core::array::from_fn(|i| tone.text(ToneSetting::ALL[i]));
            let playing = player.current.is_some();
            ui::tone(d, lines, arcs, cx, cy, &ToneView { values: &values, cursor, gate: tone.gate, playing,
                                                         level, reduction, threshold: tone.threshold_db });
        }
        Screen::Page(p) => ui::text_page(d, lines, cx, cy, p.name(), &["IN A LATER PHASE"]),
    }
}
