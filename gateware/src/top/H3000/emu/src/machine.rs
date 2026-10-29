//! The H3000 host board around the 6809.
//!
//! Memory map (as decoded by the kernel, see H3000-Firmware/docs):
//!
//! | CPU address   | Contents                                                  |
//! |---------------|-----------------------------------------------------------|
//! | `$0000-$3FFF` | bank window, selected by the latch at `$8052`             |
//! | `$4000-$5FFF` | RAM (purpose unknown; only touched by one module)         |
//! | `$6000-$7FFF` | RAM                                                       |
//! | `$8000-$83FF` | I/O                                                       |
//! | `$8400-$FFFF` | kernel ROM                                                |
//!
//! Bank latch values: ROM banks (see [`crate::roms`]), `$A0` battery-backed
//! RAM (16 KB), `$80-$83` the DSP host latch. Writes to the DSP banks are
//! 16-bit (high byte first) and are forwarded to the [`Host`]: a word written
//! at window offset `o` of bank `$8n` is host latch address `n << 12 | o / 2`.
//! While the DSPs are held (`$80A3`), banks `$81-$83` load the program RAM
//! of DSP 1-3 instead (2K words, mirrored). The kernel writes parameters
//! through all four banks: the latch address is only a convention between
//! it and the DSP code (an address word with DSP select bits; module $7A's
//! programs route their outputs by latch addresses `$3700` and up).
//!
//! I/O registers:
//!
//! | Address       | Function                                                  |
//! |---------------|-----------------------------------------------------------|
//! | `$8000-$800F` | DSP bus port `n` at `$8000 + 2n` (16-bit): a write or read happens in the host's bus slot of the next sample; busy = `$8053` bit 5, read result at `$8050` |
//! | `$8020`       | level DAC data (strobed by `$80A6`)                       |
//! | `$8052`       | bank latch                                                |
//! | `$8053`       | status: bits 0+6 host latch ready, 5 bus busy, 7 DSP interrupt (flag Q0) |
//! | `$8054`       | latch                                                     |
//! | `$8055`       | FIRQ acknowledge (any write)                              |
//! | `$8056`       | keypad columns (bits 0,1,4,5 active low; bit 2 of row 0), knob quadrature (bits 6,7) |
//! | `$8057`       | keypad row strobe (one-hot, 6 rows)                       |
//! | `$8061/$8063` | LCD command/status and data (the even addresses are written with the same byte) |
//! | `$80A1-$80A7` | latches: `$80A3` DSP reset ($FF holds), `$80A2` DSP RAM access, `$80A4/$80A5` DAC clock select, `$80A7` NMI acknowledge |
//! | `$8300/$8301` | MC6850 ACIA, MIDI                                         |
//!
//! The NMI is a periodic tick ([`NMI_HZ_X10`]), gated and acknowledged
//! through `$80A7` bit 0; it scans the knob and runs the software timers.
//! FIRQ comes from the DSPs (status port write `$C000`) and is acknowledged
//! through `$8055`. IRQ is the ACIA or the DSPs' flag Q0, which the host
//! clears by writing `$8000` to bus port 0. The DSP board is polled for its
//! interrupt lines every few samples ([`POLL_CYCLES`]).
//!
//! After a FIRQ acknowledge the next FIRQ is held off for
//! [`FIRQ_HOLDOFF_CYCLES`] (a departure from the hardware). The gate
//! programs 440, 448 and 456 request a FIRQ on every 3-frame pass of their
//! gate detector while the input is quiet, far faster than the kernel's
//! handler (about 240 E cycles) can serve them: the main loop would get one
//! instruction per interrupt and the front panel would stop answering. Every
//! other program interrupts every 2 ms or less often.

use crate::cpu::{Bus, Cpu};
use crate::hle::{self, Hle};
use crate::lcd::Lcd;
use crate::roms::{RomSet, BANK_SIZE, KERNEL_SIZE};

/// 6809 E clock: the 36.6912 MHz master clock / 32, exactly 26 E cycles per
/// 44.1 kHz sample.
pub const E_HZ: u32 = 1_146_600;

/// E cycles per audio sample (one host bus slot each).
pub const SAMPLE_CYCLES: u32 = 26;

