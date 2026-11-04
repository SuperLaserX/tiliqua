//! Patches, kept in flash: eight of them, in this bitstream's own window of it.
//!
//! Each has two 4 KB sectors, and a save erases and writes whichever doesn't hold its newest
//! copy, so power lost during a save costs that save and nothing else. A copy is one record: a
//! header with a sequence number and a CRC, then the patch. The sequence number runs across all
//! the patches, so the newest of them can be found at boot: it is the one saved last.
//!
//! The patch is written field by field, not as its memory, with a version number, so that a
//! later firmware can still read it: reflashing keeps this window. Version 1 kept the matrix's
//! amounts in whole percents; since version 2 they are in half-percents. Version 3 has room for more
//! tables' frame lengths, and says which file a layer's table came from, if it came from a drive.
//! Version 4 adds how a layer is read, its grains, and what one oscillator does to the other.
//! Version 5 adds a layer's fine tuning.

use crate::modulation::*;
use crate::patch::{Cross, CrossMode, Edge, Layer, Patch, ReadStyle, FINE_MAX, N_LAYERS};

pub const N_PATCHES: usize = 8;
/// How many tables' frame lengths a patch keeps (the FRAME row reshapes a table for all who
/// play it, so it belongs to the patch as much as the table does).
pub const N_TABLES: usize = 24;
/// How many tables' frame lengths a patch from before version 3 keeps.
const OLD_N_TABLES: usize = 4;
/// A file's path from the drive's root, in short names: `WAVES/BASICS~1.WAV`. Longer isn't kept.
pub const PATH_BYTES: usize = 39;

const SECTOR: u32 = 4096;
/// Flash window needed: two sectors a patch. A slot's window runs from 0xE0000 to its manifest
/// at 0xF0000, so this is all of it (`fairwave/test_flash_layout.py`).
pub const WINDOW_BYTES: u32 = N_PATCHES as u32 * 2 * SECTOR;

const MAGIC: [u8; 4] = *b"FWPT";
pub const VERSION: u8 = 5;
const HEADER_BYTES: usize = 16;
const PAGE: usize = 256;

/// Which file a table came from, so a patch can find it again.
#[derive(Clone, Copy, PartialEq, Eq, Debug)]
pub struct TableFile {
    /// Zero-padded; empty if the table was built in, not loaded.
    pub path: [u8; PATH_BYTES],
    /// What frame length it was being read with.
    pub frame_log2: u8,
}

impl TableFile {
    pub const NONE: TableFile = TableFile { path: [0; PATH_BYTES], frame_log2: 0 };

    pub fn new(path: &str, frame_log2: u8) -> TableFile {
        let mut f = TableFile { path: [0; PATH_BYTES], frame_log2 };
        if path.len() <= PATH_BYTES {
            f.path[..path.len()].copy_from_slice(path.as_bytes());
        }
        f
    }

    pub fn path(&self) -> &str {
        let n = self.path.iter().position(|b| *b == 0).unwrap_or(PATH_BYTES);
        core::str::from_utf8(&self.path[..n]).unwrap_or("")
    }

    /// The file's own part of the path.
    pub fn short_name(&self) -> &str {
        self.path().rsplit('/').next().unwrap_or("")
    }

    pub fn is_none(&self) -> bool {
        self.path[0] == 0
    }
}

/// What a patch holds.
#[derive(Clone, Copy, PartialEq, Eq, Debug)]
pub struct Saved {
    pub patch: Patch,
    /// Each table's log2 frame length, by table index. Zero: as it was built.
    pub frame_log2: [u8; N_TABLES],
    /// The file behind each layer's table.
    pub files: [TableFile; N_LAYERS],
}

/// The flash operations used. Addresses are flash offsets; `erase_sector` and `program` start an
/// operation that is over once `busy` is false.
pub trait Flash {
    fn busy(&mut self) -> Result<bool, ()>;
    fn erase_sector(&mut self, addr: u32) -> Result<(), ()>;
    /// Program up to one page (`data` must not cross a 256-byte boundary).
    fn program(&mut self, addr: u32, data: &[u8]) -> Result<(), ()>;
    fn read(&mut self, addr: u32, data: &mut [u8]);
}

