//! The band-limited levels under a table: the same frames shorter, each holding only what a pitch
//! that reads it can use. `model/wavescan.py` is the definition: `mip_rows` there and `build_row` here
//! must agree sample for sample, which `tools/check_sim.py` checks on what the firmware really made.
//!
//! This is the one thing here that takes the CPU a while, so a table's levels are made a frame at a
//! time, between other things (`Library::next_mip_job`), and a layer plays the table as it stands
//! until they are all there.

/// Levels stop at frames of this many samples, as a power of two.
pub const MIN_LOG2: u8 = 3;

/// A half-band filter, Q15: 39 taps, of which these are the ones that aren't zero. Pass to 0.2 of the
/// sample rate within 0.01 dB, stop from 0.3 by 60 dB. They add up to a quarter, so DC stays exact.
const PAIRS: [i32; 10] = [10350, -3246, 1721, -1015, 606, -349, 187, -89, 35, -8];
const CENTRE: i32 = 1 << 14;

/// How many levels a frame of this length has.
pub const fn levels_of(frame_log2: u8) -> u8 {
    frame_log2 - MIN_LOG2
}

/// Where level `level` (from 1) starts in a frame's row, in samples.
pub const fn level_offset(frame_log2: u8, level: u8) -> usize {
    let len = 1usize << frame_log2;
    len - (len >> (level - 1))
}

fn saturate(x: i32) -> i16 {
    x.clamp(i16::MIN as i32, i16::MAX as i32) as i16
}

/// A frame at half the length, filtered to fit. It is one cycle, so the filter runs round it.
/// `from` is a power of two long, and `to` half that.
pub fn decimate(from: &[i16], to: &mut [i16]) {
    let mask = from.len() - 1;
    for (i, out) in to.iter_mut().enumerate() {
        let at = 2 * i;
        let mut total = CENTRE * from[at] as i32;
        for (k, c) in PAIRS.iter().enumerate() {
            let d = 2 * k + 1;
            total += c * (from[at.wrapping_sub(d) & mask] as i32 + from[(at + d) & mask] as i32);
        }
        *out = saturate((total + (1 << 14)) >> 15);
    }
}

/// A frame at twice the length: what it had, and the same filter's samples between them.
pub fn interpolate(from: &[i16], to: &mut [i16]) {
    let mask = from.len() - 1;
    for (i, x) in from.iter().enumerate() {
        let mut total = 0;
        for (k, c) in PAIRS.iter().enumerate() {
            total += c * (from[i.wrapping_sub(k) & mask] as i32 + from[(i + 1 + k) & mask] as i32);
        }
        to[2 * i] = *x;
        to[2 * i + 1] = saturate((total + (1 << 13)) >> 14);
    }
}

/// A frame's row of levels. A level is made by halving the length twice and then doubling it once,
/// so it holds half what it could: that takes another 10 to 16 dB off linear interpolation's images.
/// `row` is the frame's length and `scratch` at least as long (the levels on the way down).
pub fn build_row(frame: &[i16], row: &mut [i16], scratch: &mut [i16]) {
    let log2 = frame.len().trailing_zeros() as u8;
    let (mut half, mut rest) = scratch.split_at_mut(frame.len() / 2);
    decimate(frame, half);
    let mut at = 0;
    for _ in 0..levels_of(log2) {
        let (quarter, after) = rest.split_at_mut(half.len() / 2);
        decimate(half, quarter);
        let (level, _) = row[at..].split_at_mut(half.len());
        interpolate(quarter, level);
        at += half.len();
        half = quarter;
        rest = after;
    }
    row[at..].fill(0);
}

#[cfg(test)]
mod tests {
    use super::*;
    use std::vec;
    use std::vec::Vec;

    fn sine(n: usize, cycles: f64, peak: f64) -> Vec<i16> {
        (0..n).map(|i| (peak * (2.0 * core::f64::consts::PI * cycles * i as f64 / n as f64).sin()) as i16).collect()
    }

    /// How much of one harmonic is in a frame.
    fn amount(x: &[i16], h: f64) -> f64 {
        let n = x.len() as f64;
        let (mut re, mut im) = (0.0, 0.0);
        for (i, v) in x.iter().enumerate() {
            let a = 2.0 * core::f64::consts::PI * h * i as f64 / n;
            re += *v as f64 * a.cos();
            im += *v as f64 * a.sin();
        }
        2.0 * (re * re + im * im).sqrt() / n
    }

