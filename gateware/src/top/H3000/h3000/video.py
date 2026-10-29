"""Video overrides for this project (the shared Tiliqua files are not edited).

The framebuffer's DVI timing. With the large-cache CPU the pixel clock
missed 74.25 MHz on every seed until two stock paths were fixed, so
`DVITimingGen` and `DMAFramebuffer` are copied below with the fixes:

- the timing generator computes the coordinates where frames and syncs
  start (h_active - h_total and so on) in the same clock as its compares:
  two carry chains in series. They are registered here (they only change
  while the DVI domain is held in reset; cycle-identical to the stock).
- the scan-out resets its byte counter on vsync straight from the compare
  logic; a registered vsync is used instead (it realigns during blanking).

The blitter. The panel's glyph sheet (5 KB) is larger than the stock
blitter's 1024-word sprite memory, so it gets 2048 words (the CPU's window
onto it is 8 KiB).

`fixed_timing_framebuffer()` and `blitter_memory()` hand `TiliquaSoc` these
while it is built.
"""

import contextlib
import functools

from amaranth import *
from amaranth.lib import wiring
from amaranth.lib.cdc import FFSynchronizer
from amaranth.lib.fifo import AsyncFIFOBuffered
from amaranth.utils import exact_log2
from amaranth_soc import wishbone

from tiliqua.build import sim
from tiliqua.raster import blit
from tiliqua.video import dvi, framebuffer
from tiliqua.video.types import Pixel


class FixedTimingGen(dvi.DVITimingGen):
    """`DVITimingGen` with the coordinates derived from the timings registered."""

    def elaborate(self, platform) -> Module:
        m = Module()

        timings = self.timings

        # Coordinates derived from the timings, registered: they only change
        # while the DVI domain is held in reset, and computing them in the
        # same cycle as the comparisons below put two carry chains in series
        # on the pixel clock's critical path. Not reset, so that they are
        # valid when the reset ends.
        def derived(name, value):
            r = Signal(signed(len(timings.h_total) + 1), name=name, reset_less=True)
            m.d.dvi += r.eq(value)
            return r

        # coordinates at which each frame starts
        self.h_reset = derived("h_reset", timings.h_active - timings.h_total)
        self.v_reset = derived("v_reset", timings.v_active - timings.v_total)

        # coordinates at which sync starts / ends
        self.hs_start = derived("hs_start", timings.h_sync_start - timings.h_total)
        self.vs_start = derived("vs_start", timings.v_sync_start - timings.v_total)
        self.hs_end   = derived("hs_end",   timings.h_sync_end   - timings.h_total)
        self.vs_end   = derived("vs_end",   timings.v_sync_end   - timings.v_total)

        # last coordinates of a line / frame
        h_last = derived("h_last", timings.h_active - 1)
        v_last = derived("v_last", timings.v_active - 1)

        with m.If(ResetSignal("dvi")):
            m.d.dvi += [
                self.x.eq(self.h_reset),
                self.y.eq(self.v_reset),
            ]
        with m.Elif(self.x == h_last):
            m.d.dvi += self.x.eq(self.h_reset)
            with m.If(self.y == v_last):
                m.d.dvi += self.y.eq(self.v_reset)
            with m.Else():
                m.d.dvi += self.y.eq(self.y+1)
        with m.Else():
            m.d.dvi += self.x.eq(self.x+1)

        # Generate all control signals based on index.
        # Sync inversion must be handled before the PHY (see below).
        m.d.comb += [
            self.ctrl.hsync.eq((self.x >= self.hs_start) & (self.x < self.hs_end)),
            self.ctrl.vsync.eq((self.y > self.vs_start) &
                               (self.y < self.vs_end) |
                               ((self.y == self.vs_start) & (self.x >= self.hs_start)) |
                               ((self.y == self.vs_end)   & (self.x < self.hs_start))),
            self.ctrl.de.eq((self.x >= 0) & (self.y >= 0)),

        ]

        # Apply inversion where required.
        m.d.comb += [
            self.ctrl_phy.de.eq(self.ctrl.de),
            self.ctrl_phy.hsync.eq(self.ctrl.hsync ^ self.timings.h_sync_invert),
            self.ctrl_phy.vsync.eq(self.ctrl.vsync ^ self.timings.v_sync_invert),
        ]

        return m


