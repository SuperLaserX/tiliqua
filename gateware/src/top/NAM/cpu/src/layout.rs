//! Where things go on the round screens, relative to the centre (y down). Tested to fit the glass,
//! with no text over other text or over an arc.

use crate::controls::{Setting, ToneSetting, METER_SEGMENTS};
use crate::geometry::{polar, Font, Rect, Walk, BIG, RADIUS, SMALL, TEXT};
use crate::nav::Page;

/// An arc of the round screen: a gauge or the rim.
#[derive(Clone, Copy, PartialEq, Debug)]
pub struct Arc {
    pub radius: i32,
    /// Radii drawn, inward from `radius`.
    pub thick: i32,
    /// Where it starts and ends, in turns clockwise from 12 o'clock. Its value runs this way.
    pub from: f32,
    pub to: f32,
    pub segments: usize,
}

impl Arc {
    pub fn point(&self, radius: i32, segment: usize) -> (i32, i32) {
        polar(radius as f32, self.from + (self.to - self.from) * segment as f32 / self.segments as f32)
    }

    /// A walk along it, a segment at a step.
    pub fn walk(&self) -> Walk {
        Walk::new(self.from, (self.to - self.from) / self.segments as f32)
    }

    /// Whether the point (x, y) is on it or within `clear` pixels of it.
    pub fn near(&self, x: i32, y: i32, clear: i32) -> bool {
        let (r2, inner, outer) = (x * x + y * y, self.radius - self.thick - clear, self.radius + clear);
        if r2 < inner * inner || r2 > outer * outer {
            return false;
        }
        // its angle in turns from 12 o'clock, clockwise
        let mut t = libm_atan2(x as f32, -y as f32) / core::f32::consts::TAU;
        if t < 0.0 {
            t += 1.0;
        }
        let (lo, hi) = if self.from < self.to { (self.from, self.to) } else { (self.to, self.from) };
        lo <= t && t <= hi
    }
}

/// atan2 to a thousandth of a radian, enough to tell which arc a point is by.
fn libm_atan2(y: f32, x: f32) -> f32 {
    let pi = core::f32::consts::PI;
    if x == 0.0 && y == 0.0 {
        return 0.0;
    }
    let (ax, ay) = (x.abs(), y.abs());
    let (a, swapped) = if ay > ax { (ax / ay, true) } else { (ay / ax, false) };
    // atan on [0, 1]
    let s = a * a;
    let mut r = a * (0.999_866 + s * (-0.330_299 + s * (0.180_141 + s * (-0.085_133 + s * 0.020_835))));
    if swapped {
        r = pi / 2.0 - r;
    }
    if x < 0.0 {
        r = pi - r;
    }
    if y < 0.0 { -r } else { r }
}

/// A line of text: its face, where its centre is, and the most characters it shows.
#[derive(Clone, Copy, PartialEq, Eq, Debug)]
pub struct Spot {
    pub font: Font,
    pub x: i32,
    pub y: i32,
    pub chars: usize,
    pub align: Align,
}

#[derive(Clone, Copy, PartialEq, Eq, Debug)]
pub enum Align {
    /// Centred on x.
    Centre,
    /// Ending at x.
    Right,
    /// Starting at x.
    Left,
}

impl Spot {
    pub const fn centre(font: Font, x: i32, y: i32, chars: usize) -> Spot {
        Spot { font, x, y, chars, align: Align::Centre }
    }

    /// Where `n` characters of it start (their left edge).
    pub const fn left(&self, n: usize) -> i32 {
        let w = self.font.w * n as i32;
        match self.align {
            Align::Centre => self.x - w / 2,
            Align::Right => self.x - w,
            Align::Left => self.x,
        }
    }

    /// The box of the most it shows.
    pub const fn rect(&self) -> Rect {
        Rect { x: self.left(self.chars), y: self.y - self.font.h / 2, w: self.font.w * self.chars as i32, h: self.font.h }
    }
}

// ---- Every screen ----

