//! Envelopes, LFOs, the matrix and the mixer: what the user has set, in their units, and the
//! words that tell the gateware (`model/modulation.py` is the definition of those).
//!
//! Times and rates are indices into a musical scale, 8 steps to the octave, so an encoder
//! detent is a similar change anywhere and a patch stays small. Everything is in integers:
//! this runs in the control interrupt, on a CPU with no FPU.

/// 2^(k/8), Q16.
const RATIO: [u64; 8] = [65536, 71468, 77936, 84990, 92682, 101070, 110218, 120194];

/// The top of a time's scale: 1 ms at index 1, doubling every 8, to 32.8 s. Index 0 is
/// as short as it goes: one sample.
pub const TIME_MAX: u8 = 121;

/// The top of an LFO's rate scale: 0.01 Hz at index 0, doubling every 8, to 105 Hz.
pub const RATE_MAX: u8 = 107;

pub const N_ENVELOPES: usize = 2;
pub const N_LFOS: usize = 3;
pub const N_SLOTS: usize = 12;
pub const N_DESTS: usize = 9;

/// Fractions in the gateware: U1.16, this is 1.
pub const ONE: i64 = 1 << 16;
/// An envelope's top and an LFO's peak, as a source (`model/modulation.py`): 5 V.
pub const FULL: u32 = 80_000;

/// A segment's length in samples.
pub const fn time_samples(index: u8, fs: u32) -> u32 {
    if index == 0 {
        return 1;
    }
    let i = index as u32 - 1;
    (((fs / 1000) as u64 * RATIO[(i % 8) as usize]) << (i / 8) >> 16) as u32
}

/// The rate that ends a segment after `samples` samples. One sample would be 2^32, which the
/// word holds as 0, and the gateware reads it so.
pub const fn segment_rate(samples: u32) -> u32 {
    (((1u64 << 32) + samples as u64 - 1) / samples as u64) as u32
}

/// An LFO's phase increment a sample.
pub const fn rate_word(index: u8, fs: u32) -> u32 {
    // 0.01 Hz, as an increment in Q16.
    let base = (1u64 << 48) / 100 / fs as u64;
    ((base * RATIO[(index % 8) as usize]) << (index / 8) >> 32) as u32
}

/// An LFO's rate, in thousandths of a hertz.
pub const fn rate_millihertz(index: u8) -> u32 {
    ((10 * RATIO[(index % 8) as usize]) << (index / 8) >> 16) as u32
}

/// How an envelope repeats. Looping, it runs delay, attack, hold, decay and release over and
/// over with no sustain, so every segment shapes the cycle and delay is the rest between.
#[derive(Clone, Copy, PartialEq, Eq, Debug)]
pub enum LoopMode {
    Off = 0,
    /// While the gate is high; when it falls, the release finishes and it stops.
    Gated = 1,
    /// Always, gate or no gate: an LFO of this shape. A rising gate restarts the cycle.
    Free = 2,
}

impl LoopMode {
    pub const fn next(self, by: i32) -> LoopMode {
        match (self as i32 + by).rem_euclid(3) {
            0 => LoopMode::Off,
            1 => LoopMode::Gated,
            _ => LoopMode::Free,
        }
    }
}

#[derive(Clone, Copy, PartialEq, Eq, Debug)]
pub struct Envelope {
    /// Which gates run it: bit 0 gate 1, bit 1 gate 2.
    pub gate: u8,
    pub delay: u8,
    pub attack: u8,
    pub hold: u8,
    pub decay: u8,
    /// In percent.
    pub sustain: u8,
    pub release: u8,
    /// Attack, decay and release, -100 to +100: positive starts fast and ends slow, as a
    /// capacitor charges, negative the reverse, 0 is a straight line.
    pub curves: [i8; 3],
    pub looping: LoopMode,
    /// Which layers' VCAs it closes: bit 0 layer 1, bit 1 layer 2. A VCA with no envelope
    /// stays open.
    pub vca: u8,
}

/// A curve as the gateware's 10 bits.
pub const fn curve_bits(curve: i8) -> i32 {
    -(curve as i32) * 256 / 100
}

impl Envelope {
    pub const fn default_for(i: usize) -> Envelope {
        Envelope {
            gate: 1 << i,
            delay: 0,
            attack: 28,     // 10 ms
            hold: 0,
            decay: 62,      // 200 ms
            sustain: 70,
            release: 67,    // 300 ms
            curves: [0, 50, 50],
            looping: LoopMode::Off,
            vca: 0,
        }
    }

