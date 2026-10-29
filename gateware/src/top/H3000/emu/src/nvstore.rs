//! Keeps the H3000's battery-backed RAM (bank `$A0`, 16 KB) in flash, so
//! that the setup, the user programs and the current program survive a power
//! cycle: the kernel finds them there at boot and carries on with the last
//! program, edits included.
//!
//! The flash window (64 KB) holds two copies, one per 32 KB half: the 16 KB
//! of RAM, then a 16-byte header (magic, version, firmware kind, sequence
//! number, CRC-32) and [`EXTRA_BYTES`] of the firmware's own settings
//! ([`NvStore::set_extra`], checked by their user), programmed last. A save
//! goes to the half that does not hold the newest valid copy, so one cut
//! short by a power loss leaves the previous copy in place.
//!
//! Saves start once the RAM has stopped changing for [`QUIET_MS`], and run a
//! step per call (one sector erase or one page program, then polling for
//! its end), so the emulation never waits for the flash.

/// Bytes kept: the battery-backed RAM.
pub const NV_BYTES: usize = 0x4000;
/// Flash window needed: two halves.
pub const WINDOW_BYTES: u32 = 2 * HALF;
/// Save once the RAM has not changed for this long.
pub const QUIET_MS: u32 = 3000;

const HALF: u32 = 0x8000;
const SECTOR: u32 = 4096;
const PAGE: u32 = 256;
const HEADER: u32 = NV_BYTES as u32;
const HEADER_BYTES: usize = 16;
/// Bytes of settings kept after the header.
pub const EXTRA_BYTES: usize = 8;
/// Sectors erased per save: the data, the header and the settings.
const SECTORS: u32 = (HEADER + (HEADER_BYTES + EXTRA_BYTES) as u32).div_ceil(SECTOR);
const PAGES: u32 = NV_BYTES as u32 / PAGE;
const MAGIC: [u8; 4] = *b"H3NV";
const VERSION: u8 = 1;
/// The RAM is compared with the last copy seen this often.
const CHECK_MS: u32 = 250;

/// The flash operations used. Addresses are flash offsets; `erase_sector`
/// and `program` start an operation that is over once `busy` is false.
pub trait Flash {
    fn busy(&mut self) -> Result<bool, ()>;
    fn erase_sector(&mut self, addr: u32) -> Result<(), ()>;
    /// Program up to one page (`data` must not cross a 256-byte boundary).
    fn program(&mut self, addr: u32, data: &[u8]) -> Result<(), ()>;
    fn read(&mut self, addr: u32, data: &mut [u8]);
}

#[derive(Clone, Copy, PartialEq, Eq, Debug)]
enum Step {
    Idle,
    Erase(u32),
    Program(u32),
    Header,
    /// The header is being programmed; the save is over when it is.
    Finish,
}

pub struct NvStore<'a, F: Flash> {
    flash: F,
    base: u32,
    kind: u8,
    /// Sequence number and half of the newest valid copy in flash.
    seq: u32,
    newest: Option<u32>,
    /// The RAM as last seen, as in the newest copy, and being written.
    seen: &'a mut [u8; NV_BYTES],
    saved: &'a mut [u8; NV_BYTES],
    buf: &'a mut [u8; NV_BYTES],
    /// The settings wanted, as in the newest copy, and being written.
    extra: [u8; EXTRA_BYTES],
    saved_extra: [u8; EXTRA_BYTES],
    buf_extra: [u8; EXTRA_BYTES],
    quiet_ms: u32,
    check_ms: u32,
    step: Step,
    /// The half being written and whether an operation is under way.
    half: u32,
    started: bool,
    pub saves: u32,
    pub errors: u32,
}

impl<'a, F: Flash> NvStore<'a, F> {
    /// `base`: the flash offset of a window of [`WINDOW_BYTES`]. `kind`
    /// tells the ROM sets apart (a copy saved under another is ignored).
    /// The three buffers are working memory.
    pub fn new(
        flash: F,
        base: u32,
        kind: u8,
        seen: &'a mut [u8; NV_BYTES],
        saved: &'a mut [u8; NV_BYTES],
        buf: &'a mut [u8; NV_BYTES],
    ) -> Self {
        NvStore {
            flash,
            base,
            kind,
            seq: 0,
            newest: None,
            seen,
            saved,
            buf,
            extra: [0xFF; EXTRA_BYTES],
            saved_extra: [0xFF; EXTRA_BYTES],
            buf_extra: [0xFF; EXTRA_BYTES],
            quiet_ms: 0,
            check_ms: 0,
            step: Step::Idle,
            half: 0,
            started: false,
            saves: 0,
            errors: 0,
        }
    }