/// The rim: a thin ring, the page showing a brighter fifth of it.
pub const RIM: Arc = Arc { radius: RADIUS - 4, thick: 1, from: 0.0, to: 1.0, segments: 180 };

/// The rim's part for page `i` of `n`, centred on where the switcher puts the page.
pub fn rim_part(i: usize, n: usize) -> Arc {
    let c = i as f32 / n as f32;
    let half = 0.5 / n as f32 * 0.8;
    Arc { radius: RADIUS - 4, thick: 3, from: c - half, to: c + half, segments: 24 }
}

pub const HINT: Spot = Spot::centre(SMALL, 0, 206, 42);

// ---- Amp ----

pub const AMP_BRAND: Spot = Spot::centre(TEXT, 0, -282, 3);
pub const AMP_TITLE: Spot = Spot::centre(BIG, 0, -246, 46);
pub const AMP_ABOUT: Spot = Spot::centre(SMALL, 0, -216, 64);
pub const AMP_NETWORK: Spot = Spot::centre(SMALL, 0, -198, 48);
const AMP_ROW_TOP: i32 = -144;
const AMP_ROW_PITCH: i32 = 38;
/// Names end and values start this far either side of the centre line.
const AMP_GAP: i32 = 14;
pub const AMP_VALUE_CHARS: usize = 16;
pub const AMP_STATUS: Spot = Spot::centre(TEXT, 0, 66, 34);
pub const AMP_LEVELS: Spot = Spot::centre(SMALL, 0, 94, 48);

/// A setting's name, ending left of the centre line.
pub const fn amp_name(i: usize) -> Spot {
    Spot { font: TEXT, x: -AMP_GAP, y: AMP_ROW_TOP + AMP_ROW_PITCH * i as i32, chars: 11, align: Align::Right }
}

/// A setting's value, starting right of it.
pub const fn amp_value(i: usize) -> Spot {
    Spot { font: TEXT, x: AMP_GAP, y: AMP_ROW_TOP + AMP_ROW_PITCH * i as i32, chars: AMP_VALUE_CHARS, align: Align::Left }
}

/// The level meters, up the rim: the input on the left, the output on the right.
pub const METER_IN: Arc = Arc { radius: RADIUS - 14, thick: 8, from: 0.60, to: 0.85, segments: METER_SEGMENTS };
pub const METER_OUT: Arc = Arc { radius: RADIUS - 14, thick: 8, from: 0.40, to: 0.15, segments: METER_SEGMENTS };
/// Their names, under their lower ends.
pub const fn meter_label(output: bool) -> Spot {
    Spot::centre(TEXT, if output { 196 } else { -196 }, 214, 4)
}

// ---- Tone: six settings, closer together ----

const TONE_ROW_TOP: i32 = -160;
const TONE_ROW_PITCH: i32 = 30;

pub const fn tone_name(i: usize) -> Spot {
    Spot { font: TEXT, x: -AMP_GAP, y: TONE_ROW_TOP + TONE_ROW_PITCH * i as i32, chars: 11, align: Align::Right }
}

pub const fn tone_value(i: usize) -> Spot {
    Spot { font: TEXT, x: AMP_GAP, y: TONE_ROW_TOP + TONE_ROW_PITCH * i as i32, chars: AMP_VALUE_CHARS, align: Align::Left }
}

pub fn tone_spots() -> [Spot; 5 + 2 * ToneSetting::ALL.len() + 2] {
    let mut s = [HINT; 5 + 2 * ToneSetting::ALL.len() + 2];
    s[0] = AMP_BRAND;
    s[1] = AMP_TITLE;
    s[2] = AMP_ABOUT;
    s[3] = AMP_STATUS;
    s[4] = AMP_LEVELS;
    for i in 0..ToneSetting::ALL.len() {
        s[5 + 2 * i] = tone_name(i);
        s[6 + 2 * i] = tone_value(i);
    }
    s[5 + 2 * ToneSetting::ALL.len()] = meter_label(false);
    s[6 + 2 * ToneSetting::ALL.len()] = meter_label(true);
    s
}