/// Periodic NMI rate ("CLK1KS"; the service manual does not give it). The
/// kernel's MIDI-clock tempo display (`$60EB`, MIDI clocks per 4096 NMIs)
/// reads directly in BPM at this rate.
pub const NMI_HZ_X10: u32 = 16384;

/// NMI period in 1/1024ths of an E cycle.
const NMI_PERIOD_Q10: u64 = (E_HZ as u64 * 1024 * 10) / NMI_HZ_X10 as u64;

/// How often the DSP board's interrupt lines are sampled: every 8 samples
/// (180 us). A finer poll only costs emulator time: on the Tiliqua the 6809
/// runs in 1 ms slices, so its timing against the free-running DSPs is
/// only as good as that anyway.
pub const POLL_CYCLES: u64 = 8 * SAMPLE_CYCLES as u64;

/// Least time from a FIRQ acknowledge to the next FIRQ (1 ms).
pub const FIRQ_HOLDOFF_CYCLES: u64 = E_HZ as u64 / 1000;

/// Host latch queue entry (address bit 15, which [`Host::dsp_param`]
/// addresses never have) standing for the FIRQ acknowledge, see
/// [`Host::firq_ack`].
pub const PARAM_FIRQ_ACK: u16 = 0x8000;

/// [`Host::interrupts`] bits.
pub const INT_FIRQ: u8 = 1;
pub const INT_Q0: u8 = 2;

/// Quadrature steps per knob detent. The encoder rests in state 01 or 10,
/// and the kernel only counts a detent when it sees the same state on two
/// consecutive NMIs.
const KNOB_STEPS_PER_DETENT: u8 = 2;
/// NMIs the knob rests at each detent.
const KNOB_REST_TICKS: u8 = 2;
/// Most knob detents waiting for the kernel.
const KNOB_BACKLOG: i32 = 32;

/// MIDI byte time at 31250 baud, in E cycles.
const MIDI_BYTE_CYCLES: u64 = (E_HZ as u64 * 10) / 31250;

/// Interface from the emulated host board to the DSP board and other
/// hardware outside the 6809's own world.
pub trait Host {
    /// `$80A3`: true while the DSPs are held in reset.
    fn dsp_hold(&mut self, hold: bool);
    /// A word written to the program RAM of DSP `dsp` (1-3), `word` 0-0x7FF,
    /// while the DSPs are held.
    fn dsp_program(&mut self, dsp: u8, word: u16, data: u16);
    /// A word written to the DSP host latch (banks `$80-$83`), `addr` 0-0x3FFF.
    fn dsp_param(&mut self, addr: u16, data: u16);
    /// Whether the host latch can take another write.
    fn dsp_param_ready(&mut self) -> bool {
        true
    }
    /// Queue a write of DSP bus port `port` (0-7), performed in the host's
    /// bus slot.
    fn bus_write(&mut self, _port: u8, _data: u16) {}
    /// Queue a read of DSP bus port `port`.
    fn bus_read(&mut self, _port: u8) {}
    /// Result of the last queued read (`$8050`); may wait for it to complete.
    fn bus_result(&mut self) -> u16 {
        0
    }
    /// DAC clock select from the `$80A4/$80A5` latches: 0 input rate, 1
    /// right synthesizer for both DACs, 2 left / right synthesizers.
    fn clock_mode(&mut self, _mode: u8) {}
    /// The DSP board's interrupt requests ([`INT_FIRQ`], [`INT_Q0`]). Q0 must
    /// read as clear while a host bus write that may clear it is queued.
    fn interrupts(&mut self) -> u8 {
        0
    }
    /// `$8055`: clear the FIRQ request. The DSPs see the request in their
    /// status word (bit 1), and some raise FIRQ and then read the host latch
    /// until it is acknowledged, while the kernel sends their parameters
    /// first: the board has to see the acknowledge after the latch writes
    /// queued before it (queue a [`PARAM_FIRQ_ACK`] entry behind them).
    fn firq_ack(&mut self) {}
    /// A byte sent out of the MIDI port.
    fn midi_out(&mut self, _byte: u8) {}
    /// Any other output latch write (`$8020`, `$8054`, `$8055`, `$80A0-$80A7`).
    fn latch(&mut self, _addr: u16, _val: u8) {}
    /// Access to an address with no known function (for diagnostics).
    fn unmapped(&mut self, _addr: u16, _write: Option<u8>) {}
}

