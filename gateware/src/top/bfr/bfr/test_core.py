"""The engine gateware against the model, bit for bit.

Run from src/top/bfr: python -m pytest bfr/test_core.py
(Amaranth's simulator runs at a few thousand clocks per second, so these runs
are short.)
"""

import importlib
import random

import pytest

from model import isa
from model.compiler import compile_algorithm
from model.engine import check
from model.lib import allpass, lowpass
from model.test_model import random_build

from . import sim


def noise_inputs(n, seed, amp=1 << 21):
    rnd = random.Random(seed)
    return [tuple(rnd.randint(-amp, amp) for _ in range(4)) for _ in range(n)]


def assert_same(prog, inputs, changes=None):
    assert check(prog) == []
    hw, model, cycles = sim.run(prog, inputs, changes)
    first = next((i for i, (a, b) in enumerate(zip(hw, model)) if a != b), None)
    assert first is None, f"sample {first}: gateware {hw[first]} model {model[first]}"
    assert set(cycles) == {len(prog.instrs) + isa.PIPE_DEPTH - 1}
    return hw


def test_delay_lowpass_allpass():
    def build(a):
        line = a.delay("line")
        line.write(a.input(0))
        y, _ = allpass(a, line.tap(70) * 0.5, 13, 0.6, "ap")       # a short (block RAM) line
        a.output(0, lowpass(a, y, 0.3, "lp"))
        a.output(1, y * a.input(1) + a.one * 0.125)                # signal product, constant
    assert_same(compile_algorithm(build, 48000, "t"), noise_inputs(120, 1))


def test_modulated_and_lfo():
    def build(a):
        lfo = a.lfo(3000.0, 0.25)
        line = a.delay("line")
        line.write(a.input(0))
        a.output(0, line.modtap(100, 7.5, lfo.sin, max_depth=8))
        a.output(1, lfo.tri * 0.5 + lfo.saw * 0.25 + a.noise * 0.125)
        a.output(2, lfo.cos)
    assert_same(compile_algorithm(build, 48000, "t"), noise_inputs(150, 2))


def test_large_modulation():
    """A 600-sample excursion (beyond the accumulator's +-256 range)."""
    def build(a):
        lfo = a.lfo(400.0)
        line = a.delay("line")
        line.write(a.input(0))
        a.output(0, line.modtap(700, 600.0, lfo.sin, max_depth=600))
    assert_same(compile_algorithm(build, 48000, "t"), noise_inputs(80, 4))


@pytest.mark.parametrize("name", ["plate", "fdn8"])
def test_algorithm_with_crossfade(name):
    mod = importlib.import_module(f"algorithms.{name}")
    prog = compile_algorithm(mod.build, 48000, name)
    # A size change at sample 40 (a 20 ms fade would take 960 samples; the
    # first part of it is enough to exercise both sides).
    assert_same(prog, noise_inputs(100, 3), {10: {"mix": 1.0}, 40: {"size": 0.7}})


@pytest.mark.parametrize("seed", range(12))
def test_random_programs(seed):
    prog = compile_algorithm(random_build(seed), 48000, f"random{seed}")
    assert_same(prog, noise_inputs(60, seed, amp=(1 << 23) - 1), {30: {"p": 0.9}})
