//! The H3000 DSP board in software: three TMS32010s on the shared bus, for
//! running the 6809 firmware closed-loop on a PC (`h3000-host`, `dsp on`).
//!
//! A port of `model/board.py` and `model/tms32010.py` (the golden reference
//! the gateware is checked against); see those for the port map. The board
//! advances one 104-instruction-cycle frame per audio sample.

use std::collections::VecDeque;

use crate::machine::PARAM_FIRQ_ACK;

pub const FRAME: u32 = 104;
pub const BIO_LOW: u32 = 52;
pub const HOST_SLOT: u32 = 58;
pub const FSYN_UNITY: u16 = 0xCC0;
/// Host latch entries are presented until every DSP read PA5, or this many
/// frames.
const PARAM_TIMEOUT: u32 = 8;
/// Cores start this many instruction cycles into the first frame.
const START_DELAY: u64 = 3;

// -- TMS32010 ------------------------------------------------------------------

pub struct Tms {
    pub pmem: Vec<u16>,
    pub ram: [u16; 256],
    pub pc: u16,
    pub acc: u32,
    pub p: u32,
    pub t: u16,
    pub ar: [u16; 2],
    pub arp: usize,
    pub dp: u16,
    pub ov: bool,
    pub ovm: bool,
    pub intm: bool,
    stack: [u16; 4],
    /// Cycle at which the next instruction starts.
    pub next: u64,
    pub bad_op: Option<(u16, u16)>,
}

/// The board as seen by one core.
pub trait Io {
    fn read(&mut self, dsp: usize, port: u8, t: u64) -> u16;
    fn write(&mut self, dsp: usize, port: u8, v: u16, t: u64);
    /// BIO pin level (false = low).
    fn bio(&self, t: u64) -> bool;
}

fn s16(v: u16) -> i64 {
    v as i16 as i64
}

fn s32(v: u32) -> i64 {
    v as i32 as i64
}

impl Tms {
    pub fn new() -> Self {
        let mut t = Tms {
            pmem: vec![0x7F80; 4096],
            ram: [0; 256],
            pc: 0,
            acc: 0,
            p: 0,
            t: 0,
            ar: [0; 2],
            arp: 0,
            dp: 0,
            ov: false,
            ovm: false,
            intm: true,
            stack: [0; 4],
            next: 0,
            bad_op: None,
        };
        t.reset();
        t
    }

    pub fn reset(&mut self) {
        self.pc = 0;
        self.acc = 0;
        self.p = 0;
        self.t = 0;
        self.ar = [0; 2];
        self.arp = 0;
        self.dp = 0;
        self.ov = false;
        self.ovm = false;
        self.intm = true;
        self.stack = [0; 4];
        // Data RAM is cleared in reset, as the gateware does (KEEP_RAM=1:
        // keep it, as a real TMS32010 does).
        if std::env::var("KEEP_RAM").as_deref() != Ok("1") {
            self.ram = [0; 256];
        }
    }

    /// Program RAM is 2K words, mirrored at 0x000 and 0x800.
    pub fn pstore(&mut self, addr: u16, w: u16) {
        self.pmem[(addr & 0x7FF) as usize] = w;
        self.pmem[((addr & 0x7FF) | 0x800) as usize] = w;
    }

    fn sat(&mut self, r: i64) -> u32 {
        if r > 0x7FFF_FFFF || r < -0x8000_0000 {
            self.ov = true;
            if self.ovm {
                return if r > 0 { 0x7FFF_FFFF } else { 0x8000_0000 };
            }
        }
        r as u32
    }

    fn addr(&self, lo: u16) -> usize {
        if lo & 0x80 != 0 {
            (self.ar[self.arp] & 0xFF) as usize
        } else {
            ((self.dp << 7) | (lo & 0x7F)) as usize
        }
    }

    fn post(&mut self, lo: u16) {
        if lo & 0x80 == 0 {
            return;
        }
        let a = self.ar[self.arp];
        let a = if lo & 0x20 != 0 {
            (a & !0x1FF) | (a.wrapping_add(1) & 0x1FF)
        } else if lo & 0x10 != 0 {
            (a & !0x1FF) | (a.wrapping_sub(1) & 0x1FF)
        } else {
            a
        };
        self.ar[self.arp] = a;
        if lo & 0x08 == 0 {
            self.arp = (lo & 1) as usize;
        }
    }

