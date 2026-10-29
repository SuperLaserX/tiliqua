//! Motorola MC6809 instruction-level emulator.
//!
//! [`Cpu::run`] executes instructions until a cycle budget is used up and
//! returns the E clock cycles taken (documented 6809 timings, including the
//! indexed addressing post-byte cycles). Interrupts are sampled between
//! instructions: NMI is edge triggered ([`Cpu::nmi`]), FIRQ and IRQ are
//! level inputs ([`Cpu::set_lines`]).
//!
//! Written for speed on a small RISC-V softcore, where every taken branch
//! and every call costs: one 256-way dispatch whose arms have the
//! addressing mode fixed at compile time, instruction bytes read through
//! one pointer per instruction ([`Bus::code_ptr`]), data accesses the
//! [`Bus`] can serve inline (RAM), flags computed without branches, and a
//! single flag ([`Cpu::attn`]) instead of polling the interrupt lines before
//! every instruction. `cpu_ref.rs`, the first, plainer interpreter, is the
//! reference the tests compare it with.
//!
//! Instruction bytes are memory without side effects in practice (ROM, RAM):
//! an instruction's bytes are read as a whole, without the [`Bus::read`]
//! side effects of I/O registers ([`Bus::peek`]), and not seen as accesses.

/// Memory and I/O as seen by the CPU.
pub trait Bus {
    /// Any address: the complete decode.
    fn read(&mut self, addr: u16) -> u8;
    fn write(&mut self, addr: u16, val: u8);
    /// A data read, as [`Bus::read`]: room for an inline fast path that
    /// calls `read` for the uncommon addresses.
    #[inline(always)]
    fn rd(&mut self, addr: u16) -> u8 {
        self.read(addr)
    }
    /// A data write, as [`Bus::write`] (see [`Bus::rd`]).
    #[inline(always)]
    fn wr(&mut self, addr: u16, val: u8) {
        self.write(addr, val)
    }
    /// A byte of code, as [`Bus::read`] without side effects.
    #[inline(always)]
    fn code(&mut self, addr: u16) -> u8 {
        self.peek(addr)
    }
    /// A read without side effects (an I/O register's value as it stands,
    /// for instance).
    fn peek(&mut self, addr: u16) -> u8 {
        self.read(addr)
    }
    /// A pointer to the `len` bytes from `addr` on, if they are plain RAM
    /// (for stack operations); null otherwise. Valid until the next access.
    #[inline(always)]
    fn mem_ptr(&mut self, _addr: u16, _len: u16) -> *mut u8 {
        core::ptr::null_mut()
    }
    /// A pointer to the code at `pc` and the 4 bytes after it, if it is in
    /// plain memory; null otherwise (they are then read with
    /// [`Bus::peek`]). Valid until the next access.
    #[inline(always)]
    fn code_ptr(&mut self, _pc: u16) -> *const u8 {
        core::ptr::null()
    }
    /// The cycles [`Cpu::run`] has used so far, before each instruction.
    #[inline(always)]
    fn elapsed(&mut self, _cycles: u32) {}
    /// Whether [`Cpu::run`] should return after this instruction (an access
    /// may have changed the interrupt lines).
    #[inline(always)]
    fn stop(&mut self) -> bool {
        false
    }
    /// Whether `addr` is memory without side effects on access (for
    /// [`crate::hle`]).
    fn plain(&mut self, _addr: u16) -> bool {
        false
    }
    /// The trap opcode [`crate::hle::TRAP`] was fetched at `cpu.pc - 1`:
    /// run the hooked code, using as many cycles as a [`Cpu::run`] with
    /// `room` left would. Returns the cycles used, 0 if there is no hook
    /// (the opcode is then undefined).
    fn trap(&mut self, _cpu: &mut Cpu, _room: u32) -> u32 {
        0
    }
}

pub const CC_E: u8 = 0x80;
pub const CC_F: u8 = 0x40;
pub const CC_H: u8 = 0x20;
pub const CC_I: u8 = 0x10;
pub const CC_N: u8 = 0x08;
pub const CC_Z: u8 = 0x04;
pub const CC_V: u8 = 0x02;
pub const CC_C: u8 = 0x01;

const VEC_SWI3: u16 = 0xFFF2;
const VEC_SWI2: u16 = 0xFFF4;
const VEC_FIRQ: u16 = 0xFFF6;
const VEC_IRQ: u16 = 0xFFF8;
const VEC_SWI: u16 = 0xFFFA;
const VEC_NMI: u16 = 0xFFFC;
const VEC_RESET: u16 = 0xFFFE;

/// Addressing modes, as opcode bits 5:4 of the 0x80-0xFF group.
const IMM: u8 = 0;
const DIR: u8 = 1;
const IDX: u8 = 2;
const EXT: u8 = 3;

/// 16-bit registers, for [`Cpu::reg16`].
const RD: u8 = 0;
const RX: u8 = 1;
const RY: u8 = 2;
const RU: u8 = 3;
const RS: u8 = 4;

#[derive(Clone, Copy, PartialEq, Eq, Debug)]
enum Wait {
    Run,
    /// CWAI: state already stacked, waiting for an unmasked interrupt.
    Cwai,
    /// SYNC: waiting for any interrupt line.
    Sync,
}

#[derive(Clone, Debug)]
pub struct Cpu {
    pub a: u8,
    pub b: u8,
    pub dp: u8,
    pub cc: u8,
    pub x: u16,
    pub y: u16,
    pub u: u16,
    pub s: u16,
    pub pc: u16,
    /// Total E cycles executed.
    pub cycles: u64,
    /// IRQ input level (true = asserted).
    irq: bool,
    /// FIRQ input level (true = asserted).
    firq: bool,
    nmi_pending: bool,
    /// NMI is ignored after reset until S has been loaded.
    nmi_armed: bool,
    wait: Wait,
    /// An NMI is pending, an unmasked interrupt line is up, or the CPU waits
    /// (CWAI, SYNC): look at interrupts before the next instruction. Kept up
    /// to date when the lines change and by instructions that can unmask
    /// (ANDCC, RTI, PULS/PULU CC, TFR/EXG to CC); masking leaves it set, and
    /// [`Cpu::attend`] clears it.
    attn: bool,
    /// The next byte of the current instruction (see [`Bus::code_ptr`]).
    fp: *const u8,
    /// The current instruction's bytes, when they are not in plain memory.
    buf: [u8; 5],
    /// Number of undefined opcodes executed (treated as NOPs).
    pub illegal: u32,
    /// Address of the last undefined opcode.
    pub last_illegal: u16,
}

impl Default for Cpu {
    fn default() -> Self {
        Self::new()
    }
}

/// Bytes moved by PSHS/PSHU/PULS/PULU, by post-byte.
const STACK_BYTES: [u8; 256] = {
    let mut t = [0; 256];
    let mut i = 0;
    while i < 256 {
        t[i] = ((i as u8 & 0xF0).count_ones() * 2 + (i as u8 & 0x0F).count_ones()) as u8;
        i += 1;
    }
    t
};

/// Indexed-mode extra cycles, as a function of the post-byte low nibble.
const IDX_CYCLES: [u8; 16] = [2, 3, 2, 3, 0, 1, 1, 0, 1, 4, 0, 4, 1, 5, 0, 5];

/// Read-modify-write operations (low opcode nibble of 0x00-0x0F, 0x40-0x7F).
type Rmw = fn(&mut Cpu, u8) -> u8;

impl Cpu {
    pub const fn new() -> Self {
        Cpu {
            a: 0,
            b: 0,
            dp: 0,
            cc: CC_I | CC_F,
            x: 0,
            y: 0,
            u: 0,
            s: 0,
            pc: 0,
            cycles: 0,
            irq: false,
            firq: false,
            nmi_pending: false,
            nmi_armed: false,
            wait: Wait::Run,
            attn: false,
            fp: core::ptr::null(),
            buf: [0; 5],
            illegal: 0,
            last_illegal: 0,
        }
    }

    pub fn reset<B: Bus>(&mut self, bus: &mut B) {
        self.dp = 0;
        self.cc = CC_I | CC_F;
        self.nmi_pending = false;
        self.nmi_armed = false;
        self.wait = Wait::Run;
        self.update_attn();
        self.pc = read16(bus, VEC_RESET);
    }

    /// Raise an NMI edge.
    pub fn nmi(&mut self) {
        self.nmi_pending = true;
        self.attn = true;
    }

    /// The FIRQ and IRQ input levels (true = asserted).
    pub fn set_lines(&mut self, firq: bool, irq: bool) {
        self.firq = firq;
        self.irq = irq;
        self.update_attn();
    }

    #[inline(always)]
    fn update_attn(&mut self) {
        self.attn = self.nmi_pending
            | (self.firq & (self.cc & CC_F == 0))
            | (self.irq & (self.cc & CC_I == 0))
            | (self.wait != Wait::Run);
    }

    #[inline(always)]
    pub fn d(&self) -> u16 {
        ((self.a as u16) << 8) | self.b as u16
    }

    #[inline(always)]
    pub fn set_d(&mut self, v: u16) {
        self.a = (v >> 8) as u8;
        self.b = v as u8;
    }

    // -- flags --------------------------------------------------------------------

    #[inline(always)]
    fn nz8(&mut self, v: u8) {
        self.cc = (self.cc & !(CC_N | CC_Z)) | (v >> 4 & CC_N) | ((v == 0) as u8) << 2;
    }

    #[inline(always)]
    fn nz16(&mut self, v: u16) {
        self.cc = (self.cc & !(CC_N | CC_Z)) | ((v >> 12) as u8 & CC_N) | ((v == 0) as u8) << 2;
    }

    /// N, Z set; V cleared (loads, stores, logic ops).
    #[inline(always)]
    pub(crate) fn nz8_v0(&mut self, v: u8) {
        self.cc = (self.cc & !(CC_N | CC_Z | CC_V)) | (v >> 4 & CC_N) | ((v == 0) as u8) << 2;
    }

