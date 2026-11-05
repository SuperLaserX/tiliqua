"""Renders the samples that are synthesized here, not recorded: `library/FAIRWAVE/SAMPLES/`.

    python src/top/fairwave/tools/make_rendered.py

The Roland Alpha Juno's "What The", the rave hoover, comes down to a pulse and a saw both moving under a fast LFO,
a sub, a chorus, a filter on a delayed LFO, and all of it swooping up two octaves with one envelope. Most of those
FairWave can't do live: it has no filter and no chorus, and a wavetable can't hold the saw's motion and the chorus
together. So they are worked out here, from the patch's published settings, as a loop the oscillators then read
with the pitch envelope and amplitude still live.

Those settings are only numbers from 0 to 127, and how they map to Hz and seconds isn't published: the rates and
times here are estimates, the values in the comments are the patch's own. This is an emulation, not a recording of
the instrument. A recording of the real one can take its place: see `tools/make_sample.py`.
"""

import math
import sys
from pathlib import Path

import numpy as np
from scipy.signal import butter, lfilter, resample_poly

HERE = Path(__file__).resolve().parent
sys.path.insert(0, str(HERE))

from samples import Table, tune_of, write_table  # noqa: E402

FS = 48000
OUT = HERE.parent / "library" / "FAIRWAVE" / "SAMPLES"
FRAME = 512
LOOP = 64000            # 1.33 s: everything below goes round a whole number of times in it
PRE = 112 * FRAME       # The first part of What The: the filter's envelope, and the LFO's delay.
OVER = 4

F0 = 172 * FS / LOOP    # 129 Hz, near enough C3; `TUNE` makes it C3. A multiple of 4, for the subs.
PWM_HZ = 12 * FS / LOOP     # PWM RATE 102
CHORUS_HZ = 7 * FS / LOOP   # CRS RATE 92
LFO_HZ = 2 * FS / LOOP      # LFO RATE 39
LFO_DELAY = 0.45            # LFO DELY 64, by which time it starts to fade in, and takes as long again
FILTER_ENV = 0.10           # how long the filter's sweep takes of the sample's own time: see `SWOOP` in the patch

# The patch's mix, all from one DCO.
PULSE, SAW, SUB, NOISE = 0.8, 0.9, 0.5, 0.02        # PULSE 3, SAWTOOTH 3, SUB 5 at level 3, NOISE 1
WIDTH = 0.47            # PW/PWM 127, as far as it goes
AC_COUPLING = butter(2, 70 / (FS / 2), "high")


def triangle(phase):
    return 2 * np.abs(2 * (phase % 1) - 1) - 1


