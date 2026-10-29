"""Video overrides for this project: a registered palette, no persistence,
and the framebuffer's DVI timing fixes.

The palette. The stock palette (`tiliqua.video.palette.ColorPalette`) reads
three block RAMs combinationally into the DVI PHY's TMDS encoders. The RAMs'
clock to output (about 6 ns) plus the encoders missed the 74.25 MHz pixel
clock in every placement (66 to 73 MHz). Here the palette is one 24-bit
memory (one block RAM rather than three) with a register on its output, and
the pixel's enable and syncs are delayed with it: the picture moves two pixel
clocks later, its timing unchanged. Updates are as before.

Persistence. The stock persistence effect (`tiliqua.raster.persist`) dims
the whole framebuffer continuously by rewriting it in PSRAM: anything not
redrawn fades. bfr's UI is drawn incrementally and must stay on screen, so
the effect is replaced by a stub with the same registers (the firmware's
register crate is unchanged) and no DMA engine: about 500 LUTs and one PSRAM
bus master fewer.

The framebuffer's DVI timing. Two stock paths miss the pixel clock at this
SoC's utilisation, so `DVITimingGen` and `DMAFramebuffer` are copied below
with the fixes (first made for H3000, which keeps its own copy):

- the timing generator computes the coordinates where frames and syncs
  start (h_active - h_total and so on) in the same clock as its compares:
  two carry chains in series. They are registered here (they only change
  while the DVI domain is held in reset).
- the scan-out resets its byte counter on vsync straight from the compare
  logic; a registered vsync is used instead (it realigns during blanking).

The framebuffer's alignment. The stock DMA fills an asynchronous FIFO that
the scan-out empties a word per four pixels; at vsync only the byte counter
realigns, never the FIFO. If the DMA is starved in the active area (another
bus master holding the PSRAM), the scan-out stalls on the empty FIFO while
the beam moves on, and from then on every frame is shifted by the words it
missed: the picture shifted and wrapped round (a type load did it, through
the stream engine's ring clear, `bfr/stream.py`). Here:

- the FIFO is a bit wider and the DMA tags each frame's first word;
- from vsync the scan-out hunts: it discards words until a tagged one is at
  the FIFO's head, and locks onto it before the active area. A frame whose
  first word comes too late shows pixel 0 (the backdrop) and the next one
  locks. So a shift lasts at most a frame;
- a DMA still on the last frame at vsync starts the next one as soon as it
  is done, rather than at the following vsync (it can't abandon the old
  one: if the scan-out has locked onto it, a second frame start would
  arrive in the middle of the picture);
- the frame's last word ends the DMA's frame only once it is acknowledged
  (the stock code left on its request, dropping it if the PSRAM wasn't
  ready on that clock);
- a word's last three pixels shift out whether or not the FIFO has the next
  word (the stock scan-out waited, which repeated a frame's last pixel
  three times and made a starved frame's shift worse).

The line plotter. The UI draws its dials, needles and markers pixel by pixel
(round, thick, through the pixel plotter), so no lines are drawn: `NoLinePlotter`
keeps the line plotter's registers (the PAC and HAL are unchanged) and
plots nothing, its status always empty.

`registered_palette()`, `no_persistence()`, `fixed_timing_framebuffer()` and
`no_line_plotter()`
hand `TiliquaSoc` these classes instead of the stock ones while it is built.
"""

import contextlib

from amaranth import *
from amaranth.lib import stream, wiring
from amaranth.lib.cdc import FFSynchronizer
from amaranth.lib.fifo import AsyncFIFOBuffered
from amaranth.lib.memory import Memory
from amaranth.lib.wiring import In, Out
from amaranth.utils import exact_log2
from amaranth_soc import csr, wishbone

from tiliqua.build import sim
from tiliqua.raster import persist
from tiliqua.raster import line
from tiliqua.raster.plot import PlotRequest
from tiliqua.video import dvi, framebuffer, palette
from tiliqua.video.types import Pixel

LATENCY = 2         # pixel clocks: the read, then the output register


class RegisteredPalette(palette.ColorPalette):

    def elaborate(self, platform):
        m = Module()
        rs, gs, bs = palette.compute_color_palette()
        m.submodules.mem = mem = Memory(shape=24, depth=256,
                                        init=[r | g << 8 | b << 16 for r, g, b in zip(rs, gs, bs)])

        rd = mem.read_port(domain="dvi")
        rgb = Signal(24)
        m.d.comb += rd.addr.eq(Cat(self.i.pixel.color, self.i.pixel.intensity))
        m.d.dvi += rgb.eq(rd.data)
        m.d.comb += [self.o.r.eq(rgb[0:8]), self.o.g.eq(rgb[8:16]), self.o.b.eq(rgb[16:24])]

        ctrl = Cat(self.i.de, self.i.hsync, self.i.vsync)
        for _ in range(LATENCY):
            delayed = Signal.like(ctrl)
            m.d.dvi += delayed.eq(ctrl)
            ctrl = delayed
        m.d.comb += Cat(self.o.de, self.o.hsync, self.o.vsync).eq(ctrl)

        wr = mem.write_port()
        u = self.update.payload
        m.d.comb += [
            self.update.ready.eq(1),
            wr.addr.eq(u.position),
            wr.data.eq(Cat(u.red, u.green, u.blue)),
            wr.en.eq(self.update.valid),
        ]
        return m


