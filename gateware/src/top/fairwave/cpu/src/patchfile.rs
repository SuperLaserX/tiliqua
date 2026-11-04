//! A patch as a text file on a drive: all that a patch holds, under the names the screens show it
//! by, so a sound can be written with a text editor by anyone looking at the screens.
//!
//! ```text
//! FAIRWAVE PATCH 1
//! NAME  = ROLL SNAP
//! ABOUT = 145 BPM FREE, GATE IN2 RESTARTS
//!
//! [OSC 1]
//! TABLE = TABLES/SAWLP.WAV    # a file, or a built-in table by name: TABLE = VOWELS
//! TUNE  = -24
//! FINE  = -8
//! POS   = 25%
//!
//! [ENV 1]
//! ATTACK  = 1 MS
//! DECAY   = 70 MS
//! SUSTAIN = 0%
//! LOOP    = FREE
//! VCA     = BOTH
//!
//! [ROUTING]
//! CV 1 > PITCH 1 = 100%
//! ENV 1 > POS 1  = 60%
//! ```
//!
//! What a file doesn't mention stays as the default patch has it, so a file says only what makes it
//! that sound. Case and spaces in names don't matter (`LFO1`, `lfo 1`). `[ROUTING]`, if it's there,
//! replaces the default routing. Times and rates land on the nearest step the screens have.
//!
//! A line that isn't understood is left out and counted, and a value out of range stops at the
//! range's end: a file from a later firmware, or with a slip in it, still plays what it can. This
//! has no drive or hardware in it, and `model/patchfile.py` reads the same files for the checks.

use heapless::String;

use crate::modulation::*;
use crate::patch::{CrossMode, Edge, Patch, ReadStyle, FINE_MAX, N_LAYERS};

/// What a patch file starts with.
pub const MAGIC: &str = "FAIRWAVE PATCH";
/// No patch needs more than this, and a big file isn't a patch. (Comments are welcome up to it.)
pub const MAX_BYTES: usize = 16 * 1024;
pub const NAME_CHARS: usize = 16;
/// What the Browser's detail line has room for.
pub const ABOUT_CHARS: usize = 34;
/// A `TABLE` line's name or path.
pub const TABLE_CHARS: usize = 64;

#[derive(Clone, Copy, PartialEq, Eq, Debug)]
pub enum FileError {
    /// It doesn't start as a patch file does.
    NotAPatch,
}

/// What a patch file says.
#[derive(Clone, PartialEq, Eq, Debug)]
pub struct PatchFile {
    pub name: String<NAME_CHARS>,
    pub about: String<ABOUT_CHARS>,
    /// All but its tables, which go by name until there's a drive and a library to look in.
    pub patch: Patch,
    /// What each oscillator's `TABLE` line names. Empty: the default patch's table.
    pub tables: [String<TABLE_CHARS>; N_LAYERS],
    /// The log2 of each oscillator's `FRAME` line. 0: however its table comes.
    pub frame_log2: [u8; N_LAYERS],
    /// Lines not understood, and which was first (from 1).
    pub skipped: u16,
    pub first_skipped: u16,
}

/// Which `[SECTION]` the lines are in.
#[derive(Clone, Copy, PartialEq, Eq, Debug)]
enum Section {
    Top,
    Osc(usize),
    Env(usize),
    Lfo(usize),
    Routing,
    Mixer,
    Cross,
    /// One this firmware doesn't have: its lines are skipped.
    Unknown,
}

/// Names compare ignoring case and spaces: `SAW UP`, `sawup`.
fn same(a: &str, b: &str) -> bool {
    let letters = |s: &'_ str| s.bytes().filter(|c| *c != b' ').map(|c| c.to_ascii_uppercase()).collect_bytes();
    letters(a) == letters(b)
}

/// (Without a heap: a name here is never longer than this.)
trait CollectBytes {
    fn collect_bytes(self) -> heapless::Vec<u8, 32>;
}

impl<I: Iterator<Item = u8>> CollectBytes for I {
    fn collect_bytes(self) -> heapless::Vec<u8, 32> {
        let mut out = heapless::Vec::new();
        for c in self {
            if out.push(c).is_err() {
                // Too long to be any name: nothing equals it.
                out.clear();
                out.push(0).ok();
                break;
            }
        }
        out
    }
}

