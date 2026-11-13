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
