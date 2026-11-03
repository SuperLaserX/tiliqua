//! WAV files as wavetables.
//!
//! Nothing about a table's shape is assumed. A file may say its frame length itself
//! (Serum's `clm ` chunk, Surge's `srge`), and if not `frame_len` guesses, says that it
//! guessed, and the user can correct it. The file's sample rate is reported but has no
//! bearing on pitch: a frame is one cycle.

/// How samples are stored.
#[derive(Clone, Copy, PartialEq, Eq, Debug)]
pub enum Format {
    Pcm8,
    Pcm16,
    Pcm24,
    Pcm32,
    Float32,
}

impl Format {
    pub const fn bytes(self) -> usize {
        match self {
            Format::Pcm8 => 1,
            Format::Pcm16 => 2,
            Format::Pcm24 => 3,
            Format::Pcm32 | Format::Float32 => 4,
        }
    }
}

#[derive(Clone, Copy, PartialEq, Eq, Debug)]
pub enum WavError {
    NotRiffWave,
    NoFormat,
    NoData,
    /// A sample format this doesn't read (the tag and bits are in the log).
    Unsupported { tag: u16, bits: u16 },
    BadChannels,
}

#[derive(Clone, Copy, PartialEq, Eq, Debug)]
pub struct Wav {
    pub format: Format,
    pub channels: u16,
    /// As the file says. Information only.
    pub sample_rate: u32,
    pub data_offset: usize,
    pub data_bytes: usize,
    /// The frame length the file states, if it states a usable one.
    pub stated_frame_len: Option<u32>,
}

impl Wav {
    /// Samples per channel.
    pub const fn samples(&self) -> usize {
        self.data_bytes / (self.format.bytes() * self.channels as usize)
    }
}

fn u16_at(b: &[u8], at: usize) -> Option<u16> {
    Some(u16::from_le_bytes([*b.get(at)?, *b.get(at + 1)?]))
}

fn u32_at(b: &[u8], at: usize) -> Option<u32> {
    Some(u32::from_le_bytes([*b.get(at)?, *b.get(at + 1)?, *b.get(at + 2)?, *b.get(at + 3)?]))
}

fn usable_frame_len(n: u32) -> Option<u32> {
    (n.is_power_of_two() && (256..=2048).contains(&n)).then_some(n)
}

/// Serum: `<!>2048 00000000 wavetable (www.xferrecords.com)`.
fn clm_frame_len(chunk: &[u8]) -> Option<u32> {
    let digits = chunk.strip_prefix(b"<!>")?;
    let mut n = 0u32;
    let mut any = false;
    for c in digits.iter().take(5) {
        if !c.is_ascii_digit() {
            break;
        }
        n = n * 10 + (*c - b'0') as u32;
        any = true;
    }
    if any { usable_frame_len(n) } else { None }
}

/// Reads a file's chunks. `file` may extend past the WAV (a window of PSRAM rounded up);
/// the RIFF length bounds what is looked at.
pub fn parse(file: &[u8]) -> Result<Wav, WavError> {
    parse_head(file, file.len())
}

