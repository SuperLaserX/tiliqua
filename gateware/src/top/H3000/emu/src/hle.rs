//! Native execution of the kernels' hottest loops.
//!
//! A little code takes a large share of the 6809's time: the NMI handler
//! with its knob scan (1638 times a second), two 16/16 divisions (one
//! quotient bit per pass), three walks over the H3500's 19 modules (48-byte
//! entries at $6B00), and a linear table search in a ROM bank. They are run here as straight-line code built from
//! the interpreter's own operations, with the same registers, flags, memory
//! accesses (in the same order) and E cycles as the instructions they
//! replace; anything unusual is left to the interpreter.
//!
//! The first instruction of each loop is replaced by the trap opcode
//! [`TRAP`] (undefined on the 6809, never executed by the firmware) in a
//! copy of the ROM used only for instruction fetch ([`Hle::new`]); data reads
//! still see the original bytes. On the trap the CPU calls [`run`], which
//! runs passes until the [`Cpu::run`] budget is used up: events (the NMI
//! tick, polls of the DSP board) then come at the end of a pass, at most one
//! pass (75 cycles) later than between the loop's instructions; the NMI
//! handler (about 170 cycles) is run to its end.
//!
//! In [`Hle::exact`] mode a pass is only run if the interpreter would not
//! have stopped inside it (it stops between instructions once the budget is
//! used up; the loops touch no I/O), otherwise only the loop's first
//! instruction: events are handled at the same instruction boundaries as
//! without the hooks, and everything else is the same too (the runner's
//! `H3K_HLE_EXACT=1`, for checking the hooks against the interpreter).

use crate::cpu::{read16, write16, Bus, Cpu, CC_C, CC_N, CC_V, CC_Z};
use crate::roms::{RomSet, BANK_SIZE, KERNEL_SIZE};

/// The undefined opcode that marks a hooked loop.
pub const TRAP: u8 = 0x18;

/// Most hooks (kernel and banks together).
const MAX_HOOKS: usize = 16;
/// Most ROM banks with hooks (each needs a 16 KB copy).
pub const MAX_BANKS: usize = 4;

/// Space [`Hle::new`] needs for its ROM copies.
pub const SPACE: usize = KERNEL_SIZE + MAX_BANKS * BANK_SIZE;

#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub enum Hook {
    /// Shift-and-subtract division, one quotient bit per pass, X passes:
    /// `ROL lo; ROL lo-1; ROLB; ROLA; CMPD div; BCS +3; SUBD div;
    /// LEAX -1,X; BNE loop` (H3500 $BDF6, v1.53 $BCB5).
    Divide { lo: u16, div: u16 },
    /// The inner loop of the H3500's $DD5E: B 7-byte entries at Y are
    /// compared with A; for each match the word their bytes 1-2 point to,
    /// halved, is stored at $16,X. `PSHS B; CMPA 0,Y; BNE +14; PSHS B,A;
    /// LDD [1,Y]; LSRA; RORB; STD $16,X; PULS A,B; PULS B; LEAY 7,Y; DECB;
    /// BNE loop`.
    Scan,
    /// Linear search of an ascending table at X for the first entry
    /// greater than the word at `key`: `LDD ,X++; CMPD key; BLT +2;
    /// BRA loop` (module $65 of both ROM sets).
    Search { key: u16 },
    /// The other division loop, the subtraction first: `CMPD div;
    /// BCS +3; SUBD div; ROL lo; ROL lo-1; ORCC #1; ROLB; ROLA;
    /// LEAX -1,X; BNE loop` (H3500 $BF2C, v1.53 $BDEB; [`DIVIDE2`]).
    Divide2 { lo: u16, div: u16 },
    /// H3500 $DA0D: for each module (Y of them from X), entries of type $28
    /// get the word at `a28` at offset $16, type $29 the word at `a29`
    /// ([`WALK`]).
    Walk { a28: u16, a29: u16 },
    /// H3500 $CB4D: for each module (Y of them from X) whose type byte has
    /// bits 7:6 clear, a word at offset $16 different from the one at $14
    /// is copied there and the module's routine at [$11,X] called (the call
    /// is left to the interpreter; [`CHANGED`]).
    Changed,
    /// The NMI handler ([`NMI`]): a stack check, a call through the RAM
    /// vector at $6002 (normally to an RTS), the knob scan at `knob`
    /// ([`KNOB`], its variables at `vars`), two tick counters and the NMI
    /// acknowledge. Every 256th NMI does more (left to the interpreter).
    Nmi { knob: u16, vars: u16, count1: u16, count2: u16 },
}

/// Code templates: bytes, wildcards, and 16-bit operands that are one of
/// a few parameters (the same in every place) plus an offset.
#[derive(Clone, Copy)]
enum T {
    B(u8),
    Any,
    W(usize, u16),
}

use T::{Any, B, W};

/// Match a template at `code[at..]`; `params` collects the parameters.
fn template(code: &[u8], at: usize, t: &[T], params: &mut [Option<u16>; 2]) -> bool {
    let mut i = at;
    for tok in t {
        match *tok {
            B(b) => {
                if code.get(i) != Some(&b) {
                    return false;
                }
                i += 1;
            }
            Any => i += 1,
            W(p, off) => {
                if i + 2 > code.len() {
                    return false;
                }
                let v = word(code, i).wrapping_sub(off);
                match params[p] {
                    Some(q) if q != v => return false,
                    _ => params[p] = Some(v),
                }
                i += 2;
            }
        }
    }
    i <= code.len()
}