def dco(n):
    """`n` samples at `FS`, bandlimited by working at four times the rate."""
    t = np.arange(n * OVER + 256) / (FS * OVER)
    phase = (F0 * t) % 1
    move = triangle(PWM_HZ * t)
    width = 0.5 + WIDTH * move
    pulse = np.where(phase < width, 1.0, -1.0)
    # The Alpha Juno's own saw: a saw with two holes cut in each cycle, wider as the width moves.
    holes = ((2 * phase) % 1) < width
    saw = (2 * phase - 1) * holes
    half = np.sign(np.sin(2 * np.pi * F0 / 2 * t))
    quarter = np.sign(np.sin(2 * np.pi * F0 / 4 * t))
    rng = np.random.default_rng(39)
    noise = np.tile(rng.uniform(-1, 1, LOOP * OVER), (len(t) // (LOOP * OVER)) + 1)[:len(t)]
    # As the width moves so does the average of the pulse and the saw, by nearly their whole size, at the LFO's rate:
    # an instrument's AC coupling and fixed high-pass keep that out of the sound, so the same is done here.
    upper = resample_poly(PULSE * pulse + SAW * saw, 1, OVER, window=("kaiser", 12.0))[32:32 + n]
    upper = lfilter(*AC_COUPLING, upper)
    lower = resample_poly(SUB * (0.8 * half + 0.2 * quarter) + NOISE * noise, 1, OVER, window=("kaiser", 12.0))[32:32 + n]
    y = upper + lower
    assert len(y) == n
    return y


def ladder(x, cutoff):
    """Four one-pole stages with `cutoff` Hz moving under them, no resonance (VCF RESO 0)."""
    g = 1 - np.exp(-2 * np.pi * np.minimum(cutoff, 18000) / FS)
    a = b = c = d = 0.0
    out = np.zeros(len(x))
    for i, (v, k) in enumerate(zip(x.tolist(), g.tolist())):
        v = math.tanh(v * 0.7) / 0.7
        a += k * (v - a)
        b += k * (a - b)
        c += k * (b - c)
        d += k * (c - d)
        out[i] = d
    return out


def low_boost(x):
    """HPF FREQ 0 on this instrument is a little bass boost; and take away what it holds of DC."""
    k = 2 * np.pi * 110 / FS
    low = 0.0
    slow = 0.0
    out = np.zeros(len(x))
    for i, v in enumerate(x.tolist()):
        low += k * (v - low)
        slow += 0.0008 * (v - slow)
        out[i] = v + 0.5 * low - slow
    return out


def chorus(x, sign):
    """Dry and one delay moving, the delay's LFO the other way round in the other ear."""
    t = np.arange(len(x), dtype=float)
    swing = sign * triangle(CHORUS_HZ * t / FS)
    delay = (3.4 + 1.7 * swing) * FS / 1000
    return x + np.interp(t - delay, t, x)


def what_the():
    """Both ears: the filter's envelope and delayed LFO first, then a loop of it all."""
    n = PRE + 3 * LOOP
    t = np.arange(n) / FS
    env = np.minimum(t / FILTER_ENV, 1)
    fade = np.clip((t - LFO_DELAY) / LFO_DELAY, 0, 1)
    # VCF FREQ 77, ENV 75, LFO 75, RESO 0.
    cutoff = 1000 * 2 ** (2.1 * env + 1.1 * fade * np.sin(2 * np.pi * LFO_HZ * t))
    x = ladder(low_boost(dco(n)), cutoff)
    return [chorus(x, sign) for sign in (1, -1)]


def steady(cutoff):
    """The same with the filter still: a loop, which is all of it."""
    x = ladder(low_boost(dco(4 * LOOP)), np.full(4 * LOOP, float(cutoff)))
    return chorus(x, 1)


def seam(y, at):
    """How far the loop starting at `at` is from coming round to itself, against its size."""
    a, b = y[at:at + LOOP], y[at + LOOP:at + 2 * LOOP]
    return float(np.sqrt(np.mean((a - b) ** 2)) / np.sqrt(np.mean(a ** 2)))


def table_of(y, gain, loop_frame, starts=(0,)):
    # (what's left of DC, after the sub's own: it would show up at the outputs)
    level = (y - y[(loop_frame or 0) * FRAME:].mean()) * gain
    samples = np.clip(np.round(level), -32768, 32767).astype(np.int16)
    return Table(samples, FRAME, float(FS), loop_frame, list(starts))


def main():
    OUT.mkdir(parents=True, exist_ok=True)
    left, right = what_the()
    print(f"What The's loop misses itself by {seam(left, PRE + LOOP):.4f} of its level")
    # The loop is the one a whole loop after the settling, the attack what leads straight into it.
    wanted = np.arange(PRE + LOOP)
    gain = 30000 / max(np.abs(left[wanted]).max(), np.abs(right[wanted]).max())
    for name, y in (("WHATL", left), ("WHATR", right)):
        write_table(OUT / f"{name}.WAV", table_of(y[:PRE + LOOP], gain, PRE // FRAME))
    bright, dark = steady(5200), steady(620)
    print(f"Hoover's loop misses itself by {seam(bright, 2 * LOOP):.4f} of its level")
    gain_bright = 30000 / np.abs(bright[2 * LOOP:3 * LOOP]).max()
    gain_dark = 30000 / np.abs(dark[2 * LOOP:3 * LOOP]).max()
    # (the same size for the same note: a dark one is quieter, but a filter's closing would keep it so)
    gain = min(gain_bright, gain_dark * 0.8)
    for name, y in (("HOOVBRI", bright), ("HOOVDRK", dark)):
        write_table(OUT / f"{name}.WAV", table_of(y[2 * LOOP:3 * LOOP], gain, 0))
    t = Table(np.zeros(FRAME, np.int16), FRAME, float(FS), 0, [0])
    print("tune for C3 at its own speed:", tune_of(t, F0, 130.81278))


if __name__ == "__main__":
    sys.exit(main())
