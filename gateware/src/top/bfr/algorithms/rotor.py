"""Rotor: a rotating speaker in a room.

Our own take on the rotating-speaker cabinet. The input is split at about
800 Hz. The highs go to the "horn": a short block-RAM line whose delay
swings with the rotation (the Doppler shift, `horn`) and a level that
swings with it, heard by two microphones a quarter turn apart (left: sine,
right: cosine). The lows go to the "drum", turning a little slower: only
its level swings (`drum`). Then a small room (`room`, `size`, `decay`)
gives the cabinet a space to sit in. `speed` sets the rotation, from a
slow chorale to a fast tremolo; the horn turns at `speed`, the drum at
0.86 x `speed`, as a cabinet's do.
"""

from model.lib import allpass, hadamard, lowcut, lowpass, mix, onepole_coef, rt60_gain

NAME = "rotor"
TITLE = "Rotor"
DESCRIPTION = "A rotating speaker in a room: a horn and a drum spinning from chorale to tremolo."
PRESETS = [
    ("Chorale", {"speed": 0.8, "horn": 0.7, "drum": 0.4, "room": 0.3, "mix": 0.8}),
    ("Tremolo", {"speed": 6.5, "horn": 0.8, "drum": 0.6, "room": 0.3, "mix": 0.8}),
    ("Gospel hall", {"speed": 5.8, "horn": 0.9, "drum": 0.5, "room": 0.7, "size": 1.6,
                     "decay": 2.5, "mix": 0.85}),
    ("Slow swirl", {"speed": 0.35, "horn": 1.0, "drum": 0.8, "room": 0.5, "mix": 0.9}),
    ("Extreme", {"speed": 8.0, "horn": 1.0, "drum": 1.0, "room": 1.0, "size": 2.0,
                 "decay": 6.0, "mix": 1.0}),
]

CROSSOVER_HZ = 800.0
HORN_MS = 1.6           # the horn's line: the Doppler swing is around this
SWING_MS = 0.8          # its depth at horn 1
ROOM_MS = (19.3, 23.9, 29.1, 34.7)


def build(a):
    speed = a.param("speed", 1.0, 0.3, 8.0, "Hz", "log", page="reverb",
                    help="Rotations per second: under 1 a slow chorale, above 5 a tremolo.")
    horn = a.param("horn", 0.7, 0.0, 1.0, page="reverb",
                   help="How far the horn swings: its pitch wobble and sweep.")
    drum = a.param("drum", 0.5, 0.0, 1.0, page="reverb",
                   help="How far the drum's lows swell and fade as it turns.")
    room = a.param("room", 0.4, 0.0, 1.0, page="reverb",
                   help="Level of the room around the cabinet.")
    wet = a.param("mix", 0.8, 0.0, 1.0, page="reverb",
                  help="Dry signal at 0, the cabinet only at 1.")
    size = a.param("size", 1.0, 0.5, 2.0, curve="log", fade_ms=30, page="tone",
                   help="Size of the room.")
    decay = a.param("decay", 1.2, 0.2, 8.0, "s", "log", page="tone",
                    help="The room's decay time.")
    damping = a.param("damping", 6000.0, 1000.0, 20000.0, "Hz", "log", page="tone",
                      help="Highs above this fade away in the room.")

    horn_lfo = a.lfo(speed)
    drum_lfo = a.lfo(speed * 0.86, phase=0.3)

    dry_l, dry_r = a.input(0), a.input(1)
    x = lowcut(a, (dry_l + dry_r) * 0.5, 40.0, "lowcut")
    k = onepole_coef(a, CROSSOVER_HZ)
    low = lowpass(a, lowpass(a, x, k, "cross1"), k, "cross2")
    high = x - low

    horn_line = a.delay("horn", block_ram=True)
    horn_line.write(high)
    swing = a.ms(SWING_MS) * horn
    cabinet = []
    # (microphones a quarter turn apart: the horn's delay and level, the
    # drum's level, each on the sine for the left, the cosine for the right)
    for h_delay, h_level, d_level in ((horn_lfo.sin, horn_lfo.cos, drum_lfo.sin),
                                      (horn_lfo.cos, horn_lfo.sin * -1.0, drum_lfo.cos)):
        h = horn_line.modtap(a.ms(HORN_MS), swing, h_delay)
        h = h + h * h_level * (horn * 0.6)
        d = low + low * d_level * (drum * 0.7)
        cabinet.append(h + d)

    # The room: a small four-line network fed by both microphones.
    lines = [a.delay(f"room{i}") for i in range(len(ROOM_MS))]
    damp = onepole_coef(a, damping)
    ys = []
    for i, (line, ms) in enumerate(zip(lines, ROOM_MS)):
        length = a.ms(ms) * size
        ys.append(lowpass(a, line.tap(length) * rt60_gain(a, length, decay), damp, f"damp{i}"))
    feed, _ = allpass(a, (cabinet[0] + cabinet[1]) * 0.5, a.ms(5.3), 0.6, "diffuse")
    for i, (line, m) in enumerate(zip(lines, hadamard(ys))):
        line.write(m + feed * (0.5 if i % 2 == 0 else -0.5))

    for c, (dry, part) in enumerate(((dry_l, ys[0::2]), (dry_r, ys[1::2]))):
        wet_sig = cabinet[c] * 0.7 + mix([(y, 0.5) for y in part]) * room
        a.output(c, dry * (1 - wet) + wet_sig * wet)
        a.output(c + 2, wet_sig)                    # OUT2/3: the cabinet alone
