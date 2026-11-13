//! Fixed-point formats and weight quantisation: `model/fixed.py`'s `Formats`, `qexp`, `to_q`
//! and `quantise`, bit for bit. The weights arrive as f64 (parsed from the file's decimal text
//! as Python parses them) and leave as 18-bit integers with the shifts the engine needs.

pub const W_BITS: u32 = 18;
pub const W_MAX: i64 = (1 << (W_BITS - 1)) - 1;
pub const CONST_SHIFT: u32 = 16;
pub const HEAD_KERNEL: usize = 16;
pub const MAX_LAYERS: usize = 23;
pub const MAX_CHANNELS: usize = 8;

/// The engine's number formats (`fixed.Formats`): how the firmware quantises every profile.
#[derive(Clone, Copy, PartialEq, Eq, Debug)]
pub struct Formats {
    pub x_frac: u32,
    pub hist_frac: u32,
    pub z_frac: u32,
    pub hsum_frac: u32,
    pub acc_bits: u32,
    pub z_split: u32,
    pub psram_frac: u32,
}

impl Formats {
    pub const DEFAULT: Formats = Formats {
        x_frac: 15,
        hist_frac: 13,
        z_frac: 12,
        hsum_frac: 11,
        acc_bits: 40,
        z_split: 6,
        psram_frac: 11,
    };

    /// Where the output stays representable before the output gain, as a factor of full scale.
    pub const OUT_HEADROOM: f64 = 2.0;
}

/// Round to the nearest integer, halves up (`fixed.round_half_up`).
pub fn round_half_up(v: f64) -> i64 {
    libm_floor(v + 0.5) as i64
}

/// `f64::floor` without std: the integer part, towards minus infinity.
pub fn libm_floor(v: f64) -> f64 {
    let t = v as i64 as f64; // truncates towards zero (in range for every weight here)
    if t > v { t - 1.0 } else { t }
}

/// Largest exponent f with round(maxabs * 2**f) <= W_MAX (`fixed.qexp`).
pub fn qexp(maxabs: f64) -> i32 {
    if maxabs <= 0.0 {
        return 30;
    }
    // maxabs = m * 2**e with m in [0.5, 1)
    let bits = maxabs.to_bits();
    let exp = ((bits >> 52) & 0x7FF) as i32;
    let e = if exp == 0 { -1022 } else { exp - 1023 } + 1;
    let mut f = (W_BITS as i32 - 1) - e;
    while round_half_up(maxabs * pow2(f)) > W_MAX {
        f -= 1;
    }
    while round_half_up(maxabs * pow2(f + 1)) <= W_MAX {
        f += 1;
    }
    f
}

/// 2**f as an f64, exactly.
pub fn pow2(f: i32) -> f64 {
    f64::from_bits(((1023 + f) as u64) << 52)
}

/// `fixed.to_q`: the weight at Q(frac).
pub fn to_q(value: f64, frac: i32) -> i32 {
    let q = round_half_up(value * pow2(frac));
    debug_assert!(q.abs() <= W_MAX, "weight {value} doesn't fit Q{frac}");
    q as i32
}

/// Where a layer's history lives and how.
#[derive(Clone, Copy, PartialEq, Eq, Debug)]
pub struct LayerPlan {
    pub kernel: u32,
    pub dilation: u32,
    pub psram: bool,
    /// Fractional bits of the stored history (18-bit words in block RAM, 16-bit in PSRAM).
    pub hist_frac: u32,
    pub hist_bits: u32,
}

/// The largest magnitudes of each weight class, from the first pass over a file.
#[derive(Clone, Copy, Debug, Default)]
pub struct LayerMax {
    pub conv_w: f64,
    pub conv_b: f64,
    pub mixin: f64,
    pub l1x1_w: f64,
    pub l1x1_b: f64,
}

#[derive(Clone, Copy, Debug, Default)]
pub struct Maxes {
    pub rechannel: f64,
    pub layers: [LayerMax; MAX_LAYERS],
    pub head_w: f64,
    pub head_b: f64,
}

/// The exponents a profile is quantised with (`fixed.quantise` without the arrays).
#[derive(Clone, Copy, Debug)]
pub struct Exponents {
    pub lin_frac: i32,
    pub conv_frac: [i32; MAX_LAYERS],
    pub z_shift: [i32; MAX_LAYERS],
    pub hist_shift: [i32; MAX_LAYERS],
    pub head_frac: i32,
    pub y_frac: i32,
    pub y_shift: i32,
    pub hsum_shift: i32,
}

