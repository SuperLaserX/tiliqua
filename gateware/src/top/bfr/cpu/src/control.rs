//! The CPU's side of the engine: parameters to table values, and crossfades.
//!
//! A port of `model.engine.Engine.set_param` / `_service_fades` /
//! `_recompute` / `stream_enabled` (SPEC.md, Crossfades). The firmware calls
//! `set_param` when a menu value changes and `service` periodically; writes
//! go to the engine through `Hw`, only for values that changed.

use crate::encode;
use crate::math;
use crate::program::{N_COEFS, N_STREAMS, N_TAPS};
use crate::types::*;

/// The engine's tables and controls, as the CPU writes them.
pub trait Hw {
    /// Program memory (only while the engine is stopped).
    fn instr(&mut self, i: usize, word: u64);
    fn reg(&mut self, r: usize, bits: u32);
    fn wtap(&mut self, i: usize, entry: u64);
    fn lfo_phase(&mut self, k: usize, phase: u32);
    fn coef(&mut self, i: usize, bits: u32);
    fn rtap(&mut self, i: usize, entry: [u32; 3]);
    fn stab(&mut self, s: usize, entry: u64);
    fn lfo_inc(&mut self, k: usize, inc: u32);
    fn fade_target(&mut self, g: usize, target: u32);
    /// Samples processed so far (the engine's frame counter).
    fn frames(&mut self) -> u32;
    fn fade_pos(&mut self, g: usize) -> u32;
}

pub struct Control {
    pub prog: &'static Program,
    pub params: [f64; MAX_PARAMS],
    side_value: [[f64; 2]; N_FADE],
    target: [u32; N_FADE],
    pending: [bool; N_FADE],
    warm_side: [Option<u8>; N_FADE],
    warm_until: [u32; N_FADE],
    fade_p: [u32; N_FADE],
    // What the engine holds (sized for the largest program built in, so the
    // firmware's small RAM isn't spent on 256-entry tables).
    pub coef_bits: [u32; N_COEFS],
    pub offsets: [i32; N_TAPS],
    pub stab_entries: [u64; N_STREAMS],
    pub lfo_inc: [u32; N_LFO],
}

impl Control {
    /// The state of `prog`'s image: every value at its default, all streams
    /// running. The bitstream starts in that state for `program::PROGRAM`;
    /// `load` puts the engine in it for any program.
    pub fn new(prog: &'static Program) -> Self {
        let mut c = Control {
            prog,
            params: [0.0; MAX_PARAMS],
            side_value: [[0.0; 2]; N_FADE],
            target: [0; N_FADE],
            pending: [false; N_FADE],
            warm_side: [None; N_FADE],
            warm_until: [0; N_FADE],
            fade_p: [0; N_FADE],
            coef_bits: [0; N_COEFS],
            offsets: [0; N_TAPS],
            stab_entries: [0; N_STREAMS],
            lfo_inc: prog.lfo_inc,
        };
        c.reset(prog);
        c
    }

    /// `new(prog)` in place: a Control is a few KB, and building a new one
    /// for a type switch put a second copy on the firmware's small stack.
    pub fn reset(&mut self, prog: &'static Program) {
        assert!(prog.coefs.len() <= N_COEFS && prog.taps.len() <= N_TAPS
                && prog.streams.len() <= N_STREAMS);
        self.prog = prog;
        self.params.fill(0.0);
        self.side_value.fill([0.0; 2]);
        self.target.fill(0);
        self.pending.fill(false);
        self.warm_side.fill(None);
        self.warm_until.fill(0);
        self.fade_p.fill(0);
        self.coef_bits.fill(0);
        self.offsets.fill(0);
        self.stab_entries.fill(0);
        self.lfo_inc = prog.lfo_inc;
        for (i, p) in prog.params.iter().enumerate() {
            self.params[i] = p.default;
        }
        for (g, &(pi, _)) in prog.fades.iter().enumerate() {
            self.side_value[g] = [prog.params[pi as usize].default; 2];
        }
        self.coef_bits[..prog.coefs.len()].copy_from_slice(prog.coefs);
        for (i, t) in prog.taps.iter().enumerate() {
            self.offsets[i] = t.offset as i32;
        }
        for (s, &i) in prog.streams.iter().enumerate() {
            let t = &prog.taps[i as usize];
            self.stab_entries[s] = encode::stab(t, t.offset, true);
        }
    }

