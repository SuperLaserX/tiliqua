//! The Fairlight's green phosphor, with amber for warnings and for the negative
//! half of bipolar values.
//!
//! The framebuffer's pixels are a 4-bit hue and a 4-bit intensity; the palette
//! maps each pair to RGB. Each hue is one colour with the intensity a brightness
//! ramp of it (intensity 0 is black).

use tiliqua_hal::dma_framebuffer::DMAFramebuffer;
use tiliqua_lib::color::HI8;

pub const PHOSPHOR: u8 = 0;
pub const AMBER: u8 = 1;
pub const WHITE: u8 = 2;

/// Full-intensity RGB of each hue (the unused ones are phosphor).
const HUES: [(u8, u8, u8); 3] = [
    (46, 232, 158),  // phosphor, from the CMI's page D
    (255, 176, 40),  // amber
    (226, 255, 240), // green-tinted white
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
pub const TITLE: HI8 = c(PHOSPHOR, 15);
pub const TEXT: HI8 = c(PHOSPHOR, 12);
pub const DIM: HI8 = c(PHOSPHOR, 8);
pub const RIM: HI8 = c(PHOSPHOR, 5);
pub const MARK: HI8 = c(PHOSPHOR, 15);
pub const SELECTED: HI8 = c(WHITE, 15);
pub const POSITIVE: HI8 = c(PHOSPHOR, 13);
pub const NEGATIVE: HI8 = c(AMBER, 13);
pub const WARN: HI8 = c(AMBER, 15);
