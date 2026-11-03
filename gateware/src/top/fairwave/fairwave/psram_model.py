"""A wishbone PSRAM for simulation, with latency and contention.

Vendored from top/bfr/bfr/sim.py; port fixes by hand.
"""

import random
from dataclasses import dataclass

from amaranth_soc import wishbone


@dataclass
class PsramModel:
    """The first beat of a burst `latency` clocks after the request, then one beat
    per clock (or with `gaps` probability, a wait), `recovery` idle clocks after each
    burst. With probability `contention` a request first waits for another master's
    burst of `busy` clocks."""
    latency: int = 18
    recovery: int = 2
    contention: float = 0.0
    busy: tuple = (20, 60)
    gaps: float = 0.0
    seed: int = 1

    def __post_init__(self):
        self.mem = {}
        self.bursts = 0
        self.busy_clocks = 0

    def bench(self, bus):
        rnd = random.Random(self.seed)

        async def run(ctx):
            state, wait = "idle", 0
            while True:
                await ctx.tick()
                ack, dat = 0, 0
                req = ctx.get(bus.cyc) and ctx.get(bus.stb)
                if state == "idle" and req:
                    wait = self.latency
                    if rnd.random() < self.contention:
                        wait += rnd.randint(*self.busy)
                    state = "wait"
                if state == "wait":
                    if wait > 0:
                        wait -= 1
                    else:
                        state = "data"
                if state == "data":
                    if req and not (self.gaps and rnd.random() < self.gaps):
                        adr = ctx.get(bus.adr)
                        if ctx.get(bus.we):
                            self.mem[adr] = ctx.get(bus.dat_w)
                        else:
                            dat = self.mem.get(adr, 0)
                        ack = 1
                        if ctx.get(bus.cti) != wishbone.CycleType.INCR_BURST.value:
                            state, wait = "recover", self.recovery
                            self.bursts += 1
                elif state == "recover":
                    if wait > 0:
                        wait -= 1
                    else:
                        state = "idle"
                if state != "idle":
                    self.busy_clocks += 1
                ctx.set(bus.ack, ack)
                ctx.set(bus.dat_r, dat)
        return run