    /// Find the newest valid copy and put it in `nvram`. Returns whether
    /// there was one (if not, `nvram` is left as it is). Call once, first.
    pub fn load(&mut self, nvram: &mut [u8; NV_BYTES]) -> bool {
        let mut best: Option<(u32, u32)> = None;
        for half in 0..2 {
            let addr = self.base + half * HALF;
            let mut h = [0u8; HEADER_BYTES + EXTRA_BYTES];
            self.flash.read(addr + HEADER, &mut h);
            if h[0..4] != MAGIC || h[4] != VERSION || h[5] != self.kind {
                continue;
            }
            let seq = u32::from_le_bytes([h[8], h[9], h[10], h[11]]);
            let crc = u32::from_le_bytes([h[12], h[13], h[14], h[15]]);
            self.flash.read(addr, &mut self.buf[..]);
            if crc32(&self.buf[..]) != crc {
                continue;
            }
            if best.map_or(true, |(_, s)| seq > s) {
                best = Some((half, seq));
                self.saved.copy_from_slice(&self.buf[..]);
                self.saved_extra.copy_from_slice(&h[HEADER_BYTES..]);
            }
        }
        match best {
            Some((half, seq)) => {
                self.newest = Some(half);
                self.seq = seq;
                nvram.copy_from_slice(&self.saved[..]);
                self.seen.copy_from_slice(&self.saved[..]);
                self.extra = self.saved_extra;
                true
            }
            None => {
                // Nothing saved: anything the kernel puts there is new.
                self.saved.fill(0xFF);
                self.seen.copy_from_slice(&nvram[..]);
                false
            }
        }
    }

    /// The settings kept after the header (all 0xFF if none were).
    pub fn extra(&self) -> [u8; EXTRA_BYTES] {
        self.extra
    }

    /// Keep these settings: they are saved with the RAM, at once if it has
    /// not changed.
    pub fn set_extra(&mut self, extra: [u8; EXTRA_BYTES]) {
        self.extra = extra;
    }

    /// Whether a save is under way.
    pub fn saving(&self) -> bool {
        self.step != Step::Idle
    }

    /// Call often with the RAM and the time since the last call.
    pub fn poll(&mut self, nvram: &[u8; NV_BYTES], elapsed_ms: u32) {
        if self.step != Step::Idle {
            if let Err(()) = self.advance() {
                self.errors += 1;
                self.step = Step::Idle;
                self.quiet_ms = 0;
            }
            return;
        }
        self.check_ms += elapsed_ms;
        if self.check_ms < CHECK_MS {
            return;
        }
        let elapsed = self.check_ms;
        self.check_ms = 0;
        if nvram[..] != self.seen[..] {
            self.seen.copy_from_slice(&nvram[..]);
            self.quiet_ms = 0;
        } else {
            self.quiet_ms = self.quiet_ms.saturating_add(elapsed);
        }
        if self.quiet_ms >= QUIET_MS && (self.seen[..] != self.saved[..] || self.extra != self.saved_extra) {
            self.buf.copy_from_slice(&self.seen[..]);
            self.buf_extra = self.extra;
            self.half = match self.newest {
                Some(h) => 1 - h,
                None => 0,
            };
            self.step = Step::Erase(0);
            self.started = false;
        }
    }

