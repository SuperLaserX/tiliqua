//! The looks. A theme is a ground colour, five colours drawn on it, and a bezel round the rim.
//!
//! The framebuffer's pixels are a 4-bit hue and a 4-bit intensity; the palette maps each pair to
//! RGB. Here every hue's intensities run from the theme's ground (intensity 0) to its full colour
//! (15), so something drawn faint fades into the ground rather than into black, and the screen's
//! clear and every erase (intensity 0) are the ground. The roles below (text, the accent, levels...)
//! are the same in every theme; only the colours change, so switching is a palette write and a
//! redraw for the bezel.

use tiliqua_hal::dma_framebuffer::DMAFramebuffer;
use tiliqua_hal::embedded_graphics::prelude::*;
use tiliqua_lib::color::HI8;

use nam_cpu::controls::THEMES;
use nam_cpu::geometry::polar;
use nam_cpu::layout::{rim_part, Arc, RIM as RIM_ARC};
use nam_cpu::nav::Page;

use crate::screen::paint_arc;

pub const SLATE: u8 = 0;
pub const ICE: u8 = 1;
pub const AMBER: u8 = 2;
pub const TEAL: u8 = 3;
pub const RED: u8 = 4;

type Rgb = (u8, u8, u8);

/// How a theme dresses the rim.
#[derive(Clone, Copy, PartialEq, Eq, Debug)]
pub enum Bezel {
    /// A thin ring.
    Plain,
    /// Two rings, close.
    Double,
    /// A ring with a tick every 6 degrees and a longer one every 30, like a knob's skirt.
    Ticks,
    /// A ring that glows inward in the accent's colour.
    Glow,
}

pub struct Theme {
    pub ground: Rgb,
    /// The full colours of slate (structure, dim text), ice (text), amber (the accent),
    /// teal (levels, good) and red (warnings).
    pub hues: [Rgb; 5],
    pub bezel: Bezel,
}

/// In `nam_cpu::controls::THEMES`'s order.
pub const ALL: [Theme; 17] = [
    // SLATE: cool white on a blue-black ground, amber for what the encoder is on.
    Theme { ground: (6, 8, 14), hues: [(150, 170, 200), (236, 242, 255), (255, 170, 50), (70, 220, 190), (255, 70, 60)],
            bezel: Bezel::Plain },
    // TWEED: cream and gold on a warm brown, like an old combo's panel.
    Theme { ground: (26, 16, 8), hues: [(176, 146, 104), (246, 232, 200), (232, 172, 64), (156, 204, 96), (232, 76, 44)],
            bezel: Bezel::Double },
    // NEON: magenta and cyan on deep violet.
    Theme { ground: (8, 3, 22), hues: [(130, 96, 210), (228, 222, 255), (255, 64, 204), (48, 232, 255), (255, 64, 96)],
            bezel: Bezel::Glow },
    // PHOSPHOR: a green screen.
    Theme { ground: (2, 10, 4), hues: [(60, 140, 72), (150, 255, 160), (224, 255, 120), (80, 255, 128), (255, 150, 48)],
            bezel: Bezel::Ticks },
    // STAGE: white on black, red for what the encoder is on, yellow levels.
    Theme { ground: (0, 0, 0), hues: [(150, 150, 150), (255, 255, 255), (255, 52, 40), (244, 230, 64), (255, 128, 0)],
            bezel: Bezel::Ticks },
    // AMBER: an amber terminal.
    Theme { ground: (16, 7, 0), hues: [(150, 84, 16), (255, 186, 72), (255, 240, 190), (255, 140, 20), (255, 64, 40)],
            bezel: Bezel::Ticks },
    // OCEAN: pale blue on deep navy, coral for what the encoder is on, aqua levels.
    Theme { ground: (2, 12, 30), hues: [(64, 116, 168), (212, 236, 255), (255, 128, 96), (40, 220, 220), (255, 64, 96)],
            bezel: Bezel::Double },
    // GLACIER: ice white on blue-grey, sky blue and mint.
    Theme { ground: (14, 22, 32), hues: [(104, 134, 160), (226, 244, 255), (120, 200, 255), (150, 255, 210), (255, 100, 120)],
            bezel: Bezel::Plain },
    // FOREST: parchment on a dark green, honey and leaf.
    Theme { ground: (6, 16, 8), hues: [(104, 140, 96), (232, 240, 212), (244, 190, 80), (128, 224, 96), (244, 84, 52)],
            bezel: Bezel::Double },
    // COPPER: warm white on dark bronze, copper and verdigris.
    Theme { ground: (22, 11, 5), hues: [(164, 104, 72), (255, 228, 204), (236, 128, 64), (96, 204, 184), (255, 64, 40)],
            bezel: Bezel::Ticks },
    // CRIMSON: rose white on a dark wine, gold, orchid levels.
    Theme { ground: (22, 2, 6), hues: [(156, 84, 96), (255, 228, 226), (255, 200, 72), (240, 128, 176), (255, 96, 0)],
            bezel: Bezel::Glow },
    // SUNSET: cream on plum, orange and a twilight blue.
    Theme { ground: (26, 8, 22), hues: [(172, 104, 128), (255, 236, 214), (255, 128, 48), (140, 196, 255), (255, 48, 112)],
            bezel: Bezel::Glow },
    // ROYAL: white on indigo, gold and lavender.
    Theme { ground: (10, 6, 32), hues: [(128, 120, 204), (240, 236, 255), (255, 208, 80), (156, 140, 255), (255, 72, 96)],
            bezel: Bezel::Plain },
    // GRAPHITE: a neutral dark grey, orange and blue, like a studio rack.
    Theme { ground: (30, 30, 33), hues: [(124, 124, 130), (238, 238, 238), (255, 144, 0), (0, 196, 255), (255, 56, 56)],
            bezel: Bezel::Double },
    // FOG: ink on a soft grey, between the dark grounds and paper (colours dark enough that
    // their faint intensities still show on it).
    Theme { ground: (156, 158, 162), hues: [(40, 46, 60), (14, 18, 26), (168, 64, 0), (0, 92, 80), (160, 20, 20)],
            bezel: Bezel::Double },
    // SAND: brown ink on warm sand, lighter than FOG and short of paper.
    Theme { ground: (180, 166, 138), hues: [(52, 42, 28), (28, 22, 14), (156, 52, 16), (16, 92, 104), (168, 16, 16)],
            bezel: Bezel::Double },
    // DAYLIGHT: ink on paper, for a bright room.
    Theme { ground: (232, 226, 212), hues: [(84, 90, 108), (20, 24, 32), (204, 88, 0), (0, 124, 104), (200, 30, 30)],
            bezel: Bezel::Double },
];