/// MC6850 ACIA (MIDI).
#[derive(Clone)]
pub struct Acia {
    control: u8,
    rx_data: u8,
    rx_full: bool,
    overrun: bool,
    queue: [u8; 256],
    head: u8,
    tail: u8,
    next_rx: u64,
}

impl Acia {
    const fn new() -> Self {
        Acia {
            control: 0x03,
            rx_data: 0,
            rx_full: false,
            overrun: false,
            queue: [0; 256],
            head: 0,
            tail: 0,
            next_rx: 0,
        }
    }

    /// Control register, receive register full, overrun, bytes queued.
    pub fn state(&self) -> (u8, bool, bool, u8) {
        (self.control, self.rx_full, self.overrun, self.tail.wrapping_sub(self.head))
    }

    fn status(&self) -> u8 {
        let mut s = 0x02; // TDRE: transmit is always ready
        if self.rx_full {
            s |= 0x01;
        }
        if self.overrun {
            s |= 0x20;
        }
        if self.irq() {
            s |= 0x80;
        }
        s
    }

    fn irq(&self) -> bool {
        (self.control & 0x80 != 0 && (self.rx_full || self.overrun)) || (self.control & 0x60 == 0x20)
    }

    fn write_control(&mut self, v: u8) {
        self.control = v;
        if v & 0x03 == 0x03 {
            self.rx_full = false;
            self.overrun = false;
        }
    }

    fn read_data(&mut self) -> u8 {
        self.rx_full = false;
        self.overrun = false;
        self.rx_data
    }

    fn push(&mut self, byte: u8) {
        if self.tail.wrapping_add(1) != self.head {
            self.queue[self.tail as usize] = byte;
            self.tail = self.tail.wrapping_add(1);
        }
    }

    /// Move the next queued byte into the receive register, at MIDI speed.
    fn poll(&mut self, now: u64) {
        if self.head != self.tail && now >= self.next_rx && self.control & 0x03 != 0x03 {
            if self.rx_full {
                self.overrun = true;
            }
            self.rx_data = self.queue[self.head as usize];
            self.head = self.head.wrapping_add(1);
            self.rx_full = true;
            self.next_rx = now + MIDI_BYTE_CYCLES;
        }
    }
}

#[derive(Clone, Copy, PartialEq, Eq)]
enum Window<'a> {
    Rom(&'a [u8; crate::roms::BANK_SIZE]),
    NvRam,
    /// DSP host latch (0) or DSP program RAM (1-3).
    Dsp(u8),
    None,
}

/// The board's read/write memories, supplied by the caller so that each can
/// be placed in the most suitable memory of the emulating machine.
pub struct Memories<'a> {
    /// `$6000-$7FFF` (the hot one: stack, kernel variables).
    pub ram: &'a mut [u8; 0x2000],
    /// `$4000-$5FFF`.
    pub ram4: &'a mut [u8; 0x2000],
    /// Battery-backed RAM, bank `$A0`.
    pub nvram: &'a mut [u8; 0x4000],
}

/// Everything on the 6809 bus.
pub struct Board<'a, H: Host> {
    roms: RomSet<'a>,
    /// Hooked loops ([`H3000::set_hle`]).
    hle: Option<Hle<'a>>,
    /// The kernel ROM and the ROM bank in the window as fetched as code:
    /// with the [`hle`] traps in, if any.
    code_kernel: &'a [u8; KERNEL_SIZE],
    code_window: Option<&'a [u8; BANK_SIZE]>,
    pub ram: &'a mut [u8; 0x2000],
    pub ram4: &'a mut [u8; 0x2000],
    pub nvram: &'a mut [u8; 0x4000],
    pub bank: u8,
    window: Window<'a>,
    pub lcd: Lcd,
    key_row: u8,
    /// Pressed switches, bit n = matrix position n (row * 4 + column; 24 = the
    /// extra switch on row 0).
    pub keys: u32,
    /// Keypad reads per matrix row (wrapping), so that a press can be held
    /// until the 6809 has seen it.
    pub row_scans: [u16; 6],
    knob_phase: u8,
    pub acia: Acia,
    wr_hi: u8,
    io_hi: u8,
    pub latches: [u8; 8],
    /// NMI request flip-flop: set by the periodic tick when enabled
    /// (`$80A7` bit 0), cleared by writing 0 to `$80A7`.
    nmi_ff: bool,
    /// DSP interrupt requests, as last polled.
    firq: bool,
    q0: bool,
    /// No FIRQ before this E cycle count (see [`FIRQ_HOLDOFF_CYCLES`]).
    firq_holdoff: u64,
    /// E cycle count at the start of the CPU's current run, and the cycles
    /// it has used since, before the current instruction (see [`Board::now`]).
    base: u64,
    elapsed: u32,
    /// An access that may change the interrupt lines (see [`Board::stop`]).
    lines_changed: bool,
    /// The bus port window is busy until this cycle.
    bus_busy_until: u64,
    bus_result: u16,
    pub host: H,
}

