"""The SoC peripheral, driven only through its CSR bus and audio streams.

A testbench plays the firmware (configure, clear, run, write tables as the
model's CPU policy changes them) and the CODEC (one input sample per sample
period); the PSRAM is `sim.PsramModel`. The outputs must match the model's.
"""

import dataclasses

from amaranth.sim import Simulator

from model import isa
from model.compiler import CLOCK_HZ, compile_algorithm
from model.lib import allpass, lowpass
from model.engine import Engine

from . import peripheral as P
from . import sim
from .core import encode_rtap, encode_wtap
from .stream import encode_stab, stream_table
from .test_core import noise_inputs
from .test_stream import faded_lines, short_lines


class Csr:
    """Byte-wide CSR bus accesses, by register name."""

    def __init__(self, periph):
        self.bus = periph.csr_bus
        self.regs = {res.path[0][0]: (res.start, res.end - res.start)
                     for res in self.bus.memory_map.all_resources()}

    async def write(self, ctx, name, value):
        addr, n = self.regs[name]
        for i in range(n):
            ctx.set(self.bus.addr, addr + i)
            ctx.set(self.bus.w_data, (value >> (8 * i)) & 0xFF)
            ctx.set(self.bus.w_stb, 1)
            await ctx.tick()
        ctx.set(self.bus.w_stb, 0)

    async def read(self, ctx, name):
        addr, n = self.regs[name]
        value = 0
        for i in range(n):
            ctx.set(self.bus.addr, addr + i)
            ctx.set(self.bus.r_stb, 1)
            await ctx.tick()
            ctx.set(self.bus.r_stb, 0)
            value |= ctx.get(self.bus.r_data) << (8 * i)     # valid only this cycle
        return value


async def table_write(ctx, csr, table, addr, value):
    for i in range(3):
        await csr.write(ctx, f"wdata{i}", (value >> (32 * i)) & 0xFFFFFFFF)
    await csr.write(ctx, "wcmd", addr | table << 10)
    while (await csr.read(ctx, "status")) & 0b1000:     # wpend
        pass


