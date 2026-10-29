//! Dot-matrix glyphs in the style of the H3000's HD44780 LCD, as one 1bpp
//! spritesheet for the framebuffer blitter. Used for the LCD itself and for
//! all panel labels, so drawing never has to swap spritesheets.
//!
//! Each character is 5 x 8 dots; a dot is `DOT` x `DOT` pixels on a
//! `PITCH` pixel grid. The sheet holds printable ASCII (from the
//! embedded-graphics 5x8 font), the 8 user-defined CGRAM characters (kept in
//! sync with the emulated LCD), and a few extra symbols.

use tiliqua_hal::embedded_graphics::{
    mono_font::{ascii::FONT_5X8, MonoTextStyle},
    pixelcolor::BinaryColor,
    prelude::*,
    text::{Baseline, Text},
};

pub const DOT: u32 = 2;
pub const PITCH: u32 = 3;
/// Glyph size in pixels.
pub const GLYPH_W: u32 = 5 * PITCH - (PITCH - DOT);
pub const GLYPH_H: u32 = 8 * PITCH - (PITCH - DOT);
/// Glyph cell in the sheet.
const CELL_W: u32 = 5 * PITCH;
const CELL_H: u32 = 8 * PITCH;
const PER_ROW: u32 = 16;
const ROWS: u32 = 7;
pub const SHEET_W: u32 = CELL_W * PER_ROW;
pub const SHEET_H: u32 = CELL_H * ROWS;
pub const SHEET_BYTES: usize = (SHEET_W * SHEET_H / 8) as usize;

// Glyph indices in the sheet.
const G_ASCII: u8 = 0; // 0x20..0x7F
const G_CGRAM: u8 = 96; // 8 user characters
const G_BLOCK: u8 = 104;
const G_DEGREE: u8 = 105;
/// Every dot lit: the unlit background of an LCD character cell.
pub const G_ALL: u8 = 106;
const G_MIDDOT: u8 = 107;
const G_UP: u8 = 108;
const G_DOWN: u8 = 109;
/// The cursor underline (dot row 7).
pub const G_CURSOR: u8 = 110;

/// Character codes for panel labels beyond ASCII.
pub const CH_LEFT: u8 = 0x7F;
pub const CH_RIGHT: u8 = 0x7E;
pub const CH_UP: u8 = 0x80;
pub const CH_DOWN: u8 = 0x81;

pub struct Sheet {
    bytes: &'static mut [u8; SHEET_BYTES],
    cgram: [u8; 64],
    /// Changes whenever the contents change, so the blitter reloads it.
    key: u32,
}

/// Records the pixels of one 5x8 character.
struct Recorder {
    rows: [u8; 8],
}

impl OriginDimensions for Recorder {
    fn size(&self) -> Size {
        Size::new(5, 8)
    }
}

impl DrawTarget for Recorder {
    type Color = BinaryColor;
    type Error = core::convert::Infallible;

    fn draw_iter<I>(&mut self, pixels: I) -> Result<(), Self::Error>
    where
        I: IntoIterator<Item = Pixel<Self::Color>>,
    {
        for Pixel(p, c) in pixels {
            if c == BinaryColor::On && (0..5).contains(&p.x) && (0..8).contains(&p.y) {
                self.rows[p.y as usize] |= 0x10 >> p.x;
            }
        }
        Ok(())
    }
}

fn font_rows(c: u8) -> [u8; 8] {
    let mut r = Recorder { rows: [0; 8] };
    let mut buf = [0u8; 4];
    let s = (c as char).encode_utf8(&mut buf);
    let style = MonoTextStyle::new(&FONT_5X8, BinaryColor::On);
    Text::with_baseline(s, Point::zero(), style, Baseline::Top).draw(&mut r).ok();
    r.rows
}

