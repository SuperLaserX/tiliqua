"""Bloom: a few echoes that fill into a dense wash.

After the predelay, the input passes four long allpasses in series (tens to
hundreds of ms, scaled by `size`) before it reaches an eight-line feedback
network. An allpass this long doesn't blur a sound, it repeats it: each one
answers with a train of echoes, and each further one multiplies them, so a
note comes back as a few distinct repeats that grow denser and denser
(`bloom`, their feedback, sets how slowly) while the network turns them into
a tail. The network is `space`'s: Householder mixing, damping, a gain per
line for the decay time, two lines modulated.
"""

from model.lib import allpass, householder, lowcut, lowpass, mix, onepole_coef, rt60_gain

NAME = "bloom"
TITLE = "Bloom"
DESCRIPTION = "A few echoes that fill and fill into a dense wash: sounds bloom into the tail."
PRESETS = [
    ("Slow bloom", {"bloom": 0.7, "size": 1.2, "decay": 6.0, "predelay": 20.0, "mix": 0.45}),
    ("Echo cloud", {"bloom": 0.8, "size": 1.8, "decay": 4.0, "damping": 6000.0, "mix": 0.5}),
    ("Soft room", {"bloom": 0.45, "size": 0.7, "decay": 1.8, "predelay": 8.0, "mix": 0.35}),
    ("Night garden", {"bloom": 0.75, "size": 1.5, "decay": 12.0, "damping": 4000.0,
                      "mod_depth": 0.7, "mix": 0.5}),
    ("Extreme", {"bloom": 0.85, "size": 2.0, "decay": 30.0, "predelay": 120.0,
                 "damping": 14000.0, "low_cut": 40.0, "mod_depth": 1.0, "mod_rate": 0.5,
                 "mix": 0.85}),
]

BLOOM_MS = (47.3, 79.1, 131.7, 193.9)
LINES_MS = (31.3, 37.9, 43.1, 47.9, 57.1, 63.7, 73.3, 83.9)
MODULATED = {1: "sin", 6: "cos"}


def build(a):
    bloom = a.param("bloom", 0.65, 0.3, 0.85, page="reverb",
                    help="How slowly the echoes fill in: higher starts sparser and blooms longer.")
    size = a.param("size", 1.0, 0.5, 2.0, curve="log", fade_ms=30, page="reverb",
                   help="Spacing of the first echoes and the size of the space they fill.")
    decay = a.param("decay", 5.0, 0.5, 30.0, "s", "log", page="reverb",
                    help="Time for the tail to fall by 60 dB.")
    predelay = a.param("predelay", 15.0, 2.0, 250.0, "ms", fade_ms=40, page="reverb",
                       help="Silence before the first echo.")
    wet = a.param("mix", 0.4, 0.0, 1.0, page="reverb",
                  help="Dry signal at 0, bloom only at 1.")
    damping = a.param("damping", 7000.0, 1000.0, 20000.0, "Hz", "log", page="tone",
                      help="Highs above this fade away in the tail: lower is darker.")
    low_cut = a.param("low_cut", 100.0, 20.0, 600.0, "Hz", "log", page="tone",
                      help="Removes the lows below this before the echoes.")
    mod_depth = a.param("mod_depth", 0.4, 0.0, 1.0, "ms", page="tone",
                        help="How far two lines of the tail wander: a gentle chorus.")
    mod_rate = a.param("mod_rate", 0.5, 0.05, 3.0, "Hz", "log", page="tone",
                       help="How fast those lines wander.")

    dry_l, dry_r = a.input(0), a.input(1)
    pre = a.delay("predelay")
    pre.write(lowcut(a, (dry_l + dry_r) * 0.5, low_cut, "lowcut"))
    x = pre.tap(a.ms(predelay))
    for i, ms in enumerate(BLOOM_MS):
        x, _ = allpass(a, x, a.ms(ms) * size, bloom, f"bloom{i}")

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
    for i, (line, m) in enumerate(zip(lines, householder(ys))):
        line.write(m + x * (0.5 if i % 2 == 0 else -0.5))

    for c, (dry, part) in enumerate(((dry_l, ys[0::2]), (dry_r, ys[1::2]))):
        wet_sig = mix([(y, 0.4) for y in part])     # (wet level matched to the other types)
        a.output(c, dry * (1 - wet) + wet_sig * wet)
        a.output(c + 2, wet_sig)                    # OUT2/3: reverb only