    pub fn words(&self, fs: u32) -> [u32; 8] {
        let rate = |index| segment_rate(time_samples(index, fs));
        let curves = (curve_bits(self.curves[0]) as u32 & 0x3FF)
            | (curve_bits(self.curves[1]) as u32 & 0x3FF) << 10
            | (curve_bits(self.curves[2]) as u32 & 0x3FF) << 20;
        [
            (self.gate as u32 & 3) | (self.looping as u32) << 2,
            rate(self.delay),
            rate(self.attack),
            rate(self.hold),
            rate(self.decay),
            self.sustain as u32 * ONE as u32 / 100,
            rate(self.release),
            curves,
        ]
    }
}

#[derive(Clone, Copy, PartialEq, Eq, Debug)]
pub enum Shape {
    Sine = 0,
    Triangle = 1,
    SawUp = 2,
    SawDown = 3,
    Square = 4,
    Random = 5,
}

impl Shape {
    pub const fn next(self, by: i32) -> Shape {
        match (self as i32 + by).rem_euclid(6) {
            0 => Shape::Sine,
            1 => Shape::Triangle,
            2 => Shape::SawUp,
            3 => Shape::SawDown,
            4 => Shape::Square,
            _ => Shape::Random,
        }
    }

    pub const fn name(self) -> &'static str {
        match self {
            Shape::Sine => "SINE",
            Shape::Triangle => "TRI",
            Shape::SawUp => "SAW UP",
            Shape::SawDown => "SAW DN",
            Shape::Square => "SQUARE",
            Shape::Random => "RANDOM",
        }
    }
}

#[derive(Clone, Copy, PartialEq, Eq, Debug)]
pub struct Lfo {
    pub rate: u8,
    pub shape: Shape,
    /// 0 V to 5 V rather than -5 V to +5 V.
    pub unipolar: bool,
    /// Degrees: where in the cycle it starts.
    pub phase: u16,
    /// In percent.
    pub level: u8,
    /// Which gates restart its cycle: bit 0 gate 1, bit 1 gate 2.
    pub sync: u8,
}

impl Lfo {
    pub const fn default_for(i: usize) -> Lfo {
        Lfo {
            rate: [53, 72, 37][i],  // about 1 Hz, 5 Hz and a quarter of a hertz
            shape: [Shape::Sine, Shape::Triangle, Shape::Square][i],
            unipolar: false,
            phase: 0,
            level: 100,
            sync: 0,
        }
    }

    pub fn words(&self, fs: u32) -> [u32; 3] {
        [
            rate_word(self.rate, fs),
            (self.phase as u32 * 65536 / 360)
                | (self.shape as u32) << 16
                | (self.unipolar as u32) << 19
                | (self.sync as u32 & 3) << 20,
            FULL * self.level as u32 / 100,
        ]
    }
}

/// What a slot of the matrix reads.
#[derive(Clone, Copy, PartialEq, Eq, Debug)]
pub enum Source {
    None = 0,
    Cv1 = 1,
    Cv2 = 2,
    Env1 = 3,
    Env2 = 4,
    Lfo1 = 5,
    Lfo2 = 6,
    Lfo3 = 7,
}

impl Source {
    pub const fn next(self, by: i32) -> Source {
        match (self as i32 + by).rem_euclid(8) {
            0 => Source::None,
            1 => Source::Cv1,
            2 => Source::Cv2,
            3 => Source::Env1,
            4 => Source::Env2,
            5 => Source::Lfo1,
            6 => Source::Lfo2,
            _ => Source::Lfo3,
        }
    }

    pub const fn name(self) -> &'static str {
        match self {
            Source::None => "---",
            Source::Cv1 => "CV 1",
            Source::Cv2 => "CV 2",
            Source::Env1 => "ENV 1",
            Source::Env2 => "ENV 2",
            Source::Lfo1 => "LFO 1",
            Source::Lfo2 => "LFO 2",
            Source::Lfo3 => "LFO 3",
        }
    }
}

/// What a slot of the matrix moves.
#[derive(Clone, Copy, PartialEq, Eq, Debug)]
pub enum Dest {
    Pitch1 = 0,
    Position1 = 1,
    Shift1 = 2,
    Level1 = 3,
    Pitch2 = 4,
    Position2 = 5,
    Shift2 = 6,
    Level2 = 7,
    Balance = 8,
}

impl Dest {
    pub const fn next(self, by: i32) -> Dest {
        match (self as i32 + by).rem_euclid(N_DESTS as i32) {
            0 => Dest::Pitch1,
            1 => Dest::Position1,
            2 => Dest::Shift1,
            3 => Dest::Level1,
            4 => Dest::Pitch2,
            5 => Dest::Position2,
            6 => Dest::Shift2,
            7 => Dest::Level2,
            _ => Dest::Balance,
        }
    }