/// The NMI handler (H3500 $87F6, v1.53 $8823); parameters: the two tick
/// counters.
#[rustfmt::skip]
const NMI: [T; 69] = [
    B(0x1F), B(0x40), B(0x81), B(0x64), B(0x10), B(0x26), Any, Any, B(0xAD), B(0x9F), B(0x60), B(0x02),
    B(0x17), Any, Any, B(0x7C), W(0, 0), B(0x7C), W(1, 0), B(0x26), B(0x31),
    B(0xB6), W(1, 2), B(0x4D), B(0x27), B(0x1B), B(0x7D), W(1, 0x16), B(0x26), B(0x1D),
    B(0xF6), W(1, 0x15), B(0xB7), W(1, 0x15), B(0xB6), W(1, 3), B(0x8E), W(1, 4), B(0x4C), B(0x84), B(0x0F),
    B(0xE7), B(0x86), B(0xB7), W(1, 3), B(0x20), B(0x0D), B(0xC6), B(0x02), B(0xF7), W(1, 0x16), B(0x20), B(0x06),
    B(0xB7), W(1, 0x15), B(0x7A), W(1, 0x16), B(0x7F), W(1, 2),
    B(0x86), B(0x00), B(0xB7), B(0x80), B(0xA7), B(0x4C), B(0xB7), B(0x80), B(0xA7), B(0x3B),
];
/// [`Hook::Divide2`]; parameters: the divisor, the low byte of the
/// dividend.
#[rustfmt::skip]
const DIVIDE2: [T; 19] = [
    B(0x10), B(0xB3), W(0, 0), B(0x25), B(0x03), B(0xB3), W(0, 0), B(0x79), W(1, 0), B(0x79), W(1, 0xFFFF),
    B(0x1A), B(0x01), B(0x59), B(0x49), B(0x30), B(0x1F), B(0x26), B(0xE9),
];

/// [`Hook::Walk`]; parameters: the words for types $28 and $29.
#[rustfmt::skip]
const WALK: [T; 32] = [
    B(0xE6), B(0x89), B(0x00), B(0x00), B(0xC1), B(0x28), B(0x27), B(0x06), B(0xC1), B(0x29), B(0x27), B(0x07),
    B(0x20), B(0x0C), B(0xFC), W(0, 0), B(0x20), B(0x03), B(0xFC), W(1, 0), B(0xED), B(0x89), B(0x00), B(0x16),
    B(0x30), B(0x89), B(0x00), B(0x30), B(0x31), B(0x3F), B(0x26), B(0xDE),
];

/// [`Hook::Changed`].
#[rustfmt::skip]
const CHANGED: [T; 35] = [
    B(0xE6), B(0x89), B(0x00), B(0x00), B(0xC5), B(0xC0), B(0x26), B(0x13), B(0xEC), B(0x89), B(0x00), B(0x16),
    B(0x10), B(0xA3), B(0x89), B(0x00), B(0x14), B(0x27), B(0x08), B(0xED), B(0x89), B(0x00), B(0x14),
    B(0xAD), B(0x99), B(0x00), B(0x11), B(0x30), B(0x89), B(0x00), B(0x30), B(0x31), B(0x3F), B(0x26), B(0xDD),
];

/// Offset of the NMI acknowledge in [`NMI`].
const NMI_ACK: u16 = 0x48;

/// The knob scan (H3500 $9473, v1.53 $939D); parameters: its variables
/// (7 bytes) and its quadrature table (at offset 79).
#[rustfmt::skip]
const KNOB: [T; 98] = [
    B(0x7C), W(0, 0), B(0x26), B(0x03), B(0x7A), W(0, 0), B(0xF6), B(0x80), B(0x56), B(0xC4), B(0xC0),
    B(0x54), B(0x54), B(0xFA), W(0, 2), B(0x54), B(0x54), B(0xF7), W(0, 2), B(0x8E), W(1, 0),
    B(0xA6), B(0x85), B(0x27), B(0x0D), B(0x7D), W(0, 5), B(0x26), B(0x21), B(0xB7), W(0, 3), B(0xB7), W(0, 5),
    B(0x20), B(0x19), B(0xC4), B(0x0C), B(0x27), B(0x15), B(0xC1), B(0x0C), B(0x27), B(0x11), B(0xF1), W(0, 4),
    B(0x27), B(0x12), B(0xB6), W(0, 3), B(0xF7), W(0, 4), B(0xBB), W(0, 1), B(0xB7), W(0, 1),
    B(0x7D), W(0, 6), B(0x26), B(0x16), B(0x39), B(0x7F), W(0, 5), B(0x20), B(0xF5),
    B(0x00), B(0x01), B(0xFF), B(0x00), B(0xFF), B(0x00), B(0x00), B(0x01),
    B(0x01), B(0x00), B(0x00), B(0xFF), B(0x00), B(0xFF), B(0x01), B(0x00),
    B(0xB6), W(0, 1), B(0xB7), B(0x60), B(0x5E), B(0xB6), W(0, 0), B(0xB7), B(0x60), B(0x60), B(0x4F),
    B(0xB7), W(0, 1), B(0xB7), W(0, 0), B(0xB7), W(0, 6), B(0x39),
];

/// The NMI handler at `h` (the NMI vector's target) and its knob scan.
fn find_nmi(kernel: &[u8], h: u16) -> Option<Hook> {
    let at = h.checked_sub(0x8000)? as usize;
    let mut p = [None; 2];
    if !template(kernel, at, &NMI, &mut p) {
        return None;
    }
    let (count1, count2) = (p[0]?, p[1]?);
    let knob = h.wrapping_add(15).wrapping_add(word(kernel, at + 13));
    let mut k = [None; 2];
    if knob < 0x8400 || !template(kernel, (knob - 0x8000) as usize, &KNOB, &mut k) || k[1]? != knob.wrapping_add(79) {
        return None;
    }
    Some(Hook::Nmi { knob, vars: k[0]?, count1, count2 })
}

