//! The noise gate: the plugin's (AudioDSPTools' `noise_gate::Trigger` and `Gain`, as the plugin
//! sets them up) run by the CPU every control tick instead of every sample, in integers (the CPU
//! has no FPU). Its gain scales the engine's output gain word.
//!
//! The trigger follows the input's power after the input gain, smoothed with a 10 ms half-life,
//! in dB. Open, it stays open while that is above the threshold, and for 10 ms after it falls
//! below. Then it moves towards a reduction of 0.1 dB per dB² below the threshold, closing at most
//! its full reduction in 50 ms and opening at most that in 5 ms; back at no reduction it is open
//! again. The level is taken from the input's peak each tick: for a guitar's fundamentals a tick
//! (12 samples) is a short part of a cycle, so its peak squared is near the power.

/// The control tick, in microseconds.
pub const TICK_US: u32 = 250;
/// dB in fixed point: 1/256 dB.
pub const DB: i32 = 256;
/// The threshold's range and default (the plugin's), in dB.
pub const THRESHOLD_RANGE: (i32, i32) = (-100, 0);
pub const THRESHOLD_DEFAULT: i32 = -80;

const RATIO_TENTHS: i64 = 1; // 0.1 dB per dB squared
const FLOOR_DB: i32 = -120 * DB;
/// The power's smoothing per tick: 1 - 0.5^(tick / 10 ms) in Q16.
const SMOOTH_Q16: u64 = 1126;
const HOLD_TICKS: u32 = 10_000 / TICK_US;
const OPEN_TICKS: i32 = (5_000 / TICK_US) as i32;
const CLOSE_TICKS: i32 = (50_000 / TICK_US) as i32;
/// The power of a full-scale sample, as `power` holds it (32768 squared, with 16 bits of
/// fraction so the smoothing keeps small levels): 10 log10(2^46) = 138.474 dB.
const FULL_SCALE_DB: i32 = 35449; // 138.474 * 256
const POWER_FRAC: u32 = 16;

/// log2(1 + k/32) for k in 0..=32, in Q16.
const LOG2_TABLE: [u32; 33] = [
    0, 2909, 5732, 8473, 11136, 13727, 16248, 18704, 21098, 23433, 25711, 27936, 30109, 32234, 34312, 36346,
    38336, 40286, 42196, 44068, 45904, 47705, 49472, 51207, 52911, 54584, 56229, 57845, 59434, 60996, 62534, 64047,
    65536,
];

/// 2^(k/32) for k in 0..=32, in Q16.
const EXP2_TABLE: [u32; 33] = [
    65536, 66971, 68438, 69936, 71468, 73033, 74632, 76266, 77936, 79642, 81386, 83168, 84989, 86850, 88752, 90695,
    92682, 94711, 96785, 98905, 101070, 103283, 105545, 107856, 110218, 112631, 115098, 117618, 120194, 122825,
    125515, 128263, 131072,
];

/// 10 log10(p) in 1/256 dB (for 0, far below anything).
pub fn power_db(p: u64) -> i32 {
    if p == 0 {
        return i32::MIN / 2;
    }
    let msb = 63 - p.leading_zeros();
    // the 21 bits under the top one: which table step, and how far into it
    let frac = if msb >= 21 { (p >> (msb - 21)) as u32 & 0x1F_FFFF } else { ((p << (21 - msb)) as u32) & 0x1F_FFFF };
    let k = (frac >> 16) as usize;
    let t = frac & 0xFFFF;
    let l = LOG2_TABLE[k] + (((LOG2_TABLE[k + 1] - LOG2_TABLE[k]) as u64 * t as u64) >> 16) as u32;
    let log2_q16 = ((msb as u64) << 16) + l as u64;
    // 10 log10(2) = 3.010300 dB a doubling: in 1/256 dB, 770.637 per unit of log2
    ((log2_q16 * 770_637) / (1000 * 65536)) as i32
}

/// 10^(db / 20) in Q16, for db <= 0 in 1/256 dB.
pub fn gain_q16(db: i32) -> u32 {
    if db >= 0 {
        return 65536;
    }
    // 2^(db * log2(10) / 20): log2(10) / 20 = 0.1660964
    let e = (db as i64 * 10885) >> 13; // in 1/2048 of a doubling, <= 0
    let whole = ((-e + 2047) / 2048) as u32; // doublings down, rounding the exponent up
    let rest = (e + whole as i64 * 2048) as u32; // 0..2047 above that
    if whole > 24 {
        return 0;
    }
    let k = (rest >> 6) as usize;
    let t = rest & 63;
    let up = EXP2_TABLE[k] + (((EXP2_TABLE[k + 1] - EXP2_TABLE[k]) * t) >> 6);
    ((up as u64 + ((1u64 << whole) >> 1)) >> whole) as u32
}

