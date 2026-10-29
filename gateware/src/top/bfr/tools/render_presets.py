"""Render every preset of every reverb type through the model, to listen to
and to check before flashing.

    python tools/render_presets.py [OUT_DIR] [--types plate,spring] [--presets Extreme]
                                   [--seconds 6]

For each type and preset (and the type's defaults) it writes
<type>-<preset>-ir.wav (the impulse response) and <type>-<preset>-demo.wav
(the built-in demo signal through it), and prints the output peak, the
decay time measured from the impulse response, the level of its last
second against its first, flagged if louder than its loudest earlier second
(a reverb that keeps growing is unstable), and for
shimmer the spectral centroid over time (it should climb).
"""

import argparse
import importlib
import math
import os
import sys

import numpy as np

HERE = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, HERE)

from model.compiler import compile_set  # noqa: E402
from model.engine import Engine  # noqa: E402
from model.render import demo_signal, render, rt60  # noqa: E402

from algorithms import TYPES  # noqa: E402


def settled(prog, values, fs):
    """An engine with `values` set, after its crossfades and warm-up."""
    eng = Engine(prog, io_bits=24)
    for k, v in values.items():
        eng.set_param(k, v)
    render(eng, np.zeros((int(0.2 * fs), 2)), progress=False)
    return eng


def db(x):
    return 20 * math.log10(max(x, 1e-12))


def centroids(y, fs, step_s=0.5):
    out = []
    n = int(step_s * fs)
    freqs = np.fft.rfftfreq(n, 1 / fs)
    for i in range(0, len(y) - n, n):
        s = np.abs(np.fft.rfft(y[i:i + n] * np.hanning(n)))
        out.append(float((s * freqs).sum() / max(s.sum(), 1e-12)))
    return out


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("out", nargs="?", default=os.path.join(HERE, "..", "..", "..", "build", "bfr-types"))
    ap.add_argument("--types", default=",".join(TYPES))
    ap.add_argument("--presets", default="",
                    help="Comma-separated preset names to render (default: all, and the defaults).")
    ap.add_argument("--seconds", type=float, default=6.0)
    ap.add_argument("--fs", type=int, default=48000)
    args = ap.parse_args()
    from scipy.io import wavfile
    os.makedirs(args.out, exist_ok=True)
    fs = args.fs
    names = args.types.split(",")
    progs, _ = compile_set([importlib.import_module(f"algorithms.{n}") for n in names], fs)
    demo = demo_signal(fs, 4.0)
    for prog in progs:
        print(f"== {prog.title}: {prog.description}")
        only = {p.strip().lower() for p in args.presets.split(",") if p.strip()}
        for preset, values in [("default", {})] + list(prog.presets):
            if only and preset.lower() not in only:
                continue
            tag = f"{prog.name}-{preset.lower().replace(' ', '-')}"
            wet = dict(values, mix=1.0)
            eng = settled(prog, wet, fs)
            x = np.zeros((int(args.seconds * fs), 2))
            x[0, :] = 0.5
            ir = render(eng, x, progress=False)[:, :2]
            t = rt60(ir[:, 0], fs)
            first = np.sqrt(np.mean(ir[: fs, :] ** 2))
            last = np.sqrt(np.mean(ir[-fs:, :] ** 2))
            line = (f"  {preset:14} IR peak {db(np.max(np.abs(ir))):6.1f} dBFS  "
                    f"RT60 {t:5.2f} s  " if t else f"  {preset:14} IR peak {db(np.max(np.abs(ir))):6.1f} dBFS  RT60   -    ")
            line += f"last/first second {db(last) - db(first):6.1f} dB"
            loudest = max(np.sqrt(np.mean(ir[i:i + fs, :] ** 2)) for i in range(0, len(ir) - 2 * fs, fs))
            if last > loudest * 1.05 and values.get("freeze", 0.0) < 0.5:
                line += "  GROWING"
            if prog.name == "shimmer":
                c = centroids(ir[:, 0], fs)
                line += "  centroid " + " ".join(f"{v:.0f}" for v in c[:8])
            print(line)
            wavfile.write(os.path.join(args.out, f"{tag}-ir.wav"), fs, ir.astype(np.float32))
            eng = settled(prog, values, fs)
            y = render(eng, np.concatenate([demo, np.zeros((2 * fs, 2))]), progress=False)[:, :2]
            wavfile.write(os.path.join(args.out, f"{tag}-demo.wav"), fs, y.astype(np.float32))
            print(f"  {'':14} demo peak {db(np.max(np.abs(y))):6.1f} dBFS")
    print(f"wrote {os.path.abspath(args.out)}")


if __name__ == "__main__":
    main()
