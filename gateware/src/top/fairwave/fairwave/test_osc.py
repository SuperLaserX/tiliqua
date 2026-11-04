"""The engine against the model, sample for sample, through a PSRAM model with
latency and contention."""

import copy
import math
import random

import pytest
from amaranth.sim import Simulator

from model import wavescan as model
from model.wavescan import CLAMP, DEPTH_FULL, MIRROR, WRAP, Cross, Layer

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
    ctx.set(p.max_level, layer.max_level)
    ctx.set(p.stepped, layer.stepped)
    ctx.set(p.raw, layer.raw)


def run_engine(layers, mem, n, psram=None, on_sample=None, cross=None):
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
            if cross:
                ctx.set(dut.cross.ring, cross.ring)
                ctx.set(dut.cross.pm, cross.pm)
                ctx.set(dut.cross.lock, cross.lock)
                ctx.set(dut.cross.modulator, cross.modulator)
                ctx.set(dut.cross.depth, cross.depth)
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


def compare(layers, mem, n=64, psram=None, on_sample=None, cross=None):
    expected = model.render(copy.deepcopy(layers), mem, n, on_sample=on_sample, cross=cross)
    got, worst = run_engine(layers, mem, n, psram=psram, on_sample=on_sample, cross=cross)
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


@pytest.mark.parametrize("edge", [CLAMP, WRAP, MIRROR])
@pytest.mark.parametrize("pos", [-(7 << 16) - 0x4000, -1, (9 << 16) + 0xC000, 8184 << 16, -(8184 << 16)])
def test_a_position_past_the_ends(edge, pos):
    layers, mem = single(5, 256, inc=1 << 28, pos=pos, shift=3 << 6, edge=edge)
    compare(layers, mem, n=20)


def test_the_furthest_position_and_tilt_of_the_largest_table():
    layers, mem = single(1024, 256, inc=1 << 29, pos=(8184 << 16), shift=(1 << 17) - 1, edge=WRAP)
    compare(layers, mem, n=12)
    layers, mem = single(1024, 256, inc=1 << 29, pos=-(8184 << 16), shift=-(1 << 17), edge=MIRROR)
    compare(layers, mem, n=12)


@pytest.mark.parametrize("stepped,raw", [(1, 0), (0, 1), (1, 1)])
@pytest.mark.parametrize("edge", [CLAMP, WRAP, MIRROR])
def test_reading_styles(stepped, raw, edge):
    layers, mem = single(5, 256, inc=INC * 3, pos=(2 << 16) + 0x6000, shift=1 << 6, edge=edge, stepped=stepped, raw=raw)
    compare(layers, mem, n=24)


def table_with_levels(frames, length):
    return model.pack_table(morph_table(frames, length))


