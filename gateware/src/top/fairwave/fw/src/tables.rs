//! The tables made at boot, and a file the bootloader loaded, if any. (The Browser loads the rest,
//! from `main.rs`.)

use log::{info, warn};

use fairwave_cpu::browser::{shape_of, Library};
use fairwave_cpu::table::{Pool, Table};
use fairwave_cpu::{mip, wav, wavegen, wavetables};

use crate::engine::clean_dcache;
use crate::pac::constants::*;

pub use fairwave_cpu::browser::MAX_TABLES;

/// Free PSRAM in the UI scratch, for the levels on their way down.
const MIP_SCRATCH: usize = 0xC0000;

/// Makes one frame's band-limited levels, and sees them to PSRAM for the engine. (`mip.rs`.)
pub fn make_mips(table: &Table, frame: u16) {
    let len = table.frame_len();
    let at = PSRAM_BASE + table.offset;
    let (from, row, scratch) = unsafe {
        (
            core::slice::from_raw_parts((at + ((frame as usize) << table.frame_log2) * 2) as *const i16, len),
            core::slice::from_raw_parts_mut((at + table.mip_row(frame) * 2) as *mut i16, len),
            core::slice::from_raw_parts_mut((PSRAM_BASE + PSRAM_UI_SCRATCH + MIP_SCRATCH) as *mut i16, len),
        )
    };
    mip::build_row(from, row, scratch);
    clean_dcache(at + table.mip_row(frame) * 2, len * 2);
}

/// A table's samples in PSRAM.
pub fn slice(table: &Table) -> &'static mut [i16] {
    unsafe {
        core::slice::from_raw_parts_mut((PSRAM_BASE + table.offset) as *mut i16, table.samples())
    }
}

fn add(lib: &mut Library, name: &str, table: Table, samples: usize) {
    clean_dcache(PSRAM_BASE + table.offset, table.bytes());
    info!("table {}: {} frames of {} samples at {:#x}", name, table.frames, table.frame_len(), table.offset);
    lib.add_built(name, table, samples);
}

/// The file `--usb-table` has the bootloader load, parsed and converted into the pool.
fn usb_table(pool: &mut Pool) -> Option<(Table, usize)> {
    let file = unsafe {
        core::slice::from_raw_parts((PSRAM_BASE + PSRAM_POOL_BASE) as *const u8, PSRAM_USB_WINDOW)
    };
    let w = match wav::parse(file) {
        Ok(w) => w,
        Err(e) => {
            warn!("{}: {:?}", USB_TABLE_NAME, e);
            return None;
        }
    };
    let shape = shape_of(&w)?;
    let table = pool.alloc(shape.frame_log2, shape.frames)?;
    let samples = table.samples();
    wav::convert(file, &w, slice(&table));
    Some((table, samples))
}

/// Every table made at boot, in an order saved patches depend on.
pub fn build(lib: &mut Library) {
    // A modern table, and an old machine's: two different frame lengths on purpose.
    if let Some(t) = lib.pool().alloc(11, 31) {
        wavegen::harmonic_morph(slice(&t), t.frame_len());
        add(lib, "MORPH 2048", t, t.samples());
    }
    if let Some(t) = lib.pool().alloc(8, 16) {
        wavegen::naive_pulse(slice(&t), t.frame_len());
        add(lib, "PULSE 256", t, t.samples());
    }
    for spec in &wavetables::SET {
        if let Some(t) = lib.pool().alloc(spec.frame_log2, spec.frames) {
            (spec.make)(slice(&t), t.frame_len());
            add(lib, spec.name, t, t.samples());
        }
    }
    if USB_TABLE {
        if let Some((t, samples)) = usb_table(lib.pool()) {
            add(lib, "USB WAV", t, samples);
        }
    }
}

/// The pool for all of it: the start of the region is where a file is read to first.
pub fn pool() -> Pool {
    Pool::new(PSRAM_POOL_BASE + PSRAM_USB_WINDOW, PSRAM_POOL_BYTES - PSRAM_USB_WINDOW)
}
