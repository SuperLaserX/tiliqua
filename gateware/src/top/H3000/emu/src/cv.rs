//! Control voltages as MIDI controllers.
//!
//! The Tiliqua's inputs 3 and 4 (1 and 2 carry the audio) become MIDI
//! control changes, merged into the emulated MIDI input between the
//! messages arriving at the MIDI jack ([`crate::remote::Remote::inject`]).
//! The H3000 patches them to parameters like any other controller (SETUP,
//! "Modulation of Parameters", Patch: the parameter, then the source, "GP
//! Controller # 1" for CC 16): its kernel writes patched parameters
//! straight to the DSPs on each pass of its main loop, without the front
//! panel, and keeps the patches with the program.
//!
//! An input sends only while a cable is plugged into it, with a quarter
//! step of hysteresis against noise, and at most every [`MIN_MS`]
//! milliseconds. That is about as fast as the kernel can follow: it reads
//! all the MIDI input there is (each byte goes to all 19 of its modules)
//! before it updates the patched parameters, about 45 times a second at
//! best, and more messages leave it less time for that (measured on
//! program 150 with one patch: 45 updates a second at a message every 20
//! ms, 38 at 10 ms, 25 at 5 ms, 7 at 3 ms).

/// Inputs: 3 and 4.
pub const INPUTS: usize = 2;
/// The controller setting of an input that sends nothing.
pub const OFF: u8 = 120;
/// Shortest time between two messages of an input.
pub const MIN_MS: u32 = 20;
/// Voltage ranges: name, lowest and highest volts.
pub const RANGES: [(&[u8; 4], i32, i32); 4] = [(b"0-5V", 0, 5), (b"0-8V", 0, 8), (b"+-5V", -5, 5), (b"+-8V", -8, 8)];
/// Bytes of the stored settings ([`Settings::to_bytes`]).
pub const STORED_BYTES: usize = 8;

/// What the inputs send.
#[derive(Clone, Copy, PartialEq, Eq, Debug)]
pub struct Settings {
    /// Each input's controller (0-119), or [`OFF`].
    pub cc: [u8; INPUTS],
    /// Each input's range (an index into [`RANGES`]).
    pub range: [u8; INPUTS],
    /// MIDI channel, 0-15 (channel 1-16).
    pub channel: u8,
}

impl Settings {
    /// GP Controllers 1 and 2 on channel 1, 0-5 V.
    pub const DEFAULT: Settings = Settings { cc: [16, 17], range: [0, 0], channel: 0 };

    /// As kept in flash: "CV", the settings, a check byte.
    pub fn to_bytes(&self) -> [u8; STORED_BYTES] {
        let mut b = [b'C', b'V', self.cc[0], self.cc[1], self.range[0], self.range[1], self.channel, 0];
        b[7] = b[..7].iter().fold(0x5A, |a, &x| a ^ x);
        b
    }

    /// Settings kept with [`Settings::to_bytes`]; None if `b` holds none.
    pub fn from_bytes(b: &[u8; STORED_BYTES]) -> Option<Settings> {
        let s = Settings { cc: [b[2], b[3]], range: [b[4], b[5]], channel: b[6] };
        let valid = s.to_bytes() == *b
            && s.cc.iter().all(|&c| c <= OFF)
            && s.range.iter().all(|&r| (r as usize) < RANGES.len())
            && s.channel < 16;
        valid.then_some(s)
    }
}

pub struct Cv {
    pub settings: Settings,
    /// Shortest time between two messages of an input ([`MIN_MS`]).
    pub min_ms: u32,
    counts_per_v: i32,
    /// Each input's last sample, and its value (0-127, with hysteresis).
    raw: [i32; INPUTS],
    value: [u8; INPUTS],
    /// The value last sent (None: send the next one whatever it is), and
    /// when.
    sent: [Option<u8>; INPUTS],
    sent_ms: [u32; INPUTS],
    /// The input that goes first when both have something to send.
    next: usize,
}

impl Cv {
    /// `counts_per_v`: the inputs' calibrated sample counts per volt.
    pub const fn new(settings: Settings, counts_per_v: i32) -> Self {
        Cv { settings, min_ms: MIN_MS, counts_per_v, raw: [0; INPUTS], value: [0; INPUTS], sent: [None; INPUTS], sent_ms: [0; INPUTS], next: 0 }
    }

    /// New settings: each input sends its value again.
    pub fn set(&mut self, settings: Settings) {
        if settings != self.settings {
            self.settings = settings;
            self.sent = [None; INPUTS];
        }
    }

    /// Input `i`'s last voltage in millivolts, and its value.
    pub fn reading(&self, i: usize) -> (i32, u8) {
        (self.raw[i] * 1000 / self.counts_per_v.max(1), self.value[i])
    }