/// `-12.5 MS` as thousandths, and what follows the number.
fn number(text: &str) -> Option<(i64, &str)> {
    let t = text.trim();
    let (negative, t) = match t.as_bytes().first()? {
        b'-' => (true, &t[1..]),
        b'+' => (false, &t[1..]),
        _ => (false, t),
    };
    let mut value = 0i64;
    let mut scale = 1000i64;
    let mut digits = 0;
    let mut point = false;
    let mut end = t.len();
    for (i, c) in t.bytes().enumerate() {
        match c {
            b'0'..=b'9' => {
                digits += 1;
                let d = (c - b'0') as i64;
                if !point {
                    // (a number this size only ever gets clamped)
                    value = value.saturating_mul(10).saturating_add(d * 1000).min(1 << 50);
                } else if scale > 1 {
                    scale /= 10;
                    value += d * scale;
                }
            }
            b'.' if !point => point = true,
            _ => {
                end = i;
                break;
            }
        }
    }
    if digits == 0 {
        return None;
    }
    Some((if negative { -value } else { value }, t[end..].trim()))
}

/// To the nearest, halves away from zero.
const fn nearest(n: i64, d: i64) -> i64 {
    if n < 0 { -((-n + d / 2) / d) } else { (n + d / 2) / d }
}

/// A plain number, or one with this unit after it.
fn with_unit(text: &str, unit: &str) -> Option<i64> {
    let (v, rest) = number(text)?;
    (rest.is_empty() || same(rest, unit)).then_some(v)
}

/// `12.5%` as thousandths of a percent.
fn percent(text: &str) -> Option<i64> {
    with_unit(text, "%")
}

/// A time's step: nearest of the steps the screens have. `10 MS`, `1.5 S`, and a plain number is ms.
fn time_index(text: &str, fs: u32) -> Option<u8> {
    let (v, rest) = number(text)?;
    let micros = match rest.as_bytes().len() {
        0 => v,
        _ if same(rest, "MS") => v,
        _ if same(rest, "S") => v.saturating_mul(1000),
        _ => return None,
    };
    let wanted = micros.max(0).saturating_mul(fs as i64);
    let mut best = 0u8;
    let mut gap = i64::MAX;
    for i in 0..=TIME_MAX {
        let here = (time_samples(i, fs) as i64 * 1_000_000 - wanted).abs();
        if here < gap {
            gap = here;
            best = i;
        }
    }
    Some(best)
}

/// A rate's step: nearest of the steps the screens have. `5.1 HZ`.
fn rate_index(text: &str) -> Option<u8> {
    let millihertz = with_unit(text, "HZ")?;
    let mut best = 0u8;
    let mut gap = i64::MAX;
    for i in 0..=RATE_MAX {
        let here = (rate_millihertz(i) as i64 - millihertz).abs();
        if here < gap {
            gap = here;
            best = i;
        }
    }
    Some(best)
}

/// Which of a set of names it is, by its number in the set.
fn named(text: &str, count: i32, name: impl Fn(i32) -> &'static str) -> Option<i32> {
    (0..count).find(|i| same(text, name(*i)))
}

fn source_named(text: &str) -> Option<Source> {
    named(text, 8, |i| Source::None.next(i).name()).map(|i| Source::None.next(i))
}

fn dest_named(text: &str) -> Option<Dest> {
    named(text, N_DESTS as i32, |i| Dest::Pitch1.next(i).name()).map(|i| Dest::Pitch1.next(i))
}

fn out_named(text: &str) -> Option<OutSel> {
    named(text, 9, |i| OutSel::Off.next(i).name()).map(|i| OutSel::Off.next(i))
}

/// A choice of gates: `GATE 1`, `GATE 2`, `EITHER`, and how to say neither.
fn gates_named(text: &str, none: &str) -> Option<u8> {
    match () {
        _ if same(text, none) || same(text, "OFF") => Some(0),
        _ if same(text, "GATE 1") => Some(1),
        _ if same(text, "GATE 2") => Some(2),
        _ if same(text, "EITHER") || same(text, "BOTH") => Some(3),
        _ => None,
    }
}

/// `[OSC 1]`, `[LFO 3]`: the number after the name, from 1 up to `count`.
fn numbered(text: &str, name: &str, count: usize) -> Option<usize> {
    (1..=count).find_map(|n| {
        let mut full: String<8> = String::new();
        full.push_str(name).ok();
        full.push((b'0' + n as u8) as char).ok();
        same(text, full.as_str()).then_some(n - 1)
    })
}

fn section_named(text: &str) -> Section {
    if let Some(i) = numbered(text, "OSC", N_LAYERS) {
        Section::Osc(i)
    } else if let Some(i) = numbered(text, "ENV", N_ENVELOPES) {
        Section::Env(i)
    } else if let Some(i) = numbered(text, "LFO", N_LFOS) {
        Section::Lfo(i)
    } else if same(text, "ROUTING") {
        Section::Routing
    } else if same(text, "MIXER") {
        Section::Mixer
    } else if same(text, "CROSS MOD") || same(text, "CROSS") {
        Section::Cross
    } else {
        Section::Unknown
    }
}

/// Keeps as much of a line's text as there is room for.
fn kept<const N: usize>(text: &str) -> String<N> {
    let mut out = String::new();
    for c in text.chars() {
        if out.push(c).is_err() {
            break;
        }
    }
    out
}

