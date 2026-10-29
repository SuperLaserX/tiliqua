"""Carrier: a reverb modulated at audio rate, by FM, AM or phase distortion.

A carrier oscillator (an LFO at `carrier` Hz, up to 3 kHz) modulates the
tail, inside the network (so every pass round the loop adds sidebands to
the last ones: metallic, bell-like, inharmonic) and on the way out:

- FM: the carrier moves the delays (two of the network's lines, and a
  short block-RAM line per side on the way out) by up to `index` x 1.2 ms:
  phase modulation of everything passing, sidebands at the carrier's
  multiples;
- AM: the carrier moves the level, between 1 and 1 - `index`;
- PD (phase distortion, as in Casio's synthesisers): the same level
  modulation, but by cos(pi w) of a warped phase w, a triangle bent
  towards a sawtooth by `shape` (`lib.cos_pi`): from a doubled sine to a
  bright, resonant, formant-like wave.

AM and PD keep the gain within 0..1, so the network can't grow by them.
FM can: a delay moving at audio rate inside a loop is a parametric pump
(each pass compresses the signal in time where the delay shortens, and a
mode at half the carrier's frequency is fed every cycle). A tap whose
delay changes by at most `d` samples per sample passes at most 1 / (1 - d)
of the energy that went in, so the loop's FM taps are limited to a slope
of DOPPLER (smaller swings at higher carriers) and their gain is
sqrt(1 - slope): the loop never gains energy, whatever the carrier. The
output's FM line is outside the loop and swings further (a slope up to
1). `mode`'s three paths are weighted 1 or 0 by coefficients, so a mode
change is a coefficient change, not a reload.
"""

import math

from model.dsl import pm
from model.lib import (allpass, cos_pi, hadamard, lowcut, lowpass, mix, onepole_coef,
                       rt60_gain)

NAME = "carrier"
TITLE = "Carrier"
DESCRIPTION = "A reverb modulated at audio rate: FM, AM or phase distortion, from shimmer to clang."
PRESETS = [
    ("FM bells", {"mode": 0.0, "carrier": 220.0, "index": 0.8, "decay": 5.0, "mix": 0.45}),
    ("AM shimmer", {"mode": 1.0, "carrier": 33.0, "index": 0.6, "decay": 3.0, "mix": 0.45}),
    ("PD reso", {"mode": 2.0, "carrier": 110.0, "index": 0.7, "shape": 0.7, "decay": 3.5,
                 "mix": 0.5}),
    ("Slow FM drift", {"mode": 0.0, "carrier": 6.0, "index": 1.0, "decay": 6.0, "size": 1.6,
                       "mix": 0.45}),
    ("Extreme", {"mode": 2.0, "carrier": 1200.0, "index": 1.0, "shape": 1.0, "decay": 12.0,
                 "size": 2.0, "damping": 14000.0, "mix": 0.85}),
]

LINES_MS = (33.1, 39.7, 47.3, 55.9)
FM_LINES = (0, 2)
DIFFUSE_MS = (4.3, 6.9)
FM_MS = 1.2             # the delays' swing at index 1, at low carriers
OUT_MS = 1.4            # the output's FM line swings around this
DOPPLER = 0.3           # the loop's FM taps move at most this many samples per sample


def build(a):
    mode = a.param("mode", 0.0, 0.0, 2.0, "|FM|AM|PD", step=1.0, page="reverb",
                   help="FM moves the delays, AM the level, PD the level by a phase-warped wave.")
    carrier = a.param("carrier", 110.0, 2.0, 3000.0, "Hz", "log", page="reverb",
                      help="The carrier's frequency: slow wobbles low, sidebands and clang high.")
    index = a.param("index", 0.5, 0.0, 1.0, page="reverb",
                    help="How deep the modulation goes.")
    shape = a.param("shape", 0.5, 0.0, 1.0, page="reverb",
                    help="PD only: how far the carrier's phase is warped, smooth to bright.")
    wet = a.param("mix", 0.45, 0.0, 1.0, page="reverb",
                  help="Dry signal at 0, the modulated tail only at 1.")
    decay = a.param("decay", 3.0, 0.3, 15.0, "s", "log", page="tone",
                    help="Time for the tail to fall by 60 dB.")
    size = a.param("size", 1.0, 0.5, 2.0, curve="log", fade_ms=30, page="tone",
                   help="Size of the space.")
    damping = a.param("damping", 7000.0, 1000.0, 20000.0, "Hz", "log", page="tone",
                      help="Highs above this fade away in the tail.")

    w_fm = pm.max(0.0, 1.0 - pm.abs(mode))
    w_am = pm.max(0.0, 1.0 - pm.abs(mode - 1.0))
    w_pd = pm.max(0.0, 1.0 - pm.abs(mode - 2.0))
    osc = a.lfo(carrier)
    # The level: 1 - index (1 - m) / 2, m the AM or PD carrier (-1..1).
    warped = osc.tri + (osc.saw - osc.tri) * shape
    pd = cos_pi(warped)
    m = osc.sin * w_am + pd * w_pd
    gain = m * (index * 0.5) + (1.0 - index * 0.5 * (w_am + w_pd))
    # The swing in samples, limited so that its slope (swing x the carrier
    # in radians per sample) stays under DOPPLER in the loop, 1 outside it.
    w = carrier * (2.0 * math.pi / a.fs)
    fm_depth = pm.min(a.ms(FM_MS), DOPPLER / w) * index * w_fm
    fm_gain = pm.sqrt(1.0 - fm_depth * w)
    out_depth = pm.min(a.ms(FM_MS), 1.0 / w) * index * w_fm
    # AM and PD lower the level by 1 - index / 2 on average, in the loop
    # and again on the way out: made up for after the loop.
    average = 1.0 - index * 0.5 * (w_am + w_pd)
    makeup = 1.0 / (average * average)

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
        if i in FM_LINES:
            t = line.modtap(length, fm_depth, osc.sin if i == 0 else osc.cos,
                            max_depth=int(a.ms(FM_MS)) + 1) * fm_gain
        else:
            t = line.tap(length)
        ys.append(lowpass(a, t * rt60_gain(a, length, decay) * gain, k, f"damp{i}"))
    for i, (line, mixed) in enumerate(zip(lines, hadamard(ys))):
        line.write(mixed + x * (0.5 if i % 2 == 0 else -0.5))

    for c, (dry, part) in enumerate(((dry_l, ys[0::2]), (dry_r, ys[1::2]))):
        tail = mix([(y, 0.5) for y in part])
        out = a.delay(f"out{c}", block_ram=True)
        out.write(tail * gain)
        wet_sig = out.modtap(a.ms(OUT_MS), out_depth, osc.sin if c == 0 else osc.cos,
                             max_depth=int(a.ms(FM_MS)) + 1) * makeup
        a.output(c, dry * (1 - wet) + wet_sig * wet)
        a.output(c + 2, wet_sig)                    # OUT2/3: reverb only
