"""Vowel: a reverb that talks.

The tail passes three formant resonators per side (two-pole bandpasses at
a vowel's first three formants, each normalised to unity at its peak), so
the reverb says a, e, i, o or u. `vowel` slides between them (0 a, 1 e,
2 i, 3 o, 4 u; each formant interpolated linearly between neighbours), so
a CV or the input's level on it makes the room speak as you play. `mouth`
is the formants' bandwidth (narrow: whistling, wide: breathy), `voice` how
much of the tail is voiced.
"""

import math

from model.dsl import pm
from model.lib import allpass, householder, lowcut, lowpass, mix, onepole_coef, rt60_gain

NAME = "vowel"
TITLE = "Vowel"
DESCRIPTION = "A reverb that talks: formants say a, e, i, o, u, sliding between them."
PRESETS = [
    ("Ahh", {"vowel": 0.0, "voice": 0.8, "decay": 3.0, "mix": 0.5}),
    ("Eee", {"vowel": 2.0, "voice": 0.8, "mouth": 60.0, "mix": 0.5}),
    ("Ooh hall", {"vowel": 3.5, "voice": 0.7, "decay": 6.0, "size": 1.6, "mix": 0.5}),
    ("Whisper", {"vowel": 1.0, "voice": 0.6, "mouth": 250.0, "damping": 12000.0, "mix": 0.45}),
    ("Extreme", {"vowel": 4.0, "voice": 1.0, "mouth": 40.0, "decay": 15.0, "size": 2.0,
                 "damping": 16000.0, "mix": 0.9}),
]

# First three formants (Hz) of a, e, i, o, u.
FORMANTS = ((730, 1090, 2440), (530, 1840, 2480), (270, 2290, 3010), (570, 840, 2410),
            (300, 870, 2240))
LINES_MS = (31.3, 36.7, 41.9, 47.1, 53.9, 59.3, 66.1, 72.7)
DIFFUSE_MS = (4.3, 6.7)


def formant(vowel, n):
    """Formant n's frequency at `vowel` (0..4), linear between the vowels."""
    return mix_p([(FORMANTS[v][n], pm.max(0.0, 1.0 - pm.abs(vowel - v))) for v in range(5)])


def mix_p(pairs):
    out = 0.0
    for c, w in pairs:
        out = out + w * c
    return out


def resonator(a, x, hz, bw, name):
    """Two-pole bandpass at `hz`, bandwidth `bw` Hz, unity at its peak."""
    r = pm.exp(-math.pi * bw / a.fs)
    th = 2.0 * math.pi * hz / a.fs
    y1, y2 = a.state(f"{name}a"), a.state(f"{name}b")
    y = x * ((1.0 - r) * 2.0 * pm.sin(th)) + y1.prev * (2.0 * r * pm.cos(th)) - y2.prev * (r * r)
    y2.write(y1.prev)
    y1.write(y)
    return y


def build(a):
    vowel = a.param("vowel", 0.0, 0.0, 4.0, step=0.05, page="reverb",
                    help="Which vowel: 0 a, 1 e, 2 i, 3 o, 4 u, sliding between them.")
    voice = a.param("voice", 0.75, 0.0, 1.0, page="reverb",
                    help="How much of the tail is voiced: 1 is all vowel.")
    mouth = a.param("mouth", 100.0, 40.0, 300.0, "Hz", "log", page="reverb",
                    help="The formants' width: narrow whistles, wide breathes.")
    decay = a.param("decay", 3.0, 0.3, 15.0, "s", "log", page="reverb",
                    help="Time for the tail to fall by 60 dB.")
    wet = a.param("mix", 0.5, 0.0, 1.0, page="reverb",
                  help="Dry signal at 0, the talking tail only at 1.")
    size = a.param("size", 1.0, 0.5, 2.0, curve="log", fade_ms=30, page="tone",
                   help="Size of the space.")
    damping = a.param("damping", 9000.0, 1000.0, 20000.0, "Hz", "log", page="tone",
                      help="Highs above this fade away in the tail.")

    dry_l, dry_r = a.input(0), a.input(1)
    pre = a.delay("predelay")
    pre.write(lowcut(a, (dry_l + dry_r) * 0.5, 80.0, "lowcut"))
    x = pre.tap(a.ms(8.0))
    for i, ms in enumerate(DIFFUSE_MS):
        x, _ = allpass(a, x, a.ms(ms), 0.6, f"diffuse{i}")
    lines = [a.delay(f"line{i}") for i in range(len(LINES_MS))]
    k = onepole_coef(a, damping)
    ys = []
    for i, (line, ms) in enumerate(zip(lines, LINES_MS)):
        length = a.ms(ms) * size
        ys.append(lowpass(a, line.tap(length) * rt60_gain(a, length, decay), k, f"damp{i}"))
    for i, (line, m) in enumerate(zip(lines, householder(ys))):
        line.write(m + x * (0.5 if i % 2 == 0 else -0.5))

    gains = (1.0, 0.7, 0.45)                    # (the higher formants quieter)
    for c, (dry, part) in enumerate(((dry_l, ys[0::2]), (dry_r, ys[1::2]))):
        tail = mix([(y, 0.35) for y in part])
        spoken = mix([(resonator(a, tail, formant(vowel, n), mouth * (1 + n * 0.5), f"f{c}{n}"),
                       g * 1.6) for n, g in enumerate(gains)])
        wet_sig = (tail * (1.0 - voice) + spoken * voice) * 1.25
        a.output(c, dry * (1 - wet) + wet_sig * wet)
        a.output(c + 2, wet_sig)                    # OUT2/3: reverb only
