//! The engine's program for a profile: `model/program.py`'s `build` and `nam/engine.py`'s table
//! encodings, bit for bit. The weights come quantised in the file's order (`namfile::quantise`),
//! and everything goes out through `Tables` as the engine takes it.

use crate::namfile::{Layout, DILATIONS, KERNEL_SIZES, NUM_LAYERS};
use crate::quant::{self, Exponents, Formats, LayerPlan, CONST_SHIFT, HEAD_KERNEL, MAX_LAYERS};

pub const COLUMNS: usize = 8;
pub const N_RINGS: usize = 32;
/// Read streams are numbered 0..31 and write streams 0..7, each in their own space.
pub const N_READ_STREAMS: usize = 32;
pub const N_WRITE_STREAMS: usize = 8;
pub const N_STREAMS: usize = N_READ_STREAMS + N_WRITE_STREAMS;
/// A stream's PSRAM position: a word offset into the rings' area.
pub const POS_BITS: u32 = 18;
/// Words in a stream's buffer region (two bursts).
pub const REGION_MAX: u32 = 32;
pub const HIST_WORDS: u32 = 10240;
pub const WMEM_ROWS: u32 = 1536;
pub const AUX_WORDS: u32 = 1024;
pub const SBUF_R_WORDS: u32 = 1024;
pub const SBUF_W_WORDS: u32 = 256;
pub const MAX_SEGMENTS: usize = 256;

pub const AUX_GAIN_IN: u32 = 0;
pub const AUX_GAIN_OUT: u32 = 1;
pub const AUX_HEAD_B: u32 = 2;
pub const AUX_HEAD_W: u32 = 16;

// Sources, destinations, banks (program.py).
const SRC_RING: u64 = 0;
const SRC_X: u64 = 1;
const SRC_CONST: u64 = 2;
const SRC_ZQ: u64 = 3;
const SRC_Y: u64 = 4;
const SRC_ADC: u64 = 5;
const SRC_XC: u64 = 6;
const SRC_NEWEST: u64 = 7;
const DST_RING: u64 = 0;
const DST_ZQ: u64 = 1;
const DST_H: u64 = 2;
const DST_X: u64 = 3;
const DST_Y: u64 = 4;
const DST_OUT: u64 = 5;
const BANK_Z0: u64 = 0;
const BANK_Z1: u64 = 1;
const BANK_LIN: u64 = 2;
const BANK_H: u64 = 3;

/// Where the engine's tables go: the gateware, or a test's record of it.
pub trait Tables {
    fn weights(&mut self, row: u32, lanes: &[i32; COLUMNS]);
    fn aux(&mut self, index: u32, value: i32);
    /// One 36-bit word of the program memory (two per segment, low first).
    fn program(&mut self, index: u32, word: u64);
    fn ring(&mut self, index: u32, entry: u64);
    /// A stream's PSRAM position, at its index in the position table.
    fn pos(&mut self, index: u32, pos: u32);
}

/// What the firmware tells the engine's config register afterwards.
#[derive(Clone, Copy, PartialEq, Eq, Debug, Default)]
pub struct Built {
    pub n_rings: u32,
    pub n_streams: u32,
    pub n_segments: u32,
    pub n_rows: u32,
    pub late_after: u32,
    pub hist_words: u32,
    pub psram_words: u32,
    /// The streams' geometry (powers of two): 32-bit words per frame, per burst, per PSRAM ring.
    pub wpf_log2: u32,
    pub burst_log2: u32,
    pub ring_log2: u32,
}

#[derive(Clone, Copy, PartialEq, Eq, Debug)]
pub enum BuildError {
    HistoryTooLarge,
    StreamsTooMany,
    BuffersTooSmall,
    WeightsTooMany,
    ProgramTooLong,
    PsramTooSmall,
}