fn crc32(parts: &[&[u8]]) -> u32 {
    let mut crc = 0xFFFF_FFFFu32;
    for part in parts {
        for &byte in part.iter() {
            crc ^= byte as u32;
            for _ in 0..8 {
                crc = if crc & 1 != 0 { (crc >> 1) ^ 0xEDB8_8320 } else { crc >> 1 };
            }
        }
    }
    !crc
}

/// Writes a patch's fields in order.
struct Writer<'a> {
    bytes: &'a mut [u8],
    at: usize,
}

impl Writer<'_> {
    fn u8(&mut self, v: u8) {
        self.bytes[self.at] = v;
        self.at += 1;
    }

    fn i16(&mut self, v: i16) {
        for b in v.to_le_bytes() {
            self.u8(b);
        }
    }
}

/// Reads them back, and tells when it runs out.
struct Reader<'a> {
    bytes: &'a [u8],
    at: usize,
}

impl Reader<'_> {
    fn u8(&mut self) -> Option<u8> {
        let v = *self.bytes.get(self.at)?;
        self.at += 1;
        Some(v)
    }

    fn i16(&mut self) -> Option<i16> {
        Some(i16::from_le_bytes([self.u8()?, self.u8()?]))
    }

    /// A value that must be in range: a patch's CRC is good, but a value out of range still
    /// shouldn't reach the screens, which index tables with it.
    fn at_most(&mut self, max: u8) -> Option<u8> {
        Some(self.u8()?.min(max))
    }

    fn within(&mut self, limit: i16) -> Option<i16> {
        Some(self.i16()?.clamp(-limit, limit))
    }
}

/// Enough for a patch, in the fields written below.
pub const PATCH_BYTES: usize = N_LAYERS * 9 + N_ENVELOPES * 12 + N_LFOS * 7 + N_SLOTS * 4 + 6 + N_TABLES
    + N_LAYERS * (PATH_BYTES + 1) + VERSION_4_BYTES + VERSION_5_BYTES;
/// What version 4 added, at the end.
const VERSION_4_BYTES: usize = N_LAYERS * 2 + 4;
/// And version 5, after that.
const VERSION_5_BYTES: usize = N_LAYERS;
const _: () = assert!(PATCH_BYTES <= PAGE - HEADER_BYTES);

/// A patch as bytes. Enums go by number: they are only ever added to at their ends.
pub fn encode(saved: &Saved) -> [u8; PATCH_BYTES] {
    let mut out = [0; PATCH_BYTES];
    let mut w = Writer { bytes: &mut out, at: 0 };
    let p = &saved.patch;
    for l in &p.layers {
        w.u8(l.table);
        w.i16(l.semitones);
        w.i16(l.position as i16);
        w.i16(l.shift);
        w.u8(l.edge as u8);
        w.u8(l.level);
    }
    for e in &p.envelopes {
        for v in [e.gate, e.delay, e.attack, e.hold, e.decay, e.sustain, e.release] {
            w.u8(v);
        }
        for c in e.curves {
            w.u8(c as u8);
        }
        w.u8(e.looping as u8);
        w.u8(e.vca);
    }
    for l in &p.lfos {
        w.u8(l.rate);
        w.u8(l.shape as u8);
        w.u8(l.unipolar as u8);
        w.i16(l.phase as i16);
        w.u8(l.level);
        w.u8(l.sync);
    }
    for s in &p.slots {
        w.u8(s.source as u8);
        w.u8(s.dest as u8);
        w.i16(s.amount);
    }
    for o in p.mixer.outs {
        w.u8(o as u8);
    }
    w.i16(p.mixer.balance);
    for f in saved.frame_log2 {
        w.u8(f);
    }
    for f in &saved.files {
        for b in f.path {
            w.u8(b);
        }
        w.u8(f.frame_log2);
    }
    for l in &p.layers {
        w.u8(l.read as u8);
        w.u8(l.grain);
    }
    w.u8(p.cross.mode as u8);
    w.u8(p.cross.modulator);
    w.i16(p.cross.depth as i16);
    for l in &p.layers {
        w.u8(l.fine as u8);
    }
    out
}