    /// Write the whole program to the stopped engine: instructions, cleared
    /// state and output registers and the initial values, taps, coefficients,
    /// the stream table and the LFOs; then set the parameters as `init` does.
    /// The caller clears the delay memory and resets the crossfades to side A.
    pub fn load(&mut self, hw: &mut impl Hw, values: &[f64]) {
        let prog = self.prog;
        for (i, &w) in prog.instrs.iter().enumerate() {
            hw.instr(i, w);
        }
        for r in (0..REG_GENERAL).chain(REG_OUT..REG_OUT + N_OUT) {
            hw.reg(r, 0);
        }
        for &(r, bits) in prog.regs {
            hw.reg(r as usize, bits);
        }
        for (i, t) in prog.taps.iter().enumerate() {
            if t.kind == TAP_WRITE {
                hw.wtap(i, encode::wtap(t));
            } else {
                hw.rtap(i, encode::rtap(t, self.offsets[i] as u32));
            }
        }
        for (i, &bits) in self.coef_bits[..prog.coefs.len()].iter().enumerate() {
            hw.coef(i, bits);
        }
        for (s, &e) in self.stab_entries[..prog.streams.len()].iter().enumerate() {
            hw.stab(s, e);
        }
        for k in 0..N_LFO {
            hw.lfo_phase(k, prog.lfo_phase[k]);
            hw.lfo_inc(k, self.lfo_inc[k]);
        }
        self.init(hw, values);
    }

    /// Fire trigger `k` of the program (`Program::triggers`).
    pub fn trigger(&self, hw: &mut impl Hw, k: usize) {
        if let Some(t) = self.prog.triggers.get(k) {
            hw.reg(t.reg as usize, 1.0f32.to_bits());
        }
    }

    pub fn fade_rate(&self, g: usize) -> u32 {
        let samples = self.prog.fades[g].1 as f64;
        let r = math::floor(FADE_ONE as f64 / samples + 0.5) as u32;
        r.max(1)
    }

    /// Set every parameter at once with no crossfades (at boot, or for a
    /// restored preset), and bring every table value and stream up to date.
    pub fn init(&mut self, hw: &mut impl Hw, values: &[f64]) {
        for (i, p) in self.prog.params.iter().enumerate() {
            self.params[i] = clamp(values.get(i).copied().unwrap_or(p.default), p);
        }
        for (g, &(pi, _)) in self.prog.fades.iter().enumerate() {
            self.side_value[g] = [self.params[pi as usize]; 2];
            self.pending[g] = false;
            self.warm_side[g] = None;
        }
        self.recompute(hw, |_, _| true);
        self.update_streams(hw);
    }

    pub fn set_param(&mut self, hw: &mut impl Hw, i: usize, value: f64) {
        let decl = &self.prog.params[i];
        self.params[i] = clamp(value, decl);
        if decl.fade >= 0 {
            self.pending[decl.fade as usize] = true;
            self.service(hw);
        } else {
            let bit = 1u32 << i;
            self.recompute(hw, |_, names| names & bit != 0);
            self.update_streams(hw);
        }
    }

    /// True while a crossfade runs, waits for its streams or waits to start.
    pub fn fading(&self) -> bool {
        (0..self.prog.fades.len()).any(|g| {
            self.fade_p[g] != self.target[g] || self.pending[g] || self.warm_side[g].is_some()
        })
    }

    fn active(&self, g: usize) -> u8 {
        (self.target[g] == FADE_ONE) as u8
    }

    /// Start pending crossfades on idle groups: load the silent side with the
    /// latest value, wait for its streams to warm up, then fade to it.
    pub fn service(&mut self, hw: &mut impl Hw) {
        let now = hw.frames();
        for g in 0..self.prog.fades.len() {
            self.fade_p[g] = hw.fade_pos(g);
        }
        for g in 0..self.prog.fades.len() {
            let pi = self.prog.fades[g].0 as usize;
            let bit = 1u32 << pi;
            if self.warm_side[g].is_none() {
                if !self.pending[g] || self.fade_p[g] != self.target[g] {
                    continue;
                }
                self.pending[g] = false;
                if self.params[pi] == self.side_value[g][self.active(g) as usize] {
                    continue;
                }
                let new = 1 - self.active(g);
                self.side_value[g][new as usize] = self.params[pi];
                self.recompute(hw, |env, _| env == Env::Side(g as u8, new));
                self.warm_side[g] = Some(new);
                self.warm_until[g] = now.wrapping_add(self.prog.warmup[g]);
            }
            if now.wrapping_sub(self.warm_until[g]) as i32 >= 0 {
                let new = self.warm_side[g].take().unwrap();
                self.target[g] = if new == 1 { FADE_ONE } else { 0 };
                hw.fade_target(g, self.target[g]);
                self.recompute(hw, |env, names| {
                    names & bit != 0 && match env {
                        Env::Current => true,
                        Env::Side(h, _) => h as usize != g,
                    }
                });
            }
        }
        self.update_streams(hw);
    }