def run_peripheral(prog, inputs, changes=None, psram=None, frame_clocks=None, stats=None, probes=()):
    changes = changes or {}
    io_bits = 16
    model = Engine(prog, io_bits=io_bits)
    dut = P.BfrPeripheral(prog)
    csr = Csr(dut)
    psram = psram or sim.PsramModel()
    frame_clocks = frame_clocks or CLOCK_HZ // prog.fs
    hw_out, model_out = [], []
    clock = [0]
    sent = [0]

    async def firmware(ctx):
        await csr.write(ctx, "config", len(prog.instrs) | len(prog.streams["taps"]) << 11)
        await csr.write(ctx, "psram_mask", prog.mem_words[isa.SPACE_PSRAM] - 1)
        await csr.write(ctx, "ebr_mask", prog.mem_words[isa.SPACE_EBR] - 1)
        await csr.write(ctx, "ring_base", sim.RING_BASE)
        for k in range(isa.N_LFO):
            await csr.write(ctx, f"lfo_inc{k}", model.lfo_inc[k])
        for g in range(len(prog.fades)):
            await csr.write(ctx, f"fade_rate{g}", model.fade_rate[g])
        await csr.write(ctx, "clear", 1)
        while (await csr.read(ctx, "status")) & 0b10:   # clearing
            pass
        await csr.write(ctx, "control", 1)              # run
        await ctx.tick().repeat(2)                      # the write takes effect
        coefs, offsets = list(model.coef_bits), list(model.offsets)
        streams = prog.streams["taps"]
        stab = list(dut.stream.stab_init)
        targets = [0] * isa.N_FADE
        for n, x in enumerate(inputs):
            # Wait for the previous sample's output, then do the CPU's writes.
            while len(hw_out) < n:
                await ctx.tick()
            for name, value in changes.get(n, {}).items():
                model.set_param(name, value)
            for i, bits in enumerate(model.coef_bits):
                if bits != coefs[i]:
                    await table_write(ctx, csr, P.T_COEF, i, bits)
                    coefs[i] = bits
            for i, off in enumerate(model.offsets):
                if off != offsets[i]:
                    t = dataclasses.replace(prog.taps[i], offset=off % (1 << 22))
                    await table_write(ctx, csr, P.T_RTAP, i, encode_rtap(t))
                    offsets[i] = off
            for k, i in enumerate(streams):
                entry = encode_stab(prog.taps[i], offsets[i] % (1 << 22), model.stream_enabled(i))
                if entry != stab[k]:
                    await table_write(ctx, csr, P.T_STAB, k, entry)
                    stab[k] = entry
            for g in range(isa.N_FADE):
                if model.fade_target[g] != targets[g]:
                    await csr.write(ctx, f"fade_target{g}", model.fade_target[g])
                    targets[g] = model.fade_target[g]
            model_out.extend(model.process([x]))
            sent[0] = n + 1                             # the CODEC may send sample n
        while len(hw_out) < len(inputs):
            await ctx.tick()
        if stats is not None:
            for name in ("status", "frames", "overruns", "bursts", "stream_stats", "frame_clocks",
                         "wet_peak"):
                stats[name] = await csr.read(ctx, name)

    async def codec(ctx):
        # One input sample per period, once the firmware has done its writes.
        for n, x in enumerate(inputs):
            while clock[0] < (n + 1) * frame_clocks or sent[0] <= n:
                await ctx.tick()
                clock[0] += 1
            for k in range(isa.N_IN):
                ctx.set(dut.i.payload[k].as_value(), x[k])
            ctx.set(dut.i.valid, 1)
            await ctx.tick()
            clock[0] += 1
            ctx.set(dut.i.valid, 0)

    async def sink(ctx):
        ctx.set(dut.o.ready, 1)
        while True:
            await ctx.tick()
            if ctx.get(dut.o.valid):
                hw_out.append(tuple(ctx.get(dut.o.payload[k].as_value()) for k in range(isa.N_OUT)))

    s = Simulator(dut)
    s.add_clock(1 / CLOCK_HZ)
    s.add_testbench(firmware)
    s.add_testbench(codec, background=True)
    s.add_testbench(sink, background=True)
    s.add_testbench(psram.bench(dut.psram), background=True)
    for probe in probes:
        s.add_testbench(probe(dut), background=True)
    s.run()
    return hw_out, model_out


def assert_same(hw, model):
    first = next((i for i, (a, b) in enumerate(zip(hw, model)) if a != b), None)
    assert first is None, f"sample {first}: gateware {hw[first]} model {model[first]}"
    assert len(hw) == len(model)


def test_streams_through_csr():
    prog = compile_algorithm(short_lines, 192000, "t")
    hw, model = run_peripheral(prog, noise_inputs(220, 11, amp=1 << 13),
                               psram=sim.PsramModel(noise=True))
    assert_same(hw, model)
    assert any(o[0] for o in hw[80:])


def test_crossfade_through_csr():
    prog = compile_algorithm(faded_lines, 192000, "t")
    hw, model = run_peripheral(prog, noise_inputs(260, 12, amp=1 << 13), {100: {"d": 170}})
    assert_same(hw, model)


# -- a type switch from the menu ------------------------------------------------

def ebr_chain_a(a):
    """Allpasses in the block-RAM space, and a PSRAM feedback loop."""
    g = a.param("g", 0.6, 0.0, 0.9)
    x = a.input(0) + a.input(1)
    for i, d in enumerate((7, 13, 29)):
        x, _ = allpass(a, x, d, g, f"ap{i}")
    loop = a.delay("loop")
    y = x + loop.tap(150) * 0.7
    loop.write(y)
    a.output(0, y)
    a.output(1, x)


def ebr_chain_b(a):
    """Different allpasses (one modulated) in block RAM, state, an LFO and a
    longer PSRAM loop."""
    lfo = a.lfo(400.0, phase=0.25)
    x = a.input(0)
    for i, d in enumerate((11, 23)):
        x, _ = allpass(a, x, d, 0.5, f"bp{i}")
    x, _ = allpass(a, x, 41, 0.4, "bmod", mod=lfo.sin, depth=6.0)
    loop = a.delay("bloop")
    y = lowpass(a, x + loop.tap(210) * 0.8, 0.5, "lp")
    loop.write(y)
    a.output(0, y * 0.5)
    a.output(2, lfo.tri * 0.25)


