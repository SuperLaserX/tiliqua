"""Tests for the bfr model. Run from src/top/bfr: python -m pytest model"""

import importlib
import math
import random

import pytest

from algorithms import TYPES

from . import engine, fp, isa
from .compiler import CompileError, compile_algorithm, compile_module, compile_set
from .engine import Engine, check
from .lib import allpass, lowpass

RATES = (48000, 96000, 192000)
ALGORITHMS = ("plate", "fdn8")


def random_bits(rnd):
    """f32 bit patterns biased toward edge cases."""
    r = rnd.random()
    if r < 0.05:
        return rnd.choice([0, 0x80000000, 0x00000001, 0x807FFFFF, 0x7F800000, 0xFF800001,
                           0x7FFFFFFF, 0x3F800000, 0xBF800000, 0x43800000, 0x437FFFFF])
    e = rnd.choice([rnd.randint(0, 255), rnd.randint(70, 140), rnd.randint(110, 135)])
    return (rnd.getrandbits(1) << 31) | (e << 23) | rnd.getrandbits(23)


def test_mul_matches_definition():
    rnd = random.Random(1)
    for _ in range(100000):
        a, b = random_bits(rnd), random_bits(rnd)
        assert fp.mul(a, b) == fp.mul_fast(fp.bits_to_float(a), fp.bits_to_float(b)), (hex(a), hex(b))


def test_writeback_matches_definition():
    rnd = random.Random(2)
    cases = [0, 1, -1, fp.ACC_MAX, -fp.ACC_MAX, (1 << 24) - 1, 1 << 24, (1 << 25) - 1, 3 << 30]
    for _ in range(100000):
        k = rnd.randint(1, 56)
        cases.append(rnd.choice((-1, 1)) * rnd.randint(1 << (k - 1), (1 << k) - 1))
    for x in cases:
        x = fp.sat(x)
        assert fp.float_to_bits(fp.acc_to_float(x)) == fp.acc_to_bits(x), x


def test_scale_matches_definition():
    rnd = random.Random(8)
    for _ in range(100000):
        c = random_bits(rnd)
        if rnd.random() < 0.5:
            w = fp.float_to_bits(rnd.randint(0, isa.FADE_ONE) / isa.FADE_ONE)   # fade weights
        else:
            w = random_bits(rnd)
        assert fp.bits_to_float(fp.scale(c, w)) == fp.scale_fast(fp.bits_to_float(c), fp.bits_to_float(w)), \
            (hex(c), hex(w))


def test_io_conversions_match_definition():
    rnd = random.Random(3)
    for w in (16, 24):
        for _ in range(20000):
            x = rnd.randint(-(1 << (w - 1)), (1 << (w - 1)) - 1)
            assert fp.bits_to_float(fp.in_to_bits(x, w)) == x / (1 << (w - 1))
        for _ in range(50000):
            acc = fp.sat(rnd.choice((-1, 1)) * rnd.getrandbits(rnd.randint(1, 57)))
            bits = fp.acc_to_bits(acc)
            assert fp.bits_to_out(bits, w) == fp.float_to_out(fp.bits_to_float(bits), w)


def test_fixed_point_modulation():
    # acc / 2^24, floored and saturated; then clamped to +-depth samples.
    assert fp.acc_to_fix(3 << 24) == 3 and fp.acc_to_fix(-1) == -1
    assert fp.acc_to_fix(fp.ACC_MAX) == (1 << 31) - 1 and fp.acc_to_fix(-fp.ACC_MAX) == -(1 << 31)
    assert fp.interp_split(5 * 65536 + 123, 8) == (5, 123)
    assert fp.interp_split(-(5 * 65536 + 123), 8) == (-6, 65536 - 123)
    assert fp.interp_split(100 * 65536, 8) == (8, 0)
    assert fp.interp_split(-100 * 65536, 8) == (-8, 0)


