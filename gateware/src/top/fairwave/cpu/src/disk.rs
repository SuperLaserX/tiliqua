//! A drive's files: listing a directory, looking at a file's start, reading one into memory. Only
//! ever reads: a drive plugged in here comes out as it went in.
//!
//! All of it goes through guh's `UsbMsc` trait, so it runs the same on a USB drive and on a disk
//! image (`ImageDisk`), which is how the host tests and the simulation test it.

use fatfs::{FileAttributes, FileSystem, FsOptions, Read};
use guh_dma::DmaBuf;
use guh_usb_msc::fat_stream::{FatStream, StreamConfig};
use guh_usb_msc::usb_msc::{UsbMsc, UsbMscStatus, BLOCK_BYTES};
use guh_usb_msc::usb_msc_fatfs::UsbMscBlockDevice;

/// How much of a name is kept: what the browser's rows have room for.
pub const NAME_BYTES: usize = 27;
/// `FILENAME.EXT`.
pub const SHORT_BYTES: usize = 12;
/// The most a directory lists.
pub const MAX_ENTRIES: usize = 256;

#[derive(Clone, Copy, PartialEq, Eq, Debug)]
pub enum DiskError {
    /// There's no FAT file system to read, or the drive went away.
    Mount,
    NotFound,
    TooLarge,
    Empty,
    /// Reading failed part way: the drive went away, or a bad sector.
    Read,
}

impl DiskError {
    pub const fn text(self) -> &'static str {
        match self {
            DiskError::Mount => "CAN'T READ THIS DRIVE",
            DiskError::NotFound => "NOT FOUND",
            DiskError::TooLarge => "FILE TOO LARGE",
            DiskError::Empty => "FILE IS EMPTY",
            DiskError::Read => "READ FAILED",
        }
    }
}

/// A file or directory, as the browser lists it.
#[derive(Clone, Copy, PartialEq, Eq, Debug)]
pub struct Entry {
    short: [u8; SHORT_BYTES],
    short_len: u8,
    name: [u8; NAME_BYTES],
    name_len: u8,
    pub size: u32,
    pub is_dir: bool,
}

impl Entry {
    pub const EMPTY: Entry = Entry {
        short: [0; SHORT_BYTES],
        short_len: 0,
        name: [0; NAME_BYTES],
        name_len: 0,
        size: 0,
        is_dir: false,
    };

    /// The row that goes back up a directory.
    pub fn up() -> Entry {
        let mut e = Entry { is_dir: true, ..Entry::EMPTY };
        e.short[..2].copy_from_slice(b"..");
        e.short_len = 2;
        e.name[..2].copy_from_slice(b"..");
        e.name_len = 2;
        e
    }

    pub fn is_up(&self) -> bool {
        self.short() == ".."
    }

    /// What to open it by. Always plain ASCII, and short enough for a patch to keep.
    pub fn short(&self) -> &str {
        core::str::from_utf8(&self.short[..self.short_len as usize]).unwrap_or("")
    }

    /// What to show.
    pub fn name(&self) -> &str {
        core::str::from_utf8(&self.name[..self.name_len as usize]).unwrap_or("")
    }

    fn set_name(&mut self, units: impl Iterator<Item = u16>) {
        self.name_len = 0;
        for u in units {
            if self.name_len as usize == NAME_BYTES {
                break;
            }
            // The fonts are ASCII.
            self.name[self.name_len as usize] = if (0x20..0x7F).contains(&u) { u as u8 } else { b'?' };
            self.name_len += 1;
        }
    }

    /// Sorted case-insensitively, directories first and the way up before all.
    fn sorts_before(&self, other: &Entry) -> core::cmp::Ordering {
        other.is_up().cmp(&self.is_up())
            .then(other.is_dir.cmp(&self.is_dir))
            .then_with(|| {
                let a = self.name().bytes().map(|c| c.to_ascii_lowercase());
                let b = other.name().bytes().map(|c| c.to_ascii_lowercase());
                a.cmp(b)
            })
    }
}

fn is_wav(name: &[u8]) -> bool {
    name.len() > 4 && name[name.len() - 4..].eq_ignore_ascii_case(b".wav")
}

