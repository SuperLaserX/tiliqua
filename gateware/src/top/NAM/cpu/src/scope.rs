//! The Scope screen's arithmetic: a captured block of input and output samples made into two
//! traces (triggered, scaled) and two spectra (a fixed-point FFT, in log-spaced bands). No drawing.
//!
//! A block is `N` samples (21 ms at 48 kHz: the FFT's bins are 47 Hz apart). The traces show
//! `TRACE_SAMPLES` of it from the input's first rising zero crossing, each scaled to its own peak
//! (smoothed between blocks, and never more than `MAX_GAIN`, so silence stays flat). The spectra
//! are the block through a Hann window and a radix-2 FFT in integers (the CPU has no FPU), each
//! band the loudest bin in it, in dB of full scale.

use crate::gate::power_db;
use crate::geometry::sin_cos;
use crate::quant;

pub const N: usize = 1024;
const LOG2_N: u32 = 10;
pub const TRACE_SAMPLES: usize = 320;
pub const TRACE_POINTS: usize = 160;
pub const BANDS: usize = 48;
pub const BAND_LOW_HZ: f64 = 40.0;
pub const BAND_HIGH_HZ: f64 = 20000.0;
pub const FS: f64 = 48000.0;
/// The spectrum's floor, in dB of full scale.
pub const FLOOR_DB: i32 = -90;
/// The most a trace is magnified: 36 dB.
const MAX_GAIN_Q8: i32 = 64 * 256;

/// The tables and the working space, all plain integers (the firmware keeps it in PSRAM, zeroed,
/// then `init`).
pub struct Scope {
    cos: [i32; N / 2],
    sin: [i32; N / 2],
    window: [i32; N],
    /// Each band's bins, [first, last].
    bands: [(u16, u16); BANDS],
    reference_db: i32,
    pub re: [i32; N],
    pub im: [i32; N],
    /// The traces' gains (Q8), carried from block to block.
    gain: [i32; 2],
}

impl Scope {
    /// Fills the tables.
    pub fn init(&mut self) {
        for k in 0..N / 2 {
            let (s, c) = sin_cos(k as f32 / N as f32);
            self.cos[k] = (c * 32767.0) as i32;
            self.sin[k] = (s * 32767.0) as i32;
        }
        for i in 0..N {
            // Hann: (1 - cos(2 pi i / N)) / 2
            let (_, c) = sin_cos(i as f32 / N as f32);
            self.window[i] = ((1.0 - c) * 0.5 * 32767.0) as i32;
        }
        let ratio = BAND_HIGH_HZ / BAND_LOW_HZ;
        for b in 0..BANDS {
            let lo = BAND_LOW_HZ * quant::exp(b as f64 / BANDS as f64 * ln(ratio));
            let hi = BAND_LOW_HZ * quant::exp((b + 1) as f64 / BANDS as f64 * ln(ratio));
            let bin = |f: f64| ((f * N as f64 / FS + 0.5) as usize).clamp(1, N / 2 - 1) as u16;
            let (a, z) = (bin(lo), bin(hi));
            self.bands[b] = (a, z.max(a));
        }
        // A full-scale sine at a bin's centre: amplitude 32767, Hann's coherent gain 1/2, the
        // input at << 14 and a halving at each of the FFT's stages.
        let peak = 32767u64 * (1 << 14) * (N as u64 / 4) / (1 << LOG2_N);
        self.reference_db = power_db(peak * peak);
        self.gain = [256, 256];
    }

    /// The spectrum of `x` in dB of full scale (1/256 dB), a value a band.
    pub fn spectrum(&mut self, x: &[i16]) -> [i32; BANDS] {
        for i in 0..N {
            self.re[i] = ((x[i] as i32 * self.window[i]) >> 15) << 14;
            self.im[i] = 0;
        }
        self.fft();
        let mut out = [FLOOR_DB * 256; BANDS];
        for (b, &(lo, hi)) in self.bands.iter().enumerate() {
            let mut best = 0u64;
            for k in lo..=hi {
                let (r, i) = (self.re[k as usize] as i64, self.im[k as usize] as i64);
                best = best.max((r * r + i * i) as u64);
            }
            if best > 0 {
                out[b] = (power_db(best) - self.reference_db).max(FLOOR_DB * 256);
            }
        }
        out
    }

