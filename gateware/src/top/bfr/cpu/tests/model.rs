//! Replays vectors written by `bfr/test_firmware.py` (from the Python model)
//! on this crate, for the programs in `BFR_PROGRAM`:
//!
//!     program <k>: load PROGRAMS[k] (as a type switch does), then its session
//!     math <fn> <x bits> <y bits> <expected bits>
//!     rtap <tap> <entry hex> / wtap <tap> <entry hex>
//!     set <param> <value bits> / advance <frames> <fade pos>... / service
//!     state <coefs> ; <offsets> ; <stab> ; <lfo incs> ; <fade targets>
//!
//! Coefficients may differ from the model's by an f32 ulp (the math here
//! isn't the host's C library); everything else must match exactly.

use bfr_cpu::control::{Control, Hw};
use bfr_cpu::encode;
use bfr_cpu::math;
use bfr_cpu::program::PROGRAMS;
use bfr_cpu::types::*;

struct Mock {
    frames: u32,
    fade_pos: [u32; N_FADE],
    targets: [u32; N_FADE],
    writes: usize,
    // What a load wrote: instructions, registers, write and read taps.
    instrs: Vec<u64>,
    regs: Vec<(usize, u32)>,
    wtaps: usize,
    rtaps: usize,
}

impl Hw for Mock {
    fn instr(&mut self, _: usize, w: u64) { self.instrs.push(w); }
    fn reg(&mut self, r: usize, bits: u32) { self.regs.push((r, bits)); }
    fn wtap(&mut self, _: usize, _: u64) { self.wtaps += 1; }
    fn lfo_phase(&mut self, _: usize, _: u32) {}
    fn coef(&mut self, _: usize, _: u32) { self.writes += 1; }
    fn rtap(&mut self, _: usize, _: [u32; 3]) { self.writes += 1; self.rtaps += 1; }
    fn stab(&mut self, _: usize, _: u64) { self.writes += 1; }
    fn lfo_inc(&mut self, _: usize, _: u32) { self.writes += 1; }
    fn fade_target(&mut self, g: usize, t: u32) { self.targets[g] = t; self.writes += 1; }
    fn frames(&mut self) -> u32 { self.frames }
    fn fade_pos(&mut self, g: usize) -> u32 { self.fade_pos[g] }
}

fn hex(s: &str) -> u128 {
    u128::from_str_radix(s.trim_start_matches("0x"), 16).unwrap()
}

fn ulps(a: f64, b: f64) -> u64 {
    if a == b || (a.is_nan() && b.is_nan()) {
        return 0;
    }
    let (x, y) = (a.to_bits() as i64, b.to_bits() as i64);
    if (x < 0) != (y < 0) {
        return u64::MAX;
    }
    (x - y).unsigned_abs()
}

fn list<T: std::str::FromStr>(s: &str) -> Vec<T> where T::Err: std::fmt::Debug {
    s.split_whitespace().map(|v| v.parse().unwrap()).collect()
}

