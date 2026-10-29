//! LZMA decoder (the ".lzma" / "LZMA alone" format of `xz --format=lzma`
//! and Python's `lzma.FORMAT_ALONE`), without allocation.
//!
//! The ROM images are stored compressed in the firmware: the H3500 set is
//! 832 KB, LZMA brings it to about 135 KB, small enough for a flash slot.
//! This follows the reference decoder of the LZMA SDK (`LzmaSpec.cpp`,
//! public domain). The whole output is in memory, so it is its own
//! dictionary.

/// Literal coder sizes supported: `lc + lp <= MAX_LC_LP`.
pub const MAX_LC_LP: u32 = 3;

const NUM_BIT_MODEL_TOTAL_BITS: u32 = 11;
const BIT_MODEL_TOTAL: u32 = 1 << NUM_BIT_MODEL_TOTAL_BITS;
const NUM_MOVE_BITS: u32 = 5;
const TOP_VALUE: u32 = 1 << 24;
const PROB_INIT: u16 = (BIT_MODEL_TOTAL / 2) as u16;

const NUM_STATES: usize = 12;
const POS_BITS_MAX: usize = 4;
const NUM_LEN_TO_POS_STATES: usize = 4;
const NUM_ALIGN_BITS: u32 = 4;
const START_POS_MODEL_INDEX: u32 = 4;
const END_POS_MODEL_INDEX: u32 = 14;
const NUM_FULL_DISTANCES: u32 = 1 << (END_POS_MODEL_INDEX >> 1);
const MATCH_MIN_LEN: usize = 2;

#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum Error {
    /// Shorter than the 13-byte header.
    Header,
    /// lc, lp or pb out of range (or more than [`MAX_LC_LP`]).
    Properties,
    /// The output buffer is smaller than the data.
    OutputFull,
    /// The data is not a valid LZMA stream.
    Corrupt,
}

struct RangeDecoder<'a> {
    input: &'a [u8],
    pos: usize,
    range: u32,
    code: u32,
    corrupted: bool,
}

impl<'a> RangeDecoder<'a> {
    fn new(input: &'a [u8]) -> Self {
        let mut rc = RangeDecoder { input, pos: 0, range: 0xFFFF_FFFF, code: 0, corrupted: false };
        let b = rc.byte();
        for _ in 0..4 {
            rc.code = (rc.code << 8) | rc.byte() as u32;
        }
        if b != 0 || rc.code == rc.range {
            rc.corrupted = true;
        }
        rc
    }

    #[inline(always)]
    fn byte(&mut self) -> u8 {
        // Past the end reads zeros; a stream that needs them is corrupt and
        // is caught by the checks that follow.
        let b = self.input.get(self.pos).copied().unwrap_or(0);
        self.pos += 1;
        b
    }

    fn finished_ok(&self) -> bool {
        self.code == 0
    }

    #[inline(always)]
    fn normalize(&mut self) {
        if self.range < TOP_VALUE {
            self.range <<= 8;
            self.code = (self.code << 8) | self.byte() as u32;
        }
    }

    fn direct_bits(&mut self, mut num: u32) -> u32 {
        let mut res = 0u32;
        while num > 0 {
            self.range >>= 1;
            self.code = self.code.wrapping_sub(self.range);
            let t = 0u32.wrapping_sub(self.code >> 31);
            self.code = self.code.wrapping_add(self.range & t);
            if self.code == self.range {
                self.corrupted = true;
            }
            self.normalize();
            res = (res << 1).wrapping_add(t.wrapping_add(1));
            num -= 1;
        }
        res
    }

    #[inline(always)]
    fn bit(&mut self, prob: &mut u16) -> u32 {
        let v = *prob as u32;
        let bound = (self.range >> NUM_BIT_MODEL_TOTAL_BITS) * v;
        let symbol;
        if self.code < bound {
            *prob = (v + ((BIT_MODEL_TOTAL - v) >> NUM_MOVE_BITS)) as u16;
            self.range = bound;
            symbol = 0;
        } else {
            *prob = (v - (v >> NUM_MOVE_BITS)) as u16;
            self.code -= bound;
            self.range -= bound;
            symbol = 1;
        }
        self.normalize();
        symbol
    }

    fn tree(&mut self, probs: &mut [u16], num_bits: u32) -> u32 {
        let mut m = 1usize;
        for _ in 0..num_bits {
            m = (m << 1) + self.bit(&mut probs[m]) as usize;
        }
        (m - (1 << num_bits)) as u32
    }

    fn tree_reverse(&mut self, probs: &mut [u16], num_bits: u32) -> u32 {
        let mut m = 1usize;
        let mut symbol = 0u32;
        for i in 0..num_bits {
            let bit = self.bit(&mut probs[m]);
            m = (m << 1) + bit as usize;
            symbol |= bit << i;
        }
        symbol
    }
}