impl PatchFile {
    fn top(&mut self, key: &str, value: &str) -> Option<()> {
        match () {
            _ if same(key, "NAME") => self.name = kept(value),
            _ if same(key, "ABOUT") => self.about = kept(value),
            _ => return None,
        }
        Some(())
    }

    fn osc(&mut self, i: usize, key: &str, value: &str) -> Option<()> {
        let l = &mut self.patch.layers[i];
        match () {
            _ if same(key, "TABLE") => self.tables[i] = kept(value),
            _ if same(key, "FRAME") => {
                // (the screen writes `1024 x64`: what follows the length is the file's to say)
                let (v, _) = number(value)?;
                let log2 = (8..=11).find(|k| 1000i64 << *k == v)?;
                self.frame_log2[i] = log2;
            }
            _ if same(key, "READ") => {
                l.read = ReadStyle::Clean.next(named(value, 4, |k| ReadStyle::Clean.next(k).name())?);
            }
            _ if same(key, "TUNE") => l.semitones = nearest(with_unit(value, "ST")?, 1000).clamp(-48, 48) as i16,
            _ if same(key, "FINE") => {
                let limit = FINE_MAX as i64;
                l.fine = nearest(with_unit(value, "CT")?, 1000).clamp(-limit, limit) as i8;
            }
            _ if same(key, "POS") => l.position = nearest(percent(value)?, 100).clamp(0, 1000) as u16,
            _ if same(key, "SHIFT") => l.shift = nearest(percent(value)?, 100).clamp(-2000, 2000) as i16,
            _ if same(key, "EDGE") => l.edge = Edge::Clamp.next(named(value, 3, |k| Edge::Clamp.next(k).name())?),
            _ if same(key, "GRAIN") => {
                l.grain = if same(value, "OFF") { 0 } else { numbered(value, "LFO", N_LFOS)? as u8 + 1 };
            }
            _ if same(key, "LEVEL") => l.level = nearest(percent(value)?, 1000).clamp(0, 100) as u8,
            _ => return None,
        }
        Some(())
    }

    fn env(&mut self, i: usize, key: &str, value: &str, fs: u32) -> Option<()> {
        let e = &mut self.patch.envelopes[i];
        let curve = |text: &str| Some(nearest(percent(text)?, 1000).clamp(-100, 100) as i8);
        match () {
            _ if same(key, "DELAY") => e.delay = time_index(value, fs)?,
            _ if same(key, "ATTACK") => e.attack = time_index(value, fs)?,
            _ if same(key, "HOLD") => e.hold = time_index(value, fs)?,
            _ if same(key, "DECAY") => e.decay = time_index(value, fs)?,
            _ if same(key, "SUSTAIN") => e.sustain = nearest(percent(value)?, 1000).clamp(0, 100) as u8,
            _ if same(key, "RELEASE") => e.release = time_index(value, fs)?,
            _ if same(key, "LOOP") => {
                e.looping = match () {
                    _ if same(value, "OFF") => LoopMode::Off,
                    _ if same(value, "GATED") => LoopMode::Gated,
                    _ if same(value, "FREE") => LoopMode::Free,
                    _ => return None,
                };
            }
            _ if same(key, "GATE") => e.gate = gates_named(value, "NONE")?,
            _ if same(key, "VCA") => {
                e.vca = match () {
                    _ if same(value, "-") || same(value, "OFF") || same(value, "NONE") => 0,
                    _ if same(value, "OSC 1") => 1,
                    _ if same(value, "OSC 2") => 2,
                    _ if same(value, "BOTH") => 3,
                    _ => return None,
                };
            }
            _ if same(key, "A CURVE") => e.curves[0] = curve(value)?,
            _ if same(key, "D CURVE") => e.curves[1] = curve(value)?,
            _ if same(key, "R CURVE") => e.curves[2] = curve(value)?,
            _ => return None,
        }
        Some(())
    }

    fn lfo(&mut self, i: usize, key: &str, value: &str) -> Option<()> {
        let l = &mut self.patch.lfos[i];
        match () {
            _ if same(key, "RATE") => l.rate = rate_index(value)?,
            _ if same(key, "SHAPE") => l.shape = Shape::Sine.next(named(value, 6, |k| Shape::Sine.next(k).name())?),
            _ if same(key, "PHASE") => {
                l.phase = nearest(with_unit(value, "DEG")?, 1000).rem_euclid(360) as u16;
            }
            _ if same(key, "LEVEL") => l.level = nearest(percent(value)?, 1000).clamp(0, 100) as u8,
            _ if same(key, "POLAR") => {
                l.unipolar = match () {
                    _ if same(value, "UNI") => true,
                    _ if same(value, "BI") => false,
                    _ => return None,
                };
            }
            _ if same(key, "SYNC") => l.sync = gates_named(value, "FREE")?,
            _ => return None,
        }
        Some(())
    }

