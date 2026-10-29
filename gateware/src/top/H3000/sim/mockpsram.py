"""Wishbone memory with PSRAM-like latency, for simulating the delay cache."""

from amaranth import *
from amaranth.lib import wiring
from amaranth.lib.memory import Memory
from amaranth.lib.wiring import In
from amaranth_soc import wishbone


class MockPSRAM(wiring.Component):

    """Acks the first beat of each transaction ``latency`` clocks after it
    starts, then one beat per clock while the burst continues. Only the low
    ``exact_log2(words)`` address bits are decoded."""

    def __init__(self, *, signature, words=32768, latency=24):
        self.words = words
        self.latency = latency
        super().__init__({"bus": In(signature)})

    def elaborate(self, platform):
        m = Module()
        bits = (self.words - 1).bit_length()
        m.submodules.mem = mem = Memory(shape=unsigned(32), depth=self.words, init=[])
        rd = mem.read_port(domain="comb")
        wr = mem.write_port(granularity=8)

        wait = Signal(range(self.latency + 1))
        busy = Signal()
        go = Signal()
        m.d.comb += go.eq(self.bus.cyc & self.bus.stb & (wait == 0) & busy)
        with m.If(self.bus.cyc & self.bus.stb):
            with m.If(~busy):
                m.d.sync += [busy.eq(1), wait.eq(self.latency)]
            with m.Elif(wait != 0):
                m.d.sync += wait.eq(wait - 1)
        with m.If(go & ((self.bus.cti == wishbone.CycleType.END_OF_BURST) |
                        (self.bus.cti == wishbone.CycleType.CLASSIC))):
            m.d.sync += busy.eq(0)
        with m.If(~self.bus.cyc):
            m.d.sync += busy.eq(0)

        m.d.comb += [
            rd.addr.eq(self.bus.adr[:bits]),
            self.bus.dat_r.eq(rd.data),
            self.bus.ack.eq(go),
            wr.addr.eq(self.bus.adr[:bits]),
            wr.data.eq(self.bus.dat_w),
            wr.en.eq(Mux(go & self.bus.we, self.bus.sel, 0)),
        ]
        return m