#[derive(Clone, Copy)]
struct LenDecoder {
    choice: u16,
    choice2: u16,
    low: [[u16; 1 << 3]; 1 << POS_BITS_MAX],
    mid: [[u16; 1 << 3]; 1 << POS_BITS_MAX],
    high: [u16; 1 << 8],
}

impl LenDecoder {
    fn init(&mut self) {
        self.choice = PROB_INIT;
        self.choice2 = PROB_INIT;
        self.high.fill(PROB_INIT);
        for i in 0..1 << POS_BITS_MAX {
            self.low[i].fill(PROB_INIT);
            self.mid[i].fill(PROB_INIT);
        }
    }

    fn decode(&mut self, rc: &mut RangeDecoder, pos_state: usize) -> usize {
        if rc.bit(&mut self.choice) == 0 {
            return rc.tree(&mut self.low[pos_state], 3) as usize;
        }
        if rc.bit(&mut self.choice2) == 0 {
            return 8 + rc.tree(&mut self.mid[pos_state], 3) as usize;
        }
        16 + rc.tree(&mut self.high, 8) as usize
    }
}

/// The decoder's probability model (about 15 KB): give it a place in memory
/// that is not the stack, e.g. with [`Probs::init_at`].
pub struct Probs {
    literal: [u16; 0x300 << MAX_LC_LP],
    is_match: [u16; NUM_STATES << POS_BITS_MAX],
    is_rep: [u16; NUM_STATES],
    is_rep_g0: [u16; NUM_STATES],
    is_rep_g1: [u16; NUM_STATES],
    is_rep_g2: [u16; NUM_STATES],
    is_rep0_long: [u16; NUM_STATES << POS_BITS_MAX],
    pos_slot: [[u16; 1 << 6]; NUM_LEN_TO_POS_STATES],
    pos: [u16; 1 + NUM_FULL_DISTANCES as usize - END_POS_MODEL_INDEX as usize],
    align: [u16; 1 << NUM_ALIGN_BITS],
    len: LenDecoder,
    rep_len: LenDecoder,
}

impl Probs {
    /// Initialise a `Probs` in the memory at `p`.
    ///
    /// # Safety
    /// `p` must be valid for writes of `size_of::<Probs>()` bytes, aligned
    /// for `u16`, and not otherwise in use while the reference lives.
    pub unsafe fn init_at<'a>(p: *mut Probs) -> &'a mut Probs {
        // Every field is u16s: any bit pattern is a valid value.
        p.write_bytes(0, 1);
        let probs = &mut *p;
        probs.init();
        probs
    }

    fn init(&mut self) {
        self.literal.fill(PROB_INIT);
        self.is_match.fill(PROB_INIT);
        self.is_rep.fill(PROB_INIT);
        self.is_rep_g0.fill(PROB_INIT);
        self.is_rep_g1.fill(PROB_INIT);
        self.is_rep_g2.fill(PROB_INIT);
        self.is_rep0_long.fill(PROB_INIT);
        for p in self.pos_slot.iter_mut() {
            p.fill(PROB_INIT);
        }
        self.pos.fill(PROB_INIT);
        self.align.fill(PROB_INIT);
        self.len.init();
        self.rep_len.init();
    }
}

/// The uncompressed size given in the header of `input`, if it gives one.
pub fn declared_size(input: &[u8]) -> Option<u64> {
    let h: [u8; 8] = input.get(5..13)?.try_into().ok()?;
    let n = u64::from_le_bytes(h);
    (n != u64::MAX).then_some(n)
}