    /// One step of a save: wait for the operation under way, then start the
    /// next one.
    fn advance(&mut self) -> Result<(), ()> {
        if self.started && self.flash.busy()? {
            return Ok(());
        }
        let addr = self.base + self.half * HALF;
        self.started = true;
        match self.step {
            Step::Idle => {}
            Step::Erase(n) => {
                self.flash.erase_sector(addr + n * SECTOR)?;
                self.step = if n + 1 < SECTORS { Step::Erase(n + 1) } else { Step::Program(0) };
            }
            Step::Program(n) => {
                let off = (n * PAGE) as usize;
                self.flash.program(addr + n * PAGE, &self.buf[off..off + PAGE as usize])?;
                self.step = if n + 1 < PAGES { Step::Program(n + 1) } else { Step::Header };
            }
            Step::Header => {
                let seq = self.seq.wrapping_add(1);
                let mut h = [0u8; HEADER_BYTES + EXTRA_BYTES];
                h[0..4].copy_from_slice(&MAGIC);
                h[4] = VERSION;
                h[5] = self.kind;
                h[8..12].copy_from_slice(&seq.to_le_bytes());
                h[12..16].copy_from_slice(&crc32(&self.buf[..]).to_le_bytes());
                h[HEADER_BYTES..].copy_from_slice(&self.buf_extra);
                self.flash.program(addr + HEADER, &h)?;
                self.step = Step::Finish;
            }
            Step::Finish => {
                self.seq = self.seq.wrapping_add(1);
                self.newest = Some(self.half);
                self.saved.copy_from_slice(&self.buf[..]);
                self.saved_extra = self.buf_extra;
                self.saves += 1;
                self.step = Step::Idle;
            }
        }
        Ok(())
    }
}

/// CRC-32 (IEEE 802.3).
fn crc32(data: &[u8]) -> u32 {
    let mut crc = 0xFFFF_FFFFu32;
    for &b in data {
        crc ^= b as u32;
        for _ in 0..8 {
            crc = if crc & 1 != 0 { (crc >> 1) ^ 0xEDB8_8320 } else { crc >> 1 };
        }
    }
    !crc
}

#[cfg(test)]
mod tests {
    use super::*;

    /// NOR flash: erase sets a sector to 0xFF, programming clears bits;
    /// each operation stays busy for a few polls.
    struct MockFlash {
        mem: std::vec::Vec<u8>,
        busy_polls: u32,
        /// Operations allowed before a simulated power loss (None: no limit).
        ops_left: Option<u32>,
    }

    impl MockFlash {
        fn new() -> Self {
            MockFlash { mem: std::vec![0xFF; WINDOW_BYTES as usize], busy_polls: 0, ops_left: None }
        }
        fn op(&mut self) -> Result<(), ()> {
            assert_eq!(self.busy_polls, 0, "operation started while busy");
            if let Some(n) = self.ops_left.as_mut() {
                if *n == 0 {
                    return Err(());
                }
                *n -= 1;
            }
            self.busy_polls = 3;
            Ok(())
        }
    }

    impl Flash for &mut MockFlash {
        fn busy(&mut self) -> Result<bool, ()> {
            if self.busy_polls > 0 {
                self.busy_polls -= 1;
            }
            Ok(self.busy_polls > 0)
        }
        fn erase_sector(&mut self, addr: u32) -> Result<(), ()> {
            self.op()?;
            assert_eq!(addr % SECTOR, 0);
            self.mem[addr as usize..(addr + SECTOR) as usize].fill(0xFF);
            Ok(())
        }
        fn program(&mut self, addr: u32, data: &[u8]) -> Result<(), ()> {
            self.op()?;
            assert!(addr / PAGE == (addr + data.len() as u32 - 1) / PAGE, "crosses a page");
            for (i, &b) in data.iter().enumerate() {
                self.mem[addr as usize + i] &= b;
            }
            Ok(())
        }
        fn read(&mut self, addr: u32, data: &mut [u8]) {
            data.copy_from_slice(&self.mem[addr as usize..addr as usize + data.len()]);
        }
    }

    fn bufs() -> [std::boxed::Box<[u8; NV_BYTES]>; 3] {
        [std::boxed::Box::new([0; NV_BYTES]), std::boxed::Box::new([0; NV_BYTES]), std::boxed::Box::new([0; NV_BYTES])]
    }

    /// Run until the store is idle again, `ms` at a time.
    fn settle(s: &mut NvStore<&mut MockFlash>, nv: &[u8; NV_BYTES]) {
        for _ in 0..10_000 {
            s.poll(nv, 10);
        }
        assert!(!s.saving());
    }

