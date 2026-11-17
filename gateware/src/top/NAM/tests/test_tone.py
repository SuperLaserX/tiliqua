"""The tone stack: the model against floating point, and the gateware against the model.

    python src/top/NAM/tests/test_tone.py            (from gateware/)
"""

import math
import os
import sys

import numpy as np
from amaranth.sim import Simulator

HERE = os.path.dirname(os.path.realpath(__file__))
sys.path.insert(0, os.path.join(HERE, ".."))

from model import tone  # noqa: E402
from nam.tone import ToneStack  # noqa: E402


def guitar(n, seed=1):
    """Plucked-string-like test signal at about -6 dBFS peaks, with a DC offset."""
    rng = np.random.default_rng(seed)
    t = np.arange(n) / tone.FS
    x = np.zeros(n)
    for f0, start in [(82.41, 0.0), (110.0, 0.4), (164.8, 0.8)]:
        env = np.where(t >= start, np.exp(-(t - start) * 3.0), 0.0)
        for h in range(1, 8):
            x += env * np.sin(2 * np.pi * f0 * h * (t - start)) / h * rng.uniform(0.5, 1.0)
    x = 0.5 * x / np.abs(x).max() + 0.01
    return np.round(x * 32767).astype(np.int64)


SETTINGS = [(0, 0, 0, True), (20, 0, 0, True), (-20, 0, 0, True), (0, 15, 0, True), (0, -15, 0, True),
            (0, 0, 10, True), (0, 0, -10, True), (12, -9, 6, True), (5, 5, 5, False)]


def test_model_against_floating_point():
    x = guitar(int(1.5 * tone.FS))
    for b, mi, t, on in SETTINGS:
        st = tone.stack(b, mi, t, on)
        got = tone.ToneStack(st).run(x) / 32768.0
        # floating point with the same (rounded) coefficients: what is left is the arithmetic's
        s = 2.0 ** tone.COEF_FRAC
        f = [[c[0] / s, c[1] / s, c[2] / s, -c[3] / s, -c[4] / s] for c in st]
        ref = tone.run_float(x / 32768.0, f)
        ref = np.clip(ref, -1.0, 32767 / 32768)
        esr = 10 * math.log10(np.sum((got - ref) ** 2) / np.sum(ref ** 2))
        # The floor: the float result rounded to the output's 16 bits. The filters' own error
        # must stay under it.
        floor = 10 * math.log10(np.sum((np.round(ref * 32768) / 32768 - ref) ** 2) / np.sum(ref ** 2))
        assert esr < floor + 1.0, (b, mi, t, on, esr, floor)
        print(f"bass {b:+3d} mid {mi:+3d} treble {t:+3d} on {on}: ESR {esr:6.1f} dB (16-bit floor {floor:6.1f})")


def test_flat_is_the_dc_blocker_alone():
    x = guitar(4000)
    flat = tone.ToneStack(tone.stack(0, 0, 0, True)).run(x)
    off = tone.ToneStack(tone.stack(0, 0, 0, False)).run(x)
    assert np.array_equal(flat, off), "a flat setting passes the signal exactly"


def test_dc_is_removed():
    x = np.full(int(2 * tone.FS), 3000, dtype=np.int64)
    y = tone.ToneStack(tone.stack(on=False)).run(x)
    assert abs(y[-1]) <= 1, y[-1]


def test_gateware_matches_model():
    rng = np.random.default_rng(7)
    # (the simulator steps every clock in Python: a few dozen samples, with every change in them)
    x = guitar(48 * 40, seed=3)[::40]
    x = np.concatenate([x, rng.integers(-32768, 32767, 12)])     # and some loud noise: saturation
    settings = [tone.stack(12, -9, 6), tone.stack(20, 15, 10), tone.stack(-20, -15, -10), tone.stack(on=False)]
    dut = ToneStack()
    got = []

    async def bench(ctx):
        async def write_bank(st):
            for k, sec in enumerate(st):
                for j, v in enumerate(sec):
                    ctx.set(dut.coef.index, k * 5 + j)
                    ctx.set(dut.coef.value, v)
                    ctx.set(dut.coef.en, 1)
                    await ctx.tick()
            ctx.set(dut.coef.en, 0)
            ctx.set(dut.swap, 1)
            await ctx.tick()
            ctx.set(dut.swap, 0)

        await write_bank(settings[0])
        model = tone.ToneStack(settings[0])
        want = []
        for i, v in enumerate(x.tolist()):
            if i in (15, 30, 50):
                # new coefficients: written into the bank not playing while it computes, swapped
                # in at the next sample's start
                st = settings[{15: 1, 30: 2, 50: 3}[i]]
                await write_bank(st)
                assert ctx.get(dut.swap_pending)
                model.sections = st
            ctx.set(dut.x, v)
            ctx.set(dut.start, 1)
            await ctx.tick()
            ctx.set(dut.start, 0)
            # (the swap is made with this sample)
            for _ in range(400):
                await ctx.tick()
                if ctx.get(dut.done):
                    break
            else:
                raise AssertionError("no output")
            assert not ctx.get(dut.swap_pending), "the swap is made as a sample starts"
            got.append(ctx.get(dut.y))
            want.append(model.sample(v))
            assert got[-1] == want[-1], (i, got[-1], want[-1])
            # idle a little between samples, as a real sample period would
            for _ in range(3):
                await ctx.tick()

    sim = Simulator(dut)
    sim.add_clock(1e-6)
    sim.add_testbench(bench)
    sim.run()
    assert len(got) == len(x)


if __name__ == "__main__":
    test_model_against_floating_point()
    test_flat_is_the_dc_blocker_alone()
    test_dc_is_removed()
    print("tone stack: the model is right", flush=True)
    if "--model" not in sys.argv:
        test_gateware_matches_model()
        print("tone stack: the gateware matches the model")