// ---- System: the theme, then the figures ----

pub const SYSTEM_FIGURES: usize = 8;

pub const fn system_figure(i: usize) -> Spot {
    Spot::centre(TEXT, 0, -92 + 22 * i as i32, 52)
}

pub fn system_spots() -> [Spot; 5 + SYSTEM_FIGURES] {
    let mut s = [HINT; 5 + SYSTEM_FIGURES];
    s[0] = AMP_BRAND;
    s[1] = AMP_TITLE;
    s[2] = amp_name(0);
    s[3] = amp_value(0);
    for i in 0..SYSTEM_FIGURES {
        s[4 + i] = system_figure(i);
    }
    s
}

// ---- Scope: the waveforms over the spectra ----

/// The traces' box: the input and the output, each a line through its middle.
pub const SCOPE_BOX: Rect = Rect { x: -240, y: -176, w: 480, h: 160 };
/// The spectra's box: 40 Hz to 20 kHz across, -90 to 0 dBFS up.
pub const SPECTRUM_BOX: Rect = Rect { x: -240, y: 20, w: 480, h: 140 };
pub const SCOPE_LEGEND_IN: Spot = Spot::centre(TEXT, -60, -206, 5);
pub const SCOPE_LEGEND_OUT: Spot = Spot::centre(TEXT, 60, -206, 6);

/// A frequency label under the spectra, at `x` (its band's place).
pub const fn scope_freq(x: i32) -> Spot {
    Spot::centre(SMALL, x, 174, 4)
}

/// The x of `hz` across the spectra's box.
pub fn spectrum_x(hz: f64) -> i32 {
    let b = crate::scope::band_of_hz(hz);
    SPECTRUM_BOX.x + (b * SPECTRUM_BOX.w as f64 / (crate::scope::BANDS - 1) as f64) as i32
}

pub fn scope_spots() -> [Spot; 8] {
    [AMP_BRAND, AMP_TITLE, SCOPE_LEGEND_IN, SCOPE_LEGEND_OUT, scope_freq(spectrum_x(100.0)),
     scope_freq(spectrum_x(1000.0)), scope_freq(spectrum_x(10000.0)), HINT]
}

// ---- The switcher ----

pub const SWITCH_RADIUS: f32 = 200.0;
pub const SWITCH_TITLE: Spot = Spot::centre(TEXT, 0, 0, 7);

/// Page `i` of `n`'s name, round the circle from 12 o'clock.
pub fn switch_spot(i: usize, n: usize) -> Spot {
    let (x, y) = polar(SWITCH_RADIUS, i as f32 / n as f32);
    Spot::centre(BIG, x, y, 8)
}

/// Every text spot of a screen, for the tests.
pub fn amp_spots() -> [Spot; 6 + 2 * Setting::ALL.len() + 2] {
    let mut s = [HINT; 6 + 2 * Setting::ALL.len() + 2];
    s[0] = AMP_BRAND;
    s[1] = AMP_TITLE;
    s[2] = AMP_ABOUT;
    s[3] = AMP_NETWORK;
    s[4] = AMP_STATUS;
    s[5] = AMP_LEVELS;
    for i in 0..Setting::ALL.len() {
        s[6 + 2 * i] = amp_name(i);
        s[7 + 2 * i] = amp_value(i);
    }
    s[6 + 2 * Setting::ALL.len()] = meter_label(false);
    s[7 + 2 * Setting::ALL.len()] = meter_label(true);
    s
}

