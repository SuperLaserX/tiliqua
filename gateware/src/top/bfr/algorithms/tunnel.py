"""Tunnel: inside a long metal pipe.

Four short comb delays (2.3 to 6.1 ms times `size`, in block RAM) feed each
other through a Hadamard mix, so they ring together like the modes of a
pipe; `feedback` sets how long they ring, `tone` how dark. Each comb's delay
sweeps by up to half a millisecond on an LFO (four phases of two LFOs), so
the resonances glide past one another: a slow, jet-like flange. A diffuser
in front smears the input into the pipe (`diffusion`), and the input is
scaled by sqrt(1 - feedback^2) so the pipe rings at a similar level
however long it rings.
"""

from model.dsl import pm
from model.lib import allpass, hadamard, lowcut, lowpass, mix, onepole_coef

NAME = "tunnel"
TITLE = "Tunnel"
DESCRIPTION = "Inside a long metal pipe: ringing combs that sweep past each other, a slow flange."
PRESETS = [
    ("Drain pipe", {"size": 1.4, "feedback": 0.85, "sweep_depth": 0.3, "tone": 6000.0,
                    "mix": 0.45}),
    ("Jet", {"size": 0.7, "feedback": 0.9, "sweep_rate": 0.15, "sweep_depth": 1.0,
             "tone": 12000.0, "mix": 0.55}),
    ("Culvert", {"size": 2.0, "feedback": 0.93, "sweep_depth": 0.2, "tone": 3000.0,
                 "diffusion": 0.7, "mix": 0.5}),
    ("Tin can", {"size": 0.5, "feedback": 0.7, "sweep_depth": 0.5, "sweep_rate": 0.8,
                 "tone": 9000.0, "diffusion": 0.2, "mix": 0.4}),
    ("Extreme", {"size": 2.0, "feedback": 0.98, "sweep_rate": 0.3, "sweep_depth": 1.0,
                 "tone": 16000.0, "diffusion": 0.8, "predelay": 60.0, "mix": 0.85}),
]

COMBS_MS = (2.3, 3.1, 4.3, 6.1)
SWEEP_MS = 0.5


def build(a):
    size = a.param("size", 1.0, 0.5, 2.0, curve="log", fade_ms=30, page="reverb",
                   help="The pipe's width: bigger rings lower.")
    feedback = a.param("feedback", 0.85, 0.0, 0.98, page="reverb",
                       help="How long the pipe rings: high is long and metallic.")
    sweep_rate = a.param("sweep_rate", 0.25, 0.02, 2.0, "Hz", "log", page="reverb",
                         help="How fast the resonances glide.")
    sweep_depth = a.param("sweep_depth", 0.5, 0.0, 1.0, page="reverb",
                          help="How far they glide: 0 is a still pipe, 1 a deep flange.")
    wet = a.param("mix", 0.45, 0.0, 1.0, page="reverb",
                  help="Dry signal at 0, the pipe only at 1.")
    tone = a.param("tone", 8000.0, 1000.0, 20000.0, "Hz", "log", page="tone",
                   help="Highs above this fade as the pipe rings: lower is darker.")
    diffusion = a.param("diffusion", 0.5, 0.0, 0.8, page="tone",
                        help="Smears the input before the pipe: high softens the attack.")
    predelay = a.param("predelay", 4.0, 2.0, 150.0, "ms", fade_ms=40, page="tone",
                       help="Gap before the pipe answers.")
    low_cut = a.param("low_cut", 120.0, 20.0, 800.0, "Hz", "log", page="tone",
                      help="Removes the lows below this before the pipe.")

    lfo_a = a.lfo(sweep_rate)
    lfo_b = a.lfo(sweep_rate * 0.77, phase=0.4)
    phases = (lfo_a.sin, lfo_b.sin, lfo_a.cos, lfo_b.cos)

    dry_l, dry_r = a.input(0), a.input(1)
    pre = a.delay("predelay")
    pre.write(lowcut(a, (dry_l + dry_r) * 0.5, low_cut, "lowcut"))
    x, _ = allpass(a, pre.tap(a.ms(predelay)), a.ms(3.7), diffusion, "diffuse", block_ram=True)
    x = x * pm.sqrt(1 - feedback * feedback)

    combs = [a.delay(f"comb{i}", block_ram=True) for i in range(len(COMBS_MS))]
    k = onepole_coef(a, tone)
    ys = []
    for i, (comb, ms) in enumerate(zip(combs, COMBS_MS)):
        t = comb.modtap(a.ms(ms) * size, a.ms(SWEEP_MS) * sweep_depth, phases[i])
        ys.append(lowpass(a, t * feedback, k, f"damp{i}"))
    for i, (comb, m) in enumerate(zip(combs, hadamard(ys))):
        comb.write(m + x * (0.5 if i % 2 == 0 else -0.5))

    for c, (dry, part) in enumerate(((dry_l, ys[0::2]), (dry_r, ys[1::2]))):
        wet_sig = mix([(y, 0.8) for y in part])
        a.output(c, dry * (1 - wet) + wet_sig * wet)
        a.output(c + 2, wet_sig)                    # OUT2/3: reverb only
