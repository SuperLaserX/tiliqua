"""Pulse: a tail that throbs in time.

A room-like eight-line network whose output is multiplied by a gate (a
signal times a signal): an LFO at `rate`, `depth` deep, its shape from a
smooth sine (`shape` 0) to nearly square (1: the sine flattened twice by
the odd polynomial (15s - 10s^3 + 3s^5) / 8, which keeps it within -1..1).
`width` moves the right side's gate up to half a cycle behind the left's,
so the tail swings from side to side. With `feed` the gate chops the input
on its way into the network too, so the tail fills in pulses and the
pulses come back in time with the gate.
"""

import math

from model.dsl import pm
from model.lib import allpass, householder, lowcut, lowpass, mix, onepole_coef, rt60_gain

NAME = "pulse"
TITLE = "Pulse"
DESCRIPTION = "A reverb tail that throbs in time: an LFO gates it, smooth to square, side to side."
PRESETS = [
    ("Heartbeat", {"rate": 1.2, "depth": 0.8, "shape": 0.3, "decay": 3.0, "mix": 0.45}),
    ("Chopper", {"rate": 8.0, "depth": 1.0, "shape": 1.0, "feed": 0.5, "decay": 2.0,
                 "mix": 0.5}),
    ("Swing", {"rate": 0.5, "depth": 0.9, "shape": 0.5, "width": 1.0, "decay": 5.0,
               "size": 1.5, "mix": 0.5}),
    ("Stutter hall", {"rate": 4.0, "depth": 1.0, "shape": 0.8, "feed": 1.0, "decay": 6.0,
                      "size": 1.8, "mix": 0.55}),
    ("Extreme", {"rate": 12.0, "depth": 1.0, "shape": 1.0, "feed": 1.0, "width": 1.0,
                 "size": 2.0, "decay": 20.0, "damping": 14000.0, "mix": 0.85}),
]

LINES_MS = (29.3, 34.1, 39.7, 45.1, 51.3, 57.7, 64.9, 71.3)
DIFFUSE_MS = (3.1, 4.7, 7.9, 11.3)
MODULATED = {1: "sin", 6: "cos"}


def flatten(s):
    """(15s - 10s^3 + 3s^5) / 8: a sine's shape squarer, still within -1..1."""
    s2 = s * s
    s3 = s2 * s
    s5 = s3 * s2
    return s * 1.875 + s3 * -1.25 + s5 * 0.375


def build(a):
    rate = a.param("rate", 2.0, 0.25, 16.0, "Hz", "log", page="reverb",
                   help="Pulses per second.")
    depth = a.param("depth", 0.8, 0.0, 1.0, page="reverb",
                    help="How far the gate closes between pulses: 1 is silence.")
    shape = a.param("shape", 0.4, 0.0, 1.0, page="reverb",
                    help="The pulse's shape: a smooth swell at 0, a hard on-off chop at 1.")
    decay = a.param("decay", 3.0, 0.3, 20.0, "s", "log", page="reverb",
                    help="Time for the tail to fall by 60 dB.")
    wet = a.param("mix", 0.45, 0.0, 1.0, page="reverb",
                  help="Dry signal at 0, the pulsing tail only at 1.")
    feed = a.param("feed", 0.0, 0.0, 1.0, page="tone",
                   help="How much the gate also chops what goes in: the tail fills in pulses.")
    width = a.param("width", 0.0, 0.0, 1.0, page="tone",
                    help="The right side's pulse later than the left's, up to half a cycle.")
    size = a.param("size", 1.0, 0.5, 2.0, curve="log", fade_ms=30, page="tone",
                   help="Size of the space behind the pulses.")
    damping = a.param("damping", 7000.0, 1000.0, 20000.0, "Hz", "log", page="tone",
                      help="Highs above this fade away in the tail.")

    lfo = a.lfo(rate)
    drift = a.lfo(0.37)
    # The gate's LFO per side (the right one `width` x half a cycle later),
    # shaped, then 1 - depth (1 - g) / 2: 1 open, 1 - depth closed.
    phi = math.pi * width
    gates = []
    for s in (lfo.sin, lfo.sin * pm.cos(phi) + lfo.cos * pm.sin(phi)):
        f2 = flatten(flatten(s))
        g = s + (f2 - s) * shape
        gates.append(g * (depth * 0.5) + (1 - depth * 0.5))

    dry_l, dry_r = a.input(0), a.input(1)
    pre = a.delay("predelay")
    pre.write(lowcut(a, (dry_l + dry_r) * 0.5, 90.0, "lowcut"))
    x = pre.tap(a.ms(8.0))
    x = x + (x * gates[0] - x) * feed           # (feed 1: gated, 0: as is)
    for i, ms in enumerate(DIFFUSE_MS):
        x, _ = allpass(a, x, a.ms(ms), 0.6, f"diffuse{i}")

    lines = [a.delay(f"line{i}") for i in range(len(LINES_MS))]
    k = onepole_coef(a, damping)
    ys = []
    for i, (line, ms) in enumerate(zip(lines, LINES_MS)):
        length = a.ms(ms) * size
        if i in MODULATED:
            t = line.modtap(length, a.ms(0.3), getattr(drift, MODULATED[i]))
        else:
            t = line.tap(length)
        ys.append(lowpass(a, t * rt60_gain(a, length, decay), k, f"damp{i}"))
    for i, (line, m) in enumerate(zip(lines, householder(ys))):
        line.write(m + x * (0.5 if i % 2 == 0 else -0.5))

    for c, (dry, part) in enumerate(((dry_l, ys[0::2]), (dry_r, ys[1::2]))):
        tail = mix([(y, 0.4) for y in part])
        wet_sig = tail * gates[c]
        a.output(c, dry * (1 - wet) + wet_sig * wet)
        a.output(c + 2, wet_sig)                    # OUT2/3: reverb only
