//! A little randomness for the firmware, which has no source of its own: words gathered from
//! whatever varies from one start to the next (the input's noise, PSRAM's contents at power-up,
//! a word carried from the last start), hashed together.

/// Words gathered into a hash.
#[derive(Clone, Copy, Debug)]
pub struct Seed(u32);

impl Default for Seed {
    fn default() -> Seed {
        Seed(0x811C_9DC5)
    }
}

impl Seed {
    pub fn add(&mut self, w: u32) {
        self.0 = (self.0 ^ w).wrapping_mul(0x0100_0193).rotate_left(13);
    }

    /// The hash of everything added: each of its bits depends on every bit added.
    pub fn finish(&self) -> u32 {
        fmix(self.0)
    }
}

/// MurmurHash3's finaliser: each input bit flips about half of the output's.
pub fn fmix(mut h: u32) -> u32 {
    h ^= h >> 16;
    h = h.wrapping_mul(0x85EB_CA6B);
    h ^= h >> 13;
    h = h.wrapping_mul(0xC2B2_AE35);
    h ^ (h >> 16)
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn a_one_bit_difference_anywhere_changes_about_half_the_hash() {
        let words = [0u32, 7, 0xFFFF_0000, 12345, 0, 0, 1, 99];
        let base = {
            let mut s = Seed::default();
            words.iter().for_each(|w| s.add(*w));
            s.finish()
        };
        let mut total = 0;
        let mut n = 0;
        for i in 0..words.len() {
            for bit in [0, 5, 17, 31] {
                let mut s = Seed::default();
                for (j, w) in words.iter().enumerate() {
                    s.add(if j == i { w ^ (1 << bit) } else { *w });
                }
                let flipped = (s.finish() ^ base).count_ones();
                assert!(flipped >= 4, "word {i} bit {bit}: {flipped} bits");
                total += flipped;
                n += 1;
            }
        }
        let mean = total as f64 / n as f64;
        assert!((12.0..20.0).contains(&mean), "mean {mean}");
    }
}
