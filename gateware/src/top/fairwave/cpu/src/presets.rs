//! The factory bank: patches that come with the firmware, one to show each thing the synth does.
//! They use only the tables made at boot, by the numbers in `fw/src/tables.rs`, and they sound with
//! nothing patched: what would need a gate runs free, and a rising gate restarts it if there is one.

use crate::modulation::*;
use crate::patch::{Cross, CrossMode, Edge, Patch, ReadStyle};
use crate::store::N_PATCHES;

// The tables made at boot, in the order saved patches depend on.
const MORPH: u8 = 0;
const PULSE: u8 = 1;
const VOWELS: u8 = 2;
const FM_BELL: u8 = 3;
const HARMONICS: u8 = 8;
const CRUSH: u8 = 9;
const SWARM: u8 = 10;

/// Where the morph table's shapes are, in thousandths of its way through.
const MORPH_SINE: u16 = 0;
const MORPH_TRIANGLE: u16 = 333;

pub const NAMES: [&str; N_PATCHES] =
    ["VOWEL RIDE", "FM CHIME", "RING GLASS", "AM FLUTTER", "CZ BEND", "GRAINS", "TILT SWARM", "LOFI STEPS"];

/// Where a sine or triangle LFO is at zero, unipolar, as its cycle starts: what makes it a grain's window.
const WINDOW_PHASE: u16 = 270;
/// The grains' rates: about 2.6 and 3.6 a second.
const GRAIN_RATES: [u8; 2] = [64, 68];

/// Modulation that takes a slot.
const fn slot(source: Source, dest: Dest, amount: i16) -> Slot {
    Slot { source, dest, amount }
}

/// Hear only the carrier, oscillator 2, on the first two outputs: the modulator is there to modulate.
fn hear_osc2(p: &mut Patch) {
    p.mixer.outs[0] = OutSel::Mix;
    p.mixer.outs[1] = OutSel::Mix;
    p.mixer.balance = 1000;
}

/// V/oct on both, and nothing else, for a patch that wants its own CV 2.
fn cv1_pitch_only(p: &mut Patch) {
    p.slots = [Slot::EMPTY; N_SLOTS];
    p.slots[0] = slot(Source::Cv1, Dest::Pitch1, 200);
    p.slots[1] = slot(Source::Cv1, Dest::Pitch2, 200);
}