    pub const fn name(self) -> &'static str {
        match self {
            Dest::Pitch1 => "PITCH 1",
            Dest::Position1 => "POS 1",
            Dest::Shift1 => "SHIFT 1",
            Dest::Level1 => "LEVEL 1",
            Dest::Pitch2 => "PITCH 2",
            Dest::Position2 => "POS 2",
            Dest::Shift2 => "SHIFT 2",
            Dest::Level2 => "LEVEL 2",
            Dest::Balance => "BALANCE",
        }
    }

    pub const fn is_pitch(self) -> bool {
        matches!(self, Dest::Pitch1 | Dest::Pitch2)
    }

    /// The largest amount, in half-percents: 195% is what the slot's 18 bits hold at pitch's scale.
    pub const fn amount_limit(self) -> i16 {
        if self.is_pitch() { 390 } else { 800 }
    }
}

#[derive(Clone, Copy, PartialEq, Eq, Debug)]
pub struct Slot {
    pub source: Source,
    pub dest: Dest,
    /// In half-percents, so a detent is 0.5%. On a pitch, 100% is an octave a volt; on anything
    /// else, 5 V is the destination's whole range.
    pub amount: i16,
}

impl Slot {
    pub const EMPTY: Slot = Slot { source: Source::None, dest: Dest::Pitch1, amount: 0 };

    /// The gateware's amount: it adds (source * amount) >> 14, with sources at 16000 a volt
    /// and pitch in Q.16 octaves.
    pub const fn amount_word(&self) -> i32 {
        let scale: i64 = if self.dest.is_pitch() { 67_108_864 } else { 13_421_773 };
        let limit = self.dest.amount_limit() as i64;
        let a = self.amount as i64;
        let a = if a > limit { limit } else if a < -limit { -limit } else { a };
        // To the nearest.
        let half = if a < 0 { -100_000 } else { 100_000 };
        ((a * scale + half) / 200_000) as i32
    }

    pub const fn word(&self) -> u32 {
        (self.amount_word() as u32 & 0x3_FFFF) | (self.source as u32) << 18 | (self.dest as u32) << 21
    }
}

/// What an output carries.
#[derive(Clone, Copy, PartialEq, Eq, Debug)]
pub enum OutSel {
    Off = 0,
    Mix = 1,
    Osc1 = 2,
    Osc2 = 3,
    Env1 = 4,
    Env2 = 5,
    Lfo1 = 6,
    Lfo2 = 7,
    Lfo3 = 8,
}

impl OutSel {
    pub const fn next(self, by: i32) -> OutSel {
        match (self as i32 + by).rem_euclid(9) {
            0 => OutSel::Off,
            1 => OutSel::Mix,
            2 => OutSel::Osc1,
            3 => OutSel::Osc2,
            4 => OutSel::Env1,
            5 => OutSel::Env2,
            6 => OutSel::Lfo1,
            7 => OutSel::Lfo2,
            _ => OutSel::Lfo3,
        }
    }

    pub const fn name(self) -> &'static str {
        match self {
            OutSel::Off => "OFF",
            OutSel::Mix => "MIX",
            OutSel::Osc1 => "OSC 1",
            OutSel::Osc2 => "OSC 2",
            OutSel::Env1 => "ENV 1",
            OutSel::Env2 => "ENV 2",
            OutSel::Lfo1 => "LFO 1",
            OutSel::Lfo2 => "LFO 2",
            OutSel::Lfo3 => "LFO 3",
        }
    }
}

/// The two jacks an envelope or LFO goes to from its own tab, as `Mixer::outs` indices (which
/// are the numbers on the panel: `out0` to `out3`). Any output can carry one, from the Mixer.
pub const ENV_JACKS: [usize; 2] = [2, 3];

#[derive(Clone, Copy, PartialEq, Eq, Debug)]
pub struct Mixer {
    pub outs: [OutSel; 4],
    /// Thousandths from all layer 1 to all layer 2. The two sum to the same level anywhere,
    /// so a mix can't clip.
    pub balance: i16,
}

impl Default for Mixer {
    fn default() -> Self {
        Mixer { outs: [OutSel::Osc1, OutSel::Osc2, OutSel::Env1, OutSel::Env2], balance: 500 }
    }
}

impl Mixer {
    /// Which outputs carry `sel`: bit n is `out<n>`.
    pub fn outs_of(&self, sel: OutSel) -> u8 {
        self.outs.iter().enumerate().fold(0, |m, (i, o)| m | ((*o == sel) as u8) << i)
    }

