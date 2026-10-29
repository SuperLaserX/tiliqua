"""Resonator: six tuned combs that ring like strings or bells.

Each comb is a delay line one period of its note long, fed back through a
damping lowpass with the gain that makes it ring for `decay`. Comb k is
tuned to `pitch` plus the chord's k-th interval. The delays are fractional
(an interpolated tap whose fraction is a constant offset) so every comb is
exactly in tune. The input (or a strike, a short noise burst the firmware
fires from its button or a gate, as the spring's kick) excites them all;
even combs lean left, odd right (`spread`).

Chords are selected inside the coefficient math: interval k is the degree-5
polynomial of `chord` through comb k's six intervals (exact at the integer
chords the menu sets, and a few multiplies in the firmware).
"""

import math
from fractions import Fraction

from model.dsl import pm
from model.lib import lowcut, lowpass, onepole_coef, rt60_gain

NAME = "resonator"
TITLE = "Resonator"
DESCRIPTION = "Six tuned strings or bells: whatever comes in rings at a note and chord."
CHORDS = ("unison", "fifths", "major", "minor", "sus4", "cluster")
# Interval of comb k (semitones above `pitch`) per chord; comb 5 is the
# highest (the one short enough for block RAM).
INTERVALS = (
    (0, 0.08, -0.08, 12, 12.08, 24),    # unison: three detuned octaves
    (-12, 0, 7, 12, 19, 24),            # fifths
    (0, 4, 7, 12, 16, 19),              # major
    (0, 3, 7, 12, 15, 19),              # minor
    (0, 5, 7, 12, 17, 19),              # sus4
    (0, 2, 3, 5, 7, 10),                # cluster
)
PRESETS = [
    ("Harp", {"pitch": 45.0, "chord": 2.0, "decay": 3.0, "damping": 6000.0, "mix": 0.5}),
    ("Bells", {"pitch": 52.0, "chord": 1.0, "decay": 8.0, "damping": 11000.0, "mix": 0.5}),
    ("Sitar", {"pitch": 40.0, "chord": 0.0, "decay": 5.0, "damping": 9000.0, "spread": 0.8,
               "mix": 0.55}),
    ("Dark drone", {"pitch": 33.0, "chord": 3.0, "decay": 15.0, "damping": 1500.0,
                    "mix": 0.6}),
    ("Extreme", {"pitch": 45.0, "chord": 5.0, "decay": 20.0, "damping": 12000.0,
                 "low_cut": 40.0, "spread": 1.0, "mix": 0.9}),
]

N_COMBS = 6


def interval_poly(k):
    """Coefficients (highest power first) of the polynomial through comb k's
    intervals at chord = 0..5 (Lagrange, in exact fractions)."""
    n = len(CHORDS)
    total = [Fraction(0)] * n                   # lowest power first
    for i in range(n):
        basis = [Fraction(1)]                   # prod over j != i of (x - j) / (i - j)
        for j in range(n):
            if j != i:
                nb = [Fraction(0)] * (len(basis) + 1)
                for d, b in enumerate(basis):
                    nb[d + 1] += b / (i - j)
                    nb[d] -= b * j / (i - j)
                basis = nb
        for d, b in enumerate(basis):
            total[d] += Fraction(INTERVALS[i][k]) * b
    return [float(c) for c in reversed(total)]


def horner(coefs, x):
    acc = coefs[0]
    for c in coefs[1:]:
        acc = acc * x + c
    return acc
STRIKE_MS = 6.0         # the strike's noise burst falls by 60 dB in this time
STRIKE_LEVEL = 9.0      # and starts at this level (wet peaks about -6 dBFS)
IN_GAIN = 0.3           # the input into the combs, x sqrt(1 - g^2)


def build(a):
    pitch = a.param("pitch", 45.0, 33.0, 57.0, "note", fade_ms=20, page="reverb", step=1.0,
                    help="The note the combs are tuned to (A1 to A3); the chord builds on it.")
    chord = a.param("chord", 2.0, 0.0, float(len(CHORDS) - 1), "|" + "|".join(CHORDS),
                    page="reverb", step=1.0,
                    help="The intervals of the six combs above the note.")
    decay = a.param("decay", 4.0, 0.2, 20.0, "s", "log", page="reverb",
                    help="How long the combs ring: time to fall by 60 dB.")
    wet = a.param("mix", 0.5, 0.0, 1.0, page="reverb",
                  help="Dry signal at 0, the resonance only at 1.")
    damping = a.param("damping", 6000.0, 500.0, 12000.0, "Hz", "log", page="tone",
                      help="Highs above this die away as they ring: lower is softer, like felt.")
    low_cut = a.param("low_cut", 80.0, 20.0, 600.0, "Hz", "log", page="tone",
                      help="Removes the lows below this from what excites the combs.")
    spread = a.param("spread", 0.6, 0.0, 1.0, page="tone",
                     help="How far apart the combs sit left and right.")

    strike = a.trigger("strike", STRIKE_MS, help="Strike the combs: a short noise burst.")
    dry_l, dry_r = a.input(0), a.input(1)
    x = lowcut(a, (dry_l + dry_r) * 0.5, low_cut, "lowcut") + a.noise * strike * STRIKE_LEVEL
    k = onepole_coef(a, damping)
    ys = []
    for i in range(N_COMBS):
        interval = horner(interval_poly(i), chord)
        # one period of the note, in samples, less the damping lowpass's own
        # delay ((1 - k) / k at low frequencies), so the loop is in tune
        period = (a.fs / 440.0) * pm.exp(-(pitch + interval - 69.0) * (math.log(2.0) / 12.0))
        tap = period - (1.0 - k) / k
        whole = pm.floor(tap)
        line = a.delay(f"comb{i}")
        y = line.modtap(whole, tap - whole, a.one, max_depth=1)
        g = rt60_gain(a, period, decay)
        # (input scaled so broadband input rings at about the same level
        # whatever the decay: by sqrt(1 - g^2); a tone right on a comb's note
        # still rings up, as a string does)
        line.write(x * (pm.sqrt(1.0 - g * g) * IN_GAIN) + lowpass(a, y, k, f"damp{i}") * g)
        ys.append(y)

    near, far = 1.0, 1.0 - spread
    out_l = sum((y * (near if i % 2 == 0 else far) for i, y in enumerate(ys)), 0.0 * ys[0])
    out_r = sum((y * (far if i % 2 == 0 else near) for i, y in enumerate(ys)), 0.0 * ys[0])
    a.output(0, dry_l * (1 - wet) + out_l * wet)
    a.output(1, dry_r * (1 - wet) + out_r * wet)
    a.output(2, out_l)                          # OUT2/3: reverb only
    a.output(3, out_r)
