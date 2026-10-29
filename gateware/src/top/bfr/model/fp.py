"""Number formats of the bfr engine, bit-exact.

This module defines the arithmetic. The gateware, the engine model and any
other implementation must give exactly these results. Each operation has an
integer definition (on bit patterns), and a float-backed version that the
engine uses for speed; `test_model.py` checks that the two agree.

Values
    IEEE-754 binary32 bit patterns ("f32"). On read, exponent 0 (zero and
    denormals) is zero, and exponent 255 (Inf/NaN in IEEE) is an ordinary
    number, 1.m * 2^128. The engine itself only ever produces +0 or normal
    numbers, so these rules only matter for coefficients written by the CPU.

Accumulator
    Signed fixed point with 48 fraction bits: 57 bits two's complement,
    saturating symmetrically at +-(2^56 - 1) LSBs (just under +-256).

Products
    a * b is exact (24 x 24 bit mantissas), then truncated toward zero to a
    multiple of 2^-48 and saturated.

Writeback (accumulator to f32)
    The magnitude is rounded to 24 significant bits, ties away from zero.
    Every accumulator value converts to +0 or a normal number.

Why the float-backed versions are exact: every f32 value is exactly a double;
a product of two 24-bit mantissas has 48 bits and fits a double's 53, as do
the exponent ranges; scaling by 2^48 is exact; and int() of the scaled
product truncates toward zero. When the scaled product is 2^53 or more it is
already an integer. The accumulator itself is kept as a Python int.
"""

import math
import struct

ACC_FRAC = 48
ACC_INT = 8
ACC_MAX = (1 << (ACC_INT + ACC_FRAC)) - 1      # 2^56 - 1 LSBs
ACC_SCALE = float(1 << ACC_FRAC)               # 2^48
ACC_LIMIT = float(1 << (ACC_INT + ACC_FRAC))   # 2^56: products at or above saturate

FRAC_BITS = 16                                 # interpolation fraction (modulated taps)


# -- integer definitions ------------------------------------------------------

def decode(bits):
    """f32 bits -> (negative, 24-bit mantissa, unbiased exponent), or None for zero."""
    e = (bits >> 23) & 0xFF
    if e == 0:
        return None
    return bool(bits >> 31), (bits & 0x7FFFFF) | 0x800000, e - 127


def sat(x):
    """Saturate an accumulator value (LSBs)."""
    if x > ACC_MAX:
        return ACC_MAX
    if x < -ACC_MAX:
        return -ACC_MAX
    return x


def mul(a_bits, b_bits):
    """Product of two f32 values in accumulator LSBs (truncated, saturated)."""
    da, db = decode(a_bits), decode(b_bits)
    if da is None or db is None:
        return 0
    (sa, ma, ea), (sb, mb, eb) = da, db
    p = ma * mb                      # value p * 2^(ea + eb - 46), p in [2^46, 2^48)
    s = ea + eb + 2                  # in LSBs of 2^-48: p * 2^s
    if s >= 0:
        q = ACC_MAX if s > 10 else min(p << s, ACC_MAX)
    else:
        q = p >> -s if -s < 48 else 0
    return -q if sa != sb else q


def acc_to_bits(acc):
    """Accumulator (LSBs) -> f32 bits: round to 24 significant bits, ties away from zero."""
    if acc == 0:
        return 0
    neg = acc < 0
    m = -acc if neg else acc
    k = m.bit_length() - 1           # 0..55
    if k > 23:
        sh = k - 23
        r = (m + (1 << (sh - 1))) >> sh
        if r == 1 << 24:
            r >>= 1
            k += 1
    else:
        r = m << (23 - k)
    e = k - ACC_FRAC + 127           # 79..136, always a normal number
    return (neg << 31) | (e << 23) | (r & 0x7FFFFF)


def scale(c_bits, w_bits):
    """Coefficient times weight -> f32 bits (the B operand of a crossfaded tap).

    The exact product is rounded to 24 significant bits, ties away from zero.
    Results below the normal range are zero; above it they saturate (which a
    weight of at most 1 never causes).
    """
    dc, dw = decode(c_bits), decode(w_bits)
    if dc is None or dw is None:
        return 0
    (sc, mc, ec), (sw, mw, ew) = dc, dw
    p = mc * mw                      # value p * 2^(ec + ew - 46)
    e, sh = ec + ew, 23
    if p >= 1 << 47:
        e, sh = e + 1, 24
    r = (p + (1 << (sh - 1))) >> sh
    if r == 1 << 24:
        r, e = r >> 1, e + 1
    if e < -126:
        return 0
    if e > 128:
        e, r = 128, (1 << 24) - 1
    return ((sc != sw) << 31) | ((e + 127) << 23) | (r & 0x7FFFFF)


def in_to_bits(x, width):
    """Signed `width`-bit CODEC sample -> f32 bits (exact, full scale = 1.0)."""
    return acc_to_bits(x << (ACC_FRAC - (width - 1)))