async def load_program(ctx, csr, prog, model):
    """What the firmware's type switch does (`Engine::load`, `Control::load`):
    stop, write every table of the new program, clear, run."""
    await csr.write(ctx, "control", 0b10)               # stop, mute
    await ctx.tick().repeat(2)
    await csr.write(ctx, "config", len(prog.instrs) | len(prog.streams["taps"]) << 11)
    await csr.write(ctx, "psram_mask", prog.mem_words[isa.SPACE_PSRAM] - 1)
    await csr.write(ctx, "ebr_mask", prog.mem_words[isa.SPACE_EBR] - 1)
    for i, ins in enumerate(prog.instrs):
        await table_write(ctx, csr, P.T_PROG, i, ins.encode())
    for r in [*range(isa.REG_GENERAL), *range(isa.REG_OUT, isa.REG_OUT + isa.N_OUT)]:
        await table_write(ctx, csr, P.T_REG, r, 0)
    for r, bits in prog.reg_init.items():
        await table_write(ctx, csr, P.T_REG, r, bits)
    for i, t in enumerate(prog.taps):
        if t.kind == isa.TAP_WRITE:
            await table_write(ctx, csr, P.T_WTAP, i, encode_wtap(t))
        else:
            await table_write(ctx, csr, P.T_RTAP, i, encode_rtap(t))
    for i, bits in enumerate(model.coef_bits):
        await table_write(ctx, csr, P.T_COEF, i, bits)
    for k, entry in enumerate(stream_table(prog)):
        await table_write(ctx, csr, P.T_STAB, k, entry)
    for k in range(isa.N_LFO):
        await table_write(ctx, csr, P.T_LFO, k, prog.lfo_phase[k])
        await csr.write(ctx, f"lfo_inc{k}", model.lfo_inc[k])
    await csr.write(ctx, "clear", 1)
    while (await csr.read(ctx, "status")) & 0b10:       # clearing
        pass
    await csr.write(ctx, "control", 1)                  # run
    await ctx.tick().repeat(2)


def test_type_switch_through_csr():
    """Program A runs, then the firmware loads B over the CSR bus: B's output
    matches the model from silence (nothing of A left in the block-RAM space,
    the registers, the LFO phases or the PSRAM)."""
    pa = compile_algorithm(ebr_chain_a, 192000, "a")
    pb = compile_algorithm(ebr_chain_b, 192000, "b")
    assert pa.mem_words[isa.SPACE_EBR] > 16 and pb.mem_words[isa.SPACE_EBR] > 16
    ebr_words = max(pa.mem_words[isa.SPACE_EBR], pb.mem_words[isa.SPACE_EBR])
    io_bits = 16
    ma, mb = Engine(pa, io_bits=io_bits), Engine(pb, io_bits=io_bits)
    dut = P.BfrPeripheral(pa, ebr_words=ebr_words, rbuf_words=512, wbuf_words=512)
    csr = Csr(dut)
    psram = sim.PsramModel()
    frame_clocks = CLOCK_HZ // pa.fs
    inputs = noise_inputs(160, 21, amp=1 << 13)
    n_a = 90
    hw_out, model_out, clock, sent = [], [], [0], [0]

    async def firmware(ctx):
        await csr.write(ctx, "config", len(pa.instrs) | len(pa.streams["taps"]) << 11)
        await csr.write(ctx, "psram_mask", pa.mem_words[isa.SPACE_PSRAM] - 1)
        await csr.write(ctx, "ebr_mask", pa.mem_words[isa.SPACE_EBR] - 1)
        await csr.write(ctx, "ring_base", sim.RING_BASE)
        for k in range(isa.N_LFO):
            await csr.write(ctx, f"lfo_inc{k}", ma.lfo_inc[k])
        await csr.write(ctx, "clear", 1)
        while (await csr.read(ctx, "status")) & 0b10:
            pass
        await csr.write(ctx, "control", 1)
        await ctx.tick().repeat(2)
        for n, x in enumerate(inputs):
            while len(hw_out) < n:
                await ctx.tick()
            if n == n_a:
                await load_program(ctx, csr, pb, mb)
            model_out.extend((ma if n < n_a else mb).process([x]))
            sent[0] = n + 1
        while len(hw_out) < len(inputs):
            await ctx.tick()

    async def codec(ctx):
        for n, x in enumerate(inputs):
            while clock[0] < (n + 1) * frame_clocks or sent[0] <= n:
                await ctx.tick()
                clock[0] += 1
            for k in range(isa.N_IN):
                ctx.set(dut.i.payload[k].as_value(), x[k])
            ctx.set(dut.i.valid, 1)
            await ctx.tick()
            clock[0] += 1
            ctx.set(dut.i.valid, 0)

    async def sink(ctx):
        ctx.set(dut.o.ready, 1)
        while True:
            await ctx.tick()
            if ctx.get(dut.o.valid):
                hw_out.append(tuple(ctx.get(dut.o.payload[k].as_value()) for k in range(isa.N_OUT)))

    s = Simulator(dut)
    s.add_clock(1 / CLOCK_HZ)
    s.add_testbench(firmware)
    s.add_testbench(codec, background=True)
    s.add_testbench(sink, background=True)
    s.add_testbench(psram.bench(dut.psram), background=True)
    s.run()
    assert_same(hw_out, model_out)
    assert any(o[0] for o in hw_out[n_a + 40:]), "B is silent"