    #[inline(always)]
    pub(crate) fn nz16_v0(&mut self, v: u16) {
        self.cc = (self.cc & !(CC_N | CC_Z | CC_V)) | ((v >> 12) as u8 & CC_N) | ((v == 0) as u8) << 2;
    }

    #[inline(always)]
    fn carry(&self) -> u8 {
        self.cc & CC_C
    }

    #[inline(always)]
    fn add8(&mut self, a: u8, b: u8, carry: u8) -> u8 {
        let r = a as u32 + b as u32 + carry as u32;
        let r8 = r as u8;
        self.cc = (self.cc & !(CC_H | CC_N | CC_Z | CC_V | CC_C))
            | ((a ^ b ^ r8) & 0x10) << 1
            | (r8 >> 4 & CC_N)
            | ((r8 == 0) as u8) << 2
            | ((a ^ r8) & (b ^ r8)) >> 6 & CC_V
            | (r >> 8) as u8 & CC_C;
        r8
    }

    /// H is left as it was (undefined after subtraction).
    #[inline(always)]
    pub(crate) fn sub8(&mut self, a: u8, b: u8, borrow: u8) -> u8 {
        let r = (a as u32).wrapping_sub(b as u32).wrapping_sub(borrow as u32);
        let r8 = r as u8;
        self.cc = (self.cc & !(CC_N | CC_Z | CC_V | CC_C))
            | (r8 >> 4 & CC_N)
            | ((r8 == 0) as u8) << 2
            | ((a ^ b) & (a ^ r8)) >> 6 & CC_V
            | (r >> 8) as u8 & CC_C;
        r8
    }

    #[inline(always)]
    fn add16(&mut self, a: u16, b: u16) -> u16 {
        let r = a as u32 + b as u32;
        let r16 = r as u16;
        self.cc = (self.cc & !(CC_N | CC_Z | CC_V | CC_C))
            | ((r16 >> 12) as u8 & CC_N)
            | ((r16 == 0) as u8) << 2
            | (((a ^ r16) & (b ^ r16)) >> 14) as u8 & CC_V
            | (r >> 16) as u8 & CC_C;
        r16
    }

    #[inline(always)]
    pub(crate) fn sub16(&mut self, a: u16, b: u16) -> u16 {
        let r = (a as u32).wrapping_sub(b as u32);
        let r16 = r as u16;
        self.cc = (self.cc & !(CC_N | CC_Z | CC_V | CC_C))
            | ((r16 >> 12) as u8 & CC_N)
            | ((r16 == 0) as u8) << 2
            | (((a ^ b) & (a ^ r16)) >> 14) as u8 & CC_V
            | (r >> 16) as u8 & CC_C;
        r16
    }

    // -- read-modify-write operations ---------------------------------------------

    fn neg(&mut self, v: u8) -> u8 {
        self.sub8(0, v, 0)
    }

    fn com(&mut self, v: u8) -> u8 {
        let r = !v;
        self.nz8_v0(r);
        self.cc |= CC_C;
        r
    }

    pub(crate) fn lsr(&mut self, v: u8) -> u8 {
        let r = v >> 1;
        self.cc = (self.cc & !CC_C) | (v & 1);
        self.nz8(r);
        r
    }

    pub(crate) fn ror(&mut self, v: u8) -> u8 {
        let r = (v >> 1) | (self.carry() << 7);
        self.cc = (self.cc & !CC_C) | (v & 1);
        self.nz8(r);
        r
    }

    fn asr(&mut self, v: u8) -> u8 {
        let r = (v >> 1) | (v & 0x80);
        self.cc = (self.cc & !CC_C) | (v & 1);
        self.nz8(r);
        r
    }

    fn asl(&mut self, v: u8) -> u8 {
        let r = v << 1;
        self.cc = (self.cc & !(CC_C | CC_V)) | (v >> 7) | ((v ^ r) >> 6 & CC_V);
        self.nz8(r);
        r
    }

    pub(crate) fn rol(&mut self, v: u8) -> u8 {
        let r = (v << 1) | self.carry();
        self.cc = (self.cc & !(CC_C | CC_V)) | (v >> 7) | ((v ^ (v << 1)) >> 6 & CC_V);
        self.nz8(r);
        r
    }

    pub(crate) fn dec(&mut self, v: u8) -> u8 {
        let r = v.wrapping_sub(1);
        self.cc = (self.cc & !CC_V) | ((v == 0x80) as u8) << 1;
        self.nz8(r);
        r
    }

    pub(crate) fn inc(&mut self, v: u8) -> u8 {
        let r = v.wrapping_add(1);
        self.cc = (self.cc & !CC_V) | ((v == 0x7F) as u8) << 1;
        self.nz8(r);
        r
    }

    pub(crate) fn tst(&mut self, v: u8) -> u8 {
        self.nz8_v0(v);
        v
    }

    pub(crate) fn clr(&mut self, _v: u8) -> u8 {
        self.cc = (self.cc & !(CC_N | CC_V | CC_C)) | CC_Z;
        0
    }

    /// Undefined opcodes 0x?2 and JMP on an accumulator: no change.
    fn keep(&mut self, v: u8) -> u8 {
        v
    }

    // -- 8-bit accumulator operations ------------------------------------------------

    #[inline(always)]
    fn sub(&mut self, acc: u8, m: u8) -> u8 {
        self.sub8(acc, m, 0)
    }

    #[inline(always)]
    fn cmp(&mut self, acc: u8, m: u8) -> u8 {
        self.sub8(acc, m, 0);
        acc
    }

    #[inline(always)]
    fn sbc(&mut self, acc: u8, m: u8) -> u8 {
        let c = self.carry();
        self.sub8(acc, m, c)
    }

    #[inline(always)]
    pub(crate) fn and(&mut self, acc: u8, m: u8) -> u8 {
        let r = acc & m;
        self.nz8_v0(r);
        r
    }

    #[inline(always)]
    fn bit(&mut self, acc: u8, m: u8) -> u8 {
        self.nz8_v0(acc & m);
        acc
    }

    #[inline(always)]
    pub(crate) fn ld(&mut self, _acc: u8, m: u8) -> u8 {
        self.nz8_v0(m);
        m
    }

    #[inline(always)]
    fn eor(&mut self, acc: u8, m: u8) -> u8 {
        let r = acc ^ m;
        self.nz8_v0(r);
        r
    }

    #[inline(always)]
    fn adc(&mut self, acc: u8, m: u8) -> u8 {
        let c = self.carry();
        self.add8(acc, m, c)
    }

    #[inline(always)]
    pub(crate) fn or(&mut self, acc: u8, m: u8) -> u8 {
        let r = acc | m;
        self.nz8_v0(r);
        r
    }

    #[inline(always)]
    pub(crate) fn add(&mut self, acc: u8, m: u8) -> u8 {
        self.add8(acc, m, 0)
    }

    // -- fetch / stack ------------------------------------------------------------

    /// The next byte of the current instruction.
    #[inline(always)]
    fn fetch8<B: Bus>(&mut self, _bus: &mut B) -> u8 {
        // SAFETY: `fp` points into the instruction's 5 bytes (code_ptr or
        // buf), set before the instruction, and no instruction is longer.
        let v = unsafe { *self.fp };
        self.fp = unsafe { self.fp.add(1) };
        self.pc = self.pc.wrapping_add(1);
        v
    }

    /// The instruction's bytes in `buf` (not in plain memory).
    #[cold]
    #[inline(never)]
    fn fill<B: Bus>(&mut self, bus: &mut B) -> *const u8 {
        for i in 0..5 {
            self.buf[i] = bus.peek(self.pc.wrapping_add(i as u16));
        }
        self.buf.as_ptr()
    }

    #[inline(always)]
    fn fetch16<B: Bus>(&mut self, bus: &mut B) -> u16 {
        let hi = self.fetch8(bus) as u16;
        let lo = self.fetch8(bus) as u16;
        (hi << 8) | lo
    }

    #[inline(always)]
    fn push8_s<B: Bus>(&mut self, bus: &mut B, v: u8) {
        self.s = self.s.wrapping_sub(1);
        bus.wr(self.s, v);
    }

    #[inline(always)]
    pub(crate) fn push16_s<B: Bus>(&mut self, bus: &mut B, v: u16) {
        self.push8_s(bus, v as u8);
        self.push8_s(bus, (v >> 8) as u8);
    }

    #[inline(always)]
    fn pull8_s<B: Bus>(&mut self, bus: &mut B) -> u8 {
        let v = bus.rd(self.s);
        self.s = self.s.wrapping_add(1);
        v
    }

    #[inline(always)]
    pub(crate) fn pull16_s<B: Bus>(&mut self, bus: &mut B) -> u16 {
        let hi = self.pull8_s(bus) as u16;
        let lo = self.pull8_s(bus) as u16;
        (hi << 8) | lo
    }

    /// Push the whole register file (as for IRQ/NMI/SWI with E set).
    fn push_entire<B: Bus>(&mut self, bus: &mut B) {
        self.push_regs(bus, 0xFF, false);
    }

    /// PSHS/PSHU. Returns the number of bytes pushed.
    #[inline(never)]
    fn push_regs<B: Bus>(&mut self, bus: &mut B, mask: u8, user: bool) -> u32 {
        let sp = if user { self.u } else { self.s };
        let n = STACK_BYTES[mask as usize] as u16;
        let lo = sp.wrapping_sub(n);
        let p = if lo <= sp { bus.mem_ptr(lo, n) } else { core::ptr::null_mut() };
        if p.is_null() {
            return self.push_regs_slow(bus, mask, user);
        }
        // The stack is in RAM: write the bytes as the pushes leave them,
        // lowest address first.
        let mut i = 0;
        // SAFETY: mem_ptr gave n bytes, and the mask pushes n.
        let mut put = |v: u8| unsafe {
            *p.add(i) = v;
            i += 1;
        };
        if mask & 0x01 != 0 {
            put(self.cc);
        }
        if mask & 0x02 != 0 {
            put(self.a);
        }
        if mask & 0x04 != 0 {
            put(self.b);
        }
        if mask & 0x08 != 0 {
            put(self.dp);
        }
        if mask & 0x10 != 0 {
            put((self.x >> 8) as u8);
            put(self.x as u8);
        }
        if mask & 0x20 != 0 {
            put((self.y >> 8) as u8);
            put(self.y as u8);
        }
        if mask & 0x40 != 0 {
            let other = if user { self.s } else { self.u };
            put((other >> 8) as u8);
            put(other as u8);
        }
        if mask & 0x80 != 0 {
            put((self.pc >> 8) as u8);
            put(self.pc as u8);
        }
        if user {
            self.u = lo;
        } else {
            self.s = lo;
        }
        n as u32
    }

