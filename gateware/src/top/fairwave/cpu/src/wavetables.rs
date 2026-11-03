//! The tables the synth comes with, each made the way some instrument or technique makes its sound
//! rather than by crossfading shapes: scanning one moves through something a listener can follow.
//!
//! They are made at boot, which they mustn't hold up. The CPU has no FPU and a 64-bit division takes
//! it hundreds of clocks, so floating point is kept to what is worked out once a frame, everything
//! done once a sample is integers and lookups, and frames are the 512 samples their harmonics need.
//! Each frame is scaled to the same peak with its DC removed, so scanning changes the timbre and
//! not the level.

use crate::geometry::sin_cos;
use crate::wavegen::PEAK;

/// The longest frame these use: what the working buffers are sized for.
const MAX_LEN: usize = 512;
/// A sine lookup's quarter-cycle, as a power of two.
const QUARTER_LOG2: u32 = 8;

/// A sine by phase, one cycle being 2^32, from a quarter-wave table.
pub struct Sine {
    quarter: [i16; (1 << QUARTER_LOG2) + 1],
}

impl Sine {
    pub fn new() -> Sine {
        let mut quarter = [0; (1 << QUARTER_LOG2) + 1];
        for (i, q) in quarter.iter_mut().enumerate() {
            let turns = i as f32 / (4 << QUARTER_LOG2) as f32;
            *q = (sin_cos(turns).0 * 32767.0) as i16;
        }
        Sine { quarter }
    }

    /// From -32767 to 32767.
    pub fn at(&self, phase: u32) -> i32 {
        let quadrant = phase >> 30;
        let rest = phase & 0x3FFF_FFFF;
        let rest = if quadrant & 1 == 1 { 0x3FFF_FFFF - rest } else { rest };
        let index = (rest >> (30 - QUARTER_LOG2)) as usize;
        let fraction = ((rest >> (30 - QUARTER_LOG2 - 8)) & 0xFF) as i32;
        let (a, b) = (self.quarter[index] as i32, self.quarter[index + 1] as i32);
        let v = a + (((b - a) * fraction) >> 8);
        if quadrant >= 2 { -v } else { v }
    }
}

impl Default for Sine {
    fn default() -> Self {
        Sine::new()
    }
}

/// 2 to the power `x`, for x from 0 up: near enough for choosing a frame's settings.
fn exp2(x: f32) -> f32 {
    let whole = x as u32;
    let f = x - whole as f32;
    (1 << whole) as f32 * (1.0 + f * (0.6931 + f * (0.2416 + f * (0.0520 + f * 0.0135))))
}

/// A frame's phase step, for `cycles` cycles across a frame of `len`.
fn step_of(cycles: f32, len: usize) -> u32 {
    (cycles * (4_294_967_296.0 / len as f32)) as u64 as u32
}

/// Removes the DC from `raw` and writes it to `frame` at the set peak.
fn finish(frame: &mut [i16], raw: &[i32]) {
    let mean = (raw.iter().map(|v| *v as i64).sum::<i64>() / raw.len() as i64) as i32;
    let peak = raw.iter().map(|v| (*v - mean).abs()).max().unwrap_or(0).max(1);
    let gain = ((PEAK as i64) << 16) / peak as i64;
    for (s, v) in frame.iter_mut().zip(raw) {
        *s = (((*v - mean) as i64 * gain) >> 16) as i16;
    }
}

/// How far `f` is through `frames`, from 0 to 1.
fn through(f: usize, frames: usize) -> f32 {
    if frames > 1 { f as f32 / (frames - 1) as f32 } else { 0.0 }
}

/// Makes each frame from a working buffer of samples.
fn frames_of(table: &mut [i16], len: usize, mut make: impl FnMut(usize, usize, &mut [i32])) {
    assert!(len <= MAX_LEN);
    let frames = table.len() / len;
    let mut raw = [0i32; MAX_LEN];
    for f in 0..frames {
        make(f, frames, &mut raw[..len]);
        finish(&mut table[f * len..(f + 1) * len], &raw[..len]);
    }
}

/// One cycle across a frame, so harmonic `h` of sample `i` is a lookup.
fn cycle(sine: &Sine, len: usize) -> [i16; MAX_LEN] {
    let mut out = [0; MAX_LEN];
    let step = step_of(1.0, len);
    for (i, s) in out[..len].iter_mut().enumerate() {
        *s = sine.at(step.wrapping_mul(i as u32)) as i16;
    }
    out
}