/// Loop signatures: the bytes from the loop's first instruction, `None`
/// for operand bytes that vary between ROM sets.
const DIVIDE: [Option<u8>; 21] = [
    Some(0x79), None, None, Some(0x79), None, None, Some(0x59), Some(0x49), Some(0x10), Some(0xB3), None, None,
    Some(0x25), Some(0x03), Some(0xB3), None, None, Some(0x30), Some(0x1F), Some(0x26), Some(0xEB),
];
const SCAN: [Option<u8>; 31] = [
    Some(0x34), Some(0x04), Some(0xA1), Some(0xA9), Some(0x00), Some(0x00), Some(0x26), Some(0x0E), Some(0x34),
    Some(0x06), Some(0xEC), Some(0xB9), Some(0x00), Some(0x01), Some(0x44), Some(0x56), Some(0xED), Some(0x89),
    Some(0x00), Some(0x16), Some(0x35), Some(0x06), Some(0x35), Some(0x04), Some(0x31), Some(0xA9), Some(0x00),
    Some(0x07), Some(0x5A), Some(0x26), Some(0xE1),
];
const SEARCH: [Option<u8>; 10] =
    [Some(0xEC), Some(0x81), Some(0x10), Some(0xB3), None, None, Some(0x2D), Some(0x02), Some(0x20), Some(0xF6)];

fn matches(code: &[u8], at: usize, sig: &[Option<u8>]) -> bool {
    at + sig.len() <= code.len() && sig.iter().enumerate().all(|(i, s)| s.map_or(true, |b| code[at + i] == b))
}

fn word(code: &[u8], at: usize) -> u16 {
    (code[at] as u16) << 8 | code[at + 1] as u16
}

/// The hooks found in 16 KB or 32 KB of code at CPU address `base`.
fn find(code: &[u8], base: u16, out: &mut impl FnMut(u16, Hook)) {
    for at in 0..code.len() {
        let pc = base.wrapping_add(at as u16);
        if matches(code, at, &DIVIDE) {
            let (lo, hi, div) = (word(code, at + 1), word(code, at + 4), word(code, at + 10));
            if hi == lo.wrapping_sub(1) && word(code, at + 15) == div {
                out(pc, Hook::Divide { lo, div });
            }
        } else if matches(code, at, &SCAN) {
            out(pc, Hook::Scan);
        } else if matches(code, at, &SEARCH) {
            out(pc, Hook::Search { key: word(code, at + 4) });
        } else {
            let mut p = [None; 2];
            if template(code, at, &DIVIDE2, &mut p) {
                out(pc, Hook::Divide2 { lo: p[1].unwrap(), div: p[0].unwrap() });
            } else if template(code, at, &WALK, &mut p) {
                out(pc, Hook::Walk { a28: p[0].unwrap(), a29: p[1].unwrap() });
            } else if template(code, at, &CHANGED, &mut p) {
                out(pc, Hook::Changed);
            }
        }
    }
}

/// The hooks of a ROM set, and the ROM copies with the traps in.
pub struct Hle<'a> {
    /// The kernel ROM as fetched as code.
    pub kernel: &'a [u8; KERNEL_SIZE],
    /// Banks with hooks, as fetched as code: (bank latch value, copy).
    banks: [(u8, Option<&'a [u8; BANK_SIZE]>); MAX_BANKS],
    /// (bank latch value or 0 for the kernel, PC, hook).
    hooks: [(u8, u16, Hook); MAX_HOOKS],
    n: usize,
    /// Stop where the interpreter would (see the module documentation).
    pub exact: bool,
    /// Traps taken (for diagnostics).
    pub traps: u32,
}

impl<'a> Hle<'a> {
    /// Find the hooks in `roms` and build the patched copies in `space`
    /// ([`SPACE`] bytes).
    pub fn new(roms: &RomSet<'a>, space: &'a mut [u8]) -> Self {
        let (kspace, mut bspace) = space.split_at_mut(KERNEL_SIZE);
        let kernel: &mut [u8; KERNEL_SIZE] = kspace.try_into().unwrap();
        kernel.copy_from_slice(roms.kernel);
        let mut hle = Hle { kernel: roms.kernel, banks: [(0, None); MAX_BANKS], hooks: [(0, 0, Hook::Scan); MAX_HOOKS], n: 0, exact: false, traps: 0 };
        // $8000-$83FF is I/O: no code.
        find(&roms.kernel[0x400..], 0x8400, &mut |pc, h| hle.add(0, pc, h));
        let nmi = word(roms.kernel, 0x7FFC);
        if let Some(h) = find_nmi(roms.kernel, nmi) {
            hle.add(0, nmi, h);
        }
        for &(_, pc, _) in &hle.hooks[..hle.n] {
            kernel[(pc - 0x8000) as usize] = TRAP;
        }
        hle.kernel = kernel;
        let mut nb = 0;
        for latch in 0..=255u8 {
            let Some(bank) = roms.bank(latch) else { continue };
            if latch == 0xE0 || latch == 0xE1 {
                // The kernel EPROM's first 32 KB: the kernel ROM.
                continue;
            }
            let first = hle.n;
            find(bank, 0, &mut |pc, h| hle.add(latch, pc, h));
            if hle.n == first {
                continue;
            }
            if nb == MAX_BANKS || bspace.len() < BANK_SIZE {
                hle.n = first;
                continue;
            }
            // A chip smaller than its socket shows at several latch values:
            // share the copy.
            let shared = hle.banks[..nb].iter().find_map(|&(l, c)| match (roms.bank(l), c) {
                (Some(b), Some(c)) if core::ptr::eq(b, bank) => Some(c),
                _ => None,
            });
            let copy: &'a [u8; BANK_SIZE] = match shared {
                Some(c) => c,
                None => {
                    let (b, rest) = bspace.split_at_mut(BANK_SIZE);
                    bspace = rest;
                    let b: &mut [u8; BANK_SIZE] = b.try_into().unwrap();
                    b.copy_from_slice(bank);
                    for &(_, pc, _) in &hle.hooks[first..hle.n] {
                        b[pc as usize] = TRAP;
                    }
                    b
                }
            };
            hle.banks[nb] = (latch, Some(copy));
            nb += 1;
        }
        hle
    }

    fn add(&mut self, latch: u8, pc: u16, hook: Hook) {
        if self.n < MAX_HOOKS {
            self.hooks[self.n] = (latch, pc, hook);
            self.n += 1;
        }
    }

    /// The patched copy of a bank, if it has hooks.
    pub fn bank(&self, latch: u8) -> Option<&'a [u8; BANK_SIZE]> {
        self.banks.iter().find(|b| b.0 == latch).and_then(|b| b.1)
    }

    /// The hook at `pc` (`latch`: the bank shown in the window).
    pub fn hook(&self, latch: u8, pc: u16) -> Option<Hook> {
        let latch = if pc >= 0x8000 { 0 } else { latch };
        self.hooks[..self.n].iter().find(|h| h.0 == latch && h.1 == pc).map(|h| h.2)
    }

    /// Number of hooks found.
    pub fn len(&self) -> usize {
        self.n
    }
}