/// The buffers reading needs: `windows` the file system reads through, `fat_cache` for following a
/// file's clusters. All whole numbers of blocks.
#[derive(Clone, Copy)]
pub struct Buffers {
    pub windows: [&'static DmaBuf; 2],
    pub fat_cache: &'static DmaBuf,
}

/// Lists a directory (`""` is the root), sorted, into `out`: only the directories and `.wav` files,
/// as nothing else can be opened, and nothing hidden. Returns how many.
pub fn list<M: UsbMsc>(disk: &mut M, buffers: &Buffers, dir: &str, out: &mut [Entry]) -> Result<usize, DiskError> {
    let device = UsbMscBlockDevice::new(disk, buffers.windows).map_err(|_| DiskError::Mount)?;
    let fs = FileSystem::new(device, FsOptions::new()).map_err(|_| DiskError::Mount)?;
    let root = fs.root_dir();
    let opened = if dir.is_empty() { root } else { root.open_dir(dir).map_err(|_| DiskError::NotFound)? };

    let mut n = 0;
    if !dir.is_empty() && !out.is_empty() {
        out[0] = Entry::up();
        n = 1;
    }
    for item in opened.iter() {
        if n == out.len() {
            break;
        }
        let item = item.map_err(|_| DiskError::Read)?;
        let short = item.short_file_name_as_bytes();
        // (`.` and `..` are there as real entries; so are macOS's `._` files, not always hidden)
        if short.first() == Some(&b'.')
            || item.attributes().intersects(FileAttributes::HIDDEN | FileAttributes::SYSTEM | FileAttributes::VOLUME_ID)
            || short.len() > SHORT_BYTES
        {
            continue;
        }
        let mut e = Entry::EMPTY;
        e.short[..short.len()].copy_from_slice(short);
        e.short_len = short.len() as u8;
        e.is_dir = item.is_dir();
        e.size = item.len() as u32;
        match item.long_file_name_as_ucs2_units() {
            Some(units) => {
                if units.first() == Some(&(b'.' as u16)) {
                    continue;
                }
                let mut ascii = [0u8; 5];
                let tail = units.len().saturating_sub(4);
                for (a, u) in ascii.iter_mut().zip(&units[tail..]) {
                    *a = *u as u8;
                }
                if !e.is_dir && !ascii[..4].eq_ignore_ascii_case(b".wav") {
                    continue;
                }
                e.set_name(units.iter().copied());
            }
            None => {
                if !e.is_dir && !is_wav(short) {
                    continue;
                }
                e.set_name(short.iter().map(|b| *b as u16));
            }
        }
        out[n] = e;
        n += 1;
    }
    out[..n].sort_unstable_by(Entry::sorts_before);
    Ok(n)
}

/// A file by its path in short names, which is all a patch keeps, with the name it shows by.
pub fn find<M: UsbMsc>(disk: &mut M, buffers: &Buffers, path: &str) -> Result<Entry, DiskError> {
    let device = UsbMscBlockDevice::new(disk, buffers.windows).map_err(|_| DiskError::Mount)?;
    let fs = FileSystem::new(device, FsOptions::new()).map_err(|_| DiskError::Mount)?;
    let (dir, file) = path.rsplit_once('/').unwrap_or(("", path));
    let root = fs.root_dir();
    let opened = if dir.is_empty() { root } else { root.open_dir(dir).map_err(|_| DiskError::NotFound)? };
    for item in opened.iter() {
        let item = item.map_err(|_| DiskError::Read)?;
        let short = item.short_file_name_as_bytes();
        if !short.eq_ignore_ascii_case(file.as_bytes()) || short.len() > SHORT_BYTES {
            continue;
        }
        let mut e = Entry::EMPTY;
        e.short[..short.len()].copy_from_slice(short);
        e.short_len = short.len() as u8;
        e.is_dir = item.is_dir();
        e.size = item.len() as u32;
        match item.long_file_name_as_ucs2_units() {
            Some(units) => e.set_name(units.iter().copied()),
            None => e.set_name(short.iter().map(|b| *b as u16)),
        }
        return Ok(e);
    }
    Err(DiskError::NotFound)
}

/// A file's size, and its first bytes into `head`: enough to see what shape a table is.
pub fn peek<M: UsbMsc>(disk: &mut M, buffers: &Buffers, path: &str, head: &mut [u8]) -> Result<(usize, usize), DiskError> {
    let device = UsbMscBlockDevice::new(disk, buffers.windows).map_err(|_| DiskError::Mount)?;
    let fs = FileSystem::new(device, FsOptions::new()).map_err(|_| DiskError::Mount)?;
    let mut file = fs.root_dir().open_file(path).map_err(|_| DiskError::NotFound)?;
    let size = file.size().unwrap_or(0) as usize;
    let mut got = 0;
    while got < head.len() {
        let n = file.read(&mut head[got..]).map_err(|_| DiskError::Read)?;
        if n == 0 {
            break;
        }
        got += n;
    }
    Ok((size, got))
}

/// Reads a whole file to the start of `to`, by DMA straight into it. Returns its size.
pub fn read_file<M: UsbMsc>(disk: &mut M, buffers: &Buffers, path: &str, to: &'static DmaBuf,
                            chunk_blocks: u32) -> Result<usize, DiskError> {
    let chunk = chunk_blocks as usize * BLOCK_BYTES;
    let (mut stream, size) = {
        let device = UsbMscBlockDevice::new(&mut *disk, buffers.windows).map_err(|_| DiskError::Mount)?;
        let fs = FileSystem::new(device, FsOptions::new()).map_err(|_| DiskError::Mount)?;
        let file = fs.root_dir().open_file(path).map_err(|_| DiskError::NotFound)?;
        let size = file.size().unwrap_or(0) as usize;
        if size == 0 {
            return Err(DiskError::Empty);
        }
        let ring = size.div_ceil(chunk) * chunk;
        if ring > to.len() {
            return Err(DiskError::TooLarge);
        }
        let ring = to.slice(0, ring);
        // (the last file's lines mustn't be written back over this one, or read instead of it)
        ring.invalidate();
        let config = StreamConfig { max_chunk_blocks: chunk_blocks, ring, fat_cache: buffers.fat_cache };
        (FatStream::open(&file, &config).map_err(|_| DiskError::Read)?, size)
    };
    stream.prefill(disk).map_err(|_| DiskError::Read)?;
    Ok(size)
}

/// A disk image in memory, as a drive: what the simulation and the host tests read instead of USB.
pub struct ImageDisk {
    image: &'static [u8],
    capacity: u32,
    done: u32,
}

impl ImageDisk {
    /// `capacity` is in blocks, and may be more than the image holds: past its end reads as zeros.
    /// A FAT32 volume has to claim tens of megabytes, while its files can all sit near the start.
    pub fn new(image: &'static [u8], capacity: u32) -> ImageDisk {
        ImageDisk { image, capacity, done: 0 }
    }
}

impl UsbMsc for ImageDisk {
    fn status(&self) -> UsbMscStatus {
        UsbMscStatus { connected: true, ready: true, busy: false, fifo_full: false, fifo_empty: true, error: false }
    }