    /// Whether tap i's PSRAM stream must run: a crossfaded tap's stream may
    /// stop while its side's weight is zero and nothing is about to fade to it.
    pub fn stream_enabled(&self, i: usize) -> bool {
        let t = &self.prog.taps[i];
        if t.group < 0 {
            return true;
        }
        let (g, s) = (t.group as usize, t.side);
        if s == self.active(g) || self.warm_side[g] == Some(s) {
            return true;
        }
        self.fade_p[g] != if s == 0 { FADE_ONE } else { 0 }
    }

    /// Parameter values for an entry evaluated with `env`.
    fn env_values(&self, env: Env) -> [f64; MAX_PARAMS] {
        let mut v = self.params;
        for (h, &(pi, _)) in self.prog.fades.iter().enumerate() {
            let s = match env {
                Env::Side(g, s) if g as usize == h => s,
                _ => self.active(h),
            };
            v[pi as usize] = self.side_value[h][s as usize];
        }
        v
    }

    fn recompute(&mut self, hw: &mut impl Hw, pred: impl Fn(Env, u32) -> bool) {
        let prog = self.prog;
        for e in prog.coef_exprs {
            if pred(e.env, e.params) {
                let bits = math::f32_bits(e.eval(prog, &self.env_values(e.env)));
                let i = e.target as usize;
                if bits != self.coef_bits[i] {
                    self.coef_bits[i] = bits;
                    hw.coef(i, bits);
                }
            }
        }
        for e in prog.tap_exprs {
            if pred(e.env, e.params) {
                let d = math::floor(e.eval(prog, &self.env_values(e.env)) + 0.5);
                let off = e.base - d as i32;
                let i = e.target as usize;
                if off != self.offsets[i] {
                    self.offsets[i] = off;
                    hw.rtap(i, encode::rtap(&prog.taps[i], off as u32));
                }
            }
        }
        for e in prog.lfo_exprs {
            if pred(Env::Current, e.params) {
                let hz = e.eval(prog, &self.env_values(Env::Current));
                let inc = math::floor(hz / prog.fs as f64 * 4294967296.0 + 0.5) as i64 as u32;
                let k = e.target as usize;
                if inc != self.lfo_inc[k] {
                    self.lfo_inc[k] = inc;
                    hw.lfo_inc(k, inc);
                }
            }
        }
    }

    /// Rewrite the stream-table entries whose offset or enable changed.
    fn update_streams(&mut self, hw: &mut impl Hw) {
        let prog = self.prog;
        for (s, &i) in prog.streams.iter().enumerate() {
            let i = i as usize;
            let e = encode::stab(&prog.taps[i], self.offsets[i] as u32, self.stream_enabled(i));
            if e != self.stab_entries[s] {
                self.stab_entries[s] = e;
                hw.stab(s, e);
            }
        }
    }
}

fn clamp(v: f64, p: &ParamDecl) -> f64 {
    math::min(math::max(v, p.lo), p.hi)
}

#[cfg(test)]
mod tests {
    use super::*;

    static PROG: Program = Program {
        name: "t", title: "t", description: "", fs: 48000, instrs: &[], coefs: &[], regs: &[],
        lfo_phase: [0; N_LFO], lfo_inc: [0; N_LFO], mem_words: [16, 16], params: &[],
        presets: &[], triggers: &[Trigger { name: "kick", reg: 7, help: "" }],
        coef_exprs: &[], tap_exprs: &[], lfo_exprs: &[], consts: &[], fades: &[], taps: &[],
        streams: &[], warmup: &[], burst: 8,
    };

    #[derive(Default)]
    struct Regs(Vec<(usize, u32)>);

    impl Hw for Regs {
        fn instr(&mut self, _: usize, _: u64) {}
        fn reg(&mut self, r: usize, bits: u32) { self.0.push((r, bits)) }
        fn wtap(&mut self, _: usize, _: u64) {}
        fn lfo_phase(&mut self, _: usize, _: u32) {}
        fn coef(&mut self, _: usize, _: u32) {}
        fn rtap(&mut self, _: usize, _: [u32; 3]) {}
        fn stab(&mut self, _: usize, _: u64) {}
        fn lfo_inc(&mut self, _: usize, _: u32) {}
        fn fade_target(&mut self, _: usize, _: u32) {}
        fn frames(&mut self) -> u32 { 0 }
        fn fade_pos(&mut self, _: usize) -> u32 { 0 }
    }

    #[test]
    fn trigger_writes_one_to_its_register() {
        let ctl = Control::new(&PROG);
        let mut hw = Regs::default();
        ctl.trigger(&mut hw, 0);
        ctl.trigger(&mut hw, 1); // no such trigger: nothing
        assert_eq!(hw.0, vec![(7, 0x3F80_0000)]);
    }
}
