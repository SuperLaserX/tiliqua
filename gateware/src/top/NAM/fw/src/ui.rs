//! The screens: the amp, with its settings and level meters, the profile browser, the engine's
//! figures, and the screen switcher round the circle. Where things go is `nam_cpu::layout`'s,
//! tested to fit; here they are drawn, each line and gauge redrawn only when it changes.

use heapless::String;
use tiliqua_hal::embedded_graphics::prelude::*;
use tiliqua_lib::color::HI8;

use nam_cpu::browser::{heading_text, row_of, top_row, Info, Row};
use nam_cpu::controls::{AmpCursor, Meter, Setting, ToneCursor, ToneSetting, METER_SEGMENTS};
use nam_cpu::disk::Entry;
use nam_cpu::layout::{self, rim_part, Arc, METER_IN, METER_OUT};
use nam_cpu::nav::Page;

use crate::glyphs::Face;
use crate::screen::{at_spot, line, paint_arc, Gauge, Lines};
use crate::theme;

pub const N_LINES: usize = 24;
/// Rows of the browser's list on screen at once.
pub const BROWSER_ROWS: usize = 13;
const ROW_PITCH: i32 = 24;
const TITLE_Y: i32 = -230;
const HINT_Y: i32 = 215;

/// What fills the screen: a page, or the switcher over it.
#[derive(Clone, Copy, PartialEq, Eq, Debug)]
pub enum Screen {
    Switcher,
    Page(Page),
}

pub struct AmpView<'a> {
    pub name: &'a str,
    /// The network: width and channels.
    pub detail: &'a str,
    /// What the profile's metadata says of it.
    pub about: &'a str,
    /// Each setting's value, in `Setting::ALL`'s order.
    pub values: &'a [String<16>; Setting::ALL.len()],
    pub cursor: AmpCursor,
    pub status: &'a str,
    pub status_color: HI8,
    pub levels: &'a str,
    pub meter_in: Meter,
    pub meter_out: Meter,
}

/// The arcs a screen draws beside its text.
#[derive(Default)]
pub struct Arcs {
    pub meter_in: Gauge,
    pub meter_out: Gauge,
}

impl Arcs {
    pub fn forget(&mut self) {
        self.meter_in.forget();
        self.meter_out.forget();
    }
}

/// The rim, dressed as theme `t` has it, with page `page`'s part of it lit (none for the
/// switcher). Drawn once after the screen clears.
pub fn rim<D: DrawTarget<Color = HI8>>(d: &mut D, cx: i32, cy: i32, t: usize, page: Option<Page>) {
    theme::bezel(d, cx, cy, t, page);
}

pub struct BrowserView<'a> {
    /// What the drive is doing, when it isn't ready to list.
    pub drive: &'a str,
    pub path: &'a str,
    pub rows: &'a [Row],
    pub entries: &'a [Entry],
    pub infos: &'a [Info],
    /// The cursor, counting only the rows it can be on.
    pub at: usize,
    pub note: &'a str,
    pub note_color: HI8,
}

/// Puts the lines from `first` on blank.
fn blank_from<D: DrawTarget<Color = HI8>>(d: &mut D, lines: &mut Lines<N_LINES>, first: usize) {
    for i in first..N_LINES {
        lines.set(d, i, None);
    }
}

fn title<D: DrawTarget<Color = HI8>>(d: &mut D, lines: &mut Lines<N_LINES>, cx: i32, cy: i32, text: &str) {
    lines.set(d, 0, line(Face::Big, cx, cy + TITLE_Y, text, theme::TITLE));
}

/// A meter's colour: hot near full scale, red while a clip is held.
fn meter_color(m: &Meter) -> HI8 {
    if m.clipped() {
        theme::WARN
    } else if m.lit + 3 >= METER_SEGMENTS {
        theme::LEVEL_HOT
    } else {
        theme::LEVEL
    }
}

fn meter<D: DrawTarget<Color = HI8>>(d: &mut D, g: &mut Gauge, cx: i32, cy: i32, arc: &Arc, m: &Meter) {
    g.set(d, cx, cy, arc, m.lit, meter_color(m), theme::PANEL);
}