    fn capacity(&self) -> u32 {
        self.capacity
    }

    fn block_size(&self) -> u32 {
        BLOCK_BYTES as u32
    }

    fn plug_events(&self) -> u32 {
        1
    }

    fn read_blocks(&mut self, start_lba: u32, buf: &'static DmaBuf) -> Option<u32> {
        let at = (start_lba as usize * BLOCK_BYTES).min(self.image.len());
        let n = buf.len().min(self.image.len() - at);
        buf.write_from(0, &self.image[at..at + n]);
        for k in n..buf.len() {
            buf.write_byte(k, 0);
        }
        // (what a real drive's DMA leaves is in memory, not the cache)
        buf.clean();
        self.done = self.done.wrapping_add(1);
        Some(self.done)
    }

    fn write_blocks(&mut self, _start_lba: u32, _buf: &'static DmaBuf) -> Option<u32> {
        self.done = self.done.wrapping_add(1);
        Some(self.done)
    }

    fn psram_base(&self) -> u32 {
        0
    }

    fn completed_count(&self) -> u32 {
        self.done
    }

    fn error_count(&self) -> u32 {
        0
    }
}

/// Builds FAT32 images, for the tests and (written out by `make_the_simulations_disk`) the simulation.
#[cfg(test)]
pub mod image {
    use std::string::String;
    use std::vec;
    use std::vec::Vec;

    const SECTOR: usize = 512;
    const RESERVED: u32 = 32;
    const FATS: u32 = 2;
    /// FAT32 needs at least 65525 clusters. The image only holds the ones in use.
    pub const CLUSTERS: u32 = 66000;
    const ROOT: u32 = 2;
    const DIR_CLUSTERS: u32 = 8;

    pub struct Builder {
        start: u32,
        fat_sectors: u32,
        fat: Vec<u32>,
        data: Vec<u8>,
        next_cluster: u32,
        dirs: Vec<(u32, usize)>,
    }

    impl Builder {
        /// `partition`: put an MBR in front, as most drives have.
        pub fn new(partition: bool) -> Builder {
            let fat_sectors = ((CLUSTERS + 2) * 4).div_ceil(SECTOR as u32);
            let mut b = Builder {
                start: if partition { 63 } else { 0 },
                fat_sectors,
                fat: vec![0; (CLUSTERS + 2) as usize],
                data: Vec::new(),
                next_cluster: ROOT,
                dirs: Vec::new(),
            };
            b.fat[0] = 0x0FFF_FFF8;
            b.fat[1] = 0x0FFF_FFFF;
            let root = b.alloc_dir();
            assert_eq!(root, ROOT);
            b
        }

