"""The engine against the model, sample for sample, through a PSRAM model with
latency and contention."""

import copy
import math
import random

import pytest
from amaranth.sim import Simulator

from model import wavescan as model
from model.wavescan import CLAMP, MIRROR, WRAP, Layer

from .osc import WaveScanEngine
from .psram_model import PsramModel


def morph_table(frames, length, seed=0):
    """A table whose frames all differ, with every sample significant."""
    rnd = random.Random(seed)
    out = []
    for f in range(frames):
        h = 1 + f % 7
        phase = rnd.random()
        frame = []
        for i in range(length):
            t = i / length
            v = math.sin(2 * math.pi * t + phase) + 0.5 * math.sin(2 * math.pi * h * t)
            frame.append(int(v * 21000) + rnd.randint(-40, 40))
        out.append(frame)
    return out


def set_params(ctx, dut, i, layer):
    p = dut.layers[i]
    ctx.set(p.table_base, layer.table_base)
    ctx.set(p.frame_log2, layer.frame_log2 - 8)
    ctx.set(p.frames_m1, layer.frames - 1)
    ctx.set(p.inc, layer.inc)
    ctx.set(p.pos, layer.pos)
    ctx.set(p.shift, layer.shift)
    ctx.set(p.level, layer.level)
    ctx.set(p.edge, layer.edge)


def run_engine(layers, mem, n, psram=None, on_sample=None):
    """The engine's first `n` samples of each layer, and the longest computation."""
    dut = WaveScanEngine(n_layers=len(layers))
    psram = psram or PsramModel()
    psram.mem = mem
    sim = Simulator(dut)
    sim.add_clock(1 / 60e6)
    sim.add_testbench(psram.bench(dut.bus), background=True)
    got = [[] for _ in layers]
    # The parameters are held by this bench's copy, moved as the model's are.
    state = [copy.copy(layer) for layer in layers]

    async def testbench(ctx):
        worst = 0
        for s in range(n):
            if on_sample:
                on_sample(s, state)
            for i, layer in enumerate(state):
                set_params(ctx, dut, i, layer)
            ctx.set(dut.o.ready, 1)
            while True:
                await ctx.tick()
                if ctx.get(dut.clocks_stb):
                    worst = max(worst, ctx.get(dut.clocks))
                if ctx.get(dut.o.valid):
                    break
            for i in range(len(layers)):
                got[i].append(ctx.get(dut.o.payload[i].as_value()))
            # A testbench sees a clock's results, so the handshake is the next edge,
            # and it must still use this sample's increment.
            await ctx.tick()
            if ctx.get(dut.clocks_stb):
                worst = max(worst, ctx.get(dut.clocks))
        results.append(worst)

    results = []
    sim.add_testbench(testbench)
    sim.run()
    return got, results[0]


def compare(layers, mem, n=64, psram=None, on_sample=None):
    expected = model.render(copy.deepcopy(layers), mem, n, on_sample=on_sample)
    got, worst = run_engine(layers, mem, n, psram=psram, on_sample=on_sample)
    for i, (e, g) in enumerate(zip(expected, got)):
        for s, (x, y) in enumerate(zip(e, g)):
            assert x == y, f"layer {i} sample {s}: model {x}, engine {y}"
    return expected, worst


def single(frames, length, **kw):
    log2 = int(math.log2(length))
    mem = model.pack_frames(morph_table(frames, length))
    return [Layer(frame_log2=log2, frames=frames, **kw)], mem


# A prime increment near 440 Hz at 48 kHz, so the phase visits odd and even samples.
INC = 39370537


def test_frame_lengths_read_the_right_samples():
    for length in (256, 512, 1024, 2048):
        layers, mem = single(1, length, inc=INC * 7, pos=0)
        compare(layers, mem, n=24)


def test_integer_positions_pick_one_frame():
    layers, mem = single(8, 256, inc=INC, pos=3 << 16)
    out, _ = compare(layers, mem, n=24)
    assert any(out[0]), "the table should sound"


def test_fractional_position_blends_two_frames():
    layers, mem = single(8, 256, inc=INC, pos=(3 << 16) + 0x4000)
    compare(layers, mem, n=24)


def test_a_tilted_scan_crosses_frames_within_a_cycle():
    # Three frames per cycle (Q11.6), at a pitch where one cycle is a few samples.
    layers, mem = single(8, 256, inc=1 << 28, pos=1 << 16, shift=3 << 6)
    compare(layers, mem, n=32)


def test_a_negative_tilt_scans_the_other_way():
    layers, mem = single(8, 256, inc=1 << 28, pos=6 << 16, shift=-(4 << 6))
    compare(layers, mem, n=32)


