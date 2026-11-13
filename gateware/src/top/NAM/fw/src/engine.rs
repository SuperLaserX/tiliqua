//! The NAM peripheral's registers (nam/peripheral.py): the engine's tables, its control
//! and what it reports.

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
    /// entries have), then the commit with the table and index.
    fn table(&mut self, table: u32, index: u32, words: &[u32]) {
        for word in words {
            self.regs.twrite().write(|w| unsafe { w.bits(*word) });
        }
        self.regs.tcommit().write(|w| unsafe { w.bits((table | index << 3) as u16) });
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
        Status { busy: s & 1 != 0, late: s & 2 != 0, clocks: (s >> 2) as u16 }
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
