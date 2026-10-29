"""Crusher: a reverb at a falling sample rate, aliasing as it goes round.

A sample-and-hold without a sample-and-hold instruction: a short
block-RAM line read by a tap that a sawtooth LFO at fs / `crush` sweeps
backwards one sample per sample, so it reads the same sample for `crush`
samples, then jumps on (the rate reduction of old samplers; between whole
numbers the held value is a blend of two samples). That is the way out.

Inside the network a plain hold isn't safe: holding one sample for N
copies its energy N times, and the loop finds the signals phase-locked to
the hold that gain by it. So two of its lines (`inside`) hold the mean of
the last N samples instead (a running sum less the sum N samples ago),
which can't hold more energy than the N samples had: every pass still
decimates and aliases the tail, and the loop can't grow.
"""

from model.lib import allpass, householder, lowcut, lowpass, mix, onepole_coef, rt60_gain

NAME = "crusher"
TITLE = "Crusher"
DESCRIPTION = "A reverb at a falling sample rate: aliasing, gritty, crushed again on every pass."
PRESETS = [
    ("Sampler", {"crush": 3.0, "inside": 0.3, "tone": 9000.0, "mix": 0.4}),
    ("Toy", {"crush": 8.0, "inside": 0.6, "decay": 2.0, "mix": 0.45}),
    ("Grit hall", {"crush": 5.0, "inside": 1.0, "decay": 5.0, "size": 1.6, "mix": 0.5}),
    ("Radio", {"crush": 12.0, "inside": 0.4, "tone": 3000.0, "damping": 4000.0, "mix": 0.5}),
    ("Extreme", {"crush": 32.0, "inside": 1.0, "decay": 12.0, "size": 2.0, "tone": 16000.0,
                 "damping": 14000.0, "mix": 0.85}),
]

LINES_MS = (30.7, 35.3, 41.1, 46.9, 52.3, 59.9, 66.5, 73.9)
DIFFUSE_MS = (4.1, 6.5)
CRUSHED = (2, 7)
MAX_CRUSH = 32
LEAK = 1.0 - 2.0 ** -12


def build(a):
    crush = a.param("crush", 6.0, 1.0, 32.0, "x", "log", page="reverb",
                    help="How many samples each one is held: 1 clean, 32 a crunchy 1.5 kHz.")
    inside = a.param("inside", 0.5, 0.0, 1.0, page="reverb",
                     help="How much the tail is crushed inside the reverb, again every pass.")
    decay = a.param("decay", 2.5, 0.3, 15.0, "s", "log", page="reverb",
                    help="Time for the tail to fall by 60 dB.")
    tone = a.param("tone", 8000.0, 1000.0, 20000.0, "Hz", "log", page="reverb",
                   help="Softens the aliasing on the way out.")
    wet = a.param("mix", 0.45, 0.0, 1.0, page="reverb",
                  help="Dry signal at 0, the crushed tail only at 1.")
    size = a.param("size", 1.0, 0.5, 2.0, curve="log", fade_ms=30, page="tone",
                   help="Size of the space.")
    damping = a.param("damping", 7000.0, 1000.0, 20000.0, "Hz", "log", page="tone",
                      help="Highs above this fade away inside the reverb.")

    # The hold: the saw rises -1..1 every `crush` samples, the tap's delay
    # with it at one sample per sample, so the sample read stays put.
    saw = a.lfo(a.fs / crush).saw
    hold_c = MAX_CRUSH // 2 + 2

    def crushed(x, name):
        line = a.delay(name, block_ram=True)
        line.write(x)
        return line.modtap(hold_c, crush * 0.5, saw, max_depth=MAX_CRUSH // 2 + 1)

    def averaged(x, name):
        """The hold of the mean of the last `crush` samples (a slight leak
        keeps the running sum from drifting)."""
        past = a.delay(f"{name}past", block_ram=True)
        past.write(x)
        total = a.state(f"{name}sum")
        s = total.prev * LEAK + x - past.tap(crush)
        total.write(s)
        return crushed(s, name) * (1.0 / crush)

    dry_l, dry_r = a.input(0), a.input(1)
    pre = a.delay("predelay")
    pre.write(lowcut(a, (dry_l + dry_r) * 0.5, 80.0, "lowcut"))
    x = pre.tap(a.ms(8.0))
    for i, ms in enumerate(DIFFUSE_MS):
        x, _ = allpass(a, x, a.ms(ms), 0.6, f"diffuse{i}")
    lines = [a.delay(f"line{i}") for i in range(len(LINES_MS))]
    k = onepole_coef(a, damping)
    ys = []
    for i, (line, ms) in enumerate(zip(lines, LINES_MS)):
        length = a.ms(ms) * size
        y = lowpass(a, line.tap(length) * rt60_gain(a, length, decay), k, f"damp{i}")
        if i in CRUSHED:
            y = y + (averaged(y, f"hold{i}") - y) * inside
        ys.append(y)
    for i, (line, m) in enumerate(zip(lines, householder(ys))):
        line.write(m + x * (0.5 if i % 2 == 0 else -0.5))

    kt = onepole_coef(a, tone)
    for c, (dry, part) in enumerate(((dry_l, ys[0::2]), (dry_r, ys[1::2]))):
        tail = mix([(y, 0.35) for y in part])
        wet_sig = lowpass(a, crushed(tail, f"out{c}"), kt, f"tone{c}") * 1.4
        a.output(c, dry * (1 - wet) + wet_sig * wet)
        a.output(c + 2, wet_sig)                    # OUT2/3: reverb only