impl Sheet {
    /// `buf` must stay valid for the lifetime of the program; it may be in
    /// any memory (it is copied into the blitter's own memory).
    pub fn new(buf: &'static mut [u8; SHEET_BYTES]) -> Self {
        buf.fill(0);
        let mut s = Sheet { bytes: buf, cgram: [0; 64], key: 0x4833_0000 };
        for c in 0x20u8..0x7E {
            s.set_glyph(G_ASCII + (c - 0x20), font_rows(c));
        }
        // HD44780 ROM arrows at 0x7E/0x7F.
        s.set_glyph(G_ASCII + (CH_RIGHT - 0x20), [0x00, 0x04, 0x02, 0x1F, 0x02, 0x04, 0x00, 0x00]);
        s.set_glyph(G_ASCII + (CH_LEFT - 0x20), [0x00, 0x04, 0x08, 0x1F, 0x08, 0x04, 0x00, 0x00]);
        s.set_glyph(G_BLOCK, [0x1F; 8]);
        s.set_glyph(G_DEGREE, [0x1C, 0x14, 0x1C, 0x00, 0x00, 0x00, 0x00, 0x00]);
        s.set_glyph(G_ALL, [0x1F; 8]);
        s.set_glyph(G_MIDDOT, [0x00, 0x00, 0x00, 0x0C, 0x0C, 0x00, 0x00, 0x00]);
        s.set_glyph(G_UP, [0x00, 0x04, 0x0E, 0x1F, 0x04, 0x04, 0x04, 0x00]);
        s.set_glyph(G_DOWN, [0x00, 0x04, 0x04, 0x04, 0x1F, 0x0E, 0x04, 0x00]);
        s.set_glyph(G_CURSOR, [0, 0, 0, 0, 0, 0, 0, 0x1F]);
        for n in 0..8 {
            s.set_glyph(G_CGRAM + n, [0; 8]);
        }
        s
    }

    fn set_glyph(&mut self, index: u8, rows: [u8; 8]) {
        let gx = (index as u32 % PER_ROW) * CELL_W;
        let gy = (index as u32 / PER_ROW) * CELL_H;
        for y in 0..CELL_H {
            for x in 0..CELL_W {
                self.put(gx + x, gy + y, false);
            }
        }
        for (ry, bits) in rows.iter().enumerate() {
            for cx in 0..5u32 {
                if bits & (0x10 >> cx) != 0 {
                    for dy in 0..DOT {
                        for dx in 0..DOT {
                            self.put(gx + cx * PITCH + dx, gy + ry as u32 * PITCH + dy, true);
                        }
                    }
                }
            }
        }
        self.key = self.key.wrapping_add(1);
    }

    fn put(&mut self, x: u32, y: u32, on: bool) {
        let bit = (y * SHEET_W + x) as usize;
        let mask = 0x80u8 >> (bit & 7);
        if on {
            self.bytes[bit >> 3] |= mask;
        } else {
            self.bytes[bit >> 3] &= !mask;
        }
    }

    /// Update the user-defined characters from the LCD's CGRAM.
    pub fn sync_cgram(&mut self, cgram: &[u8; 64]) {
        if &self.cgram == cgram {
            return;
        }
        self.cgram = *cgram;
        for n in 0..8u8 {
            let mut rows = [0u8; 8];
            for (r, row) in rows.iter_mut().enumerate() {
                *row = cgram[n as usize * 8 + r] & 0x1F;
            }
            self.set_glyph(G_CGRAM + n, rows);
        }
    }

    pub fn key(&self) -> u32 {
        self.key
    }

    pub fn bytes(&self) -> &[u8] {
        &self.bytes[..]
    }

    /// Sheet glyph for an LCD character code (or a panel label code).
    pub fn glyph(code: u8) -> Option<u8> {
        match code {
            0x00..=0x0F => Some(G_CGRAM + (code & 7)),
            0x20 => None,
            0x21..=0x7F => Some(G_ASCII + (code - 0x20)),
            CH_UP => Some(G_UP),
            CH_DOWN => Some(G_DOWN),
            0xA5 => Some(G_MIDDOT),
            0xDF => Some(G_DEGREE),
            0xFF => Some(G_BLOCK),
            _ => None,
        }
    }

    /// Source rectangle (x, y) of a glyph in the sheet.
    pub fn src(glyph: u8) -> (u32, u32) {
        ((glyph as u32 % PER_ROW) * CELL_W, (glyph as u32 / PER_ROW) * CELL_H)
    }
}
