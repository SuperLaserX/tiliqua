//! The round screen: each screen's own layout (`fairwave_cpu::layout`), and the screen switcher.
//!
//! Drawn incrementally and never faded: the framebuffer keeps what was drawn, and only what changed
//! is erased and redrawn, so the plotting traffic on the shared PSRAM stays small. Changing screen
//! clears everything and starts again: `enter_*` places what a screen shows and draws what doesn't
//! change, `draw_*` brings the rest up to date.

use heapless::String;
use tiliqua_hal::embedded_graphics::prelude::*;
use tiliqua_lib::color::HI8;

use fairwave_cpu::browser::{BrowserCursor, PreviewRow};
use fairwave_cpu::cross::{self, Picture};
use fairwave_cpu::curve::{self, Polyline};
use fairwave_cpu::disk::Entry;
use fairwave_cpu::geometry::{polar, Walk};
use fairwave_cpu::layout::*;
use fairwave_cpu::modulation::{Dest, Envelope, Lfo, Slot, Source, N_ENVELOPES, N_SLOTS};
use fairwave_cpu::nav::{Nav, Page};
use fairwave_cpu::pages::{self, CrossRow, EnvRow, LfoRow, MixRow, ModCursor, PatchAction, PatchCursor, RouteCol, WaveRow,
                          TAB_NAMES};
use fairwave_cpu::patch::{grain_name, Cross, Cursor, Layer, Patch, Row, N_LAYERS};
use fairwave_cpu::presets;
use fairwave_cpu::store::N_PATCHES;
use fairwave_cpu::table::Table;
use fairwave_cpu::text;
use fairwave_cpu::wave::{value_on, Line, Marks, Scan, Surface, POINTS, TRACE_CHOICES, YS};

use crate::engine::Monitor;
use crate::glyphs::{self, Face};
use crate::pac;
use crate::pac::constants::*;
use crate::theme;

const MOVE_HINT: &str = "turn: move   click: edit   hold: screens";
/// Where in the UI scratch the wave view keeps its heights. (The font sheet is at the start.)
const WAVE_SCRATCH: usize = 0x80000;
/// The wave view's traces drawn at a time, so a large table doesn't hold the screen up.
const TRACES_A_DRAW: usize = 16;

/// Writes a run of PSRAM words in bursts (fairwave/fill.py).
pub struct Fill {
    regs: pac::FILL,
}

impl Fill {
    pub fn new(regs: pac::FILL) -> Self {
        Self { regs }
    }

    /// Writes `value` to `words` words from byte address `addr` in PSRAM and
    /// waits until it is done; false if it didn't finish (and was left).
    pub fn run(&mut self, addr: usize, words: usize, value: u32) -> bool {
        let base = ((addr - PSRAM_BASE) / 4) as u32;
        self.regs.base().write(|w| unsafe { w.base().bits(base) });
        self.regs.words().write(|w| unsafe { w.words().bits(words as u32) });
        self.regs.value().write(|w| unsafe { w.value().bits(value) });
        self.regs.start().write(|w| w.start().bit(true));
        // About 3 ms for the screen; give it far longer.
        for _ in 0..5_000_000u32 {
            if !self.regs.status().read().busy().bit() {
                return true;
            }
        }
        false
    }
}

/// Wait for the blitter and line plotter to have drawn what they were given.
fn plotters_idle() {
    let blit = unsafe { pac::BLIT::steal() };
    let line = unsafe { pac::LINE::steal() };
    while !blit.status().read().empty().bit() || !line.status().read().empty().bit() {}
    for _ in 0..20_000 {
        riscv::asm::nop(); // the plotter's last writes
    }
}