impl Exponents {
    pub fn choose(fmt: &Formats, plan: &[LayerPlan], m: &Maxes, head_scale: f64) -> Exponents {
        let cs = CONST_SHIFT as i32;
        let mut lin_frac = qexp(m.rechannel) + fmt.x_frac as i32;
        for (i, _) in plan.iter().enumerate() {
            lin_frac = lin_frac.min(qexp(m.layers[i].l1x1_w) + fmt.z_frac as i32);
            lin_frac = lin_frac.min(qexp(m.layers[i].l1x1_b) + cs);
        }
        lin_frac = lin_frac.min(fmt.acc_bits as i32 - 8);
        let mut e = Exponents {
            lin_frac,
            conv_frac: [0; MAX_LAYERS],
            z_shift: [0; MAX_LAYERS],
            hist_shift: [0; MAX_LAYERS],
            head_frac: 0,
            y_frac: 0,
            y_shift: 0,
            hsum_shift: fmt.z_frac as i32 + fmt.z_split as i32 - fmt.hsum_frac as i32,
        };
        for (i, l) in plan.iter().enumerate() {
            let hf = l.hist_frac as i32;
            let lm = &m.layers[i];
            let conv_frac = qexp(lm.conv_w)
                .min(qexp(lm.mixin) + fmt.x_frac as i32 - hf)
                .min(qexp(lm.conv_b) + cs - hf);
            e.conv_frac[i] = conv_frac;
            e.z_shift[i] = hf + conv_frac - fmt.z_frac as i32 - fmt.z_split as i32;
            e.hist_shift[i] = lin_frac - hf;
        }
        e.head_frac = qexp(m.head_w).min(qexp(m.head_b) + cs - fmt.hsum_frac as i32);
        e.y_frac = qexp(Formats::OUT_HEADROOM / head_scale);
        e.y_shift = fmt.hsum_frac as i32 + e.head_frac - e.y_frac;
        e
    }
}

/// The output gain word and its shift to Q15 (`fixed.output_gain_q`): head_scale times the
/// linear gain.
pub fn output_gain(head_scale: f64, gain_db: f64, y_frac: i32) -> (i32, i32) {
    let g = head_scale * db_to_linear(gain_db);
    let frac = qexp(g);
    (to_q(g, frac), y_frac + frac - 15)
}

/// The input gain word and its shift (`program.build`'s input stage).
pub fn input_gain(gain_db: f64) -> (i32, i32) {
    let g = db_to_linear(gain_db);
    let frac = qexp(if g > 1.0 / 64.0 { g } else { 1.0 / 64.0 });
    (round_half_up(g * pow2(frac)) as i32, frac)
}

/// 10**(db/20), as Python computes `10 ** (db / 20.0)`: through exp and ln in f64.
pub fn db_to_linear(db: f64) -> f64 {
    if db == 0.0 {
        return 1.0;
    }
    exp(db / 20.0 * LN10)
}

const LN10: f64 = 2.302585092994046;

/// e**x for moderate x (|x| < 20): range reduction by powers of two and a Taylor series.
pub fn exp(x: f64) -> f64 {
    let k = libm_floor(x / core::f64::consts::LN_2 + 0.5) as i32;
    let r = x - k as f64 * core::f64::consts::LN_2;
    let mut term = 1.0;
    let mut sum = 1.0;
    for n in 1..30 {
        term *= r / n as f64;
        sum += term;
        if term.abs() < 1e-18 {
            break;
        }
    }
    sum * pow2(k)
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn qexp_fills_18_bits() {
        assert_eq!(qexp(1.0), 16);
        assert_eq!(qexp(0.70), 17);
        assert_eq!(qexp(0.51), 17);
        assert_eq!(qexp(1.31), 16);
        assert_eq!(qexp(100.0), 10);
        assert_eq!(qexp(0.05), 21);
        for &v in &[0.3, 0.999, 1.0001, 7.5, 0.001, 123.4] {
            let f = qexp(v);
            assert!(round_half_up(v * pow2(f)) <= W_MAX);
            assert!(round_half_up(v * pow2(f + 1)) > W_MAX);
        }
    }

    #[test]
    fn rounding_is_half_up() {
        assert_eq!(round_half_up(2.5), 3);
        assert_eq!(round_half_up(-2.5), -2);
        assert_eq!(round_half_up(-2.6), -3);
        assert_eq!(round_half_up(0.49999), 0);
    }

    #[test]
    fn gains_match_python() {
        // 10 ** (-3 / 20) = 0.7079457843841379
        let g = db_to_linear(-3.0);
        assert!((g - 0.7079457843841379).abs() < 1e-15, "{g}");
        let (q, shift) = output_gain(0.05, -3.0, 11);
        // round(0.05 * 0.70794578 * 2**21) = round(74233.3)
        assert_eq!((q, shift), (74233, 17));
        assert_eq!(input_gain(0.0), (65536, 16));
        let (q, shift) = input_gain(6.0);
        assert_eq!(shift, 16);
        assert_eq!(q, round_half_up(1.9952623149688795 * 65536.0) as i32);
    }
}
