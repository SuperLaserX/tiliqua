//! Modulation: five sources move parameters away from their menu positions.
//! Two are control voltages, IN2 and IN3 (CV1, CV2); three follow the audio
//! input (IN0 + IN1): its level, its bass and its treble.
//!
//! A parameter's position on its menu grid is `t = index / steps` (0..1, on
//! the grid's own log or linear scale). Each source adds `amount * depth` to
//! it: `amount` is a CV's voltage scaled by its range (-1..1 for +-5 V, 0..1
//! for the unipolar ranges) or a follower's envelope (0..1, `Follower`), and
//! `depth` the parameter's setting for that source (-1..1). With no
//! modulation the value is exactly the menu's.

use crate::types::ParamDecl;

/// The modulation sources: CV1, CV2, then the followers.
pub const N_SOURCES: usize = 5;
pub const SOURCE_NAMES: [&str; N_SOURCES] = ["CV1", "CV2", "level", "bass", "treble"];
/// The first follower's source index (level, bass, treble follow).
pub const FOLLOWERS: usize = 2;
pub const N_FOLLOWERS: usize = N_SOURCES - FOLLOWERS;

/// What a CV input expects.
#[derive(Clone, Copy, PartialEq, Eq, Debug)]
pub enum Range {
    /// -5..5 V: 0 V leaves the parameter at its menu position.
    Bipolar5,
    /// 0..5 V: 0 V is the menu position.
    Unipolar5,
    /// 0..10 V.
    Unipolar10,
}

impl Range {
    /// The input as a modulation amount, clamped to the range.
    pub fn amount(self, volts: f64) -> f64 {
        match self {
            Range::Bipolar5 => (volts / 5.0).clamp(-1.0, 1.0),
            Range::Unipolar5 => (volts / 5.0).clamp(0.0, 1.0),
            Range::Unipolar10 => (volts / 10.0).clamp(0.0, 1.0),
        }
    }
}

/// Parameters with fewer grid steps than this are switches or note steps
/// (freeze, interval): a CV moves them from grid point to grid point.
pub const DISCRETE_STEPS: u16 = 40;

/// Smallest change of a continuous parameter's position worth applying
/// (each one recomputes coefficients): 1/2048 of its range.
pub const MIN_STEP: f64 = 1.0 / 2048.0;

/// A parameter's position with `offset` (the sum of each CV's amount times
/// its depth) added to its menu position, clamped to 0..1, and on the grid
/// for discrete parameters.
pub fn position(decl: &ParamDecl, index: u16, offset: f64) -> f64 {
    let t = (decl.t_of(index) + offset).clamp(0.0, 1.0);
    if decl.steps < DISCRETE_STEPS {
        crate::math::floor(t * decl.steps as f64 + 0.5) / decl.steps as f64
    } else {
        t
    }
}

/// The value to run the parameter at: the menu's value (`ParamDecl::at`,
/// exact at the default) unless modulated.
pub fn value(decl: &ParamDecl, index: u16, offset: f64) -> f64 {
    if offset == 0.0 {
        return decl.at(index.min(decl.steps));
    }
    let t = position(decl, index, offset);
    if decl.steps < DISCRETE_STEPS {
        decl.at((t * decl.steps as f64 + 0.5) as u16)
    } else {
        decl.at_t(t)
    }
}

/// Whether a parameter last applied at position `old` should be applied
/// again at `new`.
pub fn changed(decl: &ParamDecl, old: f64, new: f64) -> bool {
    if decl.steps < DISCRETE_STEPS {
        old != new
    } else {
        crate::math::abs(new - old) >= MIN_STEP
    }
}

/// One-pole smoothing of an input read once a control tick.
#[derive(Clone, Copy, Default)]
pub struct Smoother {
    pub value: f64,
    primed: bool,
}

impl Smoother {
    /// `k` is the fraction of the remaining distance moved each tick.
    pub fn update(&mut self, x: f64, k: f64) -> f64 {
        if self.primed {
            self.value += k * (x - self.value);
        } else {
            self.value = x;
            self.primed = true;
        }
        self.value
    }
}

/// The followers' scale: a peak (`|x| / 32` of the input, 1023 at full
/// scale) at `FLOOR_DB` or below is 0, at `TOP_DB` (about 4 V) or above 1,
/// in decibels between.
pub const FLOOR_DB: f64 = -54.0;
pub const TOP_DB: f64 = -6.0;
/// A follower rises this fraction of the way to a louder peak each tick
/// (about 10 ms at 5 ms ticks: no zipper on a sudden attack), and falls
/// from 1 to 0 in `RELEASE_MS`.
pub const ATTACK: f64 = 0.4;
pub const RELEASE_MS: f64 = 300.0;