pub fn amp<D: DrawTarget<Color = HI8>>(d: &mut D, lines: &mut Lines<N_LINES>, arcs: &mut Arcs, cx: i32, cy: i32,
                                       v: &AmpView) {
    lines.set(d, 0, at_spot(&layout::AMP_BRAND, cx, cy, "NAM", theme::DIM));
    lines.set(d, 1, at_spot(&layout::AMP_TITLE, cx, cy, v.name, theme::TITLE));
    lines.set(d, 2, at_spot(&layout::AMP_ABOUT, cx, cy, v.about, theme::DIM));
    lines.set(d, 3, at_spot(&layout::AMP_NETWORK, cx, cy, v.detail, theme::DIM));
    let n = Setting::ALL.len();
    for (i, s) in Setting::ALL.iter().enumerate() {
        let on = v.cursor.at == i;
        let name_color = if on { theme::TEXT } else { theme::DIM };
        lines.set(d, 4 + i, at_spot(&layout::amp_name(i), cx, cy, s.name(), name_color));
        let mut value: String<20> = String::new();
        let color = if on && v.cursor.editing {
            value.push_str("< ").ok();
            value.push_str(v.values[i].as_str()).ok();
            value.push_str(" >").ok();
            theme::EDITING
        } else {
            value.push_str(v.values[i].as_str()).ok();
            if on { theme::SELECTED } else { theme::TEXT }
        };
        lines.set(d, 4 + n + i, at_spot(&layout::amp_value(i), cx, cy, value.as_str(), color));
    }
    let after = 4 + 2 * n;
    lines.set(d, after, at_spot(&layout::AMP_STATUS, cx, cy, v.status, v.status_color));
    lines.set(d, after + 1, at_spot(&layout::AMP_LEVELS, cx, cy, v.levels, theme::DIM));
    let label = |m: &Meter| if m.clipped() { theme::WARN } else { theme::DIM };
    lines.set(d, after + 2, at_spot(&layout::meter_label(false), cx, cy, "IN", label(&v.meter_in)));
    lines.set(d, after + 3, at_spot(&layout::meter_label(true), cx, cy, "OUT", label(&v.meter_out)));
    lines.set(d, after + 4, at_spot(&layout::HINT, cx, cy, "TURN: MOVE   CLICK: EDIT   HOLD: SCREENS", theme::RIM));
    blank_from(d, lines, after + 5);
    meter(d, &mut arcs.meter_in, cx, cy, &METER_IN, &v.meter_in);
    meter(d, &mut arcs.meter_out, cx, cy, &METER_OUT, &v.meter_out);
}

/// A row of the list as shown: a folder with a slash, a profile by its title, a heading set off.
fn row_text(r: Row, v: &BrowserView) -> String<64> {
    let mut s = String::new();
    match r {
        Row::Up => {
            s.push_str("..").ok();
        }
        Row::Folder(i) => {
            s.push_str(v.entries[i as usize].name()).ok();
            s.push('/').ok();
        }
        Row::Heading(t) => {
            s.push_str("- ").ok();
            s.push_str(heading_text(t)).ok();
            s.push_str(" -").ok();
        }
        Row::Profile(i) => {
            s.push_str(v.infos[i as usize].title.as_str()).ok();
        }
    }
    s
}

pub fn browser<D: DrawTarget<Color = HI8>>(d: &mut D, lines: &mut Lines<N_LINES>, cx: i32, cy: i32,
                                           v: &BrowserView) {
    title(d, lines, cx, cy, "PROFILES");
    let mut path: String<48> = String::new();
    path.push('/').ok();
    path.push_str(v.path).ok();
    lines.set(d, 1, line(Face::Small, cx, cy - 196, path.as_str(), theme::DIM));
    let first_row = 2;
    let top_y = cy - 160;
    if !v.drive.is_empty() {
        lines.set(d, first_row, line(Face::Text, cx, cy, v.drive, theme::TEXT));
        for i in 1..BROWSER_ROWS {
            lines.set(d, first_row + i, None);
        }
    } else if v.rows.is_empty() {
        lines.set(d, first_row, line(Face::Text, cx, cy, "NO A2 PROFILES HERE", theme::DIM));
        for i in 1..BROWSER_ROWS {
            lines.set(d, first_row + i, None);
        }
    } else {
        let top = top_row(v.rows, v.at, BROWSER_ROWS);
        let hi = row_of(v.rows, v.at);
        for i in 0..BROWSER_ROWS {
            let row = top + i;
            let shown = v.rows.get(row).map(|&r| {
                let (face, color) = match r {
                    _ if Some(row) == hi => (Face::Text, theme::SELECTED),
                    Row::Heading(_) => (Face::Small, theme::DIM),
                    Row::Up | Row::Folder(_) => (Face::Text, theme::DIM),
                    Row::Profile(_) => (Face::Text, theme::TEXT),
                };
                line(face, cx, top_y + i as i32 * ROW_PITCH, row_text(r, v).as_str(), color)
            });
            lines.set(d, first_row + i, shown.flatten());
        }
    }
    let after = first_row + BROWSER_ROWS;
    // What the highlighted profile's metadata says; or that a folder has nothing to play.
    let about = match row_of(v.rows, v.at).map(|r| v.rows[r]) {
        Some(Row::Profile(i)) => v.infos[i as usize].detail.as_str(),
        _ if !v.drive.is_empty() => "",
        _ if !v.rows.iter().any(|r| matches!(r, Row::Profile(_))) && !v.rows.is_empty() => "NO A2 PROFILES IN THIS FOLDER",
        _ => "",
    };
    lines.set(d, after, line(Face::Small, cx, cy + 152, about, theme::DIM));
    lines.set(d, after + 1, line(Face::Text, cx, cy + 178, v.note, v.note_color));
    lines.set(d, after + 2, line(Face::Small, cx, cy + HINT_Y, "TURN TO PICK, CLICK TO OPEN", theme::RIM));
    blank_from(d, lines, after + 3);
}