def test_bypass_passes_in01_and_silences_wet_outputs():
    """Not running: OUT0/1 are IN0/1, OUT2/3 (the wet outputs) are silent,
    as IN2/3 carry control voltages."""
    prog = compile_algorithm(ebr_chain_a, 192000, "a")
    dut = P.BfrPeripheral(prog, ebr_words=prog.mem_words[isa.SPACE_EBR],
                          rbuf_words=512, wbuf_words=512)
    inputs = noise_inputs(12, 5, amp=1 << 13)
    hw_out = []

    async def codec(ctx):
        for x in inputs:
            for k in range(isa.N_IN):
                ctx.set(dut.i.payload[k].as_value(), x[k])
            ctx.set(dut.i.valid, 1)
            await ctx.tick()
            ctx.set(dut.i.valid, 0)
            await ctx.tick().repeat(20)
        while len(hw_out) < len(inputs):
            await ctx.tick()

    async def sink(ctx):
        ctx.set(dut.o.ready, 1)
        while True:
            await ctx.tick()
            if ctx.get(dut.o.valid):
                hw_out.append(tuple(ctx.get(dut.o.payload[k].as_value()) for k in range(isa.N_OUT)))

    s = Simulator(dut)
    s.add_clock(1 / CLOCK_HZ)
    s.add_testbench(codec)
    s.add_testbench(sink, background=True)
    s.run()
    assert hw_out == [(x[0], x[1], 0, 0) for x in inputs]
    assert any(x[2] or x[3] for x in inputs)


