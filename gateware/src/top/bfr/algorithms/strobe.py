"""Strobe: the input caught in flashes, each one ringing out in a metal room.

A pulse train from an LFO: u = (1 + cos) / 2 raised to the 8th, 16th or
32nd power (squared again and again: a pulse narrower each time, `width`
blending them) multiplies the input, so only slices of it get in, `rate`
times a second, like a strobe light on a moving dancer. The slices ring
in a small, bright, very diffuse network (`ring` its decay): a steady
note comes back as a train of pings, a sonar in a tin shed. Nothing goes
in while the input is silent.
"""

from model.lib import allpass, hadamard, lowcut, lowpass, mix, onepole_coef, rt60_gain

NAME = "strobe"
TITLE = "Strobe"
DESCRIPTION = "The input caught in strobe flashes, each slice ringing out: sonar in a tin shed."
PRESETS = [
    ("Sonar", {"rate": 1.5, "width": 0.8, "ring": 3.0, "size": 1.4, "mix": 0.55}),
    ("Stutter", {"rate": 12.0, "width": 0.3, "ring": 0.6, "mix": 0.5}),
    ("Ticks", {"rate": 6.0, "width": 1.0, "ring": 1.5, "tone": 14000.0, "mix": 0.5}),
    ("Slow flash", {"rate": 0.6, "width": 0.0, "ring": 5.0, "size": 2.0, "mix": 0.55}),
    ("Extreme", {"rate": 30.0, "width": 1.0, "ring": 12.0, "size": 2.0, "tone": 18000.0,
                 "mix": 0.9}),
]

LINES_MS = (13.1, 17.9, 23.3, 29.3)
DIFFUSE_MS = (2.3, 3.7, 5.3)


def build(a):
    rate = a.param("rate", 4.0, 0.3, 40.0, "Hz", "log", page="reverb",
                   help="Flashes per second.")
    width = a.param("width", 0.5, 0.0, 1.0, page="reverb",
                    help="How short each flash is: 0 wide slices, 1 tiny clicks.")
    ring = a.param("ring", 2.0, 0.2, 12.0, "s", "log", page="reverb",
                   help="How long each slice rings.")
    wet = a.param("mix", 0.5, 0.0, 1.0, page="reverb",
                  help="Dry signal at 0, the flashes only at 1.")
    size = a.param("size", 1.0, 0.5, 2.0, curve="log", fade_ms=30, page="tone",
                   help="Size of the room the flashes ring in.")
    tone = a.param("tone", 10000.0, 1500.0, 20000.0, "Hz", "log", page="tone",
                   help="Highs above this fade as they ring.")

    lfo = a.lfo(rate)
    u = lfo.cos * 0.5 + 0.5
    u2 = u * u
    u4 = u2 * u2
    u8 = u4 * u4
    u16 = u8 * u8
    u32 = u16 * u16
    # width 0: u^8, 0.5: u^16, 1: u^32 (a parabola through the three)
    pulse = u8 + (u16 - u8) * (width * 2.0) + (u32 - u16 * 2.0 + u8) * (width * width * 2.0 - width)

    dry_l, dry_r = a.input(0), a.input(1)
    x = lowcut(a, (dry_l + dry_r) * 0.5, 120.0, "lowcut") * pulse
    for i, ms in enumerate(DIFFUSE_MS):
        x, _ = allpass(a, x, a.ms(ms) * size, 0.7, f"diffuse{i}")
    lines = [a.delay(f"line{i}") for i in range(len(LINES_MS))]
    k = onepole_coef(a, tone)
    ys = []
    for i, (line, ms) in enumerate(zip(lines, LINES_MS)):
        length = a.ms(ms) * size
        ys.append(lowpass(a, line.tap(length) * rt60_gain(a, length, ring), k, f"damp{i}"))
    for i, (line, m) in enumerate(zip(lines, hadamard(ys))):
        line.write(m + x * (0.5 if i % 2 == 0 else -0.5))

    for c, (dry, part) in enumerate(((dry_l, ys[0::2]), (dry_r, ys[1::2]))):
        wet_sig = mix([(y, 1.4) for y in part])
        a.output(c, dry * (1 - wet) + wet_sig * wet)
        a.output(c + 2, wet_sig)                    # OUT2/3: reverb only
