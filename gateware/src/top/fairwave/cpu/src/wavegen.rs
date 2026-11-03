//! Tables made at boot, so the synth sounds with no USB drive.
//!
//! `harmonic_morph` is a modern table: band-limited key shapes (sine, triangle, saw,
//! square) with the frames between them crossfaded. `naive_pulse` is an old machine's:
//! a short frame and a raw pulse whose width moves, aliasing as it may. Their frame
//! lengths differ on purpose, which is why tables carry their own.
//!
//! They write into `&mut [i16]`, which on the target is a window of PSRAM. Each key
//! frame is built in place and frame 0 (a sine) doubles as the sine table, so this
//! needs no memory of its own.

use crate::geometry::sin_cos;

/// A little under full scale.
pub const PEAK: i32 = 29000;

/// Harmonics in a key frame. All of them are present at any frame length from 256 up
/// (Nyquist of a 256-sample frame is the 128th).
const HARMONICS: usize = 32;

/// Which harmonics a key shape has, and how strong, in 1/4096 of the fundamental.
fn amplitude(shape: Shape, h: usize) -> i32 {
    let odd = h % 2 == 1;
    match shape {
        Shape::Triangle if odd => {
            let sign = if h % 4 == 1 { 1 } else { -1 };
            sign * 4096 / (h * h) as i32
        }
        Shape::Saw => 4096 / h as i32,
        Shape::Square if odd => 4096 / h as i32,
        _ => 0,
    }
}

#[derive(Clone, Copy, PartialEq, Eq, Debug)]
enum Shape {
    Triangle,
    Saw,
    Square,
}

/// What brings a key shape's own peak to about `PEAK`: the shape's largest absolute
/// value for a fundamental of 1.0, with these harmonics, in 1/4096.
fn peak_of(shape: Shape) -> i32 {
    match shape {
        Shape::Triangle => 5053,    // pi^2 / 8 = 1.234
        Shape::Saw => 7585,         // 1.852 with its overshoot
        Shape::Square => 3793,      // pi / 4 = 0.785, and the overshoot of 1.179
    }
}

/// A sine of full-scale `PEAK`.
fn sine(frame: &mut [i16]) {
    let len = frame.len();
    for (i, s) in frame.iter_mut().enumerate() {
        let (sin, _) = sin_cos(i as f32 / len as f32);
        *s = (sin * PEAK as f32) as i16;
    }
}

/// Adds up `shape`'s harmonics, read from `sine_frame` (a sine of peak `PEAK`).
fn additive(frame: &mut [i16], sine_frame: &[i16], shape: Shape) {
    let len = frame.len();
    // The sum is 16 x PEAK x the waveform, and peak_of is 4096 x the waveform's peak;
    // this brings it to PEAK, as a multiply: a division per sample is slow on this CPU.
    let gain = (256i64 << 16) / peak_of(shape) as i64;
    let harmonics = HARMONICS.min(len / 2 - 1);
    let mut amps = [0i32; HARMONICS + 1];
    for h in 1..=harmonics {
        amps[h] = amplitude(shape, h);
    }
    for (i, s) in frame.iter_mut().enumerate() {
        let mut sum = 0i32;
        for h in 1..=harmonics {
            if amps[h] != 0 {
                sum += amps[h] * sine_frame[(i * h) & (len - 1)] as i32 >> 8;
            }
        }
        *s = ((sum as i64 * gain >> 16) as i32).clamp(-32767, 32767) as i16;
    }
}

/// Samples the crossfade handles at a time: one data-cache line. Frames of 2048 samples
/// are 4 KB apart and the cache is 4 KB and direct-mapped, so reading two frames and
/// writing a third sample by sample would evict the line it needs next, every time.
const CHUNK: usize = 32;

/// Frames that go from sine to triangle to saw to square, smoothly: the key shapes at
/// the frames of `keys` and straight crossfades between.
pub fn harmonic_morph(table: &mut [i16], frame_len: usize) {
    let frames = table.len() / frame_len;
    if frames == 0 {
        return;
    }
    let keys = [0, (frames - 1) / 3, 2 * (frames - 1) / 3, frames - 1];
    let shapes = [Shape::Triangle, Shape::Saw, Shape::Square];

    let (first, rest) = table.split_at_mut(frame_len);
    sine(first);
    for (k, shape) in keys[1..].iter().zip(shapes) {
        if *k > 0 {
            let frame = &mut rest[(*k - 1) * frame_len..*k * frame_len];
            additive(frame, first, shape);
        }
    }
    for pair in keys.windows(2) {
        let (a, b) = (pair[0], pair[1]);
        for f in a + 1..b {
            let w = ((f - a) * 65536 / (b - a)) as i32;
            for start in (0..frame_len).step_by(CHUNK) {
                let n = CHUNK.min(frame_len - start);
                let (mut xs, mut ys) = ([0i16; CHUNK], [0i16; CHUNK]);
                xs[..n].copy_from_slice(&table[a * frame_len + start..][..n]);
                ys[..n].copy_from_slice(&table[b * frame_len + start..][..n]);
                let out = &mut table[f * frame_len + start..][..n];
                for i in 0..n {
                    let (x, y) = (xs[i] as i32, ys[i] as i32);
                    out[i] = (x + ((y - x) * w >> 16)) as i16;
                }
            }
        }
    }
}

