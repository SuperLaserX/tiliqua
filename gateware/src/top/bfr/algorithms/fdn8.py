"""Eight-line feedback delay network with Householder mixing.

The input passes a predelay and four allpass diffusers, then is injected
into eight delay lines with mutually unrelated lengths. Each line has a
lowpass for damping and a gain for its share of the decay time, and the
lines are mixed back into each other by a Householder reflection (lossless,
so the decay is set by the gains alone). Two lines are modulated.
"""

from model.lib import allpass, householder, lowpass, mix, onepole_coef, rt60_gain

NAME = "fdn8"
TITLE = "Hall"
DESCRIPTION = "Eight delay lines feeding each other: rooms to cathedrals by size and decay time."
PRESETS = [
    ("Room", {"size": 0.5, "decay": 0.6, "damping": 7000.0, "predelay": 5.0, "diffusion": 0.7}),
    ("Chamber", {"size": 0.8, "decay": 1.4, "damping": 6000.0, "predelay": 10.0,
                 "diffusion": 0.75}),
    ("Concert hall", {"size": 1.2, "decay": 2.8, "damping": 5500.0, "predelay": 25.0}),
    ("Cathedral", {"size": 2.0, "decay": 8.0, "damping": 4000.0, "predelay": 60.0,
                   "mod_depth": 0.5, "mix": 0.45}),
    ("Extreme", {"size": 2.0, "decay": 30.0, "damping": 14000.0, "predelay": 120.0,
                 "diffusion": 0.85, "mod_depth": 1.0, "mod_rate": 0.6, "mix": 0.85}),
]
LINES_MS = (29.7, 37.1, 41.1, 43.7, 53.3, 61.3, 71.9, 79.3)
DIFFUSE_MS = (4.7, 3.6, 12.7, 9.3)
MODULATED = {0: "sin", 5: "cos"}


def build(a):
    size = a.param("size", 1.0, 0.5, 2.0, curve="log", fade_ms=20, page="reverb",
                   help="Room size: scales every delay line, so echoes spread further apart.")
    decay = a.param("decay", 2.5, 0.2, 30.0, "s", "log", page="reverb",
                    help="Time for the tail to fall by 60 dB, whatever the size.")
    damping = a.param("damping", 6000.0, 500.0, 20000.0, "Hz", "log", page="tone",
                      help="Highs above this decay faster, like soft walls and air.")
    predelay = a.param("predelay", 15.0, 2.0, 250.0, "ms", fade_ms=40, page="reverb",
                       help="Gap before the reverb starts: larger halls have longer gaps.")
    diffusion = a.param("diffusion", 0.6, 0.0, 0.85, page="reverb",
                        help="Smearing of the input: high is a smooth wash, low distinct echoes.")
    mod_depth = a.param("mod_depth", 0.3, 0.0, 1.0, "ms", page="tone",
                        help="How far two of the lines wander: breaks up metallic ringing.")
    mod_rate = a.param("mod_rate", 0.7, 0.05, 5.0, "Hz", "log", page="tone",
                       help="How fast those lines wander.")
    wet = a.param("mix", 0.35, 0.0, 1.0, page="reverb",
                  help="Dry signal at 0, reverb only at 1.")

    dry_l, dry_r = a.input(0), a.input(1)
    pre = a.delay("predelay")
    pre.write((dry_l + dry_r) * 0.5)
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

    for i, (line, m) in enumerate(zip(lines, householder(ys))):
        line.write(m + x * (0.5 if i % 2 == 0 else -0.5))

    for k, (dry, part) in enumerate(((dry_l, ys[0::2]), (dry_r, ys[1::2]))):
        wet_sig = mix([(y, 0.35) for y in part])
        a.output(k, dry * (1 - wet) + wet_sig * wet)
        a.output(k + 2, wet_sig)                # OUT2/3: reverb only