    /// Call often, with the inputs' calibrated samples, which have a cable
    /// in (bit 0: input 3, bit 1: input 4), and the time in milliseconds.
    /// Returns a control change to send (status, controller, value), at
    /// most one a call: call only when one can be sent.
    pub fn poll(&mut self, raw: [i32; INPUTS], plugged: u8, now_ms: u32) -> Option<[u8; 3]> {
        for i in 0..INPUTS {
            self.raw[i] = raw[i];
            self.value[i] = self.quantize(i);
        }
        for k in 0..INPUTS {
            let i = (self.next + k) % INPUTS;
            let cc = self.settings.cc[i];
            if plugged & (1 << i) == 0 {
                // Unplugged: send when plugged again.
                self.sent[i] = None;
                continue;
            }
            let soon = self.sent[i].is_some() && now_ms.wrapping_sub(self.sent_ms[i]) < self.min_ms;
            if cc >= OFF || self.sent[i] == Some(self.value[i]) || soon {
                continue;
            }
            self.sent[i] = Some(self.value[i]);
            self.sent_ms[i] = now_ms;
            self.next = (i + 1) % INPUTS;
            return Some([0xB0 | (self.settings.channel & 15), cc, self.value[i]]);
        }
        None
    }

    /// Input `i`'s value for its last sample: 0-127 over its range, moving
    /// to a neighbouring step only a quarter step into it.
    fn quantize(&self, i: usize) -> u8 {
        let (_, lo, hi) = RANGES[self.settings.range[i] as usize % RANGES.len()];
        let lo = lo * self.counts_per_v;
        let span = ((hi * self.counts_per_v) - lo).max(1);
        // Quarter steps, 0-511.
        let f = ((self.raw[i] - lo) as i64 * 512 / span as i64).clamp(0, 511) as i32;
        let (n, v) = (f / 4, self.value[i] as i32);
        let up = n > v && (f % 4 >= 1 || n > v + 1);
        let down = n < v && (f % 4 <= 2 || n < v - 1);
        if up || down || self.sent[i].is_none() {
            n as u8
        } else {
            v as u8
        }
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    const CPV: i32 = 4000;

    #[test]
    fn settings_kept() {
        let s = Settings { cc: [1, OFF], range: [3, 2], channel: 15 };
        assert_eq!(Settings::from_bytes(&s.to_bytes()), Some(s));
        assert_eq!(Settings::from_bytes(&[0xFF; STORED_BYTES]), None);
        let mut b = s.to_bytes();
        b[4] ^= 1;
        assert_eq!(Settings::from_bytes(&b), None);
    }

    #[test]
    fn ranges() {
        let mut cv = Cv::new(Settings::DEFAULT, CPV);
        // 0-5 V: 0 V, 2.5 V, 5 V and beyond.
        assert_eq!(cv.poll([0, 0], 3, 0), Some([0xB0, 16, 0]));
        assert_eq!(cv.poll([0, 0], 3, 0), Some([0xB0, 17, 0]));
        assert_eq!(cv.poll([10_000, 20_000], 3, 100), Some([0xB0, 16, 64]));
        assert_eq!(cv.poll([10_000, 20_000], 3, 100), Some([0xB0, 17, 127]));
        assert_eq!(cv.poll([10_000, 30_000], 3, 200), None);
        // +-8 V on channel 3.
        cv.set(Settings { cc: [16, 17], range: [3, 3], channel: 2 });
        assert_eq!(cv.poll([-32_000, 0], 1, 300), Some([0xB2, 16, 0]));
        assert_eq!(cv.poll([-32_000, 0], 1, 400), None);
        assert_eq!(cv.reading(1), (0, 64));
    }

    #[test]
    fn hysteresis_and_rate() {
        let mut cv = Cv::new(Settings::DEFAULT, CPV);
        // One step is 20000/128 counts.
        let step = |n: f64| (n * 20_000.0 / 128.0) as i32;
        assert_eq!(cv.poll([step(10.5), 0], 1, 0), Some([0xB0, 16, 10]));
        // Into step 11 by less than a quarter: no change.
        assert_eq!(cv.poll([step(11.1), 0], 1, 100), None);
        assert_eq!(cv.poll([step(11.3), 0], 1, 200), Some([0xB0, 16, 11]));
        // Back into step 10 by less than a quarter: no change.
        assert_eq!(cv.poll([step(10.9), 0], 1, 300), None);
        assert_eq!(cv.poll([step(10.6), 0], 1, 400), Some([0xB0, 16, 10]));
        // Not sooner than MIN_MS after the last.
        assert_eq!(cv.poll([step(20.5), 0], 1, 400 + MIN_MS - 1), None);
        assert_eq!(cv.poll([step(20.5), 0], 1, 400 + MIN_MS), Some([0xB0, 16, 20]));
    }

    #[test]
    fn plugging_and_off() {
        let mut cv = Cv::new(Settings { cc: [OFF, 17], range: [0, 0], channel: 0 }, CPV);
        assert_eq!(cv.poll([10_000, 10_000], 0, 0), None);
        assert_eq!(cv.poll([10_000, 10_000], 1, 0), None);
        assert_eq!(cv.poll([10_000, 10_000], 2, 0), Some([0xB0, 17, 64]));
        // Unplugged and plugged again: sent again.
        assert_eq!(cv.poll([10_000, 10_000], 0, 100), None);
        assert_eq!(cv.poll([10_000, 10_000], 2, 101), Some([0xB0, 17, 64]));
    }
}