def test_modulation_beyond_256_samples():
    """Excursions above the accumulator's +-256 range work (depth is scaled)."""
    def build(a):
        line = a.delay("line")
        line.write(a.input(0))
        a.output(0, line.modtap(2000, 1000.25, a.one, max_depth=1001))
    prog = compile_algorithm(build, 48000, "t")
    assert check(prog) == []
    eng = Engine(prog)
    x = [(0, 0, 0, 0)] * 3100
    x[0] = (1 << 22, 0, 0, 0)
    y = [o[0] / (1 << 23) for o in eng.process(x)]
    assert y[3000] == pytest.approx(0.5 * 0.75, abs=2 ** -20)
    assert y[3001] == pytest.approx(0.5 * 0.25, abs=2 ** -20)


def test_instruction_encoding_roundtrip():
    rnd = random.Random(5)
    for _ in range(2000):
        fields = {name: rnd.getrandbits(width) for name, width in isa.FIELDS}
        ins = isa.Instr(**fields)
        assert isa.Instr.decode(ins.encode()) == ins
        assert ins.encode() < 1 << isa.INSTR_BITS


@pytest.mark.parametrize("name", ALGORITHMS)
@pytest.mark.parametrize("fs", RATES)
def test_algorithms_compile_clean(name, fs):
    mod = importlib.import_module(f"algorithms.{name}")
    # Modulation windows grow with the rate: give the stream engine the largest
    # read buffer (a build parameter).
    prog = compile_algorithm(mod.build, fs, name, rbuf_words=1 << isa.BUF_BITS)
    assert check(prog) == []
    assert prog.report["fits"]


@pytest.mark.parametrize("name", ALGORITHMS)
def test_fast_engine_matches_interpreter(name):
    mod = importlib.import_module(f"algorithms.{name}")
    prog = compile_algorithm(mod.build, 48000, name)
    rnd = random.Random(6)
    inp = [tuple(rnd.randint(-(1 << 22), 1 << 22) for _ in range(4)) for _ in range(900)]
    fast, ref = Engine(prog), Engine(prog)
    out_fast, out_ref = [], []
    for chunk, changes in ((inp[:300], {}), (inp[300:600], {"size": 0.6, "mix": 1.0}),
                           (inp[600:], {"mod_depth": 1.0, "decay": 0.9})):
        for k, v in changes.items():
            fast.set_param(k, min(v, next(d.hi for d in prog.params if d.name == k)))
            ref.set_param(k, min(v, next(d.hi for d in prog.params if d.name == k)))
        out_fast += fast.process(chunk)
        out_ref += ref.process_ref(chunk)
    assert out_fast == out_ref
    assert fast.acc == ref.acc and fast.R == ref.R and fast.mem == ref.mem


def compile_build(build, fs=48000):
    prog = compile_algorithm(build, fs, "test")
    assert check(prog) == []
    return prog


def impulse(prog, n, amp=0.5, ch=0):
    eng = Engine(prog)
    x = [(0, 0, 0, 0)] * n
    x[0] = tuple(int(amp * (1 << 23)) if k == ch else 0 for k in range(4))
    return eng, [o[0] / (1 << 23) for o in eng.process(x)]


def test_delay_and_parameter_driven_tap():
    def build(a):
        d = a.param("d", 100, 70, 400)
        line = a.delay("line")
        line.write(a.input(0))
        a.output(0, line.tap(d) * 0.5)
    prog = compile_build(build)
    eng, y = impulse(prog, 300)
    assert [i for i, v in enumerate(y) if v] == [100] and y[100] == 0.25
    eng.reset()
    eng.set_param("d", 250)
    x = [(0, 0, 0, 0)] * 300
    x[0] = (1 << 22, 0, 0, 0)
    y = [o[0] for o in eng.process(x)]
    assert [i for i, v in enumerate(y) if v] == [250]


def test_allpass_is_lossless():
    def build(a):
        y, _ = allpass(a, a.input(0), 113, 0.7, "ap")
        a.output(0, y)
    _, y = impulse(compile_build(build), 20000)
    energy = sum(v * v for v in y)
    assert abs(energy - 0.25) < 1e-5


def test_lowpass_matches_double_precision():
    k = 0.05

    def build(a):
        a.output(0, lowpass(a, a.input(0), k, "lp"))
    _, y = impulse(compile_build(build), 400)
    ref = [0.5 * k * (1 - k) ** n for n in range(400)]
    assert max(abs(u - v) for u, v in zip(y, ref)) < 2 ** -22