/// A raw pulse in every frame, its width going from half the cycle down to a sliver.
pub fn naive_pulse(table: &mut [i16], frame_len: usize) {
    let frames = table.len() / frame_len;
    for f in 0..frames {
        // From 1/2 of the cycle at frame 0 to 1/32 at the last.
        let from = frame_len / 2;
        let to = frame_len / 32;
        let width = if frames > 1 { from - (from - to) * f / (frames - 1) } else { from };
        let frame = &mut table[f * frame_len..(f + 1) * frame_len];
        for (i, s) in frame.iter_mut().enumerate() {
            *s = if i < width { (PEAK / 2) as i16 } else { -((PEAK / 2) as i16) };
        }
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    fn dft_magnitude(frame: &[i16], h: usize) -> f64 {
        let n = frame.len() as f64;
        let (mut re, mut im) = (0.0, 0.0);
        for (i, s) in frame.iter().enumerate() {
            let a = std::f64::consts::TAU * (h * i) as f64 / n;
            re += *s as f64 * a.cos();
            im += *s as f64 * a.sin();
        }
        (re * re + im * im).sqrt() / n * 2.0
    }

    fn morph(frames: usize, len: usize) -> Vec<i16> {
        let mut t = vec![0i16; frames * len];
        harmonic_morph(&mut t, len);
        t
    }

    #[test]
    fn the_key_frames_are_the_shapes() {
        let t = morph(31, 2048);
        let frame = |k: usize| &t[k * 2048..(k + 1) * 2048];
        // Frame 0: a pure sine.
        assert!(dft_magnitude(frame(0), 1) > 28000.0);
        assert!(dft_magnitude(frame(0), 2) < 10.0);
        // The last frame: a square, odd harmonics only, falling as 1/h.
        let sq = frame(30);
        let f = dft_magnitude(sq, 1);
        assert!(dft_magnitude(sq, 2) < f / 100.0);
        assert!((dft_magnitude(sq, 3) / f - 1.0 / 3.0).abs() < 0.01);
        // The saw is at a third: every harmonic, falling as 1/h.
        let saw = frame(20);
        let f = dft_magnitude(saw, 1);
        assert!((dft_magnitude(saw, 2) / f - 0.5).abs() < 0.01);
        assert!((dft_magnitude(saw, 3) / f - 1.0 / 3.0).abs() < 0.01);
    }

    #[test]
    fn every_frame_is_loud_and_nothing_clips() {
        for (frames, len) in [(31usize, 2048usize), (16, 256), (4, 512), (1, 1024), (2, 256)] {
            let t = morph(frames, len);
            for f in 0..frames {
                let frame = &t[f * len..(f + 1) * len];
                let peak = frame.iter().map(|s| (*s as i32).abs()).max().unwrap();
                // (crossfades between shapes whose peaks fall at different phases dip,
                // about 4 dB at worst: part of the table's character, not normalised)
                assert!(peak > 18000, "{frames}x{len} frame {f} peak {peak}");
                assert!(peak < 32767, "{frames}x{len} frame {f} clips: {peak}");
            }
        }
    }

    #[test]
    fn the_morph_is_smooth() {
        // Neighbouring frames differ by little compared with their size.
        let t = morph(31, 512);
        for f in 0..30 {
            let worst = (0..512)
                .map(|i| ((t[f * 512 + i] as i32) - (t[(f + 1) * 512 + i] as i32)).abs())
                .max()
                .unwrap();
            assert!(worst < 12000, "frames {f} and {} differ by {worst}", f + 1);
        }
    }

    #[test]
    fn the_pulse_narrows_across_the_table() {
        let mut t = vec![0i16; 16 * 256];
        naive_pulse(&mut t, 256);
        let width = |f: usize| t[f * 256..(f + 1) * 256].iter().filter(|s| **s > 0).count();
        assert_eq!(width(0), 128);
        assert_eq!(width(15), 8);
        for f in 0..15 {
            assert!(width(f) > width(f + 1));
        }
    }

    #[test]
    fn a_short_table_is_handled() {
        let mut t = vec![0i16; 256];
        naive_pulse(&mut t, 256);
        assert_eq!(t.iter().filter(|s| **s > 0).count(), 128);
    }
}