/// Run the hooked loop whose trap was fetched at `cpu.pc - 1`, as a
/// [`Cpu::run`] with `room` cycles left would (see [`Hle::exact`]). Returns
/// the E cycles used (at least those of one instruction).
pub fn run<B: Bus>(cpu: &mut Cpu, bus: &mut B, hook: Hook, room: u32, exact: bool) -> u32 {
    let pc = cpu.pc.wrapping_sub(1);
    // Passes start while used < limit. Exact: the interpreter would not stop
    // before a pass's last instruction, which starts at most `before_last`
    // cycles into it.
    let limit = |before_last: u32| if exact { room.saturating_sub(before_last) } else { room };
    match hook {
        Hook::Divide { lo, div } => divide(cpu, bus, pc, lo, div, limit(41)),
        Hook::Scan => scan(cpu, bus, pc, limit(72)),
        Hook::Search { key } => search(cpu, bus, pc, key, limit(19)),
        Hook::Divide2 { lo, div } => divide2(cpu, bus, pc, lo, div, limit(44)),
        Hook::Walk { a28, a29 } => walk(cpu, bus, pc, a28, a29, limit(46)),
        Hook::Changed => changed(cpu, bus, pc, limit(49)),
        Hook::Nmi { knob, vars, count1, count2 } => {
            if exact {
                nmi::<true, B>(cpu, bus, pc, knob, vars, count1, count2, room)
            } else {
                nmi::<false, B>(cpu, bus, pc, knob, vars, count1, count2, u32::MAX)
            }
        }
    }
}

fn rol_mem<B: Bus>(cpu: &mut Cpu, bus: &mut B, addr: u16) {
    let v = bus.rd(addr);
    let r = cpu.rol(v);
    bus.wr(addr, r);
}

fn divide<B: Bus>(cpu: &mut Cpu, bus: &mut B, pc: u16, lo: u16, div: u16, limit: u32) -> u32 {
    let hi = lo.wrapping_sub(1);
    let mut used = 0;
    if bus.plain(lo) && bus.plain(hi) && bus.plain(div) && bus.plain(div.wrapping_add(1)) {
        // A pass takes 37 cycles, 44 with SUBD; 41 before its final BNE.
        while used < limit {
            rol_mem(cpu, bus, lo); // 7
            rol_mem(cpu, bus, hi); // 7
            cpu.b = cpu.rol(cpu.b); // 2
            cpu.a = cpu.rol(cpu.a); // 2
            let m = read16(bus, div);
            cpu.sub16(cpu.d(), m); // CMPD 8, BCS 3
            used += 29;
            if cpu.cc & CC_C == 0 {
                let m = read16(bus, div);
                let r = cpu.sub16(cpu.d(), m); // SUBD 7
                cpu.set_d(r);
                used += 7;
            }
            cpu.x = cpu.x.wrapping_sub(1); // LEAX 5, BNE 3
            cpu.cc = (cpu.cc & !CC_Z) | ((cpu.x == 0) as u8) << 2;
            used += 8;
            if cpu.x == 0 {
                cpu.pc = pc.wrapping_add(21);
                return used;
            }
        }
    }
    if used == 0 {
        rol_mem(cpu, bus, lo);
        cpu.pc = pc.wrapping_add(3);
        return 7;
    }
    cpu.pc = pc;
    used
}

