//! Loading a profile: from a `.nam` file's bytes to the engine's tables, in two steps so a file
//! that can't run never disturbs the one playing.
//!
//! `prepare` does everything that can fail: finds the A2 networks, picks the width asked for,
//! quantises its weights into a buffer and builds the program once into nothing, to be sure it
//! fits. `write` then builds it again into the engine (the build is quick; the parsing isn't), and
//! says what the gain words are, so the firmware can prewarm with them at zero and put them back.

use crate::namfile::{self, Network, Networks, NotA2};
use crate::program::{self, BuildError, Built, Tables, AUX_GAIN_IN, AUX_GAIN_OUT, COLUMNS, INPUT_POST_WORD};
use crate::quant::{self, Exponents, Formats, LayerPlan, MAX_LAYERS};

/// Frames a stream moves in a PSRAM burst (`tools/dump_program.py`'s, which the engine was
/// simulated with).
pub const BURST_FRAMES: u32 = 4;
/// Tiliqua's inputs at digital full scale, in dBu (±8.192 V).
pub const FULL_SCALE_DBU: f64 = 17.5;
/// Where the plugin's Normalized output mode puts a profile's loudness, in dB.
pub const NORMALIZED_DB: f64 = -18.0;
/// The quantised weights of the widest network (A2-Full).
pub const MAX_WEIGHTS: usize = 12146;

/// Where `prepare` has got to, for timing it.
#[derive(Clone, Copy, PartialEq, Eq, Debug)]
pub enum Step {
    /// The networks found (the file walked through).
    Scanned,
    /// The weights parsed.
    Parsed,
    Quantised,
    /// The program built into nothing.
    Checked,
}

/// Which of a file's networks to run.
#[derive(Clone, Copy, PartialEq, Eq, Debug, Default)]
pub enum Width {
    Lite,
    #[default]
    Full,
}

impl Width {
    pub const fn name(self) -> &'static str {
        match self {
            Width::Lite => "LITE",
            Width::Full => "FULL",
        }
    }
}

/// The plugin's output modes.
#[derive(Clone, Copy, PartialEq, Eq, Debug, Default)]
pub enum OutputMode {
    /// The network's output as it is.
    Raw,
    /// Its loudness brought to -18 dB.
    #[default]
    Normalized,
    /// The level the captured gear put out: digital full scale was `output_level_dbu` when the
    /// profile was captured, and is +17.5 dBu here.
    Calibrated,
}

impl OutputMode {
    pub const ALL: [OutputMode; 3] = [OutputMode::Raw, OutputMode::Normalized, OutputMode::Calibrated];

    pub const fn name(self) -> &'static str {
        match self {
            OutputMode::Raw => "RAW",
            OutputMode::Normalized => "NORMALIZED",
            OutputMode::Calibrated => "CALIBRATED",
        }
    }
}

/// How the input and output levels are set (the plugin's controls).
#[derive(Clone, Copy, PartialEq, Debug)]
pub struct Levels {
    /// Add the profile's input calibration: what was full scale when it was captured, against
    /// Tiliqua's +17.5 dBu.
    pub calibrated: bool,
    pub input_trim_db: f64,
    pub output: OutputMode,
    pub output_trim_db: f64,
}

impl Default for Levels {
    fn default() -> Self {
        Levels { calibrated: true, input_trim_db: 0.0, output: OutputMode::Normalized, output_trim_db: 0.0 }
    }
}

impl Levels {
    /// The input and output gains in dB for a network. A mode the file has no figure for adds
    /// nothing.
    pub fn gains(&self, n: &Network) -> (f64, f64) {
        let calibration = match (self.calibrated, n.input_level_dbu) {
            (true, Some(dbu)) => FULL_SCALE_DBU - dbu,
            _ => 0.0,
        };
        let output = match (self.output, n.loudness, n.output_level_dbu) {
            (OutputMode::Normalized, Some(loudness), _) => NORMALIZED_DB - loudness,
            (OutputMode::Calibrated, _, Some(dbu)) => dbu - FULL_SCALE_DBU,
            _ => 0.0,
        };
        (calibration + self.input_trim_db, output + self.output_trim_db)
    }
}

/// Why a profile didn't load, in the words the screen shows.
#[derive(Clone, Copy, PartialEq, Eq, Debug)]
pub enum LoadError {
    File(NotA2),
    Build(BuildError),
}