/// Adds up harmonics of the given strengths (1/4096), each a lookup.
fn additive(raw: &mut [i32], one: &[i16; MAX_LEN], amps: &[(usize, i32)]) {
    let mask = raw.len() - 1;
    for (i, r) in raw.iter_mut().enumerate() {
        let mut sum = 0;
        for &(h, a) in amps {
            sum += (a * one[(i * h) & mask] as i32) >> 8;
        }
        *r = sum;
    }
}

/// A resonance's response at a distance `x` of its widths.
fn resonance(x: f32) -> f32 {
    1.0 / (1.0 + x * x)
}

/// The first three formants of A, E, I, O and U, in hertz (Peterson and Barney's averages, men).
const VOWEL_FORMANTS: [[f32; 3]; 5] = [
    [730.0, 1090.0, 2440.0],
    [530.0, 1840.0, 2480.0],
    [270.0, 2290.0, 3010.0],
    [570.0, 840.0, 2410.0],
    [300.0, 870.0, 2240.0],
];
/// The pitch the formants are worked out for: they move with the note, as a table's must.
const VOWEL_PITCH: f32 = 110.0;
const VOWEL_HARMONICS: usize = 32;

/// A voice going through A, E, I, O and U, its formants gliding between them.
pub fn vowels(table: &mut [i16], len: usize) {
    let sine = Sine::new();
    let one = cycle(&sine, len);
    frames_of(table, len, |f, frames, raw| {
        let t = through(f, frames) * 4.0;
        let k = (t as usize).min(3);
        let w = t - k as f32;
        let mut formant = [0.0; 3];
        for j in 0..3 {
            formant[j] = (VOWEL_FORMANTS[k][j] + (VOWEL_FORMANTS[k + 1][j] - VOWEL_FORMANTS[k][j]) * w) / VOWEL_PITCH;
        }
        let mut amps = [(0, 0); VOWEL_HARMONICS];
        let mut n = 0;
        for h in 1..=VOWEL_HARMONICS.min(len / 2 - 1) {
            let at = h as f32;
            // The voice's own slope, then its resonances, the higher ones quieter and wider.
            let source = 1.0 / (1.0 + at / 6.0);
            let shape = resonance((at - formant[0]) / 1.2)
                + 0.7 * resonance((at - formant[1]) / 1.6)
                + 0.35 * resonance((at - formant[2]) / 2.2);
            let a = (source * shape * 4096.0) as i32;
            // (the faint ones aren't worth a lookup per sample)
            if a > 48 {
                amps[n] = (h, a);
                n += 1;
            }
        }
        additive(raw, &one, &amps[..n]);
    });
}

/// Two-operator phase modulation. The ratio goes through 2, 3, 5 and 7, and for each the index
/// swells and returns to nothing, so the frames between ratios are a plain sine and nothing jumps.
pub fn fm_bell(table: &mut [i16], len: usize) {
    const RATIOS: [u32; 4] = [2, 3, 5, 7];
    const MOST: f32 = 5.0;
    let sine = Sine::new();
    let step = step_of(1.0, len);
    frames_of(table, len, |f, frames, raw| {
        let t = through(f, frames) * RATIOS.len() as f32;
        let k = (t as usize).min(RATIOS.len() - 1);
        let w = t - k as f32;
        // (starting gently: what a frame adds has to be small for neighbours to be related)
        let swell = sin_cos(w / 2.0).0;
        let index = MOST * swell * swell;
        // The index in radians, as phase for a sine of 32768.
        let depth = (index / core::f32::consts::TAU * 131072.0) as i64;
        for (i, r) in raw.iter_mut().enumerate() {
            let theta = step.wrapping_mul(i as u32);
            let m = sine.at(theta.wrapping_mul(RATIOS[k])) as i64;
            *r = sine.at(theta.wrapping_add((m * depth) as u32));
        }
    });
}

