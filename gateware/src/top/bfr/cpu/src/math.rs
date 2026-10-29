//! f64 math for coefficient expressions (no `libm` in `no_std`).
//!
//! `exp`, `ln` and the sine/cosine kernels follow fdlibm (as in musl), so
//! results are within about 1 ulp of the correctly rounded value. `tan` is
//! sin/cos and `pow` is exp(y ln x): a few ulp. Rounded to f32, as the
//! coefficients are, the results nearly always equal the model's (Python,
//! the host's C library); `test_firmware.py` measures how often.

const LN2_HI: f64 = 6.93147180369123816490e-01;
const LN2_LO: f64 = 1.90821492927058770002e-10;

fn hi_word(x: f64) -> i32 {
    (x.to_bits() >> 32) as i32
}

fn with_hi_word(x: f64, hi: u32) -> f64 {
    f64::from_bits((x.to_bits() & 0xFFFF_FFFF) | ((hi as u64) << 32))
}

/// x * 2^k.
pub fn scalbn(mut x: f64, mut k: i32) -> f64 {
    let p1023 = f64::from_bits(0x7FE0_0000_0000_0000);       // 2^1023
    let m1022 = f64::from_bits(0x0010_0000_0000_0000);       // 2^-1022
    if k > 1023 {
        x *= p1023;
        k -= 1023;
        if k > 1023 {
            x *= p1023;
            k = (k - 1023).min(1023);
        }
    } else if k < -1022 {
        x *= m1022 * f64::from_bits(0x4340_0000_0000_0000); // 2^-969
        k += 1022 - 53;
        if k < -1022 {
            x *= m1022 * f64::from_bits(0x4340_0000_0000_0000);
            k = (k + 1022 - 53).max(-1022);
        }
    }
    x * f64::from_bits(((0x3FF + k) as u64) << 52)
}

pub fn exp(x: f64) -> f64 {
    const INVLN2: f64 = 1.44269504088896338700e+00;
    const P1: f64 = 1.66666666666666019037e-01;
    const P2: f64 = -2.77777777770155933842e-03;
    const P3: f64 = 6.61375632143793436117e-05;
    const P4: f64 = -1.65339022054652515390e-06;
    const P5: f64 = 4.13813679705723846039e-08;
    if x.is_nan() {
        return x;
    }
    if x > 7.09782712893383973096e+02 {
        return f64::INFINITY;
    }
    if x < -7.45133219101941108420e+02 {
        return 0.0;
    }
    let ax = x.abs();
    let (k, hi, lo, r);
    if ax > 0.34657359027997264 {                   // |x| > ln2 / 2: reduce
        k = if ax < 1.0397207708399179 {            // |x| < 3 ln2 / 2
            if x > 0.0 { 1 } else { -1 }
        } else {
            (INVLN2 * x + if x > 0.0 { 0.5 } else { -0.5 }) as i32     // toward zero, as in C
        };
        let kf = k as f64;
        hi = x - kf * LN2_HI;
        lo = kf * LN2_LO;
        r = hi - lo;
    } else if ax < 3.725290298461914e-09 {
        return 1.0 + x;
    } else {
        k = 0;
        hi = 0.0;
        lo = 0.0;
        r = x;
    }
    let t = r * r;
    let c = r - t * (P1 + t * (P2 + t * (P3 + t * (P4 + t * P5))));
    if k == 0 {
        return 1.0 - ((r * c) / (c - 2.0) - r);
    }
    let y = 1.0 - ((lo - (r * c) / (2.0 - c)) - hi);
    scalbn(y, k)
}

