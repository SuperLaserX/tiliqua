//! The Scope screen's pictures: the input and output waveforms in one box, their spectra in
//! another (`nam_cpu::scope` makes them; `nam_cpu::layout` places the boxes). Each frame the old
//! lines are drawn again in the ground's colour, the grid redrawn, then the new lines on it, the
//! output over the input.

use tiliqua_hal::embedded_graphics::prelude::*;
use tiliqua_lib::color::HI8;

use nam_cpu::geometry::Rect;
use nam_cpu::layout::{spectrum_x, SCOPE_BOX, SPECTRUM_BOX};
use nam_cpu::scope::{BANDS, FLOOR_DB, TRACE_POINTS};

use crate::theme;

pub const IN: HI8 = theme::c(theme::TEAL, 11);
pub const OUT: HI8 = theme::c(theme::AMBER, 14);

/// What is drawn, to erase it; lives in PSRAM (zeroed: nothing drawn).
pub struct ScopeView {
    trace: [[i16; TRACE_POINTS]; 2],
    spectrum: [[i16; BANDS]; 2],
    traced: [bool; 2],
    plotted: [bool; 2],
}

/// Half the traces' box's height: a trace's full scale.
pub const HALF: i32 = SCOPE_BOX.h / 2 - 4;

impl ScopeView {
    /// # Safety
    /// `addr` is PSRAM nothing else uses.
    pub unsafe fn place(addr: usize) -> &'static mut ScopeView {
        // (zeroed where it lives: all integers and a false)
        let p = addr as *mut ScopeView;
        core::ptr::write_bytes(p, 0, 1);
        &mut *p
    }

    /// The screen was cleared.
    pub fn forget(&mut self) {
        self.traced = [false; 2];
        self.plotted = [false; 2];
    }

    /// A spectrum's dB values as heights in its box.
    pub fn heights(db: &[i32; BANDS]) -> [i16; BANDS] {
        let mut h = [0i16; BANDS];
        for (o, d) in h.iter_mut().zip(db) {
            let v = (*d - FLOOR_DB * 256).max(0) as i64 * SPECTRUM_BOX.h as i64 / (-FLOOR_DB as i64 * 256);
            *o = v.min(SPECTRUM_BOX.h as i64) as i16;
        }
        h
    }

    /// The input's (0) and output's (1) traces and spectra, each only if given: what was drawn
    /// before is erased, the grid redrawn, then these.
    pub fn update<D: DrawTarget<Color = HI8>>(&mut self, d: &mut D, cx: i32, cy: i32,
                                              traces: &[Option<[i16; TRACE_POINTS]>; 2],
                                              spectra: &[Option<[i16; BANDS]>; 2]) {
        for k in 0..2 {
            if self.traced[k] {
                trace(d, cx, cy, &self.trace[k], HI8::BLACK);
            }
            if self.plotted[k] {
                spectrum(d, cx, cy, &self.spectrum[k], HI8::BLACK);
            }
        }
        grid(d, cx, cy);
        for (k, color) in [(0, IN), (1, OUT)] {
            self.traced[k] = traces[k].is_some();
            if let Some(t) = &traces[k] {
                trace(d, cx, cy, t, color);
                self.trace[k] = *t;
            }
            self.plotted[k] = spectra[k].is_some();
            if let Some(s) = &spectra[k] {
                spectrum(d, cx, cy, s, color);
                self.spectrum[k] = *s;
            }
        }
    }
}

fn line<D: DrawTarget<Color = HI8>>(d: &mut D, cx: i32, cy: i32, a: (i32, i32), b: (i32, i32), color: HI8) {
    d.draw_line_solid(cx + a.0, cy + a.1, cx + b.0, cy + b.1, 1, color);
}

fn frame<D: DrawTarget<Color = HI8>>(d: &mut D, cx: i32, cy: i32, r: &Rect, color: HI8) {
    let (x0, y0, x1, y1) = (r.x, r.y, r.x + r.w, r.y + r.h);
    line(d, cx, cy, (x0, y0), (x1, y0), color);
    line(d, cx, cy, (x1, y0), (x1, y1), color);
    line(d, cx, cy, (x1, y1), (x0, y1), color);
    line(d, cx, cy, (x0, y1), (x0, y0), color);
}

/// The boxes, the traces' centre line, the spectra's -30 and -60 dB lines and their 100 Hz,
/// 1 kHz and 10 kHz marks.
fn grid<D: DrawTarget<Color = HI8>>(d: &mut D, cx: i32, cy: i32) {
    frame(d, cx, cy, &SCOPE_BOX, theme::RIM);
    frame(d, cx, cy, &SPECTRUM_BOX, theme::RIM);
    let mid = SCOPE_BOX.y + SCOPE_BOX.h / 2;
    line(d, cx, cy, (SCOPE_BOX.x + 1, mid), (SCOPE_BOX.x + SCOPE_BOX.w - 1, mid), theme::PANEL);
    let (x0, x1) = (SPECTRUM_BOX.x + 1, SPECTRUM_BOX.x + SPECTRUM_BOX.w - 1);
    for db in [-30, -60] {
        let y = SPECTRUM_BOX.y + SPECTRUM_BOX.h * (-db) / (-FLOOR_DB);
        line(d, cx, cy, (x0, y), (x1, y), theme::PANEL);
    }
    for hz in [100.0, 1000.0, 10000.0] {
        let x = spectrum_x(hz);
        line(d, cx, cy, (x, SPECTRUM_BOX.y + 1), (x, SPECTRUM_BOX.y + SPECTRUM_BOX.h - 1), theme::PANEL);
    }
}

fn trace<D: DrawTarget<Color = HI8>>(d: &mut D, cx: i32, cy: i32, t: &[i16; TRACE_POINTS], color: HI8) {
    let mid = SCOPE_BOX.y + SCOPE_BOX.h / 2;
    let x = |i: usize| SCOPE_BOX.x + 2 + (i as i32 * (SCOPE_BOX.w - 4)) / (TRACE_POINTS as i32 - 1);
    for i in 1..TRACE_POINTS {
        line(d, cx, cy, (x(i - 1), mid - t[i - 1] as i32), (x(i), mid - t[i] as i32), color);
    }
}

fn spectrum<D: DrawTarget<Color = HI8>>(d: &mut D, cx: i32, cy: i32, h: &[i16; BANDS], color: HI8) {
    let bottom = SPECTRUM_BOX.y + SPECTRUM_BOX.h - 1;
    let x = |b: usize| SPECTRUM_BOX.x + 1 + (b as i32 * (SPECTRUM_BOX.w - 2)) / (BANDS as i32 - 1);
    for b in 1..BANDS {
        line(d, cx, cy, (x(b - 1), bottom - h[b - 1] as i32), (x(b), bottom - h[b] as i32), color);
    }
}