/// A page with its title and some lines of figures or words.
pub fn text_page<D: DrawTarget<Color = HI8>>(d: &mut D, lines: &mut Lines<N_LINES>, cx: i32, cy: i32,
                                             name: &str, rows: &[&str]) {
    title(d, lines, cx, cy, name);
    let top = cy - (rows.len() as i32 - 1) * ROW_PITCH / 2;
    for (i, r) in rows.iter().enumerate().take(N_LINES - 2) {
        lines.set(d, 1 + i, line(Face::Text, cx, top + i as i32 * ROW_PITCH, r, theme::TEXT));
    }
    blank_from(d, lines, 1 + rows.len().min(N_LINES - 2));
}

/// The switcher: every page's name round the circle, where its part of the rim is; the one picked
/// highlighted, and its part of the rim lit.
pub fn switcher<D: DrawTarget<Color = HI8>>(d: &mut D, lines: &mut Lines<N_LINES>, lit: &mut Option<Page>,
                                            cx: i32, cy: i32, picked: Page, t: usize) {
    let n = Page::ALL.len();
    lines.set(d, 0, at_spot(&layout::SWITCH_TITLE, cx, cy, "SCREENS", theme::DIM));
    for (i, p) in Page::ALL.iter().enumerate() {
        let color = if *p == picked { theme::SELECTED } else { theme::DIM };
        lines.set(d, 1 + i, at_spot(&layout::switch_spot(i, n), cx, cy, p.name(), color));
    }
    let after = 1 + n;
    lines.set(d, after, at_spot(&layout::HINT, cx, cy, "TURN TO PICK, CLICK TO GO, HOLD TO STAY", theme::RIM));
    blank_from(d, lines, after + 1);
    if *lit != Some(picked) {
        if let Some(old) = *lit {
            paint_arc(d, cx, cy, &rim_part(old.index(), n), theme::ring(t));
        }
        paint_arc(d, cx, cy, &rim_part(picked.index(), n), theme::SELECTED);
        *lit = Some(picked);
    }
}

/// The Tone screen: the noise gate's settings, what it is doing, and two arcs: the input's level
/// as the gate hears it (after the input gain), and how far the gate has closed.
pub struct ToneView<'a> {
    pub values: &'a [String<16>; ToneSetting::ALL.len()],
    pub cursor: ToneCursor,
    pub gate: bool,
    pub playing: bool,
    /// The gate's level and reduction, in 1/256 dB; the threshold in dB.
    pub level: i32,
    pub reduction: i32,
    pub threshold: i32,
}

/// The level arc's span, and the reduction arc's, in dB.
const LEVEL_FLOOR_DB: i32 = -100;
const REDUCTION_FULL_DB: i32 = 60;