/// `version` is the one it was written with.
pub fn decode(bytes: &[u8], version: u8) -> Option<Saved> {
    let mut r = Reader { bytes, at: 0 };
    let mut saved = Saved { patch: Patch::default(), frame_log2: [0; N_TABLES], files: [TableFile::NONE; N_LAYERS] };
    let p = &mut saved.patch;
    for l in p.layers.iter_mut() {
        *l = Layer {
            table: r.u8()?,
            semitones: r.within(48)?,
            fine: 0,
            position: r.within(1000)?.max(0) as u16,
            shift: r.within(2000)?,
            edge: Edge::Clamp.next(r.u8()? as i32),
            level: r.at_most(100)?,
            read: ReadStyle::Clean,
            grain: 0,
        };
    }
    for e in p.envelopes.iter_mut() {
        e.gate = r.at_most(3)?;
        e.delay = r.at_most(TIME_MAX)?;
        e.attack = r.at_most(TIME_MAX)?;
        e.hold = r.at_most(TIME_MAX)?;
        e.decay = r.at_most(TIME_MAX)?;
        e.sustain = r.at_most(100)?;
        e.release = r.at_most(TIME_MAX)?;
        for c in e.curves.iter_mut() {
            *c = (r.u8()? as i8).clamp(-100, 100);
        }
        e.looping = LoopMode::Off.next(r.u8()? as i32);
        e.vca = r.at_most(3)?;
    }
    for l in p.lfos.iter_mut() {
        l.rate = r.at_most(RATE_MAX)?;
        l.shape = Shape::Sine.next(r.u8()? as i32);
        l.unipolar = r.u8()? != 0;
        l.phase = r.within(359)?.max(0) as u16;
        l.level = r.at_most(100)?;
        l.sync = r.at_most(3)?;
    }
    for s in p.slots.iter_mut() {
        s.source = Source::None.next(r.u8()? as i32);
        s.dest = Dest::Pitch1.next(r.u8()? as i32);
        let amount = r.i16()?;
        let amount = if version < 2 { amount.saturating_mul(2) } else { amount };
        s.amount = amount.clamp(-s.dest.amount_limit(), s.dest.amount_limit());
    }
    for o in p.mixer.outs.iter_mut() {
        *o = OutSel::Off.next(r.u8()? as i32);
    }
    p.mixer.balance = r.within(1000)?.max(0);
    let tables = if version < 3 { OLD_N_TABLES } else { N_TABLES };
    for f in saved.frame_log2[..tables].iter_mut() {
        *f = r.u8()?;
    }
    if version >= 3 {
        for f in saved.files.iter_mut() {
            for b in f.path.iter_mut() {
                *b = r.u8()?;
            }
            f.frame_log2 = r.u8()?;
        }
    }
    if version >= 4 {
        for l in p.layers.iter_mut() {
            l.read = ReadStyle::Clean.next(r.u8()? as i32);
            l.grain = r.at_most(3)?;
        }
        p.cross = Cross {
            mode: CrossMode::Off.next(r.u8()? as i32),
            modulator: r.at_most(1)?,
            depth: r.within(1000)?.max(0) as u16,
        };
    }
    if version >= 5 {
        for l in p.layers.iter_mut() {
            l.fine = (r.u8()? as i8).clamp(-FINE_MAX, FINE_MAX);
        }
    }
    Some(saved)
}

#[derive(Clone, Copy, PartialEq, Eq, Debug)]
pub enum StoreError {
    /// The flash didn't do as it was told, or a save didn't read back.
    Flash,
}

/// What a patch's two sectors hold.
#[derive(Clone, Copy, PartialEq, Eq, Debug, Default)]
struct Entry {
    /// The newest copy's sequence number and sector (0 or 1), if there is one.
    newest: Option<(u32, u8)>,
}

pub struct Store<F: Flash> {
    flash: F,
    base: u32,
    entries: [Entry; N_PATCHES],
    /// The highest sequence number in use.
    seq: u32,
}

impl<F: Flash> Store<F> {
    /// `base` is the window's flash offset. Reads every copy's header, and checks its CRC.
    pub fn new(flash: F, base: u32) -> Self {
        let mut store = Store { flash, base, entries: [Entry::default(); N_PATCHES], seq: 0 };
        for i in 0..N_PATCHES {
            for copy in 0..2 {
                if let Some(seq) = store.read_copy(i, copy, None) {
                    if store.entries[i].newest.is_none_or(|(s, _)| seq > s) {
                        store.entries[i].newest = Some((seq, copy));
                    }
                    store.seq = store.seq.max(seq);
                }
            }
        }
        store
    }

