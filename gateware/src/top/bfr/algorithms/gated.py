"""Gated: the '80s drum room, a dense burst that stops dead.

The input is diffused hard and written to a line; the output is 24 taps
spread evenly over `length`, alternating left and right, with gains set by
`shape`: all equal at 0 (a gated room: dense, then nothing), falling to
nothing across the burst at 1 (a "nonlinear" decay, shorter than any
room's), rising at -1 (backwards, as `reverse`). A short allpass after the
taps on each side (`density`) fills the gaps between them; it rings for a
few tens of ms at most, so the burst still ends where `length` says.
"""

from model.lib import allpass, lowcut, lowpass, mix, onepole_coef

NAME = "gated"
TITLE = "Gated"
DESCRIPTION = "The '80s drum room: a dense, bright burst that stops dead, or decays in a hurry."
PRESETS = [
    ("Big snare", {"length": 280.0, "shape": 0.0, "density": 0.7, "tone": 12000.0,
                   "mix": 0.5}),
    ("Nonlinear", {"length": 400.0, "shape": 1.0, "density": 0.6, "mix": 0.45}),
    ("Short gate", {"length": 120.0, "shape": 0.2, "density": 0.75, "mix": 0.4}),
    ("Backwards", {"length": 350.0, "shape": -1.0, "density": 0.6, "mix": 0.5}),
    ("Extreme", {"length": 600.0, "shape": 0.0, "density": 0.85, "tone": 18000.0,
                 "low_cut": 60.0, "mix": 0.9}),
]

N_TAPS = 24
DIFFUSE_MS = (2.9, 4.3, 6.7, 9.1)
POST_MS = (5.3, 6.1)    # left, right
LEVEL = 3.0             # (wet level matched to the other types)


def build(a):
    length = a.param("length", 250.0, 40.0, 600.0, "ms", fade_ms=40, page="reverb",
                     help="How long the burst lasts before it stops.")
    shape = a.param("shape", 0.0, -1.0, 1.0, page="reverb",
                    help="0: even, then gone (gated); 1: falling fast; -1: rising (backwards).")
    density = a.param("density", 0.65, 0.0, 0.85, page="reverb",
                      help="Smearing of the burst: high is a smooth wash, low distinct taps.")
    wet = a.param("mix", 0.45, 0.0, 1.0, page="reverb",
                  help="Dry signal at 0, the burst only at 1.")
    tone = a.param("tone", 10000.0, 1500.0, 20000.0, "Hz", "log", page="tone",
                   help="Highs above this are rolled off: lower is a duller room.")
    low_cut = a.param("low_cut", 120.0, 20.0, 600.0, "Hz", "log", page="tone",
                      help="Removes the lows below this from the burst.")

    dry_l, dry_r = a.input(0), a.input(1)
    x = lowcut(a, (dry_l + dry_r) * 0.5, low_cut, "lowcut")
    x = lowpass(a, x, onepole_coef(a, tone), "tone")
    for i, ms in enumerate(DIFFUSE_MS):
        x, _ = allpass(a, x, a.ms(ms), density, f"diffuse{i}")

    line = a.delay("burst")
    line.write(x)
    n_len = a.ms(length)
    taps = []
    for i in range(N_TAPS):
        t = (i + 1) / N_TAPS
        mid = (i + 0.5) / N_TAPS
        taps.append((line.tap(n_len * t), (1 + shape * (1 - 2 * mid)) * (LEVEL / N_TAPS)))
    for c, (dry, part) in enumerate(((dry_l, taps[0::2]), (dry_r, taps[1::2]))):
        wet_sig, _ = allpass(a, mix(part), a.ms(POST_MS[c]), density * 0.7, f"post{c}")
        a.output(c, dry * (1 - wet) + wet_sig * wet)
        a.output(c + 2, wet_sig)                    # OUT2/3: the burst only