def test_modulated_tap_interpolates():
    def build(a):
        line = a.delay("line")
        line.write(a.input(0))
        # constant modulation: 100 + 3.25 samples
        a.output(0, line.modtap(100, 3.25, a.one, max_depth=4))
    _, y = impulse(compile_build(build), 200)
    assert y[103] == pytest.approx(0.5 * 0.75, abs=2 ** -22)
    assert y[104] == pytest.approx(0.5 * 0.25, abs=2 ** -22)
    assert sum(1 for v in y if v) == 2


def random_build(seed):
    """A random algorithm using every kind of operand, with feedback and saturation."""
    def build(a):
        rnd = random.Random(seed)
        p = a.param("p", 0.5, 0.0, 1.0, fade_ms=rnd.choice((0.0, 0.5, 2.0)))
        lfos = [a.lfo(rnd.uniform(0.1, 20.0), rnd.random()) for _ in range(rnd.randint(0, 4))]
        parts = [x for l in lfos for x in (l.sin, l.cos, l.tri, l.saw)]
        lines = [a.delay(f"l{i}") for i in range(rnd.randint(1, 6))]
        states = [a.state(f"s{i}", init=rnd.uniform(-0.5, 0.5)) for i in range(rnd.randint(0, 4))]
        pool = [a.input(k) for k in range(4)] + [s.prev for s in states] + [a.noise] + parts
        for line in lines:
            for _ in range(rnd.randint(1, 3)):
                pool.append(line.tap(rnd.choice((1, 2, 7, 63, 64, 65, 300)) if rnd.random() < 0.7
                                     else p * 100 + 70))
            if rnd.random() < 0.4:
                pool.append(line.modtap(rnd.randint(30, 200), rnd.uniform(0, 12) * p,
                                        rnd.choice(parts or [a.one]), max_depth=12))
        for _ in range(rnd.randint(3, 40)):
            r = rnd.random()
            if r < 0.5:
                xs = rnd.sample(pool, rnd.randint(1, min(5, len(pool))))
                pool.append(sum((x * rnd.uniform(-1.5, 1.5) for x in xs[1:]), xs[0] * p))
            elif r < 0.75:
                pool.append(rnd.choice(pool) * rnd.choice(pool))
            else:
                pool.append(rnd.choice(pool) - rnd.choice(pool) * 0.25 + 0.125)
        for line in lines:
            line.write(rnd.choice(pool[-12:]) * rnd.uniform(0.2, 1.2))
        for s in states:
            s.write(rnd.choice(pool) * 0.7)
        for k in rnd.sample(range(4), rnd.randint(1, 4)):
            a.output(k, rnd.choice(pool))
    return build


@pytest.mark.parametrize("seed", range(80))
def test_random_algorithms(seed):
    prog = compile_algorithm(random_build(seed), 48000, f"random{seed}")
    assert check(prog) == []
    rnd = random.Random(seed)
    inp = [tuple(rnd.randint(-(1 << 23), (1 << 23) - 1) for _ in range(4)) for _ in range(300)]
    fast, ref = Engine(prog), Engine(prog)
    out_fast = fast.process(inp[:150])
    out_ref = ref.process_ref(inp[:150])
    fast.set_param("p", 0.9)
    ref.set_param("p", 0.9)
    out_fast += fast.process(inp[150:])
    out_ref += ref.process_ref(inp[150:])
    assert out_fast == out_ref
    assert fast.acc == ref.acc and fast.R == ref.R and fast.mem == ref.mem


