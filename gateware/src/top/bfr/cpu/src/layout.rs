//! Geometry of the round UI (a 720 px circular panel), in pixels relative to
//! the screen's centre (x right, y down).
//!
//! A ring of cells (type, preset, the type's parameters, setup) runs
//! clockwise from the top; inside it the hub shows the type, the preset, the
//! selected item and its description, the control voltages and a status
//! line. Every line of hub text is cut to the hub circle's width at its
//! height (`chars_fit`), so nothing runs off the round screen or into a cell.

use crate::math;

pub use crate::dial::{DIAL_IN, DIAL_OUT, DIAL_START, DIAL_SWEEP, NEEDLE_IN, NEEDLE_OUT, NOTCH_IN,
                      NOTCH_OUT};

/// Radius of the panel.
pub const SCREEN_R: i32 = 360;
/// Radius of the ring of cells (their centres).
pub const RING_R: i32 = 276;
/// Radius inside which the hub's text stays.
pub const HUB_R: i32 = 212;

#[derive(Clone, Copy, PartialEq, Eq, Debug)]
pub struct Font {
    pub w: i32,
    pub h: i32,
}

/// Values and the type's name; labels and the description; status.
pub const BIG: Font = Font { w: 10, h: 20 };
pub const TEXT: Font = Font { w: 7, h: 13 };
pub const SMALL: Font = Font { w: 6, h: 10 };

/// A cell, relative to its centre: label (TEXT) on top, the dial (`dial`:
/// a 4 pixel ring, its needle and CV notch), value (TEXT) below, on a
/// second line too if it is longer than a line (`cell_lines`: a preset's
/// name).
pub const CELL_CHARS: usize = 9;
pub const LABEL_DY: i32 = -46;
pub const VALUE_DY: i32 = 25;
pub const VALUE_PITCH: i32 = 14;
/// The modulation badges ("1", "2" for the CVs, "f" for the followers,
/// SMALL) in the dial's bottom gap: left edges, top.
pub const BADGE_DX: [i32; 3] = [-9, -3, 3];
pub const BADGE_DY: i32 = 11;
pub const CELL_HALF_W: i32 = (CELL_CHARS as i32 * TEXT.w + 1) / 2;
pub const CELL_TOP: i32 = LABEL_DY;
pub const CELL_BOTTOM: i32 = VALUE_DY + VALUE_PITCH + TEXT.h;

/// Most cells on the ring (2 + parameters + 1).
pub const MAX_CELLS: usize = 15;

/// Hub lines: the top of each, and its font.
pub const TITLE_Y: i32 = -150;
pub const PRESET_Y: i32 = -122;
pub const SEL_LABEL_Y: i32 = -84;
pub const SEL_VALUE_Y: i32 = -66;
pub const HELP_Y: i32 = -30;
pub const HELP_PITCH: i32 = 17;
pub const HELP_LINES: usize = 6;
pub const CV_Y: i32 = 100;
pub const STATUS_Y: i32 = 118;

/// Centre of cell `k` of `n`.
pub fn cell_centre(k: usize, n: usize) -> (i32, i32) {
    let a = -0.5 * core::f64::consts::PI + 2.0 * core::f64::consts::PI * k as f64 / n.max(1) as f64;
    (round(RING_R as f64 * math::cos(a)), round(RING_R as f64 * math::sin(a)))
}

/// A point at position `t` (0..1) of a dial's sweep, at radius `r`, relative
/// to the dial's centre.
pub fn dial_point(t: f64, r: i32) -> (i32, i32) {
    let a = DIAL_START + DIAL_SWEEP * t.clamp(0.0, 1.0);
    (round(r as f64 * math::cos(a)), round(r as f64 * math::sin(a)))
}

/// How many characters of `font` fit on a line whose top is at `y`, inside
/// a circle of radius `r` (centred on the screen).
pub fn chars_fit(font: Font, y: i32, r: i32) -> usize {
    let far = y.abs().max((y + font.h).abs());
    if far >= r {
        return 0;
    }
    let half = math::sqrt((r * r - far * far) as f64);
    ((2.0 * half) as i32 / font.w).max(0) as usize
}

