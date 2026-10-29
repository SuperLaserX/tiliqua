//! The Sunset theme: amber, coral and magenta, warm-white text, over a sky
//! that runs from wine in the middle to amber at the rim.
//!
//! The framebuffer's pixels are a 4-bit hue and a 4-bit intensity; the
//! palette maps each pair to RGB. Most hues are one theme colour with the
//! intensity a brightness ramp of it (intensity 0 is black). Three are
//! special:
//!
//! - SKY, the backdrop's (bfr/backdrop.py): its ramp runs through colours,
//!   wine -> crimson -> ember -> amber, so the glow warms as it brightens.
//! - PULSE, the selected item's: `animate` breathes its brightest entry, so
//!   the selection pulses with no redrawing.
//! - KICK, the spring's kick button: `animate` flashes it on a hit.

use tiliqua_hal::dma_framebuffer::DMAFramebuffer;
use tiliqua_lib::color::HI8;

pub const GREY: u8 = 0;
pub const AMBER: u8 = 1;
pub const CORAL: u8 = 2;
pub const MAGENTA: u8 = 3;
pub const WHITE: u8 = 4;
pub const GOLD: u8 = 5;
pub const SKY: u8 = 6;
pub const PULSE: u8 = 7;
pub const KICK: u8 = 8;

/// Full-intensity RGB of each plain hue (the unused ones are warm grey).
const HUES: [(u8, u8, u8); 6] = [
    (196, 178, 160), // warm grey
    (255, 168, 28),  // amber
    (255, 92, 62),   // coral
    (236, 54, 142),  // magenta
    (255, 241, 222), // warm white
    (255, 212, 84),  // gold
];

/// The sky's colours at some intensities; the others are between.
const SKY_KEYS: [(u8, (u8, u8, u8)); 5] = [
    (0, (12, 3, 12)),     // night
    (5, (84, 12, 40)),    // wine
    (9, (176, 40, 30)),   // crimson
    (12, (232, 104, 24)), // ember
    (15, (255, 186, 72)), // amber
];

/// The pulse: coral, breathing towards peach.
const PULSE_FROM: (u8, u8, u8) = (255, 92, 62);
const PULSE_TO: (u8, u8, u8) = (255, 176, 120);
const PULSE_MS: u32 = 1400;

/// The kick button: dim gold, flashing to white-gold.
const KICK_REST: (u8, u8, u8) = (150, 112, 40);
const KICK_HIT: (u8, u8, u8) = (255, 248, 210);

fn ramp(i: u8) -> u32 {
    // brightness in thousandths: mostly quadratic (perceptual), with a
    // linear part so the low intensities stay visible
    let t = i as u32;
    800 * t * t / 225 + 200 * t / 15
}

fn scale((r, g, b): (u8, u8, u8), k: u32) -> (u8, u8, u8) {
    let s = |c: u8| (c as u32 * k / 1000).min(255) as u8;
    (s(r), s(g), s(b))
}

fn mix(a: (u8, u8, u8), b: (u8, u8, u8), w: f32) -> (u8, u8, u8) {
    let m = |x: u8, y: u8| (x as f32 + (y as f32 - x as f32) * w + 0.5) as u8;
    (m(a.0, b.0), m(a.1, b.1), m(a.2, b.2))
}

fn sky(i: u8) -> (u8, u8, u8) {
    for w in SKY_KEYS.windows(2) {
        let ((i0, c0), (i1, c1)) = (w[0], w[1]);
        if i <= i1 {
            return mix(c0, c1, (i.saturating_sub(i0)) as f32 / (i1 - i0) as f32);
        }
    }
    SKY_KEYS[SKY_KEYS.len() - 1].1
}

fn set(d: &mut impl DMAFramebuffer, hue: u8, i: u8, (r, g, b): (u8, u8, u8)) {
    d.set_palette_rgb(i, hue, r, g, b);
}

/// Writes the theme into the hardware palette.
pub fn write_palette(d: &mut impl DMAFramebuffer) {
    for hue in 0..16u8 {
        for i in 0..16u8 {
            let rgb = match hue {
                SKY => sky(i),
                PULSE => scale(PULSE_FROM, ramp(i)),
                KICK => scale(KICK_REST, ramp(i)),
                _ => scale(HUES.get(hue as usize).copied().unwrap_or(HUES[0]), ramp(i)),
            };
            set(d, hue, i, rgb);
        }
    }
}

/// The animated entries at time `now_ms`; `flash` is the kick's flash,
/// 1 at a hit and falling to 0.
pub fn animate(d: &mut impl DMAFramebuffer, now_ms: u32, flash: f32) {
    let phase = (now_ms % PULSE_MS) as f64 / PULSE_MS as f64;
    let w = (0.5 - 0.5 * bfr_cpu::math::cos(phase * 2.0 * core::f64::consts::PI)) as f32;
    set(d, PULSE, 15, mix(PULSE_FROM, PULSE_TO, w));
    set(d, KICK, 15, mix(KICK_REST, KICK_HIT, flash.clamp(0.0, 1.0)));
}

pub const fn c(hue: u8, intensity: u8) -> HI8 {
    HI8::new(hue, intensity)
}

/// The roles.
pub const TITLE: HI8 = c(AMBER, 15);
pub const TEXT: HI8 = c(WHITE, 12);
pub const DIM_TEXT: HI8 = c(WHITE, 8);
pub const LABEL: HI8 = c(WHITE, 10);
pub const SELECTED: HI8 = c(PULSE, 15);
pub const VALUE: HI8 = c(AMBER, 13);
pub const TRACK: HI8 = c(GREY, 4);
pub const ARC: HI8 = c(AMBER, 14);
pub const NEEDLE: HI8 = c(WHITE, 15);
pub const CV: HI8 = c(MAGENTA, 15);
pub const STATUS: HI8 = c(GREY, 9);
pub const WARN: HI8 = c(GOLD, 15);
pub const KICK_RING: HI8 = c(KICK, 15);
