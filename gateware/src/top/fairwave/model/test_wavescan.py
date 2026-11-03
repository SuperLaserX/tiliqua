"""The model against the definition, independently of the gateware: `test_osc.py` shows
the engine does what the model does, and this shows the model does what WaveScan means.
The reference here is plain floating point, written from the definition:

    sample(phi) = table[frame(phi)][phi],  frame(phi) = pos + shift * phi

bilinear between adjacent samples and adjacent frames.
"""

import math
import random

import pytest

from .wavescan import CLAMP, MIRROR, WRAP, Layer, pack_frames, render, sample


def table(frames, length, seed=0):
    rnd = random.Random(seed)
    return [[rnd.randint(-20000, 20000) for _ in range(length)] for _ in range(frames)]


def edge_frame(x, frames, edge):
    """The frame coordinate after the edge rule, in [0, frames - 1] for clamp and mirror."""
    if edge == CLAMP:
        return min(max(x, 0.0), frames - 1.0)
    if edge == WRAP:
        return math.fmod(math.fmod(x, frames) + frames, frames)
    if frames == 1:
        return 0.0
    period = 2.0 * (frames - 1)
    m = math.fmod(math.fmod(x, period) + period, period)
    return m if m <= frames - 1 else period - m


def reference(tbl, phase, pos, shift, edge):
    """The definition, in floating point: phase in cycles, pos and shift in frames."""
    frames, length = len(tbl), len(tbl[0])
    y = edge_frame(pos + shift * phase, frames, edge)
    f0 = int(y)
    f1 = (f0 + 1) % frames if edge == WRAP else min(f0 + 1, frames - 1)
    fb = y - f0
    x = phase * length
    i = int(x) % length
    fx = x - int(x)

    def row(f):
        return tbl[f][i] + (tbl[f][(i + 1) % length] - tbl[f][i]) * fx
    return row(f0) + (row(f1) - row(f0)) * fb


def layer_for(tbl, **kw):
    return Layer(frame_log2=int(math.log2(len(tbl[0]))), frames=len(tbl), **kw)


def test_one_step_per_sample_plays_a_frame_exactly():
    tbl = table(4, 256)
    mem = pack_frames(tbl)
    layer = layer_for(tbl, inc=1 << 24, pos=2 << 16)        # 2**32 / 256
    out = render([layer], mem, 300)[0]
    assert out == [tbl[2][i % 256] for i in range(300)]


@pytest.mark.parametrize("length", [256, 512, 1024, 2048])
def test_every_frame_length_has_the_same_pitch_for_the_same_increment(length):
    # One cycle is 2**32 of phase whatever the frame's length: a sine at each length
    # comes round after the same number of samples.
    frame = [int(20000 * math.sin(2 * math.pi * i / length)) for i in range(length)]
    tbl = [frame]
    layer = layer_for(tbl, inc=1 << 26)                     # 64 samples a cycle
    out = render([layer], pack_frames(tbl), 65)[0]
    assert abs(out[64] - out[0]) <= 1
    assert abs(out[16] - 20000) < 60, f"a quarter cycle should peak, got {out[16]}"


def test_a_frames_length_never_reads_past_its_end():
    # The last sample interpolates towards the frame's first, not the next frame's.
    tbl = [[1000] * 256, [-1000] * 256]
    layer = layer_for(tbl, phase=0xFFFFFFFF)
    assert sample(layer, pack_frames(tbl)) == 1000


@pytest.mark.parametrize("edge", [CLAMP, WRAP, MIRROR])
@pytest.mark.parametrize("frames,length", [(1, 256), (2, 256), (5, 512), (16, 2048)])
def test_the_model_matches_the_definition(edge, frames, length):
    tbl = table(frames, length, seed=frames)
    mem = pack_frames(tbl)
    rnd = random.Random(7)
    for _ in range(300):
        phase = rnd.getrandbits(32)
        # In the formats' own steps, so the reference sees exactly what the model does.
        pos = rnd.randrange(0, frames << 16)
        shift = rnd.randrange(-(frames * 3) << 6, ((frames * 3) << 6) + 1)
        layer = layer_for(tbl, phase=phase, pos=pos, shift=shift, edge=edge)
        got = sample(layer, mem)
        # (phi is the top 17 bits of the phase in the model)
        want = reference_at(tbl, phase, pos, shift, edge)
        assert abs(got - want) <= tolerance(tbl, shift), \
            f"phase {phase:#x} pos {pos / 65536} shift {shift / 64}: model {got}, definition {want}"


