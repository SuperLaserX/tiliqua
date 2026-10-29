//! Connects the emulated 6809's DSP interface to the H3000 DSP board
//! gateware (`h3000/peripheral.py`).

use h3000_emu::machine::{Host, INT_FIRQ, INT_Q0, PARAM_FIRQ_ACK};

use crate::pac;

/// Depth of the host-latch FIFO in the gateware (`H3000DspBoard`).
const PARAM_FIFO_DEPTH: u8 = 32;
/// Depth of the host bus request FIFO (one request runs per sample frame).
const BUS_FIFO_DEPTH: u8 = 16;
/// Spin limit while waiting on the gateware (a few ms; the DSPs may be
/// stopped).
const SPIN_LIMIT: u32 = 20_000;

/// The free-running timer (counts down), for timing the waits.
fn timer() -> u32 {
    unsafe { pac::TIMER0::steal() }.counter().read().value().bits()
}

pub struct DspBoard {
    regs: pac::H3000,
    run: bool,
    pub bypass: bool,
    pub mute: bool,
    /// DAC clock select (see `Host::clock_mode`).
    pub clock_mode: u8,
    /// Host bus reads queued (wrapping, compared with the gateware's count).
    reads_queued: u8,
    /// Program words written since the DSPs were last held.
    pub program_words: u32,
    /// DSP program loads (hold -> run transitions).
    pub loads: u32,
    /// Host latch writes.
    pub params: u32,
    /// Host latch writes that found the FIFO full.
    pub param_stalls: u32,
    /// Host bus accesses, and FIRQ / Q0 interrupts taken.
    pub bus_writes: u32,
    pub bus_reads: u32,
    pub firqs: u32,
    pub irqs: u32,
    /// MIDI bytes received (TRS input) and sent (the H3000's MIDI out,
    /// which has no jack here).
    pub midi_in: u32,
    pub midi_out: u32,
    /// Timer ticks spent waiting on the gateware (a bus slot, room in a
    /// queue), and waits given up.
    pub wait_ticks: u64,
    pub timeouts: u32,
    last_int: u8,
}

impl DspBoard {
    pub fn new(regs: pac::H3000) -> Self {
        let b = DspBoard {
            regs,
            run: false,
            bypass: false,
            mute: false,
            clock_mode: 0,
            reads_queued: 0,
            program_words: 0,
            loads: 0,
            params: 0,
            param_stalls: 0,
            bus_writes: 0,
            bus_reads: 0,
            firqs: 0,
            irqs: 0,
            midi_in: 0,
            midi_out: 0,
            wait_ticks: 0,
            timeouts: 0,
            last_int: 0,
        };
        b.write_control();
        b
    }

    pub fn write_control(&self) {
        self.regs.control().write(|w| unsafe {
            w.run().bit(self.run);
            w.bypass().bit(self.bypass);
            w.mute().bit(self.mute);
            w.clock_mode().bits(self.clock_mode)
        });
    }

    pub fn running(&self) -> bool {
        self.run
    }

    pub fn frames(&self) -> u32 {
        self.regs.frames().read().count().bits()
    }

    /// (last, worst) clocks per sample frame. The budget is the sync clock
    /// divided by the sample rate; above it, PSRAM stalls slow the DSPs.
    pub fn frame_clocks(&self) -> (u16, u16) {
        let r = self.regs.frame_clocks().read();
        (r.last().bits(), r.max().bits())
    }

    pub fn clear_max(&self) {
        self.regs.clear_max().write(|w| w.clear().bit(true));
    }

    /// The next byte from the MIDI input, if any.
    pub fn midi_byte(&mut self) -> Option<u8> {
        let r = self.regs.midi_rx().read();
        if r.valid().bit() {
            self.midi_in += 1;
            Some(r.byte().bits())
        } else {
            None
        }
    }

    pub fn cache_misses(&self) -> u32 {
        self.regs.misses().read().count().bits()
    }

    fn param_level(&self) -> u8 {
        self.regs.param_level().read().level().bits()
    }

    fn bus_level(&self) -> u8 {
        self.regs.bus_status().read().level().bits()
    }

