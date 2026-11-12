"""Bit-exact model of the fixed-point A2 engine.

The gateware is a multiply-accumulate datapath that streams one 18-bit
activation per clock against a column of 18-bit weights. This module
holds the arithmetic the gateware and the firmware both have to agree on:

* `quantise` turns an `A2Weights` into integer weights plus the shifts
  the engine needs, choosing a binary exponent per weight class so that
  every weight fits 18 bits. The firmware does the same from a `.nam`.
* `run_fixed` runs the integer datapath sample by sample (vectorised over
  time, one layer at a time) and returns the output samples in Q15 and,
  on request, the internal integer signals the gateware tests compare.

Number formats (`Formats`):

    x        18-bit, Q(x_frac)            input after input gain
    hist     hist_bits, Q(hist_frac)      residual stream stored per layer
    z        18-bit, Q(z_frac)            layer output after LeakyReLU
    hsum     18-bit, Q(hsum_frac)         running sum of z, read by the head
    y        18-bit, Q(y_frac)            head output before head_scale
    Z, LIN   acc_bits accumulators        Z at Q(hist_frac + conv_frac[l]),
                                          LIN at Q(lin_frac) across layers
    out      16-bit, Q15                  y * head_scale * output gain

Biases enter as a multiply of the constant activation 2**const_shift, so
a bias is resolved at Q(accumulator_frac - const_shift). Rounding is
round-half-up (add half, arithmetic shift) and every store saturates.
LeakyReLU multiplies a negative accumulator by 10486/2**20 (0.01 within
2.3e-5) with shifts and adds.
"""

from dataclasses import dataclass, field
import math

import numpy as np

from .a2 import A2Weights, HEAD_KERNEL, RECEPTIVE_FIELD, delayed

W_BITS = 18
W_MAX = (1 << (W_BITS - 1)) - 1
LEAKY_NUM = (1 << 13) + (1 << 11) + (1 << 8) - (1 << 3) - (1 << 1)   # 10486
LEAKY_SHIFT = 20


@dataclass
class Formats:
    x_frac: int = 15
    hist_bits: int = 18
    hist_frac: int = 13
    z_frac: int = 12
    hsum_frac: int = 11
    acc_bits: int = 40
    const_shift: int = 16
    out_headroom: float = 2.0      # largest |out| representable before the output gain
    # Extra low bits of z and hsum, fed through a second MAC against weights
    # scaled down by 2**split (so zq is 18 + split bits wide).
    z_split: int = 0
    hsum_split: int = 0
    # Layers whose history lives in PSRAM may use a narrower word.
    psram_layers: tuple = ()
    psram_bits: int = 18
    psram_frac: int = 13

    def hist_format(self, layer):
        if layer in self.psram_layers:
            return self.psram_bits, self.psram_frac
        return self.hist_bits, self.hist_frac


def round_half_up(v):
    """Round to the nearest integer, halves up (what the engine does)."""
    return np.floor(np.asarray(v, dtype=np.float64) + 0.5).astype(np.int64)


def qexp(maxabs):
    """Largest exponent f with round(maxabs * 2**f) <= W_MAX."""
    if maxabs <= 0:
        return 30
    m, e = math.frexp(float(maxabs))          # maxabs = m * 2**e, m in [0.5, 1)
    f = (W_BITS - 1) - e
    while round_half_up(maxabs * 2.0 ** f) > W_MAX:
        f -= 1
    while round_half_up(maxabs * 2.0 ** (f + 1)) <= W_MAX:
        f += 1
    return int(f)


def to_q(values, frac):
    q = round_half_up(np.asarray(values, dtype=np.float64) * 2.0 ** frac)
    assert np.abs(q).max(initial=0) <= W_MAX, (np.abs(q).max(), frac)
    return q


def shift_round_sat(acc, shift, bits):
    """acc / 2**shift rounded half up and saturated to `bits` signed."""
    acc = np.asarray(acc, dtype=np.int64)
    if shift > 0:
        v = (acc + (1 << (shift - 1))) >> shift
    elif shift == 0:
        v = acc
    else:
        v = acc << (-shift)
    lim = (1 << (bits - 1)) - 1
    return np.clip(v, -lim - 1, lim)


LEAKY_TERMS = ((7, 1), (9, 1), (12, 1), (17, -1), (19, -1))   # 10486 / 2**20 as shifts


