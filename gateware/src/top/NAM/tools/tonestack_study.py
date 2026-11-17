"""How well the plugin's tone stack and DC blocker would run in the engine's program: direct-form
biquads with 18-bit coefficients, exact 40-bit accumulation, and history stored at 18 bits (the
engine's rings), against the same filters in floating point, on A2-Full's output for a synthetic
guitar. Prints the error-to-signal ratio of each setting, and the idle noise.

    python src/top/NAM/tools/tonestack_study.py src/top/NAM
"""
import math
import sys
from pathlib import Path

import numpy as np

NAM = Path(sys.argv[1])
sys.path.insert(0, str(NAM))
from model import a2  # noqa: E402

FS = 48000.0


def pluck(f0, dur, fs=FS, seed=0):
    """Karplus-Strong string."""
    rng = np.random.default_rng(seed)
    n = int(dur * fs)
    p = int(round(fs / f0))
    buf = rng.uniform(-1, 1, p)
    out = np.zeros(n)
    for i in range(n):
        out[i] = buf[i % p]
        buf[i % p] = 0.996 * 0.5 * (buf[i % p] + buf[(i + 1) % p])
    return out


def guitar():
    x = np.zeros(int(4.0 * FS))
    for t, f, s in [(0.05, 82.41, 1), (0.8, 110.0, 2), (1.6, 146.8, 3), (2.4, 82.41, 4), (2.4, 123.5, 5), (2.4, 164.8, 6)]:
        note = pluck(f, 1.5, seed=s)
        i = int(t * FS)
        x[i:i + len(note)] += note[: len(x) - i]
    return 0.1 * x / np.abs(x).max()   # -20 dBFS peaks


def rbj(kind, f0, q, gain_db, fs=FS):
    a = 10 ** (gain_db / 40)
    w0 = 2 * math.pi * f0 / fs
    alpha = math.sin(w0) / (2 * q)
    c = math.cos(w0)
    if kind == "peak":
        b = [1 + alpha * a, -2 * c, 1 - alpha * a]
        aa = [1 + alpha / a, -2 * c, 1 - alpha / a]
    elif kind == "lowshelf":
        sq = 2 * math.sqrt(a) * alpha
        b = [a * ((a + 1) - (a - 1) * c + sq), 2 * a * ((a - 1) - (a + 1) * c), a * ((a + 1) - (a - 1) * c - sq)]
        aa = [(a + 1) + (a - 1) * c + sq, -2 * ((a - 1) + (a + 1) * c), (a + 1) + (a - 1) * c - sq]
    elif kind == "highshelf":
        sq = 2 * math.sqrt(a) * alpha
        b = [a * ((a + 1) + (a - 1) * c + sq), -2 * a * ((a - 1) + (a + 1) * c), a * ((a + 1) + (a - 1) * c - sq)]
        aa = [(a + 1) - (a - 1) * c + sq, 2 * ((a - 1) - (a + 1) * c), (a + 1) - (a - 1) * c - sq]
    elif kind == "highpass1":   # first-order high pass (the DC blocker)
        k = math.tan(w0 / 2)
        b = [1 / (1 + k), -1 / (1 + k), 0.0]
        aa = [1.0, (k - 1) / (k + 1), 0.0]
    b = np.array(b) / aa[0]
    aa = np.array(aa) / aa[0]
    return b, aa


def tone_stack(bass, mid, treble):
    """The plugin's: knobs 0..10, 5 flat."""
    bg, mg, tg = 4.0 * (bass - 5), 3.0 * (mid - 5), 2.0 * (treble - 5)
    return [rbj("lowshelf", 150.0, 0.707, bg), rbj("peak", 425.0, 1.5 if mg < 0 else 0.7, mg),
            rbj("highshelf", 1800.0, 0.707, tg)]


def run_float(x, stages):
    for b, a in stages:
        y = np.zeros_like(x)
        x1 = x2 = y1 = y2 = 0.0
        for i, v in enumerate(x):
            o = b[0] * v + b[1] * x1 + b[2] * x2 - a[1] * y1 - a[2] * y2
            x2, x1, y2, y1 = x1, v, y1, o
            y[i] = o
        x = y
    return x


