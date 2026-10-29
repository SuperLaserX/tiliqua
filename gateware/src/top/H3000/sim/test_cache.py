"""Amaranth-simulator test of the PSRAM delay cache against a reference memory.

usage: python sim/test_cache.py [n_accesses]
"""
import os
import random
import sys

from amaranth import *
from amaranth.lib import wiring
from amaranth.sim import Simulator
from amaranth_soc import wishbone

sys.path.insert(0, os.path.join(os.path.dirname(__file__), ".."))
from h3000.cache import DelayCache  # noqa: E402
from mockpsram import MockPSRAM  # noqa: E402

WB = wishbone.Signature(addr_width=22, data_width=32, granularity=8, features={"cti", "bte"})


class Top(Elaboratable):
    def __init__(self):
        self.cache = DelayCache(bus_signature=WB, base_word=0, words=4096)
        self.psram = MockPSRAM(signature=WB, words=32768, latency=24)

    def elaborate(self, platform):
        m = Module()
        m.submodules.cache = self.cache
        m.submodules.psram = self.psram
        wiring.connect(m, self.cache.wb, self.psram.bus)
        return m


def accesses(n, seed=1):
    """Stream-like access pattern: several delay taps moving one word per
    'sample', reads and writes mixed, plus occasional random jumps."""
    rnd = random.Random(seed)
    taps = [rnd.randrange(65536) for _ in range(12)]
    out = []
    while len(out) < n:
        for i, t in enumerate(taps):
            op = "w" if i % 4 == 0 else "r"
            out.append((op, t, rnd.randrange(65536)))
            if rnd.random() < 0.3:
                out.append(("r", (t + 1) & 0xFFFF, 0))
            taps[i] = (t - 1) & 0xFFFF
        if rnd.random() < 0.05:
            taps[rnd.randrange(len(taps))] = rnd.randrange(65536)
    return out[:n]


def main():
    n = int(sys.argv[1]) if len(sys.argv) > 1 else 3000
    top = Top()
    bus = top.cache.bus
    seq = accesses(n)
    ref = {}
    stats = {"stall": 0, "errors": 0}

    async def tb(ctx):
        for op, addr, val in seq:
            # address set by the board on the previous commit edge
            ctx.set(bus.addr, addr)
            # three spare clocks of the instruction cycle
            for _ in range(3):
                await ctx.tick()
            # phase 3: request until ready, then commit
            ctx.set(bus.rd_en, op == "r")
            ctx.set(bus.wr_en, op == "w")
            ctx.set(bus.wr_data, val)
            while not ctx.get(bus.rd_valid if op == "r" else bus.wr_ready):
                stats["stall"] += 1
                await ctx.tick()
            if op == "r":
                got = ctx.get(bus.rd_data)
                exp = ref.get(addr, 0)
                if got != exp:
                    stats["errors"] += 1
                    if stats["errors"] < 10:
                        print("read %04x: got %04x expected %04x" % (addr, got, exp))
            else:
                ref[addr] = val
            ctx.set(bus.commit, 1)
            await ctx.tick()
            ctx.set(bus.commit, 0)
            ctx.set(bus.rd_en, 0)
            ctx.set(bus.wr_en, 0)
        stats["misses"] = ctx.get(top.cache.misses)
        stats["writebacks"] = ctx.get(top.cache.writebacks)

    sim = Simulator(top)
    sim.add_clock(1e-6)
    sim.add_testbench(tb)
    sim.run()
    print("accesses %d, misses %d, writebacks %d, stall clocks %d (%.1f per access), errors %d" % (
        n, stats["misses"], stats["writebacks"], stats["stall"], stats["stall"] / n, stats["errors"]))
    return 1 if stats["errors"] else 0


if __name__ == "__main__":
    sys.exit(main())
