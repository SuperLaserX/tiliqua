"""Morph: a reverb made to be played by its input.

A dense hall (an input lowpass, `bandwidth`; four diffusers; an eight-line
network with damping) and a swept filter on its tail: a one-pole lowpass
whose coefficient an LFO moves (a signal times a signal), `filter_depth`
deep at `filter_rate` around `filter`, the right side's sweep
`filter_phase` degrees behind the left's. The coefficient is kept below 1,
where a one-pole stays a smooth lowpass.

Every parameter is there to be moved by the input followers (any type's
parameters can be: hold a dial). This type's presets set them, which shows
how: the reverb ducks under playing and swells back in the gaps, the room
breathes with the level, darkens as the input brightens, blooms with bass,
or opens like an envelope filter.
"""

import math

from model.dsl import pm
from model.lib import allpass, householder, lowcut, lowpass, mix, onepole_coef, rt60_gain

NAME = "morph"
TITLE = "Morph"
DESCRIPTION = "A hall made to be played: its presets let the input's level, bass and treble move it."
# (third item: how far the input's level, bass and treble move parameters, %)
PRESETS = [
    ("Ducked hall", {"decay": 3.5, "mix": 0.6, "filter_depth": 0.0},
     [("level", "mix", -70)]),
    ("Breathing room", {"size": 0.8, "decay": 2.0, "mix": 0.45, "filter_depth": 0.0},
     [("level", "size", 50), ("level", "decay", 30)]),
    ("Dark when bright", {"decay": 4.0, "damping": 12000.0, "mix": 0.45, "filter_depth": 0.0},
     [("treble", "damping", -70)]),
    ("Bass bloom", {"size": 1.2, "decay": 1.5, "bandwidth": 6000.0, "mix": 0.45,
                    "filter_depth": 0.0},
     [("bass", "decay", 60), ("bass", "size", 30)]),
    ("Envelope filter", {"decay": 3.0, "filter": 300.0, "filter_depth": 0.2, "filter_rate": 0.3,
                         "mix": 0.55},
     [("level", "filter", 65)]),
    ("Extreme", {"size": 2.0, "decay": 20.0, "diffusion": 0.85, "filter": 2000.0,
                 "filter_depth": 0.9, "filter_rate": 2.0, "filter_phase": 180.0, "mix": 0.85},
     [("level", "filter_depth", -60), ("bass", "size", -40), ("treble", "filter", 50)]),
]

LINES_MS = (31.1, 35.9, 42.7, 46.3, 55.1, 62.3, 69.7, 77.9)
DIFFUSE_MS = (4.3, 3.3, 11.9, 8.7)
DRIFTING = {3: "sin", 6: "cos"}


def build(a):
    size = a.param("size", 1.0, 0.5, 2.0, curve="log", fade_ms=30, page="reverb",
                   help="Size of the hall: bigger spreads its echoes further apart.")
    decay = a.param("decay", 2.5, 0.3, 20.0, "s", "log", page="reverb",
                    help="Time for the tail to fall by 60 dB.")
    diffusion = a.param("diffusion", 0.65, 0.0, 0.85, page="reverb",
                        help="Smearing into the tail: high is a smooth wash, low distinct echoes.")
    predelay = a.param("predelay", 10.0, 2.0, 200.0, "ms", fade_ms=40, page="reverb",
                       help="Gap before the reverb starts.")
    wet = a.param("mix", 0.4, 0.0, 1.0, page="reverb",
                  help="Dry signal at 0, reverb only at 1.")
    bandwidth = a.param("bandwidth", 12000.0, 1000.0, 20000.0, "Hz", "log", page="tone",
                        help="Highs above this don't enter the hall.")
    damping = a.param("damping", 7000.0, 1000.0, 20000.0, "Hz", "log", page="tone",
                      help="Highs above this fade away in the tail.")
    cutoff = a.param("filter", 5000.0, 100.0, 16000.0, "Hz", "log", page="tone",
                     help="The tail's swept lowpass: where it sweeps around.")
    filter_depth = a.param("filter_depth", 0.5, 0.0, 1.0, page="tone",
                           help="How far the lowpass sweeps: 0 holds it still.")
    filter_rate = a.param("filter_rate", 0.4, 0.05, 8.0, "Hz", "log", page="tone",
                          help="How fast the lowpass sweeps.")
    filter_phase = a.param("filter_phase", 90.0, 0.0, 180.0, "deg", page="tone",
                           help="How far the right side's sweep is behind the left's.")

    sweep = a.lfo(filter_rate)
    drift = a.lfo(0.29)

    dry_l, dry_r = a.input(0), a.input(1)
    pre = a.delay("predelay")
    x = lowpass(a, lowcut(a, (dry_l + dry_r) * 0.5, 60.0, "lowcut"),
                onepole_coef(a, bandwidth), "bandwidth")
    pre.write(x)
    x = pre.tap(a.ms(predelay))
    for i, ms in enumerate(DIFFUSE_MS):
        x, _ = allpass(a, x, a.ms(ms) * size, diffusion, f"diffuse{i}")

    lines = [a.delay(f"line{i}") for i in range(len(LINES_MS))]
    k = onepole_coef(a, damping)
    ys = []
    for i, (line, ms) in enumerate(zip(lines, LINES_MS)):
        length = a.ms(ms) * size
        if i in DRIFTING:
            t = line.modtap(length, a.ms(0.35), getattr(drift, DRIFTING[i]))
        else:
            t = line.tap(length)
        ys.append(lowpass(a, t * rt60_gain(a, length, decay), k, f"damp{i}"))
    for i, (line, m) in enumerate(zip(lines, householder(ys))):
        line.write(m + x * (0.5 if i % 2 == 0 else -0.5))

    # The swept lowpass: y += k(t) (x - y), k(t) = k0 (1 + depth s(t)),
    # with k0 (1 + depth) at most 1.
    k0 = pm.min(onepole_coef(a, cutoff), 1 / (1 + filter_depth))
    phi = filter_phase * (math.pi / 180.0)
    sweeps = (sweep.sin, sweep.sin * pm.cos(phi) - sweep.cos * pm.sin(phi))
    for c, (dry, part) in enumerate(((dry_l, ys[0::2]), (dry_r, ys[1::2]))):
        tail = mix([(y, 0.35) for y in part])
        st = a.state(f"sweep{c}")
        diff = tail - st.prev
        y = st.prev + diff * (sweeps[c] * (k0 * filter_depth) + k0)
        st.write(y)
        a.output(c, dry * (1 - wet) + y * wet)
        a.output(c + 2, y * 1.0)                    # OUT2/3: reverb only