pub fn tone<D: DrawTarget<Color = HI8>>(d: &mut D, lines: &mut Lines<N_LINES>, arcs: &mut Arcs, cx: i32, cy: i32,
                                        v: &ToneView) {
    lines.set(d, 0, at_spot(&layout::AMP_BRAND, cx, cy, "NAM", theme::DIM));
    lines.set(d, 1, at_spot(&layout::AMP_TITLE, cx, cy, "TONE", theme::TITLE));
    lines.set(d, 2, at_spot(&layout::AMP_ABOUT, cx, cy, "THE GATE BEFORE THE EQ, THE EQ AFTER THE AMP",
                            theme::DIM));
    lines.set(d, 3, None);
    let n = ToneSetting::ALL.len();
    for (i, s) in ToneSetting::ALL.iter().enumerate() {
        let on = v.cursor.at == i;
        lines.set(d, 4 + i, at_spot(&layout::tone_name(i), cx, cy, s.name(), if on { theme::TEXT } else { theme::DIM }));
        let mut value: String<20> = String::new();
        let color = if on && v.cursor.editing {
            value.push_str("< ").ok();
            value.push_str(v.values[i].as_str()).ok();
            value.push_str(" >").ok();
            theme::EDITING
        } else {
            value.push_str(v.values[i].as_str()).ok();
            if on { theme::SELECTED } else { theme::TEXT }
        };
        lines.set(d, 4 + n + i, at_spot(&layout::tone_value(i), cx, cy, value.as_str(), color));
    }
    let after = 4 + 2 * n;
    let db = v.reduction / nam_cpu::gate::DB;
    let mut status: String<40> = String::new();
    let color = if !v.gate {
        status.push_str("GATE OFF").ok();
        theme::DIM
    } else if !v.playing {
        status.push_str("NO PROFILE PLAYING").ok();
        theme::DIM
    } else if v.reduction == 0 {
        status.push_str("GATE OPEN").ok();
        theme::GOOD
    } else if db <= -REDUCTION_FULL_DB {
        status.push_str("GATE CLOSED").ok();
        theme::WARN
    } else {
        core::fmt::write(&mut status, format_args!("GATE CLOSING, {} DB", db)).ok();
        theme::LEVEL_HOT
    };
    lines.set(d, after, at_spot(&layout::AMP_STATUS, cx, cy, status.as_str(), color));
    let mut levels: String<48> = String::new();
    core::fmt::write(&mut levels, format_args!("INPUT {} DB   THRESHOLD {} DB",
                                               (v.level / nam_cpu::gate::DB).max(-120), v.threshold)).ok();
    lines.set(d, after + 1, at_spot(&layout::AMP_LEVELS, cx, cy, levels.as_str(), theme::DIM));
    lines.set(d, after + 2, at_spot(&layout::meter_label(false), cx, cy, "IN", theme::DIM));
    lines.set(d, after + 3, at_spot(&layout::meter_label(true), cx, cy, "GATE", theme::DIM));
    lines.set(d, after + 4, at_spot(&layout::HINT, cx, cy, "TURN: MOVE   CLICK: EDIT   HOLD: SCREENS", theme::RIM));
    blank_from(d, lines, after + 5);
    let span = (-LEVEL_FLOOR_DB * nam_cpu::gate::DB) as i64;
    let level_lit = (((v.level - LEVEL_FLOOR_DB * nam_cpu::gate::DB) as i64).clamp(0, span) * METER_SEGMENTS as i64
                     / span) as usize;
    let above = v.level >= v.threshold * nam_cpu::gate::DB;
    arcs.meter_in.set(d, cx, cy, &METER_IN, level_lit, if above { theme::GOOD } else { theme::LEVEL }, theme::PANEL);
    let full = (REDUCTION_FULL_DB * nam_cpu::gate::DB) as i64;
    let closed_lit = ((-(v.reduction as i64)).clamp(0, full) * METER_SEGMENTS as i64 / full) as usize;
    arcs.meter_out.set(d, cx, cy, &METER_OUT, closed_lit, theme::WARN, theme::PANEL);
}

/// The System screen: the theme to pick, and the engine's figures.
pub fn system<D: DrawTarget<Color = HI8>>(d: &mut D, lines: &mut Lines<N_LINES>, cx: i32, cy: i32, theme_name: &str,
                                          editing: bool, figures: &[&str]) {
    lines.set(d, 0, at_spot(&layout::AMP_BRAND, cx, cy, "NAM", theme::DIM));
    lines.set(d, 1, at_spot(&layout::AMP_TITLE, cx, cy, "SYSTEM", theme::TITLE));
    lines.set(d, 2, at_spot(&layout::amp_name(0), cx, cy, "THEME", theme::TEXT));
    let mut value: String<20> = String::new();
    let color = if editing {
        value.push_str("< ").ok();
        value.push_str(theme_name).ok();
        value.push_str(" >").ok();
        theme::EDITING
    } else {
        value.push_str(theme_name).ok();
        theme::SELECTED
    };
    lines.set(d, 3, at_spot(&layout::amp_value(0), cx, cy, value.as_str(), color));
    for i in 0..layout::SYSTEM_FIGURES {
        let row = figures.get(i).map(|f| at_spot(&layout::system_figure(i), cx, cy, f, theme::DIM)).flatten();
        lines.set(d, 4 + i, row);
    }
    let after = 4 + layout::SYSTEM_FIGURES;
    lines.set(d, after, at_spot(&layout::HINT, cx, cy, "CLICK: PICK A THEME   HOLD: SCREENS", theme::RIM));
    blank_from(d, lines, after + 1);
}