/// Natural logarithm.
pub fn ln(x: f64) -> f64 {
    const TWO54: f64 = 1.80143985094819840000e+16;
    const LG1: f64 = 6.666666666666735130e-01;
    const LG2: f64 = 3.999999999940941908e-01;
    const LG3: f64 = 2.857142874366239149e-01;
    const LG4: f64 = 2.222219843214978396e-01;
    const LG5: f64 = 1.818357216161805012e-01;
    const LG6: f64 = 1.531383769920937332e-01;
    const LG7: f64 = 1.479819860511658591e-01;
    let mut x = x;
    let mut hx = hi_word(x);
    let lx = x.to_bits() as u32;
    let mut k: i32 = 0;
    if hx < 0x0010_0000 {
        if ((hx & 0x7FFF_FFFF) as u32 | lx) == 0 {
            return f64::NEG_INFINITY;
        }
        if hx < 0 {
            return f64::NAN;
        }
        k -= 54;
        x *= TWO54;
        hx = hi_word(x);
    }
    if hx >= 0x7FF0_0000 {
        return x + x;
    }
    k += (hx >> 20) - 1023;
    hx &= 0x000F_FFFF;
    let i = (hx + 0x95F64) & 0x10_0000;
    x = with_hi_word(x, (hx | (i ^ 0x3FF0_0000)) as u32);
    k += i >> 20;
    let f = x - 1.0;
    let dk = k as f64;
    if (0x000F_FFFF & (2 + hx)) < 3 {
        if f == 0.0 {
            return if k == 0 { 0.0 } else { dk * LN2_HI + dk * LN2_LO };
        }
        let r = f * f * (0.5 - 0.33333333333333333 * f);
        return if k == 0 { f - r } else { dk * LN2_HI - ((r - dk * LN2_LO) - f) };
    }
    let s = f / (2.0 + f);
    let z = s * s;
    let mut i = hx - 0x6147A;
    let w = z * z;
    let j = 0x6B851 - hx;
    let t1 = w * (LG2 + w * (LG4 + w * LG6));
    let t2 = z * (LG1 + w * (LG3 + w * (LG5 + w * LG7)));
    i |= j;
    let r = t2 + t1;
    if i > 0 {
        let hfsq = 0.5 * f * f;
        if k == 0 {
            f - (hfsq - s * (hfsq + r))
        } else {
            dk * LN2_HI - ((hfsq - (s * (hfsq + r) + dk * LN2_LO)) - f)
        }
    } else if k == 0 {
        f - s * (f - r)
    } else {
        dk * LN2_HI - ((s * (f - r) - dk * LN2_LO) - f)
    }
}

pub fn pow(x: f64, y: f64) -> f64 {
    if y == 0.0 || x == 1.0 {
        return 1.0;
    }
    if x > 0.0 {
        return exp(y * ln(x));
    }
    if x == 0.0 {
        return if y > 0.0 { 0.0 } else { f64::INFINITY };
    }
    if floor(y) == y {
        let v = exp(y * ln(-x));
        return if floor(y * 0.5) * 2.0 == y { v } else { -v };
    }
    f64::NAN
}

pub fn sqrt(x: f64) -> f64 {
    if x <= 0.0 {
        return if x == 0.0 { 0.0 } else { f64::NAN };
    }
    if !x.is_finite() {
        return x;
    }
    // Halve the exponent for a first guess, then Newton (quadratic).
    let mut y = f64::from_bits((x.to_bits() >> 1) + (0x3FF << 51));
    for _ in 0..6 {
        y = 0.5 * (y + x / y);
    }
    // Last ulp: pick the neighbour whose square is closest.
    for cand in [f64::from_bits(y.to_bits() - 1), f64::from_bits(y.to_bits() + 1)] {
        if (cand * cand - x).abs() < (y * y - x).abs() {
            y = cand;
        }
    }
    y
}

pub fn floor(x: f64) -> f64 {
    if !(x.abs() < 4503599627370496.0) {
        return x;                       // already whole (or NaN / infinite)
    }
    let t = x as i64 as f64;            // toward zero
    if t > x { t - 1.0 } else { t }
}

pub fn abs(x: f64) -> f64 {
    x.abs()
}

pub fn min(x: f64, y: f64) -> f64 {
    if y < x { y } else { x }
}

pub fn max(x: f64, y: f64) -> f64 {
    if y > x { y } else { x }
}

// -- sine, cosine ---------------------------------------------------------------