#[derive(Clone, Copy, PartialEq, Eq, Debug)]
enum State {
    Holding { held: u32 },
    Moving,
}

/// The gate's state.
#[derive(Clone, Copy, PartialEq, Eq, Debug)]
pub struct Gate {
    pub on: bool,
    /// The threshold, in 1/256 dB.
    pub threshold: i32,
    /// The smoothed power, in squared sample units with 16 bits of fraction (full scale 2^46).
    power: u64,
    state: State,
    /// The reduction now, in 1/256 dB (<= 0).
    reduction: i32,
}

impl Default for Gate {
    fn default() -> Self {
        Gate { on: true, threshold: THRESHOLD_DEFAULT * DB, power: 0, state: State::Holding { held: 0 }, reduction: 0 }
    }
}

impl Gate {
    /// The reduction aimed for at `level` (1/256 dB).
    fn target(&self, level: i32) -> i32 {
        if level >= self.threshold {
            return 0;
        }
        let d = (level - self.threshold) as i64; // < 0, 1/256 dB
        (-(d * d * RATIO_TENTHS / 10) / DB as i64) as i32
    }

    /// The reduction now, in 1/256 dB.
    pub fn reduction(&self) -> i32 {
        if self.on { self.reduction } else { 0 }
    }

    /// The input level, smoothed, in 1/256 dBFS after `input_gain` (1/256 dB).
    pub fn level(&self, input_gain: i32) -> i32 {
        (power_db(self.power) - FULL_SCALE_DB + input_gain).max(FLOOR_DB)
    }

    /// A tick: the input's peak since the last (a 16-bit sample's magnitude) and the input gain the
    /// engine applies (1/256 dB). Returns the gain to apply, in Q16.
    pub fn tick(&mut self, peak: u16, input_gain: i32) -> u32 {
        let x2 = (peak as u64 * peak as u64) << POWER_FRAC;
        // (the power rises and falls with the same smoothing, as the plugin's does)
        if x2 >= self.power {
            self.power += ((x2 - self.power) * SMOOTH_Q16) >> 16;
        } else {
            self.power -= ((self.power - x2) * SMOOTH_Q16 + 65535) >> 16;
        }
        let level = self.level(input_gain);
        let max = self.target(FLOOR_DB);
        match self.state {
            State::Holding { held } => {
                self.reduction = 0;
                if level < self.threshold {
                    let held = held + 1;
                    self.state = if held >= HOLD_TICKS { State::Moving } else { State::Holding { held } };
                } else {
                    self.state = State::Holding { held: 0 };
                }
            }
            State::Moving => {
                let want = self.target(level);
                if want > self.reduction {
                    let step = (want - self.reduction).min(-max / OPEN_TICKS);
                    self.reduction += step;
                    if self.reduction >= 0 {
                        self.reduction = 0;
                        self.state = State::Holding { held: 0 };
                    }
                } else if want < self.reduction {
                    let step = (want - self.reduction).max(max / CLOSE_TICKS);
                    self.reduction = (self.reduction + step).max(max);
                }
            }
        }
        gain_q16(self.reduction())
    }

