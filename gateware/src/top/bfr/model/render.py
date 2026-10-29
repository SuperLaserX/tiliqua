"""Compile an algorithm, report its resources, and render audio through the model.

Run from src/top/bfr:

    python -m model.render plate --report --fs 48000,96000,192000
    python -m model.render plate --list
    python -m model.render plate --impulse 4 --out plate-ir.wav
    python -m model.render plate --in dry.wav --tail 3 --out wet.wav --param decay=0.7

ALGORITHM is a module in algorithms/ (`plate`) or a path to a .py file that
defines `build(a)`. Inputs 0 and 1 get the left and right channel of the WAV
file (a mono file feeds both); outputs 0 and 1 are written.
"""

import argparse
import importlib
import importlib.util
import math
import os
import sys
import time

import numpy as np

from . import isa
from .compiler import CompileError, compile_algorithm
from .engine import Engine, check


def load(name):
    if name.endswith(".py") or "/" in name or os.sep in name:
        spec = importlib.util.spec_from_file_location(
            os.path.splitext(os.path.basename(name))[0], name)
        mod = importlib.util.module_from_spec(spec)
        spec.loader.exec_module(mod)
        return mod
    return importlib.import_module(f"algorithms.{name}")


def print_report(progs):
    rows = [
        ("instructions", lambda r: f"{r['instructions']} ({r['nops']} nop)"),
        ("clocks / budget", lambda r: f"{r['cycles']}/{r['budget']}{'' if r['fits'] else ' OVER'}"),
        ("accumulators", lambda r: f"{r['accs_peak']}/{isa.N_ACC}"),
        ("registers", lambda r: "{state}+{modulation}+{temporary_peak}".format(**r["regs"])),
        ("coefficients", lambda r: f"{r['coefs']}/{isa.N_COEF}"),
        ("taps", lambda r: f"{r['taps']}/{isa.N_TAP}"),
        ("PSRAM streams r/w/mod", lambda r: "{read_streams}/{write_streams}/{modulated}".format(**r["psram"])),
        ("PSRAM traffic", lambda r: "{mb_per_s:.1f} MB/s, bus {bus_load:.0%}".format(**r["psram"])),
        ("  while crossfading", lambda r: "+{fade_streams}, {mb_per_s_fading:.1f} MB/s, bus {bus_load_fading:.0%}".format(**r["psram"])),
        ("PSRAM delay", lambda r: f"{r['psram']['words']} w, {r['psram']['seconds']:.2f} s"),
        ("block RAM", lambda r: "{blocks} EBR ({delay_words}+{rbuf_words}+{wbuf_words} w)".format(**r["ebr"])),
    ]
    head = f"{progs[0].name:<24}" + "".join(f"{p.fs / 1000:>24g} kHz" for p in progs)
    print(head)
    for label, fmt in rows:
        print(f"{label:<24}" + "".join(f"{fmt(p.report):>28}" for p in progs))
    print("registers are state+modulation+temporaries; block RAM is delay pool + stream read "
          f"+ write buffers; bus is the PSRAM bus time of {progs[0].report['psram']['burst']}-word "
          "bursts")


def print_listing(prog):
    for i, (ins, note) in enumerate(zip(prog.instrs, prog.listing)):
        print(f"{i:4}  {ins.encode():010x}  {ins.text(prog.taps):<52} {note}")
    print("\ntaps:")
    names = ("psram", "ebr")
    kinds = ("read", "write", "mod")
    for i, t in enumerate(prog.taps):
        extra = f" depth {t.depth} reg {isa.reg_name(t.mreg)}" if t.kind == isa.TAP_MOD else ""
        if t.stream >= 0:
            extra += f" stream {t.stream} buf {t.buf}+{t.bmask + 1}"
        print(f"  T{i:<3} {names[t.space]:<5} {kinds[t.kind]:<5} offset {t.offset:>8}{extra}  {t.label}")
    print("\ncoefficients (defaults):")
    exprs = {i: p for i, p, _ in prog.coef_exprs}
    from .fp import bits_to_float
    for i, bits in enumerate(prog.coefs):
        print(f"  C{i:<3} {bits_to_float(bits):<14.8g} {exprs.get(i, '')}")
    print("\nparameters:")
    for d in prog.params:
        print(f"  {d.name:<12} {d.default:g} [{d.lo:g}, {d.hi:g}] {d.unit} {d.curve}")