/// The Casio CZ's resonance: a sine read faster and faster inside a window that falls across the
/// cycle, which sounds like a resonant filter sweeping up with no filter there.
pub fn cz_reso(table: &mut [i16], len: usize) {
    let sine = Sine::new();
    frames_of(table, len, |f, frames, raw| {
        let cycles = exp2(through(f, frames) * 4.6);
        let step = step_of(cycles, len);
        let fall = (32768 / len) as i32;
        for (i, r) in raw.iter_mut().enumerate() {
            let window = (len - i) as i32 * fall;
            *r = (sine.at(step.wrapping_mul(i as u32)) * window) >> 15;
        }
    });
}

/// A slave oscillator restarted by the master at the start of every cycle, its pitch rising from
/// the master's to four octaves up: the tearing sound of an oscillator sync sweep.
pub fn hard_sync(table: &mut [i16], len: usize) {
    let sine = Sine::new();
    frames_of(table, len, |f, frames, raw| {
        let step = step_of(exp2(through(f, frames) * 4.0), len);
        for (i, r) in raw.iter_mut().enumerate() {
            let phase = step.wrapping_mul(i as u32);
            let saw = (phase >> 16) as i32 - 32768;
            *r = saw + sine.at(phase);
        }
    });
}

/// A sine driven harder and harder into a wavefolder, as on a west-coast synth, with an offset
/// drifting in so that even harmonics join the odd ones.
pub fn wavefold(table: &mut [i16], len: usize) {
    let one = cycle(&Sine::new(), len);
    frames_of(table, len, |f, frames, raw| {
        let t = through(f, frames);
        let drive = ((1.0 + 8.0 * t * t) * 256.0) as i32;
        let offset = (t * 0.35 * 32768.0) as i32;
        for (i, r) in raw.iter_mut().enumerate() {
            let v = ((one[i] as i32 * drive) >> 8) + offset + 32768;
            // Folded back at each end of the range: a triangle of the input.
            let p = v & 0x1FFFF;
            *r = (if p > 0x10000 { 0x20000 - p } else { p }) - 32768;
        }
    });
}

/// A plucked string: a burst of noise with the pick's position notched out of it, losing its
/// highs as it rings. A string keeps ringing as it dulls; the table holds that with the level kept.
pub fn pluck(table: &mut [i16], len: usize) {
    let mut noise = [0i32; MAX_LEN];
    let mut lfsr = 0xACE1u32;
    for n in noise[..len].iter_mut() {
        lfsr = (lfsr >> 1) ^ (0u32.wrapping_sub(lfsr & 1) & 0xB400);
        *n = (lfsr & 0xFFFF) as i32 - 32768;
    }
    // Plucked a fifth of the way along: every fifth harmonic is missing.
    let mut picked = [0i32; MAX_LEN];
    for i in 0..len {
        picked[i] = noise[i] - noise[(i + len / 5) % len];
    }
    frames_of(table, len, |f, frames, raw| {
        // Two passes of a moving average, round the cycle: its width grows as a string's highs go.
        let width = exp2(through(f, frames) * (len / 8).ilog2() as f32) as usize;
        let mut pass = [0i32; MAX_LEN];
        moving_average(&picked[..len], &mut pass[..len], width);
        moving_average(&pass[..len], raw, width);
    });
}

/// `width` samples averaged, round the cycle.
fn moving_average(from: &[i32], to: &mut [i32], width: usize) {
    let len = from.len();
    // (at most 64 samples of 17 bits: a 32-bit division is the hardware's)
    let mut sum: i32 = (0..width).map(|k| from[k % len]).sum();
    let div = width as i32;
    for (i, out) in to.iter_mut().enumerate() {
        *out = sum / div;
        sum += from[(i + width) % len] - from[i];
    }
}

const WALK_TOP: f32 = 32.0;

/// A narrow peak walking up the harmonic series: scanning it plays the harmonics in turn, as an
/// overtone singer does.
pub fn harmonics(table: &mut [i16], len: usize) {
    let sine = Sine::new();
    let one = cycle(&sine, len);
    frames_of(table, len, |f, frames, raw| {
        let c = 1.0 + (WALK_TOP - 1.0) * through(f, frames);
        let mut amps = [(0, 0); 6];
        let mut n = 0;
        for h in 1..=(len / 2 - 1).min(WALK_TOP as usize + 4) {
            let x = (h as f32 - c) / 0.8;
            if (-2.5..=2.5).contains(&x) {
                let r = resonance(x);
                amps[n] = (h, (r * r * r * 4096.0) as i32);
                n += 1;
            }
        }
        additive(raw, &one, &amps[..n]);
    });
}