impl LoadError {
    pub const fn text(self) -> &'static str {
        match self {
            LoadError::File(e) => e.text(),
            LoadError::Build(e) => e.text(),
        }
    }
}

/// A profile checked and quantised, ready to write.
#[derive(Clone, Copy, Debug)]
pub struct Prepared {
    pub network: Network,
    /// The widths the file has.
    pub has_lite: bool,
    pub has_full: bool,
    /// The width running: the one asked for, or the file's only one.
    pub width: Width,
    pub head_scale: f64,
    pub input_db: f64,
    pub output_db: f64,
    exponents: Exponents,
    plan: [LayerPlan; MAX_LAYERS],
    psram_base: u32,
}

impl Prepared {
    pub fn channels(&self) -> usize {
        self.network.channels
    }
}

/// What the engine was given.
#[derive(Clone, Copy, PartialEq, Debug)]
pub struct Loaded {
    pub built: Built,
    /// The gain words as built: the firmware zeroes them to prewarm, then writes these.
    pub gain_in: i32,
    pub gain_out: i32,
    /// What the levels' words are worked out from, to change them live.
    pub basis: Basis,
}

/// What a profile's level words depend on, beside the levels.
#[derive(Clone, Copy, PartialEq, Debug)]
pub struct Basis {
    pub network: Network,
    pub head_scale: f64,
    y_frac: i32,
    n_segments: u32,
    layers: usize,
}

/// The engine's words for a set of levels: the two gain words (aux) and the program words holding
/// their shifts, (index, word). Each is one table write, which a sample sees whole; write a
/// shift before its gain word when the shift grows, after it when it shrinks, and the sample
/// that sees one without the other is quieter, never louder.
#[derive(Clone, Copy, PartialEq, Debug)]
pub struct LevelWords {
    pub gain_in: i32,
    pub in_post: (u32, u64),
    pub gain_out: i32,
    pub out_post: (u32, u64),
    pub input_db: f64,
    pub output_db: f64,
}

/// The level words for `levels`, as a build with them would write.
pub fn level_words(b: &Basis, levels: &Levels) -> LevelWords {
    let (input_db, output_db) = levels.gains(&b.network);
    let (gain_in, in_shift) = quant::input_gain(input_db);
    let (gain_out, out_shift) = quant::output_gain(b.head_scale, output_db, b.y_frac);
    LevelWords {
        gain_in,
        in_post: (INPUT_POST_WORD, program::input_post(in_shift)),
        gain_out,
        out_post: program::output_post(b.n_segments, b.layers, out_shift),
        input_db,
        output_db,
    }
}

/// The shift in a post's word (its bits 7 to 12).
pub const fn post_shift(word: u64) -> u32 {
    ((word >> 7) & 63) as u32
}

/// Which network of a file's runs for `want`: Full is the wider of two, Lite the narrower.
fn pick(nets: &Networks, want: Width) -> Option<(Network, Width)> {
    let (lite, full) = match nets.count() {
        2 => (nets.narrowest()?, nets.widest()?),
        1 => {
            let only = nets.widest()?;
            return Some((*only, if only.channels > 3 { Width::Full } else { Width::Lite }));
        }
        _ => return None,
    };
    Some(match want {
        Width::Lite => (*lite, Width::Lite),
        Width::Full => (*full, Width::Full),
    })
}

