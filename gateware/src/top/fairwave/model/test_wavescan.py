"""The model against the definition, independently of the gateware: `test_osc.py` shows
the engine does what the model does, and this shows the model does what WaveScan means.
The reference here is plain floating point, written from the definition:

    sample(phi) = table[frame(phi)][phi],  frame(phi) = pos + shift * phi

bilinear between adjacent samples and adjacent frames.
"""

import math
import random

import numpy as np
import pytest

from .wavescan import (CLAMP, DEPTH_FULL, MIRROR, MOD_FULL, WRAP, Cross, Layer, both, decimate, interpolate, mip_level,
                       mip_rows, pack_frames, pack_table, render, s16, sample, word_read)


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


# ---- Position past the table's ends ----

@pytest.mark.parametrize("edge", [WRAP, MIRROR])
@pytest.mark.parametrize("pos_frames", [-7.25, -1.5, 5.25, 9.75, 200.5])
def test_a_position_past_the_ends_goes_by_the_edge_rule(edge, pos_frames):
    tbl = table(5, 256, seed=3)
    mem = pack_frames(tbl)
    layer = layer_for(tbl, inc=1 << 24, pos=int(pos_frames * 65536), edge=edge)
    for s in range(64):
        layer.phase = s << 24
        want = reference(tbl, layer.phase / 2 ** 32, pos_frames, 0, edge)
        got = sample(layer, mem) * 65536 / layer.level
        assert abs(got - want) < 4, f"sample {s}: {got} vs {want}"


def test_a_position_past_the_ends_stops_there_when_clamping():
    tbl = table(5, 256, seed=3)
    mem = pack_frames(tbl)
    layer = layer_for(tbl, inc=1 << 24, pos=9 << 16, edge=CLAMP)
    layer.phase = 40 << 24
    assert sample(layer, mem) == tbl[4][40]
    layer.pos = -(3 << 16)
    assert sample(layer, mem) == tbl[0][40]


# ---- Reading styles ----

def test_stepped_keeps_to_the_lower_frame():
    tbl = table(4, 256, seed=4)
    mem = pack_frames(tbl)
    layer = layer_for(tbl, pos=(2 << 16) + 0xC000, stepped=1)
    layer.phase = 7 << 24
    assert sample(layer, mem) == tbl[2][7]


def test_raw_keeps_to_the_lower_sample():
    tbl = table(4, 256, seed=4)
    mem = pack_frames(tbl)
    layer = layer_for(tbl, pos=2 << 16, raw=1)
    layer.phase = (7 << 24) + 0xFF0000
    assert sample(layer, mem) == tbl[2][7]


# ---- Band-limited levels ----

def spectrum(out):
    """Magnitude of each bin, the signal's own peak at 1."""
    x = np.array(out, dtype=float)
    return np.abs(np.fft.rfft(x * np.hanning(len(x)))) / (np.hanning(len(x)).sum() / 2)


def saw_frame(length):
    return [int(30000 * (2 * i / length - 1)) for i in range(length)]