fn scan<B: Bus>(cpu: &mut Cpu, bus: &mut B, pc: u16, limit: u32) -> u32 {
    let mut used = 0;
    // A pass takes 36 cycles, 75 on a match; 72 before its final BNE.
    while used < limit {
        let (s, y, out) = (cpu.s, cpu.y, cpu.x.wrapping_add(0x16));
        // Everything the pass may touch must be plain memory.
        if !(bus.plain(s.wrapping_sub(3)) && bus.plain(s.wrapping_sub(1)) && bus.plain(y)) {
            break;
        }
        let matched = bus.rd(y) == cpu.a;
        if matched {
            let p = y.wrapping_add(1);
            if !(bus.plain(p) && bus.plain(p.wrapping_add(1))) {
                break;
            }
            let target = read16(bus, p);
            if !(bus.plain(target) && bus.plain(target.wrapping_add(1)) && bus.plain(out) && bus.plain(out.wrapping_add(1))) {
                break;
            }
        }
        // PSHS B (6)
        cpu.s = s.wrapping_sub(1);
        bus.wr(cpu.s, cpu.b);
        // CMPA 0,Y (8), BNE (3)
        let m = bus.rd(y);
        cpu.sub8(cpu.a, m, 0);
        used += 17;
        if cpu.cc & CC_Z != 0 {
            // PSHS B,A (7)
            cpu.s = cpu.s.wrapping_sub(1);
            bus.wr(cpu.s, cpu.b);
            cpu.s = cpu.s.wrapping_sub(1);
            bus.wr(cpu.s, cpu.a);
            // LDD [1,Y] (12)
            let p = read16(bus, y.wrapping_add(1));
            let d = read16(bus, p);
            cpu.set_d(d);
            cpu.nz16_v0(d);
            // LSRA, RORB (4)
            cpu.a = cpu.lsr(cpu.a);
            cpu.b = cpu.ror(cpu.b);
            // STD $16,X (9)
            let d = cpu.d();
            cpu.nz16_v0(d);
            write16(bus, out, d);
            // PULS A,B (7)
            cpu.a = bus.rd(cpu.s);
            cpu.s = cpu.s.wrapping_add(1);
            cpu.b = bus.rd(cpu.s);
            cpu.s = cpu.s.wrapping_add(1);
            used += 39;
        }
        // PULS B (6)
        cpu.b = bus.rd(cpu.s);
        cpu.s = cpu.s.wrapping_add(1);
        // LEAY 7,Y (8)
        cpu.y = y.wrapping_add(7);
        cpu.cc = (cpu.cc & !CC_Z) | ((cpu.y == 0) as u8) << 2;
        // DECB (2), BNE (3)
        cpu.b = cpu.dec(cpu.b);
        used += 19;
        if cpu.b == 0 {
            cpu.pc = pc.wrapping_add(31);
            return used;
        }
    }
    if used == 0 {
        // PSHS B
        cpu.s = cpu.s.wrapping_sub(1);
        bus.wr(cpu.s, cpu.b);
        cpu.pc = pc.wrapping_add(2);
        return 6;
    }
    cpu.pc = pc;
    used
}

fn search<B: Bus>(cpu: &mut Cpu, bus: &mut B, pc: u16, key: u16, limit: u32) -> u32 {
    let mut used = 0;
    if bus.plain(key) && bus.plain(key.wrapping_add(1)) {
        // A pass takes 22 cycles (19 when it ends); 19 before its last
        // instruction.
        while used < limit && bus.plain(cpu.x) && bus.plain(cpu.x.wrapping_add(1)) {
            // LDD ,X++ (8)
            let d = read16(bus, cpu.x);
            cpu.x = cpu.x.wrapping_add(2);
            cpu.set_d(d);
            cpu.nz16_v0(d);
            // CMPD key (8), BLT (3)
            let m = read16(bus, key);
            cpu.sub16(d, m);
            used += 19;
            let n = cpu.cc & CC_N != 0;
            let v = cpu.cc & CC_V != 0;
            if n != v {
                cpu.pc = pc.wrapping_add(10);
                return used;
            }
            // BRA (3)
            used += 3;
        }
    }
    if used == 0 {
        let d = read16(bus, cpu.x);
        cpu.x = cpu.x.wrapping_add(2);
        cpu.set_d(d);
        cpu.nz16_v0(d);
        cpu.pc = pc.wrapping_add(2);
        return 8;
    }
    cpu.pc = pc;
    used
}

fn divide2<B: Bus>(cpu: &mut Cpu, bus: &mut B, pc: u16, lo: u16, div: u16, limit: u32) -> u32 {
    let hi = lo.wrapping_sub(1);
    let mut used = 0;
    if bus.plain(lo) && bus.plain(hi) && bus.plain(div) && bus.plain(div.wrapping_add(1)) {
        // A pass takes 40 cycles, 47 with SUBD; 44 before its final BNE.
        while used < limit {
            let m = read16(bus, div);
            cpu.sub16(cpu.d(), m); // CMPD 8, BCS 3
            used += 11;
            if cpu.cc & CC_C == 0 {
                let m = read16(bus, div);
                let r = cpu.sub16(cpu.d(), m); // SUBD 7
                cpu.set_d(r);
                used += 7;
            }
            rol_mem(cpu, bus, lo); // 7
            rol_mem(cpu, bus, hi); // 7
            cpu.cc |= CC_C; // ORCC #1: 3
            cpu.b = cpu.rol(cpu.b); // 2
            cpu.a = cpu.rol(cpu.a); // 2
            cpu.x = cpu.x.wrapping_sub(1); // LEAX 5, BNE 3
            cpu.cc = (cpu.cc & !CC_Z) | ((cpu.x == 0) as u8) << 2;
            used += 29;
            if cpu.x == 0 {
                cpu.pc = pc.wrapping_add(23);
                return used;
            }
        }
    }
    if used == 0 {
        let m = read16(bus, div);
        cpu.sub16(cpu.d(), m);
        cpu.pc = pc.wrapping_add(4);
        return 8;
    }
    cpu.pc = pc;
    used
}

