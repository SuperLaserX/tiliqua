"""Run the engine gateware in simulation, in lockstep with the model.

The model's `Engine` plays the CPU: parameter changes and crossfades happen
on it, and every coefficient, tap offset, stream enable, LFO increment and
fade target it changes is written into the gateware between samples, as
firmware would.

Two benches: `SimTop`, the core with a plain memory for the PSRAM space, and
`StreamTop`, the core with the stream engine, whose bus goes to `PsramModel`
(a wishbone slave with latency, recovery and random contention from other
masters).
"""

import dataclasses
import random

from amaranth import *
from amaranth.lib import wiring
from amaranth.lib.memory import Memory
from amaranth.sim import Simulator
from amaranth_soc import wishbone

from model import isa
from model.compiler import CLOCK_HZ
from model.engine import Engine

from .core import Core, encode_rtap
from .stream import StreamEngine, encode_stab, stream_table

RING_BASE = 1 << 22             # delay memory: the upper 16 MB of the PSRAM (word address)


def _pow2(n, lo):
    p = lo
    while p < n:
        p *= 2
    return p


class SimTop(Elaboratable):
    """The core with a plain memory standing in for the PSRAM stream engine."""

    def __init__(self, prog, io_bits=24):
        self.prog = prog
        self.core = Core(prog=prog, io_bits=io_bits,
                         ebr_words=max(16, prog.mem_words[isa.SPACE_EBR]))
        self.stream = None

    def elaborate(self, platform):
        m = Module()
        m.submodules.core = core = self.core
        m.submodules.pmem = pmem = Memory(shape=32, depth=self.prog.mem_words[isa.SPACE_PSRAM], init=[])
        rp, wp = pmem.read_port(), pmem.write_port()
        m.d.comb += [
            rp.addr.eq(core.pmem.rd_addr), core.pmem.rd_data.eq(rp.data),
            wp.addr.eq(core.pmem.wr_addr), wp.data.eq(core.pmem.wr_data), wp.en.eq(core.pmem.wr_en),
        ]
        return m


class StreamTop(Elaboratable):
    """The core with the stream engine; `stream.bus` goes to a PSRAM model."""

    def __init__(self, prog, io_bits=24, enabled=None):
        self.prog = prog
        st = prog.streams
        self.core = Core(prog=prog, io_bits=io_bits,
                         ebr_words=max(16, prog.mem_words[isa.SPACE_EBR]))
        self.stream = StreamEngine(burst=st["burst"], rbuf_words=_pow2(st["rbuf_words"], 16),
                                   wbuf_words=_pow2(st["wbuf_words"], 16),
                                   stab_init=stream_table(prog, enabled))

    def elaborate(self, platform):
        m = Module()
        m.submodules.core = self.core
        m.submodules.stream = self.stream
        wiring.connect(m, self.core.pmem, self.stream.core)
        m.d.comb += self.stream.ptr.eq(self.core.ptr)
        return m


@dataclasses.dataclass
class PsramModel:
    """A wishbone PSRAM: the first beat of a burst `latency` clocks after the
    request, then one beat per clock (or with `gaps` probability, a wait),
    `recovery` idle clocks after each burst. With probability `contention` a
    request first waits for another master's burst of `busy` clocks."""
    latency: int = 18
    recovery: int = 2
    contention: float = 0.0
    busy: tuple = (20, 60)
    gaps: float = 0.0
    noise: bool = False         # unwritten words read as noise (huge f32 values)
    seed: int = 1

    def __post_init__(self):
        self.mem = {}
        self.bursts = 0
        self.busy_clocks = 0

    def read(self, adr):
        if adr in self.mem:
            return self.mem[adr]
        if self.noise:
            return (adr * 2654435761) & 0x807FFFFF | 0x7F000000
        return 0

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
                            dat = self.read(adr)
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