impl BuildError {
    pub const fn text(self) -> &'static str {
        match self {
            BuildError::HistoryTooLarge => "HISTORY DOESN'T FIT",
            BuildError::StreamsTooMany => "TOO MANY STREAMS",
            BuildError::BuffersTooSmall => "STREAM BUFFERS TOO SMALL",
            BuildError::WeightsTooMany => "WEIGHTS DON'T FIT",
            BuildError::ProgramTooLong => "PROGRAM TOO LONG",
            BuildError::PsramTooSmall => "PSRAM RINGS DON'T FIT",
        }
    }
}

#[derive(Clone, Copy, Default)]
struct Ring {
    frames: u32,
    psram: bool,
    base: u32,
    stride: u32,
    // PSRAM: the write stream and the first of `nread` read streams, as indices into the
    // builder's stream list; then (allocate) their numbers and the starting position.
    wstream: u32,
    sfirst: u32,
    nread: u32,
    stream0: u32,
    wnum: u32,
    rpos0: u32,
}

#[derive(Clone, Copy, Default)]
struct Stream {
    write: bool,
    delay: u32,
    wpf: u32,
    burst_frames: u32,
    num: u32,
    psram_base: u32,
    psram_frames: u32,
    offset: u32,
}

/// The layers' history placement for A2 with this engine: the D = 101 and 239 layers in PSRAM.
pub fn a2_plan(fmt: &Formats) -> [LayerPlan; MAX_LAYERS] {
    let mut plan = [LayerPlan { kernel: 0, dilation: 0, psram: false, hist_frac: 0, hist_bits: 18 }; MAX_LAYERS];
    for l in 0..NUM_LAYERS {
        let psram = DILATIONS[l] >= 101;
        plan[l] = LayerPlan {
            kernel: KERNEL_SIZES[l],
            dilation: DILATIONS[l],
            psram,
            hist_frac: if psram { fmt.psram_frac } else { fmt.hist_frac },
            hist_bits: if psram { 16 } else { 18 },
        };
    }
    plan
}

fn field(v: u64, lsb: u32, width: u32) -> u128 {
    debug_assert!(v < (1 << width), "field {v} wider than {width} bits");
    (v as u128) << lsb
}

// Segment fields (program.SEG_FIELDS).
#[allow(clippy::too_many_arguments)]
fn mac(src: u64, wrow: u32, bank: u64, count: u32, taps: u32, delay0: u32, dil: u32, ring: u32, clear: bool,
       wait: bool, aux: bool, tap0: u32) -> u128 {
    field(0, 0, 1)
        | field(src, 1, 3)
        | field(ring as u64, 4, 5)
        | field(delay0 as u64, 9, 12)
        | field(dil as u64, 21, 8)
        | field(taps as u64, 29, 4)
        | field(count as u64, 33, 4)
        | field(wrow as u64, 37, 11)
        | field(bank, 48, 2)
        | field(clear as u64, 50, 1)
        | field(wait as u64, 51, 1)
        | field(aux as u64, 52, 1)
        | field(tap0 as u64, 53, 4)
}

fn post(bank: u64, count: u32, shift: i32, dest: u64, ring: u32, leaky: bool, newest: bool, clearacc: bool,
        done: bool) -> u128 {
    debug_assert!((0..64).contains(&shift), "post shift {shift}");
    field(1, 0, 1)
        | field(bank, 1, 2)
        | field(count as u64, 3, 4)
        | field(shift as u64, 7, 6)
        | field(leaky as u64, 13, 1)
        | field(dest, 14, 3)
        | field(ring as u64, 17, 5)
        | field(newest as u64, 22, 1)
        | field(clearacc as u64, 23, 1)
        | field(done as u64, 24, 1)
}

/// The program word holding the input gain's shift: the input stage's post, the second segment's
/// low word (a post is all in its low word). Written alone it changes atomically, as does the gain
/// word; a level changes live with the two.
pub const INPUT_POST_WORD: u32 = 2;

/// The input stage's post with its gain's shift (`build` writes it so).
pub fn input_post(shift: i32) -> u64 {
    post(BANK_Z1, 1, shift, DST_X, 0, false, false, false, false) as u64
}