class NoPersistPeripheral(wiring.Component):
    """`persist.Peripheral`'s interface without the effect: the same
    write-only registers (writes are ignored), and no PSRAM master."""

    PersistReg = persist.Peripheral.PersistReg
    DecayReg = persist.Peripheral.DecayReg
    SkipReg = persist.Peripheral.SkipReg

    def __init__(self, bus_dma):
        regs = csr.Builder(addr_width=5, data_width=8)
        self._persist = regs.add("persist", self.PersistReg(), offset=0x0)
        self._decay = regs.add("decay", self.DecayReg(), offset=0x4)
        self._skip = regs.add("skip", self.SkipReg(), offset=0x8)
        self._bridge = csr.Bridge(regs.as_memory_map())
        super().__init__({
            "bus": In(csr.Signature(addr_width=regs.addr_width, data_width=regs.data_width)),
            "fbp": In(framebuffer.DMAFramebuffer.Properties()),
        })
        self.bus.memory_map = self._bridge.bus.memory_map

    def elaborate(self, platform):
        m = Module()
        m.submodules.bridge = self._bridge
        wiring.connect(m, wiring.flipped(self.bus), self._bridge.bus)
        return m


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

        # bit 32: the frame's first word
        m.submodules.fifo = fifo = AsyncFIFOBuffered(
                width=33, depth=self.fifo_depth, r_domain='dvi', w_domain='sync')

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

        # A vsync while the DMA is still on the last frame: start the next
        # one as soon as it is done (not at the vsync after), so the new
        # frame's first word comes soon.
        vsync_prev = Signal()
        restart = Signal()
        m.d.sync += vsync_prev.eq(phy_vsync_sync)
        with m.If(phy_vsync_sync & ~vsync_prev):
            m.d.sync += restart.eq(1)

        # Read to FIFO in sync domain
        with m.FSM() as fsm:
            with m.State('WAIT-VSYNC'):
                with m.If(phy_vsync_sync | restart):
                    m.d.sync += [dma_addr.eq(0), restart.eq(0)]
                    m.next = 'WAIT'
            with m.State('BURST'):
                m.d.comb += [
                    bus.stb.eq(1),
                    bus.cyc.eq(1),
                    bus.we.eq(0),
                    bus.sel.eq(2**(bus.data_width//8)-1),
                    bus.adr.eq(self.fbp.base + dma_addr),
                    fifo.w_en.eq(bus.ack),
                    fifo.w_data.eq(Cat(bus.dat_r, dma_addr == 0)),
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
                    with m.If(bus.ack):
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
        # From vsync until a frame's first word is at the FIFO's head (kept);
        # it locks only before the active area, so a frame is never shifted.
        hunting     = Signal(init=1)
        started     = Signal()      # this frame's active area has begun
        first       = fifo.r_data[32]
        with m.If(vsync_r):
            m.d.dvi += [bytecounter.eq(0), hunting.eq(1), started.eq(0)]
        with m.Elif(dvi_tgen.ctrl.de):
            m.d.dvi += started.eq(1)
        with m.If(hunting):
            with m.If(fifo.r_rdy & ~first):
                m.d.comb += fifo.r_en.eq(1)
            with m.If(fifo.r_rdy & first & ~vsync_r & ~started & ~dvi_tgen.ctrl.de):
                m.d.dvi += hunting.eq(0)
            # (a frame not locked shows pixel 0: the backdrop)
            m.d.dvi += last_word.eq(0)
        with m.Elif(dvi_tgen.ctrl.de & (fifo.r_rdy | (bytecounter != 0))):
            # (only a new word needs the FIFO: the stock scan-out waited for
            # it to shift a word's other pixels out too)
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
def registered_palette():
    """Within this block, `TiliquaSoc` builds a `RegisteredPalette`."""
    stock = palette.ColorPalette
    palette.ColorPalette = RegisteredPalette
    try:
        yield
    finally:
        palette.ColorPalette = stock


@contextlib.contextmanager
def no_persistence():
    """Within this block, `TiliquaSoc` builds a `NoPersistPeripheral`."""
    stock = persist.Peripheral
    persist.Peripheral = NoPersistPeripheral
    try:
        yield
    finally:
        persist.Peripheral = stock


@contextlib.contextmanager
def fixed_timing_framebuffer():
    """Within this block, `TiliquaSoc` builds a `FixedTimingFramebuffer`."""
    stock = framebuffer.DMAFramebuffer
    framebuffer.DMAFramebuffer = FixedTimingFramebuffer
    try:
        yield
    finally:
        framebuffer.DMAFramebuffer = stock


class NoLinePlotter(line.Peripheral):
    """The line plotter's registers (status, point), and no plotter: the status
    reads empty and never full, points are dropped, and nothing is plotted."""

    def __init__(self, fifo_depth=8):
        # (the stock constructor without its command FIFO)
        regs = csr.Builder(addr_width=6, data_width=8)
        self._status = regs.add("status", self.StatusReg(), offset=0x00)
        self._point = regs.add("point", self.PointReg(), offset=0x04)
        self._bridge = csr.Bridge(regs.as_memory_map())
        wiring.Component.__init__(self, {
            "csr_bus": In(csr.Signature(addr_width=regs.addr_width, data_width=regs.data_width)),
            "o": Out(stream.Signature(PlotRequest)),
        })
        self.csr_bus.memory_map = self._bridge.bus.memory_map

    def elaborate(self, platform):
        m = Module()
        m.submodules.bridge = self._bridge
        wiring.connect(m, wiring.flipped(self.csr_bus), self._bridge.bus)
        m.d.comb += [
            self._status.f.full.r_data.eq(0),
            self._status.f.empty.r_data.eq(1),
            self.o.valid.eq(0),
        ]
        return m


@contextlib.contextmanager
def no_line_plotter():
    """Within this block, `TiliquaSoc` builds a `NoLinePlotter`."""
    stock = line.Peripheral
    line.Peripheral = NoLinePlotter
    try:
        yield
    finally:
        line.Peripheral = stock
