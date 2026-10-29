"""Ambient: very long, slowly moving washes, with freeze.

An eight-line Householder network with long lines and heavy diffusion, four
of the lines modulated by two LFOs at unrelated rates, so the tail keeps
drifting instead of ringing. `freeze` holds whatever is in the network:
the loop gain goes to 1 (no damping) and the input is shut off, so the
sound sustains until freeze is released.
"""

from model.lib import allpass, householder, lowcut, lowpass, mix, onepole_coef, rt60_gain

NAME = "ambient"
TITLE = "Ambient"
DESCRIPTION = "Huge, drifting washes that can hold a sound for ever (freeze)."
PRESETS = [
    ("Cloud", {"decay": 15.0, "size": 1.6, "movement": 0.6, "mix": 0.5}),
    ("Pad", {"decay": 30.0, "size": 2.0, "movement": 0.8, "damping": 4000.0, "mix": 0.6}),
    ("Endless", {"decay": 60.0, "size": 2.0, "movement": 0.7, "damping": 5000.0, "mix": 0.6}),
    ("Glass", {"decay": 8.0, "size": 1.0, "damping": 14000.0, "movement": 0.4, "rate": 0.6}),
    ("Extreme", {"decay": 60.0, "size": 2.0, "movement": 1.0, "rate": 1.2, "damping": 16000.0,
                 "low_cut": 40.0, "diffusion": 0.85, "mix": 0.85}),
]

LINES_MS = (67.1, 79.3, 89.9, 101.7, 113.3, 127.1, 139.9, 151.3)
DIFFUSE_MS = (5.3, 7.9, 11.3, 17.9, 23.1)
# Line -> (LFO, part): two LFOs at unrelated rates, quadrature parts.
MODULATED = {0: (0, "sin"), 2: (1, "sin"), 5: (0, "cos"), 7: (1, "cos")}


def build(a):
    decay = a.param("decay", 15.0, 2.0, 60.0, "s", "log", page="reverb",
                    help="Time for the wash to fall by 60 dB.")
    freeze = a.param("freeze", 0.0, 0.0, 1.0, page="reverb", step=1.0,
                     help="1 holds the sound in the reverb for ever and stops new input.")
    size = a.param("size", 1.5, 0.5, 2.0, curve="log", fade_ms=30, page="reverb",
                   help="Size of the space: bigger is slower and wider.")
    movement = a.param("movement", 0.6, 0.0, 1.0, "ms", page="reverb",
                       help="How far the lines drift: shimmering motion, never quite still.")
    wet = a.param("mix", 0.5, 0.0, 1.0, page="reverb",
                  help="Dry signal at 0, wash only at 1.")
    rate = a.param("rate", 0.25, 0.05, 2.0, "Hz", "log", page="tone",
                   help="How fast the lines drift.")
    damping = a.param("damping", 7000.0, 1000.0, 20000.0, "Hz", "log", page="tone",
                      help="Highs above this die away faster (ignored while frozen).")
    low_cut = a.param("low_cut", 100.0, 20.0, 600.0, "Hz", "log", page="tone",
                      help="Removes the lows below this from the wash.")
    diffusion = a.param("diffusion", 0.75, 0.0, 0.85, page="tone",
                        help="Smearing of the input: high is a seamless wash.")

    dry_l, dry_r = a.input(0), a.input(1)
    x = lowcut(a, (dry_l + dry_r) * 0.5, low_cut, "lowcut") * (1 - freeze)
    for i, ms in enumerate(DIFFUSE_MS):
        x, _ = allpass(a, x, a.ms(ms), diffusion, f"diffuse{i}")

    lfos = [a.lfo(rate), a.lfo(rate * 0.618, phase=0.3)]
    # Frozen: no damping (k = 1 passes the signal) and unity loop gain.
    k = onepole_coef(a, damping) * (1 - freeze) + freeze
    lines = [a.delay(f"line{i}") for i in range(len(LINES_MS))]
    ys = []
    for i, (line, ms) in enumerate(zip(lines, LINES_MS)):
        length = a.ms(ms) * size
        if i in MODULATED:
            lfo, part = MODULATED[i]
            t = line.modtap(length, a.ms(movement), getattr(lfos[lfo], part))
        else:
            t = line.tap(length)
        gain = rt60_gain(a, length, decay) * (1 - freeze) + freeze
        ys.append(lowpass(a, t * gain, k, f"damp{i}"))

    for i, (line, m) in enumerate(zip(lines, householder(ys))):
        line.write(m + x * (0.5 if i % 2 == 0 else -0.5))

    for c, (dry, part) in enumerate(((dry_l, ys[0::2]), (dry_r, ys[1::2]))):
        wet_sig = mix([(y, 0.35) for y in part])
        a.output(c, dry * (1 - wet) + wet_sig * wet)
        a.output(c + 2, wet_sig)                # OUT2/3: reverb only