/// The output stage's post with its gain's shift, for a program of `n_segments` over `layers`
/// layers: the last segment's low word, (its index, the word).
pub fn output_post(n_segments: u32, layers: usize, shift: i32) -> (u32, u64) {
    let bank = if (layers - 1) % 2 == 0 { BANK_Z0 } else { BANK_Z1 };
    (2 * (n_segments - 1), post(bank, 1, shift, DST_OUT, 0, false, false, false, true) as u64)
}

fn encode_ring(r: &Ring) -> u64 {
    let f = |v: u32, lsb: u32| (v as u64) << lsb;
    f(r.base, 0)
        | f(r.frames, 14)
        | f(r.stride, 26)
        | f(r.psram as u32, 28)
        | f(r.stream0, 29)
        | f(r.nread, 34)
        | f(r.wnum, 38)
        | f(r.rpos0, 41)
}

/// A stream's entry in the engine's position table: (index, position). The prefill fetches a
/// read stream's slot 1 then slot 0 from frame `-delay - burst + offset`; a write stream's first
/// flush is of slot 1 to the frames before 0.
fn encode_pos(s: &Stream) -> (u32, u32) {
    let b = s.burst_frames as i64;
    let start = ((if s.write { 0 } else { -(s.delay as i64) }) - b + s.offset as i64)
        .rem_euclid(s.psram_frames as i64) as u32;
    let index = if s.write { N_READ_STREAMS as u32 + s.num } else { s.num };
    (index, (s.psram_base + start * s.wpf) & ((1 << POS_BITS) - 1))
}