/// An old machine's frame: a short waveform losing bits and sample rate together.
pub fn crush(table: &mut [i16], len: usize) {
    let one = cycle(&Sine::new(), len);
    let mask = len - 1;
    frames_of(table, len, |f, frames, raw| {
        let t = through(f, frames);
        let hold = 1 + (t * t * (len / 12) as f32) as usize;
        let drop_bits = (t * 13.0) as u32;
        for (i, r) in raw.iter_mut().enumerate() {
            let at = i - i % hold;
            let v = one[at] as i32 + one[(at * 3) & mask] as i32 / 2 + one[(at * 5) & mask] as i32 / 4;
            *r = (v >> drop_bits) << drop_bits;
        }
    });
}

/// Seven saws spreading apart in phase. Their sum is a comb that sweeps as they spread, until they
/// are evenly spaced and all but every seventh harmonic has cancelled.
pub fn swarm(table: &mut [i16], len: usize) {
    const SAWS: u32 = 7;
    let step = step_of(1.0, len);
    let whole = u32::MAX / SAWS;
    frames_of(table, len, |f, frames, raw| {
        let spread = (through(f, frames) * whole as f32) as u32;
        for (i, r) in raw.iter_mut().enumerate() {
            let theta = step.wrapping_mul(i as u32);
            let mut sum = 0;
            for k in 0..SAWS {
                sum += (theta.wrapping_add(spread.wrapping_mul(k)) >> 16) as i32 - 32768;
            }
            *r = sum;
        }
    });
}

/// One of the tables: its name on the screens, its shape, and what makes it.
pub struct Spec {
    pub name: &'static str,
    pub frame_log2: u8,
    pub frames: u16,
    pub make: fn(&mut [i16], usize),
}

/// In the order they are offered. Saved patches refer to tables by number, so new ones go last.
pub const SET: [Spec; 9] = [
    Spec { name: "VOWELS", frame_log2: 9, frames: 25, make: vowels },
    Spec { name: "FM BELL", frame_log2: 9, frames: 65, make: fm_bell },
    Spec { name: "CZ RESO", frame_log2: 9, frames: 48, make: cz_reso },
    Spec { name: "HARD SYNC", frame_log2: 9, frames: 48, make: hard_sync },
    Spec { name: "WAVEFOLD", frame_log2: 9, frames: 48, make: wavefold },
    Spec { name: "PLUCK", frame_log2: 9, frames: 48, make: pluck },
    Spec { name: "HARMONICS", frame_log2: 9, frames: 63, make: harmonics },
    Spec { name: "CRUSH 256", frame_log2: 8, frames: 32, make: crush },
    Spec { name: "SWARM", frame_log2: 9, frames: 32, make: swarm },
];

#[cfg(test)]
mod tests {
    use super::*;
    use std::vec;
    use std::vec::Vec;

    fn built(spec: &Spec) -> Vec<i16> {
        let len = 1usize << spec.frame_log2;
        let mut table = vec![0i16; len * spec.frames as usize];
        (spec.make)(&mut table, len);
        table
    }

