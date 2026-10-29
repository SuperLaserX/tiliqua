//! The round screen, drawn incrementally.
//!
//! The main loop describes what should be on screen as a `View`; `Screen`
//! keeps the last view it drew and redraws only what changed: text is erased
//! (its own glyphs blitted in black, which is the backdrop) and drawn again,
//! a dial's arc repainted segment by segment, a needle or CV marker drawn in
//! black at its old place and in colour at the new one. Nothing fades: the
//! framebuffer keeps what was drawn, and the plotting traffic on the shared
//! PSRAM stays small. A new set of cells (another type) clears the screen
//! and draws it all.
//!
//! Layout (`bfr_cpu::layout`): a ring of cells (label, dial, value) round a
//! hub with the type, preset, selected item, description, CV and status.
//!
//! A dial is a 4 pixel ring (`bfr_cpu::dial`), lit up to its value, with a
//! needle inside and a CV notch across it, all plotted pixel by pixel: its
//! pixels are listed once (`RING`, from the build script) with their
//! position along the sweep, so it is round at any size, and a change
//! repaints only the pixels between the old and new positions.

use heapless::{String, Vec};
use tiliqua_hal::embedded_graphics::prelude::*;
use tiliqua_lib::color::HI8;

use bfr_cpu::dial::{T_GAP, T_ONE};
use bfr_cpu::layout::*;
use bfr_cpu::math;

use crate::glyphs::{self, Face};
use crate::theme;

mod table {
    include!(concat!(env!("OUT_DIR"), "/dial.rs"));
}
use table::RING;

/// Half the CV notch's width along the sweep (T_ONE scale), with a margin:
/// the ring pixels repainted where it was.
const NOTCH_DT: u16 = 1500;

#[derive(Clone, PartialEq)]
pub struct Cell {
    pub label: String<12>,
    /// (on two lines if longer than one: `layout::cell_lines`)
    pub value: String<24>,
    /// A parameter's dial position (0..1); none for type, preset and setup.
    pub dial: Option<f32>,
    /// Where the modulation moves it, if anything does.
    pub modulated: Option<f32>,
    /// CV1, CV2, any of the followers assigned to it.
    pub cv: [bool; 3],
    /// The ring's colour when not selected, for a cell without a dial (the
    /// kick button's flashing hue); none for the track's.
    pub accent: Option<HI8>,
}

#[derive(Clone, Copy, PartialEq, Eq)]
pub enum Highlight {
    Selected,
    Editing,
}

#[derive(Clone, PartialEq)]
pub struct View {
    /// Changes whenever the set of cells does (a new type): redraws all.
    pub layout_id: u32,
    pub cells: Vec<Cell, MAX_CELLS>,
    pub selected: usize,
    pub highlight: Highlight,
    pub title: String<24>,
    pub preset: String<40>,
    pub sel_label: String<40>,
    pub sel_value: String<24>,
    pub sel_value_color: HI8,
    /// The description, or the setup list.
    pub lines: Vec<(String<64>, HI8), HELP_LINES>,
    pub cv_line: String<64>,
    pub status: String<64>,
    pub status_color: HI8,
}

pub struct Screen {
    cx: i32,
    cy: i32,
    drawn: Option<View>,
}

/// A cell's state for drawing: highlighted if selected.
fn state(v: &View, k: usize) -> Option<Highlight> {
    (v.selected == k).then_some(v.highlight)
}

impl Screen {
    pub fn new(width: u32, height: u32) -> Self {
        Self { cx: width as i32 / 2, cy: height as i32 / 2, drawn: None }
    }

    /// Forget what is on screen: the next `draw` clears and draws everything.
    pub fn invalidate(&mut self) {
        self.drawn = None;
    }

    /// Bring the screen up to `v`. `clear` blanks the whole framebuffer.
    /// True if it was all drawn afresh.
    pub fn draw<D: DrawTarget<Color = HI8>>(&mut self, d: &mut D, v: &View,
                                            clear: impl FnOnce(&mut D)) -> bool {
        let old = match self.drawn.take() {
            Some(old) if old.layout_id == v.layout_id && old.cells.len() == v.cells.len() => old,
            _ => {
                clear(d);
                for k in 0..v.cells.len() {
                    self.cell_full(d, v, k);
                }
                self.hub(d, None, v);
                self.drawn = Some(v.clone());
                return true;
            }
        };
        for k in 0..v.cells.len() {
            self.cell_update(d, &old, v, k);
        }
        self.hub(d, Some(&old), v);
        self.drawn = Some(v.clone());
        false
    }

    fn cell_full<D: DrawTarget<Color = HI8>>(&self, d: &mut D, v: &View, k: usize) {
        let c = &v.cells[k];
        let (x, y) = self.cell_xy(k, v.cells.len());
        let st = state(v, k);
        self.text(d, Face::Text, x, y + LABEL_DY, &c.label, label_color(st));
        self.value(d, x, y, &c.value, value_color(st));
        self.ring(d, x, y, c, st, 0, T_GAP);
        if let Some(t) = c.dial {
            self.radial(d, x, y, t, NEEDLE_IN, NEEDLE_OUT, theme::NEEDLE);
        }
        if let Some(t) = c.modulated {
            self.radial(d, x, y, t, NOTCH_IN, NOTCH_OUT, theme::CV);
        }
        self.badges(d, x, y, c.cv, [false; 3]);
    }