const COL_BITS: [u8; 4] = [0x01, 0x02, 0x10, 0x20];
/// Quadrature sequence on `$8056` bits 7:6, in the direction the kernel
/// counts up; detents are at phases 1 and 3.
const GRAY: [u8; 4] = [0x00, 0x80, 0xC0, 0x40];

impl<'a, H: Host> Board<'a, H> {
    /// The hooks ([`H3000::set_hle`]).
    pub fn hle(&self) -> Option<&Hle<'a>> {
        self.hle.as_ref()
    }

    /// E cycle count before the current instruction.
    #[inline(always)]
    fn now(&self) -> u64 {
        self.base + self.elapsed as u64
    }

    fn set_bank(&mut self, v: u8) {
        self.bank = v;
        self.window = match v {
            0x80..=0x83 => Window::Dsp(v & 3),
            0xA0 => Window::NvRam,
            _ => match self.roms.bank(v) {
                Some(b) => Window::Rom(b),
                None => Window::None,
            },
        };
        self.code_window = match self.window {
            Window::Rom(b) => Some(self.hle.as_ref().and_then(|h| h.bank(v)).unwrap_or(b)),
            _ => None,
        };
    }

    /// Code outside the kernel ROM: RAM, the ROM bank in the window.
    #[cold]
    #[inline(never)]
    fn code_ptr_slow(&mut self, pc: u16) -> *const u8 {
        match pc {
            0x6000..=0x7FFB => self.ram[(pc & 0x1FFF) as usize..].as_ptr(),
            0x4000..=0x5FFB => self.ram4[(pc & 0x1FFF) as usize..].as_ptr(),
            0x0000..=0x3FFB => match self.code_window {
                Some(w) => w[pc as usize..].as_ptr(),
                None => core::ptr::null(),
            },
            _ => core::ptr::null(),
        }
    }

    fn read_8056(&self) -> u8 {
        let mut v = 0x3F | GRAY[self.knob_phase as usize & 3];
        for row in 0..6 {
            if self.key_row & (1 << row) != 0 {
                for (col, bit) in COL_BITS.iter().enumerate() {
                    if self.keys & (1 << (row * 4 + col)) != 0 {
                        v &= !bit;
                    }
                }
            }
        }
        if self.key_row & 1 != 0 && self.keys & (1 << 24) != 0 {
            v &= !0x04;
        }
        v
    }

    /// A bus port access takes the host's slot in the next sample; requests
    /// made while busy queue behind it.
    fn bus_request(&mut self) {
        self.bus_busy_until = self.bus_busy_until.max(self.now()) + SAMPLE_CYCLES as u64;
    }

    #[inline(never)]
    fn io_read(&mut self, addr: u16) -> u8 {
        match addr {
            0x8000..=0x800F => {
                // A (16-bit) read of a port queues it; the result is read
                // from $8050 once no longer busy.
                if addr & 1 == 0 {
                    self.host.bus_read(((addr >> 1) & 7) as u8);
                    self.bus_request();
                }
                0xFF
            }
            0x8050 => {
                self.bus_result = self.host.bus_result();
                (self.bus_result >> 8) as u8
            }
            0x8051 => self.bus_result as u8,
            0x8053 => {
                let mut v = 0;
                if self.host.dsp_param_ready() {
                    v |= 0x41;
                }
                if self.now() < self.bus_busy_until {
                    v |= 0x20;
                }
                if self.q0 {
                    v |= 0x80;
                }
                v
            }
            0x8056 => {
                for row in 0..6 {
                    if self.key_row & (1 << row) != 0 {
                        self.row_scans[row] = self.row_scans[row].wrapping_add(1);
                    }
                }
                self.read_8056()
            }
            0x8060 | 0x8061 => self.lcd.read_status(),
            0x8062 | 0x8063 => {
                if addr & 1 != 0 {
                    self.lcd.read_data()
                } else {
                    0
                }
            }
            0x8300 => self.acia.status(),
            0x8301 => {
                #[cfg(feature = "std")]
                if self.acia.rx_full && std::env::var_os("ACIA_TRACE").is_some() {
                    std::eprintln!("acia read {:02x} (bank {:02x}) t={}", self.acia.rx_data, self.bank, self.now());
                }
                self.lines_changed = true;
                self.acia.read_data()
            }
            _ => {
                self.host.unmapped(addr, None);
                0xFF
            }
        }
    }

    #[inline(never)]
    fn io_write(&mut self, addr: u16, v: u8) {
        match addr {
            0x8000..=0x800F => {
                if addr & 1 == 0 {
                    self.io_hi = v;
                } else {
                    let word = ((self.io_hi as u16) << 8) | v as u16;
                    let port = ((addr >> 1) & 7) as u8;
                    self.host.bus_write(port, word);
                    self.bus_request();
                    if port == 0 && word & 0xFC01 == 0x8000 {
                        // Clears flag Q0, the DSP interrupt: drop it now
                        // rather than at the next poll.
                        self.q0 = false;
                        self.lines_changed = true;
                    }
                }
            }
            0x8052 => self.set_bank(v),
            0x8057 => self.key_row = v,
            0x8060 | 0x8062 => {} // same byte is written again at the odd address
            0x8061 => self.lcd.write_command(v),
            0x8063 => self.lcd.write_data(v),
            0x80A0..=0x80A7 => {
                self.latches[(addr & 7) as usize] = v;
                if addr == 0x80A3 {
                    self.host.dsp_hold(v != 0);
                }
                if addr == 0x80A7 && v & 1 == 0 {
                    // Clears (and while 0, holds clear) the NMI flip-flop.
                    self.nmi_ff = false;
                }
                if addr == 0x80A4 || addr == 0x80A5 {
                    let mode = ((self.latches[4] != 0) as u8) << 1 | (self.latches[5] != 0) as u8;
                    self.host.clock_mode(mode);
                }
                self.host.latch(addr, v);
            }
            0x8055 => {
                self.firq = false;
                self.lines_changed = true;
                self.firq_holdoff = self.now() + FIRQ_HOLDOFF_CYCLES;
                self.host.firq_ack();
                self.host.latch(addr, v);
            }
            0x8020..=0x803F | 0x8054 => self.host.latch(addr, v),
            0x8300 => {
                self.acia.write_control(v);
                self.lines_changed = true;
            }
            0x8301 => self.host.midi_out(v),
            _ => self.host.unmapped(addr, Some(v)),
        }
    }

    fn window_write(&mut self, addr: u16, v: u8) {
        match self.window {
            Window::NvRam => self.nvram[addr as usize] = v,
            Window::Dsp(n) => {
                if addr & 1 == 0 {
                    self.wr_hi = v;
                } else {
                    let word = ((self.wr_hi as u16) << 8) | v as u16;
                    let w = addr >> 1;
                    let held = self.latches[3] != 0;
                    if n == 0 {
                        self.host.dsp_param(w, word);
                    } else if held {
                        self.host.dsp_program(n, w & 0x7FF, word);
                    } else {
                        self.host.dsp_param((n as u16) << 12 | (w & 0xFFF), word);
                    }
                }
            }
            _ => {}
        }
    }
}