    /// PSHS/PSHU a byte at a time, through the bus.
    #[cold]
    #[inline(never)]
    fn push_regs_slow<B: Bus>(&mut self, bus: &mut B, mask: u8, user: bool) -> u32 {
        let mut sp = if user { self.u } else { self.s };
        let start = sp;
        let mut put = |bus: &mut B, v: u8| {
            sp = sp.wrapping_sub(1);
            bus.wr(sp, v);
        };
        if mask & 0x80 != 0 {
            put(bus, self.pc as u8);
            put(bus, (self.pc >> 8) as u8);
        }
        if mask & 0x40 != 0 {
            let other = if user { self.s } else { self.u };
            put(bus, other as u8);
            put(bus, (other >> 8) as u8);
        }
        if mask & 0x20 != 0 {
            put(bus, self.y as u8);
            put(bus, (self.y >> 8) as u8);
        }
        if mask & 0x10 != 0 {
            put(bus, self.x as u8);
            put(bus, (self.x >> 8) as u8);
        }
        if mask & 0x08 != 0 {
            put(bus, self.dp);
        }
        if mask & 0x04 != 0 {
            put(bus, self.b);
        }
        if mask & 0x02 != 0 {
            put(bus, self.a);
        }
        if mask & 0x01 != 0 {
            put(bus, self.cc);
        }
        if user {
            self.u = sp;
        } else {
            self.s = sp;
        }
        start.wrapping_sub(sp) as u32
    }

    /// PULS/PULU. Returns the number of bytes pulled.
    #[inline(never)]
    fn pull_regs<B: Bus>(&mut self, bus: &mut B, mask: u8, user: bool) -> u32 {
        let sp = if user { self.u } else { self.s };
        let n = STACK_BYTES[mask as usize] as u16;
        let p = if sp.checked_add(n).is_some() { bus.mem_ptr(sp, n) } else { core::ptr::null_mut() };
        if p.is_null() {
            return self.pull_regs_slow(bus, mask, user);
        }
        let mut i = 0;
        // SAFETY: mem_ptr gave n bytes, and the mask pulls n.
        let mut get = || -> u8 {
            let v = unsafe { *p.add(i) };
            i += 1;
            v
        };
        if mask & 0x01 != 0 {
            self.cc = get();
            self.update_attn();
        }
        if mask & 0x02 != 0 {
            self.a = get();
        }
        if mask & 0x04 != 0 {
            self.b = get();
        }
        if mask & 0x08 != 0 {
            self.dp = get();
        }
        if mask & 0x10 != 0 {
            let hi = get() as u16;
            self.x = (hi << 8) | get() as u16;
        }
        if mask & 0x20 != 0 {
            let hi = get() as u16;
            self.y = (hi << 8) | get() as u16;
        }
        if mask & 0x40 != 0 {
            let hi = get() as u16;
            let v = (hi << 8) | get() as u16;
            if user {
                self.s = v;
                self.nmi_armed = true;
            } else {
                self.u = v;
            }
        }
        if mask & 0x80 != 0 {
            let hi = get() as u16;
            self.pc = (hi << 8) | get() as u16;
        }
        if user {
            self.u = sp.wrapping_add(n);
        } else {
            self.s = sp.wrapping_add(n);
        }
        n as u32
    }

    /// PULS/PULU a byte at a time, through the bus.
    #[cold]
    #[inline(never)]
    fn pull_regs_slow<B: Bus>(&mut self, bus: &mut B, mask: u8, user: bool) -> u32 {
        let mut sp = if user { self.u } else { self.s };
        let start = sp;
        let mut get = |bus: &mut B| -> u8 {
            let v = bus.rd(sp);
            sp = sp.wrapping_add(1);
            v
        };
        if mask & 0x01 != 0 {
            self.cc = get(bus);
            self.update_attn();
        }
        if mask & 0x02 != 0 {
            self.a = get(bus);
        }
        if mask & 0x04 != 0 {
            self.b = get(bus);
        }
        if mask & 0x08 != 0 {
            self.dp = get(bus);
        }
        if mask & 0x10 != 0 {
            let hi = get(bus) as u16;
            self.x = (hi << 8) | get(bus) as u16;
        }
        if mask & 0x20 != 0 {
            let hi = get(bus) as u16;
            self.y = (hi << 8) | get(bus) as u16;
        }
        if mask & 0x40 != 0 {
            let hi = get(bus) as u16;
            let v = (hi << 8) | get(bus) as u16;
            if user {
                self.s = v;
                self.nmi_armed = true;
            } else {
                self.u = v;
            }
        }
        if mask & 0x80 != 0 {
            let hi = get(bus) as u16;
            self.pc = (hi << 8) | get(bus) as u16;
        }
        if user {
            self.u = sp;
        } else {
            self.s = sp;
        }
        sp.wrapping_sub(start) as u32
    }

    // -- addressing ---------------------------------------------------------------

    #[inline(always)]
    fn idx_reg(&self, post: u8) -> u16 {
        match (post >> 5) & 3 {
            0 => self.x,
            1 => self.y,
            2 => self.u,
            _ => self.s,
        }
    }

    #[inline(always)]
    fn set_idx_reg(&mut self, post: u8, v: u16) {
        match (post >> 5) & 3 {
            0 => self.x = v,
            1 => self.y = v,
            2 => self.u = v,
            _ => {
                self.s = v;
                self.nmi_armed = true;
            }
        }
    }

    /// Indexed effective address. Returns (address, extra cycles).
    #[inline(never)]
    fn ea_indexed<B: Bus>(&mut self, bus: &mut B) -> (u16, u32) {
        let post = self.fetch8(bus);
        let r = self.idx_reg(post);
        if post & 0x80 == 0 {
            // 5-bit signed offset
            let off = ((post << 3) as i8 >> 3) as i16 as u16;
            return (r.wrapping_add(off), 1);
        }
        let mode = post & 0x0F;
        let ea = match mode {
            0x0 => {
                self.set_idx_reg(post, r.wrapping_add(1));
                r
            }
            0x1 => {
                self.set_idx_reg(post, r.wrapping_add(2));
                r
            }
            0x2 => {
                let v = r.wrapping_sub(1);
                self.set_idx_reg(post, v);
                v
            }
            0x3 => {
                let v = r.wrapping_sub(2);
                self.set_idx_reg(post, v);
                v
            }
            0x4 => r,
            0x5 => r.wrapping_add(self.b as i8 as i16 as u16),
            0x6 => r.wrapping_add(self.a as i8 as i16 as u16),
            0x8 => {
                let off = self.fetch8(bus) as i8 as i16 as u16;
                r.wrapping_add(off)
            }
            0x9 => {
                let off = self.fetch16(bus);
                r.wrapping_add(off)
            }
            0xB => r.wrapping_add(self.d()),
            0xC => {
                let off = self.fetch8(bus) as i8 as i16 as u16;
                self.pc.wrapping_add(off)
            }
            0xD => {
                let off = self.fetch16(bus);
                self.pc.wrapping_add(off)
            }
            0xF => self.fetch16(bus),
            _ => {
                self.illegal += 1;
                r
            }
        };
        let mut extra = IDX_CYCLES[mode as usize] as u32;
        if post & 0x10 != 0 {
            extra += 3;
            if mode == 0xF {
                extra = 5;
            }
            return (read16(bus, ea), extra);
        }
        (ea, extra)
    }

    /// Effective address in memory mode `M`. Returns (ea, extra cycles).
    #[inline(always)]
    fn ea<const M: u8, B: Bus>(&mut self, bus: &mut B) -> (u16, u32) {
        match M {
            DIR => (((self.dp as u16) << 8) | self.fetch8(bus) as u16, 0),
            IDX => self.ea_indexed(bus),
            _ => (self.fetch16(bus), 0),
        }
    }

    /// 8-bit operand in mode `M`, and the cycles of a load from it.
    #[inline(always)]
    fn opnd8<const M: u8, B: Bus>(&mut self, bus: &mut B) -> (u8, u32) {
        if M == IMM {
            return (self.fetch8(bus), 2);
        }
        let (ea, x) = self.ea::<M, B>(bus);
        (bus.rd(ea), (if M == EXT { 5 } else { 4 }) + x)
    }

    /// 16-bit operand in mode `M`; `cyc` the base cycles for imm, dir, idx,
    /// ext.
    #[inline(always)]
    fn opnd16<const M: u8, B: Bus>(&mut self, bus: &mut B, cyc: [u32; 4]) -> (u16, u32) {
        if M == IMM {
            return (self.fetch16(bus), cyc[0]);
        }
        let (ea, x) = self.ea::<M, B>(bus);
        (read16(bus, ea), cyc[M as usize] + x)
    }

    /// Accumulator operation `f` on A or B with an operand in mode `M`.
    #[inline(always)]
    fn acc<const M: u8, const B_ACC: bool, B: Bus>(&mut self, bus: &mut B, f: fn(&mut Self, u8, u8) -> u8) -> u32 {
        let (m, c) = self.opnd8::<M, B>(bus);
        if B_ACC {
            self.b = f(self, self.b, m);
        } else {
            self.a = f(self, self.a, m);
        }
        c
    }

