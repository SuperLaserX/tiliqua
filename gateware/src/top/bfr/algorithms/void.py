"""Void: an enormous dark space that can pull sounds in before it lets go.

A black-hole-style reverb, our own design. The tail is an eight-line
feedback network far larger than the rooms' (lines up to two thirds of a
second at the largest `size`), with decays up to 100 s, input diffusion and
two lines wandering on two LFOs of different rates.

`gravity` bends how sound falls in. At 0 and above, the input goes straight
in (above 0 smeared more on the way). Below 0, it also passes a row of taps
on a line after the predelay with rising gains, the oldest loudest, as in
`reverse`: each sound swells up out of nothing over the swell time before
the tail takes over, as if pulled in. At -1 it is only that swell.
"""

from model.dsl import pm
from model.lib import allpass, householder, lowcut, lowpass, mix, onepole_coef, rt60_gain

NAME = "void"
TITLE = "Void"
DESCRIPTION = "An endless dark space; negative gravity pulls each sound in before it rings."
PRESETS = [
    ("Event horizon", {"size": 3.0, "decay": 40.0, "gravity": -0.6, "mix": 0.6}),
    ("Deep space", {"size": 2.5, "decay": 20.0, "gravity": 0.3, "damping": 5000.0,
                    "mix": 0.5}),
    ("Dark matter", {"size": 2.0, "decay": 15.0, "gravity": 0.0, "damping": 2000.0,
                     "low_cut": 60.0, "mix": 0.5}),
    ("Collapse", {"size": 4.0, "decay": 100.0, "gravity": -1.0, "mod_depth": 1.5,
                     "mix": 0.7}),
    ("Extreme", {"size": 4.0, "decay": 100.0, "gravity": -1.0, "predelay": 300.0,
                 "damping": 12000.0, "low_cut": 30.0, "mod_depth": 2.0, "mod_rate": 0.4,
                 "mix": 0.9}),
]

LINES_MS = (59.3, 71.9, 89.1, 97.3, 113.9, 127.1, 149.3, 163.7)
DIFFUSE_MS = (6.1, 9.7, 14.3, 21.1)
MODULATED = {0: "sin", 5: "cos"}   # (one on each LFO)
N_SWELL = 16
SWELL_MS = 300.0        # the swell's length at size 1


def build(a):
    size = a.param("size", 2.0, 0.5, 4.0, curve="log", fade_ms=40, page="reverb",
                   help="How vast the space is, and how long a negative-gravity swell takes.")
    decay = a.param("decay", 20.0, 1.0, 100.0, "s", "log", page="reverb",
                    help="Time for the tail to fall by 60 dB: at 100 s it barely fades.")
    gravity = a.param("gravity", 0.0, -1.0, 1.0, page="reverb",
                      help="Below 0 sounds swell in from nothing before they ring; above 0 "
                           "they smear in.")
    predelay = a.param("predelay", 20.0, 2.0, 500.0, "ms", "log", fade_ms=40, page="reverb",
                       help="Silence before the space answers.")
    wet = a.param("mix", 0.5, 0.0, 1.0, page="reverb",
                  help="Dry signal at 0, the void only at 1.")
    damping = a.param("damping", 6000.0, 500.0, 20000.0, "Hz", "log", page="tone",
                      help="Highs above this die away each pass: lower is darker and deeper.")
    low_cut = a.param("low_cut", 40.0, 20.0, 600.0, "Hz", "log", page="tone",
                      help="Removes the lows below this before the space.")
    mod_depth = a.param("mod_depth", 0.8, 0.0, 2.0, "ms", page="tone",
                        help="How far two of the lines drift: shimmer and movement in the tail.")
    mod_rate = a.param("mod_rate", 0.3, 0.05, 2.0, "Hz", "log", page="tone",
                       help="How fast those lines drift.")

    pull = pm.max(-gravity, 0.0)        # 0..1: how much of the swell
    push = pm.max(gravity, 0.0)         # 0..1: extra smearing

    dry_l, dry_r = a.input(0), a.input(1)
    pre = a.delay("predelay")
    pre.write(lowcut(a, (dry_l + dry_r) * 0.5, low_cut, "lowcut"))
    direct = pre.tap(a.ms(predelay))
    # The swell: taps over the swell time of a line after the predelay, gains
    # rising to the oldest; summing to about 3 (the swell spreads a sound out,
    # so it would come back much quieter than the direct path).
    after = a.delay("swell")
    after.write(direct)
    n_swell = a.ms(SWELL_MS) * size
    norm = 6.0 / N_SWELL
    swell = mix([(after.tap(n_swell * ((i + 1) / N_SWELL)), ((i + 1) / N_SWELL) * norm)
                 for i in range(N_SWELL)])
    x = direct * (1 - pull) + swell * pull
    for i, ms in enumerate(DIFFUSE_MS):
        x, _ = allpass(a, x, a.ms(ms) * size, 0.6 + push * 0.25, f"diffuse{i}")

    lines = [a.delay(f"line{i}") for i in range(len(LINES_MS))]
    k = onepole_coef(a, damping)
    lfos = (a.lfo(mod_rate), a.lfo(mod_rate * 0.73, phase=0.25))
    ys = []
    for i, (line, ms) in enumerate(zip(lines, LINES_MS)):
        length = a.ms(ms) * size
        if i in MODULATED:
            lfo = lfos[i % 2]
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
