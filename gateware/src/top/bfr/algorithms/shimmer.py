"""Shimmer: a reverb whose tail is pitch-shifted back into itself.

A four-line feedback network (Hadamard mixing) makes the tail. The pitch
shifter (`model.lib.pitch_shift`, in the block-RAM delay space) is one
element of the loop: the first line's output is crossfaded with its own
pitch-shifted copy (by `shimmer`) before the mixing, which spreads the
shifted sound through every line. So each trip round the loop climbs (or
falls) by the interval: octaves bloom out of the sound. Damping in the loop
keeps the climbing highs from piling up.

Stability: the mixing is unitary, and the crossfade never exceeds the
unshifted line (the shifter is two taps under windows summing to 1, and the
low cut after it doesn't gain), so a trip round the loop can't gain.
Adding a shifted copy of the tail on top of the full recirculation grew
without bound; scaling the recirculation down to make room killed the
decay. The low cut also keeps DC out of the loop (the shifter passes it
unshifted).
"""

from model.lib import allpass, hadamard, lowcut, lowpass, mix, onepole_coef, pitch_shift, rt60_gain


NAME = "shimmer"
TITLE = "Shimmer"
DESCRIPTION = "The tail climbs in pitch as it rings: octaves bloom out of the sound."
PRESETS = [
    ("Octave up", {"interval": 12.0, "shimmer": 0.6, "decay": 6.0}),
    ("Fifth", {"interval": 7.0, "shimmer": 0.6, "decay": 5.0}),
    ("Octave down", {"interval": -12.0, "shimmer": 0.5, "decay": 5.0, "damping": 9000.0}),
    ("Choir", {"interval": 12.0, "shimmer": 0.4, "decay": 9.0, "size": 1.6, "damping": 5000.0,
               "mix": 0.5}),
    ("Extreme", {"interval": 12.0, "shimmer": 1.0, "decay": 30.0, "size": 2.0,
                 "damping": 16000.0, "low_cut": 300.0, "diffusion": 0.85, "mix": 0.85}),
]

LINES_MS = (43.1, 57.7, 67.3, 79.9)
DIFFUSE_MS = (4.1, 6.3, 10.7)
WINDOW = 2000            # pitch shifter window in samples at 48 kHz (42 ms; its line fits 2048 words)


def build(a):
    interval = a.param("interval", 12.0, -12.0, 12.0, "st", page="reverb", step=1.0,
                       help="Pitch step per trip round the reverb, in semitones (12 = octave).")
    shimmer = a.param("shimmer", 0.6, 0.0, 1.0, page="reverb",
                      help="How much of the tail goes round through the pitch shift.")
    decay = a.param("decay", 6.0, 0.5, 30.0, "s", "log", page="reverb",
                    help="Time for the tail to fall by 60 dB.")
    size = a.param("size", 1.0, 0.5, 2.0, curve="log", fade_ms=20, page="reverb",
                   help="Size of the space: bigger spreads its echoes further apart.")
    wet = a.param("mix", 0.4, 0.0, 1.0, page="reverb",
                  help="Dry signal at 0, reverb only at 1.")
    damping = a.param("damping", 7000.0, 1000.0, 20000.0, "Hz", "log", page="tone",
                      help="Highs above this decay faster: tames the climbing octaves.")
    low_cut = a.param("low_cut", 150.0, 20.0, 800.0, "Hz", "log", page="tone",
                      help="Removes the lows below this from the input and the shifted loop.")
    diffusion = a.param("diffusion", 0.65, 0.0, 0.85, page="tone",
                        help="Smearing of the input: high is a smooth wash, low distinct echoes.")

    dry_l, dry_r = a.input(0), a.input(1)
    x = lowcut(a, (dry_l + dry_r) * 0.5, low_cut, "lowcut")
    for i, ms in enumerate(DIFFUSE_MS):
        x, _ = allpass(a, x, a.ms(ms), diffusion, f"diffuse{i}")

    lines = [a.delay(f"line{i}") for i in range(len(LINES_MS))]
    k = onepole_coef(a, damping)
    ys = []
    for i, (line, ms) in enumerate(zip(lines, LINES_MS)):
        length = a.ms(ms) * size
        ys.append(lowpass(a, line.tap(length) * rt60_gain(a, length, decay), k, f"damp{i}"))

    # Line 0 through the shifter (its own short line: at least 2 samples old,
    # so it sits in the loop without a race), crossfaded back in.
    ratio = 2.0 ** (interval / 12.0)
    window = WINDOW * a.fs / 48000.0
    shifted = lowcut(a, pitch_shift(a, ys[0], ratio, window, "shift"), low_cut, "shift_lowcut")
    ring = [ys[0] * (1 - shimmer) + shifted * shimmer] + ys[1:]
    for i, (line, m) in enumerate(zip(lines, hadamard(ring))):
        line.write(m + x * (0.5 if i % 2 == 0 else -0.5))

    for c, (dry, part) in enumerate(((dry_l, ys[0::2]), (dry_r, ys[1::2]))):
        wet_sig = mix([(y, 0.9) for y in part])     # (wet level matched to the other types)
        a.output(c, dry * (1 - wet) + wet_sig * wet)
        a.output(c + 2, wet_sig)                # OUT2/3: reverb only