/// Builds the program for a network of `c` channels whose quantised weights are `q` (the
/// file's order), writing every table through `out`. `psram_base` is a 32-bit word address.
#[allow(clippy::too_many_arguments)]
#[inline(never)] // (its tables are 3 KB of stack: the firmware's is 16 KB, so not inside a caller)
pub fn build<T: Tables>(c: usize, q: &[i32], _fmt: &Formats, plan: &[LayerPlan], e: &Exponents, head_scale: f64,
                        gain_in_db: f64, gain_out_db: f64, burst_frames: u32, psram_base: u32,
                        out: &mut T) -> Result<Built, BuildError> {
    let layout = Layout::new(c);
    // (3 channels -> 4 words a frame, 8 -> 8; two 16-bit channels to a PSRAM word)
    let stride = if c <= 1 { 0 } else { 32 - (c as u32 - 1).leading_zeros() };
    let wpf = ((1u32 << stride) / 2).max(1);

    // Rings and streams.
    let mut rings = [Ring::default(); N_RINGS];
    let mut streams = [Stream::default(); N_STREAMS];
    let mut n_streams = 0usize;
    for (l, p) in plan.iter().enumerate() {
        let frames = (p.kernel - 1) * p.dilation + 1;
        let mut r = Ring { frames, psram: p.psram, stride, ..Ring::default() };
        if p.psram {
            r.wstream = n_streams as u32;
            if n_streams + p.kernel as usize > N_STREAMS {
                return Err(BuildError::StreamsTooMany);
            }
            streams[n_streams] = Stream { write: true, delay: 0, wpf, burst_frames, ..Stream::default() };
            n_streams += 1;
            r.sfirst = n_streams as u32;
            r.nread = p.kernel - 1;
            for k in 0..p.kernel - 1 {
                streams[n_streams] = Stream {
                    write: false, delay: (p.kernel - 1 - k) * p.dilation, wpf, burst_frames, ..Stream::default()
                };
                n_streams += 1;
            }
        }
        rings[l] = r;
    }
    let hs = plan.len();
    rings[hs] = Ring { frames: HEAD_KERNEL as u32, stride, ..Ring::default() };
    let n_rings = hs + 1;

    // Allocation (program.allocate).
    let mut word = 0u32;
    for r in rings[..n_rings].iter_mut() {
        if r.psram {
            continue;
        }
        r.base = word;
        word += r.frames << r.stride;
    }
    if word > HIST_WORDS {
        return Err(BuildError::HistoryTooLarge);
    }
    // Streams: numbered so their buffer regions follow; every PSRAM ring the same power-of-two
    // size, aligned, so the engine wraps a position with a mask.
    let (mut wpf_log2, mut burst_log2, mut ring_log2, mut psram_words) = (0u32, 0u32, 0u32, 0u32);
    if n_streams > 0 {
        debug_assert!(psram_base % (1 << POS_BITS) == 0, "the rings' area must be aligned");
        if !burst_frames.is_power_of_two() {
            return Err(BuildError::BuffersTooSmall);
        }
        let region = 2 * wpf * burst_frames;
        if region > REGION_MAX {
            return Err(BuildError::BuffersTooSmall);
        }
        let (mut nr, mut nw) = (0u32, 0u32);
        for s in streams[..n_streams].iter_mut() {
            if s.write {
                s.num = nw;
                nw += 1;
            } else {
                s.num = nr;
                nr += 1;
            }
        }
        if nr as usize > N_READ_STREAMS || nw as usize > N_WRITE_STREAMS {
            return Err(BuildError::StreamsTooMany);
        }
        if nr * region > SBUF_R_WORDS || nw * region > SBUF_W_WORDS {
            return Err(BuildError::BuffersTooSmall);
        }
        let mut frames = 0u32;
        let mut n_psram = 0u32;
        for r in rings[..n_rings].iter().filter(|r| r.psram) {
            frames = frames.max(r.frames.div_ceil(burst_frames) * burst_frames);
            n_psram += 1;
        }
        let ring_words = (frames * wpf).next_power_of_two();
        if n_psram * ring_words > 1 << POS_BITS {
            return Err(BuildError::PsramTooSmall);
        }
        let mut k = 0u32;
        for r in rings[..n_rings].iter_mut() {
            if !r.psram {
                continue;
            }
            r.stream0 = streams[r.sfirst as usize].num;
            r.wnum = streams[r.wstream as usize].num;
            let offset = k % burst_frames;
            r.rpos0 = region - (1 + offset) * wpf;
            let (w, f) = (r.wstream as usize, r.sfirst as usize);
            for i in core::iter::once(w).chain(f..f + r.nread as usize) {
                let s = &mut streams[i];
                s.psram_base = psram_base + k * ring_words;
                s.psram_frames = ring_words / wpf;
                s.offset = offset;
            }
            k += 1;
        }
        wpf_log2 = wpf.trailing_zeros();
        burst_log2 = (wpf * burst_frames).trailing_zeros();
        ring_log2 = ring_words.trailing_zeros();
        psram_words = n_psram * ring_words;
    }

    // Weights: per layer conv (K*c rows), mixin and bias, 1x1 (c + 1 rows); then rechannel.
    let mut row = 0u32;
    let mut conv_rows = [0u32; MAX_LAYERS];
    let mut mix_rows = [0u32; MAX_LAYERS];
    let mut l1x1_rows = [0u32; MAX_LAYERS];
    let mut lanes: [i32; COLUMNS];
    for (l, p) in plan.iter().enumerate() {
        conv_rows[l] = row;
        for k in 0..p.kernel as usize {
            for j in 0..c {
                lanes = [0; COLUMNS];
                for i in 0..c {
                    lanes[i] = q[layout.conv_w(l, k, i, j)];
                }
                out.weights(row, &lanes);
                row += 1;
            }
        }
        mix_rows[l] = row;
        lanes = [0; COLUMNS];
        for i in 0..c {
            lanes[i] = q[layout.mixin(l, i)];
        }
        out.weights(row, &lanes);
        lanes = [0; COLUMNS];
        for i in 0..c {
            lanes[i] = q[layout.conv_b(l, i)];
        }
        out.weights(row + 1, &lanes);
        row += 2;
        l1x1_rows[l] = row;
        for b in 0..c {
            lanes = [0; COLUMNS];
            for i in 0..c {
                lanes[i] = q[layout.l1x1_w(l, i, b)];
            }
            out.weights(row, &lanes);
            row += 1;
        }
        lanes = [0; COLUMNS];
        for i in 0..c {
            lanes[i] = q[layout.l1x1_b(l, i)];
        }
        out.weights(row, &lanes);
        row += 1;
        if row > WMEM_ROWS {
            return Err(BuildError::WeightsTooMany);
        }
    }
    let r0 = row;
    lanes = [0; COLUMNS];
    for i in 0..c {
        lanes[i] = q[i];
    }
    out.weights(r0, &lanes);
    row += 1;
    if row > WMEM_ROWS {
        return Err(BuildError::WeightsTooMany);
    }
    for k in 0..HEAD_KERNEL {
        for b in 0..c {
            out.aux(AUX_HEAD_W + (k * c + b) as u32, q[layout.head_w(k, b)]);
        }
    }
    out.aux(AUX_HEAD_B, q[layout.head_b()]);
    let (gin, gin_frac) = quant::input_gain(gain_in_db);
    out.aux(AUX_GAIN_IN, gin);
    let (gout, gshift) = quant::output_gain(head_scale, gain_out_db, e.y_frac);
    out.aux(AUX_GAIN_OUT, gout);

    // The program (program.build's order).
    let mut n_segments = 0u32;
    let cc = c as u32;
    let zbank = |i: usize| if i % 2 == 0 { BANK_Z0 } else { BANK_Z1 };
    let mut emit = |seg: u128, out: &mut T| -> Result<(), BuildError> {
        if n_segments as usize >= MAX_SEGMENTS {
            return Err(BuildError::ProgramTooLong);
        }
        out.program(2 * n_segments, (seg & ((1 << 36) - 1)) as u64);
        out.program(2 * n_segments + 1, (seg >> 36) as u64);
        n_segments += 1;
        Ok(())
    };
    let conv_old = |i: usize, part: u32, emit: &mut dyn FnMut(u128, &mut T) -> Result<(), BuildError>, out: &mut T|
     -> Result<(), BuildError> {
        let p = &plan[i];
        let old = p.kernel - 1;
        let split = (old + 1) / 2;
        let (first, n) = if part == 0 { (0, split) } else { (split, old - split) };
        if n == 0 {
            return Ok(());
        }
        emit(mac(SRC_RING, conv_rows[i] + first * cc, zbank(i), cc, n, (p.kernel - 1 - first) * p.dilation,
                 p.dilation, i as u32, part == 0, false, false, first), out)
    };
    let conv_newest = |i: usize, emit: &mut dyn FnMut(u128, &mut T) -> Result<(), BuildError>, out: &mut T|
     -> Result<(), BuildError> {
        let p = &plan[i];
        emit(mac(SRC_NEWEST, conv_rows[i] + (p.kernel - 1) * cc, zbank(i), cc, 1, 0, 0, 0, false, false, false, 0), out)?;
        emit(mac(SRC_XC, mix_rows[i], zbank(i), 1, 1, 0, 0, 0, false, false, false, 0), out)
    };

    let last = plan.len() - 1;
    emit(mac(SRC_ADC, AUX_GAIN_IN, BANK_Z1, 1, 1, 0, 0, 0, true, false, true, 0), out)?;
    emit(input_post(gin_frac) as u128, out)?;
    conv_old(0, 0, &mut emit, out)?;
    conv_old(0, 1, &mut emit, out)?;
    emit(mac(SRC_X, r0, BANK_LIN, 1, 1, 0, 0, 0, true, true, false, 0), out)?;
    emit(post(BANK_LIN, cc, e.hist_shift[0], DST_RING, 0, false, true, false, false), out)?;
    for i in 0..plan.len() {
        conv_newest(i, &mut emit, out)?;
        if i < last {
            emit(post(zbank(i), cc, e.z_shift[i], DST_ZQ, 0, true, false, false, false), out)?;
            conv_old(i + 1, 0, &mut emit, out)?;
            emit(mac(SRC_ZQ, l1x1_rows[i], BANK_LIN, cc, 1, 0, 0, 0, false, false, false, 0), out)?;
            emit(post(BANK_LIN, cc, e.hist_shift[i + 1], DST_RING, i as u32 + 1, false, true, false, false), out)?;
            conv_old(i + 1, 1, &mut emit, out)?;
        } else {
            emit(post(zbank(i), cc, e.z_shift[i], DST_H, 0, true, false, false, false), out)?;
        }
    }
    let hb = zbank(last + 1);
    emit(mac(SRC_RING, AUX_HEAD_W, hb, cc, HEAD_KERNEL as u32 - 1, HEAD_KERNEL as u32 - 1, 1, hs as u32, true, false,
             true, 0), out)?;
    emit(post(BANK_H, cc, e.hsum_shift, DST_RING, hs as u32, false, true, true, false), out)?;
    emit(mac(SRC_NEWEST, AUX_HEAD_W + (HEAD_KERNEL as u32 - 1) * cc, hb, cc, 1, 0, 0, 0, false, false, true, 0), out)?;
    emit(mac(SRC_CONST, AUX_HEAD_B, hb, 1, 1, 0, 0, 0, false, false, true, 0), out)?;
    emit(post(hb, 1, e.y_shift, DST_Y, 0, false, false, false, false), out)?;
    let ob = zbank(last);
    emit(mac(SRC_Y, AUX_GAIN_OUT, ob, 1, 1, 0, 0, 0, true, true, true, 0), out)?;
    // (the last segment: `output_post` says which word and what's in it)
    emit(post(ob, 1, gshift, DST_OUT, 0, false, false, false, true), out)?;

    for (i, r) in rings[..n_rings].iter().enumerate() {
        out.ring(i as u32, encode_ring(r));
    }
    for s in streams[..n_streams].iter() {
        let (index, pos) = encode_pos(s);
        out.pos(index, pos);
    }
    let _ = CONST_SHIFT;
    Ok(Built {
        n_rings: n_rings as u32,
        n_streams: n_streams as u32,
        n_segments,
        n_rows: row,
        late_after: burst_frames - 1,
        hist_words: word,
        psram_words,
        wpf_log2,
        burst_log2,
        ring_log2,
    })
}

