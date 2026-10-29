//! Table entries, bit for bit as `bfr/core.py` and `bfr/stream.py` lay them out.

use crate::types::*;

pub const OFF_W: u32 = 22;
pub const BUF_W: u32 = 13;
pub const OFF_MASK: u32 = (1 << OFF_W) - 1;

/// Read-tap entry (68 bits) as three words, least significant first.
pub fn rtap(t: &TapDesc, offset: u32) -> [u32; 3] {
    let v: u128 = (offset & OFF_MASK) as u128
        | (t.space as u128) << OFF_W
        | ((t.kind == TAP_MOD) as u128) << (OFF_W + 1)
        | (t.depth as u128) << (OFF_W + 2)
        | (t.mreg as u128) << (OFF_W + 14)
        | (t.buf as u128) << (OFF_W + 20)
        | (t.bmask as u128) << (OFF_W + 20 + BUF_W);
    [v as u32, (v >> 32) as u32, (v >> 64) as u32]
}

/// Write-tap entry (36 bits).
pub fn wtap(t: &TapDesc) -> u64 {
    (t.offset & OFF_MASK) as u64 | (t.space as u64) << OFF_W | (t.buf as u64) << (OFF_W + 1)
}

/// Stream-table entry (50 bits).
pub fn stab(t: &TapDesc, offset: u32, enable: bool) -> u64 {
    let depth = if t.kind == TAP_MOD { t.depth as u32 } else { 0 };
    let lead = offset.wrapping_add(depth) & OFF_MASK;
    lead as u64
        | (t.buf as u64) << OFF_W
        | (t.bmask as u64) << (OFF_W + BUF_W)
        | ((t.kind == TAP_WRITE) as u64) << (OFF_W + 2 * BUF_W)
        | (enable as u64) << (OFF_W + 2 * BUF_W + 1)
}

/// Words of an entry for the peripheral's wdata0..2.
pub fn words(v: u64) -> [u32; 3] {
    [v as u32, (v >> 32) as u32, 0]
}
