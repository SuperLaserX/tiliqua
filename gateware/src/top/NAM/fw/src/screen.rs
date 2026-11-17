//! The round screen: drawn incrementally and never faded. The framebuffer keeps what was
//! drawn, and only what changed is erased and redrawn, so the plotting traffic on the shared
//! PSRAM stays small.

use tiliqua_hal::embedded_graphics::prelude::*;
use tiliqua_lib::color::HI8;

use crate::glyphs::{self, Face};
use crate::pac;
use crate::pac::constants::*;

/// Writes a run of PSRAM words in bursts (nam/fill.py).
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
        for _ in 0..5_000_000u32 {
            if !self.regs.status().read().busy().bit() {
                return true;
            }
        }
        false
    }
}

/// Wait for the blitter and line plotter to have drawn what they were given.
pub fn plotters_idle() {
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
/// and be written back over it. So first a pixel in each of 16 consecutive
/// cache lines along the top-left corner's edge (off the round screen) moves
/// every cache line there: whatever is written back after the fill lands
/// where it can't be seen.
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

/// Text centred on (cx, cy).
pub fn centred<D: DrawTarget<Color = HI8>>(d: &mut D, face: Face, cx: i32, cy: i32, text: &str, color: HI8) {
    let x = cx - glyphs::width(face, text.len()) / 2;
    glyphs::draw(d, face, x, cy - face.font().h / 2, text, color);
}

/// What a line of text on the screen is: its face, where its centre is, the text and colour.
#[derive(Clone, PartialEq, Eq)]
pub struct Line {
    pub face: Face,
    pub cx: i32,
    pub cy: i32,
    pub text: heapless::String<64>,
    pub color: HI8,
}

/// Lines of text kept as drawn, so that only a line that changed is erased and redrawn: the
/// screen never flickers, and the plotting traffic stays small. Lives in PSRAM (`place`), as
/// the CPU's RAM is the stack's.
pub struct Lines<const N: usize> {
    shown: [Option<Line>; N],
}

impl<const N: usize> Lines<N> {
    /// A `Lines` written at `addr` in PSRAM, nothing shown.
    ///
    /// # Safety
    /// `addr` is PSRAM nothing else uses, aligned for `Lines`.
    pub unsafe fn place(addr: usize) -> &'static mut Lines<N> {
        let p = addr as *mut Lines<N>;
        p.write(Lines { shown: [const { None }; N] });
        &mut *p
    }

    /// The screen was cleared: nothing is shown.
    pub fn forget(&mut self) {
        for s in self.shown.iter_mut() {
            *s = None;
        }
    }

    /// Line `i` becomes `line` (None: blank).
    pub fn set<D: DrawTarget<Color = HI8>>(&mut self, d: &mut D, i: usize, line: Option<Line>) {
        if self.shown[i] == line {
            return;
        }
        if let Some(old) = self.shown[i].take() {
            let x = old.cx - glyphs::width(old.face, old.text.len()) / 2;
            glyphs::erase(d, old.face, x, old.cy - old.face.font().h / 2, old.text.len());
        }
        if let Some(new) = &line {
            centred(d, new.face, new.cx, new.cy, new.text.as_str(), new.color);
        }
        self.shown[i] = line;
    }
}

/// A line of `text` (cut to fit) centred on (cx, cy).
pub fn line(face: Face, cx: i32, cy: i32, text: &str, color: HI8) -> Option<Line> {
    let mut t = heapless::String::new();
    for c in text.chars() {
        if t.push(c).is_err() {
            break;
        }
    }
    Some(Line { face, cx, cy, text: t, color })
}

// ---- Arcs: the rim and the meters ----

use nam_cpu::geometry::Walk;
use nam_cpu::layout::Arc;

/// One segment of an arc, between two points of its walk: a line at each of its radii.
fn segment<D: DrawTarget<Color = HI8>>(d: &mut D, cx: i32, cy: i32, arc: &Arc, a: &Walk, b: &Walk, color: HI8) {
    for k in 0..arc.thick {
        let r = arc.radius - k;
        let (p, q) = (a.at(r), b.at(r));
        d.draw_line_solid(cx + p.0, cy + p.1, cx + q.0, cy + q.1, 1, color);
    }
}

/// All of an arc in one colour.
pub fn paint_arc<D: DrawTarget<Color = HI8>>(d: &mut D, cx: i32, cy: i32, arc: &Arc, color: HI8) {
    let mut a = arc.walk();
    for _ in 0..arc.segments {
        let mut b = a;
        b.step();
        segment(d, cx, cy, arc, &a, &b, color);
        a = b;
    }
}

/// An arc gauge: its first segments lit, the rest its track. Remembers what it drew, so an update
/// paints only the segments that changed.
#[derive(Clone, Copy, PartialEq, Eq, Default)]
pub struct Gauge {
    /// How many segments are lit, and in what colour; None: not drawn since the screen cleared.
    shown: Option<(usize, HI8)>,
}

impl Gauge {
    pub fn forget(&mut self) {
        self.shown = None;
    }

    pub fn set<D: DrawTarget<Color = HI8>>(&mut self, d: &mut D, cx: i32, cy: i32, arc: &Arc, lit: usize,
                                           color: HI8, track: HI8) {
        if self.shown == Some((lit, color)) {
            return;
        }
        let mut a = arc.walk();
        for s in 0..arc.segments {
            let mut b = a;
            b.step();
            let now = s < lit;
            let paint = match self.shown {
                None => Some(if now { color } else { track }),
                Some((was_lit, was_color)) => {
                    let was = s < was_lit;
                    if now && (!was || was_color != color) {
                        Some(color)
                    } else if was && !now {
                        Some(track)
                    } else {
                        None
                    }
                }
            };
            if let Some(c) = paint {
                segment(d, cx, cy, arc, &a, &b, c);
            }
            a = b;
        }
        self.shown = Some((lit, color));
    }
}

/// A line of `text` at a layout spot (aligned as the spot says), offset to the screen's centre.
pub fn at_spot(spot: &nam_cpu::layout::Spot, cx: i32, cy: i32, text: &str, color: HI8) -> Option<Line> {
    let face = Face::of(spot.font);
    let n = text.len().min(spot.chars);
    let left = spot.left(n);
    let centre = left + glyphs::width(face, n) / 2;
    line(face, cx + centre, cy + spot.y, &text[..text.char_indices().nth(n).map_or(text.len(), |(i, _)| i)], color)
}