class FixedTimingFramebuffer(framebuffer.DMAFramebuffer):
    """`DMAFramebuffer` (copied) with `FixedTimingGen` and a registered vsync
    for the scan-out's byte counter."""

    def elaborate(self, platform) -> Module:
        m = Module()

        if self.fixed_modeline is not None:
            for member in self.fbp.timings.signature.members:
                m.d.comb += getattr(self.fbp.timings, member).eq(getattr(self.fixed_modeline, member))

        m.submodules.fifo = fifo = AsyncFIFOBuffered(
                width=32, depth=self.fifo_depth, r_domain='dvi', w_domain='sync')

        m.submodules.dvi_tgen = dvi_tgen = FixedTimingGen()

        # TODO: FFSync needed? (sync -> dvi crossing, but should always be in reset when changed).
        wiring.connect(m, wiring.flipped(self.fbp.timings), dvi_tgen.timings)

        # Create a VSync signal in the 'sync' domain. Decoupled from display VSync inversion!
        phy_vsync_sync = Signal()
        m.submodules.vsync_ff = FFSynchronizer(
                i=dvi_tgen.ctrl.vsync, o=phy_vsync_sync, o_domain="sync")

        # DMA master bus
        bus = self.bus

        # Current offset into the framebuffer
        dma_addr = Signal(32)
        burst_cnt = Signal(16, init=0)

        # DMA bus master -> FIFO state machine
        # Burst until FIFO is full, then wait until half empty.

        fb_size_words = (self.fbp.timings.active_pixels * self.bytes_per_pixel) // 4

        # Read to FIFO in sync domain
        with m.FSM() as fsm:
            with m.State('WAIT-VSYNC'):
                with m.If(phy_vsync_sync):
                    m.d.sync += dma_addr.eq(0)
                    m.next = 'WAIT'
            with m.State('BURST'):
                m.d.comb += [
                    bus.stb.eq(1),
                    bus.cyc.eq(1),
                    bus.we.eq(0),
                    bus.sel.eq(2**(bus.data_width//8)-1),
                    bus.adr.eq(self.fbp.base + dma_addr),
                    fifo.w_en.eq(bus.ack),
                    fifo.w_data.eq(bus.dat_r),
                    bus.cti.eq(
                        wishbone.CycleType.INCR_BURST),
                ]

                with m.If(bus.ack):
                    m.d.sync += [
                        burst_cnt.eq(burst_cnt + 1),
                        dma_addr.eq(dma_addr+1),
                    ]

                with m.If((fifo.w_level == (self.fifo_depth-1)) |
                          (burst_cnt == self.burst_threshold_words)):
                    m.d.comb += bus.cti.eq(
                            wishbone.CycleType.END_OF_BURST)
                    m.next = 'WAIT'

                with m.If(dma_addr == (fb_size_words-1)):
                    m.d.comb += bus.cti.eq(
                            wishbone.CycleType.END_OF_BURST)
                    m.next = 'WAIT-VSYNC'

            with m.State('WAIT'):
                with m.If(fifo.w_level < self.fifo_depth-self.burst_threshold_words):
                    m.d.sync += burst_cnt.eq(0)
                    m.next = 'BURST'

        # -- DVI domain pixel stream to PHY --

        # Stage 1: FIFO read -> ScanPixel
        # (1 FIFO word is N pixels, extracted byte-by-byte)
        bytecounter = Signal(exact_log2(4//self.bytes_per_pixel))
        last_word   = Signal(32)
        # vsync only realigns the byte counter, during blanking: registered,
        # it keeps the timing compares off the FIFO read path.
        vsync_r     = Signal()
        m.d.dvi += vsync_r.eq(dvi_tgen.ctrl.vsync)
        with m.If(vsync_r):
            m.d.dvi += bytecounter.eq(0)
        with m.Elif(dvi_tgen.ctrl.de & fifo.r_rdy):
            m.d.comb += fifo.r_en.eq(bytecounter == 0),
            m.d.dvi += bytecounter.eq(bytecounter+1)
            with m.If(bytecounter == 0):
                m.d.dvi += last_word.eq(fifo.r_data)
            with m.Else():
                m.d.dvi += last_word.eq(last_word >> 8)

        # 1-cycle delayed x/y to align with last_word
        pixel_x = Signal(signed(12))
        pixel_y = Signal(signed(12))
        m.d.dvi += pixel_x.eq(dvi_tgen.x)
        m.d.dvi += pixel_y.eq(dvi_tgen.y)

        # Stage 1.5: Optional beamracing overlay (ScanPixel -> ScanPixel)
        if self._overlay is not None:
            first_input = self._overlay.i
            m.d.comb += self.palette.i.eq(self._overlay.o)
        else:
            first_input = self.palette.i

        m.d.comb += [
            first_input.pixel.eq(last_word[:Pixel.as_shape().size]),
            first_input.x.eq(pixel_x),
            first_input.y.eq(pixel_y),
            first_input.de.eq(dvi_tgen.ctrl_phy.de),
            first_input.hsync.eq(dvi_tgen.ctrl_phy.hsync),
            first_input.vsync.eq(dvi_tgen.ctrl_phy.vsync),
        ]

        # Stage 2/3: Palette and DVI PHY / simulation output
        if sim.is_hw(platform):
            m.submodules.dvi_gen = dvi_gen = dvi.DVIPHY()
            m.d.comb += dvi_gen.i.eq(self.palette.o)
        else:
            m.d.comb += [
                self.simif.de.eq(self.palette.o.de),
                self.simif.vsync.eq(self.palette.o.vsync),
                self.simif.hsync.eq(self.palette.o.hsync),
                self.simif.r.eq(self.palette.o.r),
                self.simif.g.eq(self.palette.o.g),
                self.simif.b.eq(self.palette.o.b),
            ]

        return m


@contextlib.contextmanager
def fixed_timing_framebuffer():
    """Within this block, `TiliquaSoc` builds a `FixedTimingFramebuffer`."""
    stock = framebuffer.DMAFramebuffer
    framebuffer.DMAFramebuffer = FixedTimingFramebuffer
    try:
        yield
    finally:
        framebuffer.DMAFramebuffer = stock


@contextlib.contextmanager
def blitter_memory(memory_words=2048):
    """Within this block, `TiliquaSoc` builds the stock blitter with
    `memory_words` of sprite memory (at most 2048: the CPU's window)."""
    assert memory_words <= 2048
    stock = blit.Peripheral
    blit.Peripheral = functools.partial(stock, memory_words=memory_words)
    try:
        yield
    finally:
        blit.Peripheral = stock