/// The same from only the file's start, `size` being how long the whole of it is: enough to see
/// what shape a table is without loading it. A data chunk past `file`'s end is reported as missing.
pub fn parse_head(file: &[u8], size: usize) -> Result<Wav, WavError> {
    if file.get(0..4) != Some(b"RIFF") || file.get(8..12) != Some(b"WAVE") {
        return Err(WavError::NotRiffWave);
    }
    let riff_end = u32_at(file, 4).map_or(size, |n| (n as usize).saturating_add(8));
    let end = riff_end.min(size);

    let mut format = None;
    let mut data = None;
    let mut stated = None;

    let mut at = 12;
    while at + 8 <= end && at + 8 <= file.len() {
        let id = &file[at..at + 4];
        let size = u32_at(file, at + 4).unwrap_or(0) as usize;
        let body = at + 8;
        let body_end = body.saturating_add(size).min(end);
        match id {
            b"fmt " => format = Some(body),
            // A data chunk claiming more than the file holds is cut to what is there.
            b"data" => data = Some((body, body_end - body)),
            b"clm " => stated = stated.or(clm_frame_len(&file[body..body_end.min(file.len())])),
            b"srge" => {
                // Surge: a version, then the table's length.
                stated = stated.or(u32_at(file, body + 4).and_then(usable_frame_len));
            }
            _ => {}
        }
        // Chunks are padded to even lengths.
        at = body.saturating_add(size).saturating_add(size & 1);
    }

    let fmt = format.ok_or(WavError::NoFormat)?;
    let (data_offset, data_bytes) = data.ok_or(WavError::NoData)?;
    let mut tag = u16_at(file, fmt).ok_or(WavError::NoFormat)?;
    let channels = u16_at(file, fmt + 2).ok_or(WavError::NoFormat)?;
    let sample_rate = u32_at(file, fmt + 4).ok_or(WavError::NoFormat)?;
    let bits = u16_at(file, fmt + 14).ok_or(WavError::NoFormat)?;
    if tag == 0xFFFE {
        // WAVE_FORMAT_EXTENSIBLE: the real tag opens the subformat GUID.
        tag = u16_at(file, fmt + 24).ok_or(WavError::NoFormat)?;
    }
    let format = match (tag, bits) {
        (1, 8) => Format::Pcm8,
        (1, 16) => Format::Pcm16,
        (1, 24) => Format::Pcm24,
        (1, 32) => Format::Pcm32,
        (3, 32) => Format::Float32,
        _ => return Err(WavError::Unsupported { tag, bits }),
    };
    if channels == 0 {
        return Err(WavError::BadChannels);
    }
    Ok(Wav { format, channels, sample_rate, data_offset, data_bytes, stated_frame_len: stated })
}

/// One channel's sample as 16 bits.
fn read16(file: &[u8], at: usize, format: Format) -> i32 {
    match format {
        Format::Pcm8 => (file[at] as i32 - 128) << 8,
        Format::Pcm16 => i16::from_le_bytes([file[at], file[at + 1]]) as i32,
        // (the top 16 bits)
        Format::Pcm24 => i16::from_le_bytes([file[at + 1], file[at + 2]]) as i32,
        Format::Pcm32 => i16::from_le_bytes([file[at + 2], file[at + 3]]) as i32,
        Format::Float32 => {
            let x = f32::from_le_bytes([file[at], file[at + 1], file[at + 2], file[at + 3]]);
            // (NaN casts to 0)
            ((x.clamp(-1.0, 1.0)) * 32767.0) as i32
        }
    }
}

/// Converts to mono 16-bit, summing channels, into `out`. Returns the samples written.
pub fn convert(file: &[u8], wav: &Wav, out: &mut [i16]) -> usize {
    let channels = wav.channels as usize;
    let step = wav.format.bytes();
    let n = wav.samples().min(out.len());
    // Most tables are this, and at some megabytes the difference can be seen.
    if channels == 1 && wav.format == Format::Pcm16 {
        let from = file[wav.data_offset..].chunks_exact(2);
        for (o, b) in out[..n].iter_mut().zip(from) {
            *o = i16::from_le_bytes([b[0], b[1]]);
        }
        return n;
    }
    for (i, o) in out[..n].iter_mut().enumerate() {
        let base = wav.data_offset + i * step * channels;
        let mut sum = 0i32;
        for c in 0..channels {
            sum += read16(file, base + c * step, wav.format);
        }
        *o = (sum / channels as i32) as i16;
    }
    n
}

