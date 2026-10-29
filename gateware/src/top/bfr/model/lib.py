"""Building blocks for algorithms."""

import math

from .dsl import Lin, P, Sig, pm


def mix(pairs):
    """Sum of (signal, coefficient) pairs as one accumulator chain."""
    return Lin([(s, c if isinstance(c, Sig) else P.lift(c)) for s, c in pairs])


def allpass(a, x, delay, g, name, mod=None, depth=0.0, max_depth=None, block_ram=False):
    """Schroeder allpass, lattice form: v = x + g*d, y = d - g*v.

    `delay` is in samples (number or P). With `mod` (a signal in [-1, 1]) the
    tap moves by depth * mod samples, interpolated. `block_ram` as for
    `Algorithm.delay`. Returns (y, line) so other taps can read the
    allpass's delay line.
    """
    line = a.delay(name, block_ram=block_ram)
    if mod is None:
        d = line.tap(delay)
    else:
        d = line.modtap(delay, depth, mod, max_depth)
    v = x + d * g
    line.write(v)
    return d - v * g, line


def lowpass(a, x, k, name):
    """One-pole lowpass y += k * (x - y); k = 1 passes x unchanged."""
    s = a.state(name)
    y = x * k + s.prev * (1 - k)
    s.write(y)
    return y


def highpass(a, x, k, name):
    """x minus its one-pole lowpass."""
    return x - lowpass(a, x, k, name)


def onepole_coef(a, hz):
    """Coefficient of `lowpass` for a -3 dB corner of `hz` (number or P)."""
    return 1 - pm.exp(-2 * math.pi * P.lift(hz) / a.fs)


def rt60_gain(a, delay, t60):
    """Gain per pass of a loop of `delay` samples for a decay of `t60` seconds."""
    return 10.0 ** (-3.0 * P.lift(delay) / (a.fs * P.lift(t60)))


def householder(xs):
    """Householder reflection I - (2/N) 11^T: lossless, N + 2N products."""
    n = len(xs)
    s = mix([(x, 2.0 / n) for x in xs])
    return [x - s for x in xs]


def hadamard(xs):
    """Normalised Hadamard mixing (N a power of two), directly as N sums of N terms."""
    n = len(xs)
    if n & (n - 1):
        raise ValueError("hadamard needs a power-of-two size")
    scale = 1.0 / math.sqrt(n)
    return [mix([(xs[j], scale * (-1) ** bin(i & j).count("1")) for j in range(n)])
            for i in range(n)]


def stretched_allpass(a, x, k, g, name):
    """First-order allpass stretched over k samples, (g + z^-k) / (1 + g z^-k):
    v = x - g*d into the line, y = g*v + d, with d = v k samples ago. A chain
    of them disperses (high frequencies arrive first or last), which is
    the chirp of a spring.

    In a chain each y is used once, so the compiler folds it into the next
    stage's v: v_k = g v_(k-1) + d_(k-1) - g d_k, three products and one
    dependent step per stage, with nothing held in a temporary register.
    """
    line = a.delay(name)
    d = line.tap(k)
    v = x - d * g
    line.write(v)
    return v * g + d


def lowcut(a, x, hz, name):
    """One-pole highpass: removes rumble below `hz` (number or P)."""
    return highpass(a, x, onepole_coef(a, hz), name)


def pitch_shift(a, x, ratio, window, name):
    """Delay-line pitch shifter: x shifted by `ratio` (P or number; 2 is an
    octave up, 0.5 down, 1 unchanged).

    Two taps sweep a `window`-sample range of a short line at the slope that
    gives the ratio, half a sweep apart; each jumps back when its sweep ends,
    and complementary raised-cosine windows (summing to 1) hide the jumps.
    The sweep is a saw LFO at fs * (ratio - 1) / (2 * depth) (negative rates
    run it backwards, for downward shifts). Uses two LFOs.
    """
    depth = window / 2.0
    rate = (ratio - 1) * (a.fs / (2.0 * depth))
    lfo_a = a.lfo(rate)
    lfo_b = a.lfo(rate, phase=0.5)
    line = a.delay(name)
    line.write(x)
    centre = depth + 2
    tap_a = line.modtap(centre, depth, -lfo_a.saw, max_depth=int(depth) + 1)
    tap_b = line.modtap(centre, depth, -lfo_b.saw, max_depth=int(depth) + 1)
    # Window a is 1 mid-sweep (saw 0, phase 0) and 0 at its jump (phase
    # 0.5): 0.5 + 0.5 cos; window b is its complement.
    w_a = lfo_a.cos * 0.5 + 0.5
    w_b = lfo_a.cos * -0.5 + 0.5
    return tap_a * w_a + tap_b * w_b