    fn spec(name: &str) -> &'static Spec {
        SET.iter().find(|s| s.name == name).unwrap()
    }

    fn frame(table: &[i16], spec: &Spec, f: usize) -> Vec<i16> {
        let len = 1usize << spec.frame_log2;
        table[f * len..(f + 1) * len].to_vec()
    }

    /// The strength of harmonic `h`.
    fn harmonic(frame: &[i16], h: usize) -> f64 {
        let n = frame.len() as f64;
        let (mut re, mut im) = (0.0, 0.0);
        for (i, s) in frame.iter().enumerate() {
            let a = std::f64::consts::TAU * (h * i) as f64 / n;
            re += *s as f64 * a.cos();
            im += *s as f64 * a.sin();
        }
        (re * re + im * im).sqrt() * 2.0 / n
    }

    /// The balance of a frame's harmonics: how bright it is.
    fn brightness(frame: &[i16]) -> f64 {
        let top = (frame.len() / 2 - 1).min(100);
        let (mut sum, mut weighted) = (0.0, 0.0);
        for h in 1..=top {
            let a = harmonic(frame, h);
            sum += a;
            weighted += a * h as f64;
        }
        weighted / sum.max(1e-9)
    }

    fn strongest(frame: &[i16], from: usize, to: usize) -> usize {
        (from..=to).max_by(|a, b| harmonic(frame, *a).total_cmp(&harmonic(frame, *b))).unwrap()
    }

    #[test]
    fn the_sine_lookup_is_a_sine() {
        let s = Sine::new();
        for i in 0..4096u32 {
            let want = (i as f64 / 4096.0 * std::f64::consts::TAU).sin() * 32767.0;
            let got = s.at(i << 20) as f64;
            assert!((got - want).abs() < 3.0, "{i}: {got} vs {want}");
        }
    }

    #[test]
    fn every_table_has_a_legal_shape_and_a_short_enough_name() {
        for s in &SET {
            assert!((8..=9).contains(&s.frame_log2), "{}", s.name);
            assert!(s.frames > 1 && s.frames <= 1024, "{}", s.name);
            assert!(!s.name.is_empty() && s.name.len() <= 11, "{}", s.name);
        }
    }

    #[test]
    fn every_frame_of_every_table_is_at_the_same_level_with_no_dc() {
        for s in &SET {
            let table = built(s);
            for f in 0..s.frames as usize {
                let fr = frame(&table, s, f);
                let peak = fr.iter().map(|v| (*v as i32).abs()).max().unwrap();
                let mean = fr.iter().map(|v| *v as i64).sum::<i64>() / fr.len() as i64;
                assert!((PEAK - 64..=PEAK).contains(&peak), "{} frame {f}: peak {peak}", s.name);
                assert!(mean.abs() < 40, "{} frame {f}: DC {mean}", s.name);
            }
        }
    }

    #[test]
    fn no_table_stands_still_and_no_two_are_alike() {
        let tables: Vec<Vec<i16>> = SET.iter().map(built).collect();
        for (s, t) in SET.iter().zip(&tables) {
            // Against the middle too: FM BELL ends as it began, a plain sine.
            let a = frame(t, s, 0);
            let most = [s.frames as usize * 3 / 8, s.frames as usize - 1]
                .iter()
                .map(|f| {
                    let b = frame(t, s, *f);
                    a.iter().zip(&b).filter(|(x, y)| (**x as i32 - **y as i32).abs() > 500).count()
                })
                .max()
                .unwrap();
            assert!(most > a.len() / 4, "{}: its frames are too alike", s.name);
        }
        for i in 0..SET.len() {
            for j in i + 1..SET.len() {
                assert_ne!(tables[i], tables[j], "{} and {}", SET[i].name, SET[j].name);
            }
        }
    }

    #[test]
    fn vowels_have_their_formants_where_a_voice_has_them() {
        let s = spec("VOWELS");
        let t = built(s);
        let (a, i) = (frame(&t, s, 0), frame(&t, s, s.frames as usize / 2));
        // A: a first formant at 730 Hz, about the 7th harmonic of 110 Hz. I: down at 270 Hz.
        let first_a = strongest(&a, 1, 12);
        assert!((5..=8).contains(&first_a), "A's first formant at harmonic {first_a}");
        let first_i = strongest(&i, 1, 12);
        assert!((1..=4).contains(&first_i), "I's first formant at harmonic {first_i}");
        // I's second formant is far above A's: at 2290 Hz, the 21st, against 1090 Hz.
        let upper = |f: &[i16]| (17..=24).map(|h| harmonic(f, h)).sum::<f64>();
        assert!(upper(&i) > upper(&a) * 1.5, "{} vs {}", upper(&i), upper(&a));
    }

    #[test]
    fn fm_returns_to_a_sine_between_ratios_and_has_the_ratios_sidebands_at_its_swell() {
        let s = spec("FM BELL");
        let t = built(s);
        let frames = s.frames as usize;
        for f in [0, (frames - 1) / 4, (frames - 1) / 2, frames - 1] {
            let fr = frame(&t, s, f);
            let others: f64 = (2..=16).map(|h| harmonic(&fr, h)).sum();
            assert!(others < harmonic(&fr, 1) * 0.05, "frame {f}: {others}");
        }
        // Half way into the ratio of 7: the sidebands are 7 either side of the carrier.
        let swell = frame(&t, s, (frames - 1) * 7 / 8);
        assert!(harmonic(&swell, 8) > harmonic(&swell, 4) * 4.0, "{} {}", harmonic(&swell, 8), harmonic(&swell, 4));
    }

    #[test]
    fn the_sweeps_get_brighter_and_the_pluck_duller() {
        for name in ["CZ RESO", "HARD SYNC", "WAVEFOLD", "HARMONICS"] {
            let s = spec(name);
            let t = built(s);
            let at = |f: usize| brightness(&frame(&t, s, f));
            let (a, b, c) = (at(0), at(s.frames as usize / 2), at(s.frames as usize - 1));
            assert!(a < b && b < c, "{name}: {a} {b} {c}");
        }
        let s = spec("PLUCK");
        let t = built(s);
        let at = |f: usize| brightness(&frame(&t, s, f));
        let (a, b, c) = (at(0), at(s.frames as usize / 2), at(s.frames as usize - 1));
        assert!(a > b && b > c, "PLUCK: {a} {b} {c}");
    }

    #[test]
    fn the_pluck_ends_as_little_more_than_its_fundamental_and_misses_its_pick_harmonics() {
        let s = spec("PLUCK");
        let t = built(s);
        let last = frame(&t, s, s.frames as usize - 1);
        let low = strongest(&last, 1, 40);
        assert!(low <= 4, "the last frame's strongest is harmonic {low}");
        let bright = frame(&t, s, 0);
        let notch = harmonic(&bright, 10) + harmonic(&bright, 20);
        let around = harmonic(&bright, 9) + harmonic(&bright, 11) + harmonic(&bright, 19) + harmonic(&bright, 21);
        assert!(notch * 4.0 < around, "{notch} vs {around}");
    }

    #[test]
    fn the_walk_lands_on_each_harmonic_in_turn() {
        let s = spec("HARMONICS");
        let t = built(s);
        // 63 frames from 1 to 32: every second frame is on a harmonic.
        for h in [1, 2, 3, 5, 8, 13, 21, 32] {
            let f = (h - 1) * 2;
            let fr = frame(&t, s, f);
            assert_eq!(strongest(&fr, 1, 40), h, "frame {f}");
        }
    }

    #[test]
    fn the_crush_ends_with_few_levels_and_long_steps() {
        let s = spec("CRUSH 256");
        let t = built(s);
        let levels = |f: &[i16]| {
            let mut v = f.to_vec();
            v.sort();
            v.dedup();
            v.len()
        };
        let (first, last) = (frame(&t, s, 0), frame(&t, s, s.frames as usize - 1));
        assert!(levels(&first) > 100, "{}", levels(&first));
        assert!(levels(&last) <= 8, "{}", levels(&last));
        let flat = last.windows(2).filter(|w| w[0] == w[1]).count();
        assert!(flat > last.len() / 2);
    }

    #[test]
    fn the_swarm_ends_with_only_every_seventh_harmonic() {
        let s = spec("SWARM");
        let t = built(s);
        let first = frame(&t, s, 0);
        assert!(harmonic(&first, 1) > 1000.0, "starts as one saw, fundamental and all");
        let last = frame(&t, s, s.frames as usize - 1);
        let kept: f64 = [7, 14, 21].iter().map(|h| harmonic(&last, *h)).sum();
        let gone: f64 = [1, 2, 3, 4, 5, 6, 8, 9].iter().map(|h| harmonic(&last, *h)).sum();
        assert!(gone * 10.0 < kept, "{gone} vs {kept}");
    }

    #[test]
    fn frames_change_gradually_enough_to_scan() {
        // No two neighbouring frames of the smooth tables should be unrelated.
        for name in ["VOWELS", "FM BELL", "WAVEFOLD", "SWARM"] {
            let s = spec(name);
            let t = built(s);
            for f in 1..s.frames as usize {
                let (a, b) = (frame(&t, s, f - 1), frame(&t, s, f));
                let dot: f64 = a.iter().zip(&b).map(|(x, y)| *x as f64 * *y as f64).sum();
                let norm = |v: &[i16]| v.iter().map(|x| (*x as f64).powi(2)).sum::<f64>().sqrt();
                let r = dot / (norm(&a) * norm(&b));
                assert!(r > 0.3, "{name} frames {} and {f}: {r}", f - 1);
            }
        }
    }
}
