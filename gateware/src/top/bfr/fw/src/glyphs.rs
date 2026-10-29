//! Text for the UI: three embedded-graphics fonts in one 1bpp spritesheet for
//! the framebuffer blitter, uploaded once at boot (swapping sheets would
//! wait for every pending blit). Each face holds printable ASCII and a solid
//! cell, blitted in black to erase text.
//!
//! The blitter's source coordinates are 8 bits, so the sheet is 256 pixels
//! wide and every cell starts inside it.

use tiliqua_hal::embedded_graphics::{
    mono_font::{ascii::{FONT_10X20, FONT_6X10, FONT_7X13}, MonoFont, MonoTextStyle},
    pixelcolor::BinaryColor,
    prelude::*,
    text::{Baseline, Text},
};
use tiliqua_lib::color::HI8;

use bfr_cpu::layout::{self, Font};

pub const SHEET_W: u32 = 256;
/// Glyphs per face: 0x20..0x7E, then the solid cell.
const N_GLYPHS: u32 = 96;
const SOLID: u32 = N_GLYPHS - 1;

#[derive(Clone, Copy, PartialEq, Eq, Debug)]
pub enum Face {
    Big,
    Text,
    Small,
}

impl Face {
    const ALL: [Face; 3] = [Face::Big, Face::Text, Face::Small];

    pub const fn font(self) -> Font {
        match self {
            Face::Big => layout::BIG,
            Face::Text => layout::TEXT,
            Face::Small => layout::SMALL,
        }
    }

    fn mono(self) -> &'static MonoFont<'static> {
        match self {
            Face::Big => &FONT_10X20,
            Face::Text => &FONT_7X13,
            Face::Small => &FONT_6X10,
        }
    }

    const fn per_row(self) -> u32 {
        SHEET_W / self.font().w as u32
    }

    const fn rows(self) -> u32 {
        (N_GLYPHS + self.per_row() - 1) / self.per_row()
    }

    /// First sheet row of this face.
    const fn top(self) -> u32 {
        match self {
            Face::Big => 0,
            Face::Text => Face::Big.top() + Face::Big.rows() * Face::Big.font().h as u32,
            Face::Small => Face::Text.top() + Face::Text.rows() * Face::Text.font().h as u32,
        }
    }

    /// Source rectangle origin of glyph `g`.
    fn src(self, g: u32) -> (u32, u32) {
        let f = self.font();
        (g % self.per_row() * f.w as u32, self.top() + g / self.per_row() * f.h as u32)
    }
}

pub const SHEET_H: u32 = Face::Small.top() + Face::Small.rows() * layout::SMALL.h as u32;
pub const SHEET_BYTES: usize = (SHEET_W * SHEET_H / 8) as usize;
const _: () = assert!(SHEET_H <= 256 && SHEET_BYTES <= 8192);

const KEY: u32 = 0x6266_7201;

/// Draws one glyph's pixels into the sheet (an embedded-graphics target).
struct Cell<'a> {
    bytes: &'a mut [u8],
    x: u32,
    y: u32,
    w: u32,
    h: u32,
}

impl OriginDimensions for Cell<'_> {
    fn size(&self) -> Size {
        Size::new(self.w, self.h)
    }
}

impl DrawTarget for Cell<'_> {
    type Color = BinaryColor;
    type Error = core::convert::Infallible;

    fn draw_iter<I>(&mut self, pixels: I) -> Result<(), Self::Error>
    where
        I: IntoIterator<Item = Pixel<Self::Color>>,
    {
        for Pixel(p, c) in pixels {
            if c == BinaryColor::On && p.x >= 0 && p.y >= 0 && (p.x as u32) < self.w
                && (p.y as u32) < self.h {
                set(self.bytes, self.x + p.x as u32, self.y + p.y as u32);
            }
        }
        Ok(())
    }
}

fn set(bytes: &mut [u8], x: u32, y: u32) {
    let bit = (y * SHEET_W + x) as usize;
    bytes[bit >> 3] |= 0x80 >> (bit & 7);
}

pub struct Glyphs {
    bytes: &'static mut [u8; SHEET_BYTES],
}

impl Glyphs {
    /// Renders every face into `buf`.
    pub fn new(buf: &'static mut [u8; SHEET_BYTES]) -> Self {
        buf.fill(0);
        for face in Face::ALL {
            let f = face.font();
            let style = MonoTextStyle::new(face.mono(), BinaryColor::On);
            for g in 0..N_GLYPHS {
                let (x, y) = face.src(g);
                if g == SOLID {
                    for dy in 0..f.h as u32 {
                        for dx in 0..f.w as u32 {
                            set(&mut buf[..], x + dx, y + dy);
                        }
                    }
                    continue;
                }
                let mut ch = [0u8; 4];
                let s = char::from(0x20 + g as u8).encode_utf8(&mut ch);
                let mut cell = Cell { bytes: &mut buf[..], x, y, w: f.w as u32, h: f.h as u32 };
                Text::with_baseline(s, Point::zero(), style, Baseline::Top).draw(&mut cell).ok();
            }
        }
        Glyphs { bytes: buf }
    }

    /// Loads the sheet into the blitter (once: the key never changes).
    pub fn upload<D: DrawTarget<Color = HI8>>(&self, d: &mut D) -> bool {
        d.upload_spritesheet(KEY, &self.bytes[..], SHEET_W, SHEET_H, 1)
    }
}

fn glyph(c: u8) -> Option<u32> {
    match c {
        0x21..=0x7E => Some((c - 0x20) as u32),
        _ => None,
    }
}

/// Width in pixels of `n` characters of `face`.
pub fn width(face: Face, n: usize) -> i32 {
    n as i32 * face.font().w
}

/// Draws `text` with its top left at (x, y). Characters outside printable
/// ASCII are skipped (as spaces).
pub fn draw<D: DrawTarget<Color = HI8>>(d: &mut D, face: Face, x: i32, y: i32, text: &str, color: HI8) {
    let f = face.font();
    for (i, c) in text.bytes().enumerate() {
        if let Some(g) = glyph(c) {
            let (sx, sy) = face.src(g);
            d.blit_sprite(KEY, sx, sy, f.w as u32, f.h as u32, x + i as i32 * f.w, y, color);
        }
    }
}

/// Blanks `n` character cells of `face` from (x, y).
pub fn erase<D: DrawTarget<Color = HI8>>(d: &mut D, face: Face, x: i32, y: i32, n: usize) {
    let f = face.font();
    let (sx, sy) = face.src(SOLID);
    for i in 0..n as i32 {
        d.blit_sprite(KEY, sx, sy, f.w as u32, f.h as u32, x + i * f.w, y, HI8::BLACK);
    }
}
