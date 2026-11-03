//! The preview on the Envelopes screen: the shape an envelope or LFO makes, as a polyline in
//! a box of `w` by `h` pixels, with y down from the box's top.
//!
//! It uses the gateware's own arithmetic for the shape, so what you see is what plays, but
//! not its timing: a time's width on screen follows its index in the time scale, which is
//! logarithmic, because a 2 ms attack next to a 2 s release would otherwise be invisible.

use heapless::Vec;

use crate::modulation::*;

pub const POINTS: usize = 48;
pub type Polyline = Vec<(i16, i16), POINTS>;

/// How many lines draw a curved segment.
const SEGMENT_LINES: i64 = 8;
/// The width a sustain gets, on the same scale as a time's index.
const SUSTAIN_WIDTH: i64 = 30;
/// The width of a time of zero.
const MIN_WIDTH: i64 = 6;

/// A segment's position (U0.16) through its curve (`model/modulation.py`).
pub fn shape(mut u: i64, c: i64) -> i64 {
    for _ in 0..2 {
        u -= (c * ((u * (ONE - u)) >> 16)) >> 16;
    }
    u
}

/// An envelope, from silence to silence. Looping there is no sustain, and the release leads
/// straight back into the delay.
pub fn envelope(e: &Envelope, w: i32, h: i32) -> Polyline {
    let sustain = e.sustain as i64 * ONE / 100;
    let widths = |t: u8| MIN_WIDTH + t as i64;
    let held = e.looping == LoopMode::Off;
    let total = widths(e.delay) + widths(e.attack) + widths(e.hold) + widths(e.decay)
        + if held { SUSTAIN_WIDTH } else { 0 } + widths(e.release);

    let mut pts = Polyline::new();
    let mut at = 0i64;
    let mut push = |x: i64, level: i64| {
        let px = x * w as i64 / total;
        let py = h as i64 - level * h as i64 / ONE;
        pts.push((px as i16, py as i16)).ok();
    };
    push(0, 0);

    at += widths(e.delay);
    push(at, 0);

    let segment = |width: i64, from: i64, to: i64, curve: i8, start: i64, push: &mut dyn FnMut(i64, i64)| {
        let c = (curve_bits(curve) as i64) << 8;
        for k in 1..=SEGMENT_LINES {
            let y = if k == SEGMENT_LINES { ONE } else { shape(k * ONE / SEGMENT_LINES, c) };
            push(start + width * k / SEGMENT_LINES, from + (((to - from) * y) >> 16));
        }
    };

    segment(widths(e.attack), 0, ONE, e.curves[0], at, &mut push);
    at += widths(e.attack);
    at += widths(e.hold);
    push(at, ONE);
    segment(widths(e.decay), ONE, sustain, e.curves[1], at, &mut push);
    at += widths(e.decay);
    if held {
        at += SUSTAIN_WIDTH;
        push(at, sustain);
    }
    segment(widths(e.release), sustain, 0, e.curves[2], at, &mut push);
    pts
}

/// Where an envelope has got to on its preview, in pixels across, from the stage it is in and
/// how far through it (`progress` is 0 to 255). None while it is idle.
pub fn envelope_x(e: &Envelope, stage: u8, progress: u8, w: i32) -> Option<i32> {
    let widths = |t: u8| MIN_WIDTH + t as i64;
    let held = e.looping == LoopMode::Off;
    let sustain = if held { SUSTAIN_WIDTH } else { 0 };
    let segments = [widths(e.delay), widths(e.attack), widths(e.hold), widths(e.decay), sustain, widths(e.release)];
    let total: i64 = segments.iter().sum();
    let stage = stage as usize;
    if stage == 0 || stage > segments.len() {
        return None;
    }
    let before: i64 = segments[..stage - 1].iter().sum();
    let within = segments[stage - 1] * progress as i64 / 256;
    Some(((before + within) * w as i64 / total) as i32)
}

/// Where an LFO has got to on its preview: `phase` is 0 to 255. (The preview starts at phase 0
/// of its cycle, with the offset already in its shape.)
pub const fn lfo_x(phase: u8, w: i32) -> i32 {
    phase as i32 * w / 256
}