@pytest.mark.parametrize("length", [256, 512, 1024, 2048])
def test_every_level_of_every_frame_length_reads_the_right_samples(length):
    log2 = int(math.log2(length))
    mem = table_with_levels(3, length)
    layers = [Layer(frame_log2=log2, frames=3, max_level=log2 - 3, pos=(1 << 16) + 0x8000)]

    # Up through the octaves, so each sample is at another level.
    def climb(s, state):
        state[0].inc = 1 << (19 + s // 2) | (s * 1234567 & 0xFFFFF)
    expected, _ = compare(layers, mem, n=26, on_sample=climb)
    assert any(expected[0])
    seen = set()
    probe = Layer(frame_log2=log2, frames=3, max_level=log2 - 3)
    for s in range(26):
        seen.add(model.mip_level(probe, 1 << (19 + s // 2) | (s * 1234567 & 0xFFFFF)))
    assert seen == set(range(log2 - 3 + 1)), f"{seen}: every level there is"


def test_a_level_stops_at_what_the_register_says():
    mem = table_with_levels(2, 256)
    layers = [Layer(frame_log2=8, frames=2, max_level=2, inc=1 << 31, pos=0x8000)]
    compare(layers, mem, n=16)


def test_the_most_frames_and_the_longest_frame_read_a_level():
    # (not a table you could fill in a test: just where it reads)
    mem = {}
    layers = [Layer(table_base=0xF000, frame_log2=11, frames=1024, max_level=8, inc=1 << 29, pos=1023 << 16)]
    psram = PsramModel()
    compare(layers, mem, n=8, psram=psram)


def test_levels_under_contention():
    mem = table_with_levels(4, 512)
    layers = [Layer(frame_log2=9, frames=4, max_level=6, inc=(1 << 27) + 123457, pos=0x18000, edge=WRAP)]
    psram = PsramModel(contention=0.8, busy=(40, 150), gaps=0.2, seed=5)
    _, worst = compare(layers, mem, n=24, psram=psram)
    assert worst < 1250, f"{worst} clocks would miss the 48 kHz deadline"


def two_layers(length_a=1024, length_b=256, **kw):
    a = morph_table(4, length_a, seed=1)
    b = morph_table(8, length_b, seed=2)
    base_b = 4 * length_a * 2 // 256
    mem = model.pack_frames(a) | model.pack_frames(b, base_word=base_b << 6)
    return [
        Layer(frame_log2=int(math.log2(length_a)), frames=4, inc=INC, pos=2 << 16, level=0x9C40, **kw),
        Layer(table_base=base_b, frame_log2=int(math.log2(length_b)), frames=8, inc=INC * 3, pos=0x18000,
              level=0x9C40, shift=1 << 6),
    ], mem


@pytest.mark.parametrize("modulator", [0, 1])
@pytest.mark.parametrize("depth", [DEPTH_FULL // 8, DEPTH_FULL, (1 << 17) - 1])
def test_fm(modulator, depth):
    layers, mem = two_layers()
    expected, _ = compare(layers, mem, n=24, cross=Cross(pm=1, modulator=modulator, depth=depth))
    plain = model.render(copy.deepcopy(layers), mem, 24)
    assert expected[1 - modulator] != plain[1 - modulator], "it should change the carrier"
    assert expected[modulator] == plain[modulator], "and only the carrier"


@pytest.mark.parametrize("modulator", [0, 1])
def test_phase_distortion(modulator):
    layers, mem = two_layers()
    cross = Cross(pm=1, lock=1, modulator=modulator, depth=DEPTH_FULL // 4)
    expected, _ = compare(layers, mem, n=24, cross=cross)
    plain = model.render(copy.deepcopy(layers), mem, 24)
    assert expected[modulator] != plain[modulator], "the modulator follows the carrier's phase"


@pytest.mark.parametrize("modulator", [0, 1])
@pytest.mark.parametrize("depth", [0, DEPTH_FULL // 2, DEPTH_FULL, (1 << 17) - 1])
def test_ring(modulator, depth):
    layers, mem = two_layers()
    compare(layers, mem, n=24, cross=Cross(ring=1, modulator=modulator, depth=depth))


def test_a_silent_carrier_stays_silent_and_a_silent_modulator_does_nothing_to_fm():
    layers, mem = two_layers()
    layers[1].level = 0
    psram = PsramModel()
    expected, _ = compare(layers, mem, n=8, psram=psram, cross=Cross(ring=1, depth=DEPTH_FULL))
    assert expected[1] == [0] * 8
    layers, mem = two_layers()
    layers[0].level = 0
    compare(layers, mem, n=8, cross=Cross(pm=1, depth=DEPTH_FULL))


def test_cross_modulation_with_levels_and_the_worst_sample_still_fits():
    a = morph_table(8, 256, seed=1)
    mem = model.pack_table(a)
    layers = [Layer(frame_log2=8, frames=8, max_level=5, inc=(1 << 26) | 1, pos=0x18000, edge=WRAP, level=0x9C40)
              for _ in range(2)]
    layers[1].inc = (1 << 27) | 1
    _, worst = compare(layers, mem, n=16, cross=Cross(ring=1, modulator=1, depth=DEPTH_FULL))
    assert worst < 450, f"{worst} clocks a sample"
