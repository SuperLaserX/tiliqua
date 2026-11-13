//! The round screen's geometry. Coordinates are pixels relative to the centre,
//! x to the right and y down; the firmware adds the centre when it draws, so
//! nothing here depends on the panel's resolution.

/// The panel's visible radius.
pub const RADIUS: i32 = 360;
/// Keep drawn items this far inside the glass edge.
pub const MARGIN: i32 = 12;

/// A font's cell size. The firmware's sprite sheet (`fw/src/glyphs.rs`) holds
/// these three.
#[derive(Clone, Copy, PartialEq, Eq, Debug)]
pub struct Font {
    pub w: i32,
    pub h: i32,
}

pub const BIG: Font = Font { w: 10, h: 20 };
pub const TEXT: Font = Font { w: 7, h: 13 };
pub const SMALL: Font = Font { w: 6, h: 10 };

#[derive(Clone, Copy, PartialEq, Eq, Debug)]
pub struct Rect {
    pub x: i32,
    pub y: i32,
    pub w: i32,
    pub h: i32,
}

impl Rect {
    /// The box of `chars` characters of `font`, centred on (cx, cy).
    pub const fn text(font: Font, chars: usize, cx: i32, cy: i32) -> Rect {
        let w = font.w * chars as i32;
        Rect { x: cx - w / 2, y: cy - font.h / 2, w, h: font.h }
    }

    /// Whether every corner is within `radius` of the centre (so all of it is).
    pub const fn fits(&self, radius: i32) -> bool {
        let (r2, x1, y1) = (radius * radius, self.x + self.w, self.y + self.h);
        self.x * self.x + self.y * self.y <= r2
            && x1 * x1 + self.y * self.y <= r2
            && self.x * self.x + y1 * y1 <= r2
            && x1 * x1 + y1 * y1 <= r2
    }

    pub const fn overlaps(&self, o: &Rect) -> bool {
        self.x < o.x + o.w && o.x < self.x + self.w && self.y < o.y + o.h && o.y < self.y + self.h
    }
}

/// sin and cos of an angle given in turns.
///
/// Good to about a millionth, which is well under 0.01 pixel at the rim: the
/// rings are drawn from these, and rougher approximations show as wobble.
pub fn sin_cos(turns: f32) -> (f32, f32) {
    const TAU: f32 = 6.283_185_5;
    let t = turns - (turns as i32) as f32;
    let t = if t < 0.0 { t + 1.0 } else { t };
    // Down to the first quadrant, then to within 1/8 turn of an axis.
    let quadrant = (t * 4.0) as u32 & 3;
    let a = (t - quadrant as f32 * 0.25) * TAU;
    let (flip, a) = if a > TAU / 8.0 { (true, TAU / 4.0 - a) } else { (false, a) };
    let a2 = a * a;
    let s = a * (1.0 - a2 / 6.0 * (1.0 - a2 / 20.0 * (1.0 - a2 / 42.0)));
    let c = 1.0 - a2 / 2.0 * (1.0 - a2 / 12.0 * (1.0 - a2 / 30.0 * (1.0 - a2 / 56.0)));
    let (s, c) = if flip { (c, s) } else { (s, c) };
    match quadrant {
        0 => (s, c),
        1 => (c, -s),
        2 => (-s, -c),
        _ => (-c, s),
    }
}

/// The point at `radius`, `turns` clockwise from 12 o'clock.
pub fn polar(radius: f32, turns: f32) -> (i32, i32) {
    let (s, c) = sin_cos(turns);
    (round(radius * s), round(-radius * c))
}

fn round(x: f32) -> i32 {
    if x >= 0.0 { (x + 0.5) as i32 } else { (x - 0.5) as i32 }
}

/// Fixed point for the walk round a circle: Q30.
const WALK_ONE: f32 = 1_073_741_824.0;

/// Steps round a circle in equal turns, with no floating point after the first: the CPU has no
/// FPU, and an arc drawn with `polar` at each end of each line takes a third of a second.
#[derive(Clone, Copy, Debug)]
pub struct Walk {
    /// Where it is, on the unit circle, and what a step's rotation is, in Q30.
    x: i64,
    y: i64,
    cos: i64,
    sin: i64,
}