impl<'a, H: Host> Bus for Board<'a, H> {
    // The CPU's commonest accesses are served inline (data in the RAM at
    // $6000, code in the kernel ROM), the rest out of line: the complete
    // decode, inlined into every access of every instruction, would make the
    // interpreter too large for the softcore's instruction cache (code runs
    // from PSRAM).

    /// Data is mostly in the RAM at $6000 (tables in ROM are rare).
    #[inline(always)]
    fn rd(&mut self, addr: u16) -> u8 {
        if addr & 0xE000 == 0x6000 {
            self.ram[(addr & 0x1FFF) as usize]
        } else {
            self.read(addr)
        }
    }

    #[inline(always)]
    fn wr(&mut self, addr: u16, v: u8) {
        if addr & 0xE000 == 0x6000 {
            self.ram[(addr & 0x1FFF) as usize] = v;
        } else {
            self.write(addr, v);
        }
    }

    /// The stack is in the RAM at $6000.
    #[inline(always)]
    fn mem_ptr(&mut self, addr: u16, len: u16) -> *mut u8 {
        if addr >= 0x6000 && addr as u32 + len as u32 <= 0x8000 {
            // SAFETY: within the 8 KB RAM.
            unsafe { self.ram.as_mut_ptr().add((addr - 0x6000) as usize) }
        } else {
            core::ptr::null_mut()
        }
    }