def qexp(m):
    f = 17 - math.frexp(m)[1]
    while round(m * 2 ** f) > 131071:
        f -= 1
    while round(m * 2 ** (f + 1)) <= 131071:
        f += 1
    return f


def run_fixed(x, stages, fmt_in, fmts, hist_bits=18):
    """Each stage: coefficients at one 18-bit exponent, the products summed exactly, the result
    rounded half up and saturated into `hist_bits` at the stage's format, which is also how its
    history is kept (the engine's rings)."""
    lim = 2 ** (hist_bits - 1)
    q_in = np.clip(np.floor(x * 2 ** fmt_in + 0.5), -2 ** 17, 2 ** 17 - 1).astype(np.int64)
    f_in = fmt_in
    for (b, a), f_out in zip(stages, fmts):
        coefs = np.array([b[0], b[1], b[2], -a[1], -a[2]])
        fc = qexp(np.abs(coefs).max())
        cq = [int(math.floor(c * 2 ** fc + 0.5)) for c in coefs]
        shift = fc + f_in - f_out
        y = np.zeros_like(q_in)
        x1 = x2 = y1 = y2 = 0
        for i, v in enumerate(q_in.tolist()):
            acc = cq[0] * v + cq[1] * x1 + cq[2] * x2
            acc_y = cq[3] * y1 + cq[4] * y2
            # (x history in the input's format, y's in the output's: bring y's products to x's)
            total = acc + (acc_y << (f_in - f_out)) if f_in >= f_out else (acc << (f_out - f_in)) + acc_y
            s = shift if f_in >= f_out else fc
            o = (total + (1 << (s - 1))) >> s
            o = max(-lim, min(lim - 1, o))
            x2, x1, y2, y1 = x1, v, y1, o
            y[i] = o
        q_in, f_in = y, f_out
    return q_in.astype(np.float64) / 2 ** f_in


def esr(ref, got):
    return 10 * math.log10(np.sum((ref - got) ** 2) / np.sum(ref ** 2))


def main():
    w = a2.load_nam(NAM / "NeuralAmpModelerCore" / "example_models" / "A2.nam")
    full = max(w, key=lambda n: n.channels)
    x = guitar()
    amp = a2.run_float(full, x)
    amp = 0.5 * amp / np.abs(amp).max()     # the amp's output at -6 dBFS peaks
    print(f"amp output: peak {np.abs(amp).max():.3f}, rms {20 * math.log10(np.sqrt(np.mean(amp ** 2))):.1f} dBFS")
    for name, knobs in [("flat", (5, 5, 5)), ("bass +20", (10, 5, 5)), ("bass -20", (0, 5, 5)),
                        ("mid +15", (5, 10, 5)), ("mid -15", (5, 0, 5)), ("treble +10", (5, 5, 10)),
                        ("all up", (10, 10, 10)), ("scooped", (8, 2, 8))]:
        st = tone_stack(*knobs)
        ref = run_float(amp, st)
        # formats: input +-2 (Q16), each stage +-2 * its largest gain
        gains = [max(1.0, 10 ** (4.0 * (knobs[0] - 5) / 20)), max(1.0, 10 ** (3.0 * (knobs[1] - 5) / 20)),
                 max(1.0, 10 ** (2.0 * (knobs[2] - 5) / 20))]
        fmts, g = [], 1.0
        for gi in gains:
            g *= gi
            fmts.append(qexp(2.0 * g) - 1)
        got = run_fixed(amp, st, 16, fmts)
        idle = run_fixed(np.zeros(48000), st, 16, fmts)
        print(f"{name:11s} formats {fmts}: ESR {esr(ref, got):6.1f} dB, idle peak {np.abs(idle).max():.2e}")
    dc = [rbj("highpass1", 5.0, 0.707, 0.0)]
    ref = run_float(amp + 0.01, dc)
    got = run_fixed(amp + 0.01, dc, 16, [16])
    print(f"DC blocker 5 Hz: ESR {esr(ref, got):6.1f} dB")


main()
