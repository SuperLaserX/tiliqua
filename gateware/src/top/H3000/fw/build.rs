//! Embeds the ROM set of the variant being built: `top.py` packs and
//! LZMA-compresses it (see ../pack_roms.py) and passes the file in `H3K_ROMS`.

use std::{env, fs, path::Path};

fn main() {
    println!("cargo:rerun-if-env-changed=H3K_ROMS");
    let out = Path::new(&env::var("OUT_DIR").unwrap()).join("roms.lzma");
    match env::var("H3K_ROMS") {
        Ok(path) => {
            println!("cargo:rerun-if-changed={path}");
            fs::copy(&path, &out).unwrap_or_else(|e| panic!("H3K_ROMS={path}: {e}"));
        }
        Err(_) => {
            // Lets the crate build (e.g. for checking); it stops at boot.
            println!("cargo:warning=H3K_ROMS is not set: building without ROMs (top.py sets it)");
            fs::write(&out, b"").unwrap();
        }
    }
}
