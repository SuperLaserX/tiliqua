"""Block RAM with its output register: a read takes two clocks, and the data comes
out of the register in the RAM itself.

An ECP5 block RAM read without the output register (all yosys maps to) has its data
5.8 ns after the clock, which leaves the 120 MHz engine 2.5 ns to reach the next
register. With the output register (`REGMODE = "OUTREG"`) the data is a register's.
`BlockRam` instantiates `DP16KD`s that way on hardware, wired as yosys's own
`brams_map.v` wires them; elsewhere it is an Amaranth memory and a register, with
the same two-clock latency.

Shapes: depth 1024 by up to 18 bits (true dual-port, `DP16KD` 1024 x 18, port A
writes, port B reads), depth 512 by up to 36 (the 36-bit pseudo-dual-port mode),
and wider memories as several side by side. The write port is in `w_domain`, the
read port and its register in `r_domain`; the 36-bit mode is used only when the
two are one domain (which port's clock its output register uses doesn't matter
then).
"""

from amaranth import *
from amaranth.lib import wiring
from amaranth.lib.memory import Memory
from amaranth.lib.wiring import In, Out
from amaranth.utils import ceil_log2

__all__ = ["BlockRam"]


class BlockRam(wiring.Component):

    def __init__(self, width, depth, *, w_domain="sync", r_domain="sync", hw=False):
        assert depth in (512, 1024) or depth < 512, depth
        self.width, self.depth = width, depth
        self.w_domain, self.r_domain = w_domain, r_domain
        self.hw = hw
        abits = ceil_log2(depth)
        super().__init__({
            "w_addr": In(abits), "w_data": In(width), "w_en": In(1),
            "r_addr": In(abits), "r_data": Out(width),
        })

    def elaborate(self, platform):
        m = Module()
        if not self.hw:
            m.submodules.mem = mem = Memory(shape=unsigned(self.width), depth=self.depth, init=[])
            wp = mem.write_port(domain=self.w_domain)
            rp = mem.read_port(domain=self.r_domain, transparent_for=())
            m.d.comb += [wp.addr.eq(self.w_addr), wp.data.eq(self.w_data), wp.en.eq(self.w_en),
                         rp.addr.eq(self.r_addr)]
            m.d[self.r_domain] += self.r_data.eq(rp.data)
            return m

        wide = self.depth <= 512 and self.w_domain == self.r_domain
        lane = 36 if wide else 18
        n = -(-self.width // lane)
        for k in range(n):
            lo = k * lane
            w = min(lane, self.width - lo)
            di = Cat(self.w_data[lo:lo + w], C(0, lane - w))
            do = Signal(lane, name=f"do{k}")
            m.d.comb += self.r_data[lo:lo + w].eq(do[:w])
            if wide:
                m.submodules[f"ram{k}"] = self._pdp36(di, do)
            else:
                m.submodules[f"ram{k}"] = self._tdp18(di, do)
        return m

    def _common(self):
        return dict(p_RESETMODE="SYNC", p_ASYNC_RESET_RELEASE="SYNC", p_CSDECODE_A="0b000",
                    p_CSDECODE_B="0b000", p_CLKAMUX="CLKA", p_CLKBMUX="CLKB", p_GSR="AUTO",
                    i_CLKA=ClockSignal(self.w_domain), i_CLKB=ClockSignal(self.r_domain),
                    i_RSTA=C(0), i_RSTB=C(0), i_CSA0=C(0), i_CSA1=C(0), i_CSA2=C(0),
                    i_CSB0=C(0), i_CSB1=C(0), i_CSB2=C(0))

    def _tdp18(self, di, do):
        """1024 x 18: port A writes, port B reads through its output register. The
        word address is in AD[13:4]; for 18-bit writes AD[1:0] are the byte enables."""
        wa = Cat(C(0b11, 2), C(0, 2), self.w_addr, C(0, 10 - len(self.w_addr)))
        ra = Cat(C(0, 4), self.r_addr, C(0, 10 - len(self.r_addr)))
        ports = {}
        for i in range(14):
            ports[f"i_ADA{i}"] = wa[i]
            ports[f"i_ADB{i}"] = ra[i]
        for i in range(18):
            ports[f"i_DIA{i}"] = di[i]
            ports[f"i_DIB{i}"] = C(0)
            ports[f"o_DOB{i}"] = do[i]
        return Instance(
            "DP16KD", p_DATA_WIDTH_A=18, p_DATA_WIDTH_B=18, p_REGMODE_A="NOREG", p_REGMODE_B="OUTREG",
            p_WRITEMODE_A="NORMAL", p_WRITEMODE_B="NORMAL",
            i_WEA=self.w_en, i_CEA=C(1), i_OCEA=C(1), i_WEB=C(0), i_CEB=C(1), i_OCEB=C(1),
            **self._common(), **ports)

    def _pdp36(self, di, do):
        """512 x 36 (pseudo dual-port): A writes 36 bits with AD[3:0] as the byte
        enables and the word in AD[13:5]; B reads the word in AD[13:5], low half on
        DOA, high half on DOB."""
        be = Mux(self.w_en, 0b1111, 0b0000)
        wa = Cat(be, C(0, 1), self.w_addr, C(0, 9 - len(self.w_addr)))
        ra = Cat(C(0, 5), self.r_addr, C(0, 9 - len(self.r_addr)))
        ports = {}
        for i in range(14):
            ports[f"i_ADA{i}"] = wa[i]
            ports[f"i_ADB{i}"] = ra[i]
        for i in range(18):
            ports[f"i_DIA{i}"] = di[i]
            ports[f"i_DIB{i}"] = di[18 + i]
            ports[f"o_DOA{i}"] = do[i]
            ports[f"o_DOB{i}"] = do[18 + i]
        return Instance(
            "DP16KD", p_DATA_WIDTH_A=36, p_DATA_WIDTH_B=36, p_REGMODE_A="OUTREG", p_REGMODE_B="OUTREG",
            i_WEA=C(1), i_CEA=C(1), i_OCEA=C(1), i_WEB=C(0), i_CEB=C(1), i_OCEB=C(1),
            **self._common(), **ports)