    fn push(&mut self, v: u16) {
        self.stack = [v & 0xFFF, self.stack[0], self.stack[1], self.stack[2]];
    }

    fn pop(&mut self) -> u16 {
        let v = self.stack[0];
        self.stack = [self.stack[1], self.stack[2], self.stack[3], self.stack[3]];
        v
    }

    fn mul(&mut self, a: u16, b: i64) {
        self.p = (s16(a) * b) as u32;
    }

    /// Execute one instruction starting at cycle `self.next`.
    pub fn step<B: Io>(&mut self, idx: usize, bus: &mut B) {
        let now = self.next;
        let pc = self.pc;
        let w = self.pmem[pc as usize];
        let hi = w >> 8;
        let lo = w & 0xFF;
        let mut npc = (pc + 1) & 0xFFF;
        let mut cyc = 1;
        let acc = s32(self.acc);
        match w >> 12 {
            0x0 => {
                let a = self.addr(lo);
                self.acc = self.sat(acc + (s16(self.ram[a]) << (hi & 0xF)));
                self.post(lo);
            }
            0x1 => {
                let a = self.addr(lo);
                self.acc = self.sat(acc - (s16(self.ram[a]) << (hi & 0xF)));
                self.post(lo);
            }
            0x2 => {
                let a = self.addr(lo);
                self.acc = (s16(self.ram[a]) << (hi & 0xF)) as u32;
                self.post(lo);
            }
            0x3 => {
                let a = self.addr(lo);
                if hi & 0xFE == 0x38 {
                    let v = self.ram[a];
                    self.post(lo);
                    self.ar[(hi & 1) as usize] = v;
                } else if hi & 0xFE == 0x30 {
                    self.ram[a] = self.ar[(hi & 1) as usize];
                    self.post(lo);
                } else {
                    self.bad_op = Some((w, pc));
                }
            }
            0x4 => {
                let port = (hi & 7) as u8;
                let a = self.addr(lo);
                if hi & 0x08 != 0 {
                    bus.write(idx, port, self.ram[a], now);
                } else {
                    self.ram[a] = bus.read(idx, port, now);
                }
                self.post(lo);
                cyc = 2;
            }
            0x5 => {
                let a = self.addr(lo);
                if hi & 0x08 != 0 {
                    self.ram[a] = ((self.acc << (hi & 7)) >> 16) as u16;
                } else {
                    self.ram[a] = self.acc as u16;
                }
                self.post(lo);
            }
            0x6 | 0x7 => self.exec67(w, hi, lo, &mut npc, &mut cyc, acc, idx, bus),
            _ if w >> 13 == 0b100 => {
                let mut k = (w & 0x1FFF) as i64;
                if k & 0x1000 != 0 {
                    k -= 0x2000;
                }
                self.mul(self.t, k);
            }
            _ if w & 0xF0FF == 0xF000 => {
                let tgt = self.pmem[npc as usize] & 0xFFF;
                let npc2 = (npc + 1) & 0xFFF;
                cyc = 2;
                let take = match hi {
                    0xF4 => {
                        let a = self.ar[self.arp];
                        self.ar[self.arp] = (a & !0x1FF) | (a.wrapping_sub(1) & 0x1FF);
                        a & 0x1FF != 0
                    }
                    0xF5 => {
                        let o = self.ov;
                        self.ov = false;
                        o
                    }
                    0xF6 => !bus.bio(now),
                    0xF8 => {
                        self.push(npc2);
                        true
                    }
                    0xF9 => true,
                    0xFA => acc < 0,
                    0xFB => acc <= 0,
                    0xFC => acc > 0,
                    0xFD => acc >= 0,
                    0xFE => acc != 0,
                    0xFF => acc == 0,
                    _ => {
                        self.bad_op = Some((w, pc));
                        false
                    }
                };
                npc = if take { tgt } else { npc2 };
            }
            _ => self.bad_op = Some((w, pc)),
        }
        self.pc = npc;
        self.next += cyc;
    }

