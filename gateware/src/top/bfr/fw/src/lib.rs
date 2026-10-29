#![no_std]
#![no_main]

pub use tiliqua_pac as pac;
pub use tiliqua_hal as hal;

hal::impl_tiliqua_soc_pac!();

// Shared default handlers and logger (symlinked in other projects).
#[path = "../../../../rs/handlers.rs"]
pub mod handlers;

pub mod busstats;
pub mod engine;
pub mod glyphs;
pub mod input;
pub mod options;
pub mod screen;
pub mod theme;
pub mod ui;

/// Stack high-water mark: the 32 KB block RAM holds data and stack, and
/// nothing guards the stack's end.
pub mod stack {
    extern "C" {
        static _estack: u32;
    }
    const PAINT: u32 = 0x5AC7_5AC7;

    fn bottom() -> usize {
        core::ptr::addr_of!(_estack) as usize
    }

    /// Fill the unused stack below the caller with a pattern.
    pub fn paint() {
        let sp: usize;
        unsafe { core::arch::asm!("mv {}, sp", out(reg) sp) };
        let mut p = bottom();
        while p + 256 < sp {
            unsafe { (p as *mut u32).write_volatile(PAINT) };
            p += 4;
        }
    }

    /// Bytes of stack never used since `paint`.
    pub fn free() -> usize {
        let mut p = bottom();
        while unsafe { (p as *const u32).read_volatile() } == PAINT {
            p += 4;
        }
        p - bottom()
    }
}
