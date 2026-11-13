"""The engine's PSRAM master: its transfer requests, carried out on the bus.

The engine runs in its own clock domain (`engine_domain`, `fast` in the SoC)
and hands over requests (`Req`: a burst read or write of up to 63 words at a
32-bit word address, and where in its stream buffers the words go or come
from). An asynchronous FIFO carries them across, and a state machine in `sync`
runs each burst on the wishbone bus, in order, moving the words directly
between the bus and the engine's stream buffers: those are dual-clock block
RAMs whose bus-side ports (`sbr_w`, `sbw_addr`/`sbw_data`) are in `sync`. A
read's words go into the read buffer as they arrive; a write's come out of the
write buffer one clock after their address, so the next word's address is set
up as the bus takes a word. Each burst's end goes back to the engine as a
`done` pulse. `pending` is high from a request's arrival to its burst's end,
for the PSRAM arbiter's priority master.
"""

from amaranth import *
from amaranth.lib import data, stream, wiring
from amaranth.lib.cdc import PulseSynchronizer
from amaranth.lib.fifo import AsyncFIFOBuffered
from amaranth.lib.wiring import In, Out
from amaranth_soc import wishbone

from .engine import Req


def bus_signature(addr_width=23):
    return wishbone.Signature(addr_width=addr_width, data_width=32, granularity=8,
                              features={"cti", "bte"})


class PsramMaster(wiring.Component):

    def __init__(self, *, addr_width=23, engine_domain="fast", sbuf_r_addr=10, sbuf_w_addr=8):
        self.engine_domain = engine_domain
        super().__init__({
            "req": In(stream.Signature(Req)),               # engine domain
            "done": Out(1),                                 # engine domain: a transfer finished
            "sbr_w": Out(data.StructLayout({"addr": sbuf_r_addr, "data": 32, "en": 1})),
            "sbw_addr": Out(sbuf_w_addr),
            "sbw_data": In(32),
            "bus": Out(bus_signature(addr_width)),
            "pending": Out(1),
        })

    def elaborate(self, platform):
        m = Module()
        ed = self.engine_domain
        m.submodules.reqf = reqf = AsyncFIFOBuffered(width=Req.size, depth=8, w_domain=ed, r_domain="sync")
        m.submodules.done_ps = done_ps = PulseSynchronizer("sync", ed)
        m.d.comb += [
            reqf.w_data.eq(self.req.payload), reqf.w_en.eq(self.req.valid), self.req.ready.eq(reqf.w_rdy),
            self.done.eq(done_ps.o),
        ]

        bus = self.bus
        req = Signal(Req)
        beat = Signal(6)
        busy = Signal()
        m.d.comb += [bus.sel.eq(0b1111), bus.bte.eq(wishbone.BurstTypeExt.LINEAR),
                     bus.adr.eq(req.addr + beat),
                     bus.cti.eq(Mux(beat == req.words - 1, wishbone.CycleType.END_OF_BURST,
                                    wishbone.CycleType.INCR_BURST)),
                     self.pending.eq(reqf.r_rdy | busy)]
        last = beat == req.words - 1

        def beat_taken():
            with m.If(bus.ack):
                m.d.sync += beat.eq(beat + 1)
                with m.If(last):
                    m.d.sync += busy.eq(0)
                    m.d.comb += done_ps.i.eq(1)
                    m.next = "IDLE"

        with m.FSM():
            with m.State("IDLE"):
                with m.If(reqf.r_rdy):
                    m.d.comb += reqf.r_en.eq(1)
                    m.d.sync += [req.eq(reqf.r_data), beat.eq(0), busy.eq(1)]
                    m.next = "PREP"
            with m.State("PREP"):
                # A write's first word comes out of the buffer a clock after its address.
                m.d.comb += self.sbw_addr.eq(req.buf)
                with m.If(req.write):
                    m.next = "WRITE"
                with m.Else():
                    m.next = "READ"
            with m.State("READ"):
                m.d.comb += [
                    bus.cyc.eq(1), bus.stb.eq(1), bus.we.eq(0),
                    self.sbr_w.addr.eq(req.buf + beat), self.sbr_w.data.eq(bus.dat_r),
                    self.sbr_w.en.eq(bus.ack),
                ]
                beat_taken()
            with m.State("WRITE"):
                m.d.comb += [
                    bus.cyc.eq(1), bus.stb.eq(1), bus.we.eq(1), bus.dat_w.eq(self.sbw_data),
                    self.sbw_addr.eq(req.buf + beat + bus.ack),
                ]
                beat_taken()
        return m