    #[allow(clippy::too_many_arguments)]
    fn exec67<B: Io>(&mut self, w: u16, hi: u16, lo: u16, npc: &mut u16, cyc: &mut u64, acc: i64, idx: usize, _bus: &mut B) {
        match hi {
            0x60 => {
                let a = self.addr(lo);
                self.acc = self.sat(acc + (s16(self.ram[a]) << 16));
                self.post(lo);
            }
            0x61 => {
                let a = self.addr(lo);
                self.acc = self.sat(acc + self.ram[a] as i64);
                self.post(lo);
            }
            0x62 => {
                let a = self.addr(lo);
                self.acc = self.sat(acc - (s16(self.ram[a]) << 16));
                self.post(lo);
            }
            0x63 => {
                let a = self.addr(lo);
                self.acc = self.sat(acc - self.ram[a] as i64);
                self.post(lo);
            }
            0x64 => {
                let a = self.addr(lo);
                let diff = self.acc.wrapping_sub(((s16(self.ram[a]) << 15) as i64) as u32);
                self.acc = if diff & 0x8000_0000 == 0 { (diff << 1).wrapping_add(1) } else { self.acc << 1 };
                self.post(lo);
            }
            0x65 => {
                let a = self.addr(lo);
                self.acc = (self.ram[a] as u32) << 16;
                self.post(lo);
            }
            0x66 => {
                let a = self.addr(lo);
                self.acc = self.ram[a] as u32;
                self.post(lo);
            }
            0x67 => {
                let a = self.addr(lo);
                self.ram[a] = self.pmem[(self.acc & 0xFFF) as usize];
                self.post(lo);
                *cyc = 3;
            }
            0x68 => self.post(lo),
            0x69 => {
                let a = self.addr(lo);
                self.ram[(a & 0x80) | ((a + 1) & 0x7F)] = self.ram[a];
                self.post(lo);
            }
            0x6A => {
                let a = self.addr(lo);
                self.t = self.ram[a];
                self.post(lo);
            }
            0x6B => {
                let a = self.addr(lo);
                self.t = self.ram[a];
                self.acc = self.sat(acc + s32(self.p));
                self.ram[(a & 0x80) | ((a + 1) & 0x7F)] = self.ram[a];
                self.post(lo);
            }
            0x6C => {
                let a = self.addr(lo);
                self.t = self.ram[a];
                self.acc = self.sat(acc + s32(self.p));
                self.post(lo);
            }
            0x6D => {
                let a = self.addr(lo);
                let v = s16(self.ram[a]);
                self.mul(self.t, v);
                self.post(lo);
            }
            0x6E => self.dp = lo & 1,
            0x6F => {
                let a = self.addr(lo);
                self.dp = self.ram[a] & 1;
                self.post(lo);
            }
            0x70 | 0x71 => self.ar[(hi & 1) as usize] = lo,
            0x78 => {
                let a = self.addr(lo);
                self.acc ^= self.ram[a] as u32;
                self.post(lo);
            }
            0x79 => {
                let a = self.addr(lo);
                self.acc &= self.ram[a] as u32;
                self.post(lo);
            }
            0x7A => {
                let a = self.addr(lo);
                self.acc |= self.ram[a] as u32;
                self.post(lo);
            }
            0x7B => {
                let a = self.addr(lo);
                let v = self.ram[a];
                self.post(lo);
                self.ov = v & 0x8000 != 0;
                self.ovm = v & 0x4000 != 0;
                self.dp = v & 1;
                if lo & 0x80 == 0 {
                    self.arp = ((v >> 8) & 1) as usize;
                }
            }
            0x7C => {
                let a = if lo & 0x80 != 0 { self.addr(lo) } else { (0x80 | (lo & 0x7F)) as usize };
                let v = ((self.ov as u16) << 15)
                    | ((self.ovm as u16) << 14)
                    | ((self.intm as u16) << 13)
                    | 0x1EFE
                    | ((self.arp as u16) << 8)
                    | self.dp;
                self.ram[a] = v;
                self.post(lo);
            }
            0x7D => {
                let a = self.addr(lo);
                let v = self.ram[a];
                self.pstore(self.acc as u16, v);
                self.post(lo);
                *cyc = 3;
            }
            0x7E => self.acc = lo as u32,
            0x7F => match w {
                0x7F80 => {}
                0x7F81 => self.intm = true,
                0x7F82 => self.intm = false,
                0x7F88 => {
                    if acc < 0 {
                        self.acc = self.sat(-acc);
                    }
                }
                0x7F89 => self.acc = 0,
                0x7F8A => self.ovm = false,
                0x7F8B => self.ovm = true,
                0x7F8C => {
                    self.push(*npc);
                    *npc = (self.acc & 0xFFF) as u16;
                    *cyc = 2;
                }
                0x7F8D => {
                    *npc = self.pop();
                    *cyc = 2;
                }
                0x7F8E => self.acc = self.p,
                0x7F8F => self.acc = self.sat(acc + s32(self.p)),
                0x7F90 => self.acc = self.sat(acc - s32(self.p)),
                0x7F9C => {
                    self.push(self.acc as u16);
                    *cyc = 2;
                }
                0x7F9D => {
                    self.acc = self.pop() as u32;
                    *cyc = 2;
                }
                _ => self.bad_op = Some((w, self.pc)),
            },
            _ => self.bad_op = Some((w, self.pc)),
        }
        let _ = idx;
    }
}

