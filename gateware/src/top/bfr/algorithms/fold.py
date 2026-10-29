"""Fold: a reverb whose tail is distorted and wavefolded as it rings.

The folding is `lib.SineShaper`: y = sin(drive x), a smooth saturation at a
low drive and, past pi/2, a wavefolder (the wave turns back on itself, and
again, adding bright harmonics). Two places:

- inside the network, on two of its eight lines: sin(k x) / k with k from
  1 up to `drive` as `inside` goes 0 to 1. |sin(k x) / k| <= |x|, so each
  line's gain stays below its linear one and the network can't grow; each
  pass round the loop folds the tail again, so it roughens as it rings,
  and cleans up as it falls below the folds;
- on the tail's way out, at `drive`, with `symmetry` offsetting it first
  (even harmonics; the offset's own output is removed), then `tone`.

The output is scaled so a low drive and a high one sound about as loud.
"""

from model.dsl import pm
from model.lib import (SineShaper, allpass, householder, lowcut, lowpass, mix, onepole_coef,
                       rt60_gain)

NAME = "fold"
TITLE = "Fold"
DESCRIPTION = "A reverb tail that distorts and wavefolds as it rings, from warm grit to buzzing."
PRESETS = [
    ("Warm grit", {"drive": 1.2, "inside": 0.2, "tone": 6000.0, "mix": 0.4}),
    ("Folded hall", {"drive": 6.0, "inside": 0.5, "decay": 3.0, "size": 1.4, "mix": 0.45}),
    ("Buzz cloud", {"drive": 14.0, "inside": 0.8, "symmetry": 0.3, "decay": 5.0,
                    "tone": 9000.0, "mix": 0.5}),
    ("Broken tape", {"drive": 3.0, "inside": 1.0, "symmetry": -0.4, "damping": 3000.0,
                     "tone": 3500.0, "mix": 0.5}),
    ("Extreme", {"drive": 24.0, "inside": 1.0, "symmetry": 0.5, "decay": 12.0, "size": 2.0,
                 "tone": 16000.0, "damping": 14000.0, "mix": 0.85}),
]

LINES_MS = (29.9, 34.7, 40.3, 46.1, 52.7, 58.3, 65.9, 73.1)
DIFFUSE_MS = (4.1, 6.3, 9.7)
FOLDED = (0, 5)             # the lines folded inside the loop


def build(a):
    drive = a.param("drive", 4.0, 0.5, 24.0, curve="log", page="reverb",
                    help="How hard the tail is pushed: warm grit low, folding over and over high.")
    inside = a.param("inside", 0.4, 0.0, 1.0, page="reverb",
                     help="How much it folds inside the reverb too, getting rougher as it rings.")
    symmetry = a.param("symmetry", 0.0, -0.5, 0.5, page="reverb",
                       help="Offsets the fold: off centre adds a hollow, even-harmonic edge.")
    decay = a.param("decay", 2.5, 0.3, 15.0, "s", "log", page="reverb",
                    help="Time for the tail to fall by 60 dB.")
    wet = a.param("mix", 0.45, 0.0, 1.0, page="reverb",
                  help="Dry signal at 0, the folded tail only at 1.")
    tone = a.param("tone", 8000.0, 1000.0, 20000.0, "Hz", "log", page="tone",
                   help="Softens the folded highs on the way out.")
    size = a.param("size", 1.0, 0.5, 2.0, curve="log", fade_ms=30, page="tone",
                   help="Size of the space.")
    damping = a.param("damping", 7000.0, 1000.0, 20000.0, "Hz", "log", page="tone",
                      help="Highs above this fade away inside the reverb.")

    shaper = SineShaper(a, "fold")
    k_loop = 1.0 + inside * (drive - 1.0)

    dry_l, dry_r = a.input(0), a.input(1)
    pre = a.delay("predelay")
    pre.write(lowcut(a, (dry_l + dry_r) * 0.5, 80.0, "lowcut"))
    x = pre.tap(a.ms(10.0))
    for i, ms in enumerate(DIFFUSE_MS):
        x, _ = allpass(a, x, a.ms(ms) * size, 0.6, f"diffuse{i}")

    lines = [a.delay(f"line{i}") for i in range(len(LINES_MS))]
    k = onepole_coef(a, damping)
    ys = []
    for i, (line, ms) in enumerate(zip(lines, LINES_MS)):
        length = a.ms(ms) * size
        y = lowpass(a, line.tap(length) * rt60_gain(a, length, decay), k, f"damp{i}")
        if i in FOLDED:
            s, _ = shaper(y, k_loop)
            y = s * (1.0 / k_loop)
        ys.append(y)
    for i, (line, m) in enumerate(zip(lines, householder(ys))):
        line.write(m + x * (0.5 if i % 2 == 0 else -0.5))

    level = 0.5 / (1.0 - pm.exp(drive * -0.5))
    bias = pm.sin(drive * symmetry)
    kt = onepole_coef(a, tone)
    for c, (dry, part) in enumerate(((dry_l, ys[0::2]), (dry_r, ys[1::2]))):
        tail = mix([(y, 0.35) for y in part])
        s, _ = shaper(tail + symmetry, drive)
        folded = lowpass(a, (s - bias) * level, kt, f"tone{c}")
        wet_sig = lowcut(a, folded, 20.0, f"dc{c}")
        a.output(c, dry * (1 - wet) + wet_sig * wet)
        a.output(c + 2, wet_sig)                    # OUT2/3: reverb only
