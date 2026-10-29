"""The core with the PSRAM stream engine against the model, bit for bit.

Run from src/top/bfr: python -m pytest bfr/test_stream.py
The PSRAM is `sim.PsramModel` (latency, recovery, contention from other
masters). Frames start on the sample clock, so the engine's deadlines are
the real ones; 192 kHz keeps the runs short and the deadlines tight.
"""

import importlib

import pytest

from algorithms import TYPES
from model import isa
from model.compiler import compile_algorithm
from model.engine import Engine, check

from . import sim
from .test_core import noise_inputs


def short_lines(a):
    """PSRAM lines short enough for data to come back within a short run."""
    lfo = a.lfo(2000.0)
    line = a.delay("line")
    line.write(a.input(0))
    loop = a.delay("loop")
    fb = loop.tap(90) * 0.5 + a.input(1)
    loop.write(fb)
    a.output(0, line.tap(70) + line.tap(133) * 0.25)
    a.output(1, line.modtap(110, 6.5, lfo.sin, max_depth=8))
    a.output(2, fb)


def assert_stream_same(prog, inputs, changes=None, **kw):
    assert check(prog) == []
    stats = {}
    hw, model, cycles = sim.run(prog, inputs, changes, stream=True, stats=stats, **kw)
    first = next((i for i, (a, b) in enumerate(zip(hw, model)) if a != b), None)
    assert first is None, f"sample {first}: gateware {hw[first]} model {model[first]}"
    assert set(cycles) == {len(prog.instrs) + isa.PIPE_DEPTH - 1}
    assert not stats["late"], stats
    return hw, stats


def test_round_trip():
    prog = compile_algorithm(short_lines, 192000, "t")
    assert all(t.space == isa.SPACE_PSRAM for t in prog.taps)
    hw, stats = assert_stream_same(prog, noise_inputs(260, 5))
    assert any(o[0] for o in hw[80:]) and any(o[2] for o in hw[100:])
    assert stats["max_lag"] < prog.streams["burst"]


def faded_lines(a):
    """A crossfaded PSRAM tap (warm-up 2N) next to a fixed one."""
    d = a.param("d", 100, 70, 200, fade_ms=0.25)        # 48 samples at 192 kHz
    line = a.delay("line")
    line.write(a.input(0))
    a.output(0, line.tap(d) + line.tap(150) * 0.5)


def test_crossfade_warms_up_the_silent_side():
    prog = compile_algorithm(faded_lines, 192000, "t")
    assert prog.streams["warmup"] == [2 * prog.streams["burst"]]
    # Two changes: the second waits for the first fade, then fades back to side A.
    hw, stats = assert_stream_same(prog, noise_inputs(330, 6), {120: {"d": 180}, 140: {"d": 75}})
    assert stats["max_lag"] < prog.streams["burst"]


def test_clear_after_power_up_noise():
    prog = compile_algorithm(short_lines, 192000, "t")
    psram = sim.PsramModel(noise=True)
    assert_stream_same(prog, noise_inputs(150, 7), psram=psram, clear=True)
    ring = prog.mem_words[isa.SPACE_PSRAM]
    assert all(sim.RING_BASE + a in psram.mem for a in range(ring))


def test_contention():
    """Other masters hold the bus for up to 120 clocks before most bursts."""
    prog = compile_algorithm(short_lines, 192000, "t")
    psram = sim.PsramModel(contention=0.8, busy=(40, 120), gaps=0.2, seed=3)
    hw, stats = assert_stream_same(prog, noise_inputs(200, 8), psram=psram)
    assert stats["max_lag"] >= 1


def test_late_is_reported():
    """Bursts of 1000 clocks: 6 streams need 750 clocks of bus per 312-clock
    sample. (With 400 clocks the engine still keeps up.)"""
    prog = compile_algorithm(short_lines, 192000, "t")
    stats = {}
    sim.run(prog, noise_inputs(60, 9), stream=True, stats=stats,
            psram=sim.PsramModel(latency=1000))
    assert stats["late"] and stats["max_lag"] >= prog.streams["burst"]


def test_starved_scanner_resyncs():
    """A bus far too slow for the streams: instead of an ever-growing backlog
    the scanner jumps back to the present between samples. It trails by the
    resync distance (32 samples) plus however long the full request queue
    holds it up within a sample: here a 3000-clock burst is ten frames."""
    prog = compile_algorithm(short_lines, 192000, "t")
    stats = {}
    sim.run(prog, noise_inputs(300, 9), stream=True, stats=stats,
            psram=sim.PsramModel(latency=3000))
    assert stats["late"] and stats["resyncs"] >= 2, stats
    assert 32 <= stats["scan_lag"] <= 32 + 3 * 10, stats


def test_fed_scanner_keeps_up():
    """With a bus that keeps up, the scanner is never a sample behind."""
    prog = compile_algorithm(short_lines, 192000, "t")
    stats = {}
    sim.run(prog, noise_inputs(60, 9), stream=True, stats=stats)
    assert not stats["late"] and stats["resyncs"] == 0 and stats["scan_lag"] <= 1, stats


@pytest.mark.parametrize("name", ["fdn8", *TYPES])
def test_algorithm_streams(name):
    """Every stream of a real algorithm, at 48 kHz, with frames faster than the
    sample clock (400 clocks, or the program's length if more, so the bus is
    about three times as loaded). Spring and shimmer run long chains and a
    pitch shifter in the block-RAM space."""
    mod = importlib.import_module(f"algorithms.{name}")
    prog = compile_algorithm(mod.build, 48000, name)
    frame = max(400, prog.report["cycles"] + 20)
    assert_stream_same(prog, noise_inputs(100, 3), {10: {"mix": 1.0}}, frame_clocks=frame)


@pytest.mark.slow
def test_plate_crossfade_through_psram():
    """A plate size change: the silent side's 33 streams start, warm up (the
    modulated taps' windows take 209 samples), and the fade runs."""
    mod = importlib.import_module("algorithms.plate")
    prog = compile_algorithm(mod.build, 48000, "plate")
    inputs, changes = noise_inputs(300, 4), {5: {"mix": 1.0, "size": 0.7}}
    hw, stats = assert_stream_same(prog, inputs, changes, frame_clocks=300)
    assert stats["max_lag"] < prog.streams["burst"]
    eng = Engine(prog)
    eng.process(inputs[:5])
    for k, v in changes[5].items():
        eng.set_param(k, v)
    eng.process(inputs[5:])
    assert 0 < eng.fade_p[0] < isa.FADE_ONE         # the fade is running
