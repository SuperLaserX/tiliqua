//! The bfr peripheral (`bfr/peripheral.py`): loading a program, table
//! writes, statistics. Implements `bfr_cpu::control::Hw` for the parameter
//! logic.

use bfr_cpu::control::{Control, Hw};
use bfr_cpu::encode;
use bfr_cpu::types::*;

use crate::pac;
use crate::pac::constants::*;

/// Spin limit while waiting for a table write to be applied (the core
/// applies it between frames, within a frame time).
const SPIN_LIMIT: u32 = 100_000;

#[derive(Clone, Copy, Default)]
pub struct Stats {
    pub frames: u32,
    pub frame_clocks: u16,
    pub frame_clocks_max: u16,
    pub overruns: u32,
    pub bursts: u32,
    pub max_lag: u8,
    pub scan_lag: u8,
    pub resyncs: u16,
    pub late: bool,
    pub write_timeouts: u32,
}

pub struct Engine {
    regs: pac::BFR,
    pub write_timeouts: u32,
}

impl Engine {
    pub fn new(regs: pac::BFR) -> Self {
        Self { regs, write_timeouts: 0 }
    }

    /// Load `ctl`'s program with parameter `values`: stop and mute, write all
    /// its tables, clear the delay memory (PSRAM, stream buffers, block-RAM
    /// space), and run it muted. The crossfades snap back to side A in the
    /// first frame; `finish_load`, once the streams have warmed up
    /// (`warmup`), sets their rates and brings the outputs back. False if the
    /// clear didn't finish (the PSRAM didn't answer).
    pub fn load(&mut self, ctl: &mut Control, values: &[f64]) -> bool {
        let p = ctl.prog;
        self.set_output(false, true);
        self.regs.config().write(|w| unsafe {
            w.n_instr().bits(p.instrs.len() as u16);
            w.n_streams().bits(p.streams.len() as u16)
        });
        self.regs.psram_mask().write(|w| unsafe { w.mask().bits(p.mem_words[0] - 1) });
        self.regs.ebr_mask().write(|w| unsafe { w.mask().bits(p.mem_words[1] - 1) });
        self.regs.ring_base().write(|w| unsafe { w.base().bits(BFR_RING_BASE_WORD) });
        for g in 0..N_FADE {
            self.fade_rate(g, FADE_ONE);
            self.fade_target(g, 0);
        }
        ctl.load(self, values);
        self.regs.clear().write(|w| w.clear().bit(true));
        // A 512 KB ring clears in about 3 ms; give it far longer.
        let mut cleared = false;
        for _ in 0..20_000_000u32 {
            if !self.regs.status().read().clearing().bit() {
                cleared = true;
                break;
            }
        }
        self.set_output(true, true);
        cleared
    }

    /// Frames from `load` until the outputs come back: the longest stream
    /// warm-up, and at least 10 ms.
    pub fn warmup(prog: &Program) -> u32 {
        prog.warmup.iter().copied().max().unwrap_or(0).max(480)
    }

    /// After `load`'s warm-up: the program's crossfade rates, and the outputs.
    pub fn finish_load(&mut self, ctl: &Control, run: bool, mute: bool) {
        for g in 0..ctl.prog.fades.len() {
            self.fade_rate(g, ctl.fade_rate(g));
        }
        self.set_output(run, mute);
    }

    pub fn set_output(&mut self, run: bool, mute: bool) {
        self.regs.control().write(|w| {
            w.run().bit(run);
            w.mute().bit(mute)
        });
    }

    fn fade_rate(&mut self, g: usize, rate: u32) {
        match g {
            0 => self.regs.fade_rate0().write(|w| unsafe { w.value().bits(rate) }),
            _ => self.regs.fade_rate1().write(|w| unsafe { w.value().bits(rate) }),
        };
    }

    /// Stage `words` and write them to entry `addr` of `table`, once the
    /// previous write has been applied.
    fn table_write(&mut self, table: u8, addr: u16, words: [u32; 3]) {
        let mut n = 0;
        while self.regs.status().read().wpend().bit() {
            n += 1;
            if n == SPIN_LIMIT {
                self.write_timeouts += 1;
                break;
            }
        }
        self.regs.wdata0().write(|w| unsafe { w.data().bits(words[0]) });
        self.regs.wdata1().write(|w| unsafe { w.data().bits(words[1]) });
        self.regs.wdata2().write(|w| unsafe { w.data().bits(words[2]) });
        self.regs.wcmd().write(|w| unsafe {
            w.addr().bits(addr);
            w.table().bits(table)
        });
    }