        fn alloc_dir(&mut self) -> u32 {
            let first = self.next_cluster;
            for k in 0..DIR_CLUSTERS {
                self.fat[(first + k) as usize] = if k + 1 == DIR_CLUSTERS { 0x0FFF_FFFF } else { first + k + 1 };
            }
            self.next_cluster += DIR_CLUSTERS;
            self.ensure(self.next_cluster);
            self.dirs.push((first, 0));
            first
        }

        fn ensure(&mut self, clusters_end: u32) {
            let want = (clusters_end - ROOT) as usize * SECTOR;
            if self.data.len() < want {
                self.data.resize(want, 0);
            }
        }

        fn entry(&mut self, dir: u32, bytes: &[u8; 32]) {
            let i = self.dirs.iter().position(|d| d.0 == dir).unwrap();
            let at = (dir - ROOT) as usize * SECTOR + self.dirs[i].1;
            assert!(self.dirs[i].1 + 32 <= DIR_CLUSTERS as usize * SECTOR, "directory full");
            self.data[at..at + 32].copy_from_slice(bytes);
            self.dirs[i].1 += 32;
        }

        fn name_entries(&mut self, dir: u32, long: &str, short: &[u8; 11], attr: u8, first: u32, size: u32) {
            let plain = long.len() <= 12
                && long.chars().all(|c| c.is_ascii_uppercase() || c.is_ascii_digit() || c == '.');
            if !plain {
                let sum = short.iter().fold(0u8, |s, c| (s >> 1 | s << 7).wrapping_add(*c));
                let units: Vec<u16> = long.encode_utf16().collect();
                let parts = units.len().div_ceil(13);
                for p in (0..parts).rev() {
                    let mut e = [0u8; 32];
                    e[0] = (p + 1) as u8 | if p + 1 == parts { 0x40 } else { 0 };
                    e[11] = 0x0F;
                    e[13] = sum;
                    let slots = [1, 3, 5, 7, 9, 14, 16, 18, 20, 22, 24, 28, 30];
                    for (k, s) in slots.iter().enumerate() {
                        let idx = p * 13 + k;
                        let u = match idx.cmp(&units.len()) {
                            core::cmp::Ordering::Less => units[idx],
                            core::cmp::Ordering::Equal => 0,
                            core::cmp::Ordering::Greater => 0xFFFF,
                        };
                        e[*s..*s + 2].copy_from_slice(&u.to_le_bytes());
                    }
                    self.entry(dir, &e);
                }
            }
            let mut e = [0u8; 32];
            e[..11].copy_from_slice(short);
            e[11] = attr;
            e[20..22].copy_from_slice(&((first >> 16) as u16).to_le_bytes());
            e[26..28].copy_from_slice(&(first as u16).to_le_bytes());
            e[28..32].copy_from_slice(&size.to_le_bytes());
            self.entry(dir, &e);
        }

        fn short_name(&self, long: &str, dir_seq: usize) -> [u8; 11] {
            let upper: String = long.to_ascii_uppercase();
            let (base, ext) = upper.rsplit_once('.').unwrap_or((&upper, ""));
            let clean = |s: &str| -> String { s.chars().filter(|c| c.is_ascii_alphanumeric()).collect() };
            let (base, ext) = (clean(base), clean(ext));
            let mut out = [b' '; 11];
            if base.len() <= 8 && upper.len() <= 12 && long == upper {
                out[..base.len()].copy_from_slice(base.as_bytes());
            } else {
                let tail = std::format!("~{}", dir_seq + 1);
                let keep = base.len().min(8 - tail.len());
                out[..keep].copy_from_slice(&base.as_bytes()[..keep]);
                out[keep..keep + tail.len()].copy_from_slice(tail.as_bytes());
            }
            let e = ext.len().min(3);
            out[8..8 + e].copy_from_slice(&ext.as_bytes()[..e]);
            out
        }

        pub const fn root(&self) -> u32 {
            ROOT
        }

        pub fn add_dir(&mut self, parent: u32, name: &str) -> u32 {
            let seq = self.dirs.iter().find(|d| d.0 == parent).unwrap().1;
            let short = self.short_name(name, seq);
            let first = self.alloc_dir();
            self.name_entries(parent, name, &short, 0x10, first, 0);
            first
        }