    /// `LFO 1 > POS 1 = 50%`. `used` is how many slots earlier lines took.
    fn route(&mut self, used: &mut usize, key: &str, value: &str) -> Option<()> {
        let (from, to) = key.split_once('>')?;
        let (source, dest) = (source_named(from.trim())?, dest_named(to.trim())?);
        let limit = dest.amount_limit() as i64;
        let amount = nearest(percent(value)?, 500).clamp(-limit, limit) as i16;
        *self.patch.slots.get_mut(*used)? = Slot { source, dest, amount };
        *used += 1;
        Some(())
    }

    fn mixer(&mut self, key: &str, value: &str) -> Option<()> {
        let m = &mut self.patch.mixer;
        if let Some(out) = (0..m.outs.len()).find(|n| {
            let mut name: String<8> = String::new();
            name.push_str("OUT").ok();
            name.push((b'0' + *n as u8) as char).ok();
            same(key, name.as_str())
        }) {
            m.outs[out] = out_named(value)?;
            return Some(());
        }
        match () {
            _ if same(key, "BALANCE") => m.balance = nearest(percent(value)?, 100).clamp(0, 1000) as i16,
            _ if same(key, "LEVEL 1") => self.patch.layers[0].level = nearest(percent(value)?, 1000).clamp(0, 100) as u8,
            _ if same(key, "LEVEL 2") => self.patch.layers[1].level = nearest(percent(value)?, 1000).clamp(0, 100) as u8,
            _ => return None,
        }
        Some(())
    }

    fn cross(&mut self, key: &str, value: &str) -> Option<()> {
        let c = &mut self.patch.cross;
        match () {
            _ if same(key, "MODE") => c.mode = CrossMode::Off.next(named(value, 5, |k| CrossMode::Off.next(k).name())?),
            _ if same(key, "FROM") => c.modulator = numbered(value, "OSC", N_LAYERS)? as u8,
            _ if same(key, "DEPTH") => c.depth = nearest(percent(value)?, 100).clamp(0, 1000) as u16,
            _ => return None,
        }
        Some(())
    }
}

