"""Combinational arithmetic helpers for the engine datapath.

Each function returns Amaranth expressions; the caller decides where the
pipeline registers go. The results match `model/fp.py` bit for bit.
"""

from amaranth import *
from amaranth.lib import data

# A decoded f32 operand: value = (-1)^sign * mant * 2^(exp - 23), or zero.
Decoded = data.StructLayout({"sign": 1, "exp": signed(10), "mant": 24, "zero": 1})


def msb(value):
    """(any bit set, index of the highest set bit), as a balanced mux tree."""
    w = 2
    while w < len(value):
        w *= 2
    bits = Cat(value, C(0, w - len(value))) if w > len(value) else value

    def rec(b):
        n = len(b)
        if n == 2:
            return b[0] | b[1], b[1]
        lo_any, lo_pos = rec(b[:n // 2])
        hi_any, hi_pos = rec(b[n // 2:])
        return lo_any | hi_any, Mux(hi_any, Cat(hi_pos, C(1, 1)), Cat(lo_pos, C(0, 1)))
    return rec(bits)


def decode(bits):
    """f32 bits -> fields of a Decoded (exponent 0 is zero, 255 is an ordinary number)."""
    e = bits[23:31]
    return {"sign": bits[31], "exp": e - 127, "mant": Cat(bits[0:23], C(1, 1)), "zero": e == 0}


def assign(view, fields):
    """Statements assigning a dict of fields to a Decoded view."""
    return [getattr(view, k).eq(v) for k, v in fields.items()]


IntToF32A = data.StructLayout({"neg": 1, "mag": 25, "any": 1, "k": 5, "e0": signed(7)})


def int_to_f32_a(x, e0, width=26):
    """First half of int -> f32: sign, magnitude and its highest bit."""
    neg = x[width - 1]
    mag = Mux(neg, -x, x)[:25]
    any_, k = msb(mag)                          # k <= 24
    return {"neg": neg, "mag": mag, "any": any_, "k": k, "e0": e0}


def int_to_f32_b(a):
    """Second half: signed integer (|x| <= 2^24) times 2^e0 -> f32 bits (exact)."""
    shifted = (a.mag << (23 - a.k)[:5])[:24]
    mant = Mux(a.k == 24, a.mag[1:25], shifted)
    e = (a.k + a.e0 + 127)[:8]
    return Mux(a.any, Cat(mant[:23], e, a.neg), 0)


def fix_to_out(bits, width):
    """OUT register (value x 2^24, from a fixed-point store) -> signed
    `width`-bit sample: rounded half up and saturated, as fp.fix_to_out."""
    sh = 25 - width
    q = (bits.as_signed() + (1 << (sh - 1))) >> sh
    hi = (1 << (width - 1)) - 1
    return Mux(q > hi, hi, Mux(q < -hi - 1, -hi - 1, q))