    /// Code mostly runs from the kernel ROM.
    #[inline(always)]
    fn code_ptr(&mut self, pc: u16) -> *const u8 {
        if (0x8400..=0xFFFB).contains(&pc) {
            self.code_kernel[(pc & 0x7FFF) as usize..].as_ptr()
        } else {
            self.code_ptr_slow(pc)
        }
    }

    fn code(&mut self, addr: u16) -> u8 {
        if addr >= 0x8400 {
            self.code_kernel[(addr & 0x7FFF) as usize]
        } else {
            match self.code_window {
                Some(w) if addr < 0x4000 => w[addr as usize],
                _ => self.peek(addr),
            }
        }
    }

    fn peek(&mut self, addr: u16) -> u8 {
        if self.plain(addr) {
            self.read(addr)
        } else {
            0xFF
        }
    }

    fn plain(&mut self, addr: u16) -> bool {
        match addr >> 13 {
            0 | 1 => matches!(self.window, Window::Rom(_) | Window::NvRam),
            2 | 3 => true,
            _ => addr >= 0x8400,
        }
    }

    #[inline(never)]
    fn trap(&mut self, cpu: &mut Cpu, room: u32) -> u32 {
        let Some((hook, exact)) = self.hle.as_ref().and_then(|h| Some((h.hook(self.bank, cpu.pc.wrapping_sub(1))?, h.exact)))
        else {
            return 0;
        };
        if let Some(h) = self.hle.as_mut() {
            h.traps += 1;
        }
        hle::run(cpu, self, hook, room, exact)
    }

    #[inline(always)]
    fn elapsed(&mut self, cycles: u32) {
        self.elapsed = cycles;
    }

    /// The CPU returns to [`H3000::run`] after an access that may change
    /// its interrupt lines (clearing Q0, acknowledging FIRQ, the ACIA).
    #[inline(always)]
    fn stop(&mut self) -> bool {
        self.lines_changed
    }

    #[cold]
    #[inline(never)]
    fn read(&mut self, addr: u16) -> u8 {
        if addr >= 0x8400 {
            return self.roms.kernel[(addr - 0x8000) as usize];
        }
        match addr >> 13 {
            0 | 1 => match self.window {
                Window::Rom(b) => b[addr as usize],
                Window::NvRam => self.nvram[addr as usize],
                _ => 0xFF,
            },
            2 => self.ram4[(addr - 0x4000) as usize],
            3 => self.ram[(addr - 0x6000) as usize],
            _ => self.io_read(addr),
        }
    }

    #[cold]
    #[inline(never)]
    fn write(&mut self, addr: u16, v: u8) {
        match addr >> 13 {
            3 => self.ram[(addr - 0x6000) as usize] = v,
            0 | 1 => self.window_write(addr, v),
            2 => self.ram4[(addr - 0x4000) as usize] = v,
            _ => {
                if addr < 0x8400 {
                    self.io_write(addr, v)
                }
            }
        }
    }
}

/// Scripted front-panel sequence for [`H3000::factory_reset`].
#[derive(Clone, Copy, PartialEq, Eq, Debug)]
enum Script {
    Idle,
    /// Holding the "clear memory" key through reset, until the prompt shows.
    HoldClear,
    /// All keys released before answering.
    Release1,
    /// "Yes" pressed for the first (v1.53: only) prompt.
    Confirm1,
    /// Waiting to see if the H3500's "Reset the Operating System ?" follows.
    AwaitSecond,
    Confirm2,
}

/// Switches used by the factory-reset sequence.
const KEY_CLEAR_AT_BOOT: u8 = 10;
const KEY_YES: u8 = 4;