    /// Queue a host bus request. Requests only run while the DSPs run, so
    /// with the DSPs held a full queue drops the request instead of waiting.
    fn bus_request(&mut self, port: u8, data: u16, read: bool) -> bool {
        if self.bus_level() >= BUS_FIFO_DEPTH - 1 {
            let t0 = timer();
            let mut n = 0;
            while self.bus_level() >= BUS_FIFO_DEPTH - 1 {
                if !self.run || n == SPIN_LIMIT {
                    self.timeouts += self.run as u32;
                    self.wait_ticks += t0.wrapping_sub(timer()) as u64;
                    return false;
                }
                n += 1;
            }
            self.wait_ticks += t0.wrapping_sub(timer()) as u64;
        }
        self.regs.bus_req().write(|w| unsafe {
            w.data().bits(data);
            w.port().bits(port & 7);
            w.read().bit(read)
        });
        true
    }

    /// Queue a host latch entry. The DSPs take one per sample frame: wait
    /// for space rather than drop it (bounded, in case the DSPs are stopped).
    fn push_param(&mut self, addr: u16, data: u16) {
        if self.param_level() >= PARAM_FIFO_DEPTH - 1 {
            self.param_stalls += 1;
            let t0 = timer();
            let mut n = 0;
            while self.param_level() >= PARAM_FIFO_DEPTH - 1 && n < SPIN_LIMIT {
                n += 1;
            }
            self.timeouts += (n == SPIN_LIMIT) as u32;
            self.wait_ticks += t0.wrapping_sub(timer()) as u64;
        }
        self.regs.param().write(|w| unsafe {
            w.data().bits(data);
            w.addr().bits(addr)
        });
    }
}

impl Host for DspBoard {
    fn midi_out(&mut self, _byte: u8) {
        self.midi_out += 1;
    }

    fn dsp_hold(&mut self, hold: bool) {
        if self.run == hold {
            if hold {
                self.program_words = 0;
            } else {
                self.loads += 1;
            }
            self.run = !hold;
            self.write_control();
        }
    }

    fn dsp_program(&mut self, dsp: u8, word: u16, data: u16) {
        self.program_words += 1;
        self.regs.pload().write(|w| unsafe {
            w.data().bits(data);
            w.addr().bits(0x800 | (word & 0x7FF));
            w.dsp().bits((dsp - 1) & 3)
        });
    }

    fn dsp_param(&mut self, addr: u16, data: u16) {
        self.params += 1;
        self.push_param(addr, data);
    }

    fn dsp_param_ready(&mut self) -> bool {
        self.param_level() < PARAM_FIFO_DEPTH - 4
    }
            self.param_stalls += 1;
            let t0 = timer();
            let mut n = 0;
            while self.param_level() >= PARAM_FIFO_DEPTH - 1 && n < SPIN_LIMIT {
                n += 1;
            }
    fn bus_write(&mut self, port: u8, data: u16) {
        self.bus_writes += 1;
        self.bus_request(port, data, false);
    }

    fn bus_read(&mut self, port: u8) {
        self.bus_reads += 1;
        if self.bus_request(port, 0, true) {
            self.reads_queued = self.reads_queued.wrapping_add(1);
        }
    }

    fn bus_result(&mut self) -> u16 {
        // Wait for the last queued read (at most a few frames).
        let t0 = timer();
        let mut n = 0;
        loop {
            let r = self.regs.bus_status().read();
            if r.reads().bits() == self.reads_queued || !self.run || n == SPIN_LIMIT {
                self.timeouts += (n == SPIN_LIMIT) as u32;
                self.wait_ticks += t0.wrapping_sub(timer()) as u64;
                return r.result().bits();
            }
            n += 1;
        }
    }

    fn clock_mode(&mut self, mode: u8) {
        if mode != self.clock_mode {
            self.clock_mode = mode;
            self.write_control();
        }
    }

    fn interrupts(&mut self) -> u8 {
        let r = self.regs.irq().read();
        let mut i = 0;
        if r.firq().bit() {
            i |= INT_FIRQ;
        }
        // A queued bus write may be the one clearing Q0: only report it once
        // the queue has drained.
        if r.flags().bits() & 1 != 0 && self.bus_level() == 0 {
            i |= INT_Q0;
        }
        let rising = i & !self.last_int;
        if rising & INT_FIRQ != 0 {
            self.firqs += 1;
        }
        if rising & INT_Q0 != 0 {
            self.irqs += 1;
        }
        self.last_int = i;
        i
    }

    fn firq_ack(&mut self) {
        // The line drops at once; the DSPs see the acknowledge after the
        // latch writes made before it (`PARAM_FIRQ_ACK`).
        self.regs.firq_clear().write(|w| w.clear().bit(true));
        self.push_param(PARAM_FIRQ_ACK, 0);
    }
}