def bits_to_out(bits, width):
    """f32 bits -> signed `width`-bit CODEC sample: round ties away from zero, saturate."""
    d = decode(bits)
    if d is None:
        return 0
    neg, m, e = d
    s = e - 23 + (width - 1)         # value * 2^(width-1) = m * 2^s
    hi = (1 << (width - 1)) - 1
    if s >= 0:
        v = hi + 1 if s > width else m << s
    elif -s > 25:
        v = 0
    else:
        v = (m + (1 << (-s - 1))) >> -s
    if neg:
        return -min(v, hi + 1)
    return min(v, hi)


MOD_SHIFT = 24                  # fixed-point store: floor(acc / 2^24)
MOD_SCALE = 1.0 / 256           # what the compiler scales a modulation depth by


def acc_to_fix(acc):
    """Accumulator -> modulation register (fixed-point store).

    floor(acc / 2^24), saturated to 32 bits signed. With the depth scaled by
    MOD_SCALE in the accumulator, the register holds samples * 2^16.
    """
    v = acc >> MOD_SHIFT
    return max(-(1 << 31), min((1 << 31) - 1, v))


def interp_split(mq, depth):
    """Modulation register (samples * 2^16) -> (whole samples, 16-bit fraction),
    clamped to +-depth samples."""
    lim = depth << FRAC_BITS
    mq = max(-lim, min(lim, mq))
    return mq >> FRAC_BITS, mq & ((1 << FRAC_BITS) - 1)


# -- float-backed versions (used by the engine) ------------------------------

_U32 = struct.Struct('<I')
_F32 = struct.Struct('<f')


def bits_to_float(bits):
    """f32 bits -> exact Python float, with the read rules above."""
    e = (bits >> 23) & 0xFF
    if e == 0:
        return 0.0
    if e == 255:
        v = math.ldexp((bits & 0x7FFFFF) | 0x800000, 128 - 23)
        return -v if bits >> 31 else v
    return _F32.unpack(_U32.pack(bits))[0]


def float_to_bits(x):
    """Exact f32-valued Python float -> bits (as produced by the engine)."""
    if x == 0.0:
        return 0
    return _U32.unpack(_F32.pack(x))[0]


def f32_round(x):
    """Round a double to f32 bits (ties to even), as coefficient values are.

    Results below the normal range read back as zero.
    """
    if not math.isfinite(x):
        raise ValueError(f"coefficient {x!r} is not finite")
    if x == 0.0:
        return 0
    try:
        return _U32.unpack(_F32.pack(x))[0]
    except OverflowError:
        raise ValueError(f"coefficient {x!r} is out of the f32 range") from None


def mul_fast(x, y):
    """Product of two f32-valued floats in accumulator LSBs."""
    p = x * y * ACC_SCALE
    if -ACC_LIMIT < p < ACC_LIMIT:
        return int(p)
    return ACC_MAX if p > 0 else -ACC_MAX


_MIN_NORMAL = 2.0 ** -126
_SCALE_MAX = math.ldexp((1 << 24) - 1, 128 - 23)


def scale_fast(c, w):
    """Float version of scale()."""
    x = c * w
    if x == 0.0:
        return 0.0
    m, ex = math.frexp(abs(x))      # m in [0.5, 1)
    v = math.ldexp(math.floor(m * 16777216.0 + 0.5), ex - 24)
    if v < _MIN_NORMAL:
        return 0.0
    if v > _SCALE_MAX:
        v = _SCALE_MAX
    return -v if x < 0 else v


def acc_to_float(acc):
    """Accumulator (LSBs) -> exact f32-valued float (same rounding as acc_to_bits)."""
    if acc == 0:
        return 0.0
    m = -acc if acc < 0 else acc
    k = m.bit_length()
    if k > 24:
        sh = k - 24
        v = math.ldexp((m + (1 << (sh - 1))) >> sh, sh - ACC_FRAC)
    else:
        v = math.ldexp(m, -ACC_FRAC)
    return -v if acc < 0 else v


def fix_to_out(x, width):
    """OUT register (fixed point: value x 2^24, from a fixed-point store) ->
    signed `width`-bit CODEC sample: rounded half up, saturated."""
    sh = MOD_SHIFT + 1 - width
    v = int(x)
    v = (v + (1 << (sh - 1))) >> sh if sh > 0 else v << -sh
    hi = (1 << (width - 1)) - 1
    return max(-hi - 1, min(hi, v))


def float_to_out(x, width):
    """f32-valued float -> signed `width`-bit CODEC sample (as bits_to_out)."""
    s = x * (1 << (width - 1))
    v = math.floor(abs(s) + 0.5)
    hi = (1 << (width - 1)) - 1
    if s < 0:
        return -min(v, hi + 1)
    return min(v, hi)


