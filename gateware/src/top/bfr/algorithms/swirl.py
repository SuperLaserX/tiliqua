"""Swirl: a hall seen through a resonant phaser.

The tail passes four first-order allpasses whose coefficient an LFO
sweeps (a signal times a signal; the coefficient runs straight between
those of `center` / 2^(2 x `depth`) and `center` x 2^(2 x `depth`), so it
stays inside -1..1), and is mixed with itself: notches that sweep up and
down the spectrum, the left and right a quarter cycle apart. `feedback`
returns the phaser's output to its input (negative: the other sign), which
sharpens the notches into whistling peaks.
"""

import math

from model.dsl import pm
from model.lib import allpass, householder, lowcut, lowpass, mix, onepole_coef, rt60_gain

NAME = "swirl"
TITLE = "Swirl"
DESCRIPTION = "A hall seen through a resonant phaser: notches sweeping up and down the tail."
PRESETS = [
    ("Gentle swirl", {"rate": 0.2, "depth": 0.6, "feedback": 0.3, "mix": 0.45}),
    ("Jet hall", {"rate": 0.08, "depth": 1.0, "feedback": 0.7, "decay": 4.0, "mix": 0.5}),
    ("Wah room", {"rate": 1.5, "depth": 0.5, "center": 1200.0, "feedback": 0.6, "decay": 1.2,
                  "mix": 0.45}),
    ("Negative", {"rate": 0.4, "depth": 0.8, "feedback": -0.75, "mix": 0.45}),
    ("Extreme", {"rate": 3.0, "depth": 1.0, "center": 2000.0, "feedback": 0.9, "decay": 12.0,
                 "size": 2.0, "mix": 0.85}),
]

LINES_MS = (29.3, 34.9, 39.7, 45.9, 51.1, 57.7, 64.3, 71.9)
DIFFUSE_MS = (3.9, 6.1)
STAGES = 4


def allpass_coef(a, hz):
    """First-order allpass (c + z^-1) / (1 + c z^-1) breaking at `hz`."""
    t = pm.tan(math.pi * pm.min(hz, a.fs * 0.45) / a.fs)
    return (t - 1.0) / (t + 1.0)


def build(a):
    rate = a.param("rate", 0.3, 0.02, 5.0, "Hz", "log", page="reverb",
                   help="Sweeps per second.")
    depth = a.param("depth", 0.7, 0.0, 1.0, page="reverb",
                    help="How far the notches sweep, up to two octaves each way.")
    feedback = a.param("feedback", 0.5, -0.9, 0.9, page="reverb",
                       help="Sharpens the notches into whistling peaks; negative flips them.")
    decay = a.param("decay", 2.5, 0.3, 15.0, "s", "log", page="reverb",
                    help="Time for the tail to fall by 60 dB.")
    wet = a.param("mix", 0.45, 0.0, 1.0, page="reverb",
                  help="Dry signal at 0, the swirling tail only at 1.")
    center = a.param("center", 800.0, 200.0, 4000.0, "Hz", "log", page="tone",
                     help="Where the sweep is centred.")
    size = a.param("size", 1.0, 0.5, 2.0, curve="log", fade_ms=30, page="tone",
                   help="Size of the hall.")

    lfo = a.lfo(rate)
    span = 2.0 ** (depth * 2.0)
    c_lo, c_hi = allpass_coef(a, center / span), allpass_coef(a, center * span)

    dry_l, dry_r = a.input(0), a.input(1)
    pre = a.delay("predelay")
    pre.write(lowcut(a, (dry_l + dry_r) * 0.5, 80.0, "lowcut"))
    x = pre.tap(a.ms(10.0))
    for i, ms in enumerate(DIFFUSE_MS):
        x, _ = allpass(a, x, a.ms(ms), 0.6, f"diffuse{i}")
    lines = [a.delay(f"line{i}") for i in range(len(LINES_MS))]
    k = onepole_coef(a, 8000.0)
    ys = []
    for i, (line, ms) in enumerate(zip(lines, LINES_MS)):
        length = a.ms(ms) * size
        ys.append(lowpass(a, line.tap(length) * rt60_gain(a, length, decay), k, f"damp{i}"))
    for i, (line, m) in enumerate(zip(lines, householder(ys))):
        line.write(m + x * (0.5 if i % 2 == 0 else -0.5))

    for c, (dry, part, sweep) in enumerate(((dry_l, ys[0::2], lfo.sin), (dry_r, ys[1::2], lfo.cos))):
        tail = mix([(y, 0.35) for y in part])
        coef = sweep * ((c_hi - c_lo) * 0.5) + (c_hi + c_lo) * 0.5
        back = a.state(f"back{c}")
        v = tail + back.prev * feedback
        for s in range(STAGES):
            xs, ys1 = a.state(f"x{c}{s}"), a.state(f"y{c}{s}")
            out = (v - ys1.prev) * coef + xs.prev
            xs.write(v)
            ys1.write(out)
            v = out
        back.write(v)
        wet_sig = (tail + v) * 0.8
        a.output(c, dry * (1 - wet) + wet_sig * wet)
        a.output(c + 2, wet_sig)                    # OUT2/3: reverb only