    /// STA / STB in mode `M`.
    #[inline(always)]
    fn st8<const M: u8, const B_ACC: bool, B: Bus>(&mut self, bus: &mut B) -> u32 {
        let (ea, x) = self.ea::<M, B>(bus);
        let v = if B_ACC { self.b } else { self.a };
        self.nz8_v0(v);
        bus.wr(ea, v);
        (if M == EXT { 5 } else { 4 }) + x
    }

    /// 16-bit register `R`.
    #[inline(always)]
    fn reg16<const R: u8>(&self) -> u16 {
        match R {
            RD => self.d(),
            RX => self.x,
            RY => self.y,
            RU => self.u,
            _ => self.s,
        }
    }

    /// Store register `R` in mode `M` (its value after any auto-increment or
    /// decrement of the address); `base` the direct-mode cycles (extended
    /// takes one more).
    #[inline(always)]
    fn st16<const M: u8, const R: u8, B: Bus>(&mut self, bus: &mut B, base: u32) -> u32 {
        let (ea, x) = self.ea::<M, B>(bus);
        let v = self.reg16::<R>();
        self.nz16_v0(v);
        write16(bus, ea, v);
        base + (M == EXT) as u32 + x
    }

    /// Memory read-modify-write in mode `M` (6 cycles, extended 7).
    #[inline(always)]
    fn rmw<const M: u8, B: Bus>(&mut self, bus: &mut B, f: Rmw) -> u32 {
        let (ea, x) = self.ea::<M, B>(bus);
        let v = bus.rd(ea);
        let r = f(self, v);
        bus.wr(ea, r);
        (if M == EXT { 7 } else { 6 }) + x
    }

    #[inline(always)]
    fn tst_mem<const M: u8, B: Bus>(&mut self, bus: &mut B) -> u32 {
        let (ea, x) = self.ea::<M, B>(bus);
        let v = bus.rd(ea);
        self.nz8_v0(v);
        (if M == EXT { 7 } else { 6 }) + x
    }

    #[inline(always)]
    fn clr_mem<const M: u8, B: Bus>(&mut self, bus: &mut B) -> u32 {
        let (ea, x) = self.ea::<M, B>(bus);
        self.clr(0);
        bus.wr(ea, 0);
        (if M == EXT { 7 } else { 6 }) + x
    }

    #[inline(always)]
    fn jmp<const M: u8, B: Bus>(&mut self, bus: &mut B) -> u32 {
        let (ea, x) = self.ea::<M, B>(bus);
        self.pc = ea;
        (if M == EXT { 4 } else { 3 }) + x
    }

    #[inline(always)]
    fn jsr<const M: u8, B: Bus>(&mut self, bus: &mut B) -> u32 {
        let (ea, x) = self.ea::<M, B>(bus);
        self.push16_s(bus, self.pc);
        self.pc = ea;
        (if M == EXT { 8 } else { 7 }) + x
    }

    // -- register transfer --------------------------------------------------------

    fn reg_get(&self, r: u8) -> u16 {
        match r {
            0x0 => self.d(),
            0x1 => self.x,
            0x2 => self.y,
            0x3 => self.u,
            0x4 => self.s,
            0x5 => self.pc,
            0x8 => 0xFF00 | self.a as u16,
            0x9 => 0xFF00 | self.b as u16,
            0xA => 0xFF00 | self.cc as u16,
            0xB => 0xFF00 | self.dp as u16,
            _ => 0xFFFF,
        }
    }

    fn reg_set(&mut self, r: u8, v: u16) {
        match r {
            0x0 => self.set_d(v),
            0x1 => self.x = v,
            0x2 => self.y = v,
            0x3 => self.u = v,
            0x4 => {
                self.s = v;
                self.nmi_armed = true;
            }
            0x5 => self.pc = v,
            0x8 => self.a = v as u8,
            0x9 => self.b = v as u8,
            0xA => {
                self.cc = v as u8;
                self.update_attn();
            }
            0xB => self.dp = v as u8,
            _ => {}
        }
    }

    // -- branches -----------------------------------------------------------------

    /// Branch condition `C` (low opcode nibble).
    #[inline(always)]
    fn cond<const C: u8>(&self) -> bool {
        let cc = self.cc;
        let n = cc & CC_N != 0;
        let z = cc & CC_Z != 0;
        let v = cc & CC_V != 0;
        let c = cc & CC_C != 0;
        match C {
            0x0 => true,
            0x1 => false,
            0x2 => !(c || z),
            0x3 => c || z,
            0x4 => !c,
            0x5 => c,
            0x6 => !z,
            0x7 => z,
            0x8 => !v,
            0x9 => v,
            0xA => !n,
            0xB => n,
            0xC => n == v,
            0xD => n != v,
            0xE => !z && (n == v),
            _ => z || (n != v),
        }
    }

    #[inline(always)]
    fn branch<const C: u8, B: Bus>(&mut self, bus: &mut B) -> u32 {
        let off = self.fetch8(bus) as i8 as i16 as u16;
        if self.cond::<C>() {
            self.pc = self.pc.wrapping_add(off);
        }
        3
    }

    #[inline(always)]
    fn lbranch<const C: u8, B: Bus>(&mut self, bus: &mut B) -> u32 {
        let off = self.fetch16(bus);
        if self.cond::<C>() {
            self.pc = self.pc.wrapping_add(off);
            6
        } else {
            5
        }
    }

    // -- interrupts ---------------------------------------------------------------

    #[inline(never)]
    fn take_interrupt<B: Bus>(&mut self, bus: &mut B) -> u32 {
        if self.nmi_pending && self.nmi_armed {
            self.nmi_pending = false;
            let stacked = self.wait == Wait::Cwai;
            self.wait = Wait::Run;
            if !stacked {
                self.cc |= CC_E;
                self.push_entire(bus);
            }
            self.cc |= CC_I | CC_F;
            self.pc = read16(bus, VEC_NMI);
            return if stacked { 7 } else { 19 };
        }
        if self.firq && self.cc & CC_F == 0 {
            let stacked = self.wait == Wait::Cwai;
            self.wait = Wait::Run;
            if !stacked {
                self.cc &= !CC_E;
                self.push16_s(bus, self.pc);
                self.push8_s(bus, self.cc);
            }
            self.cc |= CC_I | CC_F;
            self.pc = read16(bus, VEC_FIRQ);
            return if stacked { 7 } else { 10 };
        }
        if self.irq && self.cc & CC_I == 0 {
            let stacked = self.wait == Wait::Cwai;
            self.wait = Wait::Run;
            if !stacked {
                self.cc |= CC_E;
                self.push_entire(bus);
            }
            self.cc |= CC_I;
            self.pc = read16(bus, VEC_IRQ);
            return if stacked { 7 } else { 19 };
        }
        0
    }

    /// Something needs attention ([`Cpu::attn`]): take an interrupt or wait
    /// a cycle, or return 0 to execute the next instruction.
    #[inline(never)]
    fn attend<B: Bus>(&mut self, bus: &mut B) -> u32 {
        let mut c = 0;
        if self.nmi_pending | self.firq | self.irq {
            c = self.take_interrupt(bus);
        }
        if c == 0 {
            c = match self.wait {
                Wait::Run => 0,
                Wait::Cwai => 1,
                Wait::Sync => {
                    // Any interrupt line (even masked) ends SYNC.
                    if self.nmi_pending || self.firq || self.irq {
                        self.wait = Wait::Run;
                        0
                    } else {
                        1
                    }
                }
            };
        }
        self.update_attn();
        c
    }

    pub(crate) fn rti<B: Bus>(&mut self, bus: &mut B) -> u32 {
        self.cc = self.pull8_s(bus);
        self.update_attn();
        if self.cc & CC_E != 0 {
            // A, B, DP, X, Y, U, PC
            self.pull_regs(bus, 0xFE, false);
            15
        } else {
            self.pc = self.pull16_s(bus);
            6
        }
    }

    fn swi<B: Bus>(&mut self, bus: &mut B, vector: u16, mask: bool) {
        self.cc |= CC_E;
        self.push_entire(bus);
        if mask {
            self.cc |= CC_I | CC_F;
        }
        self.pc = read16(bus, vector);
    }

    fn undefined(&mut self, len: u16) -> u32 {
        self.illegal += 1;
        self.last_illegal = self.pc.wrapping_sub(len);
        2
    }

    // -- execution ----------------------------------------------------------------

    /// Execute one instruction (or take one interrupt). Returns E cycles used.
    pub fn step<B: Bus>(&mut self, bus: &mut B) -> u32 {
        self.run(bus, 1)
    }

    /// Execute instructions until at least `budget` E cycles have been used
    /// (at least one instruction), or [`Bus::stop`] asks to return. Returns
    /// the cycles used.
    pub fn run<B: Bus>(&mut self, bus: &mut B, budget: u32) -> u32 {
        let mut used = 0;
        loop {
            bus.elapsed(used);
            let mut c = 0;
            if self.attn {
                c = self.attend(bus);
            }
            if c == 0 {
                let p = bus.code_ptr(self.pc);
                self.fp = if p.is_null() { self.fill(bus) } else { p };
                c = self.exec(bus, budget - used);
            }
            used += c;
            if used >= budget || bus.stop() {
                break;
            }
        }
        self.cycles += used as u64;
        used
    }