impl Default for Tms {
    fn default() -> Self {
        Self::new()
    }
}

// -- delay cache statistics ----------------------------------------------------

/// Model of the gateware's delay cache (h3000/cache.py: 2-way, 16-word
/// lines, write-back, write-allocate, LRU), for counting misses.
pub struct CacheStats {
    sets: usize,
    /// Per set: [(valid, dirty, tag); 2] and the way to evict next.
    ways: Vec<([(bool, bool, u16); 2], usize)>,
    pub frame_misses: u32,
    pub frame_writebacks: u32,
    pub misses: u64,
    pub writebacks: u64,
    /// Frames by number of misses in them (last bucket: that many or more).
    pub hist: [u64; 16],
    pub worst: u32,
    /// Lines whose DSP-written data has been written back to PSRAM, and
    /// read misses that had to bring such data back (true round trips).
    in_psram: Vec<bool>,
    pub round_trips: u64,
}

impl CacheStats {
    pub fn new(words: usize) -> Self {
        let sets = words / 32;
        CacheStats {
            sets,
            ways: vec![([(false, false, 0); 2], 0); sets],
            frame_misses: 0,
            frame_writebacks: 0,
            misses: 0,
            writebacks: 0,
            hist: [0; 16],
            worst: 0,
            in_psram: vec![false; 4096],
            round_trips: 0,
        }
    }

    pub fn access(&mut self, addr: u16, write: bool) {
        let line = (addr >> 4) as usize;
        let set = line % self.sets;
        let tag = (line / self.sets) as u16;
        let (ways, lru) = &mut self.ways[set];
        let way = match ways.iter().position(|w| w.0 && w.2 == tag) {
            Some(w) => w,
            None => {
                let v = if !ways[0].0 { 0 } else if !ways[1].0 { 1 } else { *lru };
                self.frame_misses += 1;
                if ways[v].0 && ways[v].1 {
                    self.frame_writebacks += 1;
                    let victim = ways[v].2 as usize * self.sets + set;
                    self.in_psram[victim] = true;
                }
                if !write && self.in_psram[line] {
                    self.round_trips += 1;
                }
                ways[v] = (true, false, tag);
                v
            }
        };
        if write {
            ways[way].1 = true;
        }
        *lru = 1 - way;
    }

    fn end_frame(&mut self) {
        self.misses += self.frame_misses as u64;
        self.writebacks += self.frame_writebacks as u64;
        self.hist[(self.frame_misses as usize).min(15)] += 1;
        self.worst = self.worst.max(self.frame_misses);
        self.frame_misses = 0;
        self.frame_writebacks = 0;
    }

    pub fn reset_stats(&mut self) {
        self.misses = 0;
        self.writebacks = 0;
        self.hist = [0; 16];
        self.worst = 0;
        self.round_trips = 0;
    }
}

// -- board ---------------------------------------------------------------------

/// Everything on the shared bus except the cores.
pub struct Bus {
    /// Global cycle count (advances only while frames run).
    t: u64,
    pos: u32,
    latch: [u16; 8],
    /// Writes in the current cycle, applied at its end.
    outs: Vec<(u8, u16)>,
    addr: u16,
    addr_next: Option<u16>,
    addr_written: bool,
    pub mem: Vec<u16>,
    adc: (u16, u16),
    host_addr: u16,
    host_data: u16,
    host_seen: [bool; 3],
    host_age: u32,
    /// PA5 / PA6 reads per DSP (diagnostics).
    pub host_reads: [[u64; 2]; 3],
    /// Status port flag writes per flag (diagnostics).
    pub flag_writes: [u32; 8],
    pub params: VecDeque<(u16, u16)>,
    /// Host bus requests: (port, data, read).
    pub bus_queue: VecDeque<(u8, u16, bool)>,
    pub bus_result: u16,
    pub bus_reads: u32,
    pub clock_mode: u8,
    fsyn_pending: [u32; 2],
    fsyn_period: [u32; 2],
    fsyn_phase: [u32; 2],
    fsyn_stat: [bool; 2],
    converter: [i16; 2],
    frame_sum: [i64; 2],
    pub flags: u8,
    /// FIRQ to the host (until acknowledged).
    pub firq: bool,
    /// FIRQ as the DSPs see it (status bit 1): cleared when the
    /// acknowledge reaches the front of the host latch queue.
    firq_req: bool,
    /// Output sample of each frame.
    pub out: (i16, i16),
    pub cache: CacheStats,
}

