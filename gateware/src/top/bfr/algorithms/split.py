"""Split: a hall whose lows and highs decay at their own rates.

An eight-line network as `space`'s, but each line splits its output at
`crossover` (a one-pole lowpass and what it leaves) and gives each part its
own gain: the lows decay over `decay` x `low_decay`, the highs over `decay`
x `high_decay`. Long warm lows under a short bright top, or the reverse
(a bright, airy tail over a tight bottom). The two parts are complementary,
so the line's gain is never more than the larger of the two and the
network stays stable at any setting.
"""

from model.lib import allpass, householder, lowcut, lowpass, mix, onepole_coef, rt60_gain

NAME = "split"
TITLE = "Split"
DESCRIPTION = "A hall whose lows and highs decay at their own rates: warm and long, or airy and tight."
PRESETS = [
    ("Warm hall", {"decay": 2.5, "low_decay": 2.0, "high_decay": 0.5, "crossover": 500.0,
                   "size": 1.3, "mix": 0.4}),
    ("Airy", {"decay": 2.0, "low_decay": 0.4, "high_decay": 1.4, "crossover": 1200.0,
              "mix": 0.4}),
    ("Tight room", {"decay": 0.7, "low_decay": 0.5, "high_decay": 1.0, "size": 0.6,
                    "predelay": 3.0, "mix": 0.3}),
    ("Rumble", {"decay": 4.0, "low_decay": 3.0, "high_decay": 0.3, "crossover": 250.0,
                "size": 1.8, "mix": 0.5}),
    ("Extreme", {"decay": 10.0, "low_decay": 3.0, "high_decay": 1.5, "crossover": 800.0,
                 "size": 2.0, "diffusion": 0.85, "predelay": 120.0, "mix": 0.85}),
]

LINES_MS = (30.1, 35.3, 40.9, 45.7, 52.1, 59.9, 66.7, 76.1)
DIFFUSE_MS = (4.9, 3.7, 12.1, 9.9)
MODULATED = {1: "sin", 4: "cos"}


def build(a):
    size = a.param("size", 1.0, 0.5, 2.0, curve="log", fade_ms=20, page="reverb",
                   help="Size of the hall.")
    decay = a.param("decay", 2.0, 0.3, 12.0, "s", "log", page="reverb",
                    help="Time for the tail's middle to fall by 60 dB.")
    low_decay = a.param("low_decay", 1.5, 0.25, 4.0, "x", "log", page="reverb",
                        help="The lows' decay time, as a multiple of decay.")
    high_decay = a.param("high_decay", 0.6, 0.1, 2.0, "x", "log", page="reverb",
                         help="The highs' decay time, as a multiple of decay.")
    wet = a.param("mix", 0.4, 0.0, 1.0, page="reverb",
                  help="Dry signal at 0, reverb only at 1.")
    crossover = a.param("crossover", 600.0, 100.0, 4000.0, "Hz", "log", page="tone",
                        help="Where the lows end and the highs begin.")
    predelay = a.param("predelay", 10.0, 2.0, 200.0, "ms", fade_ms=40, page="tone",
                       help="Gap before the reverb starts.")
    diffusion = a.param("diffusion", 0.65, 0.0, 0.85, page="tone",
                        help="Smearing into the tail: high is a smooth wash, low distinct echoes.")
    low_cut = a.param("low_cut", 40.0, 20.0, 400.0, "Hz", "log", page="tone",
                      help="Removes the lows below this from the reverb.")

    lfo = a.lfo(0.6)
    dry_l, dry_r = a.input(0), a.input(1)
    pre = a.delay("predelay")
    pre.write(lowcut(a, (dry_l + dry_r) * 0.5, low_cut, "lowcut"))
    x = pre.tap(a.ms(predelay))
    for i, ms in enumerate(DIFFUSE_MS):
        x, _ = allpass(a, x, a.ms(ms) * size, diffusion, f"diffuse{i}")

    lines = [a.delay(f"line{i}") for i in range(len(LINES_MS))]
    k = onepole_coef(a, crossover)
    ys = []
    for i, (line, ms) in enumerate(zip(lines, LINES_MS)):
        length = a.ms(ms) * size
        if i in MODULATED:
            t = line.modtap(length, a.ms(0.3), getattr(lfo, MODULATED[i]))
        else:
            t = line.tap(length)
        low = lowpass(a, t, k, f"split{i}")
        g_low = rt60_gain(a, length, decay * low_decay)
        g_high = rt60_gain(a, length, decay * high_decay)
        ys.append(low * g_low + (t - low) * g_high)
    for i, (line, m) in enumerate(zip(lines, householder(ys))):
        line.write(m + x * (0.5 if i % 2 == 0 else -0.5))

    for c, (dry, part) in enumerate(((dry_l, ys[0::2]), (dry_r, ys[1::2]))):
        wet_sig = mix([(y, 0.35) for y in part])
        a.output(c, dry * (1 - wet) + wet_sig * wet)
        a.output(c + 2, wet_sig)                    # OUT2/3: reverb only