/// Characters of a hub line (inside the hub circle).
pub fn hub_chars(font: Font, y: i32) -> usize {
    chars_fit(font, y, HUB_R)
}

/// A cell's value as its two lines: as is if it fits one, else broken at
/// the last space that fits (each line cut to `CELL_CHARS`).
pub fn cell_lines(s: &str) -> (&str, &str) {
    let (first, rest) = split_at_word(s.trim(), CELL_CHARS);
    (first, &rest[..floor_boundary(rest, rest.len().min(CELL_CHARS))])
}

/// Wraps `text` at spaces into `out`, line `i` at most `widths[i]` characters
/// (a word longer than its line is cut). Returns the number of lines; text
/// that doesn't fit ends the last line with "..".
pub fn wrap<'a>(text: &'a str, widths: &[usize], out: &mut [(&'a str, bool)]) -> usize {
    let mut rest = text.trim();
    let mut n = 0;
    let lines = widths.len().min(out.len());
    while !rest.is_empty() && n < lines {
        let w = widths[n].max(3);
        let (line, tail) = split_at_word(rest, w);
        rest = tail;
        out[n] = if n + 1 == lines && !rest.is_empty() {
            (split_at_word(line, w - 2).0, true)
        } else {
            (line, false)
        };
        n += 1;
    }
    n
}

/// The longest start of `s` up to `w` characters ending at a word (or cut
/// at `w` if the first word is longer), and the rest after the space.
fn split_at_word(s: &str, w: usize) -> (&str, &str) {
    if s.len() <= w {
        return (s.trim_end(), "");
    }
    let lim = floor_boundary(s, w + 1);
    let cut = match s[..lim].rfind(' ') {
        Some(i) if i > 0 => i,
        _ => floor_boundary(s, w),
    };
    (s[..cut].trim_end(), s[cut..].trim_start())
}

fn floor_boundary(s: &str, mut i: usize) -> usize {
    while i > 0 && !s.is_char_boundary(i) {
        i -= 1;
    }
    i
}

fn round(x: f64) -> i32 {
    math::floor(x + 0.5) as i32
}

#[cfg(test)]
mod tests {
    use super::*;

    /// Cell k's box: (left, top, right, bottom).
    fn cell_box(k: usize, n: usize) -> (i32, i32, i32, i32) {
        let (x, y) = cell_centre(k, n);
        (x - CELL_HALF_W, y + CELL_TOP, x + CELL_HALF_W, y + CELL_BOTTOM)
    }

    fn dist2(x: i32, y: i32) -> i64 {
        (x as i64).pow(2) + (y as i64).pow(2)
    }

    #[test]
    fn cells_fit_the_screen_and_miss_the_hub_and_each_other() {
        for n in 4..=MAX_CELLS {
            for k in 0..n {
                let (l, t, r, b) = cell_box(k, n);
                for (x, y) in [(l, t), (r, t), (l, b), (r, b)] {
                    assert!(dist2(x, y) < ((SCREEN_R - 4) as i64).pow(2), "cell {k}/{n} off screen");
                }
                // the box's nearest point to the centre is outside the hub
                let nx = 0.clamp(l, r);
                let ny = 0.clamp(t, b);
                assert!(dist2(nx, ny) > (HUB_R as i64).pow(2), "cell {k}/{n} in the hub");
                for j in 0..k {
                    let (l2, t2, r2, b2) = cell_box(j, n);
                    assert!(r < l2 || r2 < l || b < t2 || b2 < t, "cells {j} and {k} of {n} overlap");
                }
            }
        }
    }

    #[test]
    fn long_values_break_at_a_space() {
        assert_eq!(cell_lines("1.25 s"), ("1.25 s", ""));
        assert_eq!(cell_lines("Bright plate"), ("Bright", "plate"));
        assert_eq!(cell_lines("Dark when bright"), ("Dark when", "bright"));
        assert_eq!(cell_lines("Envelope filter"), ("Envelope", "filter"));
        assert_eq!(cell_lines("Exactly 9"), ("Exactly 9", ""));
        assert_eq!(cell_lines("Supercalifragilistic"), ("Supercali", "fragilist"));
    }

    #[test]
    fn dial_and_notch_fit_between_label_and_value() {
        let notch = NOTCH_OUT.ceil() as i32;
        assert!(LABEL_DY + TEXT.h < -notch, "label over the notch at the top");
        assert!(notch <= CELL_HALF_W, "notch wider than the cell");
        // the lowest the notch reaches: the sweep's ends, 45 degrees down
        let low = (NOTCH_OUT * core::f64::consts::FRAC_1_SQRT_2).ceil() as i32;
        assert!(low < VALUE_DY && DIAL_OUT < VALUE_DY, "value under the dial");
        // the badges sit in the gap, clear of the needle at either end
        for dx in BADGE_DX {
            for (x, y) in [(dx, BADGE_DY), (dx + SMALL.w, BADGE_DY), (dx, BADGE_DY + SMALL.h),
                           (dx + SMALL.w, BADGE_DY + SMALL.h)] {
                assert!(y as f64 > (x as f64).abs(), "badge corner ({x},{y}) outside the gap");
            }
        }
        assert!(BADGE_DY + SMALL.h < VALUE_DY);
    }

    #[test]
    fn hub_lines_are_inside_the_hub() {
        let lines = [(BIG, TITLE_Y), (TEXT, PRESET_Y), (TEXT, SEL_LABEL_Y), (BIG, SEL_VALUE_Y),
                     (SMALL, CV_Y), (SMALL, STATUS_Y)];
        for (font, y) in lines {
            assert!(hub_chars(font, y) >= 20, "line at {y} too short");
        }
        for i in 0..HELP_LINES {
            assert!(hub_chars(TEXT, HELP_Y + HELP_PITCH * i as i32) >= 40);
        }
        // a full line's half width at its worst edge is inside the hub
        let w = hub_chars(TEXT, HELP_Y) as i32 * TEXT.w / 2;
        assert!(dist2(w, HELP_Y) <= (HUB_R as i64).pow(2));
        assert_eq!(chars_fit(TEXT, SCREEN_R, SCREEN_R), 0);
    }

    #[test]
    fn dial_runs_clockwise_through_the_top() {
        let (x0, y0) = dial_point(0.0, 100);
        let (xm, ym) = dial_point(0.5, 100);
        let (x1, y1) = dial_point(1.0, 100);
        assert!(x0 < 0 && y0 > 0, "starts bottom left");
        assert!(xm.abs() <= 1 && ym == -100, "middle at the top");
        assert!(x1 > 0 && y1 > 0, "ends bottom right");
    }

    #[test]
    fn wrapping() {
        let mut out = [("", false); 3];
        let n = wrap("Energy kept on each trip round the plate: higher rings longer.", &[20, 20, 20], &mut out);
        assert_eq!(n, 3);
        assert_eq!(out[0], ("Energy kept on each", false));
        assert_eq!(out[1], ("trip round the", false));
        assert_eq!(out[2], ("plate: higher", true));
        let n = wrap("one two three four five six seven", &[10, 10], &mut out);
        assert_eq!(n, 2);
        assert_eq!(out[0], ("one two", false));
        assert_eq!(out[1].1, true, "cut short");
        assert!(out[1].0.len() <= 8);
        let n = wrap("short", &[20, 20], &mut out);
        assert_eq!((n, out[0]), (1, ("short", false)));
        let n = wrap("abcdefghijklmnop", &[5, 20], &mut out);
        assert_eq!((n, out[0].0, out[1].0), (2, "abcde", "fghijklmnop"));
    }
}
