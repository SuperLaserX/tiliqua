//! The NAM peripheral's registers (nam/peripheral.py): the engine's tables, its control
//! and what it reports.

use nam_cpu::program::{Built, Tables, AUX_GAIN_IN, AUX_GAIN_OUT, COLUMNS};

use crate::pac;

pub const TAB_WMEM: u32 = 0;
pub const TAB_AUX: u32 = 1;
pub const TAB_PROG: u32 = 2;
pub const TAB_RING: u32 = 3;
pub const TAB_POS: u32 = 4;

#[derive(Clone, Copy, Default, PartialEq, Eq, Debug)]
pub struct Status {
    pub busy: bool,
    pub late: bool,
    /// The last sample's computation, in engine clocks (120 MHz).
    pub clocks: u16,
    /// A tone stack swap asked for and not yet made (it is, at the next sample).
    pub tone_pending: bool,
}

#[derive(Clone, Copy, Default, PartialEq, Eq, Debug)]
pub struct Stats {
    /// The longest sample since the last read, in engine clocks.
    pub clocks_max: u16,
    /// Samples that arrived while the engine was still busy, since the last read.
    pub overruns: u8,
    /// Samples computed (wraps).
    pub samples: u8,
}

pub struct Engine {
    regs: pac::NAM,
    ctrl: u32,
}

impl Engine {
    pub fn new(regs: pac::NAM) -> Self {
        Self { regs, ctrl: 0 }
    }

    /// One entry of a table: its words, least significant first (as many as the table's
    /// entries have), then the commit with the table and index. A critical section: the gate's
    /// interrupt writes an entry through the same two registers (`write_aux_from_isr`).
    fn table(&mut self, table: u32, index: u32, words: &[u32]) {
        critical_section::with(|_| {
            for word in words {
                self.regs.twrite().write(|w| unsafe { w.bits(*word) });
            }
            self.regs.tcommit().write(|w| unsafe { w.bits((table | index << 3) as u16) });
        });
    }

    /// A row of the weight memory: eight 18-bit lanes.
    pub fn write_weights(&mut self, row: u32, lanes: &[i32; 8]) {
        let mut words = [0u32; 5];
        for (i, lane) in lanes.iter().enumerate() {
            let v = (*lane as u32) & 0x3FFFF;
            let bit = 18 * i;
            words[bit / 32] |= v << (bit % 32);
            if bit % 32 > 14 {
                words[bit / 32 + 1] |= v >> (32 - bit % 32);
            }
        }
        self.table(TAB_WMEM, row, &words);
    }

    pub fn write_aux(&mut self, index: u32, value: i32) {
        self.table(TAB_AUX, index, &[(value as u32) & 0x3FFFF]);
    }

    /// A 36-bit program word.
    pub fn write_program(&mut self, index: u32, word: u64) {
        self.table(TAB_PROG, index, &[word as u32, (word >> 32) as u32 & 0xF]);
    }

    /// A 46-bit ring entry (it also sets the ring's position).
    pub fn write_ring(&mut self, index: u32, entry: u64) {
        self.table(TAB_RING, index, &[entry as u32, (entry >> 32) as u32]);
    }

    /// A stream's 18-bit PSRAM position, at its entry in the position table.
    pub fn write_pos(&mut self, index: u32, pos: u32) {
        self.table(TAB_POS, index, &[pos]);
    }

    /// The program's shape: rings, segments, how late a transfer may be, and the streams'
    /// geometry as powers of two (32-bit words per frame, per burst, per PSRAM ring).
    #[allow(clippy::too_many_arguments)]
    pub fn config(&mut self, n_rings: u32, n_segments: u32, late_after: u32, wpf_log2: u32, burst_log2: u32,
                  ring_log2: u32) {
        let word = n_rings | n_segments << 6 | late_after << 15 | wpf_log2 << 19 | burst_log2 << 21
            | ring_log2 << 24;
        self.regs.config().write(|w| unsafe { w.bits(word) });
    }

    /// The program's shape, as the build says.
    pub fn configure(&mut self, b: &Built) {
        self.config(b.n_rings, b.n_segments, b.late_after, b.wpf_log2, b.burst_log2, b.ring_log2);
    }