    fn cell_update<D: DrawTarget<Color = HI8>>(&self, d: &mut D, old: &View, v: &View, k: usize) {
        let (o, c) = (&old.cells[k], &v.cells[k]);
        let (x, y) = self.cell_xy(k, v.cells.len());
        let (os, st) = (state(old, k), state(v, k));
        if o.label != c.label || os != st {
            self.erase(d, Face::Text, x, y + LABEL_DY, &o.label);
            self.text(d, Face::Text, x, y + LABEL_DY, &c.label, label_color(st));
        }
        if o.value != c.value || os != st {
            self.value(d, x, y, &o.value, HI8::BLACK);
            self.value(d, x, y, &c.value, value_color(st));
        }
        let whole = os != st || o.dial.is_some() != c.dial.is_some() || o.accent != c.accent;
        let notch_moved = o.modulated != c.modulated;
        // the old notch off first (black, then the ring under it again)
        if notch_moved {
            if let Some(t) = o.modulated {
                self.radial(d, x, y, t, NOTCH_IN, NOTCH_OUT, HI8::BLACK);
                if !whole {
                    let m = lit(t);
                    self.ring(d, x, y, c, st, m.saturating_sub(NOTCH_DT), m.saturating_add(NOTCH_DT));
                }
            }
        }
        let mut painted = notch_moved;
        if whole {
            self.ring(d, x, y, c, st, 0, T_GAP);
            painted = true;
        } else if let (Some(a), Some(b)) = (o.dial, c.dial) {
            if a != b {
                let (la, lb) = (lit(a), lit(b));
                self.ring(d, x, y, c, st, la.min(lb), la.max(lb));
                painted = true;
            }
        }
        if o.dial != c.dial || notch_moved {
            if let Some(t) = o.dial.filter(|_| o.dial != c.dial) {
                self.radial(d, x, y, t, NEEDLE_IN, NEEDLE_OUT, HI8::BLACK);
            }
            if let Some(t) = c.dial {
                self.radial(d, x, y, t, NEEDLE_IN, NEEDLE_OUT, theme::NEEDLE);
            }
        }
        // the notch on top of whatever was repainted
        if let Some(t) = c.modulated.filter(|_| painted) {
            self.radial(d, x, y, t, NOTCH_IN, NOTCH_OUT, theme::CV);
        }
        if o.cv != c.cv {
            self.badges(d, x, y, c.cv, o.cv);
        }
    }

    fn hub<D: DrawTarget<Color = HI8>>(&self, d: &mut D, old: Option<&View>, v: &View) {
        let line = |d: &mut D, face, y, o: Option<(&str, HI8)>, n: (&str, HI8)| {
            if o == Some(n) {
                return;
            }
            if let Some((s, _)) = o {
                self.erase_fit(d, face, y, s);
            }
            self.text_fit(d, face, y, n.0, n.1);
        };
        line(d, Face::Big, TITLE_Y, old.map(|o| (o.title.as_str(), theme::TITLE)), (&v.title, theme::TITLE));
        line(d, Face::Text, PRESET_Y, old.map(|o| (o.preset.as_str(), theme::TEXT)), (&v.preset, theme::TEXT));
        line(d, Face::Text, SEL_LABEL_Y, old.map(|o| (o.sel_label.as_str(), theme::SELECTED)),
             (&v.sel_label, theme::SELECTED));
        line(d, Face::Big, SEL_VALUE_Y, old.map(|o| (o.sel_value.as_str(), o.sel_value_color)),
             (&v.sel_value, v.sel_value_color));
        for i in 0..HELP_LINES {
            let o = old.map(|o| o.lines.get(i).map(|(s, c)| (s.as_str(), *c)).unwrap_or(("", theme::TEXT)));
            let n = v.lines.get(i).map(|(s, c)| (s.as_str(), *c)).unwrap_or(("", theme::TEXT));
            line(d, Face::Text, HELP_Y + HELP_PITCH * i as i32, o, n);
        }
        line(d, Face::Small, CV_Y, old.map(|o| (o.cv_line.as_str(), theme::CV)), (&v.cv_line, theme::CV));
        line(d, Face::Small, STATUS_Y, old.map(|o| (o.status.as_str(), o.status_color)),
             (&v.status, v.status_color));
    }

    fn cell_xy(&self, k: usize, n: usize) -> (i32, i32) {
        let (x, y) = cell_centre(k, n);
        (self.cx + x, self.cy + y)
    }

    /// `s` centred on x, top at y (absolute), cut to a cell's width.
    fn text<D: DrawTarget<Color = HI8>>(&self, d: &mut D, face: Face, x: i32, y: i32, s: &str, color: HI8) {
        let s = &s[..s.len().min(CELL_CHARS)];
        glyphs::draw(d, face, x - glyphs::width(face, s.len()) / 2, y, s, color);
    }

