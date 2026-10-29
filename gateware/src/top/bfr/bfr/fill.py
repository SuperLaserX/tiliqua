"""Fill engine: writes one value to a run of PSRAM words, in bursts.

The firmware clears the framebuffer with it (518 KB on the round panel): about
3 ms of the bus, where the CPU's word-at-a-time stores took about 60.

A master on the PSRAM's wide bus (`WidePsramPeripheral.add_master`; round
robin per transaction, so the framebuffer's scan-out and the engine's
streams keep their turns between bursts). Bursts are BURST words, aligned,
with the first and last cut to fit.

The CPU writes `base` (a word address on the bus), `words` and `value`, then
`start`; `busy` reads 1 until the last word is written. A start while busy
is ignored.

The plotter's cache is not part of this: lines it holds from before a fill
can be written back after it. The firmware moves them off the visible
screen first (see fw/src/main.rs, `clear_screen`).
"""

from amaranth import *
from amaranth.lib import wiring
from amaranth.lib.wiring import In, Out
from amaranth_soc import csr, wishbone

from .stream import bus_signature

BURST = 32


class FillEngine(wiring.Component):

    class Base(csr.Register, access="w"):
        base: csr.Field(csr.action.W, unsigned(23))

    class Words(csr.Register, access="w"):
        words: csr.Field(csr.action.W, unsigned(23))

    class Value(csr.Register, access="w"):
        value: csr.Field(csr.action.W, unsigned(32))

    class Start(csr.Register, access="w"):
        start: csr.Field(csr.action.W, unsigned(1))

    class Status(csr.Register, access="r"):
        busy: csr.Field(csr.action.R, unsigned(1))

    def __init__(self, addr_width=23):
        regs = csr.Builder(addr_width=5, data_width=8)
        self._base   = regs.add("base",   self.Base(),   offset=0x00)
        self._words  = regs.add("words",  self.Words(),  offset=0x04)
        self._value  = regs.add("value",  self.Value(),  offset=0x08)
        self._start  = regs.add("start",  self.Start(),  offset=0x0C)
        self._status = regs.add("status", self.Status(), offset=0x10)
        self._bridge = csr.Bridge(regs.as_memory_map())
        super().__init__({
            "csr_bus": In(csr.Signature(addr_width=regs.addr_width, data_width=regs.data_width)),
            "bus": Out(bus_signature(addr_width)),
        })
        self.csr_bus.memory_map = self._bridge.bus.memory_map

    def elaborate(self, platform):
        m = Module()
        m.submodules.bridge = self._bridge
        wiring.connect(m, wiring.flipped(self.csr_bus), self._bridge.bus)
        bus = self.bus

        def held(field, name):
            value = Signal(len(field.w_data), name=name)
            with m.If(field.w_stb):
                m.d.sync += value.eq(field.w_data)
            return value

        base = held(self._base.f.base, "base")
        words = held(self._words.f.words, "words")
        value = held(self._value.f.value, "value")
        start = self._start.f.start.w_stb & self._start.f.start.w_data

        adr = Signal(len(bus.adr))
        left = Signal(len(words))           # words still to write
        beats = Signal(range(BURST + 1))    # in this burst
        to_boundary = BURST - adr[:BURST.bit_length() - 1]

        m.d.comb += [
            bus.sel.eq(0b1111),
            bus.bte.eq(wishbone.BurstTypeExt.LINEAR),
            bus.dat_w.eq(value),
            bus.we.eq(1),
            bus.adr.eq(adr),
        ]
        with m.FSM() as fsm:
            with m.State("IDLE"):
                with m.If(start & (words != 0)):
                    m.d.sync += [adr.eq(base), left.eq(words)]
                    m.next = "SIZE"
            with m.State("SIZE"):
                m.d.sync += beats.eq(Mux(left < to_boundary, left, to_boundary))
                m.next = "WRITE"
            with m.State("WRITE"):
                last = beats == 1
                m.d.comb += [
                    bus.cyc.eq(1), bus.stb.eq(1),
                    bus.cti.eq(Mux(last, wishbone.CycleType.END_OF_BURST,
                                   wishbone.CycleType.INCR_BURST)),
                ]
                with m.If(bus.ack):
                    m.d.sync += [adr.eq(adr + 1), left.eq(left - 1), beats.eq(beats - 1)]
                    with m.If(last):
                        # Release the bus for a cycle: the arbiter's turn.
                        m.next = "NEXT"
            with m.State("NEXT"):
                with m.If(left == 0):
                    m.next = "IDLE"
                with m.Else():
                    m.next = "SIZE"
        # (busy from the start strobe on, as the CPU reads it right after)
        m.d.comb += self._status.f.busy.r_data.eq(~fsm.ongoing("IDLE") | (start & (words != 0)))
        return m