#[cfg(test)]
pub(crate) mod tests {
    use super::*;
    use crate::namfile;
    use std::vec::Vec;

    /// Every table write, kept.
    #[derive(Default)]
    pub(crate) struct Recorder {
        pub rows: std::collections::BTreeMap<u32, [i32; COLUMNS]>,
        pub aux: std::collections::BTreeMap<u32, i32>,
        pub program: std::collections::BTreeMap<u32, u64>,
        pub rings: std::collections::BTreeMap<u32, u64>,
        pub pos: std::collections::BTreeMap<u32, u32>,
    }

    impl Tables for Recorder {
        fn weights(&mut self, row: u32, lanes: &[i32; COLUMNS]) {
            self.rows.insert(row, *lanes);
        }
        fn aux(&mut self, index: u32, value: i32) {
            self.aux.insert(index, value);
        }
        fn program(&mut self, index: u32, word: u64) {
            self.program.insert(index, word);
        }
        fn ring(&mut self, index: u32, entry: u64) {
            self.rings.insert(index, entry);
        }
        fn pos(&mut self, index: u32, pos: u32) {
            self.pos.insert(index, pos);
        }
    }

    fn u32_at(b: &[u8], i: usize) -> u32 {
        u32::from_le_bytes(b[i..i + 4].try_into().unwrap())
    }