    fn addr(&self, patch: usize, copy: u8) -> u32 {
        self.base + (patch as u32 * 2 + copy as u32) * SECTOR
    }

    /// A copy's sequence number if it is good, and its patch's bytes and version into `out`.
    fn read_copy(&mut self, patch: usize, copy: u8, out: Option<(&mut [u8], &mut u8)>) -> Option<u32> {
        let at = self.addr(patch, copy);
        let mut page = [0u8; PAGE];
        self.flash.read(at, &mut page);
        let (head, body) = page.split_at(HEADER_BYTES);
        if head[0..4] != MAGIC || head[4] == 0 || head[4] > VERSION || head[5] as usize != patch {
            return None;
        }
        let len = u16::from_le_bytes([head[6], head[7]]) as usize;
        if len > body.len() {
            return None;
        }
        let crc = u32::from_le_bytes([head[12], head[13], head[14], head[15]]);
        if crc != crc32(&[&head[0..12], &body[..len]]) {
            return None;
        }
        if let Some((out, version)) = out {
            let n = len.min(out.len());
            out[..n].copy_from_slice(&body[..n]);
            *version = head[4];
        }
        Some(u32::from_le_bytes([head[8], head[9], head[10], head[11]]))
    }

    fn wait(&mut self) -> Result<(), StoreError> {
        // (a sector erase is under half a second; at a few microseconds a poll this is ample)
        for _ in 0..2_000_000 {
            if !self.flash.busy().map_err(|_| StoreError::Flash)? {
                return Ok(());
            }
        }
        Err(StoreError::Flash)
    }

    pub fn used(&self, patch: usize) -> bool {
        self.entries[patch].newest.is_some()
    }

    /// The patch saved last, if any.
    pub fn newest(&self) -> Option<usize> {
        (0..N_PATCHES)
            .filter(|&i| self.used(i))
            .max_by_key(|&i| self.entries[i].newest.map_or(0, |(seq, _)| seq))
    }

    pub fn load(&mut self, patch: usize) -> Option<Saved> {
        let (_, copy) = self.entries[patch].newest?;
        let mut bytes = [0u8; PATCH_BYTES];
        let mut version = 0;
        self.read_copy(patch, copy, Some((&mut bytes, &mut version)))?;
        decode(&bytes, version)
    }

    /// Saves over the older copy; the newer one stays until this one is in place and checked.
    pub fn save(&mut self, patch: usize, saved: &Saved) -> Result<(), StoreError> {
        let copy = match self.entries[patch].newest {
            Some((_, 0)) => 1,
            _ => 0,
        };
        let at = self.addr(patch, copy);
        let seq = self.seq.wrapping_add(1);

        let body = encode(saved);
        let mut page = [0xFFu8; PAGE];
        page[0..4].copy_from_slice(&MAGIC);
        page[4] = VERSION;
        page[5] = patch as u8;
        page[6..8].copy_from_slice(&(PATCH_BYTES as u16).to_le_bytes());
        page[8..12].copy_from_slice(&seq.to_le_bytes());
        let crc = crc32(&[&page[0..12], &body]);
        page[12..16].copy_from_slice(&crc.to_le_bytes());
        page[HEADER_BYTES..HEADER_BYTES + PATCH_BYTES].copy_from_slice(&body);

        self.flash.erase_sector(at).map_err(|_| StoreError::Flash)?;
        self.wait()?;
        self.flash.program(at, &page).map_err(|_| StoreError::Flash)?;
        self.wait()?;

        if self.read_copy(patch, copy, None) != Some(seq) {
            return Err(StoreError::Flash);
        }
        self.entries[patch].newest = Some((seq, copy));
        self.seq = seq;
        Ok(())
    }