impl Walk {
    /// From `from` turns, `step` turns at a time, clockwise from 12 o'clock.
    pub fn new(from: f32, step: f32) -> Walk {
        let (s, c) = sin_cos(from);
        let (ss, sc) = sin_cos(step);
        Walk {
            x: (s * WALK_ONE) as i64,
            y: (-c * WALK_ONE) as i64,
            cos: (sc * WALK_ONE) as i64,
            sin: (ss * WALK_ONE) as i64,
        }
    }

    /// Where it is now, at `radius`.
    pub const fn at(&self, radius: i32) -> (i32, i32) {
        let half = 1i64 << 29;
        (((self.x * radius as i64 + half) >> 30) as i32, ((self.y * radius as i64 + half) >> 30) as i32)
    }

    pub const fn step(&mut self) {
        let x = (self.x * self.cos - self.y * self.sin) >> 30;
        let y = (self.x * self.sin + self.y * self.cos) >> 30;
        self.x = x;
        self.y = y;
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn sin_cos_matches_std_all_the_way_round() {
        for i in -2000..=2000 {
            let t = i as f32 / 997.0;
            let (s, c) = sin_cos(t);
            let a = t as f64 * core::f64::consts::TAU;
            assert!((s as f64 - a.sin()).abs() < 2e-6, "sin at {t} turns: {s} vs {}", a.sin());
            assert!((c as f64 - a.cos()).abs() < 2e-6, "cos at {t} turns: {c} vs {}", a.cos());
        }
    }

    #[test]
    fn polar_starts_at_twelve_and_turns_clockwise() {
        assert_eq!(polar(100.0, 0.0), (0, -100));
        assert_eq!(polar(100.0, 0.25), (100, 0));
        assert_eq!(polar(100.0, 0.5), (0, 100));
        assert_eq!(polar(100.0, 0.75), (-100, 0));
    }

    #[test]
    fn a_ring_stays_within_a_pixel_of_round() {
        for i in 0..720 {
            let (x, y) = polar(350.0, i as f32 / 720.0);
            let r = ((x * x + y * y) as f64).sqrt();
            assert!((r - 350.0).abs() <= 0.75, "{i}: radius {r}");
        }
    }

    #[test]
    fn a_walk_stays_within_a_pixel_of_polar_all_the_way_round() {
        for (from, n) in [(0.0f32, 180), (0.6, 48), (-0.16, 50), (0.4, 48)] {
            for sign in [1.0f32, -1.0] {
                let step = sign * 0.3 / n as f32;
                let mut w = Walk::new(from, step);
                for k in 0..=n {
                    for r in [214, 346] {
                        let (x, y) = w.at(r);
                        let (px, py) = polar(r as f32, from + step * k as f32);
                        assert!((x - px).abs() <= 1 && (y - py).abs() <= 1, "{from} {k}: {x},{y} vs {px},{py}");
                    }
                    w.step();
                }
            }
        }
    }

    #[test]
    fn a_walk_closes_a_whole_circle() {
        let mut w = Walk::new(0.0, 1.0 / 180.0);
        for _ in 0..180 {
            w.step();
        }
        let (x, y) = w.at(346);
        assert!(x.abs() <= 1 && (y + 346).abs() <= 1, "{x},{y}");
    }

    #[test]
    fn rect_fit_checks_every_corner() {
        assert!(Rect { x: -10, y: -10, w: 20, h: 20 }.fits(RADIUS));
        // Inside on three corners, out on the fourth.
        assert!(!Rect { x: 200, y: 200, w: 100, h: 100 }.fits(RADIUS));
        assert!(!Rect { x: -300, y: -300, w: 20, h: 20 }.fits(RADIUS));
    }

    #[test]
    fn text_box_is_centred() {
        let r = Rect::text(TEXT, 4, 100, 50);
        assert_eq!((r.x, r.w), (86, 28));
        assert_eq!(r.y + r.h / 2, 50);
    }
}
