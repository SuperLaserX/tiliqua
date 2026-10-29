"""Instruction-level, cycle-counted TMS32010 model.

Used as a golden reference for the H3000 gateware and as a reverse-engineering
aid. Behaviour follows the TMS32010 User's Guide (1985): 32-bit ACC with
optional overflow saturation (OVM), 16x16 multiplier into P, 4-level stack,
two auxiliary registers (only the low 9 bits take part in auto inc/dec and
BANZ), DP selects the 128-word data page.

I/O is delegated to a ``bus`` object with ``read(dsp, port, cycle)`` and
``write(dsp, port, value, cycle)`` methods; BIO is sampled via
``bus.bio(dsp, cycle)``. ``step()`` executes one whole instruction and
returns its cycle count; the I/O access happens on the first cycle of the
instruction, which matches the IKA32010 bus timing (OUT drives the bus in
the first instruction cycle, IN latches at the end of the first cycle).
"""

MASK16 = 0xFFFF
MASK32 = 0xFFFFFFFF


def s16(v):
    v &= MASK16
    return v - 0x10000 if v & 0x8000 else v


def s32(v):
    v &= MASK32
    return v - 0x100000000 if v & 0x80000000 else v


class TMS32010:

    RAM_WORDS = 256  # real part has 144; IKA32010 implements 256

    def __init__(self, index, bus):
        self.index = index
        self.bus = bus
        self.pmem = [0x7F80] * 4096
        self.reset()

    def load(self, origin, words):
        # The H3000's program RAM is 2K words, mirrored at 0x000 and 0x800
        # (A11 is not decoded): programs are loaded at 0x800 and reset enters
        # the same words at 0x000. Both halves are kept identical here.
        for i, w in enumerate(words):
            self._pstore(origin + i, w)

    def _pstore(self, addr, w):
        self.pmem[addr & 0x7FF] = w & MASK16
        self.pmem[(addr & 0x7FF) | 0x800] = w & MASK16

    def reset(self):
        self.pc = 0
        self.acc = 0
        self.p = 0
        self.t = 0
        self.ar = [0, 0]
        self.arp = 0
        self.dp = 0
        self.ov = 0
        self.ovm = 0
        self.intm = 1
        self.stack = [0, 0, 0, 0]
        self.ram = [0] * self.RAM_WORDS
        self.cycle = 0

    # -- helpers ---------------------------------------------------------

    def _sat(self, result):
        """Wrap or saturate a mathematically exact result into ACC; set OV."""
        if result > 0x7FFFFFFF or result < -0x80000000:
            self.ov = 1
            if self.ovm:
                return 0x7FFFFFFF if result > 0 else 0x80000000
        return result & MASK32

    def _addr(self, lo):
        if lo & 0x80:
            return self.ar[self.arp] & 0xFF
        return (self.dp << 7) | (lo & 0x7F)

    def _post(self, lo):
        """Indirect addressing side effects: AR inc/dec then ARP update."""
        if not (lo & 0x80):
            return
        a = self.ar[self.arp]
        if lo & 0x20:
            a = (a & ~0x1FF) | ((a + 1) & 0x1FF)
        elif lo & 0x10:
            a = (a & ~0x1FF) | ((a - 1) & 0x1FF)
        self.ar[self.arp] = a & MASK16
        if not (lo & 0x08):
            self.arp = lo & 1

    def _rd(self, a):
        return self.ram[a] & MASK16

    def _wr(self, a, v):
        self.ram[a] = v & MASK16

    def _push(self, v):
        self.stack = [v & 0xFFF] + self.stack[:3]

    def _pop(self):
        v = self.stack[0]
        self.stack = self.stack[1:] + [self.stack[3]]
        return v

    def _mul(self, a, b):
        self.p = (s16(a) * b) & MASK32

    # -- execution -------------------------------------------------------

    def step(self):
        pc = self.pc
        w = self.pmem[pc]
        hi = w >> 8
        lo = w & 0xFF
        npc = (pc + 1) & 0xFFF
        cyc = 1
        acc = s32(self.acc)

        top4 = w >> 12
        if top4 == 0x0:  # ADD dma, shift
            a = self._addr(lo)
            self.acc = self._sat(acc + (s16(self._rd(a)) << (hi & 0xF)))
            self._post(lo)
        elif top4 == 0x1:  # SUB
            a = self._addr(lo)
            self.acc = self._sat(acc - (s16(self._rd(a)) << (hi & 0xF)))
            self._post(lo)
        elif top4 == 0x2:  # LAC
            a = self._addr(lo)
            self.acc = (s16(self._rd(a)) << (hi & 0xF)) & MASK32
            self._post(lo)
        elif top4 == 0x3:
            if (hi & 0xFE) == 0x38:  # LAR
                a = self._addr(lo)
                v = self._rd(a)
                self._post(lo)
                self.ar[hi & 1] = v
            elif (hi & 0xFE) == 0x30:  # SAR
                a = self._addr(lo)
                self._wr(a, self.ar[hi & 1])
                self._post(lo)
            else:
                raise ValueError("bad op %04X @%03X" % (w, pc))
        elif top4 == 0x4:  # IN / OUT
            port = hi & 7
            a = self._addr(lo)
            if hi & 0x08:
                self.bus.write(self.index, port, self._rd(a), self.cycle)
            else:
                self._wr(a, self.bus.read(self.index, port, self.cycle) & MASK16)
            self._post(lo)
            cyc = 2
        elif top4 == 0x5:  # SACL / SACH
            a = self._addr(lo)
            if hi & 0x08:
                sh = hi & 7
                self._wr(a, ((self.acc << sh) >> 16))
            else:
                self._wr(a, self.acc)
            self._post(lo)
        elif hi == 0x60:  # ADDH
            a = self._addr(lo)
            self.acc = self._sat(acc + (s16(self._rd(a)) << 16))
            self._post(lo)
        elif hi == 0x61:  # ADDS
            a = self._addr(lo)
            self.acc = self._sat(acc + self._rd(a))
            self._post(lo)
        elif hi == 0x62:  # SUBH
            a = self._addr(lo)
            self.acc = self._sat(acc - (s16(self._rd(a)) << 16))
            self._post(lo)
        elif hi == 0x63:  # SUBS
            a = self._addr(lo)
            self.acc = self._sat(acc - self._rd(a))
            self._post(lo)
        elif hi == 0x64:  # SUBC
            a = self._addr(lo)
            diff = (self.acc - (s16(self._rd(a)) << 15)) & MASK32
            if not (diff & 0x80000000):
                self.acc = ((diff << 1) + 1) & MASK32
            else:
                self.acc = (self.acc << 1) & MASK32
            self._post(lo)
        elif hi == 0x65:  # ZALH
            a = self._addr(lo)
            self.acc = (self._rd(a) << 16) & MASK32
            self._post(lo)
        elif hi == 0x66:  # ZALS
            a = self._addr(lo)
            self.acc = self._rd(a)
            self._post(lo)
        elif hi == 0x67:  # TBLR
            a = self._addr(lo)
            self._wr(a, self.bus.pread(self.index, self.acc & 0xFFF) if hasattr(self.bus, "pread")
                     else self.pmem[self.acc & 0xFFF])
            self._post(lo)
            cyc = 3
        elif hi == 0x68:  # MAR / LARP
            self._post(lo)
        elif hi == 0x69:  # DMOV
            a = self._addr(lo)
            self._wr((a & 0x80) | ((a + 1) & 0x7F), self._rd(a))
            self._post(lo)
        elif hi == 0x6A:  # LT
            a = self._addr(lo)
            self.t = self._rd(a)
            self._post(lo)
        elif hi == 0x6B:  # LTD
            a = self._addr(lo)
            self.t = self._rd(a)
            self.acc = self._sat(acc + s32(self.p))
            self._wr((a & 0x80) | ((a + 1) & 0x7F), self._rd(a))
            self._post(lo)
        elif hi == 0x6C:  # LTA
            a = self._addr(lo)
            self.t = self._rd(a)
            self.acc = self._sat(acc + s32(self.p))
            self._post(lo)
        elif hi == 0x6D:  # MPY
            a = self._addr(lo)
            self._mul(self.t, s16(self._rd(a)))
            self._post(lo)
        elif hi == 0x6E:  # LDPK
            self.dp = lo & 1
        elif hi == 0x6F:  # LDP
            a = self._addr(lo)
            self.dp = self._rd(a) & 1
            self._post(lo)
        elif (hi & 0xFE) == 0x70:  # LARK
            self.ar[hi & 1] = lo
        elif hi == 0x78:  # XOR
            a = self._addr(lo)
            self.acc ^= self._rd(a)
            self._post(lo)
        elif hi == 0x79:  # AND
            a = self._addr(lo)
            self.acc &= self._rd(a)
            self._post(lo)
        elif hi == 0x7A:  # OR
            a = self._addr(lo)
            self.acc |= self._rd(a)
            self._post(lo)
        elif hi == 0x7B:  # LST
            a = self._addr(lo)
            v = self._rd(a)
            self._post(lo)
            self.ov = (v >> 15) & 1
            self.ovm = (v >> 14) & 1
            self.dp = v & 1
            if not (lo & 0x80):
                self.arp = (v >> 8) & 1
        elif hi == 0x7C:  # SST (always page 1 when direct)
            if lo & 0x80:
                a = self._addr(lo)
            else:
                a = 0x80 | (lo & 0x7F)
            v = (self.ov << 15) | (self.ovm << 14) | (self.intm << 13) | 0x1EFE | (self.arp << 8) | self.dp
            self._wr(a, v)
            self._post(lo)
        elif hi == 0x7D:  # TBLW
            a = self._addr(lo)
            if hasattr(self.bus, "pwrite"):
                self.bus.pwrite(self.index, self.acc & 0xFFF, self._rd(a))
            else:
                self._pstore(self.acc, self._rd(a))
            self._post(lo)
            cyc = 3
        elif hi == 0x7E:  # LACK
            self.acc = lo
        elif hi == 0x7F:
            if w == 0x7F80:
                pass  # NOP
            elif w == 0x7F81:
                self.intm = 1
            elif w == 0x7F82:
                self.intm = 0
            elif w == 0x7F88:  # ABS
                if acc < 0:
                    self.acc = self._sat(-acc)
            elif w == 0x7F89:  # ZAC
                self.acc = 0
            elif w == 0x7F8A:
                self.ovm = 0
            elif w == 0x7F8B:
                self.ovm = 1
            elif w == 0x7F8C:  # CALA
                self._push(npc)
                npc = self.acc & 0xFFF
                cyc = 2
            elif w == 0x7F8D:  # RET
                npc = self._pop()
                cyc = 2
            elif w == 0x7F8E:  # PAC
                self.acc = self.p
            elif w == 0x7F8F:  # APAC
                self.acc = self._sat(acc + s32(self.p))
            elif w == 0x7F90:  # SPAC
                self.acc = self._sat(acc - s32(self.p))
            elif w == 0x7F9C:  # PUSH
                self._push(self.acc)
                cyc = 2
            elif w == 0x7F9D:  # POP
                self.acc = self._pop()
                cyc = 2
            else:
                raise ValueError("bad op %04X @%03X" % (w, pc))
        elif (w >> 13) == 0b100:  # MPYK
            k = w & 0x1FFF
            if k & 0x1000:
                k -= 0x2000
            self._mul(self.t, k)
        elif (w & 0xF0FF) == 0xF000:  # branches
            tgt = self.pmem[npc] & 0xFFF
            npc2 = (npc + 1) & 0xFFF
            cyc = 2
            take = False
            if hi == 0xF4:  # BANZ
                take = (self.ar[self.arp] & 0x1FF) != 0
                a = self.ar[self.arp]
                self.ar[self.arp] = (a & ~0x1FF) | ((a - 1) & 0x1FF)
            elif hi == 0xF5:
                take = bool(self.ov)
                self.ov = 0
            elif hi == 0xF6:
                take = self.bus.bio(self.index, self.cycle) == 0
            elif hi == 0xF8:
                self._push(npc2)
                take = True
            elif hi == 0xF9:
                take = True
            elif hi == 0xFA:
                take = acc < 0
            elif hi == 0xFB:
                take = acc <= 0
            elif hi == 0xFC:
                take = acc > 0
            elif hi == 0xFD:
                take = acc >= 0
            elif hi == 0xFE:
                take = acc != 0
            elif hi == 0xFF:
                take = acc == 0
            else:
                raise ValueError("bad branch %04X @%03X" % (w, pc))
            npc = tgt if take else npc2
        else:
            raise ValueError("bad op %04X @%03X" % (w, pc))

        self.pc = npc
        self.cycle += cyc
        return cyc