fn frame_average(total: i64) -> i16 {
    (((total >> 7) * 315) >> 8) as i16
}

impl Bus {
    fn status(&self) -> u16 {
        let q = self.flags as u16;
        let mut v = ((self.fsyn_stat[0] as u16) << 3) | ((self.fsyn_stat[1] as u16) << 2)
            | ((self.firq_req as u16) << 1) | (q & 1);
        v |= (q >> 2) << 4;
        v
    }

    fn read_port(&mut self, port: u8, host: bool) -> u16 {
        match port {
            0 => (if self.pos & 1 == 0 { 0x8000 } else { 0 }) | self.status(),
            4 => {
                if host {
                    return 0;
                }
                let a = self.addr;
                if !self.addr_written {
                    self.addr_next = Some(a.wrapping_add(1));
                }
                self.cache.access(a, false);
                self.mem[a as usize]
            }
            5 => self.host_addr,
            6 => self.host_data,
            7 => {
                if self.pos < BIO_LOW {
                    self.adc.0
                } else {
                    self.adc.1
                }
            }
            p => self.latch[p as usize],
        }
    }

    fn status_write(&mut self, v: u16) {
        match v >> 13 {
            0b001 => self.fsyn_pending[((v >> 12) & 1) as usize] = 4096 - (v & 0xFFF) as u32,
            0b100 => {
                let n = (v >> 10) & 7;
                self.flag_writes[n as usize] += 1;
                if v & 1 != 0 {
                    self.flags |= 1 << n;
                } else {
                    self.flags &= !(1 << n);
                }
            }
            0b110 => {
                self.firq = true;
                self.firq_req = true;
            }
            _ => {}
        }
    }

    /// End of the current instruction cycle (see model/board.py).
    fn end_of_cycle(&mut self) {
        if self.pos == HOST_SLOT {
            if let Some((port, data, read)) = self.bus_queue.pop_front() {
                if read {
                    self.bus_result = self.read_port(port, true);
                    self.bus_reads += 1;
                } else if port != 4 {
                    self.outs.push((port, data));
                }
            }
        }
        for ch in 0..2 {
            self.frame_sum[ch] += self.converter[ch] as i64;
        }
        let outs = std::mem::take(&mut self.outs);
        for &(port, v) in &outs {
            match port {
                5 => self.fsyn_stat[0] = false,
                6 => self.fsyn_stat[1] = false,
                0 => self.status_write(v),
                _ => {}
            }
        }
        let mut tick = [false; 2];
        for s in 0..2 {
            self.fsyn_phase[s] += 8;
            if self.fsyn_phase[s] >= self.fsyn_period[s] {
                tick[s] = true;
                self.fsyn_phase[s] -= self.fsyn_period[s];
                self.fsyn_period[s] = self.fsyn_pending[s];
            }
        }
        let frame_tick = self.pos == FRAME - 1;
        let clocks = match self.clock_mode {
            1 => [tick[1], tick[1]],
            2 | 3 => tick,
            _ => [frame_tick, frame_tick],
        };
        for (ch, port) in [(0usize, 5usize), (1, 6)] {
            if clocks[ch] {
                self.converter[ch] = self.latch[port] as i16;
                self.fsyn_stat[ch] = true;
            }
        }
        if frame_tick {
            self.out = (frame_average(self.frame_sum[0]), frame_average(self.frame_sum[1]));
            self.frame_sum = [0, 0];
        }
        // Latch writes of this cycle become visible.
        for &(port, v) in &outs {
            self.latch[port as usize] = v;
            if port == 7 {
                self.addr = v;
            }
        }
        if let Some(a) = self.addr_next.take() {
            self.addr = a;
        }
        self.addr_written = false;
    }
}

