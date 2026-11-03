//! Values as text, in integer arithmetic: core's float formatting is about
//! 16 KB of firmware (top/bfr/README.md).

use core::fmt::Write;

use heapless::String;

/// Millivolts as a signed two-decimal voltage: `+1.23V`, `-0.05V`, `+0.00V`.
pub fn volts(mv: i32) -> String<8> {
    let sign = if mv < 0 { '-' } else { '+' };
    // To the nearest 10 mV.
    let cv = (mv.unsigned_abs().min(99_994) + 5) / 10;
    let mut s = String::new();
    write!(s, "{}{}.{:02}V", sign, cv / 100, cv % 100).ok();
    s
}

/// Thousandths as a percentage with one decimal: `50.0%`.
pub fn permille(value: i32) -> String<11> {
    let mut s = String::new();
    let a = value.unsigned_abs();
    let sign = if value < 0 { "-" } else { "" };
    write!(s, "{}{}.{}%", sign, a / 10, a % 10).ok();
    s
}

/// Thousandths as a signed decimal: `+1.250`, `-0.025`, `+0.000`.
pub fn thousandths(value: i32) -> String<11> {
    let mut s = String::new();
    let a = value.unsigned_abs();
    let sign = if value < 0 { '-' } else { '+' };
    write!(s, "{}{}.{:03}", sign, a / 1000, a % 1000).ok();
    s
}

/// A whole percentage: `75%`.
pub fn percent(value: i32) -> String<11> {
    let mut s = String::new();
    write!(s, "{}%", value).ok();
    s
}

/// A whole number: `32`.
pub fn number(value: i32) -> String<11> {
    let mut s = String::new();
    write!(s, "{}", value).ok();
    s
}

/// A signed whole number: `+50`, `-5`, `0`.
pub fn signed(value: i32) -> String<11> {
    let mut s = String::new();
    if value > 0 {
        write!(s, "+{}", value).ok();
    } else {
        write!(s, "{}", value).ok();
    }
    s
}

/// A signed number of half-percents, as a percentage: `+100.0%`, `-2.5%`, `0.0%`.
pub fn signed_half_percent(value: i32) -> String<11> {
    let mut s = String::new();
    let a = value.unsigned_abs();
    let sign = if value > 0 { "+" } else if value < 0 { "-" } else { "" };
    write!(s, "{}{}.{}%", sign, a / 2, a % 2 * 5).ok();
    s
}

/// Degrees: `90 deg`.
pub fn degrees(value: i32) -> String<11> {
    let mut s = String::new();
    write!(s, "{} deg", value).ok();
    s
}

/// A segment's length at 48 kHz: `0 ms`, `1.2 ms`, `125 ms`, `1.25 s`, `12.5 s`. `none`: the
/// segment is as short as it goes, a single sample.
pub fn time(samples: u32, none: bool) -> String<11> {
    let mut s = String::new();
    // In tenths of a millisecond.
    let tenths = samples as u64 * 10 / 48;
    if none {
        s.push_str("0 ms").ok();
    } else if tenths < 100 {
        write!(s, "{}.{} ms", tenths / 10, tenths % 10).ok();
    } else if tenths < 10_000 {
        write!(s, "{} ms", (tenths + 5) / 10).ok();
    } else if tenths < 100_000 {
        let hundredths = (tenths + 50) / 100;
        write!(s, "{}.{:02} s", hundredths / 100, hundredths % 100).ok();
    } else {
        let tenth_s = (tenths + 500) / 1000;
        write!(s, "{}.{} s", tenth_s / 10, tenth_s % 10).ok();
    }
    s
}

/// A rate, from thousandths of a hertz: `0.125 Hz`, `1.25 Hz`, `12.5 Hz`, `105 Hz`.
pub fn hertz(millihertz: u32) -> String<11> {
    let mut s = String::new();
    let m = millihertz;
    if m < 1000 {
        write!(s, "0.{:03} Hz", m).ok();
    } else if m < 10_000 {
        let h = (m + 5) / 10;
        write!(s, "{}.{:02} Hz", h / 100, h % 100).ok();
    } else if m < 100_000 {
        let t = (m + 50) / 100;
        write!(s, "{}.{} Hz", t / 10, t % 10).ok();
    } else {
        write!(s, "{} Hz", (m + 500) / 1000).ok();
    }
    s
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn permille_is_a_percentage() {
        assert_eq!(permille(0).as_str(), "0.0%");
        assert_eq!(permille(505).as_str(), "50.5%");
        assert_eq!(permille(1000).as_str(), "100.0%");
    }

    #[test]
    fn thousandths_are_signed() {
        assert_eq!(thousandths(0).as_str(), "+0.000");
        assert_eq!(thousandths(1250).as_str(), "+1.250");
        assert_eq!(thousandths(-25).as_str(), "-0.025");
        assert_eq!(thousandths(-2000).as_str(), "-2.000");
    }

    #[test]
    fn volts_round_to_the_nearest_ten_millivolts() {
        assert_eq!(volts(0).as_str(), "+0.00V");
        assert_eq!(volts(1234).as_str(), "+1.23V");
        assert_eq!(volts(1235).as_str(), "+1.24V");
        assert_eq!(volts(-1234).as_str(), "-1.23V");
        assert_eq!(volts(-5).as_str(), "-0.01V");
        assert_eq!(volts(10_000).as_str(), "+10.00V");
    }

    #[test]
    fn volts_never_overflow_their_buffer() {
        for mv in [i32::MIN, i32::MIN + 1, -99_999, 99_999, 100_000, i32::MAX] {
            assert!(!volts(mv).is_empty(), "{mv}");
            assert!(volts(mv).len() <= 7, "{mv}");
        }
    }

    #[test]
    fn percentages_and_signs() {
        assert_eq!(percent(75).as_str(), "75%");
        assert_eq!(signed(50).as_str(), "+50");
        assert_eq!(signed(-5).as_str(), "-5");
        assert_eq!(signed(0).as_str(), "0");
        assert_eq!(signed_half_percent(200).as_str(), "+100.0%");
        assert_eq!(signed_half_percent(-5).as_str(), "-2.5%");
        assert_eq!(signed_half_percent(1).as_str(), "+0.5%");
        assert_eq!(signed_half_percent(0).as_str(), "0.0%");
        assert_eq!(signed_half_percent(-800).as_str(), "-400.0%");
        assert_eq!(degrees(345).as_str(), "345 deg");
    }

    #[test]
    fn times_read_in_their_natural_unit() {
        assert_eq!(time(1, true).as_str(), "0 ms");
        assert_eq!(time(48, false).as_str(), "1.0 ms");
        assert_eq!(time(58, false).as_str(), "1.2 ms");
        assert_eq!(time(480, false).as_str(), "10 ms");
        assert_eq!(time(6000, false).as_str(), "125 ms");
        assert_eq!(time(47_976, false).as_str(), "1000 ms");
        assert_eq!(time(48_000, false).as_str(), "1.00 s");
        assert_eq!(time(60_000, false).as_str(), "1.25 s");
        assert_eq!(time(600_000, false).as_str(), "12.5 s");
        assert_eq!(time(48 << 15, false).as_str(), "32.8 s");
    }

    #[test]
    fn rates_read_in_hertz() {
        assert_eq!(hertz(10).as_str(), "0.010 Hz");
        assert_eq!(hertz(125).as_str(), "0.125 Hz");
        assert_eq!(hertz(1250).as_str(), "1.25 Hz");
        assert_eq!(hertz(12_500).as_str(), "12.5 Hz");
        assert_eq!(hertz(105_000).as_str(), "105 Hz");
    }
}
