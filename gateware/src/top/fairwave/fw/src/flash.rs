//! The SPI flash as the patch store uses it. The firmware runs from PSRAM, so the flash can be
//! erased and programmed while it runs.

use fairwave_cpu::store::Flash;

use crate::hal::spiflash::SpiFlash;
use crate::pac::constants::*;
use crate::SPIFlash0;

/// The data cache's line (engine.rs).
const CACHE_LINE: usize = 64;

/// Drops `bytes` from `addr` from the data cache. The flash is mapped through it, so what was read
/// before a save would otherwise still be what is read after it.
fn flush_dcache(addr: usize, bytes: usize) {
    let mut at = addr & !(CACHE_LINE - 1);
    while at < addr + bytes {
        // cbo.flush (at), from Zicbom (`--with-rvZcbm` in vexiiriscv.py)
        unsafe { core::arch::asm!(".insn i 0x0F, 2, x0, {0}, 2", in(reg) at) };
        at += CACHE_LINE;
    }
    unsafe { core::arch::asm!("fence") };
}

pub struct FlashPort(pub SPIFlash0);

impl Flash for FlashPort {
    fn busy(&mut self) -> Result<bool, ()> {
        if PATCHES_IN_PSRAM {
            return Ok(false);
        }
        self.0.busy().map_err(|_| ())
    }

    fn erase_sector(&mut self, addr: u32) -> Result<(), ()> {
        if PATCHES_IN_PSRAM {
            let at = (PSRAM_BASE + PSRAM_PATCHES + addr as usize) as *mut u8;
            unsafe { core::ptr::write_bytes(at, 0xFF, 4096) };
            return Ok(());
        }
        self.0.write_enable().map_err(|_| ())?;
        self.0.sector_erase(addr).map_err(|_| ())
    }

    fn program(&mut self, addr: u32, data: &[u8]) -> Result<(), ()> {
        if PATCHES_IN_PSRAM {
            let at = (PSRAM_BASE + PSRAM_PATCHES + addr as usize) as *mut u8;
            unsafe { core::ptr::copy_nonoverlapping(data.as_ptr(), at, data.len()) };
            return Ok(());
        }
        self.0.write_enable().map_err(|_| ())?;
        self.0.page_program(addr, data).map_err(|_| ())
    }

    fn read(&mut self, addr: u32, data: &mut [u8]) {
        let base = if PATCHES_IN_PSRAM {
            PSRAM_BASE + PSRAM_PATCHES + addr as usize
        } else {
            let at = SPIFLASH_BASE + addr as usize;
            flush_dcache(at, data.len());
            at
        };
        for (i, b) in data.iter_mut().enumerate() {
            *b = unsafe { core::ptr::read_volatile((base + i) as *const u8) };
        }
    }
}