/// One of the factory bank's patches.
pub fn preset(i: usize) -> Patch {
    let mut p = Patch::default();
    cv1_pitch_only(&mut p);
    match i {
        // A voice going round its vowels and off the end of the table: position past 100% wraps.
        0 => {
            p.layers[0].table = VOWELS;
            p.layers[1].table = VOWELS;
            p.layers[0].edge = Edge::Wrap;
            p.layers[1].edge = Edge::Mirror;
            p.layers[1].semitones = -12;
            p.lfos[0] = Lfo { rate: 40, shape: Shape::Triangle, unipolar: false, phase: 0, level: 100, sync: 1 };
            p.slots[2] = slot(Source::Lfo1, Dest::Position1, 300);
            p.slots[3] = slot(Source::Lfo1, Dest::Position2, 300);
            p.mixer.outs[0] = OutSel::Mix;
        }
        // Two sines at a bright ratio, the modulator's level dying away as a struck thing's does.
        1 => {
            p.layers[0].table = MORPH;
            p.layers[1].table = MORPH;
            p.layers[0].position = MORPH_SINE;
            p.layers[1].position = MORPH_SINE;
            p.layers[0].semitones = 19;
            p.cross = Cross { mode: CrossMode::Fm, modulator: 0, depth: 400 };
            hear_osc2(&mut p);
            p.envelopes[0] = Envelope {
                gate: 1, delay: 0, attack: 0, hold: 0, decay: 62, sustain: 0, release: 62,
                curves: [0, 100, 100], looping: LoopMode::Free, vca: 1,
            };
            p.envelopes[1] = Envelope {
                gate: 1, delay: 0, attack: 0, hold: 0, decay: 86, sustain: 0, release: 86,
                curves: [0, 100, 100], looping: LoopMode::Free, vca: 2,
            };
        }
        // A rich table multiplied by a sine a fifth up: every partial splits in two, none in tune.
        2 => {
            p.layers[0].table = MORPH;
            p.layers[0].position = MORPH_SINE;
            p.layers[0].semitones = 7;
            p.layers[1].table = HARMONICS;
            p.cross = Cross { mode: CrossMode::Ring, modulator: 0, depth: 1000 };
            hear_osc2(&mut p);
            p.lfos[0] = Lfo { rate: 46, shape: Shape::Sine, unipolar: false, phase: 0, level: 100, sync: 1 };
            p.slots[2] = slot(Source::Lfo1, Dest::Position2, 100);
        }
        // An LFO-fast square on the level of a wave is a tremolo; pitched up, it's a sideband.
        3 => {
            p.layers[0].table = PULSE;
            p.layers[0].semitones = -24;
            p.layers[1].table = FM_BELL;
            p.cross = Cross { mode: CrossMode::Am, modulator: 0, depth: 1000 };
            hear_osc2(&mut p);
            p.lfos[1] = Lfo { rate: 72, shape: Shape::Triangle, unipolar: false, phase: 0, level: 100, sync: 2 };
            p.slots[2] = slot(Source::Lfo2, Dest::Cross, 100);
            p.slots[3] = slot(Source::Cv2, Dest::Position2, 200);
        }
        // A triangle bending a sine's phase, as a Casio CZ does, the bend opening and closing.
        4 => {
            p.layers[0].table = MORPH;
            p.layers[0].position = MORPH_TRIANGLE;
            p.layers[1].table = MORPH;
            p.layers[1].position = MORPH_SINE;
            p.cross = Cross { mode: CrossMode::Pd, modulator: 0, depth: 80 };
            hear_osc2(&mut p);
            p.lfos[0] = Lfo { rate: 32, shape: Shape::Sine, unipolar: true, phase: 0, level: 100, sync: 1 };
            p.slots[2] = slot(Source::Lfo1, Dest::Cross, 80);
        }
        // Two streams of grains drifting over each other, slowly enough to hear each one. A grain holds its
        // frame while its window, at zero when an LFO's cycle starts, fades it in and out. Their rates
        // differ because the LFO's PHASE moves its shape and not when its cycle starts: at one rate
        // they would restart together. LFO 3 walks the place in the table along.
        5 => {
            p.layers[0].table = VOWELS;
            p.layers[1].table = FM_BELL;
            p.layers[0].semitones = -12;
            p.layers[0].level = 0;
            p.layers[1].level = 0;
            p.layers[0].position = 500;
            p.layers[1].position = 500;
            p.layers[0].grain = 1;
            p.layers[1].grain = 2;
            let window = Lfo { rate: GRAIN_RATES[0], shape: Shape::Sine, unipolar: true, phase: WINDOW_PHASE, level: 100, sync: 0 };
            p.lfos[0] = window;
            p.lfos[1] = Lfo { rate: GRAIN_RATES[1], ..window };
            p.lfos[2] = Lfo { rate: 29, shape: Shape::Triangle, unipolar: false, phase: 0, level: 100, sync: 0 };
            p.slots[2] = slot(Source::Lfo1, Dest::Level1, 200);
            p.slots[3] = slot(Source::Lfo2, Dest::Level2, 200);
            p.slots[4] = slot(Source::Lfo3, Dest::Position1, 80);
            p.slots[5] = slot(Source::Lfo3, Dest::Position2, -60);
            p.slots[6] = slot(Source::Cv2, Dest::Position1, 100);
            p.slots[7] = slot(Source::Cv2, Dest::Position2, 100);
            p.mixer.outs[0] = OutSel::Mix;
            p.mixer.outs[1] = OutSel::Mix;
        }
        // The read line tilting through a table of spreading saws, one way on each oscillator.
        6 => {
            p.layers[0].table = SWARM;
            p.layers[1].table = SWARM;
            p.layers[0].edge = Edge::Mirror;
            p.layers[1].edge = Edge::Mirror;
            p.layers[1].semitones = 7;
            p.lfos[2] = Lfo { rate: 37, shape: Shape::Sine, unipolar: false, phase: 0, level: 100, sync: 0 };
            p.slots[2] = slot(Source::Lfo3, Dest::Shift1, 100);
            p.slots[3] = slot(Source::Lfo3, Dest::Shift2, -100);
        }
        // Old-machine reading: no blending between frames or samples, stepping through a crushed table.
        _ => {
            p.layers[0].table = CRUSH;
            p.layers[1].table = PULSE;
            p.layers[0].read = ReadStyle::Raw;
            p.layers[1].read = ReadStyle::Stepped;
            p.layers[1].semitones = -12;
            p.envelopes[0] = Envelope {
                gate: 1, delay: 0, attack: 44, hold: 0, decay: 44, sustain: 0, release: 28,
                curves: [0, 0, 0], looping: LoopMode::Free, vca: 0,
            };
            p.slots[2] = slot(Source::Env1, Dest::Position1, 200);
            p.slots[3] = slot(Source::Env1, Dest::Position2, 200);
            p.layers[0].position = 0;
            p.layers[1].position = 0;
        }
    }
    p
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::table::Table;
    use std::collections::HashSet;
    use std::format;

    const TABLE: Table = Table { offset: 0x80_0000, frame_log2: 11, frames: 31 };

    #[test]
    fn every_preset_is_different_and_named() {
        let names: HashSet<_> = NAMES.iter().collect();
        assert_eq!(names.len(), N_PATCHES);
        for name in NAMES {
            assert!(!name.is_empty() && name.len() <= 11, "{name}");
        }
        let words: std::vec::Vec<_> = (0..N_PATCHES).map(|i| format!("{:?}", preset(i))).collect();
        let unique: HashSet<_> = words.iter().collect();
        assert_eq!(unique.len(), N_PATCHES);
    }

    #[test]
    fn every_preset_keeps_to_what_a_patch_can_hold() {
        for i in 0..N_PATCHES {
            let p = preset(i);
            let saved = crate::store::Saved {
                patch: p,
                frame_log2: [0; crate::store::N_TABLES],
                files: [crate::store::TableFile::NONE; 2],
            };
            let bytes = crate::store::encode(&saved);
            assert_eq!(crate::store::decode(&bytes, crate::store::VERSION).unwrap().patch, p, "{}", NAMES[i]);
        }
    }

    #[test]
    fn every_preset_makes_sound_with_nothing_patched() {
        for i in 0..N_PATCHES {
            let p = preset(i);
            // Something is going to an output.
            assert!(p.mixer.outs.iter().any(|o| matches!(o, OutSel::Mix | OutSel::Osc1 | OutSel::Osc2)), "{i}");
            // And a layer that isn't at a level has something bringing it up. A closed VCA runs free.
            for (l, layer) in p.layers.iter().enumerate() {
                let moved = p.slots.iter().any(|s| s.source != Source::None && s.dest == [Dest::Level1, Dest::Level2][l]);
                assert!(layer.level > 0 || moved, "{} layer {l}", NAMES[i]);
            }
            for e in &p.envelopes {
                assert!(e.vca == 0 || e.looping == LoopMode::Free, "{} needs a gate", NAMES[i]);
            }
        }
    }

    #[test]
    fn the_cross_modulation_presets_show_each_mode() {
        let modes: HashSet<_> = (0..N_PATCHES).map(|i| format!("{:?}", preset(i).cross.mode)).collect();
        assert_eq!(modes.len(), 5, "off and all four: {modes:?}");
    }

    #[test]
    fn the_grain_preset_windows_what_it_restarts() {
        let p = preset(5);
        assert_eq!((p.layers[0].grain, p.layers[1].grain), (1, 2));
        let w = p.words(&[TABLE, TABLE], &[8, 8], 48000);
        assert_eq!((w.ctrl[0] >> 4) & 3, 1);
        assert_eq!((w.ctrl[1] >> 4) & 3, 2);
        for lfo in &p.lfos[..2] {
            assert!(lfo.unipolar, "a window doesn't go negative");
            assert_eq!(lfo.phase, WINDOW_PHASE, "so a grain starts from silence, not with a click");
            // A window's value at the start of its cycle: x = 0 plus the phase's offset. A parabola here.
            let x = (lfo.phase as i64 * 65536 / 360) & 0xFFFF;
            let s = if x & 0x8000 != 0 { x - 0x10000 } else { x };
            let y = (s * (0x8000 - s.abs())) >> 12;
            assert_eq!((y + ONE) >> 1, 0, "the window is shut when the grain starts");
        }
        assert_ne!(p.lfos[0].rate, p.lfos[1].rate, "at one rate both streams would restart on one sample");
        // Slow enough to hear each grain as one.
        assert!(p.lfos.iter().take(2).all(|l| rate_millihertz(l.rate) < 5000));
    }

    #[test]
    fn every_preset_scales_to_the_gateware() {
        for i in 0..N_PATCHES {
            preset(i).words(&[TABLE, TABLE], &[8, 8], 48000);
        }
    }
}