/// Blank the framebuffer with the fill engine (a few ms; the CPU took 60).
///
/// The plotter writes through a small cache, whose lines can outlive the fill
/// and be written back over it: 16 pixels of the old screen at a time would come
/// back. So first a pixel in each of 16 consecutive cache lines along the
/// top-left corner's edge (off the round screen) moves every cache line there:
/// whatever is written back after the fill lands where it can't be seen.
pub fn clear_framebuffer<D: DrawTarget<Color = HI8>>(d: &mut D, fill: &mut Fill, words: usize) {
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

/// What the Patches screen needs to know.
#[derive(Clone)]
pub struct PatchesView {
    /// Whether there is anywhere to keep patches.
    pub available: bool,
    pub used: [bool; N_PATCHES],
    /// The patch last loaded or saved (from `N_PATCHES` up, the factory bank's), and whether
    /// anything has changed since.
    pub current: Option<usize>,
    pub edited: bool,
    /// What just happened.
    pub note: String<24>,
}

/// Reads a table's samples.
fn reader(table: &Table) -> impl Fn(u32, usize) -> i16 {
    let base = PSRAM_BASE + table.offset;
    let frame_log2 = table.frame_log2;
    move |frame, index| {
        let at = base + (((frame as usize) << frame_log2) + index) * 2;
        unsafe { (at as *const i16).read_volatile() }
    }
}

/// What the Browser needs to know.
pub struct BrowserView {
    pub cursor: BrowserCursor,
    /// What the highlighted row can see: the directory as listed.
    pub entries: &'static [Entry],
    /// Empty when the drive is ready to browse; otherwise what to tell the user.
    pub drive: &'static str,
    pub path: String<40>,
    /// The highlighted file's shape, or the preview's.
    pub detail: String<40>,
    /// What just happened.
    pub note: String<40>,
    /// A preview's table.
    pub preview_name: String<11>,
}

/// What the screen should show.
pub struct View {
    pub nav: Nav,
    pub patch: Patch,
    pub monitor: Monitor,
    pub cursor: Cursor,
    pub mod_cursor: ModCursor,
    pub route_cursor: pages::Cursor,
    pub mix_cursor: pages::Cursor,
    pub patch_cursor: PatchCursor,
    pub patches: PatchesView,
    pub wave_cursor: pages::Cursor,
    /// Which of `TRACE_CHOICES` the wave view draws.
    pub wave_traces: usize,
    /// The oscillator it shows, that oscillator's table, and where it is reading now.
    pub wave_layer: usize,
    pub wave_table: Table,
    pub wave_line: Line,
    pub cross_cursor: pages::Cursor,
    /// What each oscillator plays, and where it is reading.
    pub layer_tables: [Table; N_LAYERS],
    pub lines: [Line; N_LAYERS],
    pub browser: BrowserView,
    /// The tables' names, by index.
    pub table_names: [String<11>; crate::tables::MAX_TABLES],
    pub tables: [Table; crate::tables::MAX_TABLES],
    pub status: String<48>,
}

/// A line of text that remembers what it drew, so a change can erase it.
struct Label<const N: usize> {
    face: Face,
    spot: Spot,
    text: String<N>,
    color: HI8,
}

impl<const N: usize> Label<N> {
    fn new() -> Self {
        Self { face: Face::Text, spot: Spot::left(0, 0), text: String::new(), color: HI8::BLACK }
    }

    /// Where it goes on a screen that has just been cleared.
    fn place(&mut self, face: Face, spot: Spot) {
        self.face = face;
        self.spot = spot;
    }

    fn origin(&self, cx: i32, cy: i32, chars: usize) -> (i32, i32) {
        let r = self.spot.rect(self.face.font(), chars);
        (cx + r.x, cy + r.y)
    }

    /// Show `text`; only what changed touches the screen.
    fn set<D: DrawTarget<Color = HI8>>(&mut self, d: &mut D, cx: i32, cy: i32, text: &str, color: HI8) {
        let same_text = self.text.as_str() == text;
        if same_text && self.color == color {
            return;
        }
        if !same_text && !self.text.is_empty() {
            let (x, y) = self.origin(cx, cy, self.text.len());
            glyphs::erase(d, self.face, x, y, self.text.len());
        }
        let (x, y) = self.origin(cx, cy, text.len());
        glyphs::draw(d, self.face, x, y, text, color);
        self.text.clear();
        self.text.push_str(text).ok();
        self.color = color;
    }

    /// The screen was cleared: nothing of this is showing.
    fn forget(&mut self) {
        self.text.clear();
        self.color = HI8::BLACK;
    }

    /// The line under this text: (x, width, y).
    fn underline(&self) -> (i32, i32, i32) {
        let r = self.spot.rect(self.face.font(), self.text.len());
        (r.x, r.w, r.y + r.h + 1)
    }
}

/// How a setting shows: whether the encoder is on it, and whether it is being edited.
fn cell_color(selected: bool, editing: bool) -> HI8 {
    match (selected, editing) {
        (true, true) => theme::NEGATIVE,
        (true, false) => theme::SELECTED,
        _ => theme::TEXT,
    }
}

/// One value of the oscillators screen.
fn cell_text(row: Row, l: &Layer, names: &[String<11>], tables: &[Table]) -> String<11> {
    let mut s: String<11> = String::new();
    match row {
        Row::Table => {
            let name = names.get(l.table as usize).map_or("?", |n| n.as_str());
            s.push_str(name).ok();
        }
        Row::Frame => {
            if let Some(t) = tables.get(l.table as usize) {
                core::fmt::write(&mut s, format_args!("{} x{}", t.frame_len(), t.frames)).ok();
            }
        }
        Row::Tune => {
            core::fmt::write(&mut s, format_args!("{:+} st", l.semitones)).ok();
        }
        Row::Fine => {
            core::fmt::write(&mut s, format_args!("{:+} ct", l.fine)).ok();
        }
        Row::Position => s = text::permille(l.position as i32),
        Row::Shift => s = text::thousandths(l.shift as i32),
        Row::Edge => {
            s.push_str(l.edge.name()).ok();
        }
        Row::Read => {
            s.push_str(l.read.name()).ok();
        }
        Row::Grain => {
            s.push_str(grain_name(l.grain)).ok();
        }
        Row::Level => {
            core::fmt::write(&mut s, format_args!("{}%", l.level)).ok();
        }
    }
    s
}

/// An arc gauge's lit part: segments, and its colour.
#[derive(Clone, Copy, PartialEq)]
struct Bar {
    lit: (usize, usize),
    color: HI8,
}

impl Bar {
    const OFF: Bar = Bar { lit: (0, 0), color: HI8::BLACK };
}

/// A line of the patch bay: its ends, and its colour.
type BayLine = ((i32, i32), (i32, i32), HI8);

/// The line under the setting the encoder is on: (x, width, y, colour).
type Mark = Option<(i32, i32, i32, HI8)>;

// The most text and gauges any screen shows.
const MAX_NAMES: usize = 18;
const MAX_VALUES: usize = 20;
const MAX_BARS: usize = 6;

/// What is on screen.
pub struct Screen {
    cx: i32,
    cy: i32,
    /// The screen drawn, its tab, and whether it is the switcher; None: nothing yet.
    drawn: Option<(Page, usize, bool)>,
    title: Label<8>,
    page: Label<11>,
    note: Label<40>,
    heads: [Label<7>; N_LAYERS],
    names: [Label<9>; MAX_NAMES],
    values: [Label<11>; MAX_VALUES],
    bars: [Bar; MAX_BARS],
    mark: Mark,
    status: Label<48>,
    foot: Label<48>,
    tabs: [Label<11>; Page::ALL.len()],
    highlighted: Option<Page>,
    hub: Label<11>,
    help: Label<40>,
    /// The preview as drawn, so it can be erased, what it was drawn from, and its playhead.
    curve: Polyline,
    curve_env: Option<Envelope>,
    curve_lfo: Option<Lfo>,
    playhead: Option<i32>,
    /// The bay as drawn.
    bay: [Option<BayLine>; N_SLOTS],
    /// The Cross Mod screen's picture, and what it was drawn from.
    picture: Option<Picture>,
    picture_of: Option<(Cross, [Line; N_LAYERS], [Table; N_LAYERS])>,
    /// The Browser's rows, and where it is on the drive.
    rows: [Label<BROWSE_ROW_CHARS>; BROWSE_ROWS],
    path: Label<40>,
    /// The wave view: its surface, how many traces of it are drawn so far, and the read line.
    surface: Surface<'static>,
    painted: usize,
    scan: Scan,
    next_scan: Scan,
    scan_line: Option<Line>,
    marks: Marks,
}

impl Screen {
    pub fn new(width: u32, height: u32) -> Self {
        Self {
            cx: width as i32 / 2,
            cy: height as i32 / 2,
            drawn: None,
            title: Label::new(),
            page: Label::new(),
            note: Label::new(),
            heads: core::array::from_fn(|_| Label::new()),
            names: core::array::from_fn(|_| Label::new()),
            values: core::array::from_fn(|_| Label::new()),
            bars: [Bar::OFF; MAX_BARS],
            mark: None,
            status: Label::new(),
            foot: Label::new(),
            tabs: core::array::from_fn(|_| Label::new()),
            highlighted: None,
            hub: Label::new(),
            help: Label::new(),
            curve: Polyline::new(),
            curve_env: None,
            curve_lfo: None,
            playhead: None,
            bay: [None; N_SLOTS],
            picture: None,
            picture_of: None,
            rows: core::array::from_fn(|_| Label::new()),
            path: Label::new(),
            surface: Surface::new(unsafe {
                core::slice::from_raw_parts_mut((PSRAM_BASE + PSRAM_UI_SCRATCH + WAVE_SCRATCH) as *mut i16, YS)
            }),
            painted: 0,
            scan: Scan::EMPTY,
            next_scan: Scan::EMPTY,
            scan_line: None,
            marks: Marks::new(),
        }
    }

    /// The traces still to draw, if the wave view has any: for the log.
    pub fn painting(&self) -> Option<usize> {
        match self.drawn {
            Some((Page::Wave | Page::Browser, _, false)) if self.painted < self.surface.traces() => {
                Some(self.surface.traces())
            }
            _ => None,
        }
    }

    /// How many traces the wave view has.
    pub fn traces(&self) -> usize {
        self.surface.traces()
    }

    fn line<D: DrawTarget<Color = HI8>>(&self, d: &mut D, a: (i32, i32), b: (i32, i32), color: HI8) {
        d.draw_line_solid(self.cx + a.0, self.cy + a.1, self.cx + b.0, self.cy + b.1, 1, color);
    }

    /// The rim, with the arc of screen `page` on it.
    fn rim<D: DrawTarget<Color = HI8>>(&self, d: &mut D, page: Page) {
        let rim = Arc { radius: RIM_RADIUS, thick: 1, from: 0.0, to: 1.0, segments: RIM_SEGMENTS };
        self.paint(d, &rim, theme::RIM);
        let n = Page::ALL.len();
        for i in 0..n {
            let t = (i as f32 - 0.5) / n as f32;
            self.line(d, polar((RIM_RADIUS - 10) as f32, t), polar(RIM_RADIUS as f32, t), theme::DIM);
        }
        let middle = page.index() as f32 / n as f32;
        let half = 0.5 / n as f32;
        let marker = Arc {
            radius: RIM_RADIUS - 1,
            thick: 3,
            from: middle - half,
            to: middle + half,
            segments: RIM_SEGMENTS / n,
        };
        self.paint(d, &marker, theme::MARK);
    }

    /// One segment of an arc, from where the walk has reached to one step on.
    fn segment<D: DrawTarget<Color = HI8>>(&self, d: &mut D, arc: &Arc, a: &Walk, b: &Walk, color: HI8) {
        for k in 0..arc.thick {
            let r = arc.radius - k;
            self.line(d, a.at(r), b.at(r), color);
        }
    }

    /// All of an arc.
    fn paint<D: DrawTarget<Color = HI8>>(&self, d: &mut D, arc: &Arc, color: HI8) {
        let mut a = arc.walk();
        for _ in 0..arc.segments {
            let mut b = a;
            b.step();
            self.segment(d, arc, &a, &b, color);
            a = b;
        }
    }

    /// A gauge's unlit track.
    fn track<D: DrawTarget<Color = HI8>>(&self, d: &mut D, arc: &Arc) {
        self.paint(d, arc, theme::RIM);
    }

    /// Lights the segments `lit` of gauge number `bar`: only the difference is painted.
    fn set_bar<D: DrawTarget<Color = HI8>>(&mut self, d: &mut D, bar: usize, arc: &Arc, lit: (usize, usize), color: HI8) {
        let old = self.bars[bar];
        if old.lit == lit && old.color == color {
            return;
        }
        let mut a = arc.walk();
        for s in 0..arc.segments {
            let mut b = a;
            b.step();
            let was = old.lit.0 <= s && s < old.lit.1;
            let now = lit.0 <= s && s < lit.1;
            if now && (!was || old.color != color) {
                self.segment(d, arc, &a, &b, color);
            } else if was && !now {
                self.segment(d, arc, &a, &b, theme::RIM);
            }
            a = b;
        }
        self.bars[bar] = Bar { lit, color };
    }

    /// Lights a gauge from its middle to `value` of +-`full`.
    fn set_bipolar<D: DrawTarget<Color = HI8>>(&mut self, d: &mut D, bar: usize, arc: &Arc, value: i32, full: i32, color: HI8) {
        let mid = arc.segments / 2;
        let end = (mid as i32 + value.clamp(-full, full) * mid as i32 / full) as usize;
        self.set_bar(d, bar, arc, (mid.min(end), mid.max(end)), color);
    }

    /// Underlines the setting the encoder is on.
    fn set_mark<D: DrawTarget<Color = HI8>>(&mut self, d: &mut D, new: Mark) {
        if self.mark == new {
            return;
        }
        if let Some((x, w, y, _)) = self.mark {
            self.line(d, (x, y), (x + w - 1, y), HI8::BLACK);
        }
        if let Some((x, w, y, color)) = new {
            self.line(d, (x, y), (x + w - 1, y), color);
        }
        self.mark = new;
    }

    /// A setting's name, in `self.names[n]`, and value, in `self.values[i]`. Says where the mark
    /// goes if the encoder is on it.
    #[allow(clippy::too_many_arguments)]
    fn setting<D: DrawTarget<Color = HI8>>(&mut self, d: &mut D, n: usize, i: usize, name: &str, value: &str,
                                           selected: bool, editing: bool, mark: &mut Mark) {
        let (cx, cy) = (self.cx, self.cy);
        self.names[n].set(d, cx, cy, name, theme::DIM);
        let color = cell_color(selected, editing);
        self.values[i].set(d, cx, cy, value, color);
        if selected {
            let (x, w, y) = self.values[i].underline();
            *mark = Some((x, w, y, color));
        }
    }

    /// The status line and the hint, wherever a screen has them.
    fn place_footer(&mut self, status_y: i32, hint_y: i32) {
        self.status.place(Face::Small, Spot::centre(0, status_y));
        self.foot.place(Face::Small, Spot::centre(0, hint_y));
    }

    fn footer<D: DrawTarget<Color = HI8>>(&mut self, d: &mut D, view: &View, hint: &str) {
        let (cx, cy) = (self.cx, self.cy);
        self.status.set(d, cx, cy, view.status.as_str(), theme::DIM);
        self.foot.set(d, cx, cy, hint, theme::DIM);
    }

    fn fixed_text<D: DrawTarget<Color = HI8>>(&self, d: &mut D, face: Face, spot: Spot, text: &str, color: HI8) {
        let r = spot.rect(face.font(), text.len());
        glyphs::draw(d, face, self.cx + r.x, self.cy + r.y, text, color);
    }

    // ---- Oscillators ----

    fn enter_oscillators<D: DrawTarget<Color = HI8>>(&mut self, d: &mut D) {
        self.title.place(Face::Big, Spot::centre(0, OSC_BRAND_Y));
        self.page.place(Face::Big, Spot::centre(0, OSC_TITLE_Y));
        for i in 0..N_LAYERS {
            self.heads[i].place(Face::Text, osc_header(i));
        }
        for r in 0..Row::ALL.len() {
            self.names[r].place(Face::Text, osc_name(r));
            for i in 0..N_LAYERS {
                self.values[r * N_LAYERS + i].place(Face::Big, osc_value(r, i));
            }
        }
        self.place_footer(OSC_STATUS_Y, OSC_HINT_Y);
        for g in 0..OSC_GAUGES {
            for i in 0..N_LAYERS {
                self.track(d, &osc_gauge(g, i));
            }
        }
    }

    /// The oscillators' settings, either side of a column of names, with gauges at the rim.
    fn draw_oscillators<D: DrawTarget<Color = HI8>>(&mut self, d: &mut D, view: &View) {
        let (cx, cy) = (self.cx, self.cy);
        self.title.set(d, cx, cy, "FAIRWAVE", theme::TITLE);
        self.page.set(d, cx, cy, Page::Oscillators.name(), theme::TEXT);
        for (i, name) in ["OSC 1", "OSC 2"].iter().enumerate() {
            self.heads[i].set(d, cx, cy, name, theme::DIM);
        }
        let c = &view.cursor;
        let mut mark = None;
        for (r, row) in Row::ALL.iter().enumerate() {
            for i in 0..N_LAYERS {
                let value = cell_text(*row, &view.patch.layers[i], &view.table_names, &view.tables);
                self.setting(d, r, r * N_LAYERS + i, row.name(), value.as_str(), c.row == r && c.layer == i,
                             c.editing, &mut mark);
            }
        }
        self.set_mark(d, mark);
        for g in 0..OSC_GAUGES {
            let row = osc_gauge_row(g);
            for i in 0..N_LAYERS {
                let l = &view.patch.layers[i];
                let arc = osc_gauge(g, i);
                let on_it = c.current_row() == row && c.layer == i;
                let bar = g * N_LAYERS + i;
                let color = if on_it { theme::SELECTED } else { theme::POSITIVE };
                match row {
                    Row::Shift => {
                        let color = if !on_it && l.shift < 0 { theme::NEGATIVE } else { color };
                        self.set_bipolar(d, bar, &arc, l.shift as i32, 2000, color);
                    }
                    Row::Position => {
                        self.set_bar(d, bar, &arc, (0, arc.segment(l.position as i32, 1000)), color);
                    }
                    _ => self.set_bar(d, bar, &arc, (0, arc.segment(l.level as i32, 100)), color),
                }
            }
        }
        self.footer(d, view, MOVE_HINT);
    }

    // ---- Envelopes and LFOs ----

    fn enter_envelopes<D: DrawTarget<Color = HI8>>(&mut self, d: &mut D, tab: usize) {
        for t in 0..TAB_NAMES.len() {
            self.tabs[t].place(Face::Text, mod_tab(t));
        }
        if tab < N_ENVELOPES {
            for (r, row) in EnvRow::ALL.iter().enumerate() {
                self.place_cell(r, &env_cell(*row));
            }
        } else {
            for (r, row) in LfoRow::ALL.iter().enumerate() {
                self.place_cell(r, &lfo_cell(*row));
            }
        }
        self.place_footer(MOD_STATUS_Y, MOD_HINT_Y);
        self.line(d, (CURVE_X, CURVE_FLOOR_Y), (CURVE_X + CURVE_W, CURVE_FLOOR_Y), theme::RIM);
        self.track(d, &LIVE_ARC);
    }

    fn place_cell(&mut self, r: usize, cell: &Cell) {
        self.names[r].place(Face::Text, cell.name);
        self.values[r].place(if cell.big { Face::Big } else { Face::Text }, cell.value);
    }

    /// The preview: redrawn only when the shape changes.
    fn set_curve<D: DrawTarget<Color = HI8>>(&mut self, d: &mut D, new: Polyline) {
        if new == self.curve {
            return;
        }
        let (x0, y0) = (self.cx + CURVE_X, self.cy + CURVE_Y);
        let polyline = |d: &mut D, p: &Polyline, color: HI8| {
            for w in p.windows(2) {
                d.draw_line_solid(x0 + w[0].0 as i32, y0 + w[0].1 as i32, x0 + w[1].0 as i32, y0 + w[1].1 as i32,
                                  1, color);
            }
        };
        polyline(d, &self.curve, HI8::BLACK);
        polyline(d, &new, theme::POSITIVE);
        self.curve = new;
    }

    /// One position of the mark under the shape.
    fn head<D: DrawTarget<Color = HI8>>(&self, d: &mut D, x: i32, color: HI8) {
        let (x, top) = (CURVE_X + x, PLAYHEAD_Y);
        self.line(d, (x, top), (x - 3, top + PLAYHEAD_H), color);
        self.line(d, (x, top), (x + 3, top + PLAYHEAD_H), color);
    }

    /// The mark under the shape showing where it has got to.
    fn set_playhead<D: DrawTarget<Color = HI8>>(&mut self, d: &mut D, new: Option<i32>) {
        if self.playhead == new {
            return;
        }
        if let Some(x) = self.playhead {
            self.head(d, x, HI8::BLACK);
        }
        if let Some(x) = new {
            self.head(d, x, theme::SELECTED);
        }
        self.playhead = new;
    }

    /// One tab of the Envelopes screen: its shape, where it has got to, and its settings.
    fn draw_envelopes<D: DrawTarget<Color = HI8>>(&mut self, d: &mut D, view: &View, tab: usize) {
        let (cx, cy) = (self.cx, self.cy);
        let cursor = &view.mod_cursor;
        // White while the encoder is on the tabs; once one is open, it just stands out.
        for (t, name) in TAB_NAMES.iter().enumerate() {
            let color = match (t == tab, cursor.on_tab()) {
                (true, true) => theme::SELECTED,
                (true, false) => theme::TITLE,
                _ => theme::DIM,
            };
            self.tabs[t].set(d, cx, cy, name, color);
        }
        let row = cursor.row();
        let editing = cursor.editing;
        let mut mark = None;
        if cursor.on_tab() {
            let (x, w, y) = self.tabs[tab].underline();
            mark = Some((x, w, y, theme::SELECTED));
        }
        if tab < N_ENVELOPES {
            for (r, each) in EnvRow::ALL.iter().enumerate() {
                let value = pages::envelope_text(&view.patch, tab, *each);
                self.setting(d, r, r, each.name(), value.as_str(), row == Some(r), editing, &mut mark);
            }
            let e = &view.patch.envelopes[tab];
            if self.curve_env != Some(*e) {
                self.set_curve(d, curve::envelope(e, CURVE_W, CURVE_H));
                self.curve_env = Some(*e);
            }
            let x = curve::envelope_x(e, view.monitor.stages[tab], view.monitor.progress[tab], CURVE_W);
            self.set_playhead(d, x);
            let lit = LIVE_ARC.segment(view.monitor.envelopes[tab] as i32, 20000);
            self.set_bar(d, 0, &LIVE_ARC, (0, lit), theme::POSITIVE);
        } else {
            let k = tab - N_ENVELOPES;
            for (r, each) in LfoRow::ALL.iter().enumerate() {
                let value = pages::lfo_text(&view.patch, k, *each);
                self.setting(d, r, r, each.name(), value.as_str(), row == Some(r), editing, &mut mark);
            }
            let l = &view.patch.lfos[k];
            if self.curve_lfo != Some(*l) {
                self.set_curve(d, curve::lfo(l, CURVE_W, CURVE_H));
                self.curve_lfo = Some(*l);
            }
            self.set_playhead(d, Some(curve::lfo_x(view.monitor.lfo_phase[k], CURVE_W)));
            let counts = view.monitor.lfos[k] as i32;
            if l.unipolar {
                self.set_bar(d, 0, &LIVE_ARC, (0, LIVE_ARC.segment(counts, 20000)), theme::POSITIVE);
            } else {
                let color = if counts < 0 { theme::NEGATIVE } else { theme::POSITIVE };
                self.set_bipolar(d, 0, &LIVE_ARC, counts, 20000, color);
            }
        }
        self.set_mark(d, mark);
        let hint = match cursor.at {
            None => "turn: pick   click: open   hold: screens",
            Some(_) if cursor.on_tab() => "turn: move   click: pick another",
            Some(_) => MOVE_HINT,
        };
        self.footer(d, view, hint);
    }

    // ---- Routing ----

    fn enter_routing<D: DrawTarget<Color = HI8>>(&mut self, d: &mut D) {
        self.page.place(Face::Big, Spot::centre(0, ROUTE_TITLE_Y));
        for i in 0..N_BAY_SOURCES {
            self.names[i].place(Face::Text, bay_source_label(i));
        }
        for i in 0..N_BAY_DESTS {
            self.names[N_BAY_SOURCES + i].place(Face::Text, bay_dest_label(i));
        }
        for slot in 0..N_SLOTS {
            self.values[slot].place(Face::Text, route_strip(slot));
        }
        for (col, x) in ROUTE_FIELD_X.iter().enumerate() {
            self.values[N_SLOTS + col].place(Face::Big, Spot::centre(*x, ROUTE_FIELD_Y));
            let name = ["FROM", "TO", "AMOUNT"][col];
            self.fixed_text(d, Face::Small, Spot::centre(*x, ROUTE_FIELD_NAME_Y), name, theme::DIM);
        }
        self.fixed_text(d, Face::Big, Spot::centre(ROUTE_ARROW_X, ROUTE_FIELD_Y), ">", theme::DIM);
        self.place_footer(ROUTE_STATUS_Y, ROUTE_HINT_Y);
        for i in 0..N_BAY_SOURCES {
            self.node(d, bay_source(i));
        }
        for i in 0..N_BAY_DESTS {
            self.node(d, bay_dest(i));
        }
    }

    /// A slot's line across the bay, if it has one.
    fn bay_line(slot: &Slot, selected: bool) -> Option<BayLine> {
        if slot.source == Source::None {
            return None;
        }
        let a = bay_source(slot.source as usize - 1);
        let b = bay_dest(slot.dest as usize);
        // Brighter for more, amber when it is subtracted.
        let brightness = 5 + (slot.amount.unsigned_abs() / 32).min(7) as u8;
        let hue = if slot.amount < 0 { theme::AMBER } else { theme::PHOSPHOR };
        Some((a, b, if selected { theme::SELECTED } else { theme::c(hue, brightness) }))
    }

    /// The bay's lines: all of them again when any changes, as they cross.
    fn set_bay<D: DrawTarget<Color = HI8>>(&mut self, d: &mut D, new: &[Option<BayLine>; N_SLOTS], selected: usize) {
        if self.bay == *new {
            return;
        }
        for line in self.bay.iter().flatten() {
            self.line(d, line.0, line.1, HI8::BLACK);
        }
        for line in new.iter().flatten() {
            self.line(d, line.0, line.1, line.2);
        }
        // (the one being edited on top)
        if let Some(line) = new[selected] {
            self.line(d, line.0, line.1, line.2);
        }
        // Lines end at the nodes; rubbing one out mustn't leave a gap in them.
        for i in 0..N_BAY_SOURCES {
            self.node(d, bay_source(i));
        }
        for i in 0..N_BAY_DESTS {
            self.node(d, bay_dest(i));
        }
        self.bay = *new;
    }

    fn node<D: DrawTarget<Color = HI8>>(&self, d: &mut D, (x, y): (i32, i32)) {
        for k in -1..=1 {
            self.line(d, (x - 1, y + k), (x + 1, y + k), theme::DIM);
        }
    }

    /// The Routing screen: a line for each slot, and the slot the encoder is on.
    fn draw_routing<D: DrawTarget<Color = HI8>>(&mut self, d: &mut D, view: &View) {
        let (cx, cy) = (self.cx, self.cy);
        self.page.set(d, cx, cy, Page::Routing.name(), theme::TEXT);
        let c = &view.route_cursor;
        let (slot, col) = pages::route_cell(c.at);
        let slots = &view.patch.slots;

        let lines = core::array::from_fn(|i| Self::bay_line(&slots[i], i == slot));
        self.set_bay(d, &lines, slot);

        let active = slots[slot];
        for i in 0..N_BAY_SOURCES {
            let source = Source::None.next(i as i32 + 1);
            let color = if active.source == source {
                theme::SELECTED
            } else if slots.iter().any(|s| s.source == source) {
                theme::TEXT
            } else {
                theme::DIM
            };
            self.names[i].set(d, cx, cy, source.name(), color);
        }
        for i in 0..N_BAY_DESTS {
            let dest = Dest::Pitch1.next(i as i32);
            let color = if active.source != Source::None && active.dest == dest {
                theme::SELECTED
            } else if slots.iter().any(|s| s.source != Source::None && s.dest == dest) {
                theme::TEXT
            } else {
                theme::DIM
            };
            self.names[N_BAY_SOURCES + i].set(d, cx, cy, dest.name(), color);
        }
        for i in 0..N_SLOTS {
            let mut number: String<4> = String::new();
            core::fmt::write(&mut number, format_args!("{}", i + 1)).ok();
            let color = if i == slot {
                theme::SELECTED
            } else if slots[i].source != Source::None {
                theme::TEXT
            } else {
                theme::RIM
            };
            self.values[i].set(d, cx, cy, number.as_str(), color);
        }
        let mut mark = None;
        for k in 0..RouteCol::ALL.len() {
            let value = pages::route_text(&view.patch, slot * RouteCol::ALL.len() + k);
            let color = cell_color(k == col, c.editing);
            self.values[N_SLOTS + k].set(d, cx, cy, value.as_str(), color);
            if k == col {
                let (x, w, y) = self.values[N_SLOTS + k].underline();
                mark = Some((x, w, y, color));
            }
        }
        self.set_mark(d, mark);
        self.footer(d, view, "pitch: 100% = 1 V/oct   others: 5 V = all");
    }

    // ---- Cross Mod ----

    fn enter_cross<D: DrawTarget<Color = HI8>>(&mut self, d: &mut D) {
        self.page.place(Face::Big, Spot::centre(0, CROSS_TITLE_Y));
        for (r, row) in CrossRow::ALL.iter().enumerate() {
            self.place_cell(r, &cross_cell(*row));
        }
        self.note.place(Face::Text, Spot::centre(0, CROSS_HELP_Y));
        self.path.place(Face::Text, cross_role(0));
        self.help.place(Face::Text, cross_role(1));
        self.place_footer(CROSS_STATUS_Y, CROSS_HINT_Y);
        self.track(d, &CROSS_DEPTH);
        // The zero line under each.
        let (x, y, w, h) = CROSS_RESULT;
        self.line(d, (x, y + h / 2), (x + w, y + h / 2), theme::RIM);
        for at in CROSS_SHAPE_X {
            let mid = CROSS_SHAPE_Y + CROSS_SHAPE_H / 2;
            self.line(d, (at, mid), (at + CROSS_SHAPE_W, mid), theme::RIM);
        }
    }

    /// A cycle across a box: heights in pixels from its top.
    fn trace<D: DrawTarget<Color = HI8>>(&self, d: &mut D, (x, y, w): (i32, i32, i32), ys: &[i16], color: HI8) {
        let last = ys.len() as i32 - 1;
        for k in 0..last {
            let (a, b) = (ys[k as usize] as i32, ys[k as usize + 1] as i32);
            self.line(d, (x + k * w / last, y + a), (x + (k + 1) * w / last, y + b), color);
        }
    }

    /// Brings the picture up to what the oscillators are reading, if it has changed enough to see.
    fn set_picture<D: DrawTarget<Color = HI8>>(&mut self, d: &mut D, view: &View) {
        let c = view.patch.cross;
        let (m, n) = (c.modulator as usize & 1, 1 - (c.modulator as usize & 1));
        let tables = view.layer_tables;
        let same = self.picture_of.is_some_and(|(cross, lines, shown)| {
            cross == c && shown == tables
                && !(0..N_LAYERS).any(|i| view.lines[i].moved_from(&lines[i], tables[i].frames as u32))
        });
        if same {
            return;
        }
        let read = |i: usize| {
            let table = tables[i];
            let line = view.lines[i];
            let get = reader(&table);
            move |phase: u32| value_on(&line, &table, phase, &get)
        };
        let new = cross::picture(&c, read(m), read(n), CROSS_SHAPE_H, CROSS_RESULT.3);
        let boxes = [(CROSS_SHAPE_X[0], CROSS_SHAPE_Y, CROSS_SHAPE_W), (CROSS_SHAPE_X[1], CROSS_SHAPE_Y, CROSS_SHAPE_W),
                     (CROSS_RESULT.0, CROSS_RESULT.1, CROSS_RESULT.2)];
        if let Some(old) = self.picture {
            self.trace(d, boxes[0], &old.modulator, HI8::BLACK);
            self.trace(d, boxes[1], &old.carrier, HI8::BLACK);
            self.trace(d, boxes[2], &old.result, HI8::BLACK);
        }
        self.trace(d, boxes[0], &new.modulator, theme::DIM);
        self.trace(d, boxes[1], &new.carrier, theme::DIM);
        self.trace(d, boxes[2], &new.result, theme::POSITIVE);
        self.picture = Some(new);
        self.picture_of = Some((c, view.lines, tables));
    }

    /// The Cross Mod screen: what the mode makes of a cycle, the two oscillators, and its settings.
    fn draw_cross<D: DrawTarget<Color = HI8>>(&mut self, d: &mut D, view: &View) {
        let (cx, cy) = (self.cx, self.cy);
        self.page.set(d, cx, cy, Page::Cross.name(), theme::TEXT);
        let c = &view.cross_cursor;
        let mut mark = None;
        for (r, row) in CrossRow::ALL.iter().enumerate() {
            let value = pages::cross_text(&view.patch, *row);
            self.setting(d, r, r, row.name(), value.as_str(), c.at == r, c.editing, &mut mark);
        }
        self.set_mark(d, mark);
        let cross = &view.patch.cross;
        let roles = if cross.modulator == 0 {
            ["MODULATOR OSC 1", "CARRIER OSC 2"]
        } else {
            ["MODULATOR OSC 2", "CARRIER OSC 1"]
        };
        self.path.set(d, cx, cy, roles[0], theme::DIM);
        self.help.set(d, cx, cy, roles[1], theme::DIM);
        self.note.set(d, cx, cy, pages::cross_help(cross.mode), theme::TEXT);
        let on_it = CrossRow::ALL[c.at] == CrossRow::Depth;
        let lit = CROSS_DEPTH.segment(cross.depth as i32, 1000);
        self.set_bar(d, 0, &CROSS_DEPTH, (0, lit), if on_it { theme::SELECTED } else { theme::POSITIVE });
        self.set_picture(d, view);
        self.footer(d, view, MOVE_HINT);
    }

    // ---- Mixer ----

    fn enter_mixer<D: DrawTarget<Color = HI8>>(&mut self, d: &mut D) {
        self.page.place(Face::Big, Spot::centre(0, MIX_TITLE_Y));
        for (r, row) in MixRow::ALL.iter().enumerate() {
            self.place_cell(r, &mix_cell(*row));
        }
        self.place_footer(MIX_STATUS_Y, MIX_HINT_Y);
        self.track(d, &FADER);
        for i in 0..N_LAYERS {
            self.track(d, &mix_level_gauge(i));
        }
        self.fixed_text(d, Face::Text, Spot::centre(-MIX_END_X, MIX_END_Y), "OSC 1", theme::TEXT);
        self.fixed_text(d, Face::Text, Spot::centre(MIX_END_X, MIX_END_Y), "OSC 2", theme::TEXT);
    }

    /// The Mixer screen: the crossfader and levels at the top, the outputs at the bottom.
    fn draw_mixer<D: DrawTarget<Color = HI8>>(&mut self, d: &mut D, view: &View) {
        let (cx, cy) = (self.cx, self.cy);
        self.page.set(d, cx, cy, Page::Mixer.name(), theme::TEXT);
        let c = &view.mix_cursor;
        let mut mark = None;
        for (r, row) in MixRow::ALL.iter().enumerate() {
            let value = pages::mix_text(&view.patch, *row);
            self.setting(d, r, r, row.name(), value.as_str(), c.at == r, c.editing, &mut mark);
        }
        self.set_mark(d, mark);
        // The crossfader's handle: a bright part of its track.
        let at = FADER.segment(view.patch.mixer.balance as i32, 1000);
        let handle = (at.saturating_sub(1), (at + 1).min(FADER.segments));
        let on_it = MixRow::ALL[c.at] == MixRow::Balance;
        self.set_bar(d, 0, &FADER, handle, if on_it { theme::SELECTED } else { theme::MARK });
        for i in 0..N_LAYERS {
            let arc = mix_level_gauge(i);
            let row = [MixRow::Level1, MixRow::Level2][i];
            let color = if MixRow::ALL[c.at] == row { theme::SELECTED } else { theme::POSITIVE };
            self.set_bar(d, 1 + i, &arc, (0, arc.segment(view.patch.layers[i].level as i32, 100)), color);
        }
        self.footer(d, view, MOVE_HINT);
    }

    // ---- Patches ----

    fn enter_patches(&mut self) {
        self.page.place(Face::Big, Spot::centre(0, PATCH_TITLE_Y));
        self.hub.place(Face::Big, Spot::centre(0, PATCH_NAME_Y));
        self.help.place(Face::Text, Spot::centre(0, PATCH_STATE_Y));
        self.note.place(Face::Text, Spot::centre(0, PATCH_NOTE_Y));
        for i in 0..N_PATCHES {
            self.values[i].place(Face::Big, patch_ring(i));
        }
        for a in 0..PatchAction::ALL.len() {
            self.tabs[a].place(Face::Big, patch_action(a));
        }
        self.place_footer(PATCH_STATUS_Y, PATCH_HINT_Y);
    }

    /// The Patches screen: the eight in a ring, and what to do with the one picked.
    fn draw_patches<D: DrawTarget<Color = HI8>>(&mut self, d: &mut D, view: &View) {
        let (cx, cy) = (self.cx, self.cy);
        let p = &view.patches;
        let c = &view.patch_cursor;
        let factory = c.is_factory();
        self.page.set(d, cx, cy, if factory { "FACTORY" } else { Page::Patches.name() }, theme::TEXT);
        let first = if factory { N_PATCHES } else { 0 };
        for i in 0..N_PATCHES {
            let mut number: String<4> = String::new();
            core::fmt::write(&mut number, format_args!("{}", i + 1)).ok();
            let color = if i == c.in_bank() {
                theme::SELECTED
            } else if p.current == Some(first + i) {
                theme::WARN
            } else if factory || p.used[i] {
                theme::TEXT
            } else {
                theme::RIM
            };
            self.values[i].set(d, cx, cy, number.as_str(), color);
        }
        let (x, w, y) = self.values[c.in_bank()].underline();
        self.set_mark(d, Some((x, w, y, theme::SELECTED)));

        let mut name: String<11> = String::new();
        if factory {
            name.push_str(presets::NAMES[c.in_bank()]).ok();
        } else {
            core::fmt::write(&mut name, format_args!("PATCH {}", c.patch + 1)).ok();
        }
        self.hub.set(d, cx, cy, name.as_str(), theme::TITLE);
        let here = p.current == Some(c.patch);
        let state = if here {
            if p.edited { "EDITED" } else { "CURRENT" }
        } else if factory {
            "FACTORY"
        } else if !p.available {
            "NO STORAGE"
        } else if p.used[c.patch] {
            "SAVED"
        } else {
            "EMPTY"
        };
        self.help.set(d, cx, cy, state, if here && p.edited { theme::WARN } else { theme::TEXT });

        for (a, action) in PatchAction::ALL.iter().enumerate() {
            let text = if c.action.is_some() { action.name() } else { "" };
            let color = if c.action == Some(a) { theme::SELECTED } else { theme::DIM };
            self.tabs[a].set(d, cx, cy, text, color);
        }
        self.note.set(d, cx, cy, p.note.as_str(), theme::TEXT);
        let hint = if c.action.is_some() {
            "turn: pick   click: do it"
        } else {
            "turn: pick a patch   click: what to do"
        };
        self.footer(d, view, hint);
    }

    // ---- The wave view ----

    fn enter_wave(&mut self, view: &View) {
        self.page.place(Face::Big, Spot::centre(0, WAVE_TITLE_Y));
        self.note.place(Face::Text, WAVE_INFO);
        for (r, row) in WaveRow::ALL.iter().enumerate() {
            self.place_cell(r, &wave_cell(*row));
        }
        self.place_footer(WAVE_STATUS_Y, WAVE_HINT_Y);
        self.start_surface(view);
    }

    fn start_surface(&mut self, view: &View) {
        self.surface.build(&view.wave_table, TRACE_CHOICES[view.wave_traces], &reader(&view.wave_table));
        self.painted = 0;
        self.scan_line = None;
    }

    /// The surface a few traces at a time, then the read line over it.
    fn advance_surface<D: DrawTarget<Color = HI8>>(&mut self, d: &mut D, view: &View) {
        let traces = self.surface.traces();
        if self.painted < traces {
            // From the back, so that nearer traces cross over further ones.
            for _ in 0..TRACES_A_DRAW.min(traces - self.painted) {
                let i = traces - 1 - self.painted;
                for k in 0..POINTS {
                    self.trace_segment(d, i, k);
                }
                self.painted += 1;
            }
        } else {
            self.set_scan(d, view);
        }
    }

    fn trace_segment<D: DrawTarget<Color = HI8>>(&self, d: &mut D, i: usize, k: usize) {
        let color = theme::c(theme::PHOSPHOR, self.surface.shade(i));
        self.line(d, self.surface.vertex(i, k), self.surface.vertex(i, k + 1), color);
    }

    fn draw_scan<D: DrawTarget<Color = HI8>>(&self, d: &mut D, scan: &Scan, color: HI8) {
        for (a, b) in scan.segments() {
            self.line(d, a, b, color);
        }
    }

    /// Brings the read line up to where the oscillator is reading. The new one goes down first so
    /// the line is never missing; rubbing out the old one can take bits of it, so it goes again last.
    /// What to draw again is worked out before anything is rubbed out: that takes a while, and the
    /// surface would show its holes meanwhile.
    fn set_scan<D: DrawTarget<Color = HI8>>(&mut self, d: &mut D, view: &View) {
        let line = view.wave_line;
        if self.scan_line.is_some_and(|shown| !line.moved_from(&shown, view.wave_table.frames as u32)) {
            return;
        }
        self.surface.scan(&line, &reader(&view.wave_table), &mut self.next_scan);
        self.draw_scan(d, &self.next_scan, theme::SELECTED);
        if self.scan_line.is_some() {
            self.marks.clear();
            self.surface.under(&self.scan, &mut self.marks);
            self.draw_scan(d, &self.scan, HI8::BLACK);
            for i in (0..self.surface.traces()).rev() {
                for k in self.marks.marked(i) {
                    self.trace_segment(d, i, k);
                }
            }
            self.draw_scan(d, &self.next_scan, theme::SELECTED);
        }
        core::mem::swap(&mut self.scan, &mut self.next_scan);
        self.scan_line = Some(line);
    }

    /// A table as a surface, as on the Fairlight's page D, and the line the oscillator reads over it.
    fn draw_wave<D: DrawTarget<Color = HI8>>(&mut self, d: &mut D, view: &View) {
        let (cx, cy) = (self.cx, self.cy);
        self.page.set(d, cx, cy, Page::Wave.name(), theme::TEXT);
        let layer = &view.patch.layers[view.wave_layer];
        let shape = cell_text(Row::Frame, layer, &view.table_names, &view.tables);
        self.note.set(d, cx, cy, shape.as_str(), theme::DIM);
        let c = &view.wave_cursor;
        let mut mark = None;
        for (r, row) in WaveRow::ALL.iter().enumerate() {
            let value: String<11> = match (row.row(), row) {
                (Some(osc_row), _) => cell_text(osc_row, layer, &view.table_names, &view.tables),
                (None, WaveRow::Osc) => text::number(view.wave_layer as i32 + 1),
                _ => text::number(TRACE_CHOICES[view.wave_traces] as i32),
            };
            self.setting(d, r, r, row.name(), value.as_str(), c.at == r, c.editing, &mut mark);
        }
        self.set_mark(d, mark);
        self.footer(d, view, MOVE_HINT);
        self.advance_surface(d, view);
    }

    // ---- The Browser ----

    fn enter_browser<D: DrawTarget<Color = HI8>>(&mut self, d: &mut D) {
        self.page.place(Face::Big, Spot::centre(0, BROWSE_TITLE_Y));
        self.path.place(Face::Text, Spot::centre(0, BROWSE_PATH_Y));
        self.note.place(Face::Text, Spot::centre(0, BROWSE_DETAIL_Y));
        self.help.place(Face::Text, Spot::centre(0, BROWSE_NOTE_Y));
        for (i, row) in self.rows.iter_mut().enumerate() {
            row.place(Face::Big, browse_row(i));
        }
        self.place_footer(WAVE_STATUS_Y, WAVE_HINT_Y);
        self.track(d, &BROWSE_ARC);
        // (no surface on this one: nothing to report as still being drawn)
        self.painted = usize::MAX;
    }

    /// The directory, with the highlighted row kept in the middle.
    fn draw_browser<D: DrawTarget<Color = HI8>>(&mut self, d: &mut D, view: &View) {
        let (cx, cy) = (self.cx, self.cy);
        let b = &view.browser;
        self.page.set(d, cx, cy, Page::Browser.name(), theme::TEXT);
        let mut where_: String<40> = String::new();
        if b.drive.is_empty() {
            where_.push('/').ok();
            where_.push_str(b.path.as_str()).ok();
        } else {
            where_.push_str(b.drive).ok();
        }
        self.path.set(d, cx, cy, where_.as_str(), theme::DIM);

        let c = &b.cursor;
        let top = c.top(BROWSE_ROWS);
        for i in 0..BROWSE_ROWS {
            let mut text: String<BROWSE_ROW_CHARS> = String::new();
            let mut color = theme::TEXT;
            if let Some(e) = b.entries.get(top + i) {
                if e.is_up() {
                    text.push_str(".. (UP)").ok();
                } else {
                    text.push_str(e.name()).ok();
                    if e.is_dir {
                        text.push('/').ok();
                    }
                }
                if e.is_dir {
                    color = theme::POSITIVE;
                }
                if top + i == c.at {
                    color = theme::SELECTED;
                }
            }
            self.rows[i].set(d, cx, cy, text.as_str(), color);
        }
        let count = b.entries.len();
        let lit = if count > BROWSE_ROWS {
            let s = c.at * (BROWSE_ARC.segments - 3) / (count - 1);
            (s, s + 3)
        } else {
            (0, 0)
        };
        self.set_bar(d, 0, &BROWSE_ARC, lit, theme::POSITIVE);
        self.note.set(d, cx, cy, b.detail.as_str(), theme::TEXT);
        self.help.set(d, cx, cy, b.note.as_str(), theme::WARN);
        self.footer(d, view, "turn: pick   click: open   hold: screens");
    }

    fn enter_preview(&mut self, view: &View) {
        self.page.place(Face::Big, Spot::centre(0, WAVE_TITLE_Y));
        self.note.place(Face::Text, WAVE_INFO);
        for (r, row) in PreviewRow::ALL.iter().enumerate() {
            self.place_cell(r, &preview_cell(*row));
        }
        self.place_cell(PreviewRow::ALL.len(), &preview_name());
        self.place_footer(WAVE_STATUS_Y, WAVE_HINT_Y);
        self.start_surface(view);
    }

    /// A file just loaded, playing and drawn, waiting to be kept or not.
    fn draw_preview<D: DrawTarget<Color = HI8>>(&mut self, d: &mut D, view: &View) {
        let (cx, cy) = (self.cx, self.cy);
        let b = &view.browser;
        self.page.set(d, cx, cy, "PREVIEW", theme::TEXT);
        self.note.set(d, cx, cy, b.detail.as_str(), theme::DIM);
        let layer = &view.patch.layers[view.wave_layer];
        let n = PreviewRow::ALL.len();
        self.names[n].set(d, cx, cy, "TABLE", theme::DIM);
        self.values[n].set(d, cx, cy, b.preview_name.as_str(), theme::TEXT);
        let mut mark = None;
        for (r, row) in PreviewRow::ALL.iter().enumerate() {
            let value: String<11> = match row {
                PreviewRow::Osc => text::number(view.wave_layer as i32 + 1),
                PreviewRow::Frame => cell_text(Row::Frame, layer, &view.table_names, &view.tables),
                PreviewRow::Keep | PreviewRow::Back => String::new(),
            };
            // KEEP and BACK are actions: their names are all there is, and they are what is lit.
            let (name, value): (&str, &str) = match row {
                PreviewRow::Keep | PreviewRow::Back => ("", row.name()),
                _ => (row.name(), value.as_str()),
            };
            self.setting(d, r, r, name, value, b.cursor.preview == Some(r), b.cursor.editing, &mut mark);
        }
        self.set_mark(d, mark);
        self.footer(d, view, "turn: move   click: choose");
        self.advance_surface(d, view);
    }

    // ---- The switcher ----

    fn enter_switcher(&mut self) {
        for (i, page) in Page::ALL.iter().enumerate() {
            let r = tab(*page);
            self.tabs[i].place(Face::Big, Spot::centre(r.x + r.w / 2, r.y + r.h / 2));
        }
        self.hub.place(Face::Big, Spot::centre(0, 0));
        self.help.place(Face::Small, Spot::centre(0, 26));
    }

    fn draw_switcher<D: DrawTarget<Color = HI8>>(&mut self, d: &mut D, picked: Page) {
        let (cx, cy) = (self.cx, self.cy);
        if self.highlighted != Some(picked) {
            for (i, page) in Page::ALL.iter().enumerate() {
                let color = if *page == picked { theme::SELECTED } else { theme::DIM };
                self.tabs[i].set(d, cx, cy, page.name(), color);
            }
            self.hub.set(d, cx, cy, picked.name(), theme::TITLE);
            self.help.set(d, cx, cy, "turn: pick   click: go   hold: back", theme::DIM);
            self.highlighted = Some(picked);
        }
    }

    fn forget_all(&mut self) {
        self.title.forget();
        self.page.forget();
        self.note.forget();
        self.status.forget();
        self.foot.forget();
        self.hub.forget();
        self.help.forget();
        self.highlighted = None;
        self.mark = None;
        self.curve.clear();
        self.curve_env = None;
        self.curve_lfo = None;
        self.playhead = None;
        self.bay = [None; N_SLOTS];
        self.picture = None;
        self.picture_of = None;
        self.bars = [Bar::OFF; MAX_BARS];
        for l in self.heads.iter_mut() {
            l.forget();
        }
        for l in self.names.iter_mut() {
            l.forget();
        }
        for l in self.values.iter_mut() {
            l.forget();
        }
        for l in self.tabs.iter_mut() {
            l.forget();
        }
        for l in self.rows.iter_mut() {
            l.forget();
        }
        self.path.forget();
    }

    /// Brings the screen up to `view`.
    pub fn draw<D: DrawTarget<Color = HI8>>(&mut self, d: &mut D, fill: &mut Fill, fb_words: usize,
                                            view: &View) {
        let picking = view.nav.picking();
        let page = view.nav.page();
        let tab = view.mod_cursor.tab;
        // (the tabs lay their rows out differently, so a new tab starts clean; and a new table or
        // number of traces is a new surface)
        let t = &view.wave_table;
        let previewing = view.browser.cursor.preview.is_some();
        let variant = match page {
            Page::Envelopes => tab,
            Page::Wave => (t.offset >> 8) << 12 | (t.frame_log2 as usize) << 8 | view.wave_traces,
            Page::Browser if previewing => 1 + ((t.offset >> 8) << 12 | (t.frame_log2 as usize) << 8 | view.wave_traces),
            _ => 0,
        };
        let wanted = (page, variant, picking.is_some());
        if self.drawn != Some(wanted) {
            clear_framebuffer(d, fill, fb_words);
            self.forget_all();
            self.rim(d, page);
            if picking.is_some() {
                self.enter_switcher();
            } else {
                match page {
                    Page::Oscillators => self.enter_oscillators(d),
                    Page::Envelopes => self.enter_envelopes(d, tab),
                    Page::Routing => self.enter_routing(d),
                    Page::Mixer => self.enter_mixer(d),
                    Page::Patches => self.enter_patches(),
                    Page::Wave => self.enter_wave(view),
                    Page::Cross => self.enter_cross(d),
                    Page::Browser if previewing => self.enter_preview(view),
                    Page::Browser => self.enter_browser(d),
                }
            }
            self.drawn = Some(wanted);
        }
        match picking {
            Some(picked) => self.draw_switcher(d, picked),
            None => match page {
                Page::Oscillators => self.draw_oscillators(d, view),
                Page::Envelopes => self.draw_envelopes(d, view, tab),
                Page::Routing => self.draw_routing(d, view),
                Page::Mixer => self.draw_mixer(d, view),
                Page::Patches => self.draw_patches(d, view),
                Page::Wave => self.draw_wave(d, view),
                Page::Cross => self.draw_cross(d, view),
                Page::Browser if previewing => self.draw_preview(d, view),
                Page::Browser => self.draw_browser(d, view),
            },
        }
    }
}
