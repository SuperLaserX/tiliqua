"""The pipelined blitter plots exactly what the stock one does."""

import random

from amaranth.sim import Simulator

from tiliqua.raster import blit

from .blit import PipelinedBlit

SHEET_W, SHEET_H = 48, 20                   # pixels (width divisible by 8)
WORDS = SHEET_W * SHEET_H // 32
OFF_SRC, OFF_BLIT, OFF_SHEET_WIDTH = 0x04, 0x08, 0x0C


def _commands(rng):
    cmds = []
    for _ in range(12):
        w, h = rng.randint(1, 12), rng.randint(1, 10)
        sx, sy = rng.randint(0, SHEET_W - w), rng.randint(0, SHEET_H - h)
        cmds.append(("src", sx | sy << 8 | w << 16 | h << 24))
        for _ in range(rng.randint(1, 2)):
            dx, dy = rng.randint(-20, 700), rng.randint(-20, 700)
            pixel = rng.randint(0, 255)
            cmds.append(("blit", (dx & 0xFFF) | (dy & 0xFFF) << 12 | pixel << 24))
    return cmds


def _run(cls, sheet, cmds, stall_seed):
    dut = cls(memory_words=64)
    plots = []

    async def csr_write(ctx, addr, value, n_bytes):
        for i in range(n_bytes):
            ctx.set(dut.csr_bus.addr, addr + i)
            ctx.set(dut.csr_bus.w_data, (value >> (8 * i)) & 0xFF)
            ctx.set(dut.csr_bus.w_stb, 1)
            await ctx.tick()
        ctx.set(dut.csr_bus.w_stb, 0)
        await ctx.tick()

    async def bench(ctx):
        for i, word in enumerate(sheet):
            ctx.set(dut.sprite_mem_bus.cyc, 1)
            ctx.set(dut.sprite_mem_bus.stb, 1)
            ctx.set(dut.sprite_mem_bus.we, 1)
            ctx.set(dut.sprite_mem_bus.adr, i)
            ctx.set(dut.sprite_mem_bus.dat_w, word)
            await ctx.tick()
        ctx.set(dut.sprite_mem_bus.cyc, 0)
        ctx.set(dut.sprite_mem_bus.stb, 0)
        await csr_write(ctx, OFF_SHEET_WIDTH, SHEET_W, 2)
        for kind, value in cmds:
            await csr_write(ctx, OFF_SRC if kind == "src" else OFF_BLIT, value, 4)
            for _ in range(2000):               # let this command finish (FIFO empty)
                await ctx.tick()

    async def sink(ctx):
        rng = random.Random(stall_seed)
        while True:
            ready = rng.random() < 0.6
            ctx.set(dut.o.ready, ready)
            if ready and ctx.get(dut.o.valid):          # transferred at this edge
                plots.append((ctx.get(dut.o.payload.x), ctx.get(dut.o.payload.y),
                              ctx.get(dut.o.payload.pixel.as_value())))
            await ctx.tick()

    sim = Simulator(dut)
    sim.add_clock(1e-6)
    sim.add_testbench(bench)
    sim.add_testbench(sink, background=True)
    sim.run()
    return plots


def test_pipelined_blit_matches_stock():
    rng = random.Random(7)
    sheet = [rng.getrandbits(32) for _ in range(WORDS)]
    cmds = _commands(rng)
    stock = _run(blit.Peripheral, sheet, cmds, stall_seed=1)
    ours = _run(PipelinedBlit, sheet, cmds, stall_seed=2)
    assert len(stock) > 200
    assert ours == stock
