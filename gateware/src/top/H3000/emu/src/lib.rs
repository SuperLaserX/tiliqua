//! Emulation of the host side of the Eventide H3000 / H3500.
//!
//! The original runs its kernel, user interface and parameter code on an
//! MC6809. This crate emulates that CPU ([`cpu`]) and the board around it
//! ([`machine`]): banked ROM window, RAM, battery-backed memory, the 2x40
//! character LCD ([`lcd`]), keypad, knob, MIDI ACIA, and the interface to
//! the three TMS32010s, which is forwarded to a [`machine::Host`]
//! (the DSP board gateware on Tiliqua).

#![cfg_attr(not(any(feature = "std", test)), no_std)]

pub mod browse;
pub mod cpu;
pub mod cv;
#[cfg(test)]
#[allow(dead_code)]
mod cpu_ref;
#[cfg(feature = "std")]
pub mod dspsim;
pub mod hle;
pub mod lcd;
pub mod lzma;
pub mod machine;
pub mod nvstore;
pub mod remote;
pub mod roms;