def test_accumulator_pressure_spills():
    """More finished values than accumulators, waiting on a late operand."""
    def build(a):
        line = a.delay("l")
        line.write(a.input(0))
        taps = [line.tap(70 + i) for i in range(80)]
        # Twelve 6-term sums, each stored (so not inlined) and read once...
        vs, vlines = [], []
        for i in range(12):
            v = sum((taps[6 * i + j] * (0.1 + 0.01 * j) for j in range(1, 6)), taps[6 * i] * 0.1)
            vlines.append(a.delay(f"v{i}"))
            vlines[-1].write(v)
            vs.append(v)
        # ...by two sums that also need a value scheduled after them.
        d = taps[79] * 0.5
        a.output(0, d + sum(vs[1:6], vs[0]))
        a.output(1, d * 0.5 + sum(vs[7:12], vs[6]))
        a.output(2, sum((l.tap(80) for l in vlines[1:]), vlines[0].tap(80)) * 0.05)
    prog = compile_algorithm(build, 48000, "pressure")
    assert prog.report["spills"] > 0
    assert check(prog) == []
    rnd = random.Random(7)
    inp = [(rnd.randint(-(1 << 23), (1 << 23) - 1), 0, 0, 0) for _ in range(400)]
    assert Engine(prog).process(inp) == Engine(prog).process_ref(inp)


def crossfade_delay(fade_ms):
    def build(a):
        d = a.param("d", 100, 70, 2000, fade_ms=fade_ms)
        line = a.delay("line")
        line.write(a.input(0))
        a.output(0, line.tap(d) * 0.5)
    prog = compile_build(build)
    assert prog.fades == [("d", int(fade_ms * 48))]
    return prog


def test_crossfade_is_click_free_and_timed():
    prog = crossfade_delay(10.0)              # 480 samples
    eng = Engine(prog)
    dc = (1 << 22, 0, 0, 0)                   # 0.5
    eng.process([dc] * 3000)                  # fill the line
    eng.set_param("d", 1500)
    y, weights = [], []
    for _ in range(700):
        weights.append(eng.R[isa.REG_FADE + 1])
        y += eng.process([dc])
    # A DC input through either position is the same, so a crossfade must not move it.
    assert max(abs(o[0] - (1 << 21)) for o in y) <= 1
    # Side B ramps from 0 to 1 in 480 samples. It starts once the new tap's
    # PSRAM stream has warmed up, at the next CPU poll after that.
    warm = prog.streams["warmup"][0]
    assert warm == 2 * isa.STREAM_BURST
    start = next(i for i, w in enumerate(weights) if w > 0)
    end = next(i for i, w in enumerate(weights) if w == 1.0)
    assert warm < start <= warm + engine.CPU_POLL + 1 and 478 <= end - start <= 482
    assert not eng.fading()


def test_crossfade_moves_the_tap_and_queues_changes():
    prog = crossfade_delay(1.0)               # 48 samples
    eng = Engine(prog)
    eng.set_param("d", 300)
    eng.set_param("d", 900)                   # arrives during the first fade: queued
    eng.process([(0, 0, 0, 0)] * 400)
    assert eng.fading() is False and eng.side_value[0] == [900, 300]
    x = [(0, 0, 0, 0)] * 1200
    x[0] = (1 << 22, 0, 0, 0)
    y = [o[0] for o in eng.process(x)]
    assert [i for i, v in enumerate(y) if v] == [900]


def test_plate_survives_size_sweep():
    mod = importlib.import_module("algorithms.plate")
    prog = compile_algorithm(mod.build, 48000, "plate")
    eng = Engine(prog)
    eng.set_param("decay", 0.9)
    eng.set_param("mix", 1.0)
    rnd = random.Random(9)
    peak = 0
    for block in range(75):                   # 1.5 s, size moved every 20 ms
        eng.set_param("size", 0.5 + 1.5 * block / 74)
        x = [(rnd.randint(-(1 << 20), 1 << 20),) * 2 + (0, 0) for _ in range(960)]
        peak = max(peak, max(abs(o[0]) for o in eng.process(x)))
    assert 0 < peak < 1 << 22                 # stays well below full scale


def test_rt60_parameter_sets_decay():
    from .render import rt60
    mod = importlib.import_module("algorithms.fdn8")
    prog = compile_algorithm(mod.build, 48000, "fdn8")
    eng = Engine(prog)
    for k, v in {"mix": 1.0, "decay": 0.8, "damping": 20000.0, "mod_depth": 0.0}.items():
        eng.set_param(k, v)
    x = [(0, 0, 0, 0)] * 48000
    x[0] = (1 << 22, 1 << 22, 0, 0)
    import numpy as np
    y = np.array([o[0] for o in eng.process(x)], dtype=float)
    assert rt60(y, 48000) == pytest.approx(0.8, rel=0.15)