        /// `scattered`: every other cluster, so reading has to follow the chain.
        pub fn add_file(&mut self, dir: u32, name: &str, bytes: &[u8], scattered: bool, attr: u8) {
            let seq = self.dirs.iter().find(|d| d.0 == dir).unwrap().1;
            let short = self.short_name(name, seq);
            let n = bytes.len().div_ceil(SECTOR) as u32;
            let gap = if scattered { 2 } else { 1 };
            let first = self.next_cluster;
            for k in 0..n {
                let c = first + k * gap;
                self.fat[c as usize] = if k + 1 == n { 0x0FFF_FFFF } else { c + gap };
            }
            self.next_cluster = first + n.max(1) * gap;
            self.ensure(self.next_cluster);
            for (k, chunk) in bytes.chunks(SECTOR).enumerate() {
                let at = (first + k as u32 * gap - ROOT) as usize * SECTOR;
                self.data[at..at + chunk.len()].copy_from_slice(chunk);
            }
            self.name_entries(dir, name, &short, attr, first, bytes.len() as u32);
        }

        pub fn capacity(&self) -> u32 {
            self.start + RESERVED + FATS * self.fat_sectors + CLUSTERS
        }

        pub fn build(&self) -> Vec<u8> {
            let volume_sectors = RESERVED + FATS * self.fat_sectors + CLUSTERS;
            let data_start = (RESERVED + FATS * self.fat_sectors) as usize * SECTOR;
            let start = self.start as usize * SECTOR;
            let mut out = vec![0u8; start + data_start + self.data.len()];

            if self.start != 0 {
                let e = 446;
                out[e + 4] = 0x0C;
                out[e + 8..e + 12].copy_from_slice(&self.start.to_le_bytes());
                out[e + 12..e + 16].copy_from_slice(&volume_sectors.to_le_bytes());
                out[510] = 0x55;
                out[511] = 0xAA;
            }

            let v = &mut out[start..];
            v[0..3].copy_from_slice(&[0xEB, 0x58, 0x90]);
            v[3..11].copy_from_slice(b"FAIRWAVE");
            v[11..13].copy_from_slice(&(SECTOR as u16).to_le_bytes());
            v[13] = 1;
            v[14..16].copy_from_slice(&(RESERVED as u16).to_le_bytes());
            v[16] = FATS as u8;
            v[21] = 0xF8;
            v[24..26].copy_from_slice(&63u16.to_le_bytes());
            v[26..28].copy_from_slice(&255u16.to_le_bytes());
            v[28..32].copy_from_slice(&self.start.to_le_bytes());
            v[32..36].copy_from_slice(&volume_sectors.to_le_bytes());
            v[36..40].copy_from_slice(&self.fat_sectors.to_le_bytes());
            v[44..48].copy_from_slice(&ROOT.to_le_bytes());
            v[48..50].copy_from_slice(&1u16.to_le_bytes());
            v[50..52].copy_from_slice(&6u16.to_le_bytes());
            v[64] = 0x80;
            v[66] = 0x29;
            v[67..71].copy_from_slice(&0x1234_5678u32.to_le_bytes());
            v[71..82].copy_from_slice(b"FAIRWAVE   ");
            v[82..90].copy_from_slice(b"FAT32   ");
            v[510] = 0x55;
            v[511] = 0xAA;
            let info = SECTOR;
            v[info..info + 4].copy_from_slice(&0x4161_5252u32.to_le_bytes());
            v[info + 484..info + 488].copy_from_slice(&0x6141_7272u32.to_le_bytes());
            v[info + 488..info + 496].copy_from_slice(&[0xFF; 8]);
            v[info + 508..info + 512].copy_from_slice(&0xAA55_0000u32.to_le_bytes());

            let fat_bytes: Vec<u8> = self.fat.iter().flat_map(|e| e.to_le_bytes()).collect();
            for f in 0..FATS as usize {
                let at = RESERVED as usize * SECTOR + f * self.fat_sectors as usize * SECTOR;
                v[at..at + fat_bytes.len()].copy_from_slice(&fat_bytes);
            }
            v[data_start..data_start + self.data.len()].copy_from_slice(&self.data);
            out
        }
    }
}

#[cfg(test)]
mod tests {
    use super::image::Builder;
    use super::*;
    use guh_usb_msc::partition::find_first_fat32_lba;
    use guh_usb_msc::usb_msc::PartitionView;
    use std::vec::Vec;

    fn aligned(bytes: usize) -> &'static DmaBuf {
        let layout = std::alloc::Layout::from_size_align(bytes, 64).unwrap();
        unsafe { DmaBuf::from_raw_parts(std::alloc::alloc_zeroed(layout), bytes) }
    }