/// An LFO's waveform, over one cycle. (Random has no one shape: this is a stand-in, some
/// steps at random-looking heights.)
pub fn lfo(l: &Lfo, w: i32, h: i32) -> Polyline {
    const STEPS: [i64; 8] = [20000, -41000, 52000, 3000, -60000, 33000, -14000, 61000];
    const LINES: i64 = (POINTS - 1) as i64;
    let offset = l.phase as i64 * 65536 / 360;
    let mut pts = Polyline::new();
    for k in 0..=LINES {
        let x = (k * 65536 / LINES + offset) & 0xFFFF;
        let y = match l.shape {
            Shape::Sine => {
                let s = if x & 0x8000 != 0 { x - 0x10000 } else { x };
                (s * (0x8000 - s.abs())) >> 12
            }
            Shape::Triangle => {
                if x < 0x4000 {
                    x * 4
                } else if x < 0xC000 {
                    2 * ONE - x * 4
                } else {
                    x * 4 - 4 * ONE
                }
            }
            Shape::SawUp => x * 2 - ONE,
            Shape::SawDown => ONE - x * 2,
            Shape::Square => {
                if x < 0x8000 { ONE } else { -ONE }
            }
            Shape::Random => STEPS[(x >> 13) as usize],
        };
        let (y, level) = (y * l.level as i64 / 100, l.level as i64);
        let py = if l.unipolar {
            // (from nothing to its level, as the gateware's y is before scaling)
            let unit = (y * 100 / level.max(1) + ONE) >> 1;
            h as i64 - unit * level * h as i64 / 100 / ONE
        } else {
            h as i64 / 2 - y * h as i64 / 2 / ONE
        };
        pts.push(((k * w as i64 / LINES) as i16, py as i16)).ok();
    }
    pts
}

#[cfg(test)]
mod tests {
    use super::*;

    const W: i32 = 400;
    const H: i32 = 150;

    fn check(p: &Polyline) {
        assert!(p.len() >= 2);
        for (x, y) in p.iter() {
            assert!((0..=W as i16).contains(x), "x {x}");
            assert!((0..=H as i16).contains(y), "y {y}");
        }
        for w in p.windows(2) {
            assert!(w[1].0 >= w[0].0, "goes backwards: {w:?}");
        }
    }

    fn base() -> Envelope {
        Envelope::default_for(0)
    }

    #[test]
    fn an_envelope_stays_in_its_box_for_any_setting() {
        for time in [0, 1, 60, TIME_MAX] {
            for sustain in [0, 50, 100] {
                for curve in [-100, 0, 100] {
                    let mut e = base();
                    e.delay = time;
                    e.attack = TIME_MAX - time;
                    e.hold = time;
                    e.decay = time;
                    e.release = TIME_MAX - time;
                    e.sustain = sustain;
                    e.curves = [curve; 3];
                    for looping in [LoopMode::Off, LoopMode::Gated, LoopMode::Free] {
                        e.looping = looping;
                        check(&envelope(&e, W, H));
                    }
                }
            }
        }
    }

    #[test]
    fn it_starts_and_ends_at_silence_and_spans_the_box() {
        let p = envelope(&base(), W, H);
        assert_eq!(p[0], (0, H as i16));
        assert_eq!(*p.last().unwrap(), (W as i16, H as i16));
        assert!(p.iter().any(|&(_, y)| y == 0), "reaches the top");
    }

    #[test]
    fn a_sustain_shows_at_its_level_unless_looping() {
        let mut e = base();
        e.sustain = 50;
        let mid = H as i16 / 2;
        let flat = |p: &Polyline| p.windows(2).any(|w| w[0].1 == mid && w[1].1 == mid && w[1].0 > w[0].0);
        assert!(flat(&envelope(&e, W, H)));
        e.looping = LoopMode::Free;
        assert!(!flat(&envelope(&e, W, H)), "looping, a cycle doesn't wait there");
    }

    #[test]
    fn a_positive_curve_starts_fast() {
        let mut e = base();
        e.delay = 0;
        e.attack = 60;
        e.curves = [100, 0, 0];
        let fast = envelope(&e, W, H);
        e.curves = [-100, 0, 0];
        let slow = envelope(&e, W, H);
        assert!(fast[3].1 < slow[3].1, "{:?} vs {:?}", fast[3], slow[3]);
    }