# -- the set of types a bitstream carries ----------------------------------------

def _module(name, build, **attrs):
    import types
    return types.SimpleNamespace(NAME=name, build=build, **attrs)


def test_compile_set_sizes_and_menu_text():
    mods = [importlib.import_module(f"algorithms.{n}") for n in ("plate", "fdn8")]
    progs, sizes = compile_set(mods, 48000)
    assert [p.title for p in progs] == ["Plate", "Hall"]
    assert all(p.description and p.presets for p in progs)
    assert all(d.help for p in progs for d in p.params), "every parameter explains itself"
    assert sizes["rbuf_words"] >= max(p.streams["rbuf_words"] for p in progs)
    assert sizes["ebr_words"] >= max(p.mem_words[isa.SPACE_EBR] for p in progs)


def test_compile_set_limits():
    plate = importlib.import_module("algorithms.plate")
    with pytest.raises(CompileError, match="instructions"):
        compile_set([plate], 48000, prog_depth=50)
    with pytest.raises(CompileError, match="names repeat"):
        compile_set([plate, plate], 48000)
    with pytest.raises(CompileError, match="no parameter"):
        compile_set([_module("x", plate.build, PRESETS=[("p", {"nope": 1.0})])], 48000)
    with pytest.raises(CompileError, match="outside"):
        compile_set([_module("x", plate.build, PRESETS=[("p", {"mix": 2.0})])], 48000)


@pytest.mark.parametrize("name", (*TYPES, "lab", "fdn8"))
def test_wet_outputs_are_the_reverb_alone(name):
    """OUT2/3 carry the reverb only: at mix 1, OUT0/1 equal them (to 1 LSB:
    OUT0/1 multiply the reverb by mix after it was rounded to f32, OUT2/3 take
    it straight from the accumulator)."""
    mod = importlib.import_module(f"algorithms.{name}")
    prog = compile_algorithm(mod.build, 48000, name)
    eng = Engine(prog)
    eng.set_param("mix", 1.0)
    rnd = random.Random(3)
    inp = [tuple(rnd.randint(-(1 << 22), 1 << 22) for _ in range(4)) for _ in range(24000)]
    out = eng.process(inp)
    assert any(o[2] for o in out) and any(o[3] for o in out)
    assert all(abs(o[0] - o[2]) <= 1 and abs(o[1] - o[3]) <= 1 for o in out)


def test_spring_kick_is_silent_until_fired_then_decays():
    """The kick (a trigger) adds nothing until the firmware fires it; then a
    loud crash that dies away, and its envelope reaches 0."""
    prog = compile_module(importlib.import_module("algorithms.spring"), 48000)
    assert [t[0] for t in prog.triggers] == ["kick"]
    eng = Engine(prog)
    zeros = [(0, 0, 0, 0)] * 4800
    assert not any(any(o) for o in eng.process(zeros))
    eng.trigger("kick")
    hit = eng.process(zeros * 10)
    peak = max(abs(o[2]) for o in hit)
    assert peak > (1 << 23) * 10 ** (-12 / 20)
    assert eng.R[prog.triggers[0][1]] == 0.0
    assert max(abs(o[2]) for o in hit[-4800:]) < peak / 10
    with pytest.raises(KeyError):
        eng.trigger("snare")


@pytest.mark.parametrize("name", (*TYPES, "lab", "fdn8"))
def test_extreme_preset_decays(name):
    """Every type has an "Extreme" preset, and it is stable: after an
    impulse, the last of 5 seconds is quieter than the loudest before it
    (not the first: void's swell holds the energy back for over a second)."""
    prog = compile_module(importlib.import_module(f"algorithms.{name}"), 48000)
    values = dict(prog.presets)["Extreme"]
    eng = Engine(prog)
    for k, v in values.items():
        eng.set_param(k, v)
    eng.process([(0, 0, 0, 0)] * 9600)
    out = eng.process([(1 << 21, 1 << 21, 0, 0)] + [(0, 0, 0, 0)] * (5 * 48000 - 1))

    def rms(xs):
        return math.sqrt(sum(o[2] ** 2 + o[3] ** 2 for o in xs) / len(xs))
    seconds = [rms(out[i:i + 48000]) for i in range(0, 5 * 48000, 48000)]
    assert seconds[-1] < max(seconds[:-1]), seconds


