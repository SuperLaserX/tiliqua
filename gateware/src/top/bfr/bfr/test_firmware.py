"""The firmware's CPU side (the `bfr-cpu` crate) against the Python model.

For each program, `model/rustgen.py` generates the crate's program tables,
this file writes vectors (math reference values, table encodings, and a
session of parameter changes with the model's table state after each step),
and `cargo test` replays them in Rust (cpu/tests/model.rs). Needs cargo on
the host.

Run from src/top/bfr: python -m pytest bfr/test_firmware.py
"""

import importlib
import math
import os
import random
import shutil
import struct
import subprocess

import pytest

from algorithms import TYPES
from model import isa, rustgen
from model.compiler import compile_algorithm, compile_set
from model.engine import Engine, fade_step
from model.test_model import random_build

from .core import encode_rtap, encode_wtap
from .stream import encode_stab
from .test_stream import faded_lines

CPU = os.path.join(os.path.dirname(os.path.dirname(os.path.abspath(__file__))), "cpu")

pytestmark = pytest.mark.skipif(shutil.which("cargo") is None, reason="needs cargo")


def bits(x):
    return f"{struct.unpack('<Q', struct.pack('<d', x))[0]:#x}"


def math_vectors(rnd, n=400):
    lines = []
    for _ in range(n):
        x = rnd.uniform(-60, 60)
        lines.append(f"math exp {bits(x)} 0x0 {bits(math.exp(x))}")
        x = 10 ** rnd.uniform(-12, 12)
        lines.append(f"math log {bits(x)} 0x0 {bits(math.log(x))}")
        x, y = 10 ** rnd.uniform(-3, 3), rnd.uniform(-6, 6)
        lines.append(f"math pow {bits(x)} {bits(y)} {bits(x ** y)}")
        x = 10 ** rnd.uniform(-8, 8)
        lines.append(f"math sqrt {bits(x)} 0x0 {bits(math.sqrt(x))}")
        x = rnd.uniform(-12, 12)
        for fn in ("sin", "cos", "tan"):
            lines.append(f"math {fn} {bits(x)} 0x0 {bits(getattr(math, fn)(x))}")
        x = rnd.uniform(-1e6, 1e6)
        lines.append(f"math floor {bits(x)} 0x0 {bits(float(math.floor(x)))}")
    return lines


def session(prog, rnd, steps=300):
    """Random menu changes, time passing and CPU polls, with the model's
    table state after each step."""
    eng = Engine(prog)
    streams = prog.streams["taps"]
    n_fades = len(prog.fades)
    lines = ["init"]
    # The firmware rewrites stream enables only when it sets a parameter or
    # services the fades, with the fade positions it read at its last service.
    seen_fp = [0] * isa.N_FADE

    def enabled(i):
        t = prog.taps[i]
        if t.group < 0 or t.side == eng._active(t.group) or t.side == eng.warm_side[t.group]:
            return True
        return seen_fp[t.group] != (isa.FADE_ONE if t.side == 0 else 0)

    def update_stab():
        return [encode_stab(prog.taps[i], eng.offsets[i] % (1 << 22), enabled(i)) for i in streams]
    stab = update_stab()

    def state():
        lines.append("state " + " ; ".join([
            " ".join(map(str, eng.coef_bits)), " ".join(map(str, eng.offsets)),
            " ".join(map(str, stab)), " ".join(map(str, eng.lfo_inc)),
            " ".join(map(str, eng.fade_target[:n_fades]))]))
    state()
    for _ in range(steps):
        r = rnd.random()
        if r < 0.45:
            i = rnd.randrange(len(prog.params))
            d = prog.params[i]
            v = rustgen.grid_value(d, rnd.randint(0, rustgen.grid(d)[1]))
            if d.fade_ms > 0:
                seen_fp = list(eng.fade_p)
            eng.set_param(d.name, v)
            stab = update_stab()
            lines.append(f"set {i} {bits(v)}")
        elif r < 0.8:
            n = rnd.choice([1, 7, 32, 100, 400])
            for _ in range(n):
                for g in range(n_fades):
                    eng.fade_p[g] = fade_step(eng.fade_p[g], eng.fade_target[g], eng.fade_rate[g])
            eng.samples += n
            lines.append(f"advance {eng.samples} " + " ".join(map(str, eng.fade_p[:n_fades])))
        else:
            seen_fp = list(eng.fade_p)
            eng._service_fades()
            stab = update_stab()
            lines.append("service")
        state()
    return lines


def encodings(prog):
    lines = []
    for i, t in enumerate(prog.taps):
        if t.kind == isa.TAP_WRITE:
            lines.append(f"wtap {i} {encode_wtap(t):#x}")
        else:
            lines.append(f"rtap {i} {encode_rtap(t):#x}")
    return lines


def run_cargo(prog, lines, tmp_path):
    """`prog` is a program or the list a bitstream carries."""
    prog_rs, _ = rustgen.write(prog, str(tmp_path))
    vec = tmp_path / "vectors.txt"
    vec.write_text("\n".join(lines) + "\n")
    env = dict(os.environ, BFR_PROGRAM=prog_rs, BFR_VECTORS=str(vec),
               CARGO_TARGET_DIR=os.path.join(CPU, "target", "host-test"))
    r = subprocess.run(["cargo", "test", "--release", "--test", "model", "--", "--nocapture"],
                       cwd=CPU, env=env, capture_output=True, text=True)
    print(r.stdout[-3000:], r.stderr[-3000:])
    assert r.returncode == 0
    return r.stdout


@pytest.mark.parametrize("name", ["plate", "fdn8"])
def test_algorithm(name, tmp_path):
    mod = importlib.import_module(f"algorithms.{name}")
    prog = compile_algorithm(mod.build, 48000, name)
    rnd = random.Random(1)
    out = run_cargo(prog, math_vectors(rnd) + encodings(prog) + session(prog, rnd), tmp_path)
    assert "states 301" in out


def test_type_switch(tmp_path):
    """Every type in one build: each loaded whole by `Control::load` (as a
    type switch from the menu does), then its own session; then two again."""
    names = (*TYPES, "fdn8")
    progs, _ = compile_set([importlib.import_module(f"algorithms.{n}") for n in names], 48000)
    rnd = random.Random(4)
    lines = []
    order = list(range(len(progs))) + [0, 3]
    for k in order:
        lines += [f"program {k}"] + encodings(progs[k]) + session(progs[k], rnd, 40)
    out = run_cargo(progs, lines, tmp_path)
    assert f"states {41 * len(order)}" in out


def test_crossfade_program(tmp_path):
    prog = compile_algorithm(faded_lines, 192000, "t")
    rnd = random.Random(2)
    run_cargo(prog, encodings(prog) + session(prog, rnd, 400), tmp_path)


@pytest.mark.parametrize("seed", range(3))
def test_random_program(seed, tmp_path):
    prog = compile_algorithm(random_build(seed), 48000, f"random{seed}")
    rnd = random.Random(seed)
    run_cargo(prog, encodings(prog) + session(prog, rnd, 150), tmp_path)
