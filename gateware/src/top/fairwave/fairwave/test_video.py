"""The registered palette: the stock palette's colours, LATENCY pixel clocks later."""

from amaranth import *
from amaranth.sim import Simulator

from tiliqua.video import palette

from .video import LATENCY, RegisteredPalette


def test_registered_palette():
    dut = RegisteredPalette()
    m = Module()
    m.domains.dvi = ClockDomain()
    m.submodules.dut = dut
    rs, gs, bs = palette.compute_color_palette()
    pixels = [(i * 37 + 5) % 256 for i in range(40)]

    async def bench(ctx):
        seen = []
        for n in range(len(pixels) + LATENCY):
            if n < len(pixels):
                ctx.set(dut.i.pixel.color, pixels[n] & 0xF)
                ctx.set(dut.i.pixel.intensity, pixels[n] >> 4)
                ctx.set(dut.i.de, n % 3 != 0)
                ctx.set(dut.i.hsync, n % 5 == 0)
                ctx.set(dut.i.vsync, n % 7 == 0)
            if n >= LATENCY:
                k = n - LATENCY
                seen.append(k)
                assert ctx.get(dut.o.r) == rs[pixels[k]]
                assert ctx.get(dut.o.g) == gs[pixels[k]]
                assert ctx.get(dut.o.b) == bs[pixels[k]]
                assert ctx.get(dut.o.de) == (k % 3 != 0)
                assert ctx.get(dut.o.hsync) == (k % 5 == 0)
                assert ctx.get(dut.o.vsync) == (k % 7 == 0)
            await ctx.tick("dvi")
        assert len(seen) == len(pixels)

        # An update changes one entry.
        ctx.set(dut.update.payload.position, 0x42)
        ctx.set(dut.update.payload.red, 1)
        ctx.set(dut.update.payload.green, 2)
        ctx.set(dut.update.payload.blue, 3)
        ctx.set(dut.update.valid, 1)
        await ctx.tick()
        ctx.set(dut.update.valid, 0)
        ctx.set(dut.i.pixel.color, 0x2)
        ctx.set(dut.i.pixel.intensity, 0x4)
        for _ in range(LATENCY):
            await ctx.tick("dvi")
        assert (ctx.get(dut.o.r), ctx.get(dut.o.g), ctx.get(dut.o.b)) == (1, 2, 3)

    sim = Simulator(m)
    sim.add_clock(1e-6)
    sim.add_clock(1.3e-6, domain="dvi")
    sim.add_testbench(bench)
    sim.run()


def test_no_persistence_keeps_registers_and_adds_no_master():
    from types import SimpleNamespace

    from amaranth.back import rtlil
    from amaranth_soc import wishbone
    from tiliqua.raster import persist

    from .video import NoPersistPeripheral

    masters = []
    bus_dma = SimpleNamespace(
        bus=SimpleNamespace(signature=wishbone.Signature(addr_width=22, data_width=32,
                                                         granularity=8)),
        add_master=masters.append)

    def layout(p):
        return [(type(r).__name__, tuple(path), start, end)
                for r, path, (start, end) in p.bus.memory_map.resources()]

    stock = persist.Peripheral(bus_dma=bus_dma)
    assert len(masters) == 1
    stub = NoPersistPeripheral(bus_dma=bus_dma)
    assert len(masters) == 1                   # the stub adds none
    assert layout(stub) == layout(stock)
    rtlil.convert(stub)                        # elaborates on its own


def _scan_frames(fb_class, stall_frames, n_frames):
    """Pixels the scan-out shows per frame, `(x, y) -> value`, from a tiny
    modeline and a fake PSRAM that stops answering through `stall_frames`'
    visible lines (a starved DMA)."""
    from amaranth.lib import wiring
    from amaranth.lib.wiring import In, Out
    from tiliqua.video.modeline import DVIModeline
    from tiliqua.video.types import ScanPixel

    ml = DVIModeline(h_active=16, h_sync_start=18, h_sync_end=20, h_total=24, h_sync_invert=False,
                     v_active=6, v_sync_start=7, v_sync_end=8, v_total=10, v_sync_invert=False,
                     pixel_clk_mhz=1.0)
    fb_words = ml.active_pixels // 4
    image = [(p * 7 + 3) & 0xFF for p in range(ml.active_pixels)]
    words = [sum(image[4 * w + k] << (8 * k) for k in range(4)) for w in range(fb_words)]

    class Tap(wiring.Component):
        i: In(ScanPixel)
        o: Out(ScanPixel)

        def elaborate(self, platform):
            m = Module()
            m.d.comb += self.o.eq(self.i)
            return m

    m = Module()
    dvi_cd = ClockDomain("dvi")
    m.domains += dvi_cd
    m.submodules.tap = tap = Tap()
    m.submodules.pal = pal = palette.ColorPalette()
    m.submodules.fb = fb = fb_class(palette=pal, fixed_modeline=ml, overlay=tap,
                                    fifo_depth=16, burst_threshold_words=4)
    # the PSRAM: a registered ack every other clock, unless stalled
    stall = Signal()
    mem = Array(Const(w, 32) for w in words)
    bus = fb.bus
    m.d.sync += bus.ack.eq(bus.cyc & bus.stb & ~bus.ack & ~stall)
    m.d.sync += bus.dat_r.eq(mem[(bus.adr - fb.fbp.base)[:5]])

    frames = []

    async def bench(ctx):
        ctx.set(dvi_cd.rst, 1)
        for _ in range(4):
            await ctx.tick("dvi")
        ctx.set(dvi_cd.rst, 0)
        frame, vs_prev = -1, 0
        while frame < n_frames:
            await ctx.tick("dvi")
            vs = ctx.get(tap.i.vsync)
            if vs and not vs_prev:
                frame += 1
                frames.append({})
            vs_prev = vs
            x, y = ctx.get(tap.i.x), ctx.get(tap.i.y)
            active = 0 <= x < ml.h_active and 0 <= y < ml.v_active
            # (whole lines: a stall in the active pixels alone is made up in
            # each line's blanking)
            ctx.set(stall, frame in stall_frames and 0 <= y < ml.v_active)
            if frame >= 0 and active:
                frames[frame][(x, y)] = ctx.get(tap.i.pixel.as_value())

    sim = Simulator(m)
    sim.add_clock(10e-9)
    sim.add_clock(23e-9, domain="dvi")
    sim.add_testbench(bench)
    sim.run()
    expect = {(x, y): image[y * ml.h_active + x]
              for y in range(ml.v_active) for x in range(ml.h_active)}
    return frames[:n_frames], expect


def test_scanout_realigns_after_a_starved_frame():
    """A starved DMA can't leave the picture shifted: the frame after shows
    every pixel where it belongs (`FixedTimingFramebuffer`'s frame-start
    tag). The stock scan-out stays shifted from then on."""
    from .video import FixedTimingFramebuffer

    frames, expect = _scan_frames(FixedTimingFramebuffer, stall_frames={1}, n_frames=4)
    assert frames[0] == expect
    assert frames[1] != expect              # (the stall did starve it)
    assert frames[2] == expect
    assert frames[3] == expect