    #[test]
    fn dc_stays_exact_both_ways() {
        let mut half = [0i16; 128];
        decimate(&[1000; 256], &mut half);
        assert_eq!(half, [1000; 128]);
        let mut twice = [0i16; 256];
        interpolate(&[-1234; 128], &mut twice);
        assert_eq!(twice, [-1234; 256]);
    }

    #[test]
    fn decimating_keeps_the_pass_band_and_stops_the_rest() {
        let n = 2048;
        for (h, keeps) in [(10.0, true), (200.0, true), (400.0, true), (620.0, false), (900.0, false)] {
            let x = sine(n, h, 20000.0);
            let mut half = vec![0i16; n / 2];
            decimate(&x, &mut half);
            if keeps {
                let got = amount(&half, h);
                assert!((got - 20000.0).abs() < 25.0, "harmonic {h}: {got}");
            } else {
                // What folds back is at (n / 2 - h), if it is under the half's Nyquist.
                let folded = (n as f64 / 2.0 - h).abs();
                let got = amount(&half, folded);
                assert!(got < 20.0, "harmonic {h}: {got} folds to {folded}");
            }
        }
    }

    #[test]
    fn interpolating_keeps_its_samples_and_adds_no_images() {
        let n = 1024;
        let x = sine(n, 100.0, 20000.0);
        let mut twice = vec![0i16; 2 * n];
        interpolate(&x, &mut twice);
        for i in 0..n {
            assert_eq!(twice[2 * i], x[i]);
        }
        assert!((amount(&twice, 100.0) - 20000.0).abs() < 8.0);
        assert!(amount(&twice, n as f64 - 100.0) < 20.0, "the image");
    }

    #[test]
    fn a_tone_too_high_for_a_level_isnt_in_it() {
        let n = 1024;
        let log2 = 10;
        let x = sine(n, 80.0, 20000.0);
        let mut row = vec![0i16; n];
        let mut scratch = vec![0i16; n];
        build_row(&x, &mut row, &mut scratch);
        // Level 1 holds 512 samples and up to 0.2 of that, level 2 256 and up to 0.2 of that...
        let level = |j: u8| {
            let at = level_offset(log2, j);
            &row[at..at + (n >> j)]
        };
        assert!((amount(level(1), 80.0) - 20000.0).abs() < 40.0, "{}", amount(level(1), 80.0));
        assert!(amount(level(2), 80.0).abs() < 40.0, "{}", amount(level(2), 80.0));
        assert!(amount(level(3), 48.0).abs() < 40.0);
    }

    #[test]
    fn the_levels_fill_the_row_as_the_gateware_expects() {
        assert_eq!(level_offset(11, 1), 0);
        assert_eq!(level_offset(11, 2), 1024);
        assert_eq!(level_offset(11, 3), 1536);
        assert_eq!(level_offset(11, 8), 2048 - 16);
        assert_eq!(levels_of(11), 8);
        assert_eq!(levels_of(8), 5);
        // The last level's end, and what is left of the row after it.
        assert_eq!(level_offset(8, 5) + 8, 256 - 8);
    }

    #[test]
    fn a_short_frame_makes_a_full_set_with_the_end_of_the_row_zero() {
        let x: Vec<i16> = (0..256).map(|i| (i * 100 - 12800) as i16).collect();
        let mut row = vec![1i16; 256];
        let mut scratch = vec![0i16; 256];
        build_row(&x, &mut row, &mut scratch);
        assert!(row[..248].iter().any(|v| *v != 1));
        assert_eq!(row[248..], [0; 8]);
    }

    #[test]
    fn a_loud_square_saturates_rather_than_wraps() {
        let x: Vec<i16> = (0..256).map(|i| if i < 128 { 32767 } else { -32768 }).collect();
        let mut half = [0i16; 128];
        decimate(&x, &mut half);
        assert_eq!(*half.iter().max().unwrap(), 32767);
        assert_eq!(*half.iter().min().unwrap(), -32768);
        // It rings at the edges but never flips sign in the middle of a half cycle.
        assert!(half[32] > 30000 && half[96] < -30000);
    }
}