    /// In place on `re`, `im`: decimation in time, the input bit-reversed first, each stage halved.
    fn fft(&mut self) {
        for i in 0..N {
            let j = (i as u32).reverse_bits() >> (32 - LOG2_N);
            if (j as usize) > i {
                self.re.swap(i, j as usize);
                self.im.swap(i, j as usize);
            }
        }
        let mut len = 2;
        while len <= N {
            let step = N / len;
            for start in (0..N).step_by(len) {
                for k in 0..len / 2 {
                    let (wc, ws) = (self.cos[k * step] as i64, self.sin[k * step] as i64);
                    let (a, b) = (start + k, start + k + len / 2);
                    let (br, bi) = (self.re[b] as i64, self.im[b] as i64);
                    // b times e^(-2 pi i k / len)
                    let tr = ((br * wc + bi * ws) >> 15) as i32;
                    let ti = ((bi * wc - br * ws) >> 15) as i32;
                    let (ar, ai) = (self.re[a], self.im[a]);
                    self.re[a] = (ar >> 1) + (tr >> 1);
                    self.im[a] = (ai >> 1) + (ti >> 1);
                    self.re[b] = (ar >> 1) - (tr >> 1);
                    self.im[b] = (ai >> 1) - (ti >> 1);
                }
            }
            len *= 2;
        }
    }

    /// Trace `which` (0 the input, 1 the output): `TRACE_POINTS` heights in -`half`..`half` from
    /// `TRACE_SAMPLES` of `x` from `start`, scaled to the trace's peak.
    pub fn trace(&mut self, which: usize, x: &[i16], start: usize, half: i32) -> [i16; TRACE_POINTS] {
        let span = &x[start..start + TRACE_SAMPLES];
        let peak = span.iter().map(|v| (*v as i32).abs()).max().unwrap_or(0).max(1);
        // the gain that puts the peak at 90% of the height, where the full scale is `half`
        let want = ((half as i64 * 9 * 256 * 32768) / (10 * half as i64 * peak as i64)) as i32;
        let want = want.clamp(256, MAX_GAIN_Q8);
        let g = &mut self.gain[which];
        // down at once (no clipping), up slowly (no pumping)
        *g = if want < *g { want } else { *g + ((want - *g) >> 3) };
        let mut out = [0i16; TRACE_POINTS];
        let per = TRACE_SAMPLES / TRACE_POINTS;
        for (p, o) in out.iter_mut().enumerate() {
            // (the larger of each point's samples, keeping its sign, so peaks aren't skipped)
            let v = span[p * per..(p + 1) * per].iter().copied().max_by_key(|v| (*v as i32).abs()).unwrap_or(0);
            let y = (v as i64 * *g as i64 * half as i64) / (256 * 32768);
            *o = y.clamp(-(half as i64), half as i64) as i16;
        }
        out
    }
}

fn ln(x: f64) -> f64 {
    // natural log for x > 1, by halving to [1, 2) and a series
    let mut k = 0;
    let mut v = x;
    while v >= 2.0 {
        v /= 2.0;
        k += 1;
    }
    let y = (v - 1.0) / (v + 1.0);
    let y2 = y * y;
    let mut term = y;
    let mut sum = 0.0;
    for n in 0..30 {
        sum += term / (2 * n + 1) as f64;
        term *= y2;
    }
    2.0 * sum + k as f64 * core::f64::consts::LN_2
}

/// Where the input first rises through zero (with some hysteresis) in the first part of the block,
/// so the trace starts there; 0 if it doesn't.
pub fn trigger(x: &[i16]) -> usize {
    let limit = N - TRACE_SAMPLES;
    let peak = x[..limit].iter().map(|v| (*v as i32).abs()).max().unwrap_or(0);
    let hyst = (peak / 8).max(16);
    let mut armed = false;
    for i in 1..limit {
        if (x[i] as i32) < -hyst {
            armed = true;
        } else if armed && x[i - 1] < 0 && x[i] >= 0 {
            return i;
        }
    }
    0
}

/// A band's frequency (its low edge), for the screen's labels.
pub fn band_of_hz(hz: f64) -> f64 {
    BANDS as f64 * ln(hz / BAND_LOW_HZ) / ln(BAND_HIGH_HZ / BAND_LOW_HZ)
}

#[cfg(test)]
mod tests {
    use super::*;
    use std::boxed::Box;