    /// One instruction; `room` is what is left of the run's budget.
    #[inline(always)]
    fn exec<B: Bus>(&mut self, bus: &mut B, room: u32) -> u32 {
        let op = self.fetch8(bus);
        match op {
            0x00 | 0x01 => self.rmw::<DIR, B>(bus, Self::neg),
            0x02 => self.rmw::<DIR, B>(bus, Self::keep),
            0x03 => self.rmw::<DIR, B>(bus, Self::com),
            0x04 | 0x05 => self.rmw::<DIR, B>(bus, Self::lsr),
            0x06 => self.rmw::<DIR, B>(bus, Self::ror),
            0x07 => self.rmw::<DIR, B>(bus, Self::asr),
            0x08 => self.rmw::<DIR, B>(bus, Self::asl),
            0x09 => self.rmw::<DIR, B>(bus, Self::rol),
            0x0A | 0x0B => self.rmw::<DIR, B>(bus, Self::dec),
            0x0C => self.rmw::<DIR, B>(bus, Self::inc),
            0x0D => self.tst_mem::<DIR, B>(bus),
            0x0E => self.jmp::<DIR, B>(bus),
            0x0F => self.clr_mem::<DIR, B>(bus),
            0x10 => self.exec_page1(bus),
            0x11 => self.exec_page2(bus),
            0x12 => 2, // NOP
            0x13 => {
                self.wait = Wait::Sync;
                self.attn = true;
                4
            }
            0x16 => {
                let off = self.fetch16(bus);
                self.pc = self.pc.wrapping_add(off);
                5
            }
            0x17 => {
                let off = self.fetch16(bus);
                self.push16_s(bus, self.pc);
                self.pc = self.pc.wrapping_add(off);
                9
            }
            0x19 => {
                // DAA
                let a = self.a;
                let mut cf: u16 = 0;
                let lsn = a & 0x0F;
                let msn = a >> 4;
                if self.cc & CC_H != 0 || lsn > 9 {
                    cf |= 0x06;
                }
                if self.cc & CC_C != 0 || msn > 9 || (msn > 8 && lsn > 9) {
                    cf |= 0x60;
                }
                let t = a as u16 + cf;
                self.a = t as u8;
                self.cc |= (t >> 8) as u8 & CC_C;
                self.nz8_v0(self.a);
                2
            }
            0x1A => {
                let m = self.fetch8(bus);
                self.cc |= m;
                3
            }
            0x1C => {
                let m = self.fetch8(bus);
                self.cc &= m;
                self.update_attn();
                3
            }
            0x1D => {
                // SEX
                self.a = ((self.b as i8) >> 7) as u8;
                self.nz16(self.d());
                2
            }
            0x1E => {
                let post = self.fetch8(bus);
                let (r1, r2) = (post >> 4, post & 0x0F);
                let v1 = self.reg_get(r1);
                let v2 = self.reg_get(r2);
                self.reg_set(r1, v2);
                self.reg_set(r2, v1);
                8
            }
            0x1F => {
                let post = self.fetch8(bus);
                let v = self.reg_get(post >> 4);
                self.reg_set(post & 0x0F, v);
                6
            }
            0x20 => self.branch::<0x0, B>(bus),
            0x21 => self.branch::<0x1, B>(bus),
            0x22 => self.branch::<0x2, B>(bus),
            0x23 => self.branch::<0x3, B>(bus),
            0x24 => self.branch::<0x4, B>(bus),
            0x25 => self.branch::<0x5, B>(bus),
            0x26 => self.branch::<0x6, B>(bus),
            0x27 => self.branch::<0x7, B>(bus),
            0x28 => self.branch::<0x8, B>(bus),
            0x29 => self.branch::<0x9, B>(bus),
            0x2A => self.branch::<0xA, B>(bus),
            0x2B => self.branch::<0xB, B>(bus),
            0x2C => self.branch::<0xC, B>(bus),
            0x2D => self.branch::<0xD, B>(bus),
            0x2E => self.branch::<0xE, B>(bus),
            0x2F => self.branch::<0xF, B>(bus),
            0x30 => {
                let (ea, x) = self.ea_indexed(bus);
                self.x = ea;
                self.cc = (self.cc & !CC_Z) | ((ea == 0) as u8) << 2;
                4 + x
            }
            0x31 => {
                let (ea, x) = self.ea_indexed(bus);
                self.y = ea;
                self.cc = (self.cc & !CC_Z) | ((ea == 0) as u8) << 2;
                4 + x
            }
            0x32 => {
                let (ea, x) = self.ea_indexed(bus);
                self.s = ea;
                self.nmi_armed = true;
                4 + x
            }
            0x33 => {
                let (ea, x) = self.ea_indexed(bus);
                self.u = ea;
                4 + x
            }
            0x34 => {
                let m = self.fetch8(bus);
                5 + self.push_regs(bus, m, false)
            }
            0x35 => {
                let m = self.fetch8(bus);
                5 + self.pull_regs(bus, m, false)
            }
            0x36 => {
                let m = self.fetch8(bus);
                5 + self.push_regs(bus, m, true)
            }
            0x37 => {
                let m = self.fetch8(bus);
                5 + self.pull_regs(bus, m, true)
            }
            0x39 => {
                self.pc = self.pull16_s(bus);
                5
            }
            0x3A => {
                self.x = self.x.wrapping_add(self.b as u16);
                3
            }
            0x3B => self.rti(bus),
            0x3C => {
                let m = self.fetch8(bus);
                self.cc &= m;
                self.cc |= CC_E;
                self.push_entire(bus);
                self.wait = Wait::Cwai;
                self.attn = true;
                20
            }
            0x3D => {
                let r = self.a as u16 * self.b as u16;
                self.set_d(r);
                self.cc = (self.cc & !(CC_Z | CC_C)) | ((r == 0) as u8) << 2 | (r >> 7) as u8 & CC_C;
                11
            }
            0x3F => {
                self.swi(bus, VEC_SWI, true);
                19
            }
            0x18 => match bus.trap(self, room) {
                0 => self.undefined(1),
                c => c,
            },
            0x14 | 0x15 | 0x1B | 0x38 | 0x3E => self.undefined(1),

            0x40 | 0x41 => {
                self.a = self.neg(self.a);
                2
            }
            0x42 | 0x4E => 2,
            0x43 => {
                self.a = self.com(self.a);
                2
            }
            0x44 | 0x45 => {
                self.a = self.lsr(self.a);
                2
            }
            0x46 => {
                self.a = self.ror(self.a);
                2
            }
            0x47 => {
                self.a = self.asr(self.a);
                2
            }
            0x48 => {
                self.a = self.asl(self.a);
                2
            }
            0x49 => {
                self.a = self.rol(self.a);
                2
            }
            0x4A | 0x4B => {
                self.a = self.dec(self.a);
                2
            }
            0x4C => {
                self.a = self.inc(self.a);
                2
            }
            0x4D => {
                self.tst(self.a);
                2
            }
            0x4F => {
                self.a = self.clr(self.a);
                2
            }
            0x50 | 0x51 => {
                self.b = self.neg(self.b);
                2
            }
            0x52 | 0x5E => 2,
            0x53 => {
                self.b = self.com(self.b);
                2
            }
            0x54 | 0x55 => {
                self.b = self.lsr(self.b);
                2
            }
            0x56 => {
                self.b = self.ror(self.b);
                2
            }
            0x57 => {
                self.b = self.asr(self.b);
                2
            }
            0x58 => {
                self.b = self.asl(self.b);
                2
            }
            0x59 => {
                self.b = self.rol(self.b);
                2
            }
            0x5A | 0x5B => {
                self.b = self.dec(self.b);
                2
            }
            0x5C => {
                self.b = self.inc(self.b);
                2
            }
            0x5D => {
                self.tst(self.b);
                2
            }
            0x5F => {
                self.b = self.clr(self.b);
                2
            }

            0x60 | 0x61 => self.rmw::<IDX, B>(bus, Self::neg),
            0x62 => self.rmw::<IDX, B>(bus, Self::keep),
            0x63 => self.rmw::<IDX, B>(bus, Self::com),
            0x64 | 0x65 => self.rmw::<IDX, B>(bus, Self::lsr),
            0x66 => self.rmw::<IDX, B>(bus, Self::ror),
            0x67 => self.rmw::<IDX, B>(bus, Self::asr),
            0x68 => self.rmw::<IDX, B>(bus, Self::asl),
            0x69 => self.rmw::<IDX, B>(bus, Self::rol),
            0x6A | 0x6B => self.rmw::<IDX, B>(bus, Self::dec),
            0x6C => self.rmw::<IDX, B>(bus, Self::inc),
            0x6D => self.tst_mem::<IDX, B>(bus),
            0x6E => self.jmp::<IDX, B>(bus),
            0x6F => self.clr_mem::<IDX, B>(bus),
            0x70 | 0x71 => self.rmw::<EXT, B>(bus, Self::neg),
            0x72 => self.rmw::<EXT, B>(bus, Self::keep),
            0x73 => self.rmw::<EXT, B>(bus, Self::com),
            0x74 | 0x75 => self.rmw::<EXT, B>(bus, Self::lsr),
            0x76 => self.rmw::<EXT, B>(bus, Self::ror),
            0x77 => self.rmw::<EXT, B>(bus, Self::asr),
            0x78 => self.rmw::<EXT, B>(bus, Self::asl),
            0x79 => self.rmw::<EXT, B>(bus, Self::rol),
            0x7A | 0x7B => self.rmw::<EXT, B>(bus, Self::dec),
            0x7C => self.rmw::<EXT, B>(bus, Self::inc),
            0x7D => self.tst_mem::<EXT, B>(bus),
            0x7E => self.jmp::<EXT, B>(bus),
            0x7F => self.clr_mem::<EXT, B>(bus),

            0x80 => self.acc::<IMM, false, B>(bus, Self::sub),
            0x81 => self.acc::<IMM, false, B>(bus, Self::cmp),
            0x82 => self.acc::<IMM, false, B>(bus, Self::sbc),
            0x83 => self.subd::<IMM, B>(bus),
            0x84 => self.acc::<IMM, false, B>(bus, Self::and),
            0x85 => self.acc::<IMM, false, B>(bus, Self::bit),
            0x86 => self.acc::<IMM, false, B>(bus, Self::ld),
            0x87 => {
                self.illegal += 1;
                self.fetch8(bus);
                2
            }
            0x88 => self.acc::<IMM, false, B>(bus, Self::eor),
            0x89 => self.acc::<IMM, false, B>(bus, Self::adc),
            0x8A => self.acc::<IMM, false, B>(bus, Self::or),
            0x8B => self.acc::<IMM, false, B>(bus, Self::add),
            0x8C => self.cmpx::<IMM, B>(bus),
            0x8D => {
                // BSR
                let off = self.fetch8(bus) as i8 as i16 as u16;
                self.push16_s(bus, self.pc);
                self.pc = self.pc.wrapping_add(off);
                7
            }
            0x8E => self.ldx::<IMM, B>(bus),
            0x8F => {
                self.illegal += 1;
                self.fetch16(bus);
                2
            }
            0x90 => self.acc::<DIR, false, B>(bus, Self::sub),
            0x91 => self.acc::<DIR, false, B>(bus, Self::cmp),
            0x92 => self.acc::<DIR, false, B>(bus, Self::sbc),
            0x93 => self.subd::<DIR, B>(bus),
            0x94 => self.acc::<DIR, false, B>(bus, Self::and),
            0x95 => self.acc::<DIR, false, B>(bus, Self::bit),
            0x96 => self.acc::<DIR, false, B>(bus, Self::ld),
            0x97 => self.st8::<DIR, false, B>(bus),
            0x98 => self.acc::<DIR, false, B>(bus, Self::eor),
            0x99 => self.acc::<DIR, false, B>(bus, Self::adc),
            0x9A => self.acc::<DIR, false, B>(bus, Self::or),
            0x9B => self.acc::<DIR, false, B>(bus, Self::add),
            0x9C => self.cmpx::<DIR, B>(bus),
            0x9D => self.jsr::<DIR, B>(bus),
            0x9E => self.ldx::<DIR, B>(bus),
            0x9F => self.st16::<DIR, RX, B>(bus, 5),
            0xA0 => self.acc::<IDX, false, B>(bus, Self::sub),
            0xA1 => self.acc::<IDX, false, B>(bus, Self::cmp),
            0xA2 => self.acc::<IDX, false, B>(bus, Self::sbc),
            0xA3 => self.subd::<IDX, B>(bus),
            0xA4 => self.acc::<IDX, false, B>(bus, Self::and),
            0xA5 => self.acc::<IDX, false, B>(bus, Self::bit),
            0xA6 => self.acc::<IDX, false, B>(bus, Self::ld),
            0xA7 => self.st8::<IDX, false, B>(bus),
            0xA8 => self.acc::<IDX, false, B>(bus, Self::eor),
            0xA9 => self.acc::<IDX, false, B>(bus, Self::adc),
            0xAA => self.acc::<IDX, false, B>(bus, Self::or),
            0xAB => self.acc::<IDX, false, B>(bus, Self::add),
            0xAC => self.cmpx::<IDX, B>(bus),
            0xAD => self.jsr::<IDX, B>(bus),
            0xAE => self.ldx::<IDX, B>(bus),
            0xAF => self.st16::<IDX, RX, B>(bus, 5),
            0xB0 => self.acc::<EXT, false, B>(bus, Self::sub),
            0xB1 => self.acc::<EXT, false, B>(bus, Self::cmp),
            0xB2 => self.acc::<EXT, false, B>(bus, Self::sbc),
            0xB3 => self.subd::<EXT, B>(bus),
            0xB4 => self.acc::<EXT, false, B>(bus, Self::and),
            0xB5 => self.acc::<EXT, false, B>(bus, Self::bit),
            0xB6 => self.acc::<EXT, false, B>(bus, Self::ld),
            0xB7 => self.st8::<EXT, false, B>(bus),
            0xB8 => self.acc::<EXT, false, B>(bus, Self::eor),
            0xB9 => self.acc::<EXT, false, B>(bus, Self::adc),
            0xBA => self.acc::<EXT, false, B>(bus, Self::or),
            0xBB => self.acc::<EXT, false, B>(bus, Self::add),
            0xBC => self.cmpx::<EXT, B>(bus),
            0xBD => self.jsr::<EXT, B>(bus),
            0xBE => self.ldx::<EXT, B>(bus),
            0xBF => self.st16::<EXT, RX, B>(bus, 5),

            0xC0 => self.acc::<IMM, true, B>(bus, Self::sub),
            0xC1 => self.acc::<IMM, true, B>(bus, Self::cmp),
            0xC2 => self.acc::<IMM, true, B>(bus, Self::sbc),
            0xC3 => self.addd::<IMM, B>(bus),
            0xC4 => self.acc::<IMM, true, B>(bus, Self::and),
            0xC5 => self.acc::<IMM, true, B>(bus, Self::bit),
            0xC6 => self.acc::<IMM, true, B>(bus, Self::ld),
            0xC7 => {
                self.illegal += 1;
                self.fetch8(bus);
                2
            }
            0xC8 => self.acc::<IMM, true, B>(bus, Self::eor),
            0xC9 => self.acc::<IMM, true, B>(bus, Self::adc),
            0xCA => self.acc::<IMM, true, B>(bus, Self::or),
            0xCB => self.acc::<IMM, true, B>(bus, Self::add),
            0xCC => self.ldd::<IMM, B>(bus),
            0xCD | 0xCF => {
                self.illegal += 1;
                self.fetch16(bus);
                2
            }
            0xCE => self.ldu::<IMM, B>(bus),
            0xD0 => self.acc::<DIR, true, B>(bus, Self::sub),
            0xD1 => self.acc::<DIR, true, B>(bus, Self::cmp),
            0xD2 => self.acc::<DIR, true, B>(bus, Self::sbc),
            0xD3 => self.addd::<DIR, B>(bus),
            0xD4 => self.acc::<DIR, true, B>(bus, Self::and),
            0xD5 => self.acc::<DIR, true, B>(bus, Self::bit),
            0xD6 => self.acc::<DIR, true, B>(bus, Self::ld),
            0xD7 => self.st8::<DIR, true, B>(bus),
            0xD8 => self.acc::<DIR, true, B>(bus, Self::eor),
            0xD9 => self.acc::<DIR, true, B>(bus, Self::adc),
            0xDA => self.acc::<DIR, true, B>(bus, Self::or),
            0xDB => self.acc::<DIR, true, B>(bus, Self::add),
            0xDC => self.ldd::<DIR, B>(bus),
            0xDD => self.st16::<DIR, RD, B>(bus, 5),
            0xDE => self.ldu::<DIR, B>(bus),
            0xDF => self.st16::<DIR, RU, B>(bus, 5),
            0xE0 => self.acc::<IDX, true, B>(bus, Self::sub),
            0xE1 => self.acc::<IDX, true, B>(bus, Self::cmp),
            0xE2 => self.acc::<IDX, true, B>(bus, Self::sbc),
            0xE3 => self.addd::<IDX, B>(bus),
            0xE4 => self.acc::<IDX, true, B>(bus, Self::and),
            0xE5 => self.acc::<IDX, true, B>(bus, Self::bit),
            0xE6 => self.acc::<IDX, true, B>(bus, Self::ld),
            0xE7 => self.st8::<IDX, true, B>(bus),
            0xE8 => self.acc::<IDX, true, B>(bus, Self::eor),
            0xE9 => self.acc::<IDX, true, B>(bus, Self::adc),
            0xEA => self.acc::<IDX, true, B>(bus, Self::or),
            0xEB => self.acc::<IDX, true, B>(bus, Self::add),
            0xEC => self.ldd::<IDX, B>(bus),
            0xED => self.st16::<IDX, RD, B>(bus, 5),
            0xEE => self.ldu::<IDX, B>(bus),
            0xEF => self.st16::<IDX, RU, B>(bus, 5),
            0xF0 => self.acc::<EXT, true, B>(bus, Self::sub),
            0xF1 => self.acc::<EXT, true, B>(bus, Self::cmp),
            0xF2 => self.acc::<EXT, true, B>(bus, Self::sbc),
            0xF3 => self.addd::<EXT, B>(bus),
            0xF4 => self.acc::<EXT, true, B>(bus, Self::and),
            0xF5 => self.acc::<EXT, true, B>(bus, Self::bit),
            0xF6 => self.acc::<EXT, true, B>(bus, Self::ld),
            0xF7 => self.st8::<EXT, true, B>(bus),
            0xF8 => self.acc::<EXT, true, B>(bus, Self::eor),
            0xF9 => self.acc::<EXT, true, B>(bus, Self::adc),
            0xFA => self.acc::<EXT, true, B>(bus, Self::or),
            0xFB => self.acc::<EXT, true, B>(bus, Self::add),
            0xFC => self.ldd::<EXT, B>(bus),
            0xFD => self.st16::<EXT, RD, B>(bus, 5),
            0xFE => self.ldu::<EXT, B>(bus),
            0xFF => self.st16::<EXT, RU, B>(bus, 5),
        }
    }

