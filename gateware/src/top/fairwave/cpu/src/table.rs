//! A wavetable in PSRAM, as the engine sees it, and the pool they are allocated from.
//!
//! Frame length and frame count are per table: nothing assumes either, and two layers
//! can hold tables of different lengths at once.

/// Frame lengths the engine plays: 256 to 2048 samples.
pub const MIN_FRAME_LOG2: u8 = 8;
pub const MAX_FRAME_LOG2: u8 = 11;
pub const MAX_FRAMES: u16 = 1024;
/// Tables start on 256-byte boundaries (their address is 16 bits of 256-byte units).
pub const ALIGN: usize = 256;

#[derive(Clone, Copy, PartialEq, Eq, Debug)]
pub struct Table {
    /// Byte offset from the start of PSRAM.
    pub offset: usize,
    pub frame_log2: u8,
    pub frames: u16,
}

impl Table {
    pub const fn frame_len(&self) -> usize {
        1 << self.frame_log2
    }

    pub const fn samples(&self) -> usize {
        self.frame_len() * self.frames as usize
    }

    pub const fn bytes(&self) -> usize {
        self.samples() * 2
    }

    /// The same samples read with another frame length, as near a whole number of frames
    /// as fits. `total` is how many samples the table really holds: a file's frame length
    /// may have been a guess, and this undoes it without touching PSRAM.
    pub fn reshaped(&self, frame_log2: u8, total: usize) -> Table {
        let log2 = frame_log2.clamp(MIN_FRAME_LOG2, MAX_FRAME_LOG2);
        let frames = (total >> log2).clamp(1, MAX_FRAMES as usize) as u16;
        Table { offset: self.offset, frame_log2: log2, frames }
    }

    /// The engine's `table` register. One register, so a table changes atomically.
    pub const fn reg(&self) -> u32 {
        ((self.offset / ALIGN) as u32)
            | ((self.frame_log2 - MIN_FRAME_LOG2) as u32) << 16
            | ((self.frames - 1) as u32) << 18
    }
}

/// Hands out tables from a region of PSRAM, one after another.
pub struct Pool {
    next: usize,
    end: usize,
}

impl Pool {
    /// `base` and `bytes` in bytes from the start of PSRAM.
    pub const fn new(base: usize, bytes: usize) -> Self {
        Pool { next: base, end: base + bytes }
    }

    /// Gives back everything from `offset` up. (It is the caller's to say nothing there is in use.)
    pub fn rewind_to(&mut self, offset: usize) {
        self.next = offset;
    }

    /// Room for a table of this shape, or None if the shape is one the engine can't
    /// play or the pool is full.
    pub fn alloc(&mut self, frame_log2: u8, frames: u16) -> Option<Table> {
        if !(MIN_FRAME_LOG2..=MAX_FRAME_LOG2).contains(&frame_log2)
            || frames == 0 || frames > MAX_FRAMES {
            return None;
        }
        let offset = self.next.next_multiple_of(ALIGN);
        // (the register holds 16 bits of 256-byte units)
        if offset / ALIGN > 0xFFFF {
            return None;
        }
        let table = Table { offset, frame_log2, frames };
        if offset + table.bytes() > self.end {
            return None;
        }
        self.next = offset + table.bytes();
        Some(table)
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn the_register_packs_address_and_shape() {
        let t = Table { offset: 0x40_0000, frame_log2: 11, frames: 64 };
        assert_eq!(t.reg() & 0xFFFF, 0x4000);
        assert_eq!((t.reg() >> 16) & 3, 3);
        assert_eq!(t.reg() >> 18, 63);
        let short = Table { offset: 0x100, frame_log2: 8, frames: 1 };
        assert_eq!(short.reg(), 1);
        let most = Table { offset: 0xFFFF00, frame_log2: 8, frames: 1024 };
        assert_eq!(most.reg(), 0xFFFF | 1023 << 18);
    }

    #[test]
    fn a_table_can_be_read_with_another_frame_length() {
        let t = Table { offset: 0x1000, frame_log2: 11, frames: 8 };
        let total = t.samples();
        let short = t.reshaped(8, total);
        assert_eq!((short.frame_log2, short.frames, short.offset), (8, 64, 0x1000));
        // ... and back, losing nothing, even through a length that doesn't divide it.
        assert_eq!(short.reshaped(11, total), t);
        let odd = Table { offset: 0, frame_log2: 8, frames: 9 };
        let total = odd.samples();
        assert_eq!(odd.reshaped(11, total).frames, 1);
        assert_eq!(odd.reshaped(11, total).reshaped(8, total), odd);
    }

    #[test]
    fn reshaping_stays_in_what_the_engine_plays() {
        let t = Table { offset: 0, frame_log2: 8, frames: 1 };
        assert_eq!(t.reshaped(7, 256).frame_log2, 8);
        assert_eq!(t.reshaped(12, 256).frame_log2, 11);
        assert_eq!(t.reshaped(11, 256).frames, 1, "shorter than a frame: still one");
        assert_eq!(t.reshaped(8, 1 << 24).frames, 1024, "the most frames there can be");
    }

    #[test]
    fn the_pool_aligns_and_keeps_tables_apart() {
        let mut p = Pool::new(0x40_0010, 1 << 20);
        let a = p.alloc(8, 3).unwrap();
        assert_eq!(a.offset, 0x40_0100, "aligned up");
        let b = p.alloc(11, 2).unwrap();
        assert_eq!(b.offset, a.offset + 1536);
        let c = p.alloc(8, 1).unwrap();
        assert_eq!(c.offset, b.offset + 8192);
    }

    #[test]
    fn the_pool_refuses_what_the_engine_cant_play() {
        let mut p = Pool::new(0, 1 << 24);
        assert_eq!(p.alloc(7, 1), None);
        assert_eq!(p.alloc(12, 1), None);
        assert_eq!(p.alloc(8, 0), None);
        assert_eq!(p.alloc(8, 1025), None);
        assert!(p.alloc(8, 1024).is_some());
    }

    #[test]
    fn the_pool_refuses_what_doesnt_fit() {
        let mut p = Pool::new(0, 2048);
        assert!(p.alloc(10, 1).is_some());
        assert_eq!(p.alloc(8, 1), None);
    }

    #[test]
    fn nothing_past_the_register_reach() {
        let mut p = Pool::new(0x100_0000, 1 << 24);
        assert_eq!(p.alloc(8, 1), None);
    }
}