/// The complete host machine: 6809 + board.
pub struct H3000<'a, H: Host> {
    pub cpu: Cpu,
    pub board: Board<'a, H>,
    script: Script,
    script_t: u64,
    next_nmi_q10: u64,
    next_poll: u64,
    /// The earliest of the NMI tick, the next poll and the next MIDI byte
    /// (0: work it out before running on).
    next_event: u64,
    /// Detents still to turn (positive = up).
    knob_pending: i32,
    knob_steps: u8,
    knob_rest: u8,
}

impl<'a, H: Host> H3000<'a, H> {
    /// `mem.nvram` keeps its contents (a never-initialised NV RAM should be
    /// filled with `$FF`, see [`H3000::factory_reset`]).
    pub fn new(roms: RomSet<'a>, mem: Memories<'a>, host: H) -> Self {
        let mut m = H3000 {
            cpu: Cpu::new(),
            board: Board {
                roms,
                hle: None,
                code_kernel: roms.kernel,
                code_window: None,
                ram: mem.ram,
                ram4: mem.ram4,
                nvram: mem.nvram,
                bank: 0,
                window: Window::None,
                lcd: Lcd::new(),
                key_row: 0,
                keys: 0,
                row_scans: [0; 6],
                knob_phase: 1,
                acia: Acia::new(),
                wr_hi: 0,
                io_hi: 0,
                latches: [0; 8],
                nmi_ff: false,
                firq: false,
                q0: false,
                firq_holdoff: 0,
                base: 0,
                elapsed: 0,
                lines_changed: false,
                bus_busy_until: 0,
                bus_result: 0,
                host,
            },
            script: Script::Idle,
            script_t: 0,
            next_nmi_q10: NMI_PERIOD_Q10,
            next_poll: 0,
            next_event: 0,
            knob_pending: 0,
            knob_steps: 0,
            knob_rest: 0,
        };
        m.reset();
        m
    }

    /// Power-on reset (RAM contents are kept, as on the real board).
    pub fn reset(&mut self) {
        self.board.set_bank(0);
        self.cpu.reset(&mut self.board);
        self.next_nmi_q10 = (self.cpu.cycles << 10) + NMI_PERIOD_Q10;
        self.next_poll = self.cpu.cycles;
        self.next_event = 0;
        self.board.firq = false;
        self.board.q0 = false;
        self.board.firq_holdoff = 0;
        self.board.bus_busy_until = self.cpu.cycles;
    }

    /// Reset with the kernel's own "clear all memory" procedure, as on a
    /// factory-fresh unit: hold the clear key through reset and answer "Yes"
    /// to its prompt(s). Use this when the NV RAM holds no valid contents.
    pub fn factory_reset(&mut self) {
        self.board.keys = 1 << KEY_CLEAR_AT_BOOT;
        self.script = Script::HoldClear;
        self.script_t = self.cpu.cycles;
        self.reset();
    }

    /// Run the kernels' hottest loops natively (see [`crate::hle`]).
    pub fn set_hle(&mut self, hle: Hle<'a>) {
        self.board.code_kernel = hle.kernel;
        self.board.hle = Some(hle);
        self.board.set_bank(self.board.bank);
    }

    /// Whether a scripted sequence ([`H3000::factory_reset`]) is running.
    pub fn busy(&self) -> bool {
        self.script != Script::Idle
    }

    fn lcd_starts_with(&self, row: usize, text: &[u8]) -> bool {
        text.iter().enumerate().all(|(i, &c)| self.board.lcd.char_at(row, i) == c)
    }

    fn run_script(&mut self) {
        let t = self.cpu.cycles - self.script_t;
        let ms = |n: u64| n * E_HZ as u64 / 1000;
        match self.script {
            Script::Idle => {}
            Script::HoldClear => {
                if self.lcd_starts_with(0, b"clear all memory") || self.lcd_starts_with(0, b"Remove all presets") {
                    self.board.keys = 0;
                    self.script = Script::Release1;
                    self.script_t = self.cpu.cycles;
                } else if t > ms(3000) {
                    self.board.keys = 0;
                    self.script = Script::Idle;
                }
            }
            Script::Release1 => {
                if t > ms(200) {
                    self.board.keys = 1 << KEY_YES;
                    self.script = Script::Confirm1;
                    self.script_t = self.cpu.cycles;
                }
            }
            Script::Confirm1 | Script::Confirm2 => {
                if t > ms(150) {
                    self.board.keys = 0;
                    self.script = if self.script == Script::Confirm1 { Script::AwaitSecond } else { Script::Idle };
                    self.script_t = self.cpu.cycles;
                }
            }
            Script::AwaitSecond => {
                if self.lcd_starts_with(0, b"Reset the Operating System") && t > ms(200) {
                    self.board.keys = 1 << KEY_YES;
                    self.script = Script::Confirm2;
                    self.script_t = self.cpu.cycles;
                } else if t > ms(1500) {
                    self.script = Script::Idle;
                }
            }
        }
    }