def reference_at(tbl, phase, pos, shift, edge):
    frames, length = len(tbl), len(tbl[0])
    # The frame coordinate as the model quantises phi; the sample position in full.
    phi = (phase >> 15) / (1 << 17)
    y = edge_frame(pos / 65536 + shift / 64 * phi, frames, edge)
    f0 = min(int(y), frames - 1)
    f1 = (f0 + 1) % frames if edge == WRAP else min(f0 + 1, frames - 1)
    fb = y - f0
    x = phase / (1 << 32) * length
    i, fx = int(x), x - int(x)

    def row(f):
        return tbl[f][i] + (tbl[f][(i + 1) % length] - tbl[f][i]) * fx
    return row(f0) + (row(f1) - row(f0)) * fb


def tolerance(tbl, shift):
    # Rounding down at each of two lerps, plus frame-blend steps of 2**-16 and the
    # model's phi steps (shift / 2**17 frames) across samples up to 40000 apart.
    return 3 + 40000 * (1 / 65536 + abs(shift / 64) / (1 << 17))


def test_shift_crosses_frames_within_one_cycle():
    # Frames of constant value: the output IS the frame coordinate, so the tilt is plain.
    tbl = [[1000 * f] * 256 for f in range(9)]
    mem = pack_frames(tbl)
    layer = layer_for(tbl, inc=1 << 28, pos=0, shift=8 << 6)    # all 8 steps in a cycle
    out = render([layer], mem, 16)[0]
    assert out == sorted(out), f"should climb through the table: {out}"
    assert out[0] == 0
    assert 7000 <= out[-1] < 8000
    # ... and each cycle starts over from pos.
    layer = layer_for(tbl, inc=1 << 28, pos=0, shift=8 << 6)
    out = render([layer], mem, 17)[0]
    assert out[16] == 0


def test_a_negative_shift_runs_the_table_backwards():
    tbl = [[1000 * f] * 256 for f in range(9)]
    layer = layer_for(tbl, inc=1 << 28, pos=8 << 16, shift=-(8 << 6))
    out = render([layer], pack_frames(tbl), 16)[0]
    assert out == sorted(out, reverse=True)
    assert out[0] == 8000


def test_position_blends_linearly_between_frames():
    tbl = [[0] * 256, [8000] * 256]
    mem = pack_frames(tbl)
    assert sample(layer_for(tbl, pos=0x8000), mem) == 4000
    assert sample(layer_for(tbl, pos=0x4000), mem) == 2000


def test_edge_rules_at_the_ends():
    tbl = [[1000 * f] * 256 for f in range(4)]
    mem = pack_frames(tbl)

    def at(pos, shift, edge):
        # phi just under 1, so the coordinate is about pos + shift
        return sample(layer_for(tbl, phase=0xFFFFFFFF, pos=pos, shift=shift, edge=edge), mem)

    # Past the top by half a frame: 3.5.
    assert at(3 << 16, 32, CLAMP) == 3000
    assert at(3 << 16, 32, WRAP) == pytest.approx(1500, abs=2)     # half way from 3 back to 0
    assert at(3 << 16, 32, MIRROR) == pytest.approx(2500, abs=2)   # 3.5 folds to 2.5
    # Past the bottom by half a frame: -0.5.
    assert sample(layer_for(tbl, phase=0xFFFFFFFF, pos=0, shift=-32, edge=CLAMP), mem) == 0
    assert sample(layer_for(tbl, phase=0xFFFFFFFF, pos=0, shift=-32, edge=WRAP), mem) \
        == pytest.approx(1500, abs=2)                               # -0.5 wraps to 3.5
    assert sample(layer_for(tbl, phase=0xFFFFFFFF, pos=0, shift=-32, edge=MIRROR), mem) \
        == pytest.approx(500, abs=2)                                # -0.5 folds to 0.5


def test_level_scales_and_saturates():
    tbl = [[20000] * 256]
    mem = pack_frames(tbl)
    assert sample(layer_for(tbl, level=0x8000), mem) == 10000
    assert sample(layer_for(tbl, level=0x10000), mem) == 20000
    assert sample(layer_for(tbl, level=0x1FFFF), mem) == 32767
    tbl = [[-20000] * 256]
    assert sample(layer_for(tbl, level=0x1FFFF), pack_frames(tbl)) == -32768