    #[test]
    fn a_shorter_time_is_narrower() {
        let mut e = base();
        e.decay = 10;
        let a = envelope(&e, W, H);
        e.decay = 100;
        let b = envelope(&e, W, H);
        let top_end = |p: &Polyline| p.iter().rev().find(|&&(_, y)| y == 0).unwrap().0;
        assert_eq!(top_end(&a) > top_end(&b), true, "the same time before it, in less of the box");
    }

    #[test]
    fn the_playhead_follows_the_stages_along_the_curve() {
        let e = base();
        assert_eq!(envelope_x(&e, 0, 0, W), None, "idle: nowhere");
        let mut last = -1;
        for stage in 1..=6 {
            for progress in [0u8, 128, 255] {
                if stage == 5 && progress > 0 {
                    continue; // (the sustain doesn't progress)
                }
                let x = envelope_x(&e, stage, progress, W).unwrap();
                assert!(x >= last, "stage {stage} at {progress}: {x} after {last}");
                assert!((0..=W).contains(&x));
                last = x;
            }
        }
        assert!(last > W * 9 / 10, "ends near the far side: {last}");
    }

    #[test]
    fn the_playhead_lines_up_with_the_curves_corners() {
        // The top of the curve is where the attack ends.
        let mut e = base();
        e.delay = 20;
        e.attack = 40;
        e.hold = 0;
        let curve = envelope(&e, W, H);
        let top = curve.iter().find(|&&(_, y)| y == 0).unwrap().0 as i32;
        let x = envelope_x(&e, 3, 0, W).unwrap();
        assert!((top - x).abs() <= 2, "{top} vs {x}");
    }

    #[test]
    fn looping_skips_the_sustain_on_the_playhead_too() {
        let mut e = base();
        e.looping = LoopMode::Free;
        let at_decay_end = envelope_x(&e, 4, 255, W).unwrap();
        let at_release = envelope_x(&e, 6, 0, W).unwrap();
        assert!(at_release - at_decay_end <= 2);
    }

    #[test]
    fn an_lfos_playhead_crosses_the_box_once_a_cycle() {
        assert_eq!(lfo_x(0, W), 0);
        assert_eq!(lfo_x(128, W), W / 2);
        assert!(lfo_x(255, W) < W);
    }

    #[test]
    fn an_lfo_stays_in_its_box_for_any_setting() {
        for shape in [Shape::Sine, Shape::Triangle, Shape::SawUp, Shape::SawDown, Shape::Square, Shape::Random] {
            for unipolar in [false, true] {
                for level in [0, 50, 100] {
                    let l = Lfo { rate: 40, shape, unipolar, phase: 75, level, sync: 0 };
                    check(&lfo(&l, W, H));
                }
            }
        }
    }

    #[test]
    fn a_bipolar_sine_swings_about_the_middle() {
        let l = Lfo { rate: 40, shape: Shape::Sine, unipolar: false, phase: 0, level: 100, sync: 0 };
        let p = lfo(&l, W, H);
        assert_eq!(p[0].1, H as i16 / 2);
        assert!(p.iter().map(|&(_, y)| y).min().unwrap() <= 2);
        assert!(p.iter().map(|&(_, y)| y).max().unwrap() >= H as i16 - 2);
    }

    #[test]
    fn a_unipolar_lfo_sits_above_the_bottom_and_level_scales_it() {
        let l = Lfo { rate: 40, shape: Shape::Square, unipolar: true, phase: 0, level: 50, sync: 0 };
        let p = lfo(&l, W, H);
        assert_eq!(p.iter().map(|&(_, y)| y).max().unwrap(), H as i16, "down to nothing");
        assert_eq!(p.iter().map(|&(_, y)| y).min().unwrap(), H as i16 / 2, "up to half");
    }

    #[test]
    fn a_phase_offset_moves_the_start() {
        let mut l = Lfo { rate: 40, shape: Shape::Triangle, unipolar: false, phase: 90, level: 100, sync: 0 };
        assert_eq!(lfo(&l, W, H)[0].1, 0, "a quarter of the way through: at the top");
        l.phase = 0;
        assert_eq!(lfo(&l, W, H)[0].1, H as i16 / 2);
    }
}
