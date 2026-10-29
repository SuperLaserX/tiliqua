//! The bfr engine's CPU side, independent of the SoC: the program the firmware
//! is built for, the math its coefficients need, the table encodings, and the
//! parameter / crossfade policy (`control`). Host tests compare it with the
//! Python model (`bfr/test_firmware.py`).

#![cfg_attr(not(test), no_std)]

pub mod control;
pub mod cv;
pub mod dial;
pub mod encode;
pub mod expr;
pub mod layout;
pub mod math;
pub mod types;

/// The generated programs (`model/rustgen.py`).
#[allow(clippy::all, unused_imports, clippy::excessive_precision)]
pub mod program {
    use crate::types::*;
    include!(concat!(env!("OUT_DIR"), "/program.rs"));
}
