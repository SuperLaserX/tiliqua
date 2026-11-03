//! The inputs for the screens' meters: smoothed, and in microvolts. (The CVs reach the sound
//! through the gateware, at audio rate: `model/modulation.py`.)
//!
//! A one-pole on whole millivolts (`mv += (x - mv) / 4`) rounds its step to nothing up to
//! 3 mV away, so this keeps fractional state and settles on the true value.

/// A one-pole lowpass with fractional state, so it settles on a steady input.
///
/// Each tick it moves 1/`1 << SHIFT` of the way, so about 4 ticks (20 ms at the 5 ms
/// control tick) to settle. With pitch at 1 V/oct, an ADC count (0.25 mV) is 0.3 cents;
/// `FRAC` bits below that leave it settled within 3/256 of a count, whichever way it came.
#[derive(Clone, Copy, Default, PartialEq, Eq, Debug)]
pub struct Smoother {
    /// The value, in input counts, with `FRAC` fractional bits.
    state: i32,
}

const SHIFT: u32 = 2;
const FRAC: u32 = 8;

impl Smoother {
    pub fn update(&mut self, counts: i32) {
        self.state += ((counts << FRAC) - self.state) >> SHIFT;
    }

    /// The value, in input counts.
    pub const fn counts(&self) -> i32 {
        (self.state + (1 << (FRAC - 1))) >> FRAC
    }

    /// In microvolts, given the input's scale.
    pub const fn microvolts(&self, counts_per_mv: i32) -> i32 {
        (self.state as i64 * 1000 / ((counts_per_mv as i64) << FRAC)) as i32
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    const COUNTS_PER_MV: i32 = 4;

    fn settled(counts: i32) -> Smoother {
        let mut s = Smoother::default();
        for _ in 0..200 {
            s.update(counts);
        }
        s
    }

    #[test]
    fn a_steady_input_is_read_exactly() {
        for counts in [0, 1, -1, 2, -2, 3, -3, 4, 5, 7, 4000, -4000, 4003, -4003, 32767, -32768] {
            assert_eq!(settled(counts).counts(), counts, "{counts}");
        }
    }

    #[test]
    fn a_steady_volt_is_within_a_cent_from_either_direction() {
        // The bug this replaces: arriving from below stopped up to 3 mV short.
        for from in [-8000 * COUNTS_PER_MV, 0, 8000 * COUNTS_PER_MV] {
            let mut s = Smoother::default();
            for _ in 0..50 {
                s.update(from);
            }
            for _ in 0..50 {
                s.update(1000 * COUNTS_PER_MV);
            }
            let cents = (s.microvolts(COUNTS_PER_MV) - 1_000_000) as f64 / 1e6 * 1200.0;
            assert!(cents.abs() < 0.1, "from {from}: {cents} cents");
        }
    }

    #[test]
    fn it_settles_in_about_twenty_milliseconds() {
        let mut s = Smoother::default();
        for _ in 0..4 {
            s.update(4000);
        }
        assert!(s.counts() > 2500, "{}", s.counts());
        for _ in 0..16 {
            s.update(4000);
        }
        assert!(s.counts() > 3950, "{}", s.counts());
    }

    fn close(got: i32, want: i32) {
        // (3/256 of a count, in microvolts)
        assert!((got - want).abs() <= 3, "{got} vs {want}");
    }

    #[test]
    fn microvolts_keep_the_resolution() {
        close(settled(4000).microvolts(COUNTS_PER_MV), 1_000_000);
        close(settled(1).microvolts(COUNTS_PER_MV), 250);
        close(settled(-1).microvolts(COUNTS_PER_MV), -250);
    }

    #[test]
    fn full_scale_stays_in_range() {
        close(settled(32767).microvolts(COUNTS_PER_MV), 8_191_750);
        close(settled(-32768).microvolts(COUNTS_PER_MV), -8_192_000);
    }
}