@pytest.mark.parametrize("edge", [CLAMP, WRAP, MIRROR])
@pytest.mark.parametrize("pos,shift", [
    (0, -(5 << 6)),             # off the low end
    (6 << 16, 5 << 6),          # off the high end
    (2 << 16, 40 << 6),         # right past both, several times over
    (2 << 16, -(40 << 6)),
])
def test_edges(edge, pos, shift):
    layers, mem = single(5, 256, inc=1 << 28, pos=pos, shift=shift, edge=edge)
    compare(layers, mem, n=32)


@pytest.mark.parametrize("edge", [CLAMP, WRAP, MIRROR])
def test_a_one_frame_table_at_every_edge(edge):
    layers, mem = single(1, 256, inc=1 << 28, pos=0x8000, shift=2 << 6, edge=edge)
    compare(layers, mem, n=24)


@pytest.mark.parametrize("edge", [WRAP, MIRROR])
def test_a_two_frame_table_wraps_and_mirrors(edge):
    layers, mem = single(2, 256, inc=1 << 28, pos=0x8000, shift=7 << 6, edge=edge)
    compare(layers, mem, n=32)


def test_the_most_negative_shift_at_the_far_end():
    layers, mem = single(1024, 256, inc=1 << 29, pos=(1 << 26) - 1, shift=-(1 << 17))
    compare(layers, mem, n=16)


def test_level_scales_and_saturates():
    layers, mem = single(4, 256, inc=INC, level=0x8000)
    compare(layers, mem, n=16)
    layers, mem = single(4, 256, inc=INC, level=0x1FFFF)
    out, _ = compare(layers, mem, n=32)
    assert max(out[0]) == 32767 or min(out[0]) == -32768, "should have clipped"


def test_a_silent_layer_reads_nothing():
    layers, mem = single(4, 256, inc=INC, level=0)
    psram = PsramModel()
    out, _ = compare(layers, mem, n=8, psram=psram)
    assert out == [[0] * 8]
    assert psram.bursts == 0


def test_a_blend_of_zero_skips_the_second_frame():
    layers, mem = single(4, 256, inc=2 << 24, pos=1 << 16)  # even samples, one word each
    psram = PsramModel()
    compare(layers, mem, n=4, psram=psram)
    assert psram.bursts == 4


def test_two_layers_with_different_tables_and_frame_lengths():
    a = morph_table(8, 2048, seed=1)
    b = morph_table(16, 256, seed=2)
    base_b = 8 * 2048 * 2 // 256                    # in units of 256 bytes
    mem = model.pack_frames(a) | model.pack_frames(b, base_word=base_b << 6)
    layers = [
        Layer(frame_log2=11, frames=8, inc=INC, pos=2 << 16, shift=1 << 6),
        Layer(table_base=base_b, frame_log2=8, frames=16, inc=INC * 3, pos=0x18000,
              edge=WRAP, level=0xC000),
    ]
    compare(layers, mem, n=32)


def test_contention_changes_nothing():
    layers, mem = single(8, 256, inc=INC, pos=0x18000, shift=2 << 6)
    # Other masters holding the bus before most reads, and wait states.
    psram = PsramModel(contention=0.8, busy=(40, 150), gaps=0.2, seed=5)
    _, worst = compare(layers, mem, n=24, psram=psram)
    assert worst < 1250, f"{worst} clocks would miss the 48 kHz deadline"


def test_parameters_change_between_samples():
    layers, mem = single(8, 256, inc=INC, pos=1 << 16)

    def turn(s, state):
        state[0].pos = (1 + s % 5) << 16 | (s * 1000 & 0xFFFF)
        state[0].shift = (s - 10) << 5
        state[0].inc = INC + s * 100000
        state[0].edge = s % 3
    compare(layers, mem, n=24, on_sample=turn)


def test_the_worst_sample_fits_the_deadline_by_a_margin():
    # Odd indices (two words a frame), blending, wrapping, both layers.
    mem = model.pack_frames(morph_table(8, 256))
    layers = [Layer(frame_log2=8, frames=8, inc=(1 << 24) | 1, pos=0x18000, edge=WRAP)
              for _ in range(2)]
    # Each read is about 21 clocks in this model, as the real PSRAM measured.
    _, worst = compare(layers, mem, n=16)
    assert worst < 400, f"{worst} clocks a sample"


def test_random_settings():
    rnd = random.Random(2026)
    for trial in range(6):
        length = rnd.choice((256, 512, 1024, 2048))
        frames = rnd.choice((1, 2, 3, 5, 8, 13))
        mem = model.pack_frames(morph_table(frames, length, seed=trial))
        layer = Layer(
            frame_log2=int(math.log2(length)), frames=frames,
            inc=rnd.getrandbits(30), phase=0,
            pos=rnd.randrange(0, frames << 16), shift=rnd.randrange(-(1 << 13), 1 << 13),
            level=rnd.randrange(1, 0x18000), edge=rnd.choice((CLAMP, WRAP, MIRROR)))
        compare([layer], mem, n=16)
