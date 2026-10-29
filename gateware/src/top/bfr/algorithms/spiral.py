"""Spiral: repeats that climb (or fall) forever, into a reverb.

A delay line (`time`) whose feedback passes a frequency shifter
(`lib.freq_shift`: a Hilbert pair and an LFO at `shift` Hz), so every
repeat comes back `shift` Hz higher (or lower) than the last: the tail
spirals up or down like a barber's pole. Moving every frequency by the
same amount (not by the same ratio, as `shimmer`'s pitch shift does)
makes harmonics inharmonic: bell-like and strange at a few Hz, a
sweeping chorus at under one. The repeats then fill an eight-line
network (`size`, `decay`), and a damping lowpass in the loop lets the
highest ones fade. The shifter's gain is within 0.05 dB of 1, so with
`feedback` at most 0.9 the loop can't grow.
"""

from model.lib import (allpass, freq_shift, householder, lowcut, lowpass, mix, onepole_coef,
                       rt60_gain)

NAME = "spiral"
TITLE = "Spiral"
DESCRIPTION = "Repeats that climb or fall forever, a barber's pole of echoes melting into a reverb."
PRESETS = [
    ("Rising", {"shift": 4.0, "feedback": 0.75, "time": 180.0, "mix": 0.45}),
    ("Falling", {"shift": -4.0, "feedback": 0.75, "time": 180.0, "mix": 0.45}),
    ("Slow drift", {"shift": 0.4, "feedback": 0.8, "time": 90.0, "decay": 4.0, "mix": 0.4}),
    ("Bells", {"shift": 17.0, "feedback": 0.6, "time": 60.0, "damping": 9000.0,
               "decay": 3.0, "mix": 0.45}),
    ("Extreme", {"shift": 9.0, "feedback": 0.9, "time": 420.0, "size": 2.0, "decay": 15.0,
                 "damping": 14000.0, "mix": 0.85}),
]

LINES_MS = (32.3, 37.1, 42.1, 47.3, 54.7, 61.1, 68.3, 75.7)
DIFFUSE_MS = (4.3, 6.1)


def build(a):
    shift = a.param("shift", 3.0, -30.0, 30.0, "Hz", page="reverb", step=0.5,
                    help="How far each repeat moves: up above 0, down below.")
    feedback = a.param("feedback", 0.7, 0.0, 0.9, page="reverb",
                       help="How many repeats spiral round: high keeps them going.")
    time = a.param("time", 150.0, 30.0, 800.0, "ms", "log", fade_ms=60, page="reverb",
                   help="Time between repeats.")
    decay = a.param("decay", 2.5, 0.3, 15.0, "s", "log", page="reverb",
                    help="How long the reverb around the repeats lasts.")
    wet = a.param("mix", 0.4, 0.0, 1.0, page="reverb",
                  help="Dry signal at 0, the spiral only at 1.")
    size = a.param("size", 1.0, 0.5, 2.0, curve="log", fade_ms=30, page="tone",
                   help="Size of the reverb's space.")
    damping = a.param("damping", 6000.0, 1000.0, 20000.0, "Hz", "log", page="tone",
                      help="Highs above this fade with every repeat and in the tail.")
    low_cut = a.param("low_cut", 100.0, 20.0, 600.0, "Hz", "log", page="tone",
                      help="Removes the lows below this before the spiral.")

    osc = a.lfo(shift)
    dry_l, dry_r = a.input(0), a.input(1)
    x = lowcut(a, (dry_l + dry_r) * 0.5, low_cut, "lowcut")
    k = onepole_coef(a, damping)

    loop = a.delay("spiral")
    shifted = lowpass(a, freq_shift(a, loop.tap(a.ms(time)), osc, "shift"), k, "loop_damp")
    loop.write(x + shifted * feedback)

    y = shifted
    for i, ms in enumerate(DIFFUSE_MS):
        y, _ = allpass(a, y, a.ms(ms), 0.6, f"diffuse{i}")
    lines = [a.delay(f"line{i}") for i in range(len(LINES_MS))]
    ys = []
    for i, (line, ms) in enumerate(zip(lines, LINES_MS)):
        length = a.ms(ms) * size
        ys.append(lowpass(a, line.tap(length) * rt60_gain(a, length, decay), k, f"damp{i}"))
    for i, (line, m) in enumerate(zip(lines, householder(ys))):
        line.write(m + y * (0.5 if i % 2 == 0 else -0.5))

    for c, (dry, part) in enumerate(((dry_l, ys[0::2]), (dry_r, ys[1::2]))):
        wet_sig = mix([(t, 0.3) for t in part]) + shifted * 0.35
        a.output(c, dry * (1 - wet) + wet_sig * wet)
        a.output(c + 2, wet_sig)                    # OUT2/3: reverb only
