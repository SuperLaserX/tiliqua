"""Simulation top for the H3000 DSP board (CXXRTL).

Flattens the board's streams into plain ports so the C++ testbench
(``tb_board.cpp``) can drive them, and exposes the bus debug taps.
"""

import os
import sys

from amaranth import *
from amaranth.back import rtlil

sys.path.insert(0, os.path.join(os.path.dirname(__file__), ".."))
from h3000.board import H3000DspBoard, DelayMemBRAM, N_DSP, FRAME_CYCLES  # noqa: E402
from h3000.cache import DelayCache  # noqa: E402
from amaranth_soc import wishbone  # noqa: E402
from mockpsram import MockPSRAM  # noqa: E402

WB = wishbone.Signature(addr_width=22, data_width=32, granularity=8, features={"cti", "bte"})


class SimTop(Elaboratable):

    def __init__(self, mem_words=65536, cache=False, psram_latency=30):
        self.board = H3000DspBoard()
        self.mem_words = mem_words
        self.cache = cache
        self.psram_latency = psram_latency
        self.frameclk = Signal(16)
        self.misses = Signal(32)
        self.writebacks = Signal(32)
        self.run = Signal()
        self.clockmode = Signal(2)
        self.busvalid = Signal()
        self.busport = Signal(3)
        self.busdata = Signal(16)
        self.busread = Signal()
        self.busready = Signal()
        self.busresult = Signal(16)
        self.busreads = Signal(8)
        self.flags = Signal(8)
        self.firq = Signal()
        self.ploadvalid = Signal()
        self.ploaddsp = Signal(2)
        self.ploadaddr = Signal(12)
        self.ploaddata = Signal(16)
        self.paramvalid = Signal()
        self.paramaddr = Signal(16)
        self.paramdata = Signal(16)
        self.paramready = Signal()
        self.adcvalid = Signal()
        self.adcl = Signal(16)
        self.adcr = Signal(16)
        self.adcready = Signal()
        self.dacvalid = Signal()
        self.dacl = Signal(16)
        self.dacr = Signal(16)
        self.frames = Signal(32)
        self.stallclk = Signal(32)
        self.ncen = Signal()
        self.pos = Signal(range(FRAME_CYCLES))
        self.aout = [Signal(12, name=f"aout{n}") for n in range(N_DSP)]
        self.wen = [Signal(name=f"wen{n}") for n in range(N_DSP)]
        self.denn = [Signal(name=f"denn{n}") for n in range(N_DSP)]
        self.dout = [Signal(16, name=f"dout{n}") for n in range(N_DSP)]
        self.din = [Signal(16, name=f"din{n}") for n in range(N_DSP)]

    def ports(self):
        p = [self.run, self.clockmode, self.busvalid, self.busport, self.busdata,
             self.busread, self.busready, self.busresult, self.busreads, self.flags,
             self.firq, self.ploadvalid, self.ploaddsp, self.ploadaddr,
             self.ploaddata, self.paramvalid, self.paramaddr, self.paramdata,
             self.paramready, self.adcvalid, self.adcl, self.adcr, self.adcready,
             self.dacvalid, self.dacl, self.dacr, self.frames, self.stallclk,
             self.ncen, self.pos, self.frameclk, self.misses, self.writebacks]
        return p + self.aout + self.wen + self.denn + self.dout + self.din

    def elaborate(self, platform):
        m = Module()
        b = self.board
        m.submodules.board = b
        from amaranth.lib import wiring
        if self.cache:
            m.submodules.dmem = dmem = DelayCache(bus_signature=WB, base_word=0, words=4096)
            m.submodules.psram = psram = MockPSRAM(signature=WB, words=32768,
                                                   latency=self.psram_latency)
            wiring.connect(m, dmem.wb, psram.bus)
            m.d.comb += [
                self.misses.eq(dmem.misses),
                self.writebacks.eq(dmem.writebacks),
            ]
        else:
            m.submodules.dmem = dmem = DelayMemBRAM(self.mem_words)
        wiring.connect(m, b.mem, dmem.bus)
        m.d.comb += self.frameclk.eq(b.frame_clocks)
        m.d.comb += [
            b.run.eq(self.run),
            b.clock_mode.eq(self.clockmode),
            b.bus_req.valid.eq(self.busvalid),
            b.bus_req.payload.port.eq(self.busport),
            b.bus_req.payload.data.eq(self.busdata),
            b.bus_req.payload.read.eq(self.busread),
            self.busready.eq(b.bus_req.ready),
            self.busresult.eq(b.bus_result),
            self.busreads.eq(b.bus_reads),
            self.flags.eq(b.flags),
            self.firq.eq(b.firq),
            b.pload.valid.eq(self.ploadvalid),
            b.pload.payload.dsp.eq(self.ploaddsp),
            b.pload.payload.addr.eq(self.ploadaddr),
            b.pload.payload.data.eq(self.ploaddata),
            b.param.valid.eq(self.paramvalid),
            b.param.payload.addr.eq(self.paramaddr),
            b.param.payload.data.eq(self.paramdata),
            self.paramready.eq(b.param.ready),
            b.adc.valid.eq(self.adcvalid),
            b.adc.payload[0].eq(self.adcl),
            b.adc.payload[1].eq(self.adcr),
            self.adcready.eq(b.adc.ready),
            self.dacvalid.eq(b.dac.valid),
            self.dacl.eq(b.dac.payload[0]),
            self.dacr.eq(b.dac.payload[1]),
            b.dac.ready.eq(1),
            self.frames.eq(b.frames),
            self.stallclk.eq(b.stall_clocks),
            self.ncen.eq(b.dbg_ncen),
            self.pos.eq(b.dbg_pos),
        ]
        for n in range(N_DSP):
            m.d.comb += [
                self.aout[n].eq(b.dbg_aout[n]),
                self.wen[n].eq(b.dbg_we_n[n]),
                self.denn[n].eq(b.dbg_den_n[n]),
                self.dout[n].eq(b.dbg_dout[n]),
                self.din[n].eq(b.dbg_din[n]),
            ]
        return m


if __name__ == "__main__":
    out = sys.argv[1]
    top = SimTop(cache="--cache" in sys.argv)
    with open(out, "w") as f:
        f.write(rtlil.convert(top, ports=top.ports()))
