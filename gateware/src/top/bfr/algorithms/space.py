"""Rooms and halls: early reflections, then an eight-line feedback network.

The input passes a predelay line. Taps of that line, in a fixed pattern of
times and signs scaled by `early_size`, are the first reflections off the
walls (a few per channel, thinning out); they also feed the tail. The tail
is the Householder network of `fdn8`: four allpass diffusers, eight delay
lines of unrelated lengths with damping and a gain each for the decay time,
two of them modulated.
"""

from model.lib import (allpass, early_reflections, householder, lowcut, lowpass, mix,
                       onepole_coef, rt60_gain)

NAME = "space"
TITLE = "Room / Hall"
DESCRIPTION = "Wall reflections, then a dense tail: from a small room to a cathedral."
PRESETS = [
    ("Small room", {"size": 0.5, "decay": 0.5, "predelay": 2.0, "early": 0.8, "early_size": 0.6,
                    "damping": 7000.0, "diffusion": 0.7, "mix": 0.3}),
    ("Studio", {"size": 0.6, "decay": 0.8, "predelay": 4.0, "early": 0.6, "early_size": 0.8,
                "damping": 9000.0, "mix": 0.3}),
    ("Chamber", {"size": 0.8, "decay": 1.4, "predelay": 8.0, "early": 0.5, "early_size": 1.0,
                 "damping": 6000.0, "diffusion": 0.75}),
    ("Concert hall", {"size": 1.3, "decay": 2.8, "predelay": 25.0, "early": 0.4,
                      "early_size": 1.6, "damping": 5500.0}),
    ("Cathedral", {"size": 2.0, "decay": 8.0, "predelay": 60.0, "early": 0.3, "early_size": 2.0,
                   "damping": 4000.0, "mod_depth": 0.5, "mix": 0.45}),
    ("Extreme", {"size": 2.0, "decay": 30.0, "predelay": 150.0, "early": 1.0, "early_size": 2.0,
                 "damping": 14000.0, "low_cut": 40.0, "diffusion": 0.85, "mod_depth": 1.0,
                 "mod_rate": 0.6, "mix": 0.85}),
]

LINES_MS = (29.7, 37.1, 41.1, 43.7, 53.3, 61.3, 71.9, 79.3)
DIFFUSE_MS = (4.7, 3.6, 12.7, 9.3)
MODULATED = {0: "sin", 5: "cos"}
# (ms, gain, channel): a medium room's first reflections, alternating sides.
EARLY = ((4.3, 0.84, 0), (5.7, 0.80, 1), (11.2, -0.66, 0), (13.5, -0.62, 1),
         (17.9, 0.55, 0), (19.8, 0.52, 1), (25.6, -0.45, 0), (27.9, -0.42, 1),
         (33.1, 0.36, 0), (36.4, 0.33, 1), (41.8, 0.28, 0), (45.2, 0.25, 1))


def build(a):
    size = a.param("size", 1.0, 0.5, 2.0, curve="log", fade_ms=20, page="reverb",
                   help="Size of the tail's space: bigger spreads its echoes further apart.")
    decay = a.param("decay", 2.0, 0.2, 30.0, "s", "log", page="reverb",
                    help="Time for the tail to fall by 60 dB, whatever the size.")
    predelay = a.param("predelay", 10.0, 2.0, 250.0, "ms", fade_ms=40, page="reverb",
                       help="Gap before the first reflection: larger rooms have longer gaps.")
    early = a.param("early", 0.5, 0.0, 1.0, page="reverb",
                    help="Level of the first reflections off the walls.")
    wet = a.param("mix", 0.35, 0.0, 1.0, page="reverb",
                  help="Dry signal at 0, reverb only at 1.")
    early_size = a.param("early_size", 1.0, 0.5, 2.0, curve="log", page="tone",
                         help="Spacing of the first reflections: how far away the walls are.")
    damping = a.param("damping", 6000.0, 500.0, 20000.0, "Hz", "log", page="tone",
                      help="Highs above this decay faster, like soft walls and air.")
    low_cut = a.param("low_cut", 80.0, 20.0, 500.0, "Hz", "log", page="tone",
                      help="Removes the lows below this from the reverb, to keep it clear.")
    diffusion = a.param("diffusion", 0.6, 0.0, 0.85, page="tone",
                        help="Smearing into the tail: high is a smooth wash, low distinct echoes.")
    mod_depth = a.param("mod_depth", 0.3, 0.0, 1.0, "ms", page="tone",
                        help="How far two of the lines wander: breaks up metallic ringing.")
    mod_rate = a.param("mod_rate", 0.7, 0.05, 5.0, "Hz", "log", page="tone",
                       help="How fast those lines wander.")

    dry_l, dry_r = a.input(0), a.input(1)
    pre = a.delay("predelay")
    pre.write(lowcut(a, (dry_l + dry_r) * 0.5, low_cut, "lowcut"))
    # The reflections start after the predelay.
    er_l, er_r = early_reflections(pre, EARLY, early_size, offset=a.ms(predelay))

    x = pre.tap(a.ms(predelay))
    for i, ms in enumerate(DIFFUSE_MS):
        x, _ = allpass(a, x, a.ms(ms) * size, diffusion, f"diffuse{i}")

    lines = [a.delay(f"line{i}") for i in range(len(LINES_MS))]
    k = onepole_coef(a, damping)
    lfo = a.lfo(mod_rate)
    ys = []
    for i, (line, ms) in enumerate(zip(lines, LINES_MS)):
        length = a.ms(ms) * size
        if i in MODULATED:
            t = line.modtap(length, a.ms(mod_depth), getattr(lfo, MODULATED[i]))
        else:
            t = line.tap(length)
        ys.append(lowpass(a, t * rt60_gain(a, length, decay), k, f"damp{i}"))

    feed = (x + (er_l + er_r) * 0.3)
    for i, (line, m) in enumerate(zip(lines, householder(ys))):
        line.write(m + feed * (0.5 if i % 2 == 0 else -0.5))

    for c, (dry, part, er) in enumerate(((dry_l, ys[0::2], er_l), (dry_r, ys[1::2], er_r))):
        wet_sig = mix([(y, 0.35) for y in part]) + er * early
        a.output(c, dry * (1 - wet) + wet_sig * wet)
        a.output(c + 2, wet_sig)                # OUT2/3: reverb only