    #[inline(always)]
    fn subd<const M: u8, B: Bus>(&mut self, bus: &mut B) -> u32 {
        let (m, c) = self.opnd16::<M, B>(bus, [4, 6, 6, 7]);
        let r = self.sub16(self.d(), m);
        self.set_d(r);
        c
    }

    #[inline(always)]
    fn addd<const M: u8, B: Bus>(&mut self, bus: &mut B) -> u32 {
        let (m, c) = self.opnd16::<M, B>(bus, [4, 6, 6, 7]);
        let r = self.add16(self.d(), m);
        self.set_d(r);
        c
    }

    #[inline(always)]
    fn cmpx<const M: u8, B: Bus>(&mut self, bus: &mut B) -> u32 {
        let (m, c) = self.opnd16::<M, B>(bus, [4, 6, 6, 7]);
        self.sub16(self.x, m);
        c
    }

    #[inline(always)]
    fn ldd<const M: u8, B: Bus>(&mut self, bus: &mut B) -> u32 {
        let (m, c) = self.opnd16::<M, B>(bus, [3, 5, 5, 6]);
        self.set_d(m);
        self.nz16_v0(m);
        c
    }

    #[inline(always)]
    fn ldx<const M: u8, B: Bus>(&mut self, bus: &mut B) -> u32 {
        let (m, c) = self.opnd16::<M, B>(bus, [3, 5, 5, 6]);
        self.x = m;
        self.nz16_v0(m);
        c
    }