    #[test]
    fn save_and_load() {
        let mut flash = MockFlash::new();
        let mut nv = [0xFFu8; NV_BYTES];
        {
            let [mut a, mut b, mut c] = bufs();
            let mut s = NvStore::new(&mut flash, 0, 1, &mut a, &mut b, &mut c);
            assert!(!s.load(&mut nv));
            nv[5] = 42;
            nv[NV_BYTES - 1] = 7;
            settle(&mut s, &nv);
            assert_eq!(s.saves, 1);
            // Unchanged: no second save.
            settle(&mut s, &nv);
            assert_eq!(s.saves, 1);
            nv[100] = 1;
            settle(&mut s, &nv);
            assert_eq!(s.saves, 2);
        }
        let [mut a, mut b, mut c] = bufs();
        let mut s = NvStore::new(&mut flash, 0, 1, &mut a, &mut b, &mut c);
        let mut back = [0u8; NV_BYTES];
        assert!(s.load(&mut back));
        assert_eq!(back[..], nv[..]);
        // Another ROM set does not take it.
        let [mut a, mut b, mut c] = bufs();
        let mut other = NvStore::new(&mut flash, 0, 2, &mut a, &mut b, &mut c);
        assert!(!other.load(&mut back));
    }

    #[test]
    fn extra_settings() {
        let mut flash = MockFlash::new();
        let mut nv = [0xFFu8; NV_BYTES];
        {
            let [mut a, mut b, mut c] = bufs();
            let mut s = NvStore::new(&mut flash, 0, 1, &mut a, &mut b, &mut c);
            s.load(&mut nv);
            assert_eq!(s.extra(), [0xFF; EXTRA_BYTES]);
            // Settings alone are saved, then with the RAM.
            s.set_extra([1; EXTRA_BYTES]);
            settle(&mut s, &nv);
            assert_eq!(s.saves, 1);
            s.set_extra([2; EXTRA_BYTES]);
            nv[3] = 3;
            settle(&mut s, &nv);
            assert_eq!(s.saves, 2);
        }
        let [mut a, mut b, mut c] = bufs();
        let mut s = NvStore::new(&mut flash, 0, 1, &mut a, &mut b, &mut c);
        let mut back = [0u8; NV_BYTES];
        assert!(s.load(&mut back));
        assert_eq!((back[3], s.extra()), (3, [2; EXTRA_BYTES]));
        // A copy saved without settings (as before they were kept) still
        // loads, without them.
        for half in 0..2 {
            let at = (half * HALF + HEADER) as usize + HEADER_BYTES;
            flash.mem[at..at + EXTRA_BYTES].fill(0xFF);
        }
        let [mut a, mut b, mut c] = bufs();
        let mut s = NvStore::new(&mut flash, 0, 1, &mut a, &mut b, &mut c);
        assert!(s.load(&mut back));
        assert_eq!((back[3], s.extra()), (3, [0xFF; EXTRA_BYTES]));
    }

    #[test]
    fn interrupted_save_keeps_previous() {
        let mut flash = MockFlash::new();
        let mut nv = [0xFFu8; NV_BYTES];
        let first;
        {
            let [mut a, mut b, mut c] = bufs();
            let mut s = NvStore::new(&mut flash, 0, 1, &mut a, &mut b, &mut c);
            s.load(&mut nv);
            nv[1] = 1;
            settle(&mut s, &nv);
            first = nv;
            // Power lost part way through the next save.
            nv[2] = 2;
            s.flash.ops_left = Some(20);
            settle(&mut s, &nv);
            assert!(s.errors >= 1 && s.saves == 1);
        }
        flash.ops_left = None;
        let [mut a, mut b, mut c] = bufs();
        let mut s = NvStore::new(&mut flash, 0, 1, &mut a, &mut b, &mut c);
        let mut back = [0u8; NV_BYTES];
        assert!(s.load(&mut back));
        assert_eq!(back[..], first[..]);
    }

    #[test]
    fn waits_for_quiet() {
        let mut flash = MockFlash::new();
        let mut nv = [0xFFu8; NV_BYTES];
        let [mut a, mut b, mut c] = bufs();
        let mut s = NvStore::new(&mut flash, 0, 1, &mut a, &mut b, &mut c);
        s.load(&mut nv);
        // A change every second: never quiet for 3 s, no save.
        for i in 0..20u8 {
            nv[0] = i;
            for _ in 0..100 {
                s.poll(&nv, 10);
            }
            assert!(!s.saving() && s.saves == 0);
        }
        settle(&mut s, &nv);
        assert_eq!(s.saves, 1);
    }
}