impl Io for Bus {
    fn read(&mut self, _dsp: usize, port: u8, _t: u64) -> u16 {
        if port == 5 {
            self.host_seen[_dsp] = true;
        }
        if port == 5 || port == 6 {
            self.host_reads[_dsp][(port - 5) as usize] += 1;
        }
        self.read_port(port, false)
    }

    fn write(&mut self, _dsp: usize, port: u8, v: u16, _t: u64) {
        match port {
            4 => {
                self.cache.access(self.addr, true);
                self.mem[self.addr as usize] = v;
            }
            7 => {
                // An address write wins over a read's increment.
                self.addr_written = true;
                self.addr_next = None;
            }
            _ => {}
        }
        self.outs.push((port, v));
    }

    fn bio(&self, _t: u64) -> bool {
        self.pos >= BIO_LOW
    }
}

pub struct Board {
    pub dsps: [Tms; 3],
    pub bus: Bus,
    pub run: bool,
    pub frames: u64,
}

impl Board {
    pub fn new() -> Self {
        Board {
            dsps: [Tms::new(), Tms::new(), Tms::new()],
            bus: Bus {
                t: 0,
                pos: 0,
                latch: [0; 8],
                outs: Vec::new(),
                addr: 0,
                addr_next: None,
                addr_written: false,
                mem: vec![0; 65536],
                adc: (0, 0),
                host_addr: 0,
                host_data: 0,
                host_seen: [false; 3],
                host_age: 0,
                host_reads: [[0; 2]; 3],
                flag_writes: [0; 8],
                params: VecDeque::new(),
                bus_queue: VecDeque::new(),
                bus_result: 0,
                bus_reads: 0,
                clock_mode: 0,
                fsyn_pending: [4096 - FSYN_UNITY as u32; 2],
                fsyn_period: [4096 - FSYN_UNITY as u32; 2],
                fsyn_phase: [0; 2],
                fsyn_stat: [false; 2],
                converter: [0; 2],
                frame_sum: [0; 2],
                flags: 0,
                firq: false,
                firq_req: false,
                out: (0, 0),
                cache: CacheStats::new(4096),
            },
            run: false,
            frames: 0,
        }
    }

    /// `$80A3`: hold the cores in reset (program RAM is loaded meanwhile).
    pub fn set_run(&mut self, run: bool) {
        if run && !self.run {
            let start = self.bus.t + START_DELAY;
            for d in self.dsps.iter_mut() {
                d.reset();
                d.next = start;
            }
            let b = &mut self.bus;
            b.host_addr = 0;
            b.host_data = 0;
            b.host_seen = [false; 3];
            b.host_age = 0;
            b.addr = 0;
        }
        self.run = run;
    }

    /// `$8055`: the host acknowledges the FIRQ. Its line drops at once; the
    /// request the DSPs see (status bit 1) drops once the latch writes
    /// queued before the acknowledge have been presented: DSP programs raise
    /// FIRQ and read the latch until it is acknowledged, while the 6809
    /// sends their parameters first.
    pub fn firq_ack(&mut self) {
        self.bus.firq = false;
        self.bus.params.push_back((PARAM_FIRQ_ACK, 0));
    }

    /// Run one frame with the given input sample; returns the output sample.
    pub fn frame(&mut self, l: i16, r: i16) -> (i16, i16) {
        if !self.run {
            return (0, 0);
        }
        self.bus.adc = (l as u16, r as u16);
        for pos in 0..FRAME {
            self.bus.pos = pos;
            let t = self.bus.t;
            for i in 0..3 {
                if self.dsps[i].next == t {
                    let (dsps, bus) = (&mut self.dsps, &mut self.bus);
                    dsps[i].step(i, bus);
                }
            }
            self.bus.end_of_cycle();
            self.bus.t += 1;
        }
        // Host latch: next entry once every DSP read PA5 (or a timeout).
        let b = &mut self.bus;
        if !b.params.is_empty() && (b.host_seen.iter().all(|&s| s) || b.host_age >= PARAM_TIMEOUT) {
            let (a, d) = b.params.pop_front().unwrap();
            if a & PARAM_FIRQ_ACK != 0 {
                b.firq_req = false;
            } else {
                b.host_addr = a;
                b.host_data = d;
                b.host_seen = [false; 3];
                b.host_age = 0;
            }
        } else if b.host_age < PARAM_TIMEOUT {
            b.host_age += 1;
        }
        self.bus.cache.end_frame();
        self.frames += 1;
        self.bus.out
    }
}

impl Default for Board {
    fn default() -> Self {
        Self::new()
    }
}