    #[inline(always)]
    fn ldu<const M: u8, B: Bus>(&mut self, bus: &mut B) -> u32 {
        let (m, c) = self.opnd16::<M, B>(bus, [3, 5, 5, 6]);
        self.u = m;
        self.nz16_v0(m);
        c
    }

    /// Compare register `R` with an operand in mode `M` (CMPD/Y/U/S).
    #[inline(always)]
    fn cmp16<const M: u8, const R: u8, B: Bus>(&mut self, bus: &mut B) -> u32 {
        let (m, c) = self.opnd16::<M, B>(bus, [5, 7, 7, 8]);
        self.sub16(self.reg16::<R>(), m);
        c
    }

    #[inline(always)]
    fn ldy<const M: u8, B: Bus>(&mut self, bus: &mut B) -> u32 {
        let (m, c) = self.opnd16::<M, B>(bus, [4, 6, 6, 7]);
        self.y = m;
        self.nz16_v0(m);
        c
    }

    #[inline(always)]
    fn lds<const M: u8, B: Bus>(&mut self, bus: &mut B) -> u32 {
        let (m, c) = self.opnd16::<M, B>(bus, [4, 6, 6, 7]);
        self.s = m;
        self.nmi_armed = true;
        self.nz16_v0(m);
        c
    }

    /// Opcodes prefixed with 0x10.
    #[inline(always)]
    fn exec_page1<B: Bus>(&mut self, bus: &mut B) -> u32 {
        let op = self.fetch8(bus);
        match op {
            0x21 => self.lbranch::<0x1, B>(bus),
            0x22 => self.lbranch::<0x2, B>(bus),
            0x23 => self.lbranch::<0x3, B>(bus),
            0x24 => self.lbranch::<0x4, B>(bus),
            0x25 => self.lbranch::<0x5, B>(bus),
            0x26 => self.lbranch::<0x6, B>(bus),
            0x27 => self.lbranch::<0x7, B>(bus),
            0x28 => self.lbranch::<0x8, B>(bus),
            0x29 => self.lbranch::<0x9, B>(bus),
            0x2A => self.lbranch::<0xA, B>(bus),
            0x2B => self.lbranch::<0xB, B>(bus),
            0x2C => self.lbranch::<0xC, B>(bus),
            0x2D => self.lbranch::<0xD, B>(bus),
            0x2E => self.lbranch::<0xE, B>(bus),
            0x2F => self.lbranch::<0xF, B>(bus),
            0x3F => {
                self.swi(bus, VEC_SWI2, false);
                20
            }
            0x83 => self.cmp16::<IMM, RD, B>(bus),
            0x93 => self.cmp16::<DIR, RD, B>(bus),
            0xA3 => self.cmp16::<IDX, RD, B>(bus),
            0xB3 => self.cmp16::<EXT, RD, B>(bus),
            0x8C => self.cmp16::<IMM, RY, B>(bus),
            0x9C => self.cmp16::<DIR, RY, B>(bus),
            0xAC => self.cmp16::<IDX, RY, B>(bus),
            0xBC => self.cmp16::<EXT, RY, B>(bus),
            0x8E => self.ldy::<IMM, B>(bus),
            0x9E => self.ldy::<DIR, B>(bus),
            0xAE => self.ldy::<IDX, B>(bus),
            0xBE => self.ldy::<EXT, B>(bus),
            0x9F => self.st16::<DIR, RY, B>(bus, 6),
            0xAF => self.st16::<IDX, RY, B>(bus, 6),
            0xBF => self.st16::<EXT, RY, B>(bus, 6),
            0xCE => self.lds::<IMM, B>(bus),
            0xDE => self.lds::<DIR, B>(bus),
            0xEE => self.lds::<IDX, B>(bus),
            0xFE => self.lds::<EXT, B>(bus),
            0xDF => self.st16::<DIR, RS, B>(bus, 6),
            0xEF => self.st16::<IDX, RS, B>(bus, 6),
            0xFF => self.st16::<EXT, RS, B>(bus, 6),
            _ => self.undefined(2),
        }
    }

    /// Opcodes prefixed with 0x11.
    #[inline(never)]
    fn exec_page2<B: Bus>(&mut self, bus: &mut B) -> u32 {
        let op = self.fetch8(bus);
        match op {
            0x3F => {
                self.swi(bus, VEC_SWI3, false);
                20
            }
            0x83 => self.cmp16::<IMM, RU, B>(bus),
            0x93 => self.cmp16::<DIR, RU, B>(bus),
            0xA3 => self.cmp16::<IDX, RU, B>(bus),
            0xB3 => self.cmp16::<EXT, RU, B>(bus),
            0x8C => self.cmp16::<IMM, RS, B>(bus),
            0x9C => self.cmp16::<DIR, RS, B>(bus),
            0xAC => self.cmp16::<IDX, RS, B>(bus),
            0xBC => self.cmp16::<EXT, RS, B>(bus),
            _ => self.undefined(2),
        }
    }
}

#[inline(always)]
pub fn read16<B: Bus>(bus: &mut B, addr: u16) -> u16 {
    let hi = bus.rd(addr) as u16;
    let lo = bus.rd(addr.wrapping_add(1)) as u16;
    (hi << 8) | lo
}