def test_a_level_holds_what_it_should_and_not_what_it_shouldnt():
    # A harmonic in the pass band comes through untouched, and one past it is gone.
    n = 2048
    keep = [int(20000 * math.sin(2 * math.pi * 100 * i / n)) for i in range(n)]
    drop = [int(20000 * math.sin(2 * math.pi * 800 * i / n)) for i in range(n)]
    half = decimate(keep)
    assert len(half) == n // 2
    want = [20000 * math.sin(2 * math.pi * 100 * i / (n // 2)) for i in range(n // 2)]
    assert max(abs(a - b) for a, b in zip(half, want)) < 6
    assert max(abs(v) for v in decimate(drop)) < 40, "60 dB down"
    # Up again, a tone in the band lands back where it was, and its own samples are untouched.
    again = interpolate(half)
    assert again[::2] == half
    assert max(abs(a - b) for a, b in zip(again, keep)) < 12


def test_a_level_keeps_dc_and_stays_in_range():
    assert decimate([1000] * 256) == [1000] * 128
    assert interpolate([1000] * 128) == [1000] * 256
    # (a square wave rings past its own peak: that has to saturate, not wrap)
    square = [32767 if i < 128 else -32768 for i in range(256)]
    out = decimate(square)
    assert max(out) == 32767 and min(out) == -32768


def test_the_levels_sit_where_the_prefix_says():
    n = 256
    frames = [[(f * 1000 + i * 3) % 30000 for i in range(n)] for f in range(3)]
    mem = pack_table(frames)
    rows = mip_rows(frames)
    assert len(rows[0]) == n
    layer = Layer(frame_log2=8, frames=3, max_level=5)
    # Level 1 is a row's first half, level 2 the next quarter, level 3 the next eighth.
    for f in range(3):
        for level, at in [(1, 0), (2, n // 2), (3, 3 * n // 4), (4, 7 * n // 8), (5, 15 * n // 16)]:
            word = word_read(layer, mem, f, 1, level)
            assert s16(word & 0xFFFF) == rows[f][at + 2], f"{f} {level}"
    # Level 5's frame is 8 samples, the last of the row used.
    assert 15 * n // 16 + 8 == 248


@pytest.mark.parametrize("inc_step,level", [
    (0.5, 0), (1.0, 0), (2.9, 0), (3.0, 1), (4.0, 1), (5.9, 1), (6.0, 2), (11.9, 2), (12.0, 3), (95.9, 5), (96.0, 6),
])
def test_the_level_follows_the_step_through_the_frame(inc_step, level):
    layer = Layer(frame_log2=11, frames=1, max_level=8)
    assert mip_level(layer, int(inc_step * 2 ** 21)) == level


def test_the_level_stops_at_what_is_there():
    layer = Layer(frame_log2=8, frames=1, max_level=2)
    assert mip_level(layer, 1 << 31) == 2
    layer.max_level = 0
    assert mip_level(layer, 1 << 31) == 0


def test_the_same_pitch_in_a_table_of_any_length_reads_about_the_same_length():
    for log2 in (8, 9, 10, 11):
        layer = Layer(frame_log2=log2, frames=1, max_level=log2 - 3)
        # 3 kHz: 16 samples a cycle, so a frame of twice that, at two samples for each it needs.
        level = mip_level(layer, int(3000 / 48000 * 2 ** 32))
        assert log2 - level == 5, f"{log2}: level {level}"


def harmonics_and_the_rest(out, inc, below=24000):
    """The signal's power on its own harmonics, and off them (which only aliases can be) under
    `below` hertz. A little DC is neither."""
    s = spectrum(out)
    f0 = inc / 2 ** 32 * len(out)
    on = np.zeros(len(s), dtype=bool)
    for h in range(1, int(len(out) / 2 / f0) + 1):
        c = int(round(h * f0))
        on[max(0, c - 4):c + 5] = True
    on[:4] = True
    hz = np.arange(len(s)) / len(out) * 48000
    return (s[on] ** 2).sum(), (s[~on & (hz < below)] ** 2).sum()


@pytest.mark.parametrize("hz", [880.7, 1760.3, 4300.7])
def test_the_levels_take_the_aliasing_out_where_it_is_heard(hz):
    frames = [saw_frame(2048)]
    mem = pack_table(frames)
    # A saw's harmonics run far past Nyquist.
    inc = int(hz / 48000 * 2 ** 32)
    plain = render([Layer(frame_log2=11, frames=1, inc=inc)], mem, 1 << 14)[0]
    clean = render([Layer(frame_log2=11, frames=1, inc=inc, max_level=8)], mem, 1 << 14)[0]
    on, off = harmonics_and_the_rest(plain, inc, below=12000)
    plain_db = 10 * math.log10(off / on)
    on, off = harmonics_and_the_rest(clean, inc, below=12000)
    clean_db = 10 * math.log10(off / on)
    assert plain_db > -25, f"the plain read should alias: {plain_db:.1f} dB"
    assert clean_db < -38, f"{plain_db:.1f} dB to {clean_db:.1f} dB"


def test_a_low_note_keeps_its_top_end_through_the_levels():
    # At C4 a 2048-sample frame is read at level 3 or 4: the top harmonics it can hold are still there.
    frames = [saw_frame(2048)]
    mem = pack_table(frames)
    inc = int(261.63 / 48000 * 2 ** 32)
    out = render([Layer(frame_log2=11, frames=1, inc=inc, max_level=8)], mem, 1 << 15)[0]
    s = spectrum(out)
    bin_of = lambda hz: int(hz / 48000 * len(out))  # noqa: E731
    near = s[bin_of(10464):bin_of(10464) + 12].max()    # the 40th harmonic: a 40th of the fundamental
    assert 0.3 < near / (s[bin_of(261.63) - 4:bin_of(261.63) + 5].max() / 40) < 1.3


# ---- Cross modulation ----

def sine_frames(length, cycles=1):
    return [[int(32000 * math.sin(2 * math.pi * cycles * i / length)) for i in range(length)]]


def linear_read(frame, phase):
    n = len(frame)
    x = (phase % 1.0) * n
    i = int(x)
    return frame[i] + (frame[(i + 1) % n] - frame[i]) * (x - i)


UNITY = 0x9C40      # what 100% is at a layer's `level` (`modulation.py`)


def two_tables(length=1024):
    a = sine_frames(length)
    b = [[int(32000 * (2 * i / length - 1)) for i in range(length)]]
    base_b = len(a) * length * 2 // 256
    return a[0], b[0], base_b, pack_frames(a) | pack_frames(b, base_word=base_b << 6)


def test_fm_moves_the_carriers_phase_by_the_modulator():
    a, b, base_b, mem = two_tables()
    modulator = Layer(frame_log2=10, level=UNITY, inc=1 << 24)
    carrier = Layer(table_base=base_b, frame_log2=10, level=UNITY, inc=3 << 24)
    for depth, cycles in [(DEPTH_FULL, 2.0), (DEPTH_FULL // 4, 0.5)]:
        cross = Cross(pm=1, depth=depth)
        for s in range(40):
            modulator.phase = (s * 17) << 24 & 0xFFFFFFFF
            carrier.phase = (s * 5) << 24 & 0xFFFFFFFF
            m, c = both([modulator, carrier], mem, cross)
            assert m == sample(modulator, mem), "the modulator itself is untouched"
            at = carrier.phase / 2 ** 32 + cycles * m / MOD_FULL
            want = linear_read(b, at) * UNITY / 65536
            assert abs(c - want) < 80, f"depth {depth} sample {s}: {c} vs {want}"


def test_phase_distortion_reads_the_modulator_at_the_carriers_phase():
    a, b, base_b, mem = two_tables()
    # The modulator's own pitch means nothing here.
    modulator = Layer(frame_log2=10, level=UNITY, inc=7 << 24, phase=0x12345678)
    carrier = Layer(table_base=base_b, frame_log2=10, level=UNITY, inc=1 << 24)
    cross = Cross(pm=1, lock=1, depth=DEPTH_FULL // 8)
    for s in range(40):
        carrier.phase = (s * 11) << 24 & 0xFFFFFFFF
        m, c = both([modulator, carrier], mem, cross)
        phi = carrier.phase / 2 ** 32
        want_m = linear_read(a, phi) * UNITY / 65536
        assert abs(m - want_m) < 2, f"sample {s}: {m} vs {want_m}"
        want_c = linear_read(b, phi + 0.25 * m / MOD_FULL) * UNITY / 65536
        assert abs(c - want_c) < 80, f"sample {s}: {c} vs {want_c}"


def test_phase_distortion_has_only_the_carriers_harmonics():
    a = sine_frames(2048)
    b = sine_frames(2048)
    base_b = 2048 * 2 // 256
    mem = pack_frames(a) | pack_frames(b, base_word=base_b << 6)
    inc = int(371.7 / 48000 * 2 ** 32)
    modulator = Layer(frame_log2=11, level=UNITY, inc=int(1000.3 / 48000 * 2 ** 32))
    carrier = Layer(table_base=base_b, frame_log2=11, level=UNITY, inc=inc)
    out = render([modulator, carrier], mem, 1 << 14, cross=Cross(pm=1, lock=1, depth=DEPTH_FULL // 4))[1]
    on, off = harmonics_and_the_rest(out, inc)
    assert 10 * math.log10(off / on) < -50, "nothing but the carrier's harmonics"
    s = spectrum(out)
    second = s[int(2 * inc / 2 ** 32 * len(out)) - 4:int(2 * inc / 2 ** 32 * len(out)) + 5].max()
    assert second > 0.05 * s.max(), "and it has some, from a sine"


def test_ring_at_full_depth_is_the_product():
    a, b, base_b, mem = two_tables()
    modulator = Layer(frame_log2=10, level=UNITY, inc=1 << 24)
    carrier = Layer(table_base=base_b, frame_log2=10, level=UNITY, inc=3 << 24)
    cross = Cross(ring=1, depth=DEPTH_FULL)
    for s in range(40):
        modulator.phase = (s * 17) << 24 & 0xFFFFFFFF
        carrier.phase = (s * 5) << 24 & 0xFFFFFFFF
        m, c = both([modulator, carrier], mem, cross)
        plain = sample(carrier, mem)
        assert abs(c - plain * m / MOD_FULL) < 3, f"sample {s}: {c} vs {plain} x {m}"


def test_half_the_ring_depth_is_am():
    a, b, base_b, mem = two_tables()
    modulator = Layer(frame_log2=10, level=UNITY, inc=1 << 24)
    carrier = Layer(table_base=base_b, frame_log2=10, level=UNITY, inc=3 << 24)
    cross = Cross(ring=1, depth=DEPTH_FULL // 2)
    for s in range(40):
        modulator.phase = (s * 17) << 24 & 0xFFFFFFFF
        carrier.phase = (s * 5) << 24 & 0xFFFFFFFF
        m, c = both([modulator, carrier], mem, cross)
        plain = sample(carrier, mem)
        assert abs(c - plain * (1 + m / MOD_FULL) / 2) < 3, f"sample {s}"


def test_no_depth_changes_nothing():
    a, b, base_b, mem = two_tables()
    modulator = Layer(frame_log2=10, level=UNITY, inc=1 << 24, phase=5 << 24)
    carrier = Layer(table_base=base_b, frame_log2=10, level=UNITY, inc=3 << 24, phase=9 << 24)
    for cross in (Cross(ring=1), Cross(pm=1), Cross()):
        m, c = both([modulator, carrier], mem, cross)
        assert (m, c) == (sample(modulator, mem), sample(carrier, mem))


def test_a_silent_modulator_silences_a_full_ring_and_leaves_fm_alone():
    a, b, base_b, mem = two_tables()
    modulator = Layer(frame_log2=10, level=0, inc=1 << 24)
    carrier = Layer(table_base=base_b, frame_log2=10, level=UNITY, inc=3 << 24, phase=9 << 24)
    assert both([modulator, carrier], mem, Cross(ring=1, depth=DEPTH_FULL))[1] == 0
    assert both([modulator, carrier], mem, Cross(pm=1, depth=DEPTH_FULL))[1] == sample(carrier, mem)


def test_the_direction_swaps_who_is_who():
    a, b, base_b, mem = two_tables()
    x = Layer(frame_log2=10, level=UNITY, inc=1 << 24, phase=3 << 24)
    y = Layer(table_base=base_b, frame_log2=10, level=UNITY, inc=3 << 24, phase=9 << 24)
    one = both([x, y], mem, Cross(pm=1, modulator=0, depth=DEPTH_FULL // 3))
    two = both([y, x], mem, Cross(pm=1, modulator=1, depth=DEPTH_FULL // 3))
    assert one == [two[1], two[0]]