    const CHUNK_BLOCKS: u32 = 64;
    const CHUNK: usize = CHUNK_BLOCKS as usize * BLOCK_BYTES;

    fn buffers() -> Buffers {
        Buffers { windows: [aligned(CHUNK), aligned(CHUNK)], fat_cache: aligned(CHUNK) }
    }

    /// Mounted as the firmware mounts a drive.
    fn mounted(b: &Builder) -> (PartitionView<ImageDisk>, Buffers) {
        let image: &'static [u8] = std::vec::Vec::leak(b.build());
        let mut disk = ImageDisk::new(image, b.capacity());
        let buffers = buffers();
        let lba = find_first_fat32_lba(&mut disk, buffers.windows[0]);
        (PartitionView::new(disk, lba), buffers)
    }

    fn bytes(n: usize, seed: u8) -> Vec<u8> {
        (0..n).map(|i| (i as u32).wrapping_mul(31).wrapping_add(seed as u32) as u8).collect()
    }

    fn a_drive(partition: bool) -> Builder {
        let mut b = Builder::new(partition);
        let root = b.root();
        b.add_file(root, "zebra pad.wav", &bytes(100, 1), false, 0);
        b.add_file(root, "BASIC.WAV", &bytes(700, 2), false, 0);
        b.add_file(root, "notes.txt", &bytes(50, 3), false, 0);
        b.add_file(root, "Aardvark Long Name Wavetable Number One.wav", &bytes(100, 4), false, 0);
        b.add_file(root, "._BASIC.WAV", &bytes(10, 5), false, 0);
        b.add_file(root, "SECRET.WAV", &bytes(10, 6), false, 0x02);
        let serum = b.add_dir(root, "Serum Tables");
        b.add_file(serum, "Inside.WAV", &bytes(3000, 7), true, 0);
        let _ = b.add_dir(root, "ALPHA");
        b
    }

    fn names(out: &[Entry]) -> Vec<&str> {
        out.iter().map(|e| e.name()).collect()
    }

    /// A WAV of `frames` frames of `len`, its samples a rising ramp whose slope is the frame's: easy to
    /// recognise anywhere it turns up.
    fn a_table_file(frames: usize, len: usize, format: &str, channels: u16, clm: bool) -> Vec<u8> {
        let mut data = Vec::new();
        for f in 0..frames {
            for i in 0..len {
                let v = ((i as i64 * (f as i64 + 1) * 65536 / len as i64) % 65536 - 32768) as i32 * 7 / 8;
                for _ in 0..channels {
                    match format {
                        "pcm16" => data.extend_from_slice(&(v as i16).to_le_bytes()),
                        "pcm24" => data.extend_from_slice(&(v << 8).to_le_bytes()[..3]),
                        _ => data.extend_from_slice(&(v as f32 / 32768.0).to_le_bytes()),
                    }
                }
            }
        }
        let (tag, bits): (u16, u16) = match format {
            "pcm16" => (1, 16),
            "pcm24" => (1, 24),
            _ => (3, 32),
        };
        let block = channels * bits / 8;
        let mut fmt = Vec::new();
        fmt.extend_from_slice(&tag.to_le_bytes());
        fmt.extend_from_slice(&channels.to_le_bytes());
        fmt.extend_from_slice(&44100u32.to_le_bytes());
        fmt.extend_from_slice(&(44100 * block as u32).to_le_bytes());
        fmt.extend_from_slice(&block.to_le_bytes());
        fmt.extend_from_slice(&bits.to_le_bytes());
        let mut body = Vec::new();
        let mut chunk = |id: &[u8; 4], b: &[u8]| {
            body.extend_from_slice(id);
            body.extend_from_slice(&(b.len() as u32).to_le_bytes());
            body.extend_from_slice(b);
            if b.len() & 1 == 1 {
                body.push(0);
            }
        };
        chunk(b"fmt ", &fmt);
        if clm {
            chunk(b"clm ", std::format!("<!>{len} 00000000 wavetable").as_bytes());
        }
        chunk(b"data", &data);
        let mut out = Vec::new();
        out.extend_from_slice(b"RIFF");
        out.extend_from_slice(&(body.len() as u32 + 4).to_le_bytes());
        out.extend_from_slice(b"WAVE");
        out.extend_from_slice(&body);
        out
    }