/// The first step: reads the file, quantises the chosen network's weights into `q` (the file's
/// order; at least `MAX_WEIGHTS` long) and builds the program into nothing. `psram_base` is
/// where the engine's PSRAM rings are, as a 32-bit word address. `values` (as long as `q`) keeps
/// the parsed weights between the two passes; `mark` is told as each step ends.
#[inline(never)]
pub fn prepare(bytes: &[u8], want: Width, levels: &Levels, psram_base: u32, q: &mut [i32], values: &mut [f64],
               mark: &mut dyn FnMut(Step)) -> Result<Prepared, LoadError> {
    let nets = namfile::scan(bytes).map_err(LoadError::File)?;
    mark(Step::Scanned);
    let (network, width) = pick(&nets, want).ok_or(LoadError::File(NotA2::NotNam))?;
    let has_lite = nets.found.iter().flatten().any(|n| n.channels <= 3);
    let has_full = nets.found.iter().flatten().any(|n| n.channels > 3);
    if q.len() < network.weight_count() {
        return Err(LoadError::Build(BuildError::WeightsTooMany));
    }
    let fmt = Formats::DEFAULT;
    let plan = program::a2_plan(&fmt);
    let (maxes, head_scale) = namfile::read_weights(bytes, &network, values).map_err(LoadError::File)?;
    mark(Step::Parsed);
    let exponents = Exponents::choose(&fmt, &plan, &maxes, head_scale);
    if values.len() >= network.weight_count() {
        namfile::quantise_values(values, &network, &fmt, &plan, &exponents, q);
    } else {
        namfile::quantise(bytes, &network, &fmt, &plan, &exponents, q).map_err(LoadError::File)?;
    }
    mark(Step::Quantised);
    let (input_db, output_db) = levels.gains(&network);
    let p = Prepared {
        network, has_lite, has_full, width, head_scale, input_db, output_db, exponents, plan, psram_base,
    };
    run_build(&p, q, &mut Nowhere)?;
    mark(Step::Checked);
    Ok(p)
}

/// The second step: the program built into the engine's tables.
#[inline(never)]
pub fn write<T: Tables>(p: &Prepared, q: &[i32], out: &mut T) -> Result<Loaded, LoadError> {
    let mut gains = Gains { inner: out, gain_in: 0, gain_out: 0 };
    let built = run_build(p, q, &mut gains)?;
    let basis = Basis {
        network: p.network,
        head_scale: p.head_scale,
        y_frac: p.exponents.y_frac,
        n_segments: built.n_segments,
        layers: p.plan.iter().filter(|l| l.kernel > 0).count(),
    };
    Ok(Loaded { built, gain_in: gains.gain_in, gain_out: gains.gain_out, basis })
}

fn run_build<T: Tables>(p: &Prepared, q: &[i32], out: &mut T) -> Result<Built, LoadError> {
    let fmt = Formats::DEFAULT;
    program::build(p.network.channels, q, &fmt, &p.plan, &p.exponents, p.head_scale, p.input_db, p.output_db,
                   BURST_FRAMES, p.psram_base, out)
        .map_err(LoadError::Build)
}

/// Where the checking build goes.
struct Nowhere;

impl Tables for Nowhere {
    fn weights(&mut self, _row: u32, _lanes: &[i32; COLUMNS]) {}
    fn aux(&mut self, _index: u32, _value: i32) {}
    fn program(&mut self, _index: u32, _word: u64) {}
    fn ring(&mut self, _index: u32, _entry: u64) {}
    fn pos(&mut self, _index: u32, _pos: u32) {}
}

/// Passes every table write on, keeping the gain words.
struct Gains<'a, T: Tables> {
    inner: &'a mut T,
    gain_in: i32,
    gain_out: i32,
}

