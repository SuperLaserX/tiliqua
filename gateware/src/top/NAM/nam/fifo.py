"""A small FIFO whose read enable reaches almost no logic.

The engine reads its z and newest FIFOs from the issue decision, the longest
path at 120 MHz; Amaranth's `SyncFIFO` gates the read with its level and
updates the level with an adder after it. Here a write lands the clock after
it is offered, so the pointer logic sees only registers; the read enable is
the read pointer's clock enable, one mux input of the level's next value, and
the select of `ne`, "holds a value", between two registers worked out a clock
ahead for either case. The caller must not read when `ne` is low, nor write
when full (the engine never has more than eight values queued); there is no
level output.
"""

from amaranth import *
from amaranth.lib import wiring
from amaranth.lib.memory import Memory
from amaranth.lib.wiring import In, Out
from amaranth.utils import exact_log2

__all__ = ["QuickFifo"]


class QuickFifo(wiring.Component):

    def __init__(self, width, depth=16):
        self.width, self.depth = width, depth
        super().__init__({
            "w_data": In(width), "w_en": In(1),
            "r_data": Out(width), "r_en": In(1),
            "ne": Out(1),
        })

    def elaborate(self, platform):
        m = Module()
        bits = exact_log2(self.depth)
        m.submodules.mem = mem = Memory(shape=unsigned(self.width), depth=self.depth, init=[])
        wp = mem.write_port()
        rp = mem.read_port(domain="comb")
        # The write lands a clock after it is offered.
        w_en_q = Signal()
        w_data_q = Signal(self.width)
        m.d.sync += [w_en_q.eq(self.w_en), w_data_q.eq(self.w_data)]
        w_ptr = Signal(bits)
        r_ptr = Signal(bits)
        m.d.comb += [wp.addr.eq(w_ptr), wp.data.eq(w_data_q), wp.en.eq(w_en_q),
                     rp.addr.eq(r_ptr), self.r_data.eq(rp.data)]
        with m.If(w_en_q):
            m.d.sync += w_ptr.eq(w_ptr + 1)
        with m.If(self.r_en):
            m.d.sync += r_ptr.eq(r_ptr + 1)
        # held: values readable now; landed: once this clock's write is in, before a read.
        held = Signal(bits)
        landed = Signal(bits)
        m.d.comb += landed.eq(held + w_en_q)
        m.d.sync += held.eq(Mux(self.r_en, landed - 1, landed))
        # `ne` after the next clock, for either read enable then: `landed` less this
        # clock's read plus the write offered now, against 0 (if not read) and 1 (if read).
        c0, c1, c2 = landed != 0, landed != 1, landed != 2
        ne_if_not = Signal()
        ne_if_read = Signal(reset=1)
        m.d.sync += [
            ne_if_not.eq(Mux(self.r_en, Mux(self.w_en, c0, c1), Mux(self.w_en, 1, c0))),
            ne_if_read.eq(Mux(self.r_en, Mux(self.w_en, c1, c2), Mux(self.w_en, c0, c1))),
            self.ne.eq(Mux(self.r_en, ne_if_read, ne_if_not)),
        ]
        return m