/// Whether the words at `a` and `a + 1`... are all plain memory.
fn plain2<B: Bus>(bus: &mut B, a: u16) -> bool {
    bus.plain(a) && bus.plain(a.wrapping_add(1))
}

fn walk<B: Bus>(cpu: &mut Cpu, bus: &mut B, pc: u16, a28: u16, a29: u16, limit: u32) -> u32 {
    let mut used = 0;
    if plain2(bus, a28) && plain2(bus, a29) {
        // A pass takes 37 to 49 cycles; 46 before its final BNE.
        while used < limit {
            let (x, out) = (cpu.x, cpu.x.wrapping_add(0x16));
            if !(bus.plain(x) && plain2(bus, out)) {
                break;
            }
            // LDB 0,X (8), CMPB #$28 (2), BEQ (3)
            let m = bus.rd(x);
            cpu.b = cpu.ld(cpu.b, m);
            cpu.sub8(cpu.b, 0x28, 0);
            used += 13;
            let mut from = None;
            if cpu.cc & CC_Z != 0 {
                from = Some(a28); // LDD a28 (6), BRA (3)
                used += 9;
            } else {
                cpu.sub8(cpu.b, 0x29, 0); // CMPB #$29 (2), BEQ (3)
                used += 5;
                if cpu.cc & CC_Z != 0 {
                    from = Some(a29); // LDD a29 (6)
                    used += 6;
                } else {
                    used += 3; // BRA
                }
            }
            if let Some(a) = from {
                let d = read16(bus, a);
                cpu.set_d(d);
                cpu.nz16_v0(d);
                cpu.nz16_v0(d); // STD $16,X (9)
                write16(bus, out, d);
                used += 9;
            }
            // LEAX $30,X (8), LEAY -1,Y (5), BNE (3)
            cpu.x = x.wrapping_add(0x30);
            cpu.y = cpu.y.wrapping_sub(1);
            cpu.cc = (cpu.cc & !CC_Z) | ((cpu.y == 0) as u8) << 2;
            used += 16;
            if cpu.y == 0 {
                cpu.pc = pc.wrapping_add(34);
                return used;
            }
        }
    }
    if used == 0 {
        // LDB 0,X
        let m = bus.rd(cpu.x);
        cpu.b = cpu.ld(cpu.b, m);
        cpu.pc = pc.wrapping_add(4);
        return 8;
    }
    cpu.pc = pc;
    used
}

fn changed<B: Bus>(cpu: &mut Cpu, bus: &mut B, pc: u16, limit: u32) -> u32 {
    let mut used = 0;
    // A pass takes 29 or 52 cycles (49 before its final BNE), or ends after
    // 45 at the call.
    while used < limit {
        let x = cpu.x;
        if !(bus.plain(x) && plain2(bus, x.wrapping_add(0x14)) && plain2(bus, x.wrapping_add(0x16))) {
            break;
        }
        // LDB 0,X (8), BITB #$C0 (2), BNE (3)
        let m = bus.rd(x);
        cpu.b = cpu.ld(cpu.b, m);
        cpu.nz8_v0(cpu.b & 0xC0);
        used += 13;
        if cpu.cc & CC_Z != 0 {
            // LDD $16,X (9), CMPD $14,X (11), BEQ (3)
            let d = read16(bus, x.wrapping_add(0x16));
            cpu.set_d(d);
            cpu.nz16_v0(d);
            let m = read16(bus, x.wrapping_add(0x14));
            cpu.sub16(d, m);
            used += 23;
            if cpu.cc & CC_Z == 0 {
                // STD $14,X (9); the JSR [$11,X] is the interpreter's
                cpu.nz16_v0(d);
                write16(bus, x.wrapping_add(0x14), d);
                cpu.pc = pc.wrapping_add(23);
                return used + 9;
            }
        }
        // LEAX $30,X (8), LEAY -1,Y (5), BNE (3)
        cpu.x = x.wrapping_add(0x30);
        cpu.y = cpu.y.wrapping_sub(1);
        cpu.cc = (cpu.cc & !CC_Z) | ((cpu.y == 0) as u8) << 2;
        used += 16;
        if cpu.y == 0 {
            cpu.pc = pc.wrapping_add(35);
            return used;
        }
    }
    if used == 0 {
        // LDB 0,X
        let m = bus.rd(cpu.x);
        cpu.b = cpu.ld(cpu.b, m);
        cpu.pc = pc.wrapping_add(4);
        return 8;
    }
    cpu.pc = pc;
    used
}

/// After an instruction of `used` cycles in all: in exact mode, stop there
/// (the PC is already the next instruction's) if the limit is reached.
macro_rules! next {
    ($exact:ident, $used:ident, $limit:ident, $c:expr) => {
        $used += $c;
        if $exact && $used >= $limit {
            return $used;
        }
    };
}

