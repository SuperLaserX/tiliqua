//! Includes the programs the firmware is built for: `top.py` compiles them and
//! generates their tables (`model/rustgen.py`) into the file named by
//! `BFR_PROGRAM`.

use std::{env, fs, path::Path};

const STUB: &str = r#"
pub const N_COEFS: usize = 0;
pub const N_TAPS: usize = 0;
pub const N_STREAMS: usize = 0;
pub const N_PROGRAMS: usize = 1;
pub static PAGES: [&str; 0] = [];

pub static PROGRAM: Program = Program {
    name: "none", title: "none", description: "", fs: 48000, instrs: &[], coefs: &[],
    regs: &[], lfo_phase: [0; 4], lfo_inc: [0; 4], mem_words: [16, 16], params: &[],
    presets: &[], triggers: &[], coef_exprs: &[], tap_exprs: &[], lfo_exprs: &[], consts: &[], fades: &[], taps: &[],
    streams: &[], warmup: &[], burst: 8,
};
pub static PROGRAMS: [&Program; N_PROGRAMS] = [&PROGRAM];
"#;

fn main() {
    println!("cargo:rerun-if-env-changed=BFR_PROGRAM");
    let out = Path::new(&env::var("OUT_DIR").unwrap()).join("program.rs");
    match env::var("BFR_PROGRAM") {
        Ok(path) => {
            println!("cargo:rerun-if-changed={path}");
            fs::copy(&path, &out).unwrap_or_else(|e| panic!("BFR_PROGRAM={path}: {e}"));
        }
        Err(_) => {
            println!("cargo:warning=BFR_PROGRAM is not set: building with an empty program (top.py sets it)");
            fs::write(&out, STUB).unwrap();
        }
    }
}