    /// Empties a patch.
    pub fn erase(&mut self, patch: usize) -> Result<(), StoreError> {
        for copy in 0..2 {
            let at = self.addr(patch, copy);
            self.flash.erase_sector(at).map_err(|_| StoreError::Flash)?;
            self.wait()?;
        }
        self.entries[patch].newest = None;
        Ok(())
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::patch::Patch;

    const _: () = assert!(HEADER_BYTES + PATCH_BYTES <= PAGE);

    const BASE: u32 = 0x1E_0000;

    /// A flash that really only clears bits on programming, and can be cut off part way.
    struct FakeFlash {
        mem: std::vec::Vec<u8>,
        /// Operations until the power goes: later ones do nothing.
        power_left: Option<u32>,
        fail: bool,
    }

    impl FakeFlash {
        fn new() -> Self {
            FakeFlash { mem: vec![0xFF; WINDOW_BYTES as usize], power_left: None, fail: false }
        }

        fn powered(&mut self) -> bool {
            match self.power_left.as_mut() {
                Some(0) => false,
                Some(n) => {
                    *n -= 1;
                    true
                }
                None => true,
            }
        }
    }

    impl Flash for &mut FakeFlash {
        fn busy(&mut self) -> Result<bool, ()> {
            Ok(false)
        }

        fn erase_sector(&mut self, addr: u32) -> Result<(), ()> {
            assert_eq!(addr % SECTOR, 0, "erasing part of a sector");
            if self.fail {
                return Err(());
            }
            if self.powered() {
                let at = (addr - BASE) as usize;
                self.mem[at..at + SECTOR as usize].fill(0xFF);
            }
            Ok(())
        }

        fn program(&mut self, addr: u32, data: &[u8]) -> Result<(), ()> {
            assert!(addr as usize % PAGE + data.len() <= PAGE, "crosses a page");
            if self.powered() {
                let at = (addr - BASE) as usize;
                for (i, b) in data.iter().enumerate() {
                    assert_eq!(self.mem[at + i] & b, *b, "programming over a programmed bit");
                    self.mem[at + i] &= *b;
                }
            }
            Ok(())
        }

        fn read(&mut self, addr: u32, data: &mut [u8]) {
            let at = (addr - BASE) as usize;
            data.copy_from_slice(&self.mem[at..at + data.len()]);
        }
    }

    fn a_patch(n: u8) -> Saved {
        let mut p = Patch::default();
        p.layers[0].semitones = n as i16 - 5;
        p.layers[1].fine = n as i8 - 12;
        p.layers[1].position = 100 + n as u16;
        p.layers[1].shift = -(n as i16) * 10;
        p.layers[0].edge = Edge::Mirror;
        p.envelopes[1].attack = n;
        p.envelopes[0].curves = [-100, 7, 100];
        p.envelopes[1].looping = LoopMode::Free;
        p.envelopes[0].vca = 3;
        p.lfos[2].shape = Shape::Random;
        p.lfos[1].unipolar = true;
        p.lfos[0].phase = 345;
        p.slots[11] = Slot { source: Source::Lfo3, dest: Dest::Balance, amount: -400 };
        p.mixer.outs = [OutSel::Mix, OutSel::Lfo1, OutSel::Off, OutSel::Env2];
        p.mixer.balance = 1000;
        p.layers[0].read = ReadStyle::Stepped;
        p.layers[1].grain = 2;
        p.cross = Cross { mode: CrossMode::Pd, modulator: 1, depth: 625 };
        let mut frame_log2 = [0; N_TABLES];
        frame_log2[..4].copy_from_slice(&[11, 8, 9, n % 4 + 8]);
        frame_log2[N_TABLES - 1] = 10;
        let files = [TableFile::new("WAVES/BASICS~1.WAV", 11), TableFile::NONE];
        Saved { patch: p, frame_log2, files }
    }

    #[test]
    fn a_patch_survives_being_bytes() {
        for n in [0, 3, 20] {
            let s = a_patch(n);
            assert_eq!(decode(&encode(&s), VERSION), Some(s));
        }
    }

    #[test]
    fn every_setting_reaches_the_bytes() {
        // Change each field in turn: the encoding must change. A field left out wouldn't.
        let base = encode(&a_patch(1));
        let mut changed = 0;
        for i in 0..PATCH_BYTES {
            let mut b = base;
            b[i] ^= 1;
            if let Some(s) = decode(&b, VERSION) {
                if s != a_patch(1) {
                    changed += 1;
                }
            }
        }
        assert!(changed > PATCH_BYTES / 2, "{changed} of {PATCH_BYTES}");
    }

    #[test]
    fn nonsense_values_come_back_in_range() {
        let s = decode(&[0xEE; PATCH_BYTES], VERSION).unwrap();
        let p = s.patch;
        assert!(p.layers[0].level <= 100 && p.layers[0].position <= 1000);
        assert!(p.envelopes[0].attack <= TIME_MAX && p.envelopes[0].sustain <= 100);
        assert!(p.envelopes[0].gate <= 3 && p.envelopes[0].vca <= 3);
        assert!(p.lfos[0].rate <= RATE_MAX && p.lfos[0].phase < 360);
        assert!(p.slots[0].amount.abs() <= p.slots[0].dest.amount_limit());
        assert!(p.mixer.balance >= 0 && p.mixer.balance <= 1000);
        assert!(p.layers[0].grain <= 3 && p.cross.modulator <= 1 && p.cross.depth <= 1000);
    }

    #[test]
    fn a_short_record_is_not_a_patch() {
        assert_eq!(decode(&[0; 10], VERSION), None);
    }

    #[test]
    fn blank_flash_has_no_patches() {
        let mut f = FakeFlash::new();
        let s = Store::new(&mut f, BASE);
        assert_eq!(s.newest(), None);
        assert!((0..N_PATCHES).all(|i| !s.used(i)));
    }

    #[test]
    fn what_was_saved_loads_and_survives_a_power_cycle() {
        let mut f = FakeFlash::new();
        {
            let mut s = Store::new(&mut f, BASE);
            s.save(3, &a_patch(3)).unwrap();
            s.save(7, &a_patch(7)).unwrap();
            assert_eq!(s.load(3), Some(a_patch(3)));
            assert_eq!(s.load(7), Some(a_patch(7)));
            assert_eq!(s.load(4), None, "an empty patch");
        }
        let mut s = Store::new(&mut f, BASE);
        assert!(s.used(3) && s.used(7) && !s.used(4));
        assert_eq!(s.load(3), Some(a_patch(3)));
        assert_eq!(s.load(7), Some(a_patch(7)));
    }

    #[test]
    fn the_newest_is_the_one_saved_last_whatever_its_number() {
        let mut f = FakeFlash::new();
        let mut s = Store::new(&mut f, BASE);
        s.save(6, &a_patch(6)).unwrap();
        s.save(2, &a_patch(2)).unwrap();
        assert_eq!(s.newest(), Some(2));
        s.save(6, &a_patch(10)).unwrap();
        assert_eq!(s.newest(), Some(6));
        drop(s);
        assert_eq!(Store::new(&mut f, BASE).newest(), Some(6), "after a power cycle too");
    }

    #[test]
    fn saving_again_replaces_and_alternates_sectors() {
        let mut f = FakeFlash::new();
        let mut s = Store::new(&mut f, BASE);
        for n in 0..5 {
            s.save(0, &a_patch(n)).unwrap();
            assert_eq!(s.load(0), Some(a_patch(n)));
        }
        drop(s);
        let mut s = Store::new(&mut f, BASE);
        assert_eq!(s.load(0), Some(a_patch(4)));
    }

    #[test]
    fn power_lost_during_a_save_keeps_the_previous_copy() {
        // Cut the power at every step of the save: erase, program.
        for steps in 0..2 {
            let mut f = FakeFlash::new();
            let mut s = Store::new(&mut f, BASE);
            s.save(7, &a_patch(1)).unwrap();
            drop(s);
            f.power_left = Some(steps);
            let mut s = Store::new(&mut f, BASE);
            assert!(s.save(7, &a_patch(2)).is_err(), "a save with no power can't check out");
            drop(s);
            f.power_left = None;
            let mut s = Store::new(&mut f, BASE);
            assert_eq!(s.load(7), Some(a_patch(1)), "cut after {steps} steps");
        }
    }

    #[test]
    fn a_partly_written_copy_is_ignored() {
        let mut f = FakeFlash::new();
        let mut s = Store::new(&mut f, BASE);
        s.save(5, &a_patch(1)).unwrap();
        s.save(5, &a_patch(2)).unwrap();
        drop(s);
        // Corrupt the newest copy: the older one is what's left.
        let at = 5 * 2 * SECTOR as usize;
        let newest = if f.mem[at + 8] > f.mem[at + SECTOR as usize + 8] { at } else { at + SECTOR as usize };
        f.mem[newest + HEADER_BYTES + 3] ^= 0x10;
        let mut s = Store::new(&mut f, BASE);
        assert_eq!(s.load(5), Some(a_patch(1)));
    }

    #[test]
    fn another_bitstreams_leftovers_are_not_patches() {
        let mut f = FakeFlash::new();
        for (i, b) in f.mem.iter_mut().enumerate() {
            *b = (i as u32).wrapping_mul(2654435761).to_le_bytes()[3];
        }
        let mut s = Store::new(&mut f, BASE);
        assert!((0..N_PATCHES).all(|i| !s.used(i)));
        s.save(0, &a_patch(0)).unwrap();
        assert_eq!(s.load(0), Some(a_patch(0)), "a save erases first");
    }

    #[test]
    fn a_record_for_another_patch_or_version_is_ignored() {
        let mut f = FakeFlash::new();
        let mut s = Store::new(&mut f, BASE);
        s.save(1, &a_patch(1)).unwrap();
        drop(s);
        // Move it to patch 2's sector, without touching its contents.
        let (from, to) = (2 * SECTOR as usize, 4 * SECTOR as usize);
        let page: std::vec::Vec<u8> = f.mem[from..from + PAGE].to_vec();
        f.mem[to..to + PAGE].copy_from_slice(&page);
        let s = Store::new(&mut f, BASE);
        assert!(s.used(1) && !s.used(2));
    }

    /// Puts `saved` in flash as `version` would have written it, with these amounts in its bytes.
    fn write_as_version(f: &mut FakeFlash, patch: usize, saved: &Saved, version: u8, amounts: &[i16; N_SLOTS]) {
        let mut body = encode(saved);
        // Before version 3, four tables' frame lengths ended it; and version 3, the files.
        let bytes = match version {
            ..=2 => PATCH_BYTES - VERSION_5_BYTES - VERSION_4_BYTES - (N_TABLES - OLD_N_TABLES) - N_LAYERS * (PATH_BYTES + 1),
            3 => PATCH_BYTES - VERSION_5_BYTES - VERSION_4_BYTES,
            4 => PATCH_BYTES - VERSION_5_BYTES,
            _ => PATCH_BYTES,
        };
        let first_amount = N_LAYERS * 9 + N_ENVELOPES * 12 + N_LFOS * 7 + 2;
        for (i, a) in amounts.iter().enumerate() {
            body[first_amount + i * 4..first_amount + i * 4 + 2].copy_from_slice(&a.to_le_bytes());
        }
        let mut page = [0xFFu8; PAGE];
        page[0..4].copy_from_slice(&MAGIC);
        page[4] = version;
        page[5] = patch as u8;
        page[6..8].copy_from_slice(&(bytes as u16).to_le_bytes());
        page[8..12].copy_from_slice(&1u32.to_le_bytes());
        let crc = crc32(&[&page[0..12], &body[..bytes]]);
        page[12..16].copy_from_slice(&crc.to_le_bytes());
        page[HEADER_BYTES..HEADER_BYTES + bytes].copy_from_slice(&body[..bytes]);
        let at = patch * 2 * SECTOR as usize;
        f.mem[at..at + PAGE].copy_from_slice(&page);
    }

    #[test]
    fn a_patch_saved_in_whole_percents_keeps_its_amounts() {
        let mut f = FakeFlash::new();
        let saved = a_patch(1);
        let mut amounts = [0; N_SLOTS];
        amounts[0] = 100;
        amounts[1] = -5;
        amounts[11] = 400;
        write_as_version(&mut f, 3, &saved, 1, &amounts);
        let mut s = Store::new(&mut f, BASE);
        let loaded = s.load(3).expect("still a patch");
        assert_eq!(loaded.patch.slots[0].amount, 200, "100%");
        assert_eq!(loaded.patch.slots[1].amount, -10, "-5%");
        assert_eq!(loaded.patch.slots[11].amount, 800, "400%");
        // Saved again, it is in the new form and means the same.
        s.save(3, &loaded).unwrap();
        assert_eq!(s.load(3), Some(loaded));
    }

    #[test]
    fn a_patch_from_before_version_3_keeps_its_four_tables_and_says_no_files() {
        let mut f = FakeFlash::new();
        let saved = a_patch(1);
        write_as_version(&mut f, 3, &saved, 2, &[0; N_SLOTS]);
        let mut s = Store::new(&mut f, BASE);
        let loaded = s.load(3).expect("still a patch");
        assert_eq!(loaded.frame_log2[..4], saved.frame_log2[..4]);
        assert!(loaded.frame_log2[4..].iter().all(|f| *f == 0), "the rest: as they were built");
        assert!(loaded.files.iter().all(|f| f.is_none()));
    }

    #[test]
    fn a_patch_from_before_version_4_plays_clean_with_no_grains_and_no_cross_modulation() {
        let mut f = FakeFlash::new();
        let saved = a_patch(1);
        let amounts: [i16; N_SLOTS] = core::array::from_fn(|i| saved.patch.slots[i].amount);
        write_as_version(&mut f, 3, &saved, 3, &amounts);
        let mut s = Store::new(&mut f, BASE);
        let loaded = s.load(3).expect("still a patch");
        assert_eq!(loaded.files, saved.files, "what version 3 had is still there");
        assert_eq!(loaded.patch.layers[0].semitones, saved.patch.layers[0].semitones);
        assert!(loaded.patch.layers.iter().all(|l| l.read == ReadStyle::Clean && l.grain == 0));
        assert_eq!(loaded.patch.cross, Cross::OFF);
    }

    #[test]
    fn a_patch_from_before_version_5_keeps_everything_and_is_in_tune() {
        let mut f = FakeFlash::new();
        let saved = a_patch(20);
        assert_ne!(saved.patch.layers[1].fine, 0);
        let amounts: [i16; N_SLOTS] = core::array::from_fn(|i| saved.patch.slots[i].amount);
        write_as_version(&mut f, 3, &saved, 4, &amounts);
        let mut s = Store::new(&mut f, BASE);
        let loaded = s.load(3).expect("still a patch");
        assert_eq!(loaded.patch.cross, saved.patch.cross, "what version 4 had is still there");
        assert_eq!(loaded.patch.layers[1].fine, 0);
        assert_eq!(loaded.patch.layers[1].read, saved.patch.layers[1].read);
    }

    #[test]
    fn a_patch_remembers_the_file_behind_a_table() {
        let mut f = FakeFlash::new();
        let mut s = Store::new(&mut f, BASE);
        s.save(2, &a_patch(1)).unwrap();
        let loaded = s.load(2).unwrap();
        assert_eq!(loaded.files[0].path(), "WAVES/BASICS~1.WAV");
        assert_eq!(loaded.files[0].frame_log2, 11);
        assert!(loaded.files[1].is_none());
    }

    #[test]
    fn a_path_too_long_to_keep_is_not_kept_cut_short() {
        let long = "A".repeat(PATH_BYTES + 1);
        assert!(TableFile::new(&long, 11).is_none());
        let fits = "B".repeat(PATH_BYTES);
        assert_eq!(TableFile::new(&fits, 11).path(), fits);
    }

    #[test]
    fn a_patch_from_a_later_firmware_is_left_alone() {
        let mut f = FakeFlash::new();
        write_as_version(&mut f, 2, &a_patch(1), VERSION + 1, &[0; N_SLOTS]);
        assert!(!Store::new(&mut f, BASE).used(2));
    }

    #[test]
    fn erasing_empties_both_copies() {
        let mut f = FakeFlash::new();
        let mut s = Store::new(&mut f, BASE);
        s.save(6, &a_patch(1)).unwrap();
        s.save(6, &a_patch(2)).unwrap();
        s.erase(6).unwrap();
        assert!(!s.used(6));
        assert_eq!(s.load(6), None);
        drop(s);
        assert!(!Store::new(&mut f, BASE).used(6), "and it stays empty");
    }

    #[test]
    fn a_flash_error_is_reported_and_leaves_the_patch_alone() {
        let mut f = FakeFlash::new();
        let mut s = Store::new(&mut f, BASE);
        s.save(0, &a_patch(1)).unwrap();
        drop(s);
        f.fail = true;
        let mut s = Store::new(&mut f, BASE);
        assert_eq!(s.save(0, &a_patch(2)), Err(StoreError::Flash));
        assert_eq!(s.load(0), Some(a_patch(1)));
    }
}