/// The frame length to use for a file of `samples` samples, and whether it is a guess.
///
/// A stated length wins. Otherwise the longest of 2048 to 256 that divides the samples
/// evenly: often right, but a 64 x 256 table divides by 2048 too, which is why the
/// answer is reported as a guess and the user can change it.
pub fn frame_len(wav: &Wav) -> (u32, bool) {
    if let Some(n) = wav.stated_frame_len {
        return (n, false);
    }
    let samples = wav.samples();
    for n in [2048usize, 1024, 512, 256] {
        if samples >= n && samples % n == 0 {
            return (n as u32, true);
        }
    }
    (2048, true)
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn a_files_start_is_enough_to_see_its_shape() {
        // A header, then 2048 x 8 of 16-bit samples, of which only the header is here.
        let total = 2048 * 8 * 2;
        let mut head = Vec::new();
        head.extend_from_slice(b"RIFF");
        head.extend_from_slice(&((36 + 8 + total) as u32).to_le_bytes());
        head.extend_from_slice(b"WAVE");
        chunk(&mut head, b"fmt ", &[1, 0, 1, 0, 0x44, 0xAC, 0, 0, 0x88, 0x58, 1, 0, 2, 0, 16, 0]);
        head.extend_from_slice(b"data");
        head.extend_from_slice(&(total as u32).to_le_bytes());
        let size = head.len() + total;
        let w = parse_head(&head, size).unwrap();
        assert_eq!(w.samples(), 2048 * 8);
        assert_eq!(w.sample_rate, 44100);
        assert_eq!(parse(&head).unwrap().samples(), 0, "cut to what is there, without the size");
    }

    #[test]
    fn the_quick_way_for_mono_16_bit_gives_what_the_general_one_does() {
        let mut file = Vec::new();
        let samples: Vec<i16> = (0..64).map(|i| (i * 977 - 30000) as i16).collect();
        for s in &samples {
            file.extend_from_slice(&s.to_le_bytes());
        }
        let w = Wav { format: Format::Pcm16, channels: 1, sample_rate: 44100, data_offset: 0, data_bytes: file.len(),
                      stated_frame_len: None };
        let mut out = [0i16; 64];
        assert_eq!(convert(&file, &w, &mut out), 64);
        assert_eq!(out.to_vec(), samples);
        let mut short = [0i16; 10];
        assert_eq!(convert(&file, &w, &mut short), 10);
    }

    fn chunk(out: &mut Vec<u8>, id: &[u8; 4], body: &[u8]) {
        out.extend_from_slice(id);
        out.extend_from_slice(&(body.len() as u32).to_le_bytes());
        out.extend_from_slice(body);
        if body.len() % 2 == 1 {
            out.push(0);
        }
    }

    fn fmt_body(tag: u16, channels: u16, rate: u32, bits: u16) -> Vec<u8> {
        let mut b = vec![];
        b.extend_from_slice(&tag.to_le_bytes());
        b.extend_from_slice(&channels.to_le_bytes());
        b.extend_from_slice(&rate.to_le_bytes());
        b.extend_from_slice(&(rate * channels as u32 * bits as u32 / 8).to_le_bytes());
        b.extend_from_slice(&(channels * bits / 8).to_le_bytes());
        b.extend_from_slice(&bits.to_le_bytes());
        b
    }

    fn file(chunks: &[(&[u8; 4], Vec<u8>)]) -> Vec<u8> {
        let mut body = b"WAVE".to_vec();
        for (id, data) in chunks {
            chunk(&mut body, id, data);
        }
        let mut out = b"RIFF".to_vec();
        out.extend_from_slice(&(body.len() as u32).to_le_bytes());
        out.extend_from_slice(&body);
        out
    }

    fn pcm16(samples: &[i16]) -> Vec<u8> {
        samples.iter().flat_map(|s| s.to_le_bytes()).collect()
    }

    #[test]
    fn a_plain_16_bit_file_reads_back() {
        let data = pcm16(&[1, -2, 300, -400]);
        let f = file(&[(b"fmt ", fmt_body(1, 1, 44100, 16)), (b"data", data)]);
        let w = parse(&f).unwrap();
        assert_eq!(w.format, Format::Pcm16);
        assert_eq!(w.channels, 1);
        assert_eq!(w.sample_rate, 44100);
        assert_eq!(w.samples(), 4);
        let mut out = [0i16; 4];
        assert_eq!(convert(&f, &w, &mut out), 4);
        assert_eq!(out, [1, -2, 300, -400]);
    }

    #[test]
    fn every_sample_format_converts_to_16_bits() {
        let cases: Vec<(u16, u16, Vec<u8>, Format)> = vec![
            (1, 8, vec![128, 255, 0], Format::Pcm8),
            (1, 16, pcm16(&[0, 32767, -32768]), Format::Pcm16),
            (1, 24, vec![0, 0, 0, 0xFF, 0xFF, 0x7F, 0, 0, 0x80], Format::Pcm24),
            (1, 32, vec![0, 0, 0, 0, 0xFF, 0xFF, 0xFF, 0x7F, 0, 0, 0, 0x80], Format::Pcm32),
            (3, 32, [0.0f32, 1.0, -1.0].iter().flat_map(|x| x.to_le_bytes()).collect(), Format::Float32),
        ];
        for (tag, bits, data, format) in cases {
            let f = file(&[(b"fmt ", fmt_body(tag, 1, 48000, bits)), (b"data", data)]);
            let w = parse(&f).unwrap();
            assert_eq!(w.format, format);
            let mut out = [0i16; 3];
            assert_eq!(convert(&f, &w, &mut out), 3);
            assert_eq!(out[0], 0, "{format:?} zero");
            assert!(out[1] > 32000, "{format:?} top: {}", out[1]);
            assert!(out[2] <= -32000, "{format:?} bottom: {}", out[2]);
        }
    }

    #[test]
    fn float_samples_past_full_scale_clamp() {
        let data: Vec<u8> = [2.0f32, -2.0, f32::NAN].iter().flat_map(|x| x.to_le_bytes()).collect();
        let f = file(&[(b"fmt ", fmt_body(3, 1, 48000, 32)), (b"data", data)]);
        let w = parse(&f).unwrap();
        let mut out = [9i16; 3];
        convert(&f, &w, &mut out);
        assert_eq!(out, [32767, -32767, 0]);
    }

    #[test]
    fn stereo_sums_to_mono() {
        let data = pcm16(&[100, 300, -100, -300]);
        let f = file(&[(b"fmt ", fmt_body(1, 2, 48000, 16)), (b"data", data)]);
        let w = parse(&f).unwrap();
        assert_eq!(w.samples(), 2);
        let mut out = [0i16; 2];
        convert(&f, &w, &mut out);
        assert_eq!(out, [200, -200]);
    }

    #[test]
    fn extensible_format_uses_its_subformat() {
        let mut body = fmt_body(0xFFFE, 1, 48000, 32);
        body.extend_from_slice(&22u16.to_le_bytes());
        body.extend_from_slice(&32u16.to_le_bytes());
        body.extend_from_slice(&4u32.to_le_bytes());
        body.extend_from_slice(&3u16.to_le_bytes()); // float
        body.extend_from_slice(&[0; 14]);
        let data: Vec<u8> = 0.5f32.to_le_bytes().to_vec();
        let f = file(&[(b"fmt ", body), (b"data", data)]);
        assert_eq!(parse(&f).unwrap().format, Format::Float32);
    }

    #[test]
    fn chunks_before_data_and_odd_lengths_are_stepped_over() {
        let data = pcm16(&[7, 8]);
        let f = file(&[
            (b"JUNK", vec![1, 2, 3]),                       // odd: padded
            (b"fmt ", fmt_body(1, 1, 48000, 16)),
            (b"LIST", vec![0; 10]),
            (b"data", data),
        ]);
        let w = parse(&f).unwrap();
        let mut out = [0i16; 2];
        convert(&f, &w, &mut out);
        assert_eq!(out, [7, 8]);
    }

    #[test]
    fn a_serum_chunk_states_the_frame_length() {
        let f = file(&[
            (b"fmt ", fmt_body(3, 1, 48000, 32)),
            (b"clm ", b"<!>1024 00000000 wavetable (www.xferrecords.com)".to_vec()),
            (b"data", vec![0; 4 * 2048]),
        ]);
        let w = parse(&f).unwrap();
        assert_eq!(w.stated_frame_len, Some(1024));
        assert_eq!(frame_len(&w), (1024, false));
    }

    #[test]
    fn a_surge_chunk_states_the_frame_length() {
        let mut srge = 1u32.to_le_bytes().to_vec();
        srge.extend_from_slice(&512u32.to_le_bytes());
        let f = file(&[(b"fmt ", fmt_body(1, 1, 48000, 16)), (b"srge", srge), (b"data", vec![0; 2048])]);
        assert_eq!(parse(&f).unwrap().stated_frame_len, Some(512));
    }

    #[test]
    fn a_stated_length_the_engine_cant_play_is_ignored() {
        for text in [&b"<!>100 x"[..], &b"<!>4096 x"[..], &b"<!> 2048"[..], &b"nonsense"[..]] {
            let f = file(&[(b"fmt ", fmt_body(1, 1, 48000, 16)), (b"clm ", text.to_vec()), (b"data", vec![0; 4096])]);
            assert_eq!(parse(&f).unwrap().stated_frame_len, None, "{:?}", text);
        }
    }

    #[test]
    fn the_sample_rate_plays_no_part_in_the_shape() {
        for rate in [8000, 44100, 96000] {
            let f = file(&[(b"fmt ", fmt_body(1, 1, rate, 16)), (b"data", vec![0; 2 * 2048])]);
            let w = parse(&f).unwrap();
            assert_eq!(w.sample_rate, rate);
            assert_eq!(frame_len(&w), (2048, true));
        }
    }

    #[test]
    fn with_no_statement_the_longest_divisor_is_a_guess() {
        let guess = |samples: usize| {
            let f = file(&[(b"fmt ", fmt_body(1, 1, 48000, 16)), (b"data", vec![0; samples * 2])]);
            frame_len(&parse(&f).unwrap())
        };
        assert_eq!(guess(2048 * 3), (2048, true));
        assert_eq!(guess(1024 * 3), (1024, true));
        assert_eq!(guess(512 * 3), (512, true));
        assert_eq!(guess(256 * 3), (256, true));
        assert_eq!(guess(1000), (2048, true), "nothing divides");
    }

    #[test]
    fn nothing_bad_happens_on_bad_files() {
        assert_eq!(parse(b""), Err(WavError::NotRiffWave));
        assert_eq!(parse(b"RIFF\0\0\0\0JUNK"), Err(WavError::NotRiffWave));
        assert_eq!(parse(&file(&[])), Err(WavError::NoFormat));
        assert_eq!(parse(&file(&[(b"fmt ", fmt_body(1, 1, 48000, 16))])), Err(WavError::NoData));
        assert!(matches!(
            parse(&file(&[(b"fmt ", fmt_body(85, 1, 48000, 16)), (b"data", vec![0; 4])])),
            Err(WavError::Unsupported { tag: 85, bits: 16 })
        ));
        assert_eq!(parse(&file(&[(b"fmt ", fmt_body(1, 0, 48000, 16)), (b"data", vec![0; 4])])),
                   Err(WavError::BadChannels));
    }

    #[test]
    fn a_data_chunk_claiming_too_much_is_cut_to_the_file() {
        let mut f = file(&[(b"fmt ", fmt_body(1, 1, 48000, 16)), (b"data", pcm16(&[1, 2]))]);
        let at = f.windows(4).position(|w| w == b"data").unwrap();
        f[at + 4..at + 8].copy_from_slice(&1_000_000u32.to_le_bytes());
        let w = parse(&f).unwrap();
        assert_eq!(w.samples(), 2);
    }

    #[test]
    fn a_chunk_size_that_overflows_doesnt_hang_or_panic() {
        let mut f = file(&[(b"LIST", vec![0; 4]), (b"fmt ", fmt_body(1, 1, 48000, 16)), (b"data", vec![0; 2])]);
        let at = f.windows(4).position(|w| w == b"LIST").unwrap();
        f[at + 4..at + 8].copy_from_slice(&u32::MAX.to_le_bytes());
        assert_eq!(parse(&f), Err(WavError::NoFormat));
    }

    #[test]
    fn the_window_may_be_larger_than_the_file() {
        // The bootloader rounds a file up to a FAT cluster: trailing junk isn't chunks.
        let mut f = file(&[(b"fmt ", fmt_body(1, 1, 48000, 16)), (b"data", pcm16(&[5, 6]))]);
        f.extend_from_slice(&[0xAA; 500]);
        assert_eq!(parse(&f).unwrap().samples(), 2);
    }
}