    /// Turn the knob by a number of detents (positive = clockwise). The
    /// kernel takes them at its own pace, slowly while busy: at most
    /// `KNOB_BACKLOG` are kept, so a fast spin does not run on long after.
    pub fn turn_knob(&mut self, detents: i32) {
        self.knob_pending = (self.knob_pending + detents).clamp(-KNOB_BACKLOG, KNOB_BACKLOG);
    }

    /// Set or clear one switch of the keypad matrix (see [`Board::keys`]).
    pub fn set_key(&mut self, index: u8, pressed: bool) {
        if pressed {
            self.board.keys |= 1 << index;
        } else {
            self.board.keys &= !(1 << index);
        }
    }

    /// Queue one received MIDI byte.
    pub fn midi_in(&mut self, byte: u8) {
        self.board.acia.push(byte);
        self.next_event = 0;
    }

    /// Run for (at least) `cycles` E cycles.
    ///
    /// Events (the NMI tick, polling the DSP board, MIDI input) are handled
    /// between runs of instructions ([`Cpu::run`]) that end at the next one
    /// due, or after an I/O access (which may change the interrupt lines).
    pub fn run(&mut self, cycles: u32) {
        let end = self.cpu.cycles + cycles as u64;
        while self.cpu.cycles < end {
            let now = self.cpu.cycles;
            if now >= self.next_event {
                self.events(now);
            } else if self.board.lines_changed {
                self.update_lines();
            }
            // The instructions up to the next event (at least one), or up to
            // an I/O access that may change the interrupt lines.
            self.board.base = now;
            self.board.lines_changed = false;
            let budget = end.min(self.next_event).saturating_sub(now).max(1);
            self.cpu.run(&mut self.board, budget as u32);
        }
    }

    /// Whatever is due at `now` (the NMI tick, a poll of the DSP board's
    /// interrupt lines, the next MIDI byte), then the time of the next.
    #[inline(never)]
    fn events(&mut self, now: u64) {
        if (now << 10) >= self.next_nmi_q10 {
            self.next_nmi_q10 += NMI_PERIOD_Q10;
            self.tick();
        }
        if now >= self.next_poll {
            self.next_poll += POLL_CYCLES;
            let i = self.board.host.interrupts();
            self.board.firq = i & INT_FIRQ != 0 && now >= self.board.firq_holdoff;
            self.board.q0 = i & INT_Q0 != 0;
        }
        let acia = &mut self.board.acia;
        let mut next = self.next_poll.min((self.next_nmi_q10 + 1023) >> 10);
        if acia.head != acia.tail {
            acia.poll(now);
            if acia.head != acia.tail {
                next = next.min(acia.next_rx);
            }
        }
        self.next_event = next;
        self.update_lines();
    }

    /// The CPU's interrupt inputs from the board.
    #[inline(always)]
    fn update_lines(&mut self) {
        let irq = self.board.acia.irq() || self.board.q0;
        self.cpu.set_lines(self.board.firq, irq);
    }

    /// Per-NMI housekeeping: scripts, knob quadrature, then the NMI itself.
    fn tick(&mut self) {
        if self.script != Script::Idle {
            self.run_script();
        }
        if self.knob_rest > 0 {
            self.knob_rest -= 1;
        } else if self.knob_pending != 0 {
            let up = self.knob_pending > 0;
            self.board.knob_phase = (self.board.knob_phase + if up { 1 } else { 3 }) & 3;
            self.knob_steps += 1;
            if self.knob_steps == KNOB_STEPS_PER_DETENT {
                self.knob_steps = 0;
                self.knob_pending += if up { -1 } else { 1 };
                self.knob_rest = KNOB_REST_TICKS;
            }
        }
        if self.board.latches[7] & 1 != 0 && !self.board.nmi_ff {
            self.board.nmi_ff = true;
            self.cpu.nmi();
        }
    }
}
