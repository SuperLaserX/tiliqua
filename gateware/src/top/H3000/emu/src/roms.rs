//! ROM sets and the bank latch decode.
//!
//! The kernel EPROM (64 KB) answers to bank latch values $E0-$E3, its first
//! 32 KB also being the fixed kernel ROM at $8000-$FFFF. The second EPROM
//! socket (32 KB, v1.53 only) is $C0-$C1. Expansion ROMs are $s0-$sF for
//! socket s = 0..3 (16 KB bank b of the chip at $sb). The kernel enumerates
//! banks from the tables at $888D (v1.53) / $FF52 (H3500).

pub const BANK_SIZE: usize = 0x4000;
pub const KERNEL_SIZE: usize = 0x8000;

#[derive(Clone, Copy)]
pub struct RomSet<'a> {
    /// CPU $8000-$FFFF ($8000-$83FF is hidden behind the I/O space).
    pub kernel: &'a [u8; KERNEL_SIZE],
    banks: [Option<&'a [u8; BANK_SIZE]>; 256],
}

/// Which firmware a [`RomSet`] holds.
#[derive(Clone, Copy, PartialEq, Eq, Debug)]
pub enum Firmware {
    H3000V153,
    H3500,
}

impl<'a> RomSet<'a> {
    fn empty(kernel: &'a [u8]) -> Self {
        assert!(kernel.len() >= KERNEL_SIZE);
        RomSet { kernel: kernel[..KERNEL_SIZE].try_into().unwrap(), banks: [None; 256] }
    }

    fn map_chip(&mut self, first_bank: u8, data: &'a [u8], max_banks: usize) {
        for (i, chunk) in data.chunks_exact(BANK_SIZE).take(max_banks).enumerate() {
            self.banks[first_bank as usize + i] = Some(chunk.try_into().unwrap());
        }
    }

    /// An expansion socket takes up to 256 KB (16 banks); a smaller chip
    /// ignores the upper address lines and shows repeatedly.
    fn map_socket(&mut self, socket: u8, data: &'a [u8]) {
        let n = data.len() / BANK_SIZE;
        for i in 0..16 {
            if n > 0 {
                let b = i % n;
                self.banks[((socket as usize) << 4) + i] = Some(data[b * BANK_SIZE..(b + 1) * BANK_SIZE].try_into().unwrap());
            }
        }
    }

    /// H3000 v1.53: `big` = H3000_153_BigROM.BIN (64 KB),
    /// `small` = H3000_153_SmallROM.BIN (32 KB).
    pub fn h3000_v153(big: &'a [u8], small: &'a [u8]) -> Self {
        let mut r = Self::empty(big);
        r.map_chip(0xE0, big, 4);
        r.map_chip(0xC0, small, 2);
        r
    }

    /// H3500: `rom1` = the 64 KB kernel EPROM (OPSYS 2.17), `expansion` =
    /// up to four program ROMs (128 or 256 KB; empty = no chip) in sockets
    /// 0..3. The kernel finds the program modules in whichever sockets.
    pub fn h3500(rom1: &'a [u8], expansion: &[&'a [u8]]) -> Self {
        let mut r = Self::empty(rom1);
        r.map_chip(0xE0, rom1, 4);
        for (s, chip) in expansion.iter().take(4).enumerate() {
            r.map_socket(s as u8, chip);
        }
        r
    }

    /// The 16 KB shown in the $0000-$3FFF window for a bank latch value.
    #[inline(always)]
    pub fn bank(&self, latch: u8) -> Option<&'a [u8; BANK_SIZE]> {
        self.banks[latch as usize]
    }
}

/// Packed ROM image, for delivering a ROM set as one file:
///
/// ```text
/// +0   magic "H3K1"
/// +4   u8 firmware (0 = H3000 v1.53, 1 = H3500), 3 bytes padding
/// +8   u32 LE length of each of the 6 chips that follow, in order:
///        v1.53: BigROM, SmallROM, -, -, -, -
///        H3500: kernel ROM1, then the program ROMs of sockets 0-3 (an
///               empty chip is an empty socket), -
///        the last slot of either holds the program list (see
///        [`image_program_list`])
/// +32  chip data, concatenated
/// ```
pub const IMAGE_MAGIC: [u8; 4] = *b"H3K1";

/// The six chip slots of a packed image.
fn image_chips(img: &[u8]) -> Option<[&[u8]; 6]> {
    if img.len() < 32 || img[0..4] != IMAGE_MAGIC {
        return None;
    }
    let mut chips: [&[u8]; 6] = [&[]; 6];
    let mut off = 32usize;
    for (i, chip) in chips.iter_mut().enumerate() {
        let p = 8 + 4 * i;
        let len = u32::from_le_bytes([img[p], img[p + 1], img[p + 2], img[p + 3]]) as usize;
        if off + len > img.len() {
            return None;
        }
        *chip = &img[off..off + len];
        off += len;
    }
    Some(chips)
}

/// The program list of a packed image: per program a 2-byte LE number and
/// a 16-byte space-padded name (see `browse::ProgramList`).
pub fn image_program_list(img: &[u8]) -> Option<&[u8]> {
    image_chips(img).map(|c| c[5])
}

pub fn parse_image(img: &[u8]) -> Option<(Firmware, RomSet<'_>)> {
    let chips = image_chips(img)?;
    let fw = match img[4] {
        0 => Firmware::H3000V153,
        1 => Firmware::H3500,
        _ => return None,
    };
    match fw {
        Firmware::H3000V153 => {
            if chips[0].len() != 0x10000 || chips[1].len() != 0x8000 {
                return None;
            }
            Some((fw, RomSet::h3000_v153(chips[0], chips[1])))
        }
        Firmware::H3500 => {
            if chips[0].len() != 0x10000 {
                return None;
            }
            if chips[1..5].iter().any(|c| c.len() % BANK_SIZE != 0 || c.len() > 16 * BANK_SIZE) {
                return None;
            }
            Some((fw, RomSet::h3500(chips[0], &chips[1..5])))
        }
    }
}
