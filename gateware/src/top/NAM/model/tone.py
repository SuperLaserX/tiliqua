"""The tone stack and DC blocker, bit-exact: what `nam/tone.py` computes.

The plugin's, after the amp: a low shelf at 150 Hz (bass, ±20 dB), a peak at 425 Hz (middle,
±15 dB, Q 0.7 boosting and 1.5 cutting) and a high shelf at 1800 Hz (treble, ±10 dB), RBJ
cookbook biquads with Q as the quality; then a first-order high pass at 5 Hz for DC.

In the engine's program these don't work (`tools/tonestack_study.py`: at 150 Hz the feedback
multiplies the rounding of 18-bit history by thousands), so they run in gateware with wide words:
coefficients of 27 bits, Q3.23 (18 bits put the bass shelf up to 2 dB off; Q2.24 kept every setting
within 0.003 dB and Q3.23, the range the treble shelf needs, within about 0.006 dB), and signals of 32 bits, Q4.27 (±16: four bits over the 16-bit sample, room for
+20 dB of bass). Each section is direct form I:

    acc = b0 x + b1 x1 + b2 x2 + (-a1) y1 + (-a2) y2       (exact)
    y   = round(acc / 2^23), saturated to 32 bits

the sections in cascade sharing their histories (a section's output history is the next one's
input history). The 16-bit sample goes in at << 12 and comes out rounded and saturated.
"""

import math

import numpy as np

FS = 48000.0
COEF_BITS = 27
COEF_FRAC = 23
STATE_BITS = 32
STATE_FRAC = 27
IN_SHIFT = STATE_FRAC - 15
SECTIONS = 4
TAPS = 5

BASS_DB = (-20, 20)
MIDDLE_DB = (-15, 15)
TREBLE_DB = (-10, 10)
DC_HZ = 5.0


def rbj(kind, f0, q, gain_db, fs=FS):
    """(b0, b1, b2, a1, a2), normalised by a0."""
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
    elif kind == "highpass1":
        k = math.tan(w0 / 2)
        b = [1 / (1 + k), -1 / (1 + k), 0.0]
        aa = [1.0, (k - 1) / (k + 1), 0.0]
    else:
        raise ValueError(kind)
    return [b[0] / aa[0], b[1] / aa[0], b[2] / aa[0], aa[1] / aa[0], aa[2] / aa[0]]


def to_coefs(f):
    """The five words of a section, [b0, b1, b2, -a1, -a2] in Q3.23 (rounded half up)."""
    b0, b1, b2, a1, a2 = f
    out = [math.floor(v * 2 ** COEF_FRAC + 0.5) for v in (b0, b1, b2, -a1, -a2)]
    lim = 1 << (COEF_BITS - 1)
    assert all(-lim <= v < lim for v in out), (f, out)
    return out


IDENTITY = [1 << COEF_FRAC, 0, 0, 0, 0]


def bass(db):
    return to_coefs(rbj("lowshelf", 150.0, 0.707, db))


def middle(db):
    return to_coefs(rbj("peak", 425.0, 1.5 if db < 0 else 0.7, db))


def treble(db):
    return to_coefs(rbj("highshelf", 1800.0, 0.707, db))


def dc_blocker():
    return to_coefs(rbj("highpass1", DC_HZ, 0.707, 0.0))


def stack(bass_db=0, middle_db=0, treble_db=0, on=True):
    """The four sections' coefficients, as the firmware writes them (EQ off: the three tone
    sections pass the signal through; the DC blocker is always on)."""
    if not on:
        return [IDENTITY, IDENTITY, IDENTITY, dc_blocker()]
    return [bass(bass_db), middle(middle_db), treble(treble_db), dc_blocker()]


def sat(v, bits):
    lim = 1 << (bits - 1)
    return max(-lim, min(lim - 1, v))


class ToneStack:
    """The gateware's state, a sample at a time."""

    def __init__(self, sections):
        self.sections = sections
        # history of each node (input, after each section): [z^-1, z^-2]
        self.hist = [[0, 0] for _ in range(SECTIONS + 1)]

    def sample(self, x16):
        cur = int(x16) << IN_SHIFT
        for k, c in enumerate(self.sections):
            hx, hy = self.hist[k], self.hist[k + 1]
            acc = c[0] * cur + c[1] * hx[0] + c[2] * hx[1] + c[3] * hy[0] + c[4] * hy[1]
            y = sat((acc + (1 << (COEF_FRAC - 1))) >> COEF_FRAC, STATE_BITS)
            hx[1], hx[0] = hx[0], cur
            cur = y
        last = self.hist[SECTIONS]
        last[1], last[0] = last[0], cur
        return sat((cur + (1 << (IN_SHIFT - 1))) >> IN_SHIFT, 16)

    def run(self, x16):
        return np.array([self.sample(v) for v in x16], dtype=np.int64)


def run_float(x, sections_f):
    """The same cascade in floating point (x in -1..1)."""
    for b0, b1, b2, a1, a2 in sections_f:
        y = np.zeros_like(x)
        x1 = x2 = y1 = y2 = 0.0
        for i, v in enumerate(x):
            o = b0 * v + b1 * x1 + b2 * x2 - a1 * y1 - a2 * y2
            x2, x1, y2, y1 = x1, v, y1, o
            y[i] = o
        x = y
    return x