    /// Whether it is closed or closing.
    pub fn closing(&self) -> bool {
        self.on && self.reduction < 0
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    fn db(x: f64) -> f64 {
        x / DB as f64
    }

    #[test]
    fn the_tables_are_what_they_say() {
        for k in 0..=32 {
            let l = (1.0 + k as f64 / 32.0).log2() * 65536.0;
            assert!((LOG2_TABLE[k] as f64 - l).abs() <= 1.0, "log2 {k}");
            let e = 2f64.powf(k as f64 / 32.0) * 65536.0;
            assert!((EXP2_TABLE[k] as f64 - e).abs() <= 1.0, "exp2 {k}");
        }
    }

    #[test]
    fn power_in_db_is_within_a_hundredth() {
        for &p in &[1u64, 2, 3, 10, 999, 12345, 1 << 20, 1_000_000_007, (1 << 30) - 1, 1 << 30, 77_777_777_777] {
            let want = 10.0 * (p as f64).log10();
            let got = db(power_db(p) as f64);
            assert!((got - want).abs() < 0.01, "{p}: {got} vs {want}");
        }
        assert!((db((power_db(1 << 46) - FULL_SCALE_DB) as f64)).abs() < 0.01);
    }

    #[test]
    fn gain_is_within_a_hundredth_of_a_db() {
        for d in (-200 * DB..=0).step_by(37) {
            let want = 10f64.powf(db(d as f64) / 20.0);
            let got = gain_q16(d) as f64 / 65536.0;
            if want > 0.01 {
                // to -40 dB, within a hundredth of a dB; under it Q16's steps are coarser
                assert!((20.0 * (got / want).log10()).abs() < 0.01, "{}: {got} vs {want}", db(d as f64));
            } else {
                assert!((got - want).abs() * 65536.0 <= 1.0, "{}: {got} vs {want}", db(d as f64));
            }
        }
        assert_eq!(gain_q16(0), 65536);
        assert_eq!(gain_q16(-200 * DB), 0);
    }

    /// The same algorithm in floating point, as the plugin writes it, a tick at a time.
    struct Reference {
        power: f64,
        holding: bool,
        held: u32,
        reduction: f64,
        threshold: f64,
    }

    impl Reference {
        fn target(&self, level: f64) -> f64 {
            if level < self.threshold { -0.1 * (level - self.threshold) * (level - self.threshold) } else { 0.0 }
        }

        fn tick(&mut self, peak: u16, input_gain_db: f64) -> f64 {
            let alpha = 0.5f64.powf(TICK_US as f64 / 10_000.0);
            self.power = alpha * self.power + (1.0 - alpha) * (peak as f64 / 32768.0).powi(2);
            let level = (10.0 * self.power.max(1e-12).log10() + input_gain_db).max(-120.0);
            let max = self.target(-120.0);
            if self.holding {
                self.reduction = 0.0;
                if level < self.threshold {
                    self.held += 1;
                    if self.held >= HOLD_TICKS {
                        self.holding = false;
                    }
                } else {
                    self.held = 0;
                }
            } else {
                let want = self.target(level);
                if want > self.reduction {
                    self.reduction += (want - self.reduction).min(-max / OPEN_TICKS as f64);
                    if self.reduction >= 0.0 {
                        self.reduction = 0.0;
                        self.holding = true;
                        self.held = 0;
                    }
                } else if want < self.reduction {
                    self.reduction = (self.reduction + (want - self.reduction).max(max / CLOSE_TICKS as f64)).max(max);
                }
            }
            self.reduction
        }
    }

    /// A note that rings and decays into hiss: the gate open while it sounds, closing in the
    /// noise, never chopping the note, and following the reference to a fraction of a dB.
    #[test]
    fn a_decaying_note_into_noise_follows_the_reference() {
        let mut g = Gate { threshold: -70 * DB, ..Gate::default() };
        let mut r = Reference { power: 0.0, holding: true, held: 0, reduction: 0.0, threshold: -70.0 };
        let mut seed = 12345u32;
        let mut opened_at = None;
        let mut closed_at = None;
        for t in 0..24_000u32 {
            // 6 s: silence, a note at -12 dBFS decaying 20 dB a second, under it hiss at -84 dBFS
            seed = seed.wrapping_mul(1_664_525).wrapping_add(1_013_904_223);
            let hiss = 3.3 * ((seed >> 16) % 100) as f64 / 100.0;
            let note = if t >= 400 { 8200.0 * 10f64.powf(-20.0 * (t - 400) as f64 / 4000.0 / 20.0) } else { 0.0 };
            let peak = (note + hiss) as u16;
            let gain = g.tick(peak, 0);
            let want = r.tick(peak, 0.0);
            assert!((db(g.reduction as f64) - want).abs() < 0.5, "tick {t}: {} vs {want}", db(g.reduction as f64));
            assert!(gain <= 65536);
            if t >= 400 && opened_at.is_none() && g.reduction == 0 {
                opened_at = Some(t);
            }
            if t > 400 && closed_at.is_none() && g.reduction < -10 * DB {
                closed_at = Some(t);
            }
        }
        let opened = opened_at.unwrap();
        assert!(opened - 400 <= OPEN_TICKS as u32 + 2, "opens within 5 ms of the note: {} ticks", opened - 400);
        // the note falls under -70 dB about 2.9 s in: the gate is still open until then, and the
        // reduction grows as the level falls further (0.1 dB per dB squared under the threshold)
        let closed = closed_at.unwrap();
        assert!(closed > 400 + 4 * 2900, "closed at {closed}");
        assert!(g.reduction <= -10 * DB, "{}", db(g.reduction as f64));
    }

    #[test]
    fn off_it_does_nothing_and_a_loud_input_holds_it_open() {
        let mut g = Gate { on: false, ..Gate::default() };
        for _ in 0..1000 {
            assert_eq!(g.tick(0, 0), 65536);
        }
        let mut g = Gate::default();
        for _ in 0..1000 {
            assert_eq!(g.tick(10_000, 0), 65536);
        }
        // the input gain counts: a quiet input turned up 40 dB is above -80
        let mut g = Gate::default();
        for _ in 0..1000 {
            g.tick(3, 40 * DB);
        }
        assert_eq!(g.reduction(), 0);
        for _ in 0..1000 {
            g.tick(3, 0);
        }
        assert!(g.closing());
    }
}
