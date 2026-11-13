//! The look: a dark slate ground, cool white text, an amber accent for what the
//! encoder is on and for levels, red where something clips or is wrong.
//!
//! The framebuffer's pixels are a 4-bit hue and a 4-bit intensity; the palette
//! maps each pair to RGB. Each hue is one colour with the intensity a brightness
//! ramp of it (intensity 0 is black).

use tiliqua_hal::dma_framebuffer::DMAFramebuffer;
use tiliqua_lib::color::HI8;

pub const SLATE: u8 = 0;
pub const ICE: u8 = 1;
pub const AMBER: u8 = 2;
pub const TEAL: u8 = 3;
pub const RED: u8 = 4;

/// Full-intensity RGB of each hue (the unused ones are slate).
const HUES: [(u8, u8, u8); 5] = [
    (150, 170, 200),  // slate: structure, dim text
    (236, 242, 255),  // ice: text
    (255, 170, 50),   // amber: the accent
    (70, 220, 190),   // teal: levels, good
    (255, 70, 60),    // red: clipping, warnings
];

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

/// Writes the theme into the hardware palette.
pub fn write_palette(d: &mut impl DMAFramebuffer) {
    for hue in 0..16u8 {
        for i in 0..16u8 {
            let (r, g, b) = scale(HUES.get(hue as usize).copied().unwrap_or(HUES[0]), ramp(i));
            d.set_palette_rgb(i, hue, r, g, b);
        }
    }
}

pub const fn c(hue: u8, intensity: u8) -> HI8 {
    HI8::new(hue, intensity)
}

/// The roles.
pub const TITLE: HI8 = c(ICE, 15);
pub const TEXT: HI8 = c(ICE, 11);
pub const DIM: HI8 = c(SLATE, 7);
pub const RIM: HI8 = c(SLATE, 4);
pub const PANEL: HI8 = c(SLATE, 2);
pub const MARK: HI8 = c(AMBER, 15);
pub const SELECTED: HI8 = c(AMBER, 15);
pub const EDITING: HI8 = c(ICE, 15);
pub const LEVEL: HI8 = c(TEAL, 12);
pub const LEVEL_HOT: HI8 = c(AMBER, 14);
pub const WARN: HI8 = c(RED, 14);
pub const GOOD: HI8 = c(TEAL, 14);
