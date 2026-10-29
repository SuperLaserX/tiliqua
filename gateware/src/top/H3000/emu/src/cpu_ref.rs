//! The first MC6809 interpreter, kept as the reference that [`crate::cpu`]
//! is tested against (instruction by instruction, see `cpu::tests`).
//!
//! Original description:
//!
//! Executes one instruction per [`Cpu::step`] and returns the number of E
//! clock cycles it took (documented 6809 timings, including the indexed
//! addressing post-byte cycles). Interrupts are sampled between
//! instructions: NMI is edge triggered ([`Cpu::nmi`]), FIRQ and IRQ are
//! level inputs ([`Cpu::firq`], [`Cpu::irq`]).

/// Memory and I/O as seen by the CPU.
pub trait Bus {
    fn read(&mut self, addr: u16) -> u8;
    fn write(&mut self, addr: u16, val: u8);
    /// An opcode byte: as [`Bus::read`], with room for a fast path.
    #[inline(always)]
    fn fetch_op(&mut self, addr: u16) -> u8 {
        self.code(addr)
    }
    /// Any instruction byte.
    fn code(&mut self, addr: u16) -> u8 {
        self.read(addr)
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

#[derive(Clone, Copy, PartialEq, Eq, Debug)]
pub(crate) enum Wait {
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
    pub irq: bool,
    /// FIRQ input level (true = asserted).
    pub firq: bool,
    pub(crate) nmi_pending: bool,
    /// NMI is ignored after reset until S has been loaded.
    pub(crate) nmi_armed: bool,
    pub(crate) wait: Wait,
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

/// Indexed-mode extra cycles, as a function of the post-byte low nibble.
const IDX_CYCLES: [u8; 16] = [2, 3, 2, 3, 0, 1, 1, 0, 1, 4, 0, 4, 1, 5, 0, 5];

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
        self.pc = read16(bus, VEC_RESET);
    }

    /// Raise an NMI edge.
    pub fn nmi(&mut self) {
        self.nmi_pending = true;
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

    // -- flag helpers ---------------------------------------------------------

    #[inline(always)]
    fn set_flag(&mut self, f: u8, on: bool) {
        if on {
            self.cc |= f
        } else {
            self.cc &= !f
        }
    }

    #[inline(always)]
    fn nz8(&mut self, v: u8) {
        self.cc &= !(CC_N | CC_Z);
        if v == 0 {
            self.cc |= CC_Z;
        }
        if v & 0x80 != 0 {
            self.cc |= CC_N;
        }
    }

    #[inline(always)]
    fn nz16(&mut self, v: u16) {
        self.cc &= !(CC_N | CC_Z);
        if v == 0 {
            self.cc |= CC_Z;
        }
        if v & 0x8000 != 0 {
            self.cc |= CC_N;
        }
    }

    /// N, Z set; V cleared (loads, stores, logic ops).
    #[inline(always)]
    fn nz8_v0(&mut self, v: u8) {
        self.nz8(v);
        self.cc &= !CC_V;
    }

    #[inline(always)]
    fn nz16_v0(&mut self, v: u16) {
        self.nz16(v);
        self.cc &= !CC_V;
    }

    fn add8(&mut self, a: u8, b: u8, carry: u8) -> u8 {
        let r16 = a as u16 + b as u16 + carry as u16;
        let r = r16 as u8;
        self.cc &= !(CC_H | CC_N | CC_Z | CC_V | CC_C);
        if ((a & 0x0F) + (b & 0x0F) + carry) & 0x10 != 0 {
            self.cc |= CC_H;
        }
        if (a ^ r) & (b ^ r) & 0x80 != 0 {
            self.cc |= CC_V;
        }
        if r16 & 0x100 != 0 {
            self.cc |= CC_C;
        }
        if r == 0 {
            self.cc |= CC_Z;
        }
        if r & 0x80 != 0 {
            self.cc |= CC_N;
        }
        r
    }

    fn sub8(&mut self, a: u8, b: u8, borrow: u8) -> u8 {
        let r16 = (a as u16).wrapping_sub(b as u16).wrapping_sub(borrow as u16);
        let r = r16 as u8;
        self.cc &= !(CC_N | CC_Z | CC_V | CC_C);
        if (a ^ b) & (a ^ r) & 0x80 != 0 {
            self.cc |= CC_V;
        }
        if r16 & 0x100 != 0 {
            self.cc |= CC_C;
        }
        if r == 0 {
            self.cc |= CC_Z;
        }
        if r & 0x80 != 0 {
            self.cc |= CC_N;
        }
        r
    }

    fn add16(&mut self, a: u16, b: u16) -> u16 {
        let r32 = a as u32 + b as u32;
        let r = r32 as u16;
        self.cc &= !(CC_N | CC_Z | CC_V | CC_C);
        if (a ^ r) & (b ^ r) & 0x8000 != 0 {
            self.cc |= CC_V;
        }
        if r32 & 0x10000 != 0 {
            self.cc |= CC_C;
        }
        self.nz16(r);
        r
    }

    fn sub16(&mut self, a: u16, b: u16) -> u16 {
        let r32 = (a as u32).wrapping_sub(b as u32);
        let r = r32 as u16;
        self.cc &= !(CC_N | CC_Z | CC_V | CC_C);
        if (a ^ b) & (a ^ r) & 0x8000 != 0 {
            self.cc |= CC_V;
        }
        if r32 & 0x10000 != 0 {
            self.cc |= CC_C;
        }
        self.nz16(r);
        r
    }

    #[inline(always)]
    fn carry(&self) -> u8 {
        self.cc & CC_C
    }

    // -- read-modify-write operations ------------------------------------------

    fn rmw(&mut self, op: u8, v: u8) -> u8 {
        match op & 0x0F {
            0x0 | 0x1 => {
                // NEG
                let r = self.sub8(0, v, 0);
                r
            }
            0x3 => {
                // COM
                let r = !v;
                self.nz8_v0(r);
                self.cc |= CC_C;
                r
            }
            0x4 | 0x5 => {
                // LSR
                let r = v >> 1;
                self.set_flag(CC_C, v & 1 != 0);
                self.nz8(r);
                r
            }
            0x6 => {
                // ROR
                let r = (v >> 1) | (self.carry() << 7);
                self.set_flag(CC_C, v & 1 != 0);
                self.nz8(r);
                r
            }
            0x7 => {
                // ASR
                let r = (v >> 1) | (v & 0x80);
                self.set_flag(CC_C, v & 1 != 0);
                self.nz8(r);
                r
            }
            0x8 => {
                // ASL / LSL
                let r = v << 1;
                self.set_flag(CC_C, v & 0x80 != 0);
                self.set_flag(CC_V, (v ^ (v << 1)) & 0x80 != 0);
                self.nz8(r);
                r
            }
            0x9 => {
                // ROL
                let r = (v << 1) | self.carry();
                self.set_flag(CC_C, v & 0x80 != 0);
                self.set_flag(CC_V, (v ^ (v << 1)) & 0x80 != 0);
                self.nz8(r);
                r
            }
            0xA | 0xB => {
                // DEC
                let r = v.wrapping_sub(1);
                self.set_flag(CC_V, v == 0x80);
                self.nz8(r);
                r
            }
            0xC => {
                // INC
                let r = v.wrapping_add(1);
                self.set_flag(CC_V, v == 0x7F);
                self.nz8(r);
                r
            }
            0xD => {
                // TST
                self.nz8_v0(v);
                v
            }
            0xF => {
                // CLR
                self.cc &= !(CC_N | CC_V | CC_C);
                self.cc |= CC_Z;
                0
            }
            _ => v, // 0x2 (undefined), 0xE (JMP, handled by caller)
        }
    }

    // -- 8-bit ALU group (0x80-0xFF low nibble) ----------------------------------

    /// Accumulator operation `n` (low opcode nibble 0,1,2,4,5,8,9,A,B) on `acc`.
    /// Returns the new accumulator value (unchanged for CMP/BIT).
    fn alu8(&mut self, n: u8, acc: u8, m: u8) -> u8 {
        match n {
            0x0 => self.sub8(acc, m, 0),
            0x1 => {
                self.sub8(acc, m, 0);
                acc
            }
            0x2 => {
                let c = self.carry();
                self.sub8(acc, m, c)
            }
            0x4 => {
                let r = acc & m;
                self.nz8_v0(r);
                r
            }
            0x5 => {
                self.nz8_v0(acc & m);
                acc
            }
            0x6 => {
                self.nz8_v0(m);
                m
            }
            0x8 => {
                let r = acc ^ m;
                self.nz8_v0(r);
                r
            }
            0x9 => {
                let c = self.carry();
                self.add8(acc, m, c)
            }
            0xA => {
                let r = acc | m;
                self.nz8_v0(r);
                r
            }
            0xB => self.add8(acc, m, 0),
            _ => acc,
        }
    }

    // -- fetch / stack ----------------------------------------------------------

    #[inline(always)]
    fn fetch8<B: Bus>(&mut self, bus: &mut B) -> u8 {
        let v = bus.code(self.pc);
        self.pc = self.pc.wrapping_add(1);
        v
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
        bus.write(self.s, v);
    }

    #[inline(always)]
    fn push16_s<B: Bus>(&mut self, bus: &mut B, v: u16) {
        self.push8_s(bus, v as u8);
        self.push8_s(bus, (v >> 8) as u8);
    }

    #[inline(always)]
    fn pull8_s<B: Bus>(&mut self, bus: &mut B) -> u8 {
        let v = bus.read(self.s);
        self.s = self.s.wrapping_add(1);
        v
    }

    #[inline(always)]
    fn pull16_s<B: Bus>(&mut self, bus: &mut B) -> u16 {
        let hi = self.pull8_s(bus) as u16;
        let lo = self.pull8_s(bus) as u16;
        (hi << 8) | lo
    }

    /// Push the whole register file (as for IRQ/NMI/SWI with E set).
    fn push_entire<B: Bus>(&mut self, bus: &mut B) {
        self.push16_s(bus, self.pc);
        self.push16_s(bus, self.u);
        self.push16_s(bus, self.y);
        self.push16_s(bus, self.x);
        self.push8_s(bus, self.dp);
        self.push8_s(bus, self.b);
        self.push8_s(bus, self.a);
        self.push8_s(bus, self.cc);
    }

    /// PSHS/PSHU. Returns the number of bytes pushed.
    fn push_regs<B: Bus>(&mut self, bus: &mut B, mask: u8, user: bool) -> u32 {
        let mut sp = if user { self.u } else { self.s };
        let mut n = 0;
        let mut put = |bus: &mut B, v: u8| {
            sp = sp.wrapping_sub(1);
            bus.write(sp, v);
            n += 1;
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
        n
    }

    /// PULS/PULU. Returns the number of bytes pulled.
    fn pull_regs<B: Bus>(&mut self, bus: &mut B, mask: u8, user: bool) -> u32 {
        let mut sp = if user { self.u } else { self.s };
        let mut n = 0;
        let mut get = |bus: &mut B| -> u8 {
            let v = bus.read(sp);
            sp = sp.wrapping_add(1);
            n += 1;
            v
        };
        if mask & 0x01 != 0 {
            self.cc = get(bus);
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
        n
    }

    // -- addressing ---------------------------------------------------------------

    #[inline(always)]
    fn ea_direct<B: Bus>(&mut self, bus: &mut B) -> u16 {
        ((self.dp as u16) << 8) | self.fetch8(bus) as u16
    }

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
    fn ea_indexed<B: Bus>(&mut self, bus: &mut B) -> (u16, u32) {
        let post = self.fetch8(bus);
        if post & 0x80 == 0 {
            // 5-bit signed offset
            let off = ((post << 3) as i8 >> 3) as i16 as u16;
            return (self.idx_reg(post).wrapping_add(off), 1);
        }
        let mode = post & 0x0F;
        let r = self.idx_reg(post);
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

    /// Effective address for memory modes selected by opcode bits 5:4
    /// (1 = direct, 2 = indexed, 3 = extended). Returns (ea, extra cycles).
    #[inline(always)]
    fn ea_mode<B: Bus>(&mut self, bus: &mut B, mode: u8) -> (u16, u32) {
        match mode {
            1 => (self.ea_direct(bus), 0),
            2 => self.ea_indexed(bus),
            _ => (self.fetch16(bus), 0),
        }
    }

    // -- register transfer -------------------------------------------------------

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
            0xA => self.cc = v as u8,
            0xB => self.dp = v as u8,
            _ => {}
        }
    }

    // -- branches -----------------------------------------------------------------

    #[inline(always)]
    fn cond(&self, op: u8) -> bool {
        let cc = self.cc;
        let n = cc & CC_N != 0;
        let z = cc & CC_Z != 0;
        let v = cc & CC_V != 0;
        let c = cc & CC_C != 0;
        match op & 0x0F {
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

    // -- interrupts ---------------------------------------------------------------

    /// Take a pending interrupt if one is enabled. Returns cycles used, or 0.
    #[inline(always)]
    fn service<B: Bus>(&mut self, bus: &mut B) -> u32 {
        if !(self.nmi_pending | self.firq | self.irq) {
            return 0;
        }
        self.take_interrupt(bus)
    }

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

    fn swi<B: Bus>(&mut self, bus: &mut B, vector: u16, mask: bool) {
        self.cc |= CC_E;
        self.push_entire(bus);
        if mask {
            self.cc |= CC_I | CC_F;
        }
        self.pc = read16(bus, vector);
    }

    // -- execution ----------------------------------------------------------------

    /// Execute one instruction (or take one interrupt). Returns E cycles used.
    pub fn step<B: Bus>(&mut self, bus: &mut B) -> u32 {
        let c = self.step_inner(bus);
        self.cycles += c as u64;
        c
    }

    fn step_inner<B: Bus>(&mut self, bus: &mut B) -> u32 {
        if (self.nmi_pending | self.firq | self.irq) || self.wait != Wait::Run {
            let c = self.attend(bus);
            if c != 0 {
                return c;
            }
        }
        let op = bus.fetch_op(self.pc);
        self.pc = self.pc.wrapping_add(1);
        match op {
            0x10 => self.exec_page1(bus),
            0x11 => self.exec_page2(bus),
            _ => self.exec_page0(bus, op),
        }
    }

    /// An interrupt line is up or the CPU waits (CWAI / SYNC): take the
    /// interrupt or wait a cycle, or return 0 to execute the next instruction.
    #[inline(never)]
    fn attend<B: Bus>(&mut self, bus: &mut B) -> u32 {
        let taken = self.service(bus);
        if taken != 0 {
            return taken;
        }
        match self.wait {
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
        }
    }

    fn exec_page0<B: Bus>(&mut self, bus: &mut B, op: u8) -> u32 {
        match op {
            // -- memory read-modify-write: direct, indexed, extended ----------------
            0x00..=0x0F | 0x60..=0x6F | 0x70..=0x7F => {
                let (ea, extra, base) = match op >> 4 {
                    0x0 => (self.ea_direct(bus), 0, 6),
                    0x6 => {
                        let (ea, x) = self.ea_indexed(bus);
                        (ea, x, 6)
                    }
                    _ => (self.fetch16(bus), 0, 7),
                };
                match op & 0x0F {
                    0x0E => {
                        self.pc = ea;
                        base - 3 + extra
                    }
                    0x0D => {
                        let v = bus.read(ea);
                        self.nz8_v0(v);
                        base + extra
                    }
                    0x0F => {
                        self.rmw(0x0F, 0);
                        bus.write(ea, 0);
                        base + extra
                    }
                    n => {
                        let v = bus.read(ea);
                        let r = self.rmw(n, v);
                        bus.write(ea, r);
                        base + extra
                    }
                }
            }
            0x12 => 2, // NOP
            0x13 => {
                self.wait = Wait::Sync;
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
                if t & 0x100 != 0 {
                    self.cc |= CC_C;
                }
                self.nz8(self.a);
                self.cc &= !CC_V;
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
                3
            }
            0x1D => {
                // SEX
                self.a = if self.b & 0x80 != 0 { 0xFF } else { 0 };
                let d = self.d();
                self.nz16(d);
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
            0x20..=0x2F => {
                let off = self.fetch8(bus) as i8 as i16 as u16;
                if self.cond(op) {
                    self.pc = self.pc.wrapping_add(off);
                }
                3
            }
            0x30 | 0x31 => {
                let (ea, extra) = self.ea_indexed(bus);
                if op == 0x30 {
                    self.x = ea;
                } else {
                    self.y = ea;
                }
                self.set_flag(CC_Z, ea == 0);
                4 + extra
            }
            0x32 => {
                let (ea, extra) = self.ea_indexed(bus);
                self.s = ea;
                self.nmi_armed = true;
                4 + extra
            }
            0x33 => {
                let (ea, extra) = self.ea_indexed(bus);
                self.u = ea;
                4 + extra
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
            0x3B => {
                // RTI
                self.cc = self.pull8_s(bus);
                if self.cc & CC_E != 0 {
                    self.a = self.pull8_s(bus);
                    self.b = self.pull8_s(bus);
                    self.dp = self.pull8_s(bus);
                    self.x = self.pull16_s(bus);
                    self.y = self.pull16_s(bus);
                    self.u = self.pull16_s(bus);
                    self.pc = self.pull16_s(bus);
                    15
                } else {
                    self.pc = self.pull16_s(bus);
                    6
                }
            }
            0x3C => {
                let m = self.fetch8(bus);
                self.cc &= m;
                self.cc |= CC_E;
                self.push_entire(bus);
                self.wait = Wait::Cwai;
                20
            }
            0x3D => {
                let r = self.a as u16 * self.b as u16;
                self.set_d(r);
                self.set_flag(CC_Z, r == 0);
                self.set_flag(CC_C, r & 0x80 != 0);
                11
            }
            0x3F => {
                self.swi(bus, VEC_SWI, true);
                19
            }
            0x40..=0x4F => {
                let r = self.rmw(op, self.a);
                self.a = r;
                2
            }
            0x50..=0x5F => {
                let r = self.rmw(op, self.b);
                self.b = r;
                2
            }
            0x80..=0xFF => self.exec_acc(bus, op),
            _ => {
                self.illegal += 1;
                self.last_illegal = self.pc.wrapping_sub(1);
                2
            }
        }
    }

    /// Opcodes 0x80-0xFF: accumulator and 16-bit register operations.
    fn exec_acc<B: Bus>(&mut self, bus: &mut B, op: u8) -> u32 {
        let mode = (op >> 4) & 3; // 0 imm, 1 dir, 2 idx, 3 ext
        let use_b = op >= 0xC0;
        let n = op & 0x0F;
        match n {
            // 8-bit accumulator ops
            0x0 | 0x1 | 0x2 | 0x4 | 0x5 | 0x6 | 0x8 | 0x9 | 0xA | 0xB => {
                let (m, cyc) = if mode == 0 {
                    (self.fetch8(bus), 2)
                } else {
                    let (ea, extra) = self.ea_mode(bus, mode);
                    let base = if mode == 3 { 5 } else { 4 };
                    (bus.read(ea), base + extra)
                };
                if use_b {
                    self.b = self.alu8(n, self.b, m);
                } else {
                    self.a = self.alu8(n, self.a, m);
                }
                cyc
            }
            0x7 => {
                // STA / STB
                if mode == 0 {
                    self.illegal += 1;
                    self.fetch8(bus);
                    return 2;
                }
                let (ea, extra) = self.ea_mode(bus, mode);
                let v = if use_b { self.b } else { self.a };
                self.nz8_v0(v);
                bus.write(ea, v);
                (if mode == 3 { 5 } else { 4 }) + extra
            }
            // 16-bit arithmetic: SUBD (A side), ADDD (B side), CMPX (A side)
            0x3 | 0xC if !(use_b && n == 0xC) => {
                let (m, cyc) = self.read16_mode(bus, mode, [4, 6, 6, 7]);
                match (n, use_b) {
                    (0x3, false) => {
                        let r = self.sub16(self.d(), m);
                        self.set_d(r);
                    }
                    (0x3, true) => {
                        let r = self.add16(self.d(), m);
                        self.set_d(r);
                    }
                    _ => {
                        self.sub16(self.x, m);
                    }
                }
                cyc
            }
            0xC => {
                // LDD
                let (m, cyc) = self.read16_mode(bus, mode, [3, 5, 5, 6]);
                self.set_d(m);
                self.nz16_v0(m);
                cyc
            }
            0xD => {
                if !use_b {
                    // BSR / JSR
                    if mode == 0 {
                        let off = self.fetch8(bus) as i8 as i16 as u16;
                        self.push16_s(bus, self.pc);
                        self.pc = self.pc.wrapping_add(off);
                        return 7;
                    }
                    let (ea, extra) = self.ea_mode(bus, mode);
                    self.push16_s(bus, self.pc);
                    self.pc = ea;
                    (if mode == 3 { 8 } else { 7 }) + extra
                } else {
                    // STD
                    if mode == 0 {
                        self.illegal += 1;
                        self.fetch16(bus);
                        return 2;
                    }
                    let (ea, extra) = self.ea_mode(bus, mode);
                    let v = self.d();
                    self.nz16_v0(v);
                    write16(bus, ea, v);
                    (if mode == 3 { 6 } else { 5 }) + extra
                }
            }
            0xE => {
                // LDX / LDU
                let (m, cyc) = self.read16_mode(bus, mode, [3, 5, 5, 6]);
                if use_b {
                    self.u = m;
                } else {
                    self.x = m;
                }
                self.nz16_v0(m);
                cyc
            }
            _ => {
                // 0xF: STX / STU
                if mode == 0 {
                    self.illegal += 1;
                    self.fetch16(bus);
                    return 2;
                }
                let (ea, extra) = self.ea_mode(bus, mode);
                let v = if use_b { self.u } else { self.x };
                self.nz16_v0(v);
                write16(bus, ea, v);
                (if mode == 3 { 6 } else { 5 }) + extra
            }
        }
    }

    /// Read a 16-bit operand in addressing mode `mode` (0 = immediate).
    /// `cycles` gives the base cycle count for imm, dir, idx, ext.
    #[inline(always)]
    fn read16_mode<B: Bus>(&mut self, bus: &mut B, mode: u8, cycles: [u32; 4]) -> (u16, u32) {
        if mode == 0 {
            (self.fetch16(bus), cycles[0])
        } else {
            let (ea, extra) = self.ea_mode(bus, mode);
            (read16(bus, ea), cycles[mode as usize] + extra)
        }
    }

    fn exec_page1<B: Bus>(&mut self, bus: &mut B) -> u32 {
        let op = self.fetch8(bus);
        match op {
            0x21..=0x2F => {
                let off = self.fetch16(bus);
                if self.cond(op) {
                    self.pc = self.pc.wrapping_add(off);
                    6
                } else {
                    5
                }
            }
            0x3F => {
                self.swi(bus, VEC_SWI2, false);
                20
            }
            0x83 | 0x93 | 0xA3 | 0xB3 => {
                // CMPD
                let (m, cyc) = self.read16_mode(bus, (op >> 4) & 3, [5, 7, 7, 8]);
                self.sub16(self.d(), m);
                cyc
            }
            0x8C | 0x9C | 0xAC | 0xBC => {
                // CMPY
                let (m, cyc) = self.read16_mode(bus, (op >> 4) & 3, [5, 7, 7, 8]);
                self.sub16(self.y, m);
                cyc
            }
            0x8E | 0x9E | 0xAE | 0xBE => {
                // LDY
                let (m, cyc) = self.read16_mode(bus, (op >> 4) & 3, [4, 6, 6, 7]);
                self.y = m;
                self.nz16_v0(m);
                cyc
            }
            0x9F | 0xAF | 0xBF => {
                // STY
                let mode = (op >> 4) & 3;
                let (ea, extra) = self.ea_mode(bus, mode);
                let v = self.y;
                self.nz16_v0(v);
                write16(bus, ea, v);
                (if mode == 3 { 7 } else { 6 }) + extra
            }
            0xCE | 0xDE | 0xEE | 0xFE => {
                // LDS
                let (m, cyc) = self.read16_mode(bus, (op >> 4) & 3, [4, 6, 6, 7]);
                self.s = m;
                self.nmi_armed = true;
                self.nz16_v0(m);
                cyc
            }
            0xDF | 0xEF | 0xFF => {
                // STS
                let mode = (op >> 4) & 3;
                let (ea, extra) = self.ea_mode(bus, mode);
                let v = self.s;
                self.nz16_v0(v);
                write16(bus, ea, v);
                (if mode == 3 { 7 } else { 6 }) + extra
            }
            _ => {
                self.illegal += 1;
                self.last_illegal = self.pc.wrapping_sub(2);
                2
            }
        }
    }

    fn exec_page2<B: Bus>(&mut self, bus: &mut B) -> u32 {
        let op = self.fetch8(bus);
        match op {
            0x3F => {
                self.swi(bus, VEC_SWI3, false);
                20
            }
            0x83 | 0x93 | 0xA3 | 0xB3 => {
                // CMPU
                let (m, cyc) = self.read16_mode(bus, (op >> 4) & 3, [5, 7, 7, 8]);
                self.sub16(self.u, m);
                cyc
            }
            0x8C | 0x9C | 0xAC | 0xBC => {
                // CMPS
                let (m, cyc) = self.read16_mode(bus, (op >> 4) & 3, [5, 7, 7, 8]);
                self.sub16(self.s, m);
                cyc
            }
            _ => {
                self.illegal += 1;
                self.last_illegal = self.pc.wrapping_sub(2);
                2
            }
        }
    }
}

#[inline(always)]
pub fn read16<B: Bus>(bus: &mut B, addr: u16) -> u16 {
    let hi = bus.read(addr) as u16;
    let lo = bus.read(addr.wrapping_add(1)) as u16;
    (hi << 8) | lo
}

#[inline(always)]
pub fn write16<B: Bus>(bus: &mut B, addr: u16, v: u16) {
    bus.write(addr, (v >> 8) as u8);
    bus.write(addr.wrapping_add(1), v as u8);
}
