//! FairWave's CPU side with no hardware in it, so the host can test it
//! (`cargo test` in this directory): the round screen's geometry, which screen is
//! showing, how values are written, and everything that decides what the gateware is told:
//! tables, the patch, its modulation and the screens that edit them.

#![cfg_attr(not(test), no_std)]

pub mod curve;
pub mod browser;
pub mod cv;
pub mod disk;
pub mod geometry;
pub mod layout;
pub mod modulation;
pub mod nav;
pub mod pages;
pub mod patch;
pub mod store;
pub mod table;
pub mod text;
pub mod wav;
pub mod wave;
pub mod wavegen;
pub mod wavetables;
