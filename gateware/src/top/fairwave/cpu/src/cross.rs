//! What the Cross Mod screen draws: one cycle of each oscillator as it stands, and of the carrier as
//! the other makes it. It treats the two as if at one pitch, which is what phase distortion really
//! is, and for the rest shows what the mode does to a cycle's shape rather than what comes out at
//! other ratios. Levels are left out: this is about shape, and a modulator's level sets its own effect.

use crate::patch::{Cross, CrossMode};

/// Points across the large drawing and the two small ones.
pub const RESULT_POINTS: usize = 97;
pub const SHAPE_POINTS: usize = 49;

/// What is drawn, as heights in pixels from the top of each box.
#[derive(Clone, Copy, PartialEq, Eq, Debug)]
pub struct Picture {
    pub modulator: [i16; SHAPE_POINTS],
    pub carrier: [i16; SHAPE_POINTS],
    pub result: [i16; RESULT_POINTS],
}

fn phase_of(k: usize, points: usize) -> u32 {
    // (the last point is back at the start of the cycle)
    ((k as u64 * (1 << 32)) / (points as u64 - 1)) as u32
}

fn height(v: i32, h: i32) -> i16 {
    let half = h / 2;
    (half - (v.clamp(-32768, 32767) * half) / 32768) as i16
}

/// The carrier's value at `phase` as the mode makes it, with both reads at full scale.
pub fn made(cross: &Cross, phase: u32, modulator: &impl Fn(u32) -> i32, carrier: &impl Fn(u32) -> i32) -> i32 {
    let m = modulator(phase) as i64;
    let depth = cross.depth as i64;
    match cross.mode {
        CrossMode::Off => carrier(phase),
        // Up to 2 cycles either way at full depth and full scale.
        CrossMode::Fm | CrossMode::Pd => {
            let moved = (m * depth * (1i64 << 33)) / (32768 * 1000);
            carrier(phase.wrapping_add(moved as u32))
        }
        CrossMode::Ring => {
            let gain = 32768 * 1000 + depth * (m - 32768);
            ((carrier(phase) as i64 * gain) / (32768 * 1000)) as i32
        }
        CrossMode::Am => {
            let gain = 2 * 32768 * 1000 + depth * (m - 32768);
            ((carrier(phase) as i64 * gain) / (2 * 32768 * 1000)) as i32
        }
    }
}

/// `modulator` and `carrier` read a table at a phase, and `small_h` and `large_h` are the boxes' heights.
pub fn picture(cross: &Cross, modulator: impl Fn(u32) -> i32, carrier: impl Fn(u32) -> i32, small_h: i32,
               large_h: i32) -> Picture {
    Picture {
        modulator: core::array::from_fn(|k| height(modulator(phase_of(k, SHAPE_POINTS)), small_h)),
        carrier: core::array::from_fn(|k| height(carrier(phase_of(k, SHAPE_POINTS)), small_h)),
        result: core::array::from_fn(|k| {
            height(made(cross, phase_of(k, RESULT_POINTS), &modulator, &carrier), large_h)
        }),
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    const TAU: f64 = 2.0 * core::f64::consts::PI;

    fn sine(phase: u32) -> i32 {
        ((phase as f64 / (1u64 << 32) as f64 * TAU).sin() * 32767.0) as i32
    }

    fn saw(phase: u32) -> i32 {
        (phase >> 16) as i32 - 32768
    }

    fn cross(mode: CrossMode, depth: u16) -> Cross {
        Cross { mode, modulator: 0, depth }
    }

    #[test]
    fn with_it_off_or_no_depth_the_carrier_is_untouched() {
        for phase in [0, 1 << 28, 3 << 30] {
            assert_eq!(made(&cross(CrossMode::Off, 1000), phase, &sine, &saw), saw(phase));
            for mode in [CrossMode::Ring, CrossMode::Am, CrossMode::Fm, CrossMode::Pd] {
                assert_eq!(made(&cross(mode, 0), phase, &sine, &saw), saw(phase), "{mode:?}");
            }
        }
    }

    #[test]
    fn ring_at_full_depth_is_the_product() {
        for phase in [1 << 28, 1 << 30, 3 << 30] {
            let want = sine(phase) as f64 * saw(phase) as f64 / 32768.0;
            let got = made(&cross(CrossMode::Ring, 1000), phase, &sine, &saw) as f64;
            assert!((got - want).abs() < 2.0, "{got} vs {want}");
        }
    }

    #[test]
    fn am_at_full_depth_keeps_it_on_one_side_of_the_carrier() {
        for phase in [1 << 28, 1 << 30, 3 << 30] {
            let want = saw(phase) as f64 * (sine(phase) as f64 / 32768.0 + 1.0) / 2.0;
            let got = made(&cross(CrossMode::Am, 1000), phase, &sine, &saw) as f64;
            assert!((got - want).abs() < 2.0, "{got} vs {want}");
        }
    }

    #[test]
    fn fm_at_full_depth_is_up_to_two_cycles() {
        // At the modulator's peak, 2 cycles on: back where it was.
        let peak = 1u32 << 30;
        let got = made(&cross(CrossMode::Fm, 1000), peak, &sine, &saw);
        assert!((got - saw(peak)).abs() < 8, "{got} vs {}", saw(peak));
        // A quarter of that is half a cycle on.
        let got = made(&cross(CrossMode::Fm, 250), peak, &sine, &saw);
        assert!((got - saw(peak.wrapping_add(1 << 31))).abs() < 40, "{got}");
    }

    #[test]
    fn a_picture_stays_in_its_boxes() {
        for mode in [CrossMode::Off, CrossMode::Ring, CrossMode::Am, CrossMode::Fm, CrossMode::Pd] {
            let p = picture(&cross(mode, 1000), saw, |_| 32767, 56, 140);
            assert!(p.result.iter().all(|y| (0..=140).contains(y)), "{mode:?}");
            assert!(p.modulator.iter().all(|y| (0..=56).contains(y)));
            let p = picture(&cross(mode, 1000), saw, |_| -32768, 56, 140);
            assert!(p.result.iter().all(|y| (0..=140).contains(y)), "{mode:?}");
            assert!(p.carrier.iter().all(|y| (0..=56).contains(y)));
        }
    }

    #[test]
    fn a_picture_shows_the_change() {
        let off = picture(&cross(CrossMode::Off, 500), sine, saw, 56, 140);
        let fm = picture(&cross(CrossMode::Fm, 500), sine, saw, 56, 140);
        assert_eq!(off.carrier, fm.carrier, "the small ones are the oscillators as they are");
        assert_eq!(off.modulator, fm.modulator);
        assert_ne!(off.result, fm.result);
    }

    #[test]
    fn a_cycle_ends_where_it_started() {
        assert_eq!(phase_of(0, RESULT_POINTS), 0);
        assert_eq!(phase_of(RESULT_POINTS - 1, RESULT_POINTS), 0, "2^32 wraps");
    }
}