fn k_sin(x: f64, y: f64) -> f64 {
    const S1: f64 = -1.66666666666666324348e-01;
    const S2: f64 = 8.33333333332248946124e-03;
    const S3: f64 = -1.98412698298579493134e-04;
    const S4: f64 = 2.75573137070700676789e-06;
    const S5: f64 = -2.50507602534068634195e-08;
    const S6: f64 = 1.58969099521155010221e-10;
    let z = x * x;
    let v = z * x;
    let r = S2 + z * (S3 + z * (S4 + z * (S5 + z * S6)));
    x - ((z * (0.5 * y - v * r) - y) - v * S1)
}

fn k_cos(x: f64, y: f64) -> f64 {
    const C1: f64 = 4.16666666666666019037e-02;
    const C2: f64 = -1.38888888888741095749e-03;
    const C3: f64 = 2.48015872894767294178e-05;
    const C4: f64 = -2.75573143513906633035e-07;
    const C5: f64 = 2.08757232129817482790e-09;
    const C6: f64 = -1.13596475577881948265e-11;
    let z = x * x;
    let w = z * z;
    let r = z * (C1 + z * (C2 + z * C3)) + w * w * (C4 + z * (C5 + z * C6));
    let hz = 0.5 * z;
    let w = 1.0 - hz;
    w + (((1.0 - w) - hz) + (z * r - x * y))
}

/// x - n pi/2 as (n, y0 + y1), for |x| < 2^20 pi/2 (musl's medium case).
fn rem_pio2(x: f64) -> (i32, f64, f64) {
    const INVPIO2: f64 = 6.36619772367581382433e-01;
    const PIO2_1: f64 = 1.57079632673412561417e+00;
    const PIO2_1T: f64 = 6.07710050650619224932e-11;
    const PIO2_2: f64 = 6.07710050630396597660e-11;
    const PIO2_2T: f64 = 2.02226624879595063154e-21;
    const PIO2_3: f64 = 2.02226624871116645580e-21;
    const PIO2_3T: f64 = 8.47842766036889956997e-32;
    let fnn = floor(x * INVPIO2 + 0.5);
    let n = fnn as i32;
    let mut r = x - fnn * PIO2_1;
    let mut w = fnn * PIO2_1T;
    let mut y0 = r - w;
    let ex = ((x.to_bits() >> 52) & 0x7FF) as i32;
    let ey = ((y0.to_bits() >> 52) & 0x7FF) as i32;
    if ex - ey > 16 {
        let t = r;
        w = fnn * PIO2_2;
        r = t - w;
        w = fnn * PIO2_2T - ((t - r) - w);
        y0 = r - w;
        let ey = ((y0.to_bits() >> 52) & 0x7FF) as i32;
        if ex - ey > 49 {
            let t = r;
            w = fnn * PIO2_3;
            r = t - w;
            w = fnn * PIO2_3T - ((t - r) - w);
            y0 = r - w;
        }
    }
    let y1 = (r - y0) - w;
    (n, y0, y1)
}

pub fn sin(x: f64) -> f64 {
    if x.abs() < 7.4505806e-9 {
        return x;
    }
    if !(x.abs() < 1647099.0) {
        return f64::NAN;                // beyond the reduction here (unused)
    }
    let (n, y0, y1) = rem_pio2(x);
    match n & 3 {
        0 => k_sin(y0, y1),
        1 => k_cos(y0, y1),
        2 => -k_sin(y0, y1),
        _ => -k_cos(y0, y1),
    }
}

pub fn cos(x: f64) -> f64 {
    if x.abs() < 7.4505806e-9 {
        return 1.0;
    }
    if !(x.abs() < 1647099.0) {
        return f64::NAN;
    }
    let (n, y0, y1) = rem_pio2(x);
    match n & 3 {
        0 => k_cos(y0, y1),
        1 => -k_sin(y0, y1),
        2 => -k_cos(y0, y1),
        _ => k_sin(y0, y1),
    }
}

pub fn tan(x: f64) -> f64 {
    sin(x) / cos(x)
}

/// The model's f32 rounding of a coefficient (ties to even; zero is +0).
pub fn f32_bits(x: f64) -> u32 {
    if x == 0.0 { 0 } else { (x as f32).to_bits() }
}