    /// Which of the envelope jacks carry `sel`: bit 0 the first, bit 1 the second.
    pub fn jacks_of(&self, sel: OutSel) -> u8 {
        (self.outs[ENV_JACKS[0]] == sel) as u8 | ((self.outs[ENV_JACKS[1]] == sel) as u8) << 1
    }

    /// Gives `sel` exactly the envelope jacks in `mask`. A jack it takes loses what it
    /// carried; one it gives up goes quiet.
    pub fn set_jacks(&mut self, sel: OutSel, mask: u8) {
        for (bit, jack) in ENV_JACKS.iter().enumerate() {
            if mask >> bit & 1 != 0 {
                self.outs[*jack] = sel;
            } else if self.outs[*jack] == sel {
                self.outs[*jack] = OutSel::Off;
            }
        }
    }

    pub fn outs_word(&self) -> u32 {
        self.outs.iter().enumerate().fold(0, |w, (i, s)| w | (*s as u32) << (4 * i))
    }
}

/// The default matrix: CV 1 is pitch and CV 2 position, on both layers.
pub const fn default_slots() -> [Slot; N_SLOTS] {
    let mut slots = [Slot::EMPTY; N_SLOTS];
    slots[0] = Slot { source: Source::Cv1, dest: Dest::Pitch1, amount: 200 };
    slots[1] = Slot { source: Source::Cv1, dest: Dest::Pitch2, amount: 200 };
    slots[2] = Slot { source: Source::Cv2, dest: Dest::Position1, amount: 200 };
    slots[3] = Slot { source: Source::Cv2, dest: Dest::Position2, amount: 200 };
    slots
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn the_ratios_are_eighths_of_an_octave() {
        for (k, r) in RATIO.iter().enumerate() {
            let want = 65536.0 * (k as f64 / 8.0).exp2();
            assert!((*r as f64 - want).abs() < 0.51, "{k}: {r} vs {want}");
        }
    }

    #[test]
    fn times_run_from_one_sample_through_a_millisecond_to_half_a_minute() {
        assert_eq!(time_samples(0, 48000), 1);
        assert_eq!(time_samples(1, 48000), 48);
        assert_eq!(time_samples(9, 48000), 96);
        assert_eq!(time_samples(TIME_MAX, 48000), 48 << 15);
        for i in 1..TIME_MAX {
            assert!(time_samples(i + 1, 48000) > time_samples(i, 48000), "{i}");
        }
    }

    #[test]
    fn a_rate_ends_a_segment_on_its_sample() {
        for samples in [1u32, 2, 3, 48, 480, 4800, 65535] {
            let rate = segment_rate(samples) as u64;
            let rate = if rate == 0 { 1u64 << 32 } else { rate };
            let steps = (1u64 << 32).div_ceil(rate);
            assert_eq!(steps, samples as u64, "{samples}");
        }
    }

    #[test]
    fn the_longest_segment_is_within_a_part_in_a_thousand() {
        let samples = time_samples(TIME_MAX, 48000) as u64;
        let steps = (1u64 << 32).div_ceil(segment_rate(samples as u32) as u64);
        assert!(samples.abs_diff(steps) * 1000 < samples, "{samples} vs {steps}");
    }

    #[test]
    fn lfo_rates_are_in_hertz() {
        let hz = |i| rate_word(i, 48000) as f64 * 48000.0 / 4294967296.0;
        assert!((hz(0) - 0.01).abs() < 0.0001);
        assert!((hz(8) - 0.02).abs() < 0.0001);
        assert!((hz(RATE_MAX) / 105.0 - 1.0).abs() < 0.02, "{}", hz(RATE_MAX));
        assert_eq!(rate_millihertz(0), 10);
        assert_eq!(rate_millihertz(8), 20);
        for i in 0..RATE_MAX {
            assert!(rate_word(i + 1, 48000) > rate_word(i, 48000), "{i}");
        }
    }

    #[test]
    fn envelope_words_land_where_the_gateware_reads_them() {
        let mut e = Envelope::default_for(1);
        e.looping = LoopMode::Free;
        e.sustain = 50;
        e.curves = [100, -100, 0];
        let w = e.words(48000);
        assert_eq!(w[0], 2 | 2 << 2);
        assert_eq!(w[1], 0, "no delay: a rate of one sample");
        assert_eq!(w[2], segment_rate(time_samples(e.attack, 48000)));
        assert_eq!(w[5], 1 << 15);
        assert_eq!(w[7], (-256i32 as u32 & 0x3FF) | 256 << 10);
    }

    #[test]
    fn full_sustain_is_one() {
        let mut e = Envelope::default_for(0);
        e.sustain = 100;
        assert_eq!(e.words(48000)[5], 1 << 16);
    }

    #[test]
    fn lfo_words_land_where_the_gateware_reads_them() {
        let lfo = Lfo { rate: 8, shape: Shape::Square, unipolar: true, phase: 90, level: 50, sync: 2 };
        let w = lfo.words(48000);
        assert_eq!(w[0], rate_word(8, 48000));
        assert_eq!(w[1], 0x4000 | 4 << 16 | 1 << 19 | 2 << 20);
        assert_eq!(w[2], 40_000);
    }

    #[test]
    fn a_full_pitch_slot_is_an_octave_a_volt_to_a_hundredth_of_a_cent() {
        let s = Slot { source: Source::Cv1, dest: Dest::Pitch1, amount: 200 };
        // A volt is 16000 at the source; an octave is 65536.
        let octave = (16000i64 * s.amount_word() as i64) as f64 / 16384.0 / 65536.0;
        assert!(((octave - 1.0) * 1200.0).abs() < 0.01, "{octave}");
    }

    #[test]
    fn a_full_slot_elsewhere_is_the_whole_range_at_5_volts() {
        let s = Slot { source: Source::Env1, dest: Dest::Position1, amount: 200 };
        let range = (80000i64 * s.amount_word() as i64) as f64 / 16384.0 / 65536.0;
        assert!((range - 1.0).abs() < 1e-4, "{range}");
    }

    #[test]
    fn the_amount_stays_in_its_bits_at_every_limit() {
        for dest in [Dest::Pitch1, Dest::Level2] {
            for a in [i16::MIN, -800, -390, 0, 390, 800, i16::MAX] {
                let w = Slot { source: Source::Cv1, dest, amount: a }.amount_word();
                assert!((-(1 << 17)..(1 << 17)).contains(&w), "{dest:?} {a}: {w}");
            }
        }
    }

    #[test]
    fn slot_words_land_where_the_gateware_reads_them() {
        let s = Slot { source: Source::Lfo2, dest: Dest::Balance, amount: -200 };
        let w = s.word();
        assert_eq!(w & 0x3_FFFF, (-13422i32 as u32) & 0x3_FFFF);
        assert_eq!((w >> 18) & 7, 6);
        assert_eq!((w >> 21) & 15, 8);
    }

    #[test]
    fn the_default_matrix_is_v_per_octave_and_position() {
        let s = default_slots();
        assert_eq!((s[0].source, s[0].dest, s[0].amount), (Source::Cv1, Dest::Pitch1, 200));
        assert_eq!((s[3].source, s[3].dest, s[3].amount), (Source::Cv2, Dest::Position2, 200));
        assert!(s[4..].iter().all(|x| x.source == Source::None));
    }

    #[test]
    fn an_envelope_can_take_either_jack_or_both() {
        let mut m = Mixer::default();
        assert_eq!(m.jacks_of(OutSel::Env1), 1);
        assert_eq!(m.jacks_of(OutSel::Env2), 2);
        m.set_jacks(OutSel::Env1, 3);
        assert_eq!(m.outs[2..], [OutSel::Env1, OutSel::Env1]);
        assert_eq!(m.jacks_of(OutSel::Env2), 0, "it took that jack");
        m.set_jacks(OutSel::Env1, 0);
        assert_eq!(m.outs[2..], [OutSel::Off, OutSel::Off]);
    }

    #[test]
    fn giving_up_a_jack_leaves_what_others_hold_alone() {
        let mut m = Mixer::default();
        m.set_jacks(OutSel::Lfo1, 0);
        assert_eq!(m.outs[2..], [OutSel::Env1, OutSel::Env2]);
    }

    #[test]
    fn the_routing_word_has_four_selections() {
        let m = Mixer::default();
        assert_eq!(m.outs_word(), 2 | 3 << 4 | 4 << 8 | 5 << 12);
    }

    #[test]
    fn choices_wrap_both_ways() {
        assert_eq!(LoopMode::Off.next(-1), LoopMode::Free);
        assert_eq!(LoopMode::Free.next(1), LoopMode::Off);
        assert_eq!(Shape::Sine.next(-1), Shape::Random);
        assert_eq!(Source::None.next(-1), Source::Lfo3);
        assert_eq!(Dest::Balance.next(1), Dest::Pitch1);
        assert_eq!(OutSel::Lfo3.next(1), OutSel::Off);
    }
}