    fn golden(channels: usize) -> Vec<u8> {
        let dir = std::path::Path::new(env!("CARGO_MANIFEST_DIR"));
        let golden = std::fs::read(dir.join(format!("golden/a2_{channels}.bin"))).unwrap();
        assert_eq!(&golden[..4], b"NAMG");
        assert_eq!(u32_at(&golden, 4), 2, "golden file version");
        golden
    }

    /// This crate's build of A2.nam's network of `channels`, with the golden file's burst and
    /// PSRAM base, checked against `tools/dump_program.py`'s file.
    fn build_and_check(channels: usize) {
        let dir = std::path::Path::new(env!("CARGO_MANIFEST_DIR"));
        let nam = std::fs::read(dir.join("../NeuralAmpModelerCore/example_models/A2.nam")).unwrap();
        let golden = golden(channels);
        let g = |i: usize| u32_at(&golden, 8 + 4 * i);
        let (psram_base, burst) = (g(6), g(7));

        let nets = namfile::scan(&nam).unwrap();
        let net = *nets.found.iter().flatten().find(|n| n.channels == channels).unwrap();
        let fmt = Formats::DEFAULT;
        let plan = a2_plan(&fmt);
        let (maxes, head_scale) = namfile::maxes(&nam, &net).unwrap();
        // The weights' last value, as `a2.unpack_weights` takes it (the config says 0.01).
        assert_eq!(head_scale, 0.009999999776482582);
        let e = Exponents::choose(&fmt, &plan, &maxes, head_scale);
        let mut q = vec![0i32; net.weight_count()];
        namfile::quantise(&nam, &net, &fmt, &plan, &e, &mut q).unwrap();
        let mut rec = Recorder::default();
        let built = build(channels, &q, &fmt, &plan, &e, head_scale, 0.0, 0.0, burst, psram_base, &mut rec).unwrap();
        check_against_golden(channels, &rec, &built);
    }

