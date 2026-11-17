"""The scope's capture ring, through the CSR bus as the CPU sees it: every input sample is kept
with the output going out as it arrived, status's cap_ptr counts them, writing `cap` sets where
reads start and each read moves on.

    python src/top/NAM/tests/test_capture.py            (from gateware/)
"""

import os
import sys

from amaranth.sim import Simulator

HERE = os.path.dirname(os.path.realpath(__file__))
sys.path.insert(0, os.path.abspath(os.path.join(HERE, "..", "..", "..")))
sys.path.insert(0, os.path.join(HERE, ".."))

from nam.peripheral import CAP_LOG2, NamPeripheral  # noqa: E402

STATUS, CTRL, CAP = 0x10, 0x0C, 0x24


def test_capture_ring():
    dut = NamPeripheral(hw_mult=False, pring_base=0x800000 // 4)
    bus = dut.csr_bus
    n = 40
    samples = [(i * 1237 + 5) % 65536 - 32768 for i in range(n)]

    async def csr_read(ctx, addr):
        value = 0
        for byte in range(4):
            ctx.set(bus.addr, addr + byte)
            ctx.set(bus.r_stb, 1)
            await ctx.tick()
            ctx.set(bus.r_stb, 0)
            # (valid in the cycle after the strobe only)
            value |= ctx.get(bus.r_data) << (8 * byte)
            await ctx.tick()
        return value

    async def csr_write(ctx, addr, value):
        for byte in range(4):
            ctx.set(bus.addr, addr + byte)
            ctx.set(bus.w_data, (value >> (8 * byte)) & 0xFF)
            ctx.set(bus.w_stb, 1)
            await ctx.tick()
        ctx.set(bus.w_stb, 0)
        await ctx.tick()

    def s16(v):
        return v - 65536 if v & 0x8000 else v

    async def bench(ctx):
        await csr_write(ctx, CTRL, 2)        # bypass: the output is the input, a sample late
        for v in samples:
            ctx.set(dut.i.payload.as_value(), v & 0xFFFF)
            ctx.set(dut.i.valid, 1)
            await ctx.tick()
            ctx.set(dut.i.valid, 0)
            for _ in range(5):
                await ctx.tick()
        status = await csr_read(ctx, STATUS)
        ptr = (status >> 19) & ((1 << CAP_LOG2) - 1)
        assert ptr == n, ptr
        # all of them, from the first
        await csr_write(ctx, CAP, 0)
        for i in range(n):
            e = await csr_read(ctx, CAP)
            assert s16(e & 0xFFFF) == samples[i], (i, s16(e & 0xFFFF), samples[i])
            want_wet = samples[i - 1] if i > 0 else 0
            assert s16(e >> 16) == want_wet, (i, s16(e >> 16), want_wet)
        # from the middle, with samples arriving between reads
        await csr_write(ctx, CAP, 10)
        for i in range(10, 20):
            e = await csr_read(ctx, CAP)
            assert s16(e & 0xFFFF) == samples[i], (i, s16(e & 0xFFFF), samples[i])
            ctx.set(dut.i.payload.as_value(), 0x1234)
            ctx.set(dut.i.valid, 1)
            await ctx.tick()
            ctx.set(dut.i.valid, 0)
        status = await csr_read(ctx, STATUS)
        assert (status >> 19) & ((1 << CAP_LOG2) - 1) == n + 10
        # the entries written meanwhile, after the old ones
        e = await csr_read(ctx, CAP)
        assert s16(e & 0xFFFF) == samples[20]
        await csr_write(ctx, CAP, n)
        e = await csr_read(ctx, CAP)
        assert e & 0xFFFF == 0x1234, hex(e)

    sim = Simulator(dut)
    sim.add_clock(1 / 60e6, domain="sync")
    sim.add_clock(1 / 120e6, domain="fast")
    sim.add_testbench(bench)
    sim.run()


if __name__ == "__main__":
    test_capture_ring()
    print("capture ring: right")
