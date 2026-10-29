"""Reverse: a swell that rises instead of decaying, then stops.

The input is diffused and written to a line; the output is a row of taps
spread evenly over `length`, the oldest loudest (gains rise as
((i + 1) / N) ^ shape), alternating left and right. So a sound comes back
quiet and grows until `length` has passed, then cuts off, as a reverb tail
played backwards does. A little feedback from the oldest tap smears the
pattern into a wash.
"""

from model.lib import allpass, lowcut, lowpass, mix, onepole_coef

NAME = "reverse"
TITLE = "Reverse"
DESCRIPTION = "Swells up instead of dying away, then stops: a reverb played backwards."
PRESETS = [
    ("Short reverse", {"length": 250.0, "shape": 1.5, "mix": 0.4}),
    ("Long reverse", {"length": 600.0, "shape": 2.0, "smear": 0.3, "mix": 0.45}),
    ("Soft swell", {"length": 450.0, "shape": 1.0, "diffusion": 0.8, "damping": 5000.0}),
    ("Extreme", {"length": 800.0, "shape": 4.0, "smear": 0.5, "damping": 20000.0,
                 "low_cut": 60.0, "diffusion": 0.85, "mix": 0.9}),
]

N_TAPS = 24
DIFFUSE_MS = (3.1, 5.3, 8.9, 12.7)


def build(a):
    length = a.param("length", 350.0, 80.0, 800.0, "ms", fade_ms=40, page="reverb",
                     help="How long a sound takes to swell up before it cuts off.")
    shape = a.param("shape", 1.5, 0.5, 4.0, curve="log", page="reverb",
                    help="How the swell rises: 1 is steady, higher holds back and then surges.")
    smear = a.param("smear", 0.15, 0.0, 0.5, page="reverb",
                    help="Feeds the end of the swell back in: a denser, longer wash.")
    wet = a.param("mix", 0.4, 0.0, 1.0, page="reverb",
                  help="Dry signal at 0, reverse only at 1.")
    damping = a.param("damping", 8000.0, 1000.0, 20000.0, "Hz", "log", page="tone",
                      help="Highs above this are rolled off: lower is a softer swell.")
    low_cut = a.param("low_cut", 100.0, 20.0, 600.0, "Hz", "log", page="tone",
                      help="Removes the lows below this from the swell.")
    diffusion = a.param("diffusion", 0.7, 0.0, 0.85, page="tone",
                        help="Smearing of the input: high is a smooth swell, low a rhythmic one.")

    dry_l, dry_r = a.input(0), a.input(1)
    x = lowcut(a, (dry_l + dry_r) * 0.5, low_cut, "lowcut")
    x = lowpass(a, x, onepole_coef(a, damping), "damp")
    for i, ms in enumerate(DIFFUSE_MS):
        x, _ = allpass(a, x, a.ms(ms), diffusion, f"diffuse{i}")

    line = a.delay("swell")
    n_len = a.ms(length)
    oldest = line.tap(n_len)
    line.write(x + oldest * smear)
    # Gains normalised so the sum over a channel is about 1 for any shape.
    norm = (shape + 1) / (N_TAPS / 2) * 3.15     # (wet level matched to the other types)
    taps = [(line.tap(n_len * ((i + 1) / N_TAPS)), ((i + 1) / N_TAPS) ** shape * norm)
            for i in range(N_TAPS - 1)]
    taps.append((oldest, norm))
    out_l = mix(taps[0::2])
    out_r = mix(taps[1::2])
    a.output(0, dry_l * (1 - wet) + out_l * wet)
    a.output(1, dry_r * (1 - wet) + out_r * wet)
    a.output(2, out_l)                          # OUT2/3: reverb only
    a.output(3, out_r)