def leaky(acc):
    """LeakyReLU on a wide accumulator: negatives scaled by 10486 / 2**20 = 0.01
    (within 2.3e-5), as the post unit does it: five arithmetic shifts, each
    truncated, added. The truncation is at most 5 units of the accumulator."""
    acc = np.asarray(acc, dtype=np.int64)
    neg = sum(sign * (acc >> s) for s, sign in LEAKY_TERMS)
    return np.where(acc >= 0, acc, neg)


@dataclass
class QLayer:
    kernel: int
    dilation: int
    conv_frac: int          # conv weights Q(conv_frac); Z at Q(hist_in_frac + conv_frac)
    conv_w: np.ndarray      # [k][out][in] int
    conv_b: np.ndarray      # [out] int, Q(z_acc_frac - const_shift)
    mixin: np.ndarray       # [out] int, Q(z_acc_frac - x_frac)
    l1x1_w: np.ndarray      # [out][in] int, Q(lin_frac - z_frac)
    l1x1_b: np.ndarray      # [out] int, Q(lin_frac - const_shift)
    z_shift: int            # Z accumulator -> z
    hist_in_bits: int
    hist_in_frac: int
    l1x1_w_lo: np.ndarray = None   # [out][in] int, Q(lin_frac - z_frac - z_split), for the low part


@dataclass
class QWeights:
    channels: int
    fmt: Formats
    lin_frac: int
    rechannel: np.ndarray   # [c] int, Q(lin_frac - x_frac)
    layers: list
    head_frac: int          # head weights Q(head_frac); head acc at Q(hsum_frac + head_frac)
    head_w: np.ndarray      # [k][c] int
    head_b: int             # Q(hsum_frac + head_frac - const_shift)
    y_frac: int
    y_shift: int            # head accumulator -> y
    head_scale: float
    hist_shifts: list = field(default_factory=list)   # LIN -> history store, per layer
    hsum_shift: int = 0     # H (Q z_frac + z_split) -> hsum ring
    head_w_lo: np.ndarray = None   # [k][c] int, Q(head_frac - hsum_split)

    def flat(self):
        """Every weight in the order the engine's weight memory holds them."""
        raise NotImplementedError   # defined by the engine's layout; see engine.py


def quantise(w: A2Weights, fmt: Formats = Formats()):
    """Integer weights and shifts for `w` under `fmt`."""
    c = w.channels
    cs = fmt.const_shift
    # LIN's resolution is limited by what feeds it.
    lin_frac = min(
        [qexp(np.abs(w.rechannel).max()) + fmt.x_frac]
        + [qexp(np.abs(l.l1x1_w).max()) + fmt.z_frac for l in w.layers]
        + [qexp(np.abs(l.l1x1_b).max()) + cs for l in w.layers]
        + [fmt.acc_bits - 8])
    layers = []
    hist_shifts = []
    for i, l in enumerate(w.layers):
        hb, hf = fmt.hist_format(i)
        conv_frac = min(qexp(np.abs(l.conv_w).max()),
                        qexp(np.abs(l.mixin).max()) + fmt.x_frac - hf,
                        qexp(np.abs(l.conv_b).max()) + cs - hf)
        zf = hf + conv_frac
        l1x1_w = to_q(l.l1x1_w, lin_frac - fmt.z_frac)
        layers.append(QLayer(
            kernel=l.kernel, dilation=l.dilation, conv_frac=conv_frac,
            conv_w=to_q(l.conv_w, conv_frac),
            conv_b=to_q(l.conv_b, zf - cs),
            mixin=to_q(l.mixin, zf - fmt.x_frac),
            l1x1_w=l1x1_w,
            l1x1_b=to_q(l.l1x1_b, lin_frac - cs),
            z_shift=zf - fmt.z_frac - fmt.z_split,
            hist_in_bits=hb, hist_in_frac=hf,
            # The low part multiplies the same weight shifted right (truncated) in the datapath.
            l1x1_w_lo=(l1x1_w >> fmt.z_split) if fmt.z_split else None))
        hist_shifts.append(lin_frac - hf)
    head_frac = min(qexp(np.abs(w.head_w).max()), qexp(abs(w.head_b)) + cs - fmt.hsum_frac)
    y_frac = qexp(fmt.out_headroom / w.head_scale)
    return QWeights(
        channels=c, fmt=fmt, lin_frac=lin_frac,
        rechannel=to_q(w.rechannel, lin_frac - fmt.x_frac),
        layers=layers,
        head_frac=head_frac,
        head_w=to_q(w.head_w, head_frac),
        head_b=int(to_q(w.head_b, fmt.hsum_frac + head_frac - cs)),
        y_frac=y_frac,
        y_shift=fmt.hsum_frac + head_frac - y_frac,
        head_scale=w.head_scale,
        hist_shifts=hist_shifts,
        hsum_shift=fmt.z_frac + fmt.z_split - fmt.hsum_frac - fmt.hsum_split,
        head_w_lo=(to_q(w.head_w, head_frac) >> fmt.hsum_split) if fmt.hsum_split else None)