/// The NMI handler at `h`; in exact mode stopping after the first
/// instruction that reaches `limit` cycles. Stops before anything unusual.
#[allow(clippy::too_many_arguments)]
fn nmi<const EXACT: bool, B: Bus>(
    cpu: &mut Cpu,
    bus: &mut B,
    h: u16,
    knob: u16,
    vars: u16,
    count1: u16,
    count2: u16,
    limit: u32,
) -> u32 {
    let at = |o: u16| h.wrapping_add(o);
    let mut used = 0;
    // TFR S,D
    cpu.set_d(cpu.s);
    cpu.pc = at(2);
    next!(EXACT, used, limit, 6);
    // CMPA #$64
    cpu.sub8(cpu.a, 0x64, 0);
    cpu.pc = at(4);
    next!(EXACT, used, limit, 2);
    // LBNE to the reset code
    if cpu.cc & CC_Z == 0 {
        return used;
    }
    cpu.pc = at(8);
    next!(EXACT, used, limit, 5);
    // JSR [$6002], normally to an RTS
    let target = read16(bus, 0x6002);
    if !(bus.plain(cpu.s.wrapping_sub(2)) && bus.plain(target) && bus.code(target) == 0x39) {
        return used;
    }
    cpu.push16_s(bus, at(12));
    cpu.pc = target;
    next!(EXACT, used, limit, 12);
    // RTS
    cpu.pc = cpu.pull16_s(bus);
    next!(EXACT, used, limit, 5);
    // LBSR knob
    cpu.push16_s(bus, at(15));
    cpu.pc = knob;
    next!(EXACT, used, limit, 9);
    if !knob_scan::<EXACT, B>(cpu, bus, knob, vars, &mut used, limit) {
        return used;
    }
    // INC count1; INC count2
    rmw(cpu, bus, count1, Cpu::inc);
    cpu.pc = at(18);
    next!(EXACT, used, limit, 7);
    rmw(cpu, bus, count2, Cpu::inc);
    cpu.pc = at(21);
    next!(EXACT, used, limit, 7);
    // BNE to the acknowledge; every 256th NMI does more first
    if cpu.cc & CC_Z != 0 {
        cpu.pc = at(23);
        return used + 3;
    }
    cpu.pc = at(NMI_ACK);
    next!(EXACT, used, limit, 3);
    // LDA #0; STA $80A7; INCA; STA $80A7
    cpu.a = cpu.ld(cpu.a, 0);
    cpu.pc = at(NMI_ACK + 2);
    next!(EXACT, used, limit, 2);
    store(cpu, bus, 0x80A7, cpu.a);
    cpu.pc = at(NMI_ACK + 5);
    next!(EXACT, used, limit, 5);
    cpu.a = cpu.inc(cpu.a);
    cpu.pc = at(NMI_ACK + 6);
    next!(EXACT, used, limit, 2);
    store(cpu, bus, 0x80A7, cpu.a);
    cpu.pc = at(NMI_ACK + 9);
    next!(EXACT, used, limit, 5);
    // RTI
    used + cpu.rti(bus)
}

/// Extended-mode read-modify-write.
fn rmw<B: Bus>(cpu: &mut Cpu, bus: &mut B, addr: u16, f: fn(&mut Cpu, u8) -> u8) {
    let v = bus.rd(addr);
    let r = f(cpu, v);
    bus.wr(addr, r);
}

/// STA / STB.
fn store<B: Bus>(cpu: &mut Cpu, bus: &mut B, addr: u16, v: u8) {
    cpu.nz8_v0(v);
    bus.wr(addr, v);
}

/// The knob scan at `k` ([`KNOB`], variables at `v`), from its first
/// instruction to its RTS; `used` counts on. False if it stopped before the
/// end (the PC is then the next instruction's).
fn knob_scan<const EXACT: bool, B: Bus>(cpu: &mut Cpu, bus: &mut B, k: u16, v: u16, used: &mut u32, limit: u32) -> bool {
    // After the instruction: the next one is at k + `pc`.
    macro_rules! next {
        ($pc:expr, $c:expr) => {
            cpu.pc = k.wrapping_add($pc);
            *used += $c;
            if EXACT && *used >= limit {
                return false;
            }
        };
    }
    let z = |cpu: &Cpu| cpu.cc & CC_Z != 0;
    let var = |o: u16| v.wrapping_add(o);
    // INC v+0; BNE +3; DEC v+0: a counter that sticks at $FF
    rmw(cpu, bus, v, Cpu::inc);
    next!(3, 7);
    if z(cpu) {
        next!(5, 3);
        rmw(cpu, bus, v, Cpu::dec);
        next!(8, 7);
    } else {
        next!(8, 3);
    }
    // LDB $8056: the knob's quadrature bits
    let m = bus.rd(0x8056);
    cpu.b = cpu.ld(cpu.b, m);
    next!(11, 5);
    // ANDB #$C0; LSRB; LSRB; ORB v+2; LSRB; LSRB; STB v+2
    cpu.b = cpu.and(cpu.b, 0xC0);
    next!(13, 2);
    cpu.b = cpu.lsr(cpu.b);
    next!(14, 2);
    cpu.b = cpu.lsr(cpu.b);
    next!(15, 2);
    let m = bus.rd(var(2));
    cpu.b = cpu.or(cpu.b, m);
    next!(18, 5);
    cpu.b = cpu.lsr(cpu.b);
    next!(19, 2);
    cpu.b = cpu.lsr(cpu.b);
    next!(20, 2);
    store(cpu, bus, var(2), cpu.b);
    next!(23, 5);
    // LDX #table; LDA B,X
    let table = k.wrapping_add(79);
    cpu.x = table;
    cpu.nz16_v0(table);
    next!(26, 3);
    let ea = table.wrapping_add(cpu.b as i8 as i16 as u16);
    if !bus.plain(ea) {
        return false;
    }
    let m = bus.rd(ea);
    cpu.a = cpu.ld(cpu.a, m);
    next!(28, 5);
    // BEQ L1
    if !z(cpu) {
        next!(30, 3);
        // TST v+5; BNE L3; STA v+3; STA v+5; BRA L3
        let m = bus.rd(var(5));
        cpu.tst(m);
        next!(33, 7);
        if z(cpu) {
            next!(35, 3);
            store(cpu, bus, var(3), cpu.a);
            next!(38, 5);
            store(cpu, bus, var(5), cpu.a);
            next!(41, 5);
            next!(68, 3);
        } else {
            next!(68, 3);
        }
    } else {
        // L1: ANDB #$0C; BEQ L3; CMPB #$0C; BEQ L3; CMPB v+4; BEQ L2
        next!(43, 3);
        cpu.b = cpu.and(cpu.b, 0x0C);
        next!(45, 2);
        if z(cpu) {
            next!(68, 3);
        } else {
            next!(47, 3);
            cpu.sub8(cpu.b, 0x0C, 0);
            next!(49, 2);
            if z(cpu) {
                next!(68, 3);
            } else {
                next!(51, 3);
                let m = bus.rd(var(4));
                cpu.sub8(cpu.b, m, 0);
                next!(54, 5);
                if z(cpu) {
                    // L2: CLR v+5; BRA L3
                    next!(74, 3);
                    cpu.clr(0);
                    bus.wr(var(5), 0);
                    next!(77, 7);
                    next!(68, 3);
                } else {
                    // LDA v+3; STB v+4; ADDA v+1; STA v+1
                    next!(56, 3);
                    let m = bus.rd(var(3));
                    cpu.a = cpu.ld(cpu.a, m);
                    next!(59, 5);
                    store(cpu, bus, var(4), cpu.b);
                    next!(62, 5);
                    let m = bus.rd(var(1));
                    cpu.a = cpu.add(cpu.a, m);
                    next!(65, 5);
                    store(cpu, bus, var(1), cpu.a);
                    next!(68, 5);
                }
            }
        }
    }
    // L3: TST v+6; BNE L4; RTS
    let m = bus.rd(var(6));
    cpu.tst(m);
    next!(71, 7);
    if z(cpu) {
        next!(73, 3);
    } else {
        // L4: hand the knob's movement over (to $605E/$6060) and restart
        next!(95, 3);
        let m = bus.rd(var(1));
        cpu.a = cpu.ld(cpu.a, m);
        next!(98, 5);
        store(cpu, bus, 0x605E, cpu.a);
        next!(101, 5);
        let m = bus.rd(v);
        cpu.a = cpu.ld(cpu.a, m);
        next!(104, 5);
        store(cpu, bus, 0x6060, cpu.a);
        next!(107, 5);
        cpu.a = cpu.clr(cpu.a);
        next!(108, 2);
        store(cpu, bus, var(1), cpu.a);
        next!(111, 5);
        store(cpu, bus, v, cpu.a);
        next!(114, 5);
        store(cpu, bus, var(6), cpu.a);
        next!(117, 5);
    }
    // RTS
    cpu.pc = cpu.pull16_s(bus);
    *used += 5;
    !EXACT || *used < limit
}