    /// `FAIRWAVE_DISK_OUT=disk.img cargo test make_the_simulations_disk`: what `load=` puts in PSRAM.
    #[test]
    fn make_the_simulations_disk() {
        let mut b = Builder::new(true);
        let root = b.root();
        let serum = b.add_dir(root, "Serum Tables");
        b.add_file(serum, "Basic Shapes.wav", &a_table_file(8, 2048, "pcm16", 1, true), true, 0);
        b.add_file(root, "Old Machine 256.WAV", &a_table_file(16, 256, "pcm24", 2, false), false, 0);
        b.add_file(root, "float pad.wav", &a_table_file(4, 1024, "float", 1, false), false, 0);
        b.add_file(root, "broken.wav", &bytes(3000, 3), false, 0);
        b.add_file(root, "readme.txt", &bytes(300, 4), false, 0);
        let image = b.build();
        assert!(image.len() < 0x30_0000, "{} bytes", image.len());
        assert!(b.capacity() < 70000, "{} blocks", b.capacity());
        let image: &'static [u8] = std::vec::Vec::leak(image);
        // Whatever else, it has to read.
        let mut disk = ImageDisk::new(image, 70000);
        let buffers = buffers();
        let lba = find_first_fat32_lba(&mut disk, buffers.windows[0]);
        let mut view = PartitionView::new(disk, lba);
        let mut out = [Entry::EMPTY; 16];
        let n = list(&mut view, &buffers, "", &mut out).unwrap();
        assert_eq!(names(&out[..n]), ["Serum Tables", "broken.wav", "float pad.wav", "Old Machine 256.WAV"]);
        let mut head = [0u8; 1024];
        let (size, got) = peek(&mut view, &buffers, out[3].short(), &mut head).unwrap();
        let w = crate::wav::parse_head(&head[..got], size).unwrap();
        assert_eq!(w.samples(), 16 * 256);
        if let Ok(path) = std::env::var("FAIRWAVE_DISK_OUT") {
            std::fs::write(path, image).unwrap();
        }
    }

    #[test]
    fn a_directory_lists_folders_first_then_wavs_sorted_and_nothing_else() {
        for partition in [true, false] {
            let b = a_drive(partition);
            let (mut disk, buffers) = mounted(&b);
            let mut out = [Entry::EMPTY; 16];
            let n = list(&mut disk, &buffers, "", &mut out).unwrap();
            assert_eq!(
                names(&out[..n]),
                ["ALPHA", "Serum Tables", "Aardvark Long Name Wavetabl", "BASIC.WAV", "zebra pad.wav"],
                "partitioned: {partition}"
            );
            assert!(out[0].is_dir && out[1].is_dir && !out[2].is_dir);
            assert_eq!(out[3].size, 700);
        }
    }

    #[test]
    fn a_long_name_has_a_short_one_to_open_it_by() {
        let b = a_drive(true);
        let (mut disk, buffers) = mounted(&b);
        let mut out = [Entry::EMPTY; 16];
        let n = list(&mut disk, &buffers, "", &mut out).unwrap();
        let long = out[..n].iter().find(|e| e.name().starts_with("Aardvark")).unwrap();
        assert!(long.short().len() <= SHORT_BYTES && long.short().ends_with(".WAV"), "{}", long.short());
        let mut head = [0u8; 16];
        let (size, got) = peek(&mut disk, &buffers, long.short(), &mut head).unwrap();
        assert_eq!((size, got), (100, 16));
        assert_eq!(head.to_vec(), bytes(16, 4));
    }

    #[test]
    fn a_short_path_finds_the_name_a_file_shows_by() {
        let b = a_drive(true);
        let (mut disk, buffers) = mounted(&b);
        let mut out = [Entry::EMPTY; 16];
        let n = list(&mut disk, &buffers, "", &mut out).unwrap();
        let long = out[..n].iter().find(|e| e.name().starts_with("Aardvark")).unwrap();
        let found = find(&mut disk, &buffers, long.short()).unwrap();
        assert_eq!(found, *long);
        let folder = out[..n].iter().find(|e| e.name() == "Serum Tables").unwrap().short();
        let mut inner = [Entry::EMPTY; 16];
        let k = list(&mut disk, &buffers, folder, &mut inner).unwrap();
        let file = inner[..k].iter().find(|e| !e.is_dir).unwrap();
        let mut path: heapless::String<40> = heapless::String::new();
        path.push_str(folder).unwrap();
        path.push('/').unwrap();
        path.push_str(file.short()).unwrap();
        assert_eq!(find(&mut disk, &buffers, path.as_str()).unwrap().name(), "Inside.WAV");
        assert_eq!(find(&mut disk, &buffers, "NOPE.WAV"), Err(DiskError::NotFound));
    }