pub fn switcher_spots() -> [Spot; Page::ALL.len() + 2] {
    let mut s = [HINT; Page::ALL.len() + 2];
    for i in 0..Page::ALL.len() {
        s[i] = switch_spot(i, Page::ALL.len());
    }
    s[Page::ALL.len()] = SWITCH_TITLE;
    s
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::geometry::MARGIN;

    fn corners(r: &Rect) -> [(i32, i32); 4] {
        [(r.x, r.y), (r.x + r.w, r.y), (r.x, r.y + r.h), (r.x + r.w, r.y + r.h)]
    }

    fn check(name: &str, spots: &[Spot], arcs: &[Arc]) {
        for (i, a) in spots.iter().enumerate() {
            let r = a.rect();
            assert!(r.fits(RADIUS - MARGIN), "{name}: spot {i} {a:?} goes past the glass");
            for (j, b) in spots.iter().enumerate().skip(i + 1) {
                assert!(!r.overlaps(&b.rect()), "{name}: spots {i} and {j} overlap: {a:?} {b:?}");
            }
            for (k, arc) in arcs.iter().enumerate() {
                // every pixel of the box's edge, against the arc and a gap of 3 pixels
                let mut points = std::vec::Vec::new();
                for x in r.x..=r.x + r.w {
                    points.push((x, r.y));
                    points.push((x, r.y + r.h));
                }
                for y in r.y..=r.y + r.h {
                    points.push((r.x, y));
                    points.push((r.x + r.w, y));
                }
                assert!(!points.iter().any(|&(x, y)| arc.near(x, y, 3)), "{name}: spot {i} {a:?} touches arc {k}");
                let _ = corners(&r);
            }
        }
    }

    #[test]
    fn the_amp_screen_fits_and_nothing_touches() {
        check("amp", &amp_spots(), &[METER_IN, METER_OUT, RIM]);
        // the meters stay clear of each other and of the rim
        for k in 0..=METER_SEGMENTS {
            let (x, y) = METER_IN.point(METER_IN.radius, k);
            assert!(!METER_OUT.near(x, y, 3));
            assert!(((x * x + y * y) as f64).sqrt() < (RIM.radius - RIM.thick - 2) as f64);
        }
    }

    #[test]
    fn the_tone_and_system_screens_fit_and_nothing_touches() {
        check("tone", &tone_spots(), &[METER_IN, METER_OUT, RIM]);
        check("system", &system_spots(), &[RIM]);
    }

    #[test]
    fn the_scope_screen_fits_and_nothing_touches() {
        check("scope", &scope_spots(), &[RIM]);
        for b in [SCOPE_BOX, SPECTRUM_BOX] {
            assert!(b.fits(RADIUS - MARGIN), "{b:?}");
            for s in scope_spots() {
                assert!(!b.overlaps(&s.rect()), "{b:?} and {s:?}");
            }
        }
        assert!(!SCOPE_BOX.overlaps(&SPECTRUM_BOX));
    }

    #[test]
    fn the_switcher_fits_and_nothing_touches() {
        let n = Page::ALL.len();
        let arcs: std::vec::Vec<Arc> = (0..n).map(|i| rim_part(i, n)).chain([RIM]).collect();
        check("switcher", &switcher_spots(), &arcs);
    }

    #[test]
    fn the_meters_rise_from_the_bottom() {
        let (_, low) = METER_IN.point(METER_IN.radius, 0);
        let (_, high) = METER_IN.point(METER_IN.radius, METER_SEGMENTS);
        assert!(low > high, "y grows down: the input meter's first segment is the lowest");
        let (x_in, _) = METER_IN.point(METER_IN.radius, 5);
        let (x_out, _) = METER_OUT.point(METER_OUT.radius, 5);
        assert!(x_in < 0 && x_out > 0);
        let (_, low) = METER_OUT.point(METER_OUT.radius, 0);
        let (_, high) = METER_OUT.point(METER_OUT.radius, METER_SEGMENTS);
        assert!(low > high, "and the output meter's");
    }

    #[test]
    fn atan2_tells_the_quadrants() {
        for &(x, y) in &[(1.0f32, 0.0f32), (1.0, 1.0), (0.0, 1.0), (-1.0, 1.0), (-1.0, 0.0), (-1.0, -1.0), (0.0, -1.0), (0.3, -0.7)] {
            let want = (y as f64).atan2(x as f64) as f32;
            assert!((libm_atan2(y, x) - want).abs() < 1e-3, "{x} {y}");
        }
    }
}
