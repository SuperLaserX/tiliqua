//! The UI's hardware: the backdrop under the screen and its curtain
//! (bfr/backdrop.py), and the fill engine that clears the framebuffer
//! (bfr/fill.py).

use bfr_cpu::math;

use crate::pac;
use crate::pac::constants::*;
use crate::theme;

/// The curtain's radius when it hides nothing (beyond any pixel).
pub const CURTAIN_OPEN: u16 = 1023;
/// Past the round screen's edge: the curtain shows everything from here.
pub const CURTAIN_EDGE: f32 = 372.0;

/// The glow: 1.5 intensities in the middle, rising about 1 per 24 pixels
/// (wine in the hub, crimson at the rim; `theme::SKY`).
const GLOW_BASE: u8 = 24;
const GLOW_SLOPE: u8 = 17;
/// Rings 64 pixels apart, moving out 0.4 pixel a frame in silence and up to
/// 0.7 when loud; from thin (quiet) to about half their spacing (loud).
const RING_FREQ: u8 = 64;
const RING_SPEED: f32 = 26.0;
const RING_SPEED_LOUD: f32 = 46.0;
const RING_WIDTH: f32 = 40.0;
const RING_WIDTH_LOUD: f32 = 230.0;
/// The glow lifts by up to this (1/16 intensity) with the level.
const GLOW_LIFT: f32 = 20.0;

/// The reverb's level for the rings: -48 dBFS and below is none.
const LEVEL_FLOOR_DB: f32 = -48.0;
/// How fast the rings follow the level: at once up, `RELEASE_MS` down.
const RELEASE_MS: f32 = 700.0;

pub struct Backdrop {
    regs: pac::BACKDROP,
    level: f32,
}

impl Backdrop {
    /// Sets the backdrop up for a `width` x `height` screen and shows it.
    pub fn new(regs: pac::BACKDROP, width: u32, height: u32) -> Self {
        regs.centre().write(|w| unsafe {
            w.x().bits((width / 2) as u16);
            w.y().bits((height / 2) as u16)
        });
        let b = Self { regs, level: 0.0 };
        b.react(0.0);
        b.regs.control().write(|w| unsafe {
            w.enable().bit(true);
            w.hue().bits(theme::SKY)
        });
        b
    }

    /// The rings and glow for a level (0..1): brighter, wider and faster rings
    /// and a brighter sky as the reverb gets louder.
    fn react(&self, level: f32) {
        let lerp = |a: f32, b: f32| a + (b - a) * level;
        self.regs.ripple().write(|w| unsafe {
            w.freq().bits(RING_FREQ);
            w.speed().bits(lerp(RING_SPEED, RING_SPEED_LOUD) as i8 as u8);
            w.level().bits((level * 255.0) as u8);
            w.width().bits(lerp(RING_WIDTH, RING_WIDTH_LOUD) as u8)
        });
        self.regs.glow().write(|w| unsafe {
            w.base().bits(GLOW_BASE + (level * GLOW_LIFT) as u8);
            w.slope().bits(GLOW_SLOPE)
        });
    }

    /// Outside `radius` only the backdrop shows (`CURTAIN_OPEN`: nothing hidden).
    pub fn curtain(&self, radius: u16) {
        self.regs.curtain().write(|w| unsafe { w.radius().bits(radius.min(CURTAIN_OPEN)) });
    }

    /// The curtain at `t` of the way open (0 closed, 1 open), eased.
    pub fn curtain_at(&self, t: f32) {
        let t = t.clamp(0.0, 1.0);
        if t >= 1.0 {
            self.curtain(CURTAIN_OPEN);
        } else {
            let e = t * t * (3.0 - 2.0 * t);
            self.curtain((e * CURTAIN_EDGE) as u16);
        }
    }

    /// The rings follow `peak` (the loudest wet sample since the last call,
    /// 0..32768), `dt_ms` after the last call.
    pub fn follow(&mut self, peak: u16, dt_ms: u32) {
        let db = if peak == 0 {
            LEVEL_FLOOR_DB
        } else {
            (20.0 * math::ln(peak as f64 / 32768.0) / core::f64::consts::LN_10) as f32
        };
        let target = ((db - LEVEL_FLOOR_DB) / -LEVEL_FLOOR_DB).clamp(0.0, 1.0);
        if target > self.level {
            self.level = target;
        } else {
            self.level += (target - self.level) * (dt_ms as f32 / RELEASE_MS).min(1.0);
        }
        self.react(self.level);
    }
}

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