    /// The input and output gain words, while running: one word each, so a sample sees the
    /// old or the new one, never half of either.
    pub fn set_gains(&mut self, gain_in: i32, gain_out: i32) {
        self.write_aux(AUX_GAIN_IN, gain_in);
        self.write_aux(AUX_GAIN_OUT, gain_out);
    }

    /// The tone stack's four sections (bass, middle, treble, DC blocker; `nam_cpu::tone_tables`),
    /// written into the bank not playing and swapped in at the next sample. A swap still pending
    /// is waited for first (a sample at most), so a bank about to play is never written.
    pub fn write_tone(&mut self, sections: &[[i32; 5]; 4]) {
        for _ in 0..100_000u32 {
            if !self.status().tone_pending {
                break;
            }
        }
        for (k, section) in sections.iter().enumerate() {
            for (j, value) in section.iter().enumerate() {
                let word = (*value as u32 & ((1 << 27) - 1)) | ((k * 5 + j) as u32) << 27;
                self.regs.tone().write(|w| unsafe { w.bits(word) });
            }
        }
        self.regs.tswap().write(|w| unsafe { w.bits(1) });
    }

    fn write_ctrl(&mut self, pulses: u32) {
        self.regs.ctrl().write(|w| unsafe { w.bits((self.ctrl | pulses) as u8) });
    }

    pub fn enable(&mut self, on: bool) {
        self.ctrl = (self.ctrl & !1) | on as u32;
        self.write_ctrl(0);
    }

    pub fn bypass(&mut self, on: bool) {
        self.ctrl = (self.ctrl & !2) | (on as u32) << 1;
        self.write_ctrl(0);
    }

    /// Zeroes the block-RAM history and the write buffer; waits until done.
    pub fn clear(&mut self) {
        self.write_ctrl(4);
        self.wait_idle();
    }

    /// Fetches every read stream's first bursts; waits until done.
    pub fn prefill(&mut self) {
        self.write_ctrl(8);
        self.wait_idle();
    }

    fn wait_idle(&mut self) {
        for _ in 0..1_000_000u32 {
            if !self.status().busy {
                return;
            }
        }
    }

    pub fn status(&self) -> Status {
        let s = self.regs.status().read().bits();
        Status { busy: s & 1 != 0, late: s & 2 != 0, clocks: (s >> 2) as u16, tone_pending: s & (1 << 18) != 0 }
    }

    /// Reading clears the longest-sample figure and the overrun count.
    pub fn stats(&mut self) -> Stats {
        let s = self.regs.stats().read().bits();
        Stats { clocks_max: s as u16, overruns: (s >> 16) as u8, samples: (s >> 24) as u8 }
    }

    /// Input and output peaks since the last read, as 16-bit sample magnitudes.
    pub fn meters(&mut self) -> (u16, u16) {
        let m = self.regs.meters().read().bits();
        (m as u16, (m >> 16) as u16)
    }
}

/// The program builder writes straight into the engine.
impl Tables for Engine {
    fn weights(&mut self, row: u32, lanes: &[i32; COLUMNS]) {
        self.write_weights(row, lanes);
    }
    fn aux(&mut self, index: u32, value: i32) {
        self.write_aux(index, value);
    }
    fn program(&mut self, index: u32, word: u64) {
        self.write_program(index, word);
    }
    fn ring(&mut self, index: u32, entry: u64) {
        self.write_ring(index, entry);
    }
    fn pos(&mut self, index: u32, pos: u32) {
        self.write_pos(index, pos);
    }
}

/// An aux word written from the interrupt (the gate's output gain). The main loop's entries are
/// critical sections, so this never lands between the words of one.
pub fn write_aux_from_isr(index: u32, value: i32) {
    let regs = unsafe { pac::NAM::steal() };
    regs.twrite().write(|w| unsafe { w.bits((value as u32) & 0x3FFFF) });
    regs.tcommit().write(|w| unsafe { w.bits((TAB_AUX | index << 3) as u16) });
}

/// The input and output peaks since the last read, read (and so cleared) by the interrupt, which
/// is the only reader: the gate needs every one.
pub fn meters_from_isr() -> (u16, u16) {
    let m = unsafe { pac::NAM::steal() }.meters().read().bits();
    (m as u16, (m >> 16) as u16)
}