#[inline(always)]
pub fn write16<B: Bus>(bus: &mut B, addr: u16, v: u16) {
    bus.wr(addr, (v >> 8) as u8);
    bus.wr(addr.wrapping_add(1), v as u8);
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::cpu_ref;

    struct Ram([u8; 0x10000]);

    impl Bus for Ram {
        fn read(&mut self, a: u16) -> u8 {
            self.0[a as usize]
        }
        fn write(&mut self, a: u16, v: u8) {
            self.0[a as usize] = v;
        }
    }

    fn run(prog: &[u8], steps: usize) -> (Cpu, Box<Ram>) {
        let mut ram = Box::new(Ram([0; 0x10000]));
        ram.0[0x1000..0x1000 + prog.len()].copy_from_slice(prog);
        ram.0[0xFFFE] = 0x10;
        ram.0[0xFFFF] = 0x00;
        let mut cpu = Cpu::new();
        cpu.reset(&mut *ram);
        for _ in 0..steps {
            cpu.step(&mut *ram);
        }
        (cpu, ram)
    }

    #[test]
    fn arithmetic_and_flags() {
        // LDA #$7F; ADDA #$01 -> $80, V and N set
        let (cpu, _) = run(&[0x86, 0x7F, 0x8B, 0x01], 2);
        assert_eq!(cpu.a, 0x80);
        assert_ne!(cpu.cc & CC_V, 0);
        assert_ne!(cpu.cc & CC_N, 0);
        assert_eq!(cpu.cc & CC_C, 0);
        // LDD #$1234; SUBD #$1235 -> $FFFF, C and N set
        let (cpu, _) = run(&[0xCC, 0x12, 0x34, 0x83, 0x12, 0x35], 2);
        assert_eq!(cpu.d(), 0xFFFF);
        assert_ne!(cpu.cc & CC_C, 0);
        // LDA #$45; LDB #$38; ADDA... DAA: $45 + $38 = $7D -> $83
        let (cpu, _) = run(&[0x86, 0x45, 0x8B, 0x38, 0x19], 3);
        assert_eq!(cpu.a, 0x83);
        // MUL $10 * $20 = $0200
        let (cpu, _) = run(&[0x86, 0x10, 0xC6, 0x20, 0x3D], 3);
        assert_eq!(cpu.d(), 0x0200);
    }

    #[test]
    fn stack_and_indexed() {
        // LDS #$2000; LDX #$3000; LDA #$AA; STA ,X+; LDB -1,X; PSHS A,B,X; PULS A,B,X
        let prog = [
            0x10, 0xCE, 0x20, 0x00, 0x8E, 0x30, 0x00, 0x86, 0xAA, 0xA7, 0x80, 0xE6, 0x1F, 0x34,
            0x16, 0x35, 0x16,
        ];
        let (cpu, ram) = run(&prog, 7);
        assert_eq!(ram.0[0x3000], 0xAA);
        assert_eq!(cpu.x, 0x3001);
        assert_eq!(cpu.b, 0xAA);
        assert_eq!(cpu.s, 0x2000);
        // [n16] extended indirect: LDX [$4000] with $4000 -> $1234 -> $5678
        let prog = [0xAE, 0x9F, 0x40, 0x00];
        let mut ram = Box::new(Ram([0; 0x10000]));
        ram.0[0x1000..0x1004].copy_from_slice(&prog);
        ram.0[0x4000] = 0x12;
        ram.0[0x4001] = 0x34;
        ram.0[0x1234] = 0x56;
        ram.0[0x1235] = 0x78;
        ram.0[0xFFFE] = 0x10;
        let mut cpu = Cpu::new();
        cpu.reset(&mut *ram);
        let c = cpu.step(&mut *ram);
        assert_eq!(cpu.x, 0x5678);
        assert_eq!(c, 10);
    }

    #[test]
    fn branches_and_subroutines() {
        // 1000: LDS #$2000 ; 1004: BSR 1008 ; 1006: BRA 1006 ; 1008: LDA #$55 ; 100A: RTS
        let prog = [0x10, 0xCE, 0x20, 0x00, 0x8D, 0x02, 0x20, 0xFE, 0x86, 0x55, 0x39];
        let (cpu, _) = run(&prog, 5);
        assert_eq!(cpu.a, 0x55);
        assert_eq!(cpu.pc, 0x1006);
        // LBSR / long branch
        let prog = [0x10, 0xCE, 0x20, 0x00, 0x17, 0x00, 0x02, 0x20, 0xFE, 0x86, 0x66, 0x39];
        let (cpu, _) = run(&prog, 4);
        assert_eq!(cpu.a, 0x66);
        assert_eq!(cpu.pc, 0x1007);
    }

    #[test]
    fn tfr_exg() {
        // LDD #$1234; TFR D,X; EXG A,B
        let (cpu, _) = run(&[0xCC, 0x12, 0x34, 0x1F, 0x01, 0x1E, 0x89], 3);
        assert_eq!(cpu.x, 0x1234);
        assert_eq!(cpu.a, 0x34);
        assert_eq!(cpu.b, 0x12);
    }

    // -- against the reference interpreter ----------------------------------------

    /// Flat memory that logs every access in order (address, value, write).
    /// With `fast`, stack operations go through a pointer (not logged).
    struct Logged {
        mem: Box<[u8; 0x10000]>,
        log: Vec<(u16, u8, bool)>,
        fast: bool,
    }

    impl Bus for Logged {
        fn read(&mut self, a: u16) -> u8 {
            let v = self.mem[a as usize];
            self.log.push((a, v, false));
            v
        }
        fn peek(&mut self, a: u16) -> u8 {
            self.mem[a as usize]
        }
        fn mem_ptr(&mut self, addr: u16, len: u16) -> *mut u8 {
            if self.fast && addr as usize + len as usize <= 0x10000 {
                self.mem[addr as usize..].as_mut_ptr()
            } else {
                core::ptr::null_mut()
            }
        }
        fn code_ptr(&mut self, pc: u16) -> *const u8 {
            if pc <= 0xFFFB {
                self.mem[pc as usize..].as_ptr()
            } else {
                core::ptr::null()
            }
        }
        fn write(&mut self, a: u16, v: u8) {
            self.mem[a as usize] = v;
            self.log.push((a, v, true));
        }
    }

    impl cpu_ref::Bus for Logged {
        fn read(&mut self, a: u16) -> u8 {
            Bus::read(self, a)
        }
        fn code(&mut self, a: u16) -> u8 {
            self.mem[a as usize]
        }
        fn write(&mut self, a: u16, v: u8) {
            Bus::write(self, a, v)
        }
    }

    struct Rng(u64);

    impl Rng {
        fn next(&mut self) -> u32 {
            // xorshift64*
            self.0 ^= self.0 >> 12;
            self.0 ^= self.0 << 25;
            self.0 ^= self.0 >> 27;
            (self.0.wrapping_mul(0x2545F4914F6CDD1D) >> 32) as u32
        }
        fn byte(&mut self) -> u8 {
            self.next() as u8
        }
        fn word(&mut self) -> u16 {
            self.next() as u16
        }
    }

    fn wait_code(w: Wait) -> u8 {
        w as u8
    }

    fn ref_wait_code(w: cpu_ref::Wait) -> u8 {
        match w {
            cpu_ref::Wait::Run => 0,
            cpu_ref::Wait::Cwai => 1,
            cpu_ref::Wait::Sync => 2,
        }
    }

    /// Both CPUs in the same random state.
    fn random_pair(rng: &mut Rng) -> (Cpu, cpu_ref::Cpu) {
        let mut n = Cpu::new();
        n.a = rng.byte();
        n.b = rng.byte();
        n.dp = rng.byte();
        n.cc = rng.byte();
        n.x = rng.word();
        n.y = rng.word();
        n.u = rng.word();
        n.s = rng.word();
        n.pc = rng.word();
        n.nmi_armed = rng.byte() & 1 != 0;
        let mut r = cpu_ref::Cpu::new();
        r.a = n.a;
        r.b = n.b;
        r.dp = n.dp;
        r.cc = n.cc;
        r.x = n.x;
        r.y = n.y;
        r.u = n.u;
        r.s = n.s;
        r.pc = n.pc;
        r.nmi_armed = n.nmi_armed;
        (n, r)
    }

    fn same(n: &Cpu, r: &cpu_ref::Cpu) -> bool {
        n.a == r.a
            && n.b == r.b
            && n.dp == r.dp
            && n.cc == r.cc
            && n.x == r.x
            && n.y == r.y
            && n.u == r.u
            && n.s == r.s
            && n.pc == r.pc
            && n.cycles == r.cycles
            && n.illegal == r.illegal
            && n.last_illegal == r.last_illegal
            && n.nmi_pending == r.nmi_pending
            && n.nmi_armed == r.nmi_armed
            && wait_code(n.wait) == ref_wait_code(r.wait)
    }

    /// Run `steps` steps on both from random memory and registers; the code
    /// at PC starts with `prefix`. Panics on the first difference.
    /// `lines`: new random interrupt lines (and NMI edges) before each step.
    fn compare(rng: &mut Rng, prefix: &[u8], steps: usize, lines: bool) {
        compare_with(rng, prefix, steps, lines, None);
        compare_fast(rng, prefix, steps, lines);
    }

    /// As [`compare`], the stack through a pointer: registers, cycles and
    /// memory must still agree (the accesses are not seen).
    fn compare_fast(rng: &mut Rng, prefix: &[u8], steps: usize, lines: bool) {
        FAST.with(|f| f.set(true));
        compare_with(rng, prefix, steps, lines, None);
        FAST.with(|f| f.set(false));
    }

    thread_local! {
        static FAST: std::cell::Cell<bool> = const { std::cell::Cell::new(false) };
    }

    /// As [`compare`]; `fixed`: (FIRQ, IRQ) set once, then left alone while
    /// the code runs (so only instructions can unmask them).
    fn compare_with(rng: &mut Rng, prefix: &[u8], steps: usize, lines: bool, fixed: Option<(bool, bool)>) {
        let mut mem = Box::new([0u8; 0x10000]);
        for b in mem.iter_mut() {
            *b = rng.byte();
        }
        let (mut n, mut r) = random_pair(rng);
        for (i, &b) in prefix.iter().enumerate() {
            mem[n.pc.wrapping_add(i as u16) as usize] = b;
        }
        let fast = FAST.with(|f| f.get());
        let mut nb = Logged { mem: mem.clone(), log: Vec::new(), fast };
        let mut rb = Logged { mem, log: Vec::new(), fast: false };
        if let Some((firq, irq)) = fixed {
            n.set_lines(firq, irq);
            r.firq = firq;
            r.irq = irq;
        }
        for step in 0..steps {
            if lines {
                let (firq, irq) = (rng.byte() & 3 == 0, rng.byte() & 3 == 0);
                n.set_lines(firq, irq);
                r.firq = firq;
                r.irq = irq;
                if rng.byte() & 7 == 0 {
                    n.nmi();
                    r.nmi();
                }
            }
            let before = n.clone();
            let cn = n.step(&mut nb);
            let cr = r.step(&mut rb);
            if cn != cr || !same(&n, &r) || (!fast && nb.log != rb.log) {
                panic!(
                    "step {} from {:02x?} at {:04x}: cycles {} vs {}\nnew {:x?}\nref {:x?}\nnew log {:x?}\nref log {:x?}\nbefore {:x?}",
                    step,
                    &rb.mem[before.pc as usize..(before.pc as usize + 5).min(0x10000)],
                    before.pc,
                    cn,
                    cr,
                    n,
                    r,
                    nb.log,
                    rb.log,
                    before
                );
            }
            nb.log.clear();
            rb.log.clear();
        }
        assert!(nb.mem == rb.mem);
    }

    #[test]
    fn every_opcode_matches_reference() {
        let mut rng = Rng(0x0123_4567_89AB_CDEF);
        for _ in 0..20 {
            for op in 0..=255u8 {
                compare(&mut rng, &[op], 1, false);
                compare(&mut rng, &[0x10, op], 1, false);
                compare(&mut rng, &[0x11, op], 1, false);
            }
        }
        // Indexed modes: every post-byte with an indexed opcode of each kind.
        for _ in 0..4 {
            for post in 0..=255u8 {
                for op in [0x30, 0x32, 0x60, 0x6D, 0x6E, 0x6F, 0xA6, 0xA7, 0xAB, 0xAD, 0xAE, 0xAF, 0xE3, 0xED] {
                    compare(&mut rng, &[op, post], 1, false);
                }
                compare(&mut rng, &[0x10, 0xAE, post], 1, false);
                compare(&mut rng, &[0x11, 0xA3, post], 1, false);
            }
        }
    }

    #[test]
    fn random_streams_match_reference() {
        let mut rng = Rng(0xDEAD_BEEF_1234_5678);
        for _ in 0..3000 {
            compare(&mut rng, &[], 40, false);
        }
    }

    #[test]
    fn interrupts_match_reference() {
        let mut rng = Rng(0x5555_AAAA_0F0F_F0F0);
        for _ in 0..3000 {
            compare(&mut rng, &[], 40, true);
        }
        // Lines held while the code runs: only instructions unmask them.
        for _ in 0..3000 {
            let fixed = (rng.byte() & 1 != 0, rng.byte() & 1 != 0);
            compare_with(&mut rng, &[], 60, false, Some(fixed));
        }
        // Masked lines, then ANDCC, TFR/EXG to CC, PULS/PULU CC, RTI.
        for _ in 0..2000 {
            let fixed = (rng.byte() & 1 != 0, rng.byte() & 1 != 0);
            let unmask: [u8; 2] = match rng.byte() % 6 {
                0 => [0x1C, rng.byte()],
                1 => [0x1F, (rng.byte() & 0xF0) | 0x0A],
                2 => [0x1E, (rng.byte() & 0xF0) | 0x0A],
                3 => [0x35, rng.byte() | 1],
                4 => [0x37, rng.byte() | 1],
                _ => [0x3B, 0x12],
            };
            compare_with(&mut rng, &[0x1A, 0x50, unmask[0], unmask[1], 0x12, 0x12], 8, false, Some(fixed));
        }
        // CWAI and SYNC with lines coming and going.
        for _ in 0..1000 {
            let op = if rng.byte() & 1 != 0 { 0x13 } else { 0x3C };
            let mask = rng.byte() & 0xAF;
            compare(&mut rng, &[op, mask], 30, true);
        }
    }
}