def run(prog, inputs, changes=None, io_bits=24, stream=False, frame_clocks=None,
        psram=None, clear=False, stats=None):
    """Process `inputs` (tuples of 4 ints) on the gateware and the model.

    `changes` maps a sample index to {parameter: value}, applied before that
    sample. With `stream`, the PSRAM space goes through the stream engine and
    `psram` (a PsramModel); frames then start every `frame_clocks` clocks
    (default: the sample rate's budget), and `clear` clears the delay memory
    first. `stats`, if a dict, receives the stream engine's counters.

    Returns (gateware outputs, model outputs, frame cycles per sample).
    """
    changes = changes or {}
    model = Engine(prog, io_bits=io_bits)
    if stream:
        top = StreamTop(prog, io_bits, model.stream_enabled)
        psram = psram or PsramModel()
        if frame_clocks is None:
            frame_clocks = CLOCK_HZ // prog.fs
    else:
        top = SimTop(prog, io_bits)
    core, eng = top.core, top.stream
    hw_out, model_out, cycles = [], [], []
    clock = [0]

    async def tick(ctx):
        await ctx.tick()
        clock[0] += 1

    async def write(ctx, port, addr, data):
        ctx.set(port.addr, addr)
        ctx.set(port.data, data)
        ctx.set(port.en, 1)
        await tick(ctx)
        ctx.set(port.en, 0)

    async def bench(ctx):
        ctx.set(core.n_instr, len(prog.instrs))
        ctx.set(core.psram_mask, prog.mem_words[isa.SPACE_PSRAM] - 1)
        ctx.set(core.ebr_mask, prog.mem_words[isa.SPACE_EBR] - 1)
        coefs = list(model.coef_bits)
        offsets = list(model.offsets)
        if eng is not None:
            streams = prog.streams["taps"]
            stab = list(eng.stab_init)          # what the stream table holds
            ctx.set(eng.ring_mask, prog.mem_words[isa.SPACE_PSRAM] - 1)
            ctx.set(eng.ring_base, RING_BASE)
            ctx.set(eng.n_streams, len(streams))
            if clear:
                ctx.set(eng.clear, 1)
                await tick(ctx)
                ctx.set(eng.clear, 0)
                while ctx.get(eng.clearing):
                    await tick(ctx)
        start = clock[0]
        for n, x in enumerate(inputs):
            for name, value in changes.get(n, {}).items():
                model.set_param(name, value)
            # The CPU's writes, while the engine is idle.
            for i, bits in enumerate(model.coef_bits):
                if bits != coefs[i]:
                    await write(ctx, core.coef_w, i, bits)
                    coefs[i] = bits
            for i, off in enumerate(model.offsets):
                if off != offsets[i]:
                    tap = dataclasses.replace(prog.taps[i], offset=off % (1 << 22))
                    await write(ctx, core.rtap_w, i, encode_rtap(tap))
                    offsets[i] = off
            if eng is not None:
                for k, i in enumerate(streams):
                    entry = encode_stab(prog.taps[i], offsets[i] % (1 << 22), model.stream_enabled(i))
                    if entry != stab[k]:
                        await write(ctx, eng.stab_w, k, entry)
                        stab[k] = entry
            for k in range(isa.N_LFO):
                ctx.set(core.lfo_inc[k], model.lfo_inc[k])
            for g in range(isa.N_FADE):
                ctx.set(core.fade_target[g], model.fade_target[g])
                ctx.set(core.fade_rate[g], model.fade_rate[g] if g < len(model.fade_rate) else 1)
            # One sample, on the sample clock.
            if frame_clocks:
                while clock[0] - start < n * frame_clocks:
                    await tick(ctx)
            for k in range(isa.N_IN):
                ctx.set(core.inputs[k], x[k])
            ctx.set(core.start, 1)
            await tick(ctx)
            ctx.set(core.start, 0)
            while not ctx.get(core.done):
                await tick(ctx)
            hw_out.append(tuple(ctx.get(core.outputs[k]) for k in range(isa.N_OUT)))
            cycles.append(ctx.get(core.frame_cycles))
            model_out.extend(model.process([x]))
            await tick(ctx)
        if eng is not None and stats is not None:
            stats.update(late=ctx.get(eng.late), max_lag=ctx.get(eng.max_lag),
                         bursts=ctx.get(eng.bursts), clocks=clock[0] - start,
                         scan_lag=ctx.get(eng.scan_lag), resyncs=ctx.get(eng.resyncs),
                         bus_busy=psram.busy_clocks)

    sim = Simulator(top)
    sim.add_clock(1 / CLOCK_HZ)
    sim.add_testbench(bench)
    if eng is not None:
        sim.add_testbench(psram.bench(eng.bus), background=True)
    sim.run()
    return hw_out, model_out, cycles