def read_wav(path, fs):
    from scipy.io import wavfile
    from scipy.signal import resample_poly
    rate, data = wavfile.read(path)
    if data.dtype.kind == "i":
        data = data / float(np.iinfo(data.dtype).max + 1)
    elif data.dtype.kind == "u":
        data = (data.astype(np.float64) - 128) / 128.0
    data = np.asarray(data, dtype=np.float64)
    if data.ndim == 1:
        data = np.stack([data, data], axis=1)
    data = data[:, :2]
    if rate != fs:
        g = math.gcd(rate, fs)
        data = resample_poly(data, fs // g, rate // g, axis=0)
    return data


def demo_signal(fs, seconds):
    """Four plucked notes and a noise burst in the first 2.4 s, then silence."""
    n = int(seconds * fs)
    x = np.zeros((n, 2))
    t = np.arange(int(0.6 * fs)) / fs
    for start, f in ((0.0, 220.0), (0.5, 277.18), (1.0, 329.63), (1.5, 440.0)):
        tone = sum(np.sin(2 * np.pi * f * h * t) / h for h in (1, 2, 3, 4)) * np.exp(-6.0 * t) * 0.25
        i = int(start * fs)
        seg = tone[:max(0, n - i)]
        x[i:i + len(seg)] += seg[:, None]
    i, m = int(2.2 * fs), int(0.15 * fs)
    burst = np.random.default_rng(1).standard_normal(m) * np.exp(-30.0 * np.arange(m) / fs) * 0.3
    seg = burst[:max(0, n - i)]
    x[i:i + len(seg)] += seg[:, None]
    return x


SWEEP_PERIOD = 0.02        # seconds between parameter updates in a sweep (a UI's knob rate)


def parse_sweep(text):
    """NAME=FROM:TO[@START:END] -> (name, from, to, start s, end s or None)."""
    name, _, spec = text.partition("=")
    values, _, times = spec.partition("@")
    lo, hi = (float(v) for v in values.split(":"))
    start, end = (float(v) for v in times.split(":")) if times else (0.0, None)
    return name, lo, hi, start, end


def render(engine, x, chunk=None, progress=True, sweeps=()):
    """x: (n, channels) floats in [-1, 1] for inputs 0.. -> (n, 4) floats.

    sweeps: parse_sweep() tuples, applied every SWEEP_PERIOD.
    """
    W = engine.io_bits
    full = (1 << (W - 1))
    q = np.clip(np.round(x * full), -full, full - 1).astype(np.int64)
    n = len(q)
    fs = engine.prog.fs
    inputs = [tuple(int(v) for v in row) + (0,) * (isa.N_IN - q.shape[1]) for row in q]
    chunk = chunk or (int(SWEEP_PERIOD * fs) if sweeps else fs // 2)
    out = []
    t0 = time.perf_counter()
    for i in range(0, n, chunk):
        for name, lo, hi, start, end in sweeps:
            end = n / fs if end is None else end
            t = min(max((i / fs - start) / max(end - start, 1e-9), 0.0), 1.0)
            engine.set_param(name, lo + (hi - lo) * t)
        out += engine.process(inputs[i:i + chunk])
        if progress:
            done = min(i + chunk, n)
            el = time.perf_counter() - t0
            print(f"\r  {done / engine.prog.fs:6.2f} s rendered, {el:6.1f} s elapsed", end="", file=sys.stderr)
    if progress:
        print(file=sys.stderr)
    return np.asarray(out, dtype=np.float64) / full


def rt60(ir, fs):
    """Decay time from the Schroeder integral of an impulse response (T30 x 2)."""
    e = np.cumsum((ir ** 2)[::-1])[::-1]
    if e[0] <= 0:
        return None
    db = 10 * np.log10(np.maximum(e / e[0], 1e-30))
    try:
        i5 = np.argmax(db <= -5)
        i35 = np.argmax(db <= -35)
    except ValueError:
        return None
    if db[i35] > -35 or i35 <= i5:
        return None
    slope = (db[i35] - db[i5]) / ((i35 - i5) / fs)
    return -60.0 / slope


def main(argv=None):
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("algorithm")
    ap.add_argument("--fs", default="48000", help="sample rate(s), comma separated for --report")
    ap.add_argument("--report", action="store_true", help="print resource use")
    ap.add_argument("--list", action="store_true", help="print the program listing and tables")
    ap.add_argument("--param", action="append", default=[], metavar="NAME=VALUE")
    ap.add_argument("--sweep", action="append", default=[], metavar="NAME=FROM:TO[@START:END]",
                    help="move a parameter linearly (seconds; default the whole render), "
                         f"updated every {SWEEP_PERIOD * 1000:g} ms like a knob")
    ap.add_argument("--no-fade", action="store_true",
                    help="parameter-driven taps jump instead of crossfading (for comparison)")
    ap.add_argument("--impulse", type=float, metavar="SECONDS", help="render the impulse response")
    ap.add_argument("--in", dest="inp", metavar="WAV", help="input file")
    ap.add_argument("--demo", type=float, metavar="SECONDS",
                    help="render a built-in test signal (plucks and a noise burst)")
    ap.add_argument("--tail", type=float, default=2.0, metavar="SECONDS", help="silence after the input")
    ap.add_argument("--gain", type=float, default=1.0, help="input gain")
    ap.add_argument("--io-bits", type=int, default=24, help="CODEC sample width")
    ap.add_argument("--burst", type=int, default=isa.STREAM_BURST, help="stream engine burst (words)")
    ap.add_argument("--rbuf", type=int, default=isa.RBUF_WORDS, help="stream read buffer (words)")
    ap.add_argument("--channels", type=int, default=2, choices=(2, 4), help="outputs to write")
    ap.add_argument("--out", metavar="WAV", help="output file (32-bit float)")
    args = ap.parse_args(argv)

    mod = load(args.algorithm)
    name = getattr(mod, "NAME", args.algorithm)
    rates = [int(float(f)) for f in args.fs.split(",")]
    try:
        progs = [compile_algorithm(mod.build, fs, name, crossfade=not args.no_fade,
                                   burst=args.burst, rbuf_words=args.rbuf) for fs in rates]
    except CompileError as e:
        sys.exit(f"compile error: {e}")
    for p in progs:
        problems = check(p)
        if problems:
            print(f"{p.name} @ {p.fs}: {len(problems)} problems", *problems[:20], sep="\n  ", file=sys.stderr)
    rendering = args.impulse or args.inp or args.demo
    if args.report or not (args.list or rendering):
        print_report(progs)
    if args.list:
        print_listing(progs[0])
    if not rendering:
        return
    if len(progs) != 1:
        sys.exit("rendering needs a single --fs")
    prog = progs[0]
    eng = Engine(prog, io_bits=args.io_bits)
    for kv in args.param:
        k, _, v = kv.partition("=")
        if k not in eng.params:
            sys.exit(f"unknown parameter {k!r}; have: {', '.join(eng.params)}")
        eng.set_param(k, float(v))
    sweeps = [parse_sweep(s) for s in args.sweep]
    for s in sweeps:
        if s[0] not in eng.params:
            sys.exit(f"unknown parameter {s[0]!r}; have: {', '.join(eng.params)}")
    fs = prog.fs
    if args.impulse:
        x = np.zeros((int(args.impulse * fs), 2))
        x[0, :] = 0.5
        x *= args.gain
    elif args.demo:
        x = demo_signal(fs, args.demo) * args.gain
    else:
        x = read_wav(args.inp, fs) * args.gain
        x = np.concatenate([x, np.zeros((int(args.tail * fs), x.shape[1]))])
    t0 = time.perf_counter()
    y = render(eng, x, sweeps=sweeps)
    el = time.perf_counter() - t0
    print(f"rendered {len(x) / fs:.2f} s in {el:.1f} s ({len(x) / fs / el:.2f}x real time)")
    peak = np.max(np.abs(y[:, :2]))
    print(f"output peak {20 * math.log10(max(peak, 1e-12)):.1f} dBFS")
    if args.impulse:
        settings = {k: eng.params[k] for k in eng.params}
        for ch in range(2):
            ir = y[:, ch] - (1 - settings.get("mix", 1.0)) * x[:, ch] if "mix" in settings else y[:, ch]
            t = rt60(ir, fs)
            print(f"out{ch}: RT60 {t:.2f} s" if t else f"out{ch}: RT60 not measurable in this length")
    if args.out:
        from scipy.io import wavfile
        os.makedirs(os.path.dirname(os.path.abspath(args.out)), exist_ok=True)
        wavfile.write(args.out, fs, y[:, :args.channels].astype(np.float32))
        print(f"wrote {args.out}")


if __name__ == "__main__":
    main()