/// A peak as a follower's target, 0..1.
pub fn peak_amount(peak: u16) -> f64 {
    if peak == 0 {
        return 0.0;
    }
    // 20 log10(peak / 1023)
    let db = 8.685889638065035 * crate::math::ln(peak as f64 / 1023.0);
    ((db - FLOOR_DB) / (TOP_DB - FLOOR_DB)).clamp(0.0, 1.0)
}

/// An envelope of an input's peaks: a quick rise, a steady fall.
#[derive(Clone, Copy, Default)]
pub struct Follower {
    pub value: f64,
}

impl Follower {
    /// The peak since the last tick, `dt_ms` ago.
    pub fn update(&mut self, peak: u16, dt_ms: f64) -> f64 {
        let target = peak_amount(peak);
        if target > self.value {
            self.value += ATTACK * (target - self.value);
        } else {
            self.value = (self.value - dt_ms / RELEASE_MS).max(target);
        }
        self.value
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn peaks_scale_in_decibels() {
        assert_eq!(peak_amount(0), 0.0);
        assert_eq!(peak_amount(1), 0.0);                       // -60 dB
        assert_eq!(peak_amount(1023), 1.0);
        let half = peak_amount(1023 / 2);                      // -6 dB
        assert!((half - 1.0).abs() < 0.01);
        let mid = 1023.0 * 10f64.powf(-30.0 / 20.0);           // -30 dB: halfway
        assert!((peak_amount(mid as u16) - 0.5).abs() < 0.01);
    }

    #[test]
    fn followers_rise_quickly_and_fall_steadily() {
        let mut f = Follower::default();
        let mut t = 0;
        while f.update(1023, 5.0) < 0.99 {
            t += 5;
        }
        assert!(t <= 50, "rise {t} ms");
        let mut ms = 0.0;
        while f.update(0, 5.0) > 0.0 {
            ms += 5.0;
        }
        assert!((ms + 5.0 - RELEASE_MS).abs() <= 10.0, "fall {ms} ms");
        // a steady level holds
        for _ in 0..100 {
            f.update(300, 5.0);
        }
        assert!((f.value - peak_amount(300)).abs() < 1e-9);
    }

    fn decl(lo: f64, hi: f64, log: bool, steps: u16, default_index: u16) -> ParamDecl {
        let t = default_index as f64 / steps as f64;
        let default = if log { lo * (hi / lo).powf(t) } else { lo + (hi - lo) * t };
        ParamDecl {
            name: "p", label: "p", default, lo, hi, unit: "", log, steps, default_index,
            decimals: 2, fade: -1, page: 0, slot: 0, help: "",
        }
    }

    #[test]
    fn ranges() {
        assert_eq!(Range::Bipolar5.amount(2.5), 0.5);
        assert_eq!(Range::Bipolar5.amount(-9.0), -1.0);
        assert_eq!(Range::Unipolar5.amount(-1.0), 0.0);
        assert_eq!(Range::Unipolar5.amount(5.0), 1.0);
        assert_eq!(Range::Unipolar10.amount(5.0), 0.5);
        assert_eq!(Range::Unipolar10.amount(12.0), 1.0);
    }

    #[test]
    fn unmodulated_is_the_menu_value() {
        let d = decl(500.0, 20000.0, true, 100, 75);
        for i in [0, 1, 40, 75, 99, 100] {
            assert_eq!(value(&d, i, 0.0), d.at(i));
        }
    }

    #[test]
    fn modulation_moves_and_clamps() {
        let d = decl(0.0, 1.0, false, 100, 35);
        assert!((value(&d, 35, 0.25) - 0.60).abs() < 1e-12);
        assert_eq!(value(&d, 35, 2.0), 1.0);
        assert_eq!(value(&d, 35, -2.0), 0.0);
        let g = decl(500.0, 20000.0, true, 100, 50);
        let mid = value(&g, 50, 0.1);
        assert!((mid - g.at(60)).abs() / g.at(60) < 1e-9, "log scale between grid points");
    }

    #[test]
    fn discrete_parameters_stay_on_the_grid() {
        let freeze = decl(0.0, 1.0, false, 1, 0);
        assert_eq!(value(&freeze, 0, 0.4), 0.0);
        assert_eq!(value(&freeze, 0, 0.6), 1.0);
        let interval = decl(-12.0, 12.0, false, 24, 24);
        assert_eq!(value(&interval, 12, 7.0 / 24.0 + 0.01), 7.0);
        assert!(changed(&freeze, 0.0, 1.0) && !changed(&freeze, 1.0, 1.0));
    }

    #[test]
    fn small_changes_are_skipped() {
        let d = decl(0.0, 1.0, false, 100, 35);
        assert!(!changed(&d, 0.5, 0.5 + MIN_STEP / 2.0));
        assert!(changed(&d, 0.5, 0.5 + MIN_STEP));
    }

    #[test]
    fn smoother_starts_at_its_first_input() {
        let mut s = Smoother::default();
        assert_eq!(s.update(2.0, 0.5), 2.0);
        assert_eq!(s.update(4.0, 0.5), 3.0);
    }
}