    /// What a build wrote (at 0 dB in and out) against `tools/dump_program.py`'s file for A2.nam's
    /// network of `channels`.
    pub(crate) fn check_against_golden(channels: usize, rec: &Recorder, built: &Built) {
        let golden = golden(channels);
        let g = |i: usize| u32_at(&golden, 8 + 4 * i);
        let (g_channels, n_segments, n_rings, n_streams, n_rows, n_aux) = (g(0), g(1), g(2), g(3), g(4), g(5));
        assert_eq!(g_channels as usize, channels);
        assert_eq!((built.n_segments, built.n_rings, built.n_streams, built.n_rows),
                   (n_segments, n_rings, n_streams, n_rows));
        assert_eq!((built.wpf_log2, built.burst_log2, built.ring_log2), (g(8), g(9), g(10)));

        let mut at = 8 + 4 * 11;
        for i in 0..n_segments {
            let (lo, mid, hi) = (u32_at(&golden, at), u32_at(&golden, at + 4), u32_at(&golden, at + 8));
            at += 12;
            let want = lo as u128 | (mid as u128) << 32 | (hi as u128) << 64;
            let got = rec.program[&(2 * i)] as u128 | (rec.program[&(2 * i + 1)] as u128) << 36;
            assert_eq!(got, want, "segment {i}");
        }
        for i in 0..n_rings {
            let want = u64::from_le_bytes(golden[at..at + 8].try_into().unwrap());
            at += 8;
            assert_eq!(rec.rings[&i], want, "ring {i}");
        }
        assert_eq!(rec.pos.len(), n_streams as usize);
        for i in 0..n_streams {
            let (index, pos) = (u32_at(&golden, at), u32_at(&golden, at + 4));
            at += 8;
            assert_eq!(rec.pos.get(&index), Some(&pos), "stream {i}'s position (entry {index})");
        }
        for r in 0..n_rows {
            let want: Vec<i32> = (0..8).map(|k| u32_at(&golden, at + 4 * k) as i32).collect();
            at += 32;
            assert_eq!(rec.rows[&r].to_vec(), want, "row {r}");
        }
        for i in 0..n_aux {
            let want = u32_at(&golden, at) as i32;
            at += 4;
            let got = rec.aux.get(&i).copied().unwrap_or(0);
            assert_eq!(got, want, "aux {i}");
        }
        assert_eq!(at, golden.len());
    }

    #[test]
    fn lite_matches_the_python_program() {
        build_and_check(3);
    }

    #[test]
    fn full_matches_the_python_program() {
        build_and_check(8);
    }
}