    #[test]
    fn a_folder_lists_the_way_back_first() {
        let b = a_drive(true);
        let (mut disk, buffers) = mounted(&b);
        let mut out = [Entry::EMPTY; 16];
        let n = list(&mut disk, &buffers, "", &mut out).unwrap();
        let folder = out[..n].iter().find(|e| e.name() == "Serum Tables").unwrap().short();
        let mut inner = [Entry::EMPTY; 16];
        let k = list(&mut disk, &buffers, folder, &mut inner).unwrap();
        assert_eq!(names(&inner[..k]), ["..", "Inside.WAV"]);
        assert!(inner[0].is_up() && inner[0].is_dir);
    }

    #[test]
    fn a_whole_file_arrives_exactly_even_in_scattered_clusters() {
        let mut b = Builder::new(true);
        let root = b.root();
        let whole = bytes(CHUNK * 2 + 1234, 9);
        b.add_file(root, "IN_ORDER.WAV", &whole, false, 0);
        b.add_file(root, "SCATTER.WAV", &whole, true, 0);
        let (mut disk, buffers) = mounted(&b);
        for name in ["IN_ORDER.WAV", "SCATTER.WAV"] {
            let to = aligned(CHUNK * 4);
            let size = read_file(&mut disk, &buffers, name, to, CHUNK_BLOCKS).unwrap();
            assert_eq!(size, whole.len());
            let mut got = std::vec![0u8; size];
            to.read_into(0, &mut got);
            assert_eq!(got, whole, "{name}");
        }
    }

    #[test]
    fn a_file_in_a_folder_is_reached_by_its_path() {
        let b = a_drive(true);
        let (mut disk, buffers) = mounted(&b);
        let mut out = [Entry::EMPTY; 16];
        let n = list(&mut disk, &buffers, "", &mut out).unwrap();
        let folder = out[..n].iter().find(|e| e.name() == "Serum Tables").unwrap().short();
        let mut inner = [Entry::EMPTY; 16];
        let k = list(&mut disk, &buffers, folder, &mut inner).unwrap();
        let file = inner[..k].iter().find(|e| !e.is_dir).unwrap().short();
        let path = std::format!("{folder}/{file}");
        let to = aligned(CHUNK);
        let size = read_file(&mut disk, &buffers, &path, to, CHUNK_BLOCKS).unwrap();
        assert_eq!(size, 3000);
        let mut got = std::vec![0u8; size];
        to.read_into(0, &mut got);
        assert_eq!(got, bytes(3000, 7));
    }

    #[test]
    fn the_failures_say_what_went_wrong() {
        let mut b = Builder::new(true);
        let root = b.root();
        b.add_file(root, "BIG.WAV", &bytes(CHUNK * 2, 1), false, 0);
        let (mut disk, buffers) = mounted(&b);
        let to = aligned(CHUNK);
        assert_eq!(read_file(&mut disk, &buffers, "BIG.WAV", to, CHUNK_BLOCKS), Err(DiskError::TooLarge));
        assert_eq!(read_file(&mut disk, &buffers, "NONE.WAV", to, CHUNK_BLOCKS), Err(DiskError::NotFound));
        let mut out = [Entry::EMPTY; 4];
        assert_eq!(list(&mut disk, &buffers, "NOPE", &mut out), Err(DiskError::NotFound));
    }

    #[test]
    fn a_drive_with_no_file_system_says_so() {
        let image: &'static [u8] = std::vec::Vec::leak(std::vec![0u8; 8192]);
        let mut disk = ImageDisk::new(image, 16);
        let mut out = [Entry::EMPTY; 4];
        assert_eq!(list(&mut disk, &buffers(), "", &mut out), Err(DiskError::Mount));
    }

    #[test]
    fn a_full_list_stops_rather_than_overruns() {
        let b = a_drive(true);
        let (mut disk, buffers) = mounted(&b);
        let mut out = [Entry::EMPTY; 2];
        assert_eq!(list(&mut disk, &buffers, "", &mut out).unwrap(), 2);
    }

    #[test]
    fn names_the_fonts_cant_show_become_question_marks() {
        let mut b = Builder::new(true);
        let root = b.root();
        b.add_file(root, "Gr\u{fc}n.wav", &bytes(10, 1), false, 0);
        let (mut disk, buffers) = mounted(&b);
        let mut out = [Entry::EMPTY; 2];
        let n = list(&mut disk, &buffers, "", &mut out).unwrap();
        assert_eq!(names(&out[..n]), ["Gr?n.wav"]);
    }
}