    pub fn stats(&self) -> Stats {
        let fc = self.regs.frame_clocks().read();
        let ss = self.regs.stream_stats().read();
        Stats {
            frames: self.regs.frames().read().count().bits(),
            frame_clocks: fc.last().bits(),
            frame_clocks_max: fc.max().bits(),
            overruns: self.regs.overruns().read().count().bits(),
            bursts: self.regs.bursts().read().count().bits(),
            max_lag: ss.max_lag().bits(),
            scan_lag: ss.scan_lag().bits(),
            resyncs: ss.resyncs().bits(),
            late: self.regs.status().read().late().bit(),
            write_timeouts: self.write_timeouts,
        }
    }

    /// Rising gates on IN2 (bit 0) and IN3 (bit 1) since the last call.
    pub fn gate_edges(&mut self) -> u8 {
        self.regs.gate_edges().read().edges().bits()
    }

    /// The input followers' peaks since the last read, which clears them:
    /// level, bass, treble (`|x| / 32`, 1023 at full scale).
    pub fn follow(&mut self) -> [u16; 3] {
        let r = self.regs.follow().read();
        [r.level().bits(), r.bass().bits(), r.treble().bits()]
    }

    /// The gate threshold, in CODEC counts (`EurorackPmod::counts_per_v`).
    pub fn set_gate_level(&mut self, counts: i32) {
        let c = counts.clamp(1, i16::MAX as i32) as u16;
        self.regs.gate_level().write(|w| unsafe { w.high().bits(c) });
    }

    pub fn clear_max(&mut self) {
        self.regs.clear_max().write(|w| w.clear().bit(true));
    }
}

impl Hw for Engine {
    fn instr(&mut self, i: usize, word: u64) {
        self.table_write(BFR_T_PROG, i as u16, [word as u32, (word >> 32) as u32, 0]);
    }

    fn reg(&mut self, r: usize, bits: u32) {
        self.table_write(BFR_T_REG, r as u16, [bits, 0, 0]);
    }

    fn wtap(&mut self, i: usize, entry: u64) {
        self.table_write(BFR_T_WTAP, i as u16, encode::words(entry));
    }

    fn lfo_phase(&mut self, k: usize, phase: u32) {
        self.table_write(BFR_T_LFO, k as u16, [phase, 0, 0]);
    }

    fn coef(&mut self, i: usize, bits: u32) {
        self.table_write(BFR_T_COEF, i as u16, [bits, 0, 0]);
    }

    fn rtap(&mut self, i: usize, entry: [u32; 3]) {
        self.table_write(BFR_T_RTAP, i as u16, entry);
    }

    fn stab(&mut self, s: usize, entry: u64) {
        self.table_write(BFR_T_STAB, s as u16, encode::words(entry));
    }

    fn lfo_inc(&mut self, k: usize, inc: u32) {
        match k {
            0 => self.regs.lfo_inc0().write(|w| unsafe { w.data().bits(inc) }),
            1 => self.regs.lfo_inc1().write(|w| unsafe { w.data().bits(inc) }),
            2 => self.regs.lfo_inc2().write(|w| unsafe { w.data().bits(inc) }),
            _ => self.regs.lfo_inc3().write(|w| unsafe { w.data().bits(inc) }),
        };
    }

    fn fade_target(&mut self, g: usize, target: u32) {
        match g {
            0 => self.regs.fade_target0().write(|w| unsafe { w.value().bits(target) }),
            _ => self.regs.fade_target1().write(|w| unsafe { w.value().bits(target) }),
        };
    }

    fn frames(&mut self) -> u32 {
        self.regs.frames().read().count().bits()
    }

    fn fade_pos(&mut self, g: usize) -> u32 {
        match g {
            0 => self.regs.fade_pos0().read().pos().bits(),
            _ => self.regs.fade_pos1().read().pos().bits(),
        }
    }
}

