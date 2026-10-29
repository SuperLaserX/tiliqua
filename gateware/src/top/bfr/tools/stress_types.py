"""Look for parameter settings that make a type grow instead of decay.

    python tools/stress_types.py [--types carrier,crusher] [--seconds 12] [--trials 24]

For each type: its presets, then random corners of its parameters (each
at its minimum, maximum or default; the decay-like parameters, `decay`,
`ring`, `time`, at their maximum), each rendered from an impulse and noise
burst. A setting is reported when the output's last second is louder than
its loudest earlier second, or is not finite. A reverb that keeps growing
is unstable; `freeze` settings, meant to hold, are skipped.
"""

import argparse
import importlib
import math
import os
import random
import sys

import numpy as np

HERE = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, HERE)

from model.compiler import compile_set  # noqa: E402
from model.engine import Engine  # noqa: E402
from model.render import render  # noqa: E402

from algorithms import TYPES  # noqa: E402

LONG = ("decay", "ring", "time")
SILENT = 2.0 ** -23                     # under one LSB of the 24-bit output


def growth(prog, values, fs, seconds):
    """The last second's level against the loudest earlier one, in dB."""
    eng = Engine(prog, io_bits=24)
    for k, v in values.items():
        eng.set_param(k, v)
    render(eng, np.zeros((int(0.2 * fs), 2)), progress=False)
    x = np.zeros((int(seconds * fs), 2))
    rng = np.random.default_rng(1)
    x[: fs // 10] = rng.uniform(-0.5, 0.5, (fs // 10, 2))
    y = render(eng, x, progress=False)
    if not np.all(np.isfinite(y)):
        return math.inf
    secs = [np.sqrt(np.mean(y[i:i + fs] ** 2)) for i in range(0, len(y) - fs + 1, fs)]
    if secs[-1] < SILENT:
        return -math.inf                # died away completely (a gate shut, say)
    return 20 * math.log10(secs[-1] / max(max(secs[1:-1]), SILENT))


def corners(prog, trials, seed):
    rnd = random.Random(seed)
    for _ in range(trials):
        values = {"mix": 1.0}
        for d in prog.params:
            if d.name == "mix":
                continue
            if d.name in LONG:
                values[d.name] = d.hi
            else:
                values[d.name] = rnd.choice((d.lo, d.hi, d.default))
        yield values


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--types", default=",".join(TYPES))
    ap.add_argument("--seconds", type=float, default=12.0)
    ap.add_argument("--trials", type=int, default=24)
    ap.add_argument("--seed", type=int, default=0)
    ap.add_argument("--fs", type=int, default=48000)
    args = ap.parse_args()
    fs = args.fs
    names = args.types.split(",")
    progs, _ = compile_set([importlib.import_module(f"algorithms.{n}") for n in names], fs)
    bad = 0
    for prog in progs:
        settings = [(name, dict(v, mix=1.0)) for name, v in prog.presets]
        settings += [(f"corner{i}", v) for i, v in enumerate(corners(prog, args.trials, args.seed))]
        worst = -math.inf
        for name, values in settings:
            if values.get("freeze", 0.0) >= 0.5:
                continue
            g = growth(prog, values, fs, args.seconds)
            worst = max(worst, g)
            if g > -1.0:
                bad += 1
                shown = {k: round(v, 3) for k, v in values.items()}
                print(f"  {prog.name} {name}: GROWS {g:+.1f} dB  {shown}", flush=True)
        print(f"{prog.name}: worst last-second {worst:+.1f} dB over {len(settings)} settings",
              flush=True)
    print(f"{bad} growing settings")
    sys.exit(1 if bad else 0)


if __name__ == "__main__":
    main()