const _: () = assert!(ALL.len() == THEMES.len());

fn ramp(i: u8) -> u32 {
    // how far from the ground, in thousandths: mostly quadratic (perceptual), with a linear
    // part so the low intensities stay visible
    let t = i as u32;
    800 * t * t / 225 + 200 * t / 15
}

fn mix(ground: Rgb, color: Rgb, k: u32) -> Rgb {
    let m = |g: u8, c: u8| (g as i32 + (c as i32 - g as i32) * k as i32 / 1000).clamp(0, 255) as u8;
    (m(ground.0, color.0), m(ground.1, color.1), m(ground.2, color.2))
}

/// Writes theme `t` into the hardware palette.
#[inline(never)]
pub fn write_palette(d: &mut impl DMAFramebuffer, t: usize) {
    let theme = &ALL[t % ALL.len()];
    for hue in 0..16u8 {
        let color = theme.hues.get(hue as usize).copied().unwrap_or(theme.hues[0]);
        for i in 0..16u8 {
            let (r, g, b) = mix(theme.ground, color, ramp(i));
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

/// The colour of the rim's ring, and of a page's part of it when not lit, in theme `t`.
pub fn ring(t: usize) -> HI8 {
    match ALL[t % ALL.len()].bezel {
        Bezel::Plain => PANEL,
        Bezel::Double | Bezel::Ticks => RIM,
        Bezel::Glow => c(AMBER, 6),
    }
}

/// The bezel of theme `t`, drawn after the screen clears, with `page`'s part of the rim lit
/// (none for the switcher, which lights its own).
#[inline(never)]
pub fn bezel<D: DrawTarget<Color = HI8>>(d: &mut D, cx: i32, cy: i32, t: usize, page: Option<Page>) {
    let theme = &ALL[t % ALL.len()];
    let base = ring(t);
    match theme.bezel {
        Bezel::Plain => paint_arc(d, cx, cy, &RIM_ARC, base),
        Bezel::Double => {
            paint_arc(d, cx, cy, &RIM_ARC, base);
            paint_arc(d, cx, cy, &Arc { radius: RIM_ARC.radius - 4, ..RIM_ARC }, PANEL);
        }
        Bezel::Ticks => {
            paint_arc(d, cx, cy, &RIM_ARC, base);
            for k in 0..60 {
                let long = k % 5 == 0;
                let turns = k as f32 / 60.0;
                let (x0, y0) = polar((RIM_ARC.radius - if long { 8 } else { 5 }) as f32, turns);
                let (x1, y1) = polar((RIM_ARC.radius - 1) as f32, turns);
                d.draw_line_solid(cx + x0, cy + y0, cx + x1, cy + y1, 1, if long { RIM } else { PANEL });
            }
        }
        Bezel::Glow => {
            for (k, i) in [10u8, 6, 3, 2, 1].iter().enumerate() {
                paint_arc(d, cx, cy, &Arc { radius: RIM_ARC.radius - k as i32, ..RIM_ARC }, c(AMBER, *i));
            }
        }
    }
    if let Some(p) = page {
        paint_arc(d, cx, cy, &rim_part(p.index(), Page::ALL.len()), lit(t));
    }
}

/// A page's part of the rim, lit.
pub fn lit(t: usize) -> HI8 {
    match ALL[t % ALL.len()].bezel {
        Bezel::Glow => c(AMBER, 15),
        _ => c(SLATE, 9),
    }
}
