//! The audio path's registers (fairwave/peripheral.py), and getting tables to it past the
//! CPU's data cache.

use fairwave_cpu::modulation::{N_DESTS, N_ENVELOPES, N_LFOS, N_SLOTS};
use fairwave_cpu::patch::{Words, N_LAYERS};

use crate::pac;

/// The data cache's line. The CPU variant's 4 KB is 64 sets of these (fairwave/cpu.py).
const CACHE_LINE: usize = 64;

/// Writes `bytes` from `addr` out of the data cache to PSRAM. The cache is write-back,
/// and the engine reads PSRAM directly: without this it reads whatever was there before.
pub fn clean_dcache(addr: usize, bytes: usize) {
    let start = addr & !(CACHE_LINE - 1);
    let mut at = start;
    while at < addr + bytes {
        // cbo.clean (at), from Zicbom (`--with-rvZcbm` in vexiiriscv.py)
        unsafe { core::arch::asm!(".insn i 0x0F, 2, x0, {0}, 1", in(reg) at) };
        at += CACHE_LINE;
    }
    unsafe { core::arch::asm!("fence") };
}

pub struct Stats {
    /// The longest sample's computation since the last read, in clocks.
    pub clocks_max: u16,
    /// Samples computed (wraps).
    pub samples: u16,
}

/// What the modulation is doing, for the screens: in DAC counts (4 to the mV).
#[derive(Clone, Copy, Default, PartialEq, Eq, Debug)]
pub struct Monitor {
    pub envelopes: [i16; N_ENVELOPES],
    pub lfos: [i16; N_LFOS],
    pub stages: [u8; N_ENVELOPES],
    pub gates: u8,
    /// How far through its stage each envelope is, and through its cycle each LFO: 0 to 255.
    pub progress: [u8; N_ENVELOPES],
    pub lfo_phase: [u8; N_LFOS],
    /// Where each oscillator is reading, modulation and all: position in Q4.12 of the table, past
    /// its ends if the modulation takes it there, and frames a cycle in Q11.4.
    pub scan: [(i16, i16); N_LAYERS],
}

// The parameter port's map (`model/modulation.py`).
const ENV_AT: u8 = 0x00;
const LFO_AT: u8 = 0x10;
const SLOT_AT: u8 = 0x20;
const BASE_AT: u8 = 0x30;

pub struct Engine {
    regs: pac::WAVESCAN,
    /// What the registers hold, so only changes are written.
    shown: Option<Words>,
    routing: Option<u32>,
}

impl Engine {
    pub fn new(regs: pac::WAVESCAN) -> Self {
        Self { regs, shown: None, routing: None }
    }

    fn param(&mut self, addr: u8, value: u32) {
        self.regs.param_addr().write(|w| unsafe { w.bits(addr) });
        self.regs.param_data().write(|w| unsafe { w.bits(value) });
    }

    /// Brings the gateware up to `new`. The table goes first: until the rest arrive, the old
    /// position is scaled by the engine to the new table anyway.
    pub fn apply(&mut self, new: &Words) {
        let old = self.shown;
        macro_rules! changed {
            ($($field:tt)+) => { old.map_or(true, |o| o.$($field)+ != new.$($field)+) };
        }
        if changed!(table[0]) {
            self.regs.l0_table().write(|w| unsafe { w.bits(new.table[0]) });
        }
        if changed!(table[1]) {
            self.regs.l1_table().write(|w| unsafe { w.bits(new.table[1]) });
        }
        if changed!(ctrl[0]) {
            self.regs.l0_ctrl().write(|w| unsafe { w.bits(new.ctrl[0] as u8) });
        }
        if changed!(ctrl[1]) {
            self.regs.l1_ctrl().write(|w| unsafe { w.bits(new.ctrl[1] as u8) });
        }
        for e in 0..N_ENVELOPES {
            for w in 0..8 {
                if changed!(envelopes[e][w]) {
                    self.param(ENV_AT + (e * 8 + w) as u8, new.envelopes[e][w]);
                }
            }
        }
        for k in 0..N_LFOS {
            for w in 0..3 {
                if changed!(lfos[k][w]) {
                    self.param(LFO_AT + (k * 4 + w) as u8, new.lfos[k][w]);
                }
            }
        }
        for i in 0..N_SLOTS {
            if changed!(slots[i]) {
                self.param(SLOT_AT + i as u8, new.slots[i]);
            }
        }
        for d in 0..N_DESTS {
            if changed!(base[d]) {
                self.param(BASE_AT + d as u8, new.base[d]);
            }
        }
        self.shown = Some(*new);
    }

    /// The outputs' selections and VCAs, and the CV jacks' switches (`jacks`' low two bits).
    pub fn route(&mut self, routing: u32, jacks: u8) {
        let word = routing | ((jacks as u32) & 3) << 20;
        if self.routing != Some(word) {
            self.regs.routing().write(|w| unsafe { w.bits(word) });
            self.routing = Some(word);
        }
    }

    pub fn monitor(&self) -> Monitor {
        let a = self.regs.mon0().read().bits();
        let b = self.regs.mon1().read().bits();
        let c = self.regs.mon2().read().bits();
        let e = self.regs.mon3().read().bits();
        let s = [self.regs.scan0().read().bits(), self.regs.scan1().read().bits()];
        Monitor {
            envelopes: [a as u16 as i16, (a >> 16) as u16 as i16],
            lfos: [b as u16 as i16, (b >> 16) as u16 as i16, c as u16 as i16],
            stages: [((c >> 16) & 7) as u8, ((c >> 19) & 7) as u8],
            gates: ((c >> 22) & 3) as u8,
            progress: [e as u8, (e >> 8) as u8],
            lfo_phase: [(e >> 16) as u8, (e >> 24) as u8, (c >> 24) as u8],
            scan: s.map(|w| (w as u16 as i16, (w >> 16) as u16 as i16)),
        }
    }

    /// Reading clears the longest-sample figure.
    pub fn stats(&mut self) -> Stats {
        let s = self.regs.stats().read();
        Stats { clocks_max: s.clocks_max().bits(), samples: s.samples().bits() }
    }
}