def split(v, low_bits):
    """A wide activation as the 18-bit high part and the unsigned low part."""
    v = np.asarray(v, dtype=np.int64)
    return v >> low_bits, v & ((1 << low_bits) - 1)


def quantise_input(x, fmt: Formats = Formats()):
    """Float samples to the engine's 18-bit input."""
    return shift_round_sat(round_half_up(np.asarray(x) * 2.0 ** fmt.x_frac), 0, 18)


def output_gain_q(q: QWeights, gain_db=0.0, gain_frac=None):
    """The output gain word: head_scale times the linear gain, and the shift to Q15."""
    g = q.head_scale * 10 ** (gain_db / 20.0)
    if gain_frac is None:
        gain_frac = qexp(g)
    return int(to_q(g, gain_frac)), q.y_frac + gain_frac - 15


def run_fixed(q: QWeights, xq, prewarm=True, gain_db=0.0, taps=None, check=True):
    """The engine's output (Q15, 16-bit) for the 18-bit input `xq`.

    `taps` receives the integer internals: "hist" [layer][t][c] as stored,
    "z" [layer][t][c], "hsum" [t][c] as stored, "y" [t], and the peak
    accumulator magnitudes "acc_peak"."""
    fmt = q.fmt
    c = q.channels
    xq = np.asarray(xq, dtype=np.int64)
    pad = RECEPTIVE_FIELD if prewarm else 0
    xe = np.concatenate([np.zeros(pad, dtype=np.int64), xq])
    n = len(xe)
    const = np.int64(1 << fmt.const_shift)
    acc_lim = 1 << (fmt.acc_bits - 1)
    peaks = {}

    def note(name, a):
        peaks[name] = max(peaks.get(name, 0), int(np.abs(a).max(initial=0)))
        if check:
            assert np.abs(a).max(initial=0) < acc_lim, (name, np.abs(a).max())

    lin = np.outer(xe, q.rechannel)                      # LIN, Q(lin_frac)
    note("lin", lin)
    hsum = np.zeros((n, c), dtype=np.int64)              # H, Q(z_frac)
    if taps is not None:
        taps["hist"] = []
        taps["z"] = []
    for i, l in enumerate(q.layers):
        hist = shift_round_sat(lin, q.hist_shifts[i], l.hist_in_bits)
        z = np.outer(xe, l.mixin) + const * l.conv_b
        for k in range(l.kernel):
            z += delayed(hist, (l.kernel - 1 - k) * l.dilation) @ l.conv_w[k].T
        note("z", z)
        z = leaky(z)
        zq = shift_round_sat(z, l.z_shift, 18 + fmt.z_split)
        hsum += zq
        if fmt.z_split:
            z_hi, z_lo = split(zq, fmt.z_split)
            lin = lin + z_hi @ l.l1x1_w.T + z_lo @ l.l1x1_w_lo.T + const * l.l1x1_b
        else:
            lin = lin + zq @ l.l1x1_w.T + const * l.l1x1_b
        note("lin", lin)
        if taps is not None:
            taps["hist"].append(hist[pad:])
            taps["z"].append(zq[pad:])
    hs = shift_round_sat(hsum, q.hsum_shift, 18 + fmt.hsum_split)
    y = np.full(n, const * q.head_b, dtype=np.int64)
    if fmt.hsum_split:
        hs_hi, hs_lo = split(hs, fmt.hsum_split)
        for k in range(HEAD_KERNEL):
            y += delayed(hs_hi, HEAD_KERNEL - 1 - k) @ q.head_w[k]
            y += delayed(hs_lo, HEAD_KERNEL - 1 - k) @ q.head_w_lo[k]
    else:
        for k in range(HEAD_KERNEL):
            y += delayed(hs, HEAD_KERNEL - 1 - k) @ q.head_w[k]
    note("head", y)
    yq = shift_round_sat(y, q.y_shift, 18)
    gq, gshift = output_gain_q(q, gain_db)
    out = shift_round_sat(yq * gq, gshift, 16)
    if taps is not None:
        taps["hsum"] = hs[pad:]
        taps["y"] = yq[pad:]
        taps["acc_peak"] = peaks
    return out[pad:]