def test_gates_latch_rising_edges_until_read():
    """IN2/3 gate detectors: one edge per crossing (with hysteresis), a
    one-sample trigger is caught, and reading clears the bits."""
    prog = compile_algorithm(ebr_chain_a, 192000, "a")
    dut = P.BfrPeripheral(prog, ebr_words=prog.mem_words[isa.SPACE_EBR],
                          rbuf_words=512, wbuf_words=512)
    csr = Csr(dut)
    hi = 4000                                   # 1 V
    reads = []

    async def sample(ctx, in2, in3):
        ctx.set(dut.i.payload[2].as_value(), in2)
        ctx.set(dut.i.payload[3].as_value(), in3)
        ctx.set(dut.i.valid, 1)
        await ctx.tick()
        ctx.set(dut.i.valid, 0)
        await ctx.tick().repeat(3)

    async def bench(ctx):
        ctx.set(dut.o.ready, 1)
        reads.append(await csr.read(ctx, "gate_edges"))           # nothing yet
        for x in (0, hi + 50, hi + 80, hi + 10, hi - 900):         # hovers: one edge
            await sample(ctx, x, 0)
        reads.append(await csr.read(ctx, "gate_edges"))
        reads.append(await csr.read(ctx, "gate_edges"))           # cleared
        for x in (hi // 2 - 1, hi + 1, 0):                         # re-armed below hi/2
            await sample(ctx, x, 0)
        await sample(ctx, 0, 30000)                                # one-sample trigger
        await sample(ctx, 0, 0)
        reads.append(await csr.read(ctx, "gate_edges"))
        await csr.write(ctx, "gate_level", 20000)
        for x in (0, 10000, 0, 25000):                             # higher threshold
            await sample(ctx, 0, x)
        reads.append(await csr.read(ctx, "gate_edges"))
        for x in (-30000, 0):                                      # negative: no edge
            await sample(ctx, x, 0)
        reads.append(await csr.read(ctx, "gate_edges"))

    s = Simulator(dut)
    s.add_clock(1 / CLOCK_HZ)
    s.add_testbench(bench)
    s.run()
    assert reads == [0b00, 0b01, 0b00, 0b11, 0b10, 0b00]


def wet_scaled(a):
    a.output(0, a.input(0))
    a.output(1, a.input(1))
    a.output(2, a.input(0) * 0.9)
    a.output(3, a.input(1) * -0.7)


def test_wet_peak_is_the_loudest_wet_output():
    prog = compile_algorithm(wet_scaled, 192000, "w")
    stats = {}
    hw, model = run_peripheral(prog, noise_inputs(60, 13, amp=1 << 14), stats=stats)
    assert_same(hw, model)
    assert stats["wet_peak"] == max(max(abs(o[2]), abs(o[3])) for o in hw) > 0


def test_followers_split_level_bass_treble():
    """The input followers: a 100 Hz tone is level and bass, an 8 kHz tone
    level and treble; reading clears the peaks."""
    import math
    prog = compile_algorithm(ebr_chain_a, 48000, "a")
    dut = P.BfrPeripheral(prog, ebr_words=prog.mem_words[isa.SPACE_EBR],
                          rbuf_words=512, wbuf_words=512)
    csr = Csr(dut)
    amp = 16000
    reads = []

    def unpack(v):
        return v & 0x3FF, (v >> 10) & 0x3FF, (v >> 20) & 0x3FF

    async def tone(ctx, hz, n, phase=0):
        for k in range(n):
            x = round(amp * math.sin(2 * math.pi * hz * (phase + k) / prog.fs))
            ctx.set(dut.i.payload[0].as_value(), x)
            ctx.set(dut.i.payload[1].as_value(), x)
            ctx.set(dut.i.valid, 1)
            await ctx.tick()
            ctx.set(dut.i.valid, 0)
            await ctx.tick()

    async def bench(ctx):
        ctx.set(dut.o.ready, 1)
        reads.append(unpack(await csr.read(ctx, "follow")))      # nothing yet
        for hz in (100, 8000):
            await tone(ctx, hz, 1200)                              # settle
            await csr.read(ctx, "follow")
            await tone(ctx, hz, 960, 1200)                         # two 100 Hz periods
            reads.append(unpack(await csr.read(ctx, "follow")))
        reads.append(unpack(await csr.read(ctx, "follow")))      # cleared

    s = Simulator(dut)
    s.add_clock(1 / CLOCK_HZ)
    s.add_testbench(bench)
    s.run()
    (l0, b0, t0), (l1, b1, t1), (l2, b2, t2), last = reads
    assert (l0, b0, t0) == (0, 0, 0) and last == (0, 0, 0)
    for (lv, _, _), hz in ((reads[1], 100), (reads[2], 8000)):     # the samples' peak
        top = max(abs(round(amp * math.sin(2 * math.pi * hz * k / prog.fs))) for k in range(960))
        assert abs(lv - top // 32) <= 1
    assert b1 > 0.75 * l1 and t1 < 0.05 * l1                     # 100 Hz: bass
    assert t2 > 0.8 * l2 and b2 < 0.02 * l2                      # 8 kHz: treble
