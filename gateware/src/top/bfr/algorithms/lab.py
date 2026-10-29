"""Lab: the open slot, a small reverb to start your own design from.

This file is a template. It is a complete, working type (in the menu as
"Lab") that is meant to be changed: try an idea here, build the firmware
alone (`top.py build --fw-only`: no new bitstream needed while the design
fits the pools below) and play it.

How a type works (see SPEC.md and the other types for more):

- `build(a)` runs once, at build time, and describes ONE SAMPLE of
  processing. The compiler turns it into a straight-line program the FPGA
  runs every sample: multiply-accumulates in floating point, delay lines,
  LFOs, one-sample states.
- `a.param(...)` declares a menu dial. It returns a symbol for coefficient
  math (`size * 2`, `pm.exp(...)`): the CPU evaluates that math whenever
  the dial (or its modulation) moves, never at audio rate.
- Signals: `a.input(k)`, delay taps, states, LFO outputs and sums and
  products of them (`x * 0.5`, `x * lfo.sin`: a signal times a signal is
  fine). There is no rectifier, clipper or division of signals.
- `a.delay(name)` is a delay line: write it exactly once per sample
  (`line.write(sig)`), tap it as often as you like (`line.tap(samples)`,
  `line.modtap(center, depth, mod)` for a moving, interpolated tap).
- `a.state(name)` holds a value to the next sample (`.prev`, `.write`):
  filters are built from it (`model/lib.py`: lowpass, allpass, ...).
- `a.output(k, sig)`: 0 and 1 are the mix you hear, 2 and 3 the reverb
  alone (keep them the wet signal: the UI's meter and rings read them).

The pools every type shares in this bitstream (`top.py` POOLS; the build
fails with a message naming the one a design exceeds):

- 512 instructions, and 1,250 clocks per sample at 48 kHz;
- the PSRAM read buffer, 2,048 words: each plain delay tap takes 16 words
  (32 if its delay is crossfaded), a modulated one its swing x 2 plus 16,
  rounded up to a power of two (1 ms of swing at 48 kHz: 128 words);
- block RAM for short lines, 2,048 words (about 42 ms at 48 kHz in all):
  lines whose taps are under 64 samples go there, and any line made with
  `a.delay(name, block_ram=True)`, where modulation is free;
- 4 LFOs, 2 crossfaded parameters (`fade_ms`), 11 dials.

This one: a predelay, two diffusers, a four-line feedback network (one line
drifting on an LFO), damping, and a "ping" trigger (the kick button) that
drops a short burst of noise into the network, to hear the tail on its own.
"""

from model.lib import allpass, hadamard, lowcut, lowpass, mix, onepole_coef, rt60_gain

NAME = "lab"
TITLE = "Lab"
DESCRIPTION = "Laboratory Reverb"
PRESETS = [
    # (name, {parameter: value}); an optional third item sets how the input's
    # level, bass or treble moves parameters: [("level", "decay", 40), ...]
    ("Small", {"size": 0.6, "decay": 0.8}),
    ("Large", {"size": 1.8, "decay": 4.0, "drift": 0.6}),
    ("Extreme", {"size": 2.0, "decay": 20.0, "drift": 1.0, "damping": 14000.0, "mix": 0.85}),
]

# Line lengths at size 1, in ms: unrelated lengths, so their echoes don't line up.
LINES_MS = (37.1, 43.9, 53.3, 61.7)
DIFFUSE_MS = (4.1, 6.7)


def build(a):
    # The dials: name, default, low, high, unit, "lin" or "log", then where
    # it goes in the menu and the sentence the hub shows for it. `fade_ms`
    # crossfades a delay instead of letting it jump (size, predelay).
    size = a.param("size", 1.0, 0.5, 2.0, curve="log", fade_ms=30, page="reverb",
                   help="Size of the space.")
    decay = a.param("decay", 2.0, 0.3, 20.0, "s", "log", page="reverb",
                    help="Time for the tail to fall by 60 dB.")
    wet = a.param("mix", 0.4, 0.0, 1.0, page="reverb",
                  help="Dry signal at 0, reverb only at 1.")
    damping = a.param("damping", 7000.0, 1000.0, 20000.0, "Hz", "log", page="tone",
                      help="Highs above this fade away in the tail.")
    drift = a.param("drift", 0.3, 0.0, 1.0, "ms", page="tone",
                    help="How far one line wanders: breaks up ringing.")

    # A one-shot envelope the kick button (or a gate on CV1/CV2) fires: 1,
    # then falling by 60 dB in 30 ms.
    ping = a.trigger("ping", 30.0, help="Drops a short noise burst into the tail.")

    lfo = a.lfo(0.4)            # an LFO at 0.4 Hz: .sin .cos .tri .saw, -1..1

    dry_l, dry_r = a.input(0), a.input(1)
    x = lowcut(a, (dry_l + dry_r) * 0.5, 80.0, "lowcut") + a.noise * ping * 0.5
    pre = a.delay("predelay")
    pre.write(x)
    x = pre.tap(a.ms(10.0))
    for i, ms in enumerate(DIFFUSE_MS):
        x, _ = allpass(a, x, a.ms(ms), 0.6, f"diffuse{i}")

    # The network: each line's output, scaled for the decay and damped, is
    # mixed into every line's input (Hadamard: lossless), plus the input.
    lines = [a.delay(f"line{i}") for i in range(len(LINES_MS))]
    k = onepole_coef(a, damping)
    ys = []
    for i, (line, ms) in enumerate(zip(lines, LINES_MS)):
        length = a.ms(ms) * size
        if i == 0:
            t = line.modtap(length, a.ms(drift), lfo.sin)
        else:
            t = line.tap(length)
        ys.append(lowpass(a, t * rt60_gain(a, length, decay), k, f"damp{i}"))
    for i, (line, m) in enumerate(zip(lines, hadamard(ys))):
        line.write(m + x * (0.5 if i % 2 == 0 else -0.5))

    for c, (dry, part) in enumerate(((dry_l, ys[0::2]), (dry_r, ys[1::2]))):
        wet_sig = mix([(y, 0.5) for y in part])
        a.output(c, dry * (1 - wet) + wet_sig * wet)
        a.output(c + 2, wet_sig)                    # OUT2/3: reverb only
