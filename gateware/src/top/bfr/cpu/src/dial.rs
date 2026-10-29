//! The dials' geometry: a ring of pixels round each cell's centre, lit from
//! the bottom left clockwise through the top to the bottom right (270
//! degrees), with a 90 degree gap at the bottom.
//!
//! The ring is rasterised once, from each pixel's distance to the centre
//! (so it is round however small): `ring_pixels` lists every pixel with its
//! position along the sweep. The firmware's build script includes this file
//! on the host (with `f64::atan2`) and writes the list to flash; the screen
//! then colours each pixel by whether the dial's value has passed it.
//!
//! Self-contained (no `crate::` paths): the build script includes it.

/// Pixel radii of the ring: `DIAL_IN..=DIAL_OUT` (4 pixels wide).
pub const DIAL_IN: i32 = 20;
pub const DIAL_OUT: i32 = 23;
/// The needle (2 pixels wide), inside the ring.
pub const NEEDLE_IN: f64 = 5.0;
pub const NEEDLE_OUT: f64 = 16.0;
/// The CV notch (2 pixels wide), across the ring and beyond it.
pub const NOTCH_IN: f64 = 17.0;
pub const NOTCH_OUT: f64 = 29.0;

/// The sweep: 270 degrees clockwise from the bottom left (y down).
pub const DIAL_START: f64 = 0.75 * core::f64::consts::PI;
pub const DIAL_SWEEP: f64 = 1.5 * core::f64::consts::PI;

/// A pixel's position along the sweep: 0..=T_ONE; T_GAP for the gap.
pub const T_ONE: u16 = 60000;
pub const T_GAP: u16 = u16::MAX;

/// The sweep position (`T_ONE` scale) of the angle `a` (radians, y down).
pub fn t_of_angle(a: f64) -> u16 {
    let tau = 2.0 * core::f64::consts::PI;
    let mut d = (a - DIAL_START) % tau;
    if d < 0.0 {
        d += tau;
    }
    if d > DIAL_SWEEP {
        T_GAP
    } else {
        (d / DIAL_SWEEP * T_ONE as f64 + 0.5) as u16
    }
}

/// Calls `f(dx, dy, t)` for every pixel of the ring, row by row (top to
/// bottom, left to right: neighbouring pixels are close in memory). A pixel
/// is in the ring if its centre is within half a pixel of the radii.
pub fn ring_pixels(atan2: fn(f64, f64) -> f64, mut f: impl FnMut(i8, i8, u16)) {
    let lo = (DIAL_IN as f64 - 0.5) * (DIAL_IN as f64 - 0.5);
    let hi = (DIAL_OUT as f64 + 0.5) * (DIAL_OUT as f64 + 0.5);
    for dy in -DIAL_OUT..=DIAL_OUT {
        for dx in -DIAL_OUT..=DIAL_OUT {
            let d2 = (dx * dx + dy * dy) as f64;
            if d2 >= lo && d2 < hi {
                f(dx as i8, dy as i8, t_of_angle(atan2(dy as f64, dx as f64)));
            }
        }
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    fn pixels() -> Vec<(i8, i8, u16)> {
        let mut v = Vec::new();
        ring_pixels(f64::atan2, |x, y, t| v.push((x, y, t)));
        v
    }

    #[test]
    fn ring_is_round_symmetric_and_four_pixels_wide() {
        let px = pixels();
        let set: std::collections::HashSet<(i8, i8)> = px.iter().map(|p| (p.0, p.1)).collect();
        for &(x, y, _) in &px {
            // mirror images about both axes and the diagonals
            for (mx, my) in [(-x, y), (x, -y), (y, x)] {
                assert!(set.contains(&(mx, my)), "({x},{y}) has no mirror ({mx},{my})");
            }
        }
        // along each axis, exactly the radii DIAL_IN..=DIAL_OUT
        for r in 0..=DIAL_OUT + 2 {
            let inside = (DIAL_IN..=DIAL_OUT).contains(&r);
            assert_eq!(set.contains(&(r as i8, 0)), inside, "radius {r}");
        }
        assert!(px.len() > 500 && px.len() < 700, "{} pixels", px.len());
    }

    #[test]
    fn sweep_runs_from_bottom_left_through_the_top_with_a_quarter_gap() {
        let px = pixels();
        let gap = px.iter().filter(|p| p.2 == T_GAP).count();
        let frac = gap as f64 / px.len() as f64;
        assert!((frac - 0.25).abs() < 0.02, "gap is {frac} of the ring");
        // the gap is the bottom quarter, and the top is the middle of the sweep
        for &(x, y, t) in &px {
            if t == T_GAP {
                assert!(y > 0 && (x as i32).abs() <= y as i32 + 1, "({x},{y}) in the gap");
            }
            if x == 0 && y < 0 {
                assert!((t as i32 - T_ONE as i32 / 2).abs() <= 1);
            }
        }
        // left of the bottom-left end starts low, right of the bottom-right ends high
        let t_left = px.iter().find(|p| p.0 as i32 == -DIAL_OUT && p.1 == 0).unwrap().2;
        let t_right = px.iter().find(|p| p.0 as i32 == DIAL_OUT && p.1 == 0).unwrap().2;
        assert!((t_left as f64 / T_ONE as f64 - 1.0 / 6.0).abs() < 0.01);
        assert!((t_right as f64 / T_ONE as f64 - 5.0 / 6.0).abs() < 0.01);
    }
}
