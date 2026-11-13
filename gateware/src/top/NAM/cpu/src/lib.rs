//! NAM's CPU side with no hardware in it, so the host can test it (`cargo test` in this
//! directory): the round screen's geometry, which screen is showing, how values are written,
//! and everything that decides what the engine is told: the `.nam` loader, the quantisation
//! and the program (mirroring `model/fixed.py` and `model/program.py`, bit for bit).

#![cfg_attr(not(test), no_std)]

pub mod geometry;
pub mod namfile;
pub mod nav;
pub mod program;
pub mod quant;
pub mod text;