def test_resonator_is_in_tune_and_silent_until_struck():
    """The resonator's combs ring exactly at their notes (fifths, combs 110,
    220 and 440 Hz on the right), and the strike is silent until fired."""
    import numpy as np
    prog = compile_module(importlib.import_module("algorithms.resonator"), 48000)
    assert [t[0] for t in prog.triggers] == ["strike"]
    eng = Engine(prog)
    for k, v in {"pitch": 45.0, "chord": 1.0, "spread": 1.0, "decay": 8.0,
                 "damping": 12000.0}.items():
        eng.set_param(k, v)
    zeros = [(0, 0, 0, 0)] * 4800
    assert not any(any(o) for o in eng.process(zeros))
    eng.trigger("strike")
    y = np.array([o[3] for o in eng.process([(0, 0, 0, 0)] * (4 * 48000))], dtype=float)
    spec = np.abs(np.fft.rfft(y * np.hanning(len(y))))
    freqs = np.fft.rfftfreq(len(y), 1 / 48000)
    for f0 in (110.0, 220.0, 440.0):
        band = (freqs > f0 * 0.97) & (freqs < f0 * 1.03)
        i = int(np.argmax(np.where(band, spec, 0)))
        a, b, c = np.log(spec[i - 1:i + 2])
        f = freqs[i] + 0.5 * (a - c) / (a - 2 * b + c) * (freqs[1] - freqs[0])
        assert abs(1200 * math.log2(f / f0)) < 5, f"{f0} Hz comb at {f:.2f} Hz"


def test_freq_shift_moves_a_tone_up_or_down():
    """`lib.freq_shift`: a 1 kHz tone comes out at 1 kHz + the LFO's rate
    (negative: down), the other sideband far below it."""
    import numpy as np
    from .lib import freq_shift

    for shift in (50.0, -50.0):
        def build(a):
            x = a.input(0)
            y = freq_shift(a, x, a.lfo(shift), "fs")
            a.output(0, y)
        eng = Engine(compile_algorithm(build, 48000, "shift"))
        n = 48000
        inp = [(int(round((1 << 22) * math.sin(2 * math.pi * 1000 * k / 48000))), 0, 0, 0)
               for k in range(n)]
        y = np.array([o[0] for o in eng.process(inp)][4800:], dtype=float)
        spec = np.abs(np.fft.rfft(y * np.hanning(len(y))))
        freqs = np.fft.rfftfreq(len(y), 1 / 48000)

        def level(f):
            return spec[(freqs > f - 5) & (freqs < f + 5)].max()
        want, image = 1000 + shift, 1000 - shift
        assert abs(freqs[int(np.argmax(spec))] - want) < 2
        assert 20 * math.log10(level(want) / level(image)) > 35


def test_sine_shaper_is_a_sine_of_its_input():
    """`lib.SineShaper`: sin(k x) and cos(k x) of a full-scale signal."""
    from .lib import SineShaper

    k = 3.0

    def build(a):
        sh = SineShaper(a, "sh")
        s, c = sh(a.input(0), k)
        a.output(0, s)
        a.output(1, c)
    eng = Engine(compile_algorithm(build, 48000, "shaper"))
    n = 4000
    xs = [0.95 * math.sin(2 * math.pi * 3.7 * i / n) for i in range(n)]
    out = eng.process([(int(round(x * (1 << 23))), 0, 0, 0) for x in xs])
    scale = 1.0 / (1 << 23)
    for i in range(1000, n):                    # (the lines have filled)
        assert abs(out[i][0] * scale - math.sin(k * xs[i])) < 2e-3, i
        assert abs(out[i][1] * scale - math.cos(k * xs[i])) < 2e-3, i