#[test]
fn matches_the_model() {
    let path = match std::env::var("BFR_VECTORS") {
        Ok(p) => p,
        Err(_) => {
            eprintln!("BFR_VECTORS not set: nothing to compare (run bfr/test_firmware.py)");
            return;
        }
    };
    let text = std::fs::read_to_string(&path).unwrap();
    let mut hw = Mock { frames: 0, fade_pos: [0; N_FADE], targets: [0; N_FADE], writes: 0,
                        instrs: Vec::new(), regs: Vec::new(), wtaps: 0, rtaps: 0 };
    let mut prog = PROGRAMS[0];
    let mut ctl = Control::new(prog);
    let (mut states, mut coef_off, mut worst_coef) = (0, 0, 0u64);
    let mut math_worst = std::collections::BTreeMap::new();
    let mut errors = Vec::new();
    for (n, line) in text.lines().enumerate() {
        let (cmd, rest) = line.split_once(' ').unwrap_or((line, ""));
        let f: Vec<&str> = rest.split_whitespace().collect();
        match cmd {
            "program" => {
                // A type switch: a fresh Control for the program, loaded whole.
                prog = PROGRAMS[f[0].parse::<usize>().unwrap()];
                ctl = Control::new(prog);
                hw = Mock { frames: 0, fade_pos: [0; N_FADE], targets: [0; N_FADE], writes: 0,
                            instrs: Vec::new(), regs: Vec::new(), wtaps: 0, rtaps: 0 };
                let defaults: Vec<f64> = prog.params.iter().map(|p| p.default).collect();
                ctl.load(&mut hw, &defaults);
                let n_w = prog.taps.iter().filter(|t| t.kind == TAP_WRITE).count();
                if hw.instrs[..] != prog.instrs[..] || hw.wtaps != n_w
                    || hw.rtaps < prog.taps.len() - n_w
                    || hw.regs.iter().take(REG_GENERAL + N_OUT).any(|&(_, b)| b != 0)
                    || hw.regs[REG_GENERAL + N_OUT..]
                        != prog.regs.iter().map(|&(r, b)| (r as usize, b)).collect::<Vec<_>>()[..] {
                    errors.push(format!("line {}: load of {} wrote the wrong tables", n + 1, prog.name));
                }
                hw.targets = [0; N_FADE];
            }
            "math" => {
                let x = f64::from_bits(hex(f[1]) as u64);
                let y = f64::from_bits(hex(f[2]) as u64);
                let want = f64::from_bits(hex(f[3]) as u64);
                let got = match f[0] {
                    "exp" => math::exp(x),
                    "log" => math::ln(x),
                    "pow" => math::pow(x, y),
                    "sqrt" => math::sqrt(x),
                    "sin" => math::sin(x),
                    "cos" => math::cos(x),
                    "tan" => math::tan(x),
                    "floor" => math::floor(x),
                    other => panic!("unknown function {other}"),
                };
                let u = ulps(got, want);
                let w = math_worst.entry(f[0].to_string()).or_insert(0u64);
                *w = (*w).max(u);
            }
            "rtap" => {
                let t = &prog.taps[f[0].parse::<usize>().unwrap()];
                let e = encode::rtap(t, t.offset);
                let got = e[0] as u128 | (e[1] as u128) << 32 | (e[2] as u128) << 64;
                if got != hex(f[1]) {
                    errors.push(format!("line {}: rtap {} {:#x} != {}", n + 1, f[0], got, f[1]));
                }
            }
            "wtap" => {
                let t = &prog.taps[f[0].parse::<usize>().unwrap()];
                if encode::wtap(t) as u128 != hex(f[1]) {
                    errors.push(format!("line {}: wtap {} {:#x} != {}", n + 1, f[0], encode::wtap(t), f[1]));
                }
            }
            "init" => {
                // The firmware's boot: every parameter at its default.
                let defaults: Vec<f64> = prog.params.iter().map(|p| p.default).collect();
                ctl.init(&mut hw, &defaults);
            }
            "set" => {
                let v = f64::from_bits(hex(f[1]) as u64);
                ctl.set_param(&mut hw, f[0].parse().unwrap(), v);
            }
            "advance" => {
                hw.frames = f[0].parse().unwrap();
                for g in 0..N_FADE.min(f.len() - 1) {
                    hw.fade_pos[g] = f[1 + g].parse().unwrap();
                }
            }
            "service" => ctl.service(&mut hw),
            "state" => {
                states += 1;
                let parts: Vec<&str> = rest.split(';').collect();
                let coefs: Vec<u32> = list(parts[0]);
                for (i, &bits) in coefs.iter().enumerate() {
                    let got = ctl.coef_bits[i];
                    if got != bits {
                        let u = (got as i64 - bits as i64).unsigned_abs();
                        coef_off += 1;
                        worst_coef = worst_coef.max(u);
                        if u > 1 || (got ^ bits) >> 31 != 0 {
                            errors.push(format!("line {}: C{} {:#x} != {:#x}", n + 1, i, got, bits));
                        }
                    }
                }
                let offsets: Vec<i32> = list(parts[1]);
                if offsets[..] != ctl.offsets[..offsets.len()] {
                    errors.push(format!("line {}: offsets differ", n + 1));
                }
                let stab: Vec<u64> = list(parts[2]);
                if stab[..] != ctl.stab_entries[..stab.len()] {
                    errors.push(format!("line {}: stream table differs", n + 1));
                }
                let lfo: Vec<u32> = list(parts[3]);
                if lfo[..] != ctl.lfo_inc[..] {
                    errors.push(format!("line {}: LFO increments {:?} != {:?}", n + 1, ctl.lfo_inc, lfo));
                }
                let targets: Vec<u32> = list(parts[4]);
                if targets[..] != hw.targets[..targets.len()] {
                    errors.push(format!("line {}: fade targets {:?} != {:?}", n + 1, hw.targets, targets));
                }
            }
            "" => {}
            other => panic!("line {}: unknown command {other}", n + 1),
        }
    }
    println!("states {states}, coefficients one ulp off {coef_off} (worst {worst_coef}), \
              hardware writes {}", hw.writes);
    for (name, u) in &math_worst {
        println!("math {name}: worst {u} ulp");
    }
    for e in errors.iter().take(20) {
        println!("{e}");
    }
    assert!(errors.is_empty(), "{} mismatches", errors.len());
    for (name, &u) in &math_worst {
        // pow is exp(y ln x): the error grows with |y ln x| (to ~40 ulp here),
        // still far below an f32 ulp.
        let limit = match name.as_str() { "pow" => 64, "tan" => 4, _ => 2 };
        assert!(u <= limit, "{name}: {u} ulp > {limit}");
    }
}
