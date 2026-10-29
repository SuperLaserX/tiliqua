"""Figure-8 plate, after Dattorro, "Effect Design Part 1" (JAES, 1997).

The input is band-limited and smeared by four allpasses, then feeds a tank
of two halves. Each half is a modulated allpass, a delay, damping, the decay
gain, a second allpass and a second delay, and feeds the other half. Each
output is a sum of seven taps across the tank.

The published delay lengths are for 29761 Hz; they scale with the sample
rate and with `size`.
"""

from model.lib import allpass, lowpass, mix, onepole_coef

NAME = "plate"
TITLE = "Plate"
DESCRIPTION = "A steel plate: dense and bright from the start, with a smooth, even tail."
PRESETS = [
    ("Bright plate", {"size": 1.0, "decay": 0.6, "damping": 14000.0, "bandwidth": 16000.0}),
    ("Vocal plate", {"size": 0.85, "decay": 0.5, "predelay": 30.0, "damping": 8000.0,
                     "bandwidth": 10000.0, "mix": 0.3}),
    ("Dark plate", {"size": 1.3, "decay": 0.7, "damping": 3000.0, "bandwidth": 5000.0}),
    ("Big plate", {"size": 2.0, "decay": 0.85, "damping": 9000.0, "mod_depth": 1.0, "mix": 0.4}),
    ("Extreme", {"size": 2.0, "decay": 0.95, "predelay": 60.0, "damping": 20000.0,
                 "bandwidth": 20000.0, "diffusion": 0.9, "mod_depth": 2.0, "mod_rate": 0.8,
                 "mix": 0.85}),
]
REF_FS = 29761.0

# (line, published tap position, sign) for each output, as in the paper.
TAPS_L = (("b_d1", 266, 1), ("b_d1", 2974, 1), ("b_ap2", 1913, -1), ("b_d2", 1996, 1),
          ("a_d1", 1990, -1), ("a_ap2", 187, -1), ("a_d2", 1066, -1))
TAPS_R = (("a_d1", 353, 1), ("a_d1", 3627, 1), ("a_ap2", 1228, -1), ("a_d2", 2673, 1),
          ("b_d1", 2111, -1), ("b_ap2", 335, -1), ("b_d2", 121, -1))


def build(a):
    size = a.param("size", 1.0, 0.5, 2.0, curve="log", fade_ms=20, page="reverb",
                   help="Scales the whole plate: bigger is slower to build and longer.")
    predelay = a.param("predelay", 10.0, 2.0, 200.0, "ms", fade_ms=40, page="reverb",
                       help="Gap before the reverb starts, keeping the dry attack clear.")
    decay = a.param("decay", 0.5, 0.0, 0.95, page="reverb",
                    help="Energy kept on each trip round the plate: higher rings longer.")
    damping = a.param("damping", 8000.0, 500.0, 20000.0, "Hz", "log", page="tone",
                      help="Highs above this die away faster in the tail: lower is warmer.")
    bandwidth = a.param("bandwidth", 12000.0, 500.0, 20000.0, "Hz", "log", page="tone",
                        help="Low-pass on the input: lower makes the whole reverb darker.")
    diffusion = a.param("diffusion", 0.75, 0.0, 0.9, page="reverb",
                        help="Smearing before the plate: high is smooth, low is grainy.")
    mod_depth = a.param("mod_depth", 0.5, 0.0, 2.0, "ms", page="tone",
                        help="How far the tail's delays wander: a slow chorus that stops ringing.")
    mod_rate = a.param("mod_rate", 1.0, 0.05, 5.0, "Hz", "log", page="tone",
                       help="How fast the tail's delays wander.")
    wet = a.param("mix", 0.35, 0.0, 1.0, page="reverb",
                  help="Dry signal at 0, reverb only at 1.")

    scale = a.fs / REF_FS

    def n(published):
        return size * (published * scale)

    dry_l, dry_r = a.input(0), a.input(1)

    pre = a.delay("predelay")
    pre.write((dry_l + dry_r) * 0.5)
    x = lowpass(a, pre.tap(a.ms(predelay)), onepole_coef(a, bandwidth), "bandwidth")
    g2 = diffusion * (0.625 / 0.75)
    for i, (length, g) in enumerate(((142, diffusion), (107, diffusion), (379, g2), (277, g2))):
        x, _ = allpass(a, x, n(length), g, f"diffuse{i}")

    lines = {nm: a.delay(nm) for nm in ("a_d1", "a_d2", "b_d1", "b_d2")}
    lfo = a.lfo(mod_rate)
    depth = a.ms(mod_depth)
    k_damp = onepole_coef(a, damping)

    def half(h, feedback, ap1_len, mod, d1_len, ap2_len):
        y, ap1 = allpass(a, x + feedback * decay, n(ap1_len), -0.7, f"{h}_ap1", mod=mod, depth=depth)
        d1 = lines[f"{h}_d1"]
        d1.write(y)
        damped = lowpass(a, d1.tap(n(d1_len)), k_damp, f"{h}_damp")
        y2, ap2 = allpass(a, damped * decay, n(ap2_len), 0.5, f"{h}_ap2")
        lines[f"{h}_d2"].write(y2)
        lines[f"{h}_ap2"] = ap2

    # Each half is fed from the end of the other half's last delay.
    end_a = lines["a_d2"].tap(n(3720))
    end_b = lines["b_d2"].tap(n(3163))
    half("a", end_b, 672, lfo.sin, 4453, 1800)
    half("b", end_a, 908, lfo.cos, 4217, 2656)

    for k, (taps, dry) in enumerate(((TAPS_L, dry_l), (TAPS_R, dry_r))):
        wet_sig = mix([(lines[nm].tap(n(pos)), 0.6 * sign) for nm, pos, sign in taps])
        a.output(k, dry * (1 - wet) + wet_sig * wet)
        a.output(k + 2, wet_sig)                # OUT2/3: reverb only