def early_reflections(line, pattern, size, offset=0.0, gain=1.0):
    """Sum of taps of `line` per channel: `pattern` is (ms, gain, channel)
    triples, the times scaled by `size` and delayed by `offset` samples (P
    or numbers). Returns one signal per channel in the pattern (0, 1, ...)."""
    alg = line.alg
    chans = sorted({c for _, _, c in pattern})
    return [mix([(line.tap(offset + alg.ms(ms) * size), g * gain)
                 for ms, g, ch in pattern if ch == c]) for c in chans]


# A 90-degree phase-difference pair: two chains of four allpass sections in
# z^-2, y[n] = c (x[n] + y[n-2]) - x[n-2], the first chain then delayed by a
# sample (O. Niemitalo's design: within a degree of 90 from about 15 Hz to
# 0.99 x Nyquist at 48 kHz). Coefficients a^2 of each section.
HILBERT_A = (0.6923878, 0.9360654322959, 0.9882295226860, 0.9987488452737)
HILBERT_B = (0.4021921162426, 0.8561710882420, 0.9722909545651, 0.9952884791278)


def _section2(a, x, c, name):
    xs, ys = a.delay(f"{name}x"), a.delay(f"{name}y")
    xs.write(x)
    y = x * c + ys.tap(2) * c - xs.tap(2)
    ys.write(y)
    return y


def hilbert(a, x, name):
    """(i, q): `x` through two allpass chains whose outputs are 90 degrees
    apart (q leads), each of unit gain. Uses 17 short block-RAM lines."""
    i = q = x
    for k, (ca, cb) in enumerate(zip(HILBERT_A, HILBERT_B)):
        i = _section2(a, i, ca * ca, f"{name}_i{k}")
        q = _section2(a, q, cb * cb, f"{name}_q{k}")
    d = a.delay(f"{name}_d")
    d.write(i)
    return d.tap(1), q


def freq_shift(a, x, osc, name):
    """`x` with every frequency moved by the rate of `osc` (an LFO; a
    negative rate shifts down): single-sideband modulation of the Hilbert
    pair, i cos + q sin (q leads by 90 degrees). Unlike a pitch shift, harmonics don't stay
    harmonic: a small shift in a feedback loop spirals up or down."""
    i, q = hilbert(a, x, name)
    return i * osc.cos + q * osc.sin


class SineShaper:
    """sin(k x) and cos(k x) of signals: a waveshaper and wavefolder.

    The engine has no lookup for signals, but a delay line can be one. An
    LFO's sine and cosine are written into two block-RAM lines, and a tap
    whose delay the signal moves reads the LFO's past: at delay c + D x it
    is sin(psi - w D x), where psi is the LFO's phase c samples ago (a fixed
    tap reads its sine and cosine) and w its step per sample. Demodulating,
    sin(t) = sin(psi) cos(psi - t) - cos(psi) sin(psi - t), so with
    w D = `k_max`, x scaled by k / k_max gives sin(k x) and cos(k x)
    exactly, up to the taps' linear interpolation (a sine of over 100
    samples a period: well under 0.1 %). The tap's swing is clamped to
    +-D, so the phase is too: |k x| <= `k_max`, and the outputs are always
    within -1..1, inside a feedback loop as well.

    One shaper (an LFO and the two lines: 4 x `depth` words of block RAM)
    serves any number of calls, each two modulated taps and four products.
    """

    def __init__(self, a, name, k_max=8 * math.pi, depth=400):
        self.k_max, self.depth = k_max, depth
        lfo = a.lfo(k_max * a.fs / (2 * math.pi * depth))
        self.c = depth + 2
        self.sin_line = a.delay(f"{name}_sin", block_ram=True)
        self.cos_line = a.delay(f"{name}_cos", block_ram=True)
        self.sin_line.write(lfo.sin)
        self.cos_line.write(lfo.cos)
        self.s_c, self.c_c = self.sin_line.tap(self.c), self.cos_line.tap(self.c)

    def __call__(self, x, k):
        """(sin(k x), cos(k x)): `k` a number or P up to `k_max`."""
        m = x * (P.lift(k) / self.k_max)
        y1 = self.sin_line.modtap(self.c, self.depth, m, max_depth=self.depth)
        y2 = self.cos_line.modtap(self.c, self.depth, m, max_depth=self.depth)
        return self.s_c * y2 - self.c_c * y1, self.c_c * y2 + self.s_c * y1


def cos_pi(w):
    """cos(pi w) for a signal w in -1..1: its Taylor series to w^10 (within
    0.2 % at the ends), five products."""
    w2 = w * w
    w4 = w2 * w2
    w6 = w4 * w2
    w8 = w4 * w4
    w10 = w8 * w2
    return mix([(w2, -4.934802200544679), (w4, 4.058712126416768), (w6, -1.335262768854589),
                (w8, 0.2353306303588932), (w10, -0.0258068913507700)]) + 1.0
