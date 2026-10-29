"""Echo: a tape-style ping-pong delay that melts into a reverb.

Two delay lines in the PSRAM, left and right, up to 1.5 s each (`time`,
crossfaded when it changes). The input goes into the left line, or into
both at `spread` 0; each line's output feeds the other's input, so at
`spread` 1 the repeats bounce from side to side. On the way round, each
repeat passes:

- a short "tape head" line in block RAM whose delay wanders: `wow` on a
  slow LFO, `flutter` on a fast one (together they fit in its 2.25 ms);
- the tape's tone: a damping lowpass (`tone`) and a low cut;
- an allpass, `smear`, that blurs each repeat a little more than the
  last, so a long feedback melts into a reverb.

The total delay is `time` (the main line is shortened by the head's 3 ms).
"""

from model.lib import allpass, lowcut, lowpass, onepole_coef

NAME = "echo"
TITLE = "Echo"
DESCRIPTION = "Tape echoes bouncing side to side, wobbling and blurring into a reverb."
PRESETS = [
    ("Slapback", {"time": 110.0, "feedback": 0.15, "wow": 0.2, "flutter": 0.3, "spread": 0.0,
                  "tone": 6000.0, "mix": 0.35}),
    ("Ping pong", {"time": 375.0, "feedback": 0.55, "spread": 1.0, "smear": 0.2, "mix": 0.4}),
    ("Worn tape", {"time": 450.0, "feedback": 0.6, "wow": 0.8, "flutter": 0.6, "tone": 3500.0,
                   "smear": 0.35, "spread": 0.6, "mix": 0.45}),
    ("Dub space", {"time": 600.0, "feedback": 0.8, "wow": 0.4, "tone": 2500.0, "low_cut": 200.0,
                   "smear": 0.5, "spread": 1.0, "mix": 0.5}),
    ("Extreme", {"time": 1200.0, "feedback": 0.92, "wow": 1.0, "flutter": 1.0, "smear": 0.75,
                 "tone": 9000.0, "spread": 1.0, "mix": 0.85}),
]

HEAD_MS = 3.0           # the tape head's line: wow and flutter move around this
WOW_MS = 2.0            # their depths at 1
FLUTTER_MS = 0.25
SMEAR_MS = (7.3, 9.1)   # the smearing allpasses, left and right


def build(a):
    time = a.param("time", 350.0, 20.0, 1500.0, "ms", "log", fade_ms=80, page="reverb",
                   help="Time between repeats.")
    feedback = a.param("feedback", 0.45, 0.0, 0.95, page="reverb",
                       help="How much of each repeat comes back: high keeps them going.")
    spread = a.param("spread", 0.7, 0.0, 1.0, page="reverb",
                     help="0: the repeats in the middle; 1: they bounce from side to side.")
    smear = a.param("smear", 0.25, 0.0, 0.75, page="reverb",
                    help="How much each repeat is blurred: high melts them into a reverb.")
    wet = a.param("mix", 0.4, 0.0, 1.0, page="reverb",
                  help="Dry signal at 0, echoes only at 1.")
    wow = a.param("wow", 0.3, 0.0, 1.0, page="tone",
                  help="Slow wobble in pitch, as a stretched tape's.")
    flutter = a.param("flutter", 0.2, 0.0, 1.0, page="tone",
                      help="Fast shimmer in pitch, as a worn capstan's.")
    tone = a.param("tone", 5000.0, 800.0, 16000.0, "Hz", "log", page="tone",
                   help="Highs above this fade with every repeat: lower is warmer.")
    low_cut = a.param("low_cut", 80.0, 20.0, 1000.0, "Hz", "log", page="tone",
                      help="Lows below this fade with every repeat: higher is thinner.")

    wow_lfo = a.lfo(0.7)
    flutter_lfo = a.lfo(9.3)
    # The head's excursion and its LFOs' mix, normalised to -1..1.
    w, f = a.ms(WOW_MS) * wow, a.ms(FLUTTER_MS) * flutter
    depth = w + f
    moves = (wow_lfo.sin * (w / (depth + 1e-6)) + flutter_lfo.sin * (f / (depth + 1e-6)),
             wow_lfo.cos * (w / (depth + 1e-6)) + flutter_lfo.cos * (f / (depth + 1e-6)))

    dry_l, dry_r = a.input(0), a.input(1)
    mono = (dry_l + dry_r) * 0.5
    k = onepole_coef(a, tone)
    tapes = [a.delay(n) for n in ("left", "right")]
    returns = []
    for c, tape in enumerate(tapes):
        head = a.delay(f"head{c}", block_ram=True)
        head.write(tape.tap(a.ms(time - HEAD_MS)))
        y = head.modtap(a.ms(HEAD_MS), depth, moves[c],
                        max_depth=int(a.ms(WOW_MS + FLUTTER_MS)) + 1)
        y = lowcut(a, lowpass(a, y, k, f"tone{c}"), low_cut, f"lowcut{c}")
        y, _ = allpass(a, y, a.ms(SMEAR_MS[c]), smear, f"smear{c}", block_ram=True)
        returns.append(y)
    # The input: all left at spread 1, half each at 0; each side's return
    # feeds the other.
    tapes[0].write(mono * (0.5 + spread * 0.5) + returns[1] * feedback)
    tapes[1].write(mono * (0.5 - spread * 0.5) + returns[0] * feedback)

    for c, dry in enumerate((dry_l, dry_r)):
        wet_sig = returns[c] * 1.0
        a.output(c, dry * (1 - wet) + wet_sig * wet)
        a.output(c + 2, wet_sig)                    # OUT2/3: echoes only