    /// A cell's value under its dial, on two lines if it needs them.
    fn value<D: DrawTarget<Color = HI8>>(&self, d: &mut D, x: i32, y: i32, s: &str, color: HI8) {
        let (first, second) = cell_lines(s);
        self.text(d, Face::Text, x, y + VALUE_DY, first, color);
        if !second.is_empty() {
            self.text(d, Face::Text, x, y + VALUE_DY + VALUE_PITCH, second, color);
        }
    }

    /// Erases `s` drawn by `text`: its own glyphs in black (only their set
    /// pixels: about a third of the solid cells').
    fn erase<D: DrawTarget<Color = HI8>>(&self, d: &mut D, face: Face, x: i32, y: i32, s: &str) {
        self.text(d, face, x, y, s, HI8::BLACK);
    }

    /// A hub line: centred, top at `y` relative to the centre, cut to the hub.
    fn text_fit<D: DrawTarget<Color = HI8>>(&self, d: &mut D, face: Face, y: i32, s: &str, color: HI8) {
        let s = &s[..s.len().min(hub_chars(face.font(), y))];
        glyphs::draw(d, face, self.cx - glyphs::width(face, s.len()) / 2, self.cy + y, s, color);
    }

    fn erase_fit<D: DrawTarget<Color = HI8>>(&self, d: &mut D, face: Face, y: i32, s: &str) {
        self.text_fit(d, face, y, s, HI8::BLACK);
    }

    /// Repaints the ring's pixels whose position along the sweep is in
    /// `from..to` (`T_GAP` as `to`: the whole ring, gap included): lit up to
    /// the dial's value, the track beyond it. A cell without a dial is a full
    /// ring, coloured when selected (or in its accent).
    fn ring<D: DrawTarget<Color = HI8>>(&self, d: &mut D, x: i32, y: i32, c: &Cell,
                                        st: Option<Highlight>, from: u16, to: u16) {
        let on = if st.is_some() { theme::SELECTED } else { theme::ARC };
        let off = match (c.dial, st, c.accent) {
            (None, Some(_), _) => theme::SELECTED,
            (None, None, Some(a)) => a,
            _ => theme::TRACK,
        };
        let lit_to = c.dial.map(lit).unwrap_or(0);
        let gap = c.dial.is_none() && to == T_GAP;
        let pixels = RING.iter().filter_map(|&(dx, dy, t)| {
            let color = if t == T_GAP {
                if !gap {
                    return None;
                }
                off
            } else if t < from || t >= to {
                return None;
            } else if t < lit_to {
                on
            } else {
                off
            };
            Some(Pixel(Point::new(x + dx as i32, y + dy as i32), color))
        });
        d.draw_iter(pixels).ok();
    }

    /// A 2 pixel wide radial stroke at position `t` of the sweep, from radius
    /// `r0` to `r1` (the needle, the CV notch).
    fn radial<D: DrawTarget<Color = HI8>>(&self, d: &mut D, x: i32, y: i32, t: f32, r0: f64, r1: f64,
                                          color: HI8) {
        let a = DIAL_START + DIAL_SWEEP * (t.clamp(0.0, 1.0) as f64);
        let (cs, sn) = (math::cos(a), math::sin(a));
        let steps = ((r1 - r0) * 2.0) as i32;
        let pixels = (0..=steps).flat_map(move |k| {
            let r = r0 + k as f64 * 0.5;
            let (px, py) = (x as f64 + r * cs, y as f64 + r * sn);
            // either side of the centre line, half a pixel away
            [-0.5, 0.5].map(|h| Pixel(Point::new(round(px - h * sn), round(py + h * cs)), color))
        });
        d.draw_iter(pixels).ok();
    }

    /// "1", "2" and "f" in the dial's gap for the CVs and followers that move it.
    fn badges<D: DrawTarget<Color = HI8>>(&self, d: &mut D, x: i32, y: i32, cv: [bool; 3], was: [bool; 3]) {
        let at = BADGE_DX.map(|dx| (x + dx, y + BADGE_DY));
        for (i, (bx, by)) in at.into_iter().enumerate() {
            if cv[i] == was[i] {
                continue;
            }
            let mark = ["1", "2", "f"][i];
            glyphs::draw(d, Face::Small, bx, by, mark, if cv[i] { theme::CV } else { HI8::BLACK });
        }
    }
}

/// Where the lit part of a dial at `t` ends (`T_ONE` scale): pixels before it
/// are lit; all of them at 1.
fn lit(t: f32) -> u16 {
    if t >= 1.0 {
        T_ONE + 1
    } else {
        (t.max(0.0) * T_ONE as f32 + 0.5) as u16
    }
}

fn label_color(st: Option<Highlight>) -> HI8 {
    if st.is_some() { theme::SELECTED } else { theme::LABEL }
}

fn value_color(st: Option<Highlight>) -> HI8 {
    match st {
        Some(Highlight::Editing) => theme::SELECTED,
        _ => theme::VALUE,
    }
}

fn round(x: f64) -> i32 {
    bfr_cpu::math::floor(x + 0.5) as i32
}