    fn scope() -> Box<Scope> {
        let mut s = Box::new(Scope {
            cos: [0; N / 2], sin: [0; N / 2], window: [0; N], bands: [(0, 0); BANDS], reference_db: 0,
            re: [0; N], im: [0; N], gain: [0; 2],
        });
        s.init();
        s
    }

    fn sine(hz: f64, amp: f64) -> std::vec::Vec<i16> {
        (0..N).map(|i| (amp * (2.0 * std::f64::consts::PI * hz * i as f64 / FS).sin()).round() as i16).collect()
    }

    fn band_with(hz: f64) -> usize {
        band_of_hz(hz) as usize
    }

    #[test]
    fn a_full_scale_sine_is_at_0_db_in_its_band_and_the_rest_is_far_below() {
        let mut s = scope();
        for &hz in &[187.5, 1031.25, 4921.875] {
            let x = sine(hz, 32767.0);
            let db = s.spectrum(&x);
            let b = band_with(hz);
            let peak = db.iter().copied().max().unwrap();
            assert!((peak as f64 / 256.0).abs() < 1.0, "{hz} Hz: {}", peak as f64 / 256.0);
            assert!((db[b] - peak).abs() < 2 * 256 || (db[b + 1] - peak).abs() < 2 * 256, "{hz} Hz in band {b}");
            // far from it (two octaves), the window's skirt
            let far = band_with(hz * 4.0).min(BANDS - 1);
            assert!(db[far] < -60 * 256, "{hz} Hz at {} : {}", far, db[far] as f64 / 256.0);
        }
    }

    #[test]
    fn the_spectrum_follows_the_level_and_silence_is_the_floor() {
        let mut s = scope();
        let loud = s.spectrum(&sine(1031.25, 32767.0)).into_iter().max().unwrap();
        let quiet = s.spectrum(&sine(1031.25, 32.767)).into_iter().max().unwrap();
        // 60 dB down, within a dB (the integers keep a -60 dBFS sine)
        assert!(((loud - quiet) as f64 / 256.0 - 60.0).abs() < 1.0, "{}", (loud - quiet) as f64 / 256.0);
        let silence = s.spectrum(&[0; N]);
        assert!(silence.iter().all(|&d| d == FLOOR_DB * 256));
    }

    #[test]
    fn the_bands_rise_with_frequency_and_cover_the_range() {
        let s = scope();
        assert!(s.bands.windows(2).all(|w| w[0].0 <= w[1].0 && w[0].1 <= w[1].1));
        assert_eq!(s.bands[0].0, 1);
        assert!(s.bands[BANDS - 1].1 as usize >= (19000.0 * N as f64 / FS) as usize);
        assert!((ln(10.0) - std::f64::consts::LN_10).abs() < 1e-12);
    }

    #[test]
    fn the_trigger_finds_a_rising_zero_crossing() {
        let x = sine(110.0, 8000.0);
        let t = trigger(&x);
        assert!(t > 0 && x[t - 1] < 0 && x[t] >= 0);
        // the first: a cycle at 110 Hz is 436 samples
        assert!(t < 450);
        assert_eq!(trigger(&[0; N]), 0);
        let noise: std::vec::Vec<i16> = (0..N).map(|i| if i % 2 == 0 { 3 } else { -3 }).collect();
        assert_eq!(trigger(&noise), 0, "within the hysteresis: no trigger");
    }

    #[test]
    fn a_trace_fills_its_height_and_silence_stays_flat() {
        let mut s = scope();
        let x = sine(220.0, 1000.0);
        let mut t = s.trace(0, &x, trigger(&x), 80);
        for _ in 0..40 {
            t = s.trace(0, &x, trigger(&x), 80);
        }
        let top = t.iter().map(|v| v.abs()).max().unwrap();
        assert!((68..=74).contains(&top), "{top}");
        // a loud block: down at once
        let loud = sine(220.0, 30000.0);
        let t = s.trace(0, &loud, trigger(&loud), 80);
        assert!(t.iter().map(|v| v.abs()).max().unwrap() <= 80);
        let mut s = scope();
        let hiss: std::vec::Vec<i16> = (0..N).map(|i| (i % 5) as i16 - 2).collect();
        let mut flat = s.trace(1, &hiss, 0, 80);
        for _ in 0..100 {
            flat = s.trace(1, &hiss, 0, 80);
        }
        assert!(flat.iter().map(|v| v.abs()).max().unwrap() <= 1, "hiss magnified at most 36 dB");
    }
}
