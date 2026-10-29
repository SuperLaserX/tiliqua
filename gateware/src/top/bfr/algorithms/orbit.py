"""Orbit: the sound circling the listener, near or far.

A source on a circle round the listener's head: the input after its time
of flight (`distance` / 343 m/s, crossfaded), and part of the reverb. Its
position is an LFO's phase: `direction` left or right turns it in the
horizontal plane, up or down in the vertical one (front, overhead, behind,
below). What a stereo pair can carry of where it is:

- side to side: the far ear hears it up to 0.35 ms later (a modulated tap
  per ear on a block-RAM line) and quieter, and duller (head shadow: a
  one-pole whose coefficient the position moves, a signal times a signal);
- front and back: behind, it is darker for both ears;
- up and down: above, brighter; below, darker, with a short floor bounce;
- distance: quieter as 1/distance, darker (air absorption), later, and
  more of it is the room's diffuse tail, which stays where it is.

`width` scales the ear cues (0: the source moves only in tone and level).
"""

from model.dsl import pm
from model.lib import allpass, householder, lowcut, lowpass, mix, onepole_coef, rt60_gain

NAME = "orbit"
TITLE = "Orbit"
DESCRIPTION = "The sound circles your head, left or right, over or under, near or far away."
PRESETS = [
    ("Close orbit", {"direction": 1.0, "rate": 0.3, "distance": 1.0, "room": 0.3, "mix": 0.8}),
    ("Overhead", {"direction": 2.0, "rate": 0.2, "distance": 2.0, "room": 0.4, "mix": 0.8}),
    ("Carousel", {"direction": 0.0, "rate": 1.2, "distance": 3.0, "room": 0.5, "decay": 2.0,
                  "mix": 0.85}),
    ("Distant moon", {"direction": 1.0, "rate": 0.08, "distance": 15.0, "room": 0.7,
                      "decay": 4.0, "size": 1.8, "mix": 0.9}),
    ("Extreme", {"direction": 3.0, "rate": 3.0, "distance": 6.0, "width": 1.0, "room": 1.0,
                 "decay": 8.0, "size": 2.0, "mix": 1.0}),
]

LINES_MS = (27.1, 31.9, 38.3, 42.7, 49.1, 55.3, 61.9, 70.3)
DIFFUSE_MS = (3.7, 5.9)
EAR_MS = 0.6            # the ears' line: interaural delays swing around this
ITD_MS = 0.35           # the largest interaural delay
FLOOR_MS = 1.6          # a floor bounce, heard from below


def build(a):
    direction = a.param("direction", 1.0, 0.0, 3.0, "|left|right|up|down", step=1.0,
                        page="reverb", help="Which way it turns: left or right round you, "
                        "up over or down under your head.")
    rate = a.param("rate", 0.25, 0.03, 4.0, "Hz", "log", page="reverb",
                   help="Turns per second.")
    distance = a.param("distance", 2.0, 0.5, 20.0, "m", "log", fade_ms=60, page="reverb",
                       help="How far away it circles: farther is quieter, darker and later.")
    room = a.param("room", 0.4, 0.0, 1.0, page="reverb",
                   help="Level of the room's tail around you, which doesn't move.")
    wet = a.param("mix", 0.8, 0.0, 1.0, page="reverb",
                  help="Dry signal at 0, the circling sound and room only at 1.")
    width = a.param("width", 0.8, 0.0, 1.0, page="tone",
                    help="How strongly each ear hears where it is: delay, level, shadow.")
    size = a.param("size", 1.0, 0.5, 2.0, curve="log", fade_ms=30, page="tone",
                   help="Size of the room.")
    decay = a.param("decay", 1.5, 0.3, 10.0, "s", "log", page="tone",
                    help="The room's decay time.")
    damping = a.param("damping", 7000.0, 1000.0, 20000.0, "Hz", "log", page="tone",
                      help="Highs above this fade away in the room.")

    # The turn: left/right (0/1) in the horizontal plane, up/down (2/3) in
    # the vertical; the sign of the rate is the direction.
    horizontal = pm.max(0.0, 1.0 - pm.floor(direction * 0.5))
    sign = 2.0 - 2.0 * pm.abs(direction - 1.5)
    turn = a.lfo(rate * sign)
    side = turn.sin * horizontal                    # right +1, left -1
    front = turn.cos                                 # front +1, behind -1
    up = turn.sin * (1.0 - horizontal)              # above +1, below -1

    dry_l, dry_r = a.input(0), a.input(1)
    pre = a.delay("flight")
    pre.write(lowcut(a, (dry_l + dry_r) * 0.5, 60.0, "lowcut"))
    near = pre.tap(a.ms(distance * (1000.0 / 343.0)))
    near = lowpass(a, near, onepole_coef(a, 18000.0 / (1.0 + distance * 0.3)), "air")

    # The room: diffuse, where it is.
    x = near
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
    tails = [mix([(y, 0.35) for y in part]) for part in (ys[0::2], ys[1::2])]

    # The source: the sound itself (1/distance) and some of the tail, with
    # a floor bounce from below.
    source = near * (1.0 / (0.5 + 0.5 * distance)) + (tails[0] + tails[1]) * 0.2
    floor = a.delay("floor", block_ram=True)
    floor.write(source)
    source = source + floor.tap(a.ms(FLOOR_MS)) * (up * -0.2 + 0.2)
    ears = a.delay("ears", block_ram=True)
    ears.write(source)
    brightness = front * 0.3 + up * 0.2 + 0.7
    k_ear = onepole_coef(a, 6000.0)
    for c, (dry, lean) in enumerate(((dry_l, -1.0), (dry_r, 1.0))):
        # (this ear's side: the source on it is louder, earlier, brighter)
        toward = side * lean
        heard = ears.modtap(a.ms(EAR_MS), a.ms(ITD_MS) * width, side * -lean)
        st = a.state(f"shadow{c}")
        shade = brightness * (toward * (0.4 * width) + 1.0)
        y = st.prev + (heard - st.prev) * (shade * k_ear)
        st.write(y)
        wet_sig = (y * (toward * (0.35 * width) + 0.65) + tails[c] * room) * 1.8
        a.output(c, dry * (1 - wet) + wet_sig * wet)
        a.output(c + 2, wet_sig)                    # OUT2/3: reverb only
