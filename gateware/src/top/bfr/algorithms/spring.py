"""Spring tank, after Välimäki, Parker and Abel, "Parametric spring
reverberation effect" (JAES, 2010), much simplified.

A spring disperses: high frequencies travel at a different speed from low
ones, so each echo arrives smeared into a chirp. Each spring here is a loop:
a chain of stretched allpasses (the dispersion; `tension` sets how strong),
a damping lowpass, and a delay of one transit along the spring with the
decay gain. Two springs of slightly different length, panned apart, each
fed by the input through a low cut.

The kick is what hitting the tank does: a short burst of noise (a trigger
the firmware fires from its menu button or a gate on a CV input) straight
into both springs, which disperse it into the classic metallic crash.

The allpass chains live in the block-RAM delay space (their lines are a few
samples long); the transit delays are in PSRAM.
"""

from model.lib import lowcut, lowpass, onepole_coef, rt60_gain, stretched_allpass

NAME = "spring"
TITLE = "Spring"
DESCRIPTION = "A spring tank: bouncy, chirping echoes, like a guitar amp's reverb."
PRESETS = [
    ("Amp spring", {"length": 33.0, "decay": 1.8, "tension": 0.6, "damping": 4500.0,
                    "spread": 0.12, "mix": 0.3}),
    ("Surf", {"length": 45.0, "decay": 3.0, "tension": 0.72, "damping": 6000.0,
              "spread": 0.18, "mix": 0.45}),
    ("Dark tank", {"length": 55.0, "decay": 2.5, "tension": 0.5, "damping": 2200.0,
                   "spread": 0.08, "mix": 0.35}),
    ("Short spring", {"length": 20.0, "decay": 0.9, "tension": 0.65, "damping": 5000.0,
                      "mix": 0.3}),
    ("Extreme", {"length": 70.0, "decay": 8.0, "tension": 0.8, "damping": 12000.0,
                 "low_cut": 200.0, "spread": 0.04, "mix": 0.85}),
]

STAGES = 36             # dispersion allpasses per spring
STRETCH = (1, 1, 2)     # their lengths in samples, in a repeating pattern
KICK_MS = 20.0          # the kick's noise burst falls by 60 dB in this time
KICK_LEVEL = 1.1        # and starts at this level (a wet peak near -6 dBFS)


def build(a):
    length = a.param("length", 35.0, 15.0, 80.0, "ms", fade_ms=30, page="reverb",
                     help="Time for a wave to cross the spring: the spacing of its echoes.")
    decay = a.param("decay", 2.0, 0.3, 8.0, "s", "log", page="reverb",
                    help="Time for the bouncing to fall by 60 dB.")
    tension = a.param("tension", 0.6, 0.2, 0.8, page="reverb",
                      help="How much each echo is smeared into a chirp: the 'drip' of a spring.")
    wet = a.param("mix", 0.35, 0.0, 1.0, page="reverb",
                  help="Dry signal at 0, spring only at 1.")
    damping = a.param("damping", 4500.0, 800.0, 12000.0, "Hz", "log", page="tone",
                      help="Highs above this die away each trip: lower is a darker tank.")
    low_cut = a.param("low_cut", 120.0, 30.0, 600.0, "Hz", "log", page="tone",
                      help="Removes the lows below this before the springs: less boom.")
    spread = a.param("spread", 0.12, 0.0, 0.3, page="tone",
                     help="How much the two springs differ in length: wider, less metallic.")

    dry_l, dry_r = a.input(0), a.input(1)
    kick = a.trigger("kick", KICK_MS, help="Hit the tank: a crash through both springs.")
    x_in = lowcut(a, (dry_l + dry_r) * 0.5, low_cut, "lowcut") + a.noise * kick * KICK_LEVEL
    k = onepole_coef(a, damping)
    outs = []
    for s, scale in enumerate((1 - spread * 0.5, 1 + spread * 0.5)):
        loop = a.delay(f"spring{s}")
        transit = a.ms(length) * scale
        fb = loop.tap(transit) * rt60_gain(a, transit, decay)
        x = x_in * 0.5 + fb
        for i in range(STAGES):
            x = stretched_allpass(a, x, STRETCH[(i + s) % len(STRETCH)], tension, f"s{s}_ap{i}")
        y = lowpass(a, x, k, f"s{s}_damp")
        loop.write(y)
        outs.append(y)

    # (wet level matched to the other types)
    out_l, out_r = outs[0] * 1.3 + outs[1] * 0.32, outs[1] * 1.3 + outs[0] * 0.32
    a.output(0, dry_l * (1 - wet) + out_l * wet)
    a.output(1, dry_r * (1 - wet) + out_r * wet)
    a.output(2, out_l)                          # OUT2/3: reverb only
    a.output(3, out_r)
