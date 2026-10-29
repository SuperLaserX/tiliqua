"""Ensemble: a lush room where everything moves.

Every path wanders a little, as a section of players never quite agrees.
The input's diffusers are four allpasses in block RAM whose delays move on
two LFOs in quadrature (four phases), so the early smear is already a
chorus. An eight-line network makes the tail, two of its lines drifting as
well. Then three chorus voices read the tail back from a short block-RAM
line at slowly moving delays, one each side and one in the middle, and
thicken it the way slightly detuned players thicken a note. `chorus` sets
how far all of it moves, `rate` how fast; `voices` the voices' level.
"""

from model.lib import allpass, householder, lowcut, lowpass, mix, onepole_coef, rt60_gain

NAME = "ensemble"
TITLE = "Ensemble"
DESCRIPTION = "A lush room where everything moves: chorused diffusion and a thick, detuned tail."
PRESETS = [
    ("Strings", {"size": 1.2, "decay": 3.0, "chorus": 0.5, "rate": 0.6, "voices": 0.5,
                 "mix": 0.4}),
    ("Choir loft", {"size": 1.6, "decay": 5.0, "chorus": 0.4, "rate": 0.35, "voices": 0.7,
                    "damping": 6000.0, "predelay": 30.0, "mix": 0.45}),
    ("Velvet", {"size": 0.8, "decay": 1.6, "chorus": 0.7, "rate": 1.2, "voices": 0.4,
                "damping": 5000.0, "mix": 0.35}),
    ("Seasick", {"size": 1.0, "decay": 2.5, "chorus": 1.0, "rate": 3.0, "voices": 0.8,
                 "mix": 0.5}),
    ("Extreme", {"size": 2.0, "decay": 15.0, "chorus": 1.0, "rate": 1.8, "voices": 1.0,
                 "damping": 14000.0, "low_cut": 40.0, "predelay": 120.0, "mix": 0.85}),
]

DIFFUSE_MS = (2.3, 3.4, 4.9, 6.1)               # in block RAM, chorused
LINES_MS = (31.7, 36.1, 41.3, 47.9, 53.9, 60.7, 67.1, 74.3)
MODULATED = {2: 1, 7: 3}                        # line: phase (as `phases` below)
# (ms, phase, channel: 0 left, 1 right, 2 both): the chorus voices
VOICES = ((7.1, 0, 0), (9.7, 3, 1), (12.3, 2, 2))
DIFFUSE_DEPTH_MS = 0.45
LINE_DEPTH_MS = 0.6
VOICE_DEPTH_MS = 1.5


def build(a):
    size = a.param("size", 1.0, 0.5, 2.0, curve="log", fade_ms=30, page="reverb",
                   help="Size of the room: bigger spreads its echoes further apart.")
    decay = a.param("decay", 2.5, 0.4, 15.0, "s", "log", page="reverb",
                    help="Time for the tail to fall by 60 dB.")
    predelay = a.param("predelay", 12.0, 2.0, 200.0, "ms", fade_ms=40, page="reverb",
                       help="Gap before the reverb starts.")
    chorus = a.param("chorus", 0.5, 0.0, 1.0, page="reverb",
                     help="How far every path wanders: 0 is a still room, 1 seasick.")
    wet = a.param("mix", 0.4, 0.0, 1.0, page="reverb",
                  help="Dry signal at 0, reverb only at 1.")
    rate = a.param("rate", 0.7, 0.1, 4.0, "Hz", "log", page="tone",
                   help="How fast the paths wander.")
    voices = a.param("voices", 0.5, 0.0, 1.0, page="tone",
                     help="Level of the three chorus voices that thicken the tail.")
    damping = a.param("damping", 8000.0, 1000.0, 20000.0, "Hz", "log", page="tone",
                      help="Highs above this fade away in the tail: lower is darker.")
    low_cut = a.param("low_cut", 90.0, 20.0, 600.0, "Hz", "log", page="tone",
                      help="Removes the lows below this from the reverb.")

    lfo_a = a.lfo(rate)
    lfo_b = a.lfo(rate * 0.61, phase=0.25)      # (unrelated to the first: no beat)
    phases = (lfo_a.sin, lfo_a.cos, lfo_b.sin, lfo_b.cos)

    dry_l, dry_r = a.input(0), a.input(1)
    pre = a.delay("predelay")
    pre.write(lowcut(a, (dry_l + dry_r) * 0.5, low_cut, "lowcut"))
    x = pre.tap(a.ms(predelay))
    for i, ms in enumerate(DIFFUSE_MS):
        x, _ = allpass(a, x, a.ms(ms), 0.62, f"diffuse{i}", mod=phases[i],
                       depth=a.ms(DIFFUSE_DEPTH_MS) * chorus, block_ram=True)

    lines = [a.delay(f"line{i}") for i in range(len(LINES_MS))]
    k = onepole_coef(a, damping)
    ys = []
    for i, (line, ms) in enumerate(zip(lines, LINES_MS)):
        length = a.ms(ms) * size
        if i in MODULATED:
            t = line.modtap(length, a.ms(LINE_DEPTH_MS) * chorus, phases[MODULATED[i]])
        else:
            t = line.tap(length)
        ys.append(lowpass(a, t * rt60_gain(a, length, decay), k, f"damp{i}"))
    for i, (line, m) in enumerate(zip(lines, householder(ys))):
        line.write(m + x * (0.5 if i % 2 == 0 else -0.5))

    tails = [mix([(y, 0.35) for y in part]) for part in (ys[0::2], ys[1::2])]
    chorus_line = a.delay("voices", block_ram=True)
    chorus_line.write((tails[0] + tails[1]) * 0.5)
    taps = [(chorus_line.modtap(a.ms(ms), a.ms(VOICE_DEPTH_MS) * chorus, phases[ph]), ch)
            for ms, ph, ch in VOICES]
    for c, dry in enumerate((dry_l, dry_r)):
        voiced = mix([(t, voices * (0.7 if ch == 2 else 1.0)) for t, ch in taps if ch in (c, 2)])
        wet_sig = tails[c] + voiced
        a.output(c, dry * (1 - wet) + wet_sig * wet)
        a.output(c + 2, wet_sig)                    # OUT2/3: reverb only