/// Reads a patch file. Its first line says what it is; anything else that can't be understood is left
/// out and counted. `fs` is the sample rate times are worked out for.
pub fn parse(text: &[u8], fs: u32) -> Result<PatchFile, FileError> {
    let mut f = PatchFile {
        name: String::new(),
        about: String::new(),
        patch: Patch::default(),
        tables: [String::new(), String::new()],
        frame_log2: [0; N_LAYERS],
        skipped: 0,
        first_skipped: 0,
    };
    let mut section = Section::Top;
    let mut began = false;
    let mut used_slots = 0;
    for (n, bytes) in text.split(|b| *b == b'\n').enumerate() {
        let understood = core::str::from_utf8(bytes).ok().and_then(|line| {
            // (some editors start a file with a byte order mark)
            let line = line.strip_prefix('\u{feff}').unwrap_or(line);
            let line = line.split('#').next().unwrap_or("").trim();
            if line.is_empty() {
                return Some(());
            }
            if !began {
                return line.get(..MAGIC.len()).filter(|m| same(m, MAGIC)).map(|_| began = true);
            }
            if let Some(name) = line.strip_prefix('[').and_then(|l| l.strip_suffix(']')) {
                section = section_named(name.trim());
                if section == Section::Routing {
                    f.patch.slots = [Slot::EMPTY; N_SLOTS];
                    used_slots = 0;
                }
                return (section != Section::Unknown).then_some(());
            }
            let (key, value) = line.split_once('=')?;
            let (key, value) = (key.trim(), value.trim());
            match section {
                Section::Top => f.top(key, value),
                Section::Osc(i) => f.osc(i, key, value),
                Section::Env(i) => f.env(i, key, value, fs),
                Section::Lfo(i) => f.lfo(i, key, value),
                Section::Routing => f.route(&mut used_slots, key, value),
                Section::Mixer => f.mixer(key, value),
                Section::Cross => f.cross(key, value),
                Section::Unknown => None,
            }
        });
        if !began {
            // Not a patch's first line, and the first line that said anything.
            if understood.is_none() {
                return Err(FileError::NotAPatch);
            }
        } else if understood.is_none() {
            f.skipped = f.skipped.saturating_add(1);
            if f.first_skipped == 0 {
                f.first_skipped = n as u16 + 1;
            }
        }
    }
    if began { Ok(f) } else { Err(FileError::NotAPatch) }
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::patch::{Cross, Layer};

    const FS: u32 = 48000;

    fn read(text: &str) -> PatchFile {
        parse(text.as_bytes(), FS).unwrap()
    }

    /// A body under the first line, read with nothing skipped.
    fn body(text: &str) -> PatchFile {
        let f = read(&std::format!("FAIRWAVE PATCH 1\n{text}"));
        assert_eq!(f.skipped, 0, "line {} of:\n{text}", f.first_skipped);
        f
    }

    #[test]
    fn a_file_that_says_nothing_is_the_default_patch() {
        let f = read("FAIRWAVE PATCH 1\n");
        assert_eq!(f.patch, Patch::default());
        assert_eq!(f.skipped, 0);
        assert_eq!(f.frame_log2, [0, 0]);
        assert!(f.tables.iter().all(|t| t.is_empty()));
    }

    #[test]
    fn only_a_patch_file_is_read_as_one() {
        assert_eq!(parse(b"", FS), Err(FileError::NotAPatch));
        assert_eq!(parse(b"\n\n# nothing but this\n", FS), Err(FileError::NotAPatch));
        assert_eq!(parse(b"RIFF....WAVEfmt ", FS), Err(FileError::NotAPatch));
        assert_eq!(parse(b"NAME = NOT THE FIRST LINE\nFAIRWAVE PATCH 1\n", FS), Err(FileError::NotAPatch));
        assert_eq!(parse(&[0xFF, 0xFE, 0x00, 0x41, b'\n'], FS), Err(FileError::NotAPatch));
    }

    #[test]
    fn comments_blank_lines_and_a_byte_order_mark_come_before_it_if_they_like() {
        assert!(parse("\u{feff}FAIRWAVE PATCH 1\n".as_bytes(), FS).is_ok());
        assert!(parse(b"# a sound\n\n  fairwave patch 1  \r\nNAME = X\r\n", FS).is_ok());
    }

    #[test]
    fn a_files_name_and_about_are_kept_as_written_and_cut_to_fit() {
        let f = body("NAME = Roll Snap\nABOUT = 145 BPM FREE, GATE IN2 RESTARTS  # a comment\n");
        assert_eq!(f.name.as_str(), "Roll Snap");
        assert_eq!(f.about.as_str(), "145 BPM FREE, GATE IN2 RESTARTS");
        let long = body(&std::format!("NAME = {}\nABOUT = {}\n", "N".repeat(40), "A".repeat(90)));
        assert_eq!(long.name.len(), NAME_CHARS);
        assert_eq!(long.about.len(), ABOUT_CHARS);
    }

    #[test]
    fn an_oscillators_settings_land_where_the_screens_keep_them() {
        let f = body("[OSC 2]\nTABLE = TABLES/SAWLP.WAV\nFRAME = 1024\nREAD = STEPS\nTUNE = -24\nFINE = -8\nPOS = 12.5%\n\
                      SHIFT = -150%\nEDGE = MIRROR\nGRAIN = LFO 3\nLEVEL = 75%\n");
        let want = Layer {
            table: 1, semitones: -24, fine: -8, position: 125, shift: -1500, edge: Edge::Mirror, level: 75,
            read: ReadStyle::Stepped, grain: 3,
        };
        assert_eq!(f.patch.layers[1], want);
        assert_eq!(f.patch.layers[0], Layer::default_for(0), "the other is left alone");
        assert_eq!(f.tables[1].as_str(), "TABLES/SAWLP.WAV");
        assert_eq!(f.frame_log2, [0, 10]);
    }

    #[test]
    fn names_go_by_their_letters_whatever_the_case_and_spaces() {
        let f = body("[osc1]\nedge=wrap\nread = steps\n[ LFO 1 ]\nshape = sawup\n[lfo2]\nShape = Saw Dn\n[ROUTING]\ncv1>pitch1 = 100\n");
        assert_eq!(f.patch.layers[0].edge, Edge::Wrap);
        assert_eq!(f.patch.lfos[0].shape, Shape::SawUp);
        assert_eq!(f.patch.lfos[1].shape, Shape::SawDown);
        assert_eq!(f.patch.slots[0], Slot { source: Source::Cv1, dest: Dest::Pitch1, amount: 200 });
    }

    #[test]
    fn every_name_the_screens_show_can_be_written() {
        for i in 0..8 {
            let s = Source::None.next(i);
            assert_eq!(source_named(s.name()), Some(s), "{}", s.name());
        }
        for i in 0..N_DESTS as i32 {
            let d = Dest::Pitch1.next(i);
            assert_eq!(dest_named(d.name()), Some(d), "{}", d.name());
        }
        for i in 0..9 {
            let o = OutSel::Off.next(i);
            assert_eq!(out_named(o.name()), Some(o), "{}", o.name());
        }
        for i in 0..6 {
            let s = Shape::Sine.next(i);
            assert_eq!(body(&std::format!("[LFO 1]\nSHAPE = {}\n", s.name())).patch.lfos[0].shape, s);
        }
        for i in 0..5 {
            let m = CrossMode::Off.next(i);
            assert_eq!(body(&std::format!("[CROSS MOD]\nMODE = {}\n", m.name())).patch.cross.mode, m);
        }
        for i in 0..4 {
            let r = ReadStyle::Clean.next(i);
            assert_eq!(body(&std::format!("[OSC 1]\nREAD = {}\n", r.name())).patch.layers[0].read, r);
        }
    }

    #[test]
    fn times_land_on_the_nearest_step_and_say_so_in_the_samples() {
        let at = |text: &str| time_index(text, FS).unwrap();
        assert_eq!(at("0"), 0, "as short as it goes");
        assert_eq!(at("1 MS"), 1);
        assert_eq!(at("1ms"), 1);
        assert_eq!(time_samples(at("2 MS"), FS), 96);
        for ms in [3i64, 20, 64, 103, 1500, 20000] {
            let chosen = at(&std::format!("{ms} MS"));
            let gap = |k: u8| (time_samples(k, FS) as i64 - ms * 48).abs();
            assert!((0..=TIME_MAX).all(|k| gap(k) >= gap(chosen)), "{ms} ms: no step is nearer");
        }
        assert_eq!(at("1.5 S"), at("1500 MS"));
        assert_eq!(at("0.02 s"), at("20"));
        assert_eq!(at("1000 S"), TIME_MAX, "as long as it goes");
        assert_eq!(at("-5 MS"), 0);
        assert_eq!(time_index("5 FORTNIGHTS", FS), None);
        assert_eq!(time_index("SOON", FS), None);
    }

    #[test]
    fn rates_land_on_the_nearest_step() {
        let at = |text: &str| rate_index(text).unwrap();
        assert_eq!(rate_millihertz(at("0.01 HZ")), 10);
        assert_eq!(rate_millihertz(at("5.12")), 5120);
        assert_eq!(at("105 HZ"), RATE_MAX);
        assert_eq!(at("1000 HZ"), RATE_MAX);
        assert_eq!(at("0"), 0);
        assert_eq!(rate_index("5 BPM"), None);
    }

    #[test]
    fn an_envelopes_settings_land_where_the_screens_keep_them() {
        let f = body("[ENV 2]\nGATE = EITHER\nDELAY = 0\nATTACK = 1 MS\nHOLD = 2 MS\nDECAY = 64 MS\nSUSTAIN = 25%\nRELEASE = 8 MS\n\
                      LOOP = FREE\nVCA = BOTH\nA CURVE = -100\nD CURVE = 60%\nR CURVE = 5\n");
        let want = Envelope {
            gate: 3, delay: 0, attack: 1, hold: 9, decay: 49, sustain: 25, release: 25,
            curves: [-100, 60, 5], looping: LoopMode::Free, vca: 3,
        };
        assert_eq!(f.patch.envelopes[1], want);
        assert_eq!(f.patch.envelopes[0], Envelope::default_for(0));
    }

    #[test]
    fn an_lfos_settings_land_where_the_screens_keep_them() {
        let f = body("[LFO 3]\nRATE = 5.12 HZ\nSHAPE = RANDOM\nPHASE = 270\nLEVEL = 50%\nPOLAR = UNI\nSYNC = GATE 2\n");
        let want = Lfo { rate: 72, shape: Shape::Random, unipolar: true, phase: 270, level: 50, sync: 2 };
        assert_eq!(f.patch.lfos[2], want);
        assert_eq!(body("[LFO 1]\nPHASE = -90 DEG\n").patch.lfos[0].phase, 270, "round the circle");
    }

    #[test]
    fn routing_replaces_the_default_and_steps_by_half_a_percent() {
        assert_eq!(body("").patch.slots, default_slots());
        let f = body("[ROUTING]\nCV 1 > PITCH 1 = 100%\nENV 1 > POS 1 = -12.5%\nLFO 3 > X DEPTH = 12.3%\nLFO 1 > PITCH 2 = 900%\n");
        assert_eq!(f.patch.slots[0], Slot { source: Source::Cv1, dest: Dest::Pitch1, amount: 200 });
        assert_eq!(f.patch.slots[1], Slot { source: Source::Env1, dest: Dest::Position1, amount: -25 });
        assert_eq!(f.patch.slots[2], Slot { source: Source::Lfo3, dest: Dest::Cross, amount: 25 });
        assert_eq!(f.patch.slots[3].amount, Dest::Pitch2.amount_limit(), "stops at what the slot can hold");
        assert!(f.patch.slots[4..].iter().all(|s| *s == Slot::EMPTY));
    }

    #[test]
    fn an_empty_routing_section_is_no_routing() {
        assert!(body("[ROUTING]\n").patch.slots.iter().all(|s| *s == Slot::EMPTY));
    }

    #[test]
    fn a_thirteenth_route_is_a_line_too_many() {
        let mut text = std::string::String::from("FAIRWAVE PATCH 1\n[ROUTING]\n");
        for _ in 0..13 {
            text.push_str("LFO 1 > POS 1 = 1%\n");
        }
        let f = read(&text);
        assert_eq!(f.patch.slots.iter().filter(|s| s.source == Source::Lfo1).count(), N_SLOTS);
        assert_eq!((f.skipped, f.first_skipped), (1, 15));
    }

    #[test]
    fn the_mixer_and_cross_modulation_land_where_the_screens_keep_them() {
        let f = body("[MIXER]\nOUT 0 = MIX\nOUT 1 = OSC 2\nOUT 2 = LFO 1\nOUT 3 = OFF\nBALANCE = 12.5%\nLEVEL 1 = 40%\nLEVEL 2 = 60%\n\
                      [CROSS MOD]\nMODE = PD\nFROM = OSC 2\nDEPTH = 62.5%\n");
        assert_eq!(f.patch.mixer.outs, [OutSel::Mix, OutSel::Osc2, OutSel::Lfo1, OutSel::Off]);
        assert_eq!(f.patch.mixer.balance, 125);
        assert_eq!((f.patch.layers[0].level, f.patch.layers[1].level), (40, 60));
        assert_eq!(f.patch.cross, Cross { mode: CrossMode::Pd, modulator: 1, depth: 625 });
    }

    #[test]
    fn a_value_out_of_range_stops_at_its_end() {
        let f = body("[OSC 1]\nPOS = 150%\nSHIFT = 900%\nLEVEL = 300%\nTUNE = 99\nFINE = -90\n[ENV 1]\nSUSTAIN = 101%\nA CURVE = 400\n\
                      [MIXER]\nBALANCE = -20%\n[CROSS MOD]\nDEPTH = 200%\n");
        let l = f.patch.layers[0];
        assert_eq!((l.position, l.shift, l.level, l.semitones, l.fine), (1000, 2000, 100, 48, -FINE_MAX));
        assert_eq!((f.patch.envelopes[0].sustain, f.patch.envelopes[0].curves[0]), (100, 100));
        assert_eq!((f.patch.mixer.balance, f.patch.cross.depth), (0, 1000));
        let huge = body("[OSC 1]\nTUNE = 99999999999999999999999999\n");
        assert_eq!(huge.patch.layers[0].semitones, 48, "however big it is");
    }

    #[test]
    fn what_isnt_understood_is_left_out_and_counted_and_the_rest_still_plays() {
        let f = read("FAIRWAVE PATCH 1\n\
                      [OSC 1]\n\
                      TUNE = -12\n\
                      FLAVOUR = STRAWBERRY\n\
                      EDGE = SIDEWAYS\n\
                      POS = NEARLY\n\
                      no equals sign here\n\
                      [HOLOGRAM]\n\
                      SIZE = 3\n\
                      [LFO 4]\n\
                      RATE = 1\n\
                      [ROUTING]\n\
                      CV 1 > ELBOW = 100%\n\
                      LFO 1 = 10%\n\
                      [OSC 2]\n\
                      TUNE = 7\n");
        assert_eq!(f.patch.layers[0].semitones, -12);
        assert_eq!(f.patch.layers[0].edge, Edge::Clamp);
        assert_eq!(f.patch.layers[1].semitones, 7, "it carries on after them");
        assert_eq!(f.first_skipped, 4);
        // FLAVOUR, EDGE, POS, no equals; HOLOGRAM and SIZE; LFO 4 and RATE; ELBOW, and a route with no end.
        assert_eq!(f.skipped, 10);
    }

    #[test]
    fn a_line_that_isnt_text_is_left_out_too() {
        let f = parse(b"FAIRWAVE PATCH 1\n\xFF\xFE\xFD\n[OSC 1]\nTUNE = 5\n", FS).unwrap();
        assert_eq!((f.skipped, f.first_skipped), (1, 2));
        assert_eq!(f.patch.layers[0].semitones, 5);
    }

    #[test]
    fn a_frame_length_has_to_be_one_the_engine_plays() {
        assert_eq!(body("[OSC 1]\nFRAME = 256\n").frame_log2[0], 8);
        assert_eq!(body("[OSC 1]\nFRAME = 2048 x64\n").frame_log2[0], 11);
        let f = read("FAIRWAVE PATCH 1\n[OSC 1]\nFRAME = 1000\nFRAME = 128\n");
        assert_eq!((f.frame_log2[0], f.skipped), (0, 2));
    }

    #[test]
    fn the_start_of_a_file_is_enough_to_say_what_it_is() {
        let whole = "FAIRWAVE PATCH 1\nNAME = A\nABOUT = THE ABOUT LINE\n[OSC 1]\nTUNE = -24\n[ROUTING]\nCV 1 > PITCH 1 = 100%\n";
        let f = parse(&whole.as_bytes()[..60], FS).unwrap();
        assert_eq!(f.about.as_str(), "THE ABOUT LINE");
    }

    /// Every `.fwp` under a folder, with its path from that folder.
    fn patches_under(folder: &std::path::Path, out: &mut std::vec::Vec<std::path::PathBuf>) {
        for item in std::fs::read_dir(folder).unwrap() {
            let path = item.unwrap().path();
            if path.is_dir() {
                patches_under(&path, out);
            } else if path.extension().is_some_and(|e| e == "fwp") {
                out.push(path);
            }
        }
    }

    /// The sound library reads with nothing left out, keeps to what a patch can hold, and (with
    /// `FAIRWAVE_WORDS_OUT=file`) says what it tells the gateware, for `tools/check_library.py`.
    #[test]
    fn every_library_patch_reads_with_nothing_left_out() {
        use crate::patch::Row;
        use std::fmt::Write as _;
        let library = std::path::Path::new(env!("CARGO_MANIFEST_DIR")).join("../library/FAIRWAVE");
        let mut paths = std::vec::Vec::new();
        patches_under(&library, &mut paths);
        assert!(paths.len() >= 30, "{}", paths.len());
        paths.sort();
        let table = crate::table::Table { offset: 0x80_0000, frame_log2: 10, frames: 64 };
        let mut dump = std::string::String::new();
        for path in &paths {
            let bytes = std::fs::read(path).unwrap();
            assert!(bytes.len() <= MAX_BYTES, "{path:?}");
            let f = parse(&bytes, FS).unwrap();
            assert_eq!((f.skipped, f.first_skipped), (0, 0), "{path:?}");
            assert!(!f.name.is_empty() && !f.about.is_empty(), "{path:?}");
            // The first kilobyte is all the Browser reads to say what it is.
            let head = parse(&bytes[..bytes.len().min(1024)], FS).unwrap();
            assert_eq!(head.about, f.about, "{path:?}");
            let shown = path.file_stem().unwrap().to_str().unwrap();
            assert!(shown.len() + ".fwp".len() <= crate::disk::NAME_BYTES, "{shown}");
            let w = f.patch.words(&[table, table], &[7, 7], FS);
            let words: std::vec::Vec<u32> = w.ctrl.iter().copied()
                .chain(w.envelopes.iter().flatten().copied())
                .chain(w.lfos.iter().flatten().copied())
                .chain(w.slots.iter().copied())
                .chain(w.base.iter().copied())
                .chain([w.routing])
                .collect();
            let relative = path.strip_prefix(&library).unwrap().to_str().unwrap().replace('\\', "/");
            write!(dump, "{relative}\t{}\t{}\t{}\t{}\t{}\t{}\t", f.name, f.about, f.tables[0], f.tables[1],
                   f.frame_log2[0], f.frame_log2[1]).unwrap();
            for word in words {
                write!(dump, "{word:x} ").unwrap();
            }
            dump.push('\n');
            // Whatever a file sets, the screens can go on to edit it.
            let mut l = f.patch.layers[0];
            crate::patch::adjust(&mut l, Row::Fine, 1, 2);
        }
        if let Ok(out) = std::env::var("FAIRWAVE_WORDS_OUT") {
            std::fs::write(out, dump).unwrap();
        }
    }

    #[test]
    fn nonsense_never_panics() {
        let mut x = 0x2545_F491u32;
        for _ in 0..400 {
            let mut text = std::vec::Vec::from(&b"FAIRWAVE PATCH 1\n"[..]);
            for _ in 0..200 {
                x ^= x << 13;
                x ^= x >> 17;
                x ^= x << 5;
                let pieces: [&[u8]; 20] = [b"[", b"]", b"=", b">", b"\n", b"-", b".", b"%", b"#", b" ", b"OSC 1", b"LFO", b"TUNE", b"POS",
                                           b"99999", b"\xC3", b"\xFF", b"ROUTING", b"FRAME", b"MS"];
                text.extend_from_slice(pieces[x as usize % pieces.len()]);
            }
            let f = parse(&text, FS).unwrap();
            f.patch.words(&[crate::table::Table { offset: 0x80_0000, frame_log2: 11, frames: 31 }; 2], &[8, 8], FS);
            let saved = crate::store::Saved {
                patch: f.patch,
                frame_log2: [0; crate::store::N_TABLES],
                files: [crate::store::TableFile::NONE; 2],
            };
            assert_eq!(crate::store::decode(&crate::store::encode(&saved), crate::store::VERSION).unwrap().patch, f.patch,
                       "whatever is read, a patch can keep");
        }
    }
}
