"""The fill engine against a Wishbone slave that inserts wait states."""

import random

import pytest
from amaranth.sim import Simulator
from amaranth_soc import wishbone

from .fill import BURST, FillEngine
from .test_peripheral import Csr


@pytest.mark.parametrize("base,words", [(0x1000, 129600), (0x2003, 70), (0x7FFFE0, 32), (5, 1)])
def test_fill_writes_exactly_the_run_in_aligned_bursts(base, words):
    dut = FillEngine()
    csr = Csr(dut)
    writes = []                 # (adr, data, cti) per acked beat
    bursts = []                 # beats per transaction
    busy = []
    rnd = random.Random(base)

    async def slave(ctx):
        bus = dut.bus
        beats = 0
        while True:
            await ctx.tick()
            if ctx.get(bus.cyc) and ctx.get(bus.stb):
                ack = rnd.random() < 0.8
                ctx.set(bus.ack, ack)
                if ack:
                    assert ctx.get(bus.we) and ctx.get(bus.sel) == 0b1111
                    cti = getattr(ctx.get(bus.cti), "value", ctx.get(bus.cti))
                    writes.append((ctx.get(bus.adr), ctx.get(bus.dat_w), cti))
                    beats += 1
                    if cti == wishbone.CycleType.END_OF_BURST.value:
                        bursts.append(beats)
                        beats = 0
            else:
                ctx.set(bus.ack, 0)

    async def bench(ctx):
        await csr.write(ctx, "base", base)
        await csr.write(ctx, "words", words)
        await csr.write(ctx, "value", 0xA5C30F11)
        busy.append(await csr.read(ctx, "status"))
        await csr.write(ctx, "start", 1)
        busy.append(await csr.read(ctx, "status"))
        while await csr.read(ctx, "status"):
            pass
        busy.append(0)

    s = Simulator(dut)
    s.add_clock(1e-8)
    s.add_testbench(slave, background=True)
    s.add_testbench(bench)
    s.run()
    assert busy == [0, 1, 0]
    assert [w[0] for w in writes] == list(range(base, base + words))
    assert all(w[1] == 0xA5C30F11 for w in writes)
    assert sum(bursts) == words and max(bursts) <= BURST
    # No burst crosses a BURST-word boundary.
    first = 0
    for n in bursts:
        a = writes[first][0]
        assert a // BURST == (a + n - 1) // BURST
        first += n


def test_fill_of_zero_words_does_nothing():
    dut = FillEngine()
    csr = Csr(dut)
    seen = []

    async def bench(ctx):
        await csr.write(ctx, "words", 0)
        await csr.write(ctx, "start", 1)
        for _ in range(20):
            seen.append(ctx.get(dut.bus.cyc))
            await ctx.tick()
        seen.append(await csr.read(ctx, "status"))

    s = Simulator(dut)
    s.add_clock(1e-8)
    s.add_testbench(bench)
    s.run()
    assert not any(seen)