#[cfg(test)]
mod tests {
    use super::*;

    /// The ROMs in H3000-Firmware (next to this crate).
    fn rom(name: &str) -> Vec<u8> {
        std::fs::read(std::path::Path::new(env!("CARGO_MANIFEST_DIR")).join("../H3000-Firmware").join(name)).unwrap()
    }

    #[test]
    fn hooks_found() {
        let rom1 = rom("H3000-Upgrade_ROM1.BIN");
        let rom2 = rom("H3000-Upgrade_ROM2.BIN");
        let roms = RomSet::h3500(&rom1, &[&rom2]);
        let mut space = vec![0u8; SPACE];
        let hle = Hle::new(&roms, &mut space);
        assert_eq!(hle.hook(0, 0xBDF6), Some(Hook::Divide { lo: 0x61DA, div: 0x61D7 }));
        assert_eq!(hle.hook(0, 0xDD71), Some(Hook::Scan));
        assert_eq!(hle.hook(2, 0x1F52), Some(Hook::Search { key: 0x710E }));
        assert_eq!(hle.hook(0, 0x87F6), Some(Hook::Nmi { knob: 0x9473, vars: 0x616C, count1: 0x61B8, count2: 0x613A }));
        assert_eq!(hle.hook(0, 0xBDB1), Some(Hook::Divide { lo: 0x61DA, div: 0x61D7 }));
        assert_eq!(hle.hook(0, 0xBF2C), Some(Hook::Divide2 { lo: 0x61DA, div: 0x61D7 }));
        assert_eq!(hle.hook(0, 0xDA0D), Some(Hook::Walk { a28: 0x60FE, a29: 0x6100 }));
        assert_eq!(hle.hook(0, 0xCB4D), Some(Hook::Changed));
        assert_eq!(hle.kernel[0xBDF6 - 0x8000], TRAP);
        assert_eq!(roms.kernel[0xBDF6 - 0x8000], 0x79);
        let big = rom("H3000_153_BigROM.BIN");
        let small = rom("H3000_153_SmallROM.BIN");
        let roms = RomSet::h3000_v153(&big, &small);
        let mut space = vec![0u8; SPACE];
        let hle = Hle::new(&roms, &mut space);
        assert_eq!(hle.hook(0, 0xBCB5), Some(Hook::Divide { lo: 0x6187, div: 0x6184 }));
        assert_eq!(hle.hook(0, 0x8823), Some(Hook::Nmi { knob: 0x939D, vars: 0x612F, count1: 0x6165, count2: 0x6107 }));
        assert_eq!(hle.hook(0, 0xBDEB), Some(Hook::Divide2 { lo: 0x6187, div: 0x6184 }));
        assert_eq!(hle.hook(0xC0, 0x1ED8), Some(Hook::Search { key: 0x70F6 }));
        assert_eq!(hle.bank(0xC0).unwrap()[0x1ED8], TRAP);
    }
}