/// Decode the ".lzma" stream `input` into `out`, using `probs` as the
/// model. Returns the decoded length.
pub fn decode(input: &[u8], out: &mut [u8], probs: &mut Probs) -> Result<usize, Error> {
    if input.len() < 13 {
        return Err(Error::Header);
    }
    let mut d = input[0] as u32;
    if d >= 9 * 5 * 5 {
        return Err(Error::Properties);
    }
    let lc = d % 9;
    d /= 9;
    let lp = d % 5;
    let pb = d / 5;
    if lc + lp > MAX_LC_LP || pb as usize > POS_BITS_MAX {
        return Err(Error::Properties);
    }
    let unpack_size = declared_size(input);
    if let Some(n) = unpack_size {
        if n > out.len() as u64 {
            return Err(Error::OutputFull);
        }
    }

    probs.init();
    let mut rc = RangeDecoder::new(&input[13..]);
    if rc.corrupted {
        return Err(Error::Corrupt);
    }

    let pb_mask = (1usize << pb) - 1;
    let lp_mask = (1usize << lp) - 1;
    let mut pos = 0usize;
    let mut state = 0usize;
    let (mut rep0, mut rep1, mut rep2, mut rep3) = (0usize, 0usize, 0usize, 0usize);
    let remaining = |pos: usize| unpack_size.map(|n| n as usize - pos);

    loop {
        if remaining(pos) == Some(0) && rc.finished_ok() {
            // The size is known and reached; an end marker may follow.
            break;
        }
        let pos_state = pos & pb_mask;

        if rc.bit(&mut probs.is_match[(state << POS_BITS_MAX) + pos_state]) == 0 {
            // Literal.
            if remaining(pos) == Some(0) || pos >= out.len() {
                return Err(Error::Corrupt);
            }
            let prev = if pos > 0 { out[pos - 1] as usize } else { 0 };
            let base = 0x300 * (((pos & lp_mask) << lc) + (prev >> (8 - lc)));
            let lit = &mut probs.literal[base..base + 0x300];
            let mut symbol = 1usize;
            if state >= 7 {
                let mut match_byte = out[pos - rep0 - 1] as usize;
                loop {
                    let match_bit = (match_byte >> 7) & 1;
                    match_byte <<= 1;
                    let bit = rc.bit(&mut lit[((1 + match_bit) << 8) + symbol]) as usize;
                    symbol = (symbol << 1) | bit;
                    if match_bit != bit || symbol >= 0x100 {
                        break;
                    }
                }
            }
            while symbol < 0x100 {
                symbol = (symbol << 1) | rc.bit(&mut lit[symbol]) as usize;
            }
            out[pos] = (symbol - 0x100) as u8;
            pos += 1;
            state = if state < 4 { 0 } else if state < 10 { state - 3 } else { state - 6 };
            continue;
        }

        let len;
        if rc.bit(&mut probs.is_rep[state]) != 0 {
            if remaining(pos) == Some(0) || pos == 0 {
                return Err(Error::Corrupt);
            }
            if rc.bit(&mut probs.is_rep_g0[state]) == 0 {
                if rc.bit(&mut probs.is_rep0_long[(state << POS_BITS_MAX) + pos_state]) == 0 {
                    // Short rep: one byte from rep0.
                    if pos >= out.len() {
                        return Err(Error::OutputFull);
                    }
                    if rep0 >= pos {
                        return Err(Error::Corrupt);
                    }
                    state = if state < 7 { 9 } else { 11 };
                    out[pos] = out[pos - rep0 - 1];
                    pos += 1;
                    continue;
                }
            } else {
                let dist;
                if rc.bit(&mut probs.is_rep_g1[state]) == 0 {
                    dist = rep1;
                } else {
                    if rc.bit(&mut probs.is_rep_g2[state]) == 0 {
                        dist = rep2;
                    } else {
                        dist = rep3;
                        rep3 = rep2;
                    }
                    rep2 = rep1;
                }
                rep1 = rep0;
                rep0 = dist;
            }
            len = probs.rep_len.decode(&mut rc, pos_state);
            state = if state < 7 { 8 } else { 11 };
        } else {
            rep3 = rep2;
            rep2 = rep1;
            rep1 = rep0;
            len = probs.len.decode(&mut rc, pos_state);
            state = if state < 7 { 7 } else { 10 };
            // Distance.
            let len_state = len.min(NUM_LEN_TO_POS_STATES - 1);
            let pos_slot = rc.tree(&mut probs.pos_slot[len_state], 6);
            let dist = if pos_slot < START_POS_MODEL_INDEX {
                pos_slot
            } else {
                let num_direct = (pos_slot >> 1) - 1;
                let mut dist = (2 | (pos_slot & 1)) << num_direct;
                if pos_slot < END_POS_MODEL_INDEX {
                    let base = (dist - pos_slot) as usize;
                    dist += rc.tree_reverse(&mut probs.pos[base..], num_direct);
                } else {
                    dist = dist.wrapping_add(rc.direct_bits(num_direct - NUM_ALIGN_BITS) << NUM_ALIGN_BITS);
                    dist = dist.wrapping_add(rc.tree_reverse(&mut probs.align, NUM_ALIGN_BITS));
                }
                dist
            };
            if dist == 0xFFFF_FFFF {
                // End marker.
                if rc.finished_ok() && !rc.corrupted {
                    break;
                }
                return Err(Error::Corrupt);
            }
            rep0 = dist as usize;
            if remaining(pos) == Some(0) || rep0 >= pos {
                return Err(Error::Corrupt);
            }
        }

        let len = len + MATCH_MIN_LEN;
        if remaining(pos).is_some_and(|r| r < len) || pos + len > out.len() {
            return Err(Error::Corrupt);
        }
        if rep0 >= pos {
            return Err(Error::Corrupt);
        }
        // Byte by byte: the source may overlap what is being written.
        for _ in 0..len {
            out[pos] = out[pos - rep0 - 1];
            pos += 1;
        }
    }
    if rc.corrupted {
        return Err(Error::Corrupt);
    }
    Ok(pos)
}
