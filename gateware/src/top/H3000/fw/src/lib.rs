#![no_std]
#![no_main]

pub use tiliqua_pac as pac;
pub use tiliqua_hal as hal;

hal::impl_tiliqua_soc_pac!();

// Shared default handlers and logger (symlinked in other projects).
#[path = "../../../../rs/handlers.rs"]
pub mod handlers;

pub mod dsp;
pub mod glyphs;
pub mod panel;
