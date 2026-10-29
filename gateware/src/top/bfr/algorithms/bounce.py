"""Bounce: echoes that come faster and faster, like a dropped ball.

Sixteen taps of one line: the first after `time`, each next interval
`bounce` times the last (under 1 they shorten, a ball settling; above 1
they lengthen, a ball thrown up a stair), each tap `loss` times quieter
than the one before, alternating sides by `spread`. Then a small room
(`room`) blurs the bounces into a space. The taps' times follow `time`
crossfaded; `bounce` moves them at once.
"""

from model.lib import allpass, hadamard, lowcut, lowpass, mix, onepole_coef, rt60_gain

NAME = "bounce"
TITLE = "Bounce"
DESCRIPTION = "Echoes that speed up like a dropped ball settling, or slow down, then a small room."
PRESETS = [
    ("Ping pong ball", {"time": 300.0, "bounce": 0.78, "loss": 0.85, "spread": 1.0, "mix": 0.45}),
    ("Marble", {"time": 120.0, "bounce": 0.85, "loss": 0.9, "tone": 12000.0, "mix": 0.4}),
    ("Stairs", {"time": 90.0, "bounce": 1.08, "loss": 0.88, "room": 0.5, "mix": 0.45}),
    ("Basketball", {"time": 450.0, "bounce": 0.7, "loss": 0.75, "tone": 3000.0, "room": 0.6,
                    "mix": 0.5}),
    ("Extreme", {"time": 500.0, "bounce": 0.92, "loss": 0.95, "spread": 1.0, "room": 1.0,
                 "tone": 16000.0, "mix": 0.9}),
]

N_TAPS = 16
ROOM_MS = (17.3, 21.1, 25.9, 31.7)


def build(a):
    time = a.param("time", 250.0, 40.0, 500.0, "ms", "log", fade_ms=60, page="reverb",
                   help="Time to the first bounce.")
    bounce = a.param("bounce", 0.8, 0.55, 1.1, page="reverb",
                     help="Each interval this times the last: under 1 faster and faster.")
    loss = a.param("loss", 0.85, 0.4, 0.95, page="reverb",
                   help="Each bounce this much as loud as the one before.")
    spread = a.param("spread", 0.7, 0.0, 1.0, page="reverb",
                     help="How far the bounces alternate from side to side.")
    wet = a.param("mix", 0.45, 0.0, 1.0, page="reverb",
                  help="Dry signal at 0, the bounces only at 1.")
    room = a.param("room", 0.3, 0.0, 1.0, page="tone",
                   help="How much of a small room blurs the bounces.")
    tone = a.param("tone", 8000.0, 1000.0, 20000.0, "Hz", "log", page="tone",
                   help="Highs above this are rolled off.")

    dry_l, dry_r = a.input(0), a.input(1)
    x = lowpass(a, lowcut(a, (dry_l + dry_r) * 0.5, 60.0, "lowcut"), onepole_coef(a, tone), "tone")
    line = a.delay("bounces")
    line.write(x)
    at, step, gain = 0.0, a.ms(time), 1.0
    sides = ([], [])
    for i in range(N_TAPS):
        at = at + step
        step = step * bounce
        gain = gain * loss
        t = line.tap(at)
        side = i % 2
        sides[side].append((t, gain * (0.5 + 0.5 * spread)))
        sides[1 - side].append((t, gain * (0.5 - 0.5 * spread)))
    outs = [mix(s) for s in sides]

    # A small room round the bounces.
    feed, _ = allpass(a, (outs[0] + outs[1]) * 0.5, a.ms(4.7), 0.6, "diffuse")
    lines = [a.delay(f"room{i}") for i in range(len(ROOM_MS))]
    k = onepole_coef(a, 6000.0)
    ys = []
    for i, (rl, ms) in enumerate(zip(lines, ROOM_MS)):
        ys.append(lowpass(a, rl.tap(a.ms(ms)) * rt60_gain(a, a.ms(ms), 0.8), k, f"damp{i}"))
    for i, (rl, m) in enumerate(zip(lines, hadamard(ys))):
        rl.write(m + feed * (0.5 if i % 2 == 0 else -0.5))

    for c, (dry, part) in enumerate(((dry_l, ys[0::2]), (dry_r, ys[1::2]))):
        wet_sig = outs[c] * 0.8 + mix([(y, 0.6) for y in part]) * room
        a.output(c, dry * (1 - wet) + wet_sig * wet)
        a.output(c + 2, wet_sig)                    # OUT2/3: reverb only