impl<T: Tables> Tables for Gains<'_, T> {
    fn weights(&mut self, row: u32, lanes: &[i32; COLUMNS]) {
        self.inner.weights(row, lanes);
    }
    fn aux(&mut self, index: u32, value: i32) {
        match index {
            AUX_GAIN_IN => self.gain_in = value,
            AUX_GAIN_OUT => self.gain_out = value,
            _ => {}
        }
        self.inner.aux(index, value);
    }
    fn program(&mut self, index: u32, word: u64) {
        self.inner.program(index, word);
    }
    fn ring(&mut self, index: u32, entry: u64) {
        self.inner.ring(index, entry);
    }
    fn pos(&mut self, index: u32, pos: u32) {
        self.inner.pos(index, pos);
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::program::tests::{check_against_golden, Recorder};
    use crate::quant;
    use std::path::{Path, PathBuf};
    use std::vec::Vec;

    /// Where the engine's rings are on the device (`NamSoc.PSRAM_RINGS_BASE`), in words.
    const PSRAM_BASE_WORDS: u32 = 0x80_0000 / 4;

    fn models() -> PathBuf {
        Path::new(env!("CARGO_MANIFEST_DIR")).join("../NeuralAmpModelerCore/example_models")
    }

    fn model(name: &str) -> Vec<u8> {
        std::fs::read(models().join(name)).unwrap()
    }

    /// Scratch for the parsed weights.
    fn vals() -> std::vec::Vec<f64> {
        std::vec![0.0; MAX_WEIGHTS]
    }

    /// Without the scratch, the weights parsed twice: the same tables.
    #[test]
    fn parsing_once_or_twice_builds_the_same() {
        let nam = model("A2.nam");
        let mut q1 = std::vec![0i32; MAX_WEIGHTS];
        let mut q2 = std::vec![0i32; MAX_WEIGHTS];
        let mut steps = std::vec::Vec::new();
        let p1 = prepare(&nam, Width::Full, &Levels::default(), PSRAM_BASE_WORDS, &mut q1, &mut vals(), &mut |s| steps.push(s)).unwrap();
        let p2 = prepare(&nam, Width::Full, &Levels::default(), PSRAM_BASE_WORDS, &mut q2, &mut [], &mut |_| {}).unwrap();
        assert_eq!(q1, q2);
        assert_eq!(steps, [Step::Scanned, Step::Parsed, Step::Quantised, Step::Checked]);
        let (mut r1, mut r2) = (Recorder::default(), Recorder::default());
        write(&p1, &q1, &mut r1).unwrap();
        write(&p2, &q2, &mut r2).unwrap();
        assert_eq!((r1.aux, r1.program, r1.rows), (r2.aux, r2.program, r2.rows));
    }

    const FLAT: Levels = Levels { calibrated: false, input_trim_db: 0.0, output: OutputMode::Raw, output_trim_db: 0.0 };

    #[test]
    fn a2_loads_as_the_python_program_in_both_widths() {
        let nam = model("A2.nam");
        let mut q = std::vec![0i32; MAX_WEIGHTS];
        for (want, channels) in [(Width::Full, 8), (Width::Lite, 3)] {
            let p = prepare(&nam, want, &FLAT, PSRAM_BASE_WORDS, &mut q, &mut vals(), &mut |_| {}).unwrap();
            assert_eq!((p.width, p.channels()), (want, channels));
            assert!(p.has_lite && p.has_full);
            let mut rec = Recorder::default();
            let loaded = write(&p, &q, &mut rec).unwrap();
            check_against_golden(channels, &rec, &loaded.built);
            assert_eq!(loaded.gain_in, rec.aux[&AUX_GAIN_IN]);
            assert_eq!(loaded.gain_out, rec.aux[&AUX_GAIN_OUT]);
            assert_eq!(loaded.gain_in, 1 << 16, "0 dB in");
        }
    }

    #[test]
    fn the_levels_come_from_the_profiles_metadata() {
        let nam = model("A2.nam");
        let mut q = std::vec![0i32; MAX_WEIGHTS];
        let p = prepare(&nam, Width::Full, &Levels::default(), PSRAM_BASE_WORDS, &mut q, &mut vals(), &mut |_| {}).unwrap();
        let (dbu, loudness) = (p.network.input_level_dbu.unwrap(), p.network.loudness.unwrap());
        assert!((p.input_db - (17.5 - dbu)).abs() < 1e-12, "{}", p.input_db);
        assert!((p.output_db - (-18.0 - loudness)).abs() < 1e-12, "{}", p.output_db);
        let mut rec = Recorder::default();
        let loaded = write(&p, &q, &mut rec).unwrap();
        assert_eq!(loaded.gain_in, quant::input_gain(p.input_db).0);
        let y_frac = p.exponents.y_frac;
        assert_eq!(loaded.gain_out, quant::output_gain(p.head_scale, p.output_db, y_frac).0);
        // The trims add on.
        let trims = Levels { input_trim_db: 12.0, output_trim_db: -6.0, ..Levels::default() };
        let (i, o) = trims.gains(&p.network);
        assert!((i - p.input_db - 12.0).abs() < 1e-12 && (o - p.output_db + 6.0).abs() < 1e-12);
        // Nothing to calibrate with: no change.
        let bare = Network { input_level_dbu: None, loudness: None, output_level_dbu: None, ..p.network };
        assert_eq!(Levels::default().gains(&bare), (0.0, 0.0));
        let calibrated = Levels { output: OutputMode::Calibrated, ..Levels::default() };
        assert_eq!(calibrated.gains(&bare).1, 0.0);
        let with_out = Network { output_level_dbu: Some(12.3), ..bare };
        assert!((calibrated.gains(&with_out).1 - (12.3 - 17.5)).abs() < 1e-12);
    }

    /// A level changed live leaves the engine's tables as a build with the new levels would.
    #[test]
    fn levels_changed_live_match_a_build_with_them() {
        let nam = model("A2.nam");
        let mut q = std::vec![0i32; MAX_WEIGHTS];
        for want in [Width::Full, Width::Lite] {
            let p = prepare(&nam, want, &Levels::default(), PSRAM_BASE_WORDS, &mut q, &mut vals(), &mut |_| {}).unwrap();
            let mut live = Recorder::default();
            let loaded = write(&p, &q, &mut live).unwrap();
            for to in [
                Levels { input_trim_db: 13.0, output_trim_db: -7.0, ..Levels::default() },
                Levels { calibrated: false, output: OutputMode::Raw, ..Levels::default() },
                Levels { input_trim_db: -30.0, output: OutputMode::Calibrated, output_trim_db: 20.0, ..Levels::default() },
                Levels { input_trim_db: 40.0, output_trim_db: -40.0, ..Levels::default() },
            ] {
                let w = level_words(&loaded.basis, &to);
                live.aux.insert(AUX_GAIN_IN, w.gain_in);
                live.aux.insert(AUX_GAIN_OUT, w.gain_out);
                live.program.insert(w.in_post.0, w.in_post.1);
                live.program.insert(w.out_post.0, w.out_post.1);
                let fresh_p = prepare(&nam, want, &to, PSRAM_BASE_WORDS, &mut q, &mut vals(), &mut |_| {}).unwrap();
                let mut fresh = Recorder::default();
                write(&fresh_p, &q, &mut fresh).unwrap();
                assert_eq!(live.aux, fresh.aux, "{want:?} {to:?}");
                assert_eq!(live.program, fresh.program, "{want:?} {to:?}");
                assert_eq!(live.rows, fresh.rows);
                assert!((w.input_db - fresh_p.input_db).abs() < 1e-12 && (w.output_db - fresh_p.output_db).abs() < 1e-12);
            }
        }
    }

    /// Every level the controls can set gives words that fit: a gain word of 18 bits, a shift of six.
    #[test]
    fn every_level_the_controls_reach_fits() {
        let nam = model("A2.nam");
        let mut q = std::vec![0i32; MAX_WEIGHTS];
        let p = prepare(&nam, Width::Full, &Levels::default(), PSRAM_BASE_WORDS, &mut q, &mut vals(), &mut |_| {}).unwrap();
        let loaded = write(&p, &q, &mut Recorder::default()).unwrap();
        let limit = (1 << 17) - 1;
        for input in -30..=40 {
            for output in -40..=20 {
                for mode in OutputMode::ALL {
                    for calibrated in [false, true] {
                        let l = Levels { calibrated, input_trim_db: input as f64, output: mode, output_trim_db: output as f64 };
                        let w = level_words(&loaded.basis, &l);
                        assert!(w.gain_in > 0 && w.gain_in <= limit && w.gain_out > 0 && w.gain_out <= limit, "{l:?}");
                        let (si, so) = (post_shift(w.in_post.1), post_shift(w.out_post.1));
                        let (ri, ro) = (quant::input_gain(w.input_db).1, quant::output_gain(p.head_scale, w.output_db, p.exponents.y_frac).1);
                        assert_eq!((si as i32, so as i32), (ri, ro), "{l:?}: a shift outside six bits");
                    }
                }
            }
        }
    }

    #[test]
    fn other_networks_are_refused_with_the_reason() {
        let mut q = std::vec![0i32; MAX_WEIGHTS];
        for (file, why) in [
            ("lstm.nam", LoadError::File(NotA2::Architecture)),
            ("wavenet_a1_standard.nam", LoadError::File(NotA2::Shape(""))),
            ("wavenet.nam", LoadError::File(NotA2::Shape(""))),
        ] {
            let got = prepare(&model(file), Width::Full, &FLAT, PSRAM_BASE_WORDS, &mut q, &mut vals(), &mut |_| {}).unwrap_err();
            let same = match (got, why) {
                (LoadError::File(NotA2::Shape(_)), LoadError::File(NotA2::Shape(_))) => true,
                (a, b) => a == b,
            };
            assert!(same, "{file}: {got:?}");
            assert!(!got.text().is_empty());
        }
        let not_json = prepare(b"hello", Width::Full, &FLAT, PSRAM_BASE_WORDS, &mut q, &mut vals(), &mut |_| {}).unwrap_err();
        assert_eq!(not_json, LoadError::File(NotA2::NotJson));
    }

    #[test]
    fn a_file_with_one_width_runs_that_one_whatever_was_asked() {
        // A2.nam's Lite network alone, as a plain WaveNet file.
        let nam = model("A2.nam");
        let nets = namfile::scan(&nam).unwrap();
        let lite = nets.narrowest().unwrap();
        let mut doc = std::string::String::from("{\"architecture\": \"WaveNet\", \"config\": ");
        let text = std::str::from_utf8(&nam).unwrap();
        // The Lite submodel's own config and weights, cut out of the container.
        let j = namfile::Json::new(&nam);
        let sub_start = text[..lite.weights.start].rfind("\"config\"").unwrap();
        let cfg_start = sub_start + text[sub_start..].find('{').unwrap();
        let cfg_end = j.skip_value(cfg_start).unwrap();
        doc.push_str(&text[cfg_start..cfg_end]);
        doc.push_str(", \"weights\": ");
        doc.push_str(&text[lite.weights.start..lite.weights.end]);
        doc.push('}');
        let mut q = std::vec![0i32; MAX_WEIGHTS];
        let p = prepare(doc.as_bytes(), Width::Full, &FLAT, PSRAM_BASE_WORDS, &mut q, &mut vals(), &mut |_| {}).unwrap();
        assert_eq!((p.width, p.channels(), p.has_lite, p.has_full), (Width::Lite, 3, true, false));
        let mut rec = Recorder::default();
        let loaded = write(&p, &q, &mut rec).unwrap();
        check_against_golden(3, &rec, &loaded.built);
    }

    #[test]
    fn a_buffer_too_small_for_the_weights_is_refused() {
        let nam = model("A2.nam");
        let mut q = std::vec![0i32; 100];
        assert_eq!(prepare(&nam, Width::Full, &FLAT, PSRAM_BASE_WORDS, &mut q, &mut vals(), &mut |_| {}).unwrap_err(),
                   LoadError::Build(BuildError::WeightsTooMany));
    }

    /// The whole way, as the firmware goes: a drive with the profile in its home folder, listed,
    /// read by DMA, prepared and written.
    #[test]
    fn a_profile_on_a_drive_loads() {
        use crate::browser::DrivePath;
        use crate::disk::image::Builder;
        use crate::disk::tests::{aligned, mounted, CHUNK_BLOCKS};
        use crate::disk::{self, Entry, HOME_FOLDER};

        let nam = model("A2.nam");
        let mut b = Builder::new(true);
        let root = b.root();
        let home = b.add_dir(root, "NAM");
        b.add_file(home, "Example A2 Capture.nam", &nam, true, 0);
        b.add_file(home, "lstm.nam", &model("lstm.nam"), false, 0);
        b.add_file(home, "readme.txt", b"profiles", false, 0);
        let (mut drive, buffers) = mounted(&b);

        let home = disk::find(&mut drive, &buffers, HOME_FOLDER).unwrap();
        let mut at = DrivePath::default();
        assert!(at.enter(home.short(), home.name()));
        let mut entries = [Entry::EMPTY; 8];
        let n = disk::list(&mut drive, &buffers, at.as_str(), &mut entries).unwrap();
        let shown: Vec<&str> = entries[..n].iter().map(|e| e.name()).collect();
        assert_eq!(shown, ["..", "Example A2 Capture.nam", "lstm.nam"]);

        let file = entries[1];
        let to = aligned(0x10_0000);
        let path = at.of(file.short()).unwrap();
        let size = disk::read_file(&mut drive, &buffers, path.as_str(), to, CHUNK_BLOCKS).unwrap();
        let mut bytes = std::vec![0u8; size];
        to.read_into(0, &mut bytes);
        assert_eq!(bytes, nam);

        let mut q = std::vec![0i32; MAX_WEIGHTS];
        let p = prepare(&bytes, Width::Full, &FLAT, PSRAM_BASE_WORDS, &mut q, &mut vals(), &mut |_| {}).unwrap();
        let mut rec = Recorder::default();
        let loaded = write(&p, &q, &mut rec).unwrap();
        check_against_golden(8, &rec, &loaded.built);
        assert_eq!(crate::browser::profile_name(file.name()).as_str(), "Example A2 Capture");
    }
}
