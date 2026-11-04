//! The Browser screen's logic, and the tables resident in PSRAM. No drawing or drive here.
//!
//! Turning walks a directory and a click opens what is highlighted: a folder lists, a file loads
//! and plays straight away on the oscillator showing, as a preview. A preview has to be kept: going
//! back puts the oscillator on the table it had and gives the memory back.

use core::fmt::Write;

use heapless::String;

use crate::nav::Event;
use crate::patch::{Layer, N_LAYERS};
use crate::store::{TableFile, N_TABLES, PATH_BYTES};
use crate::table::{Pool, Table};
use crate::wav::{Format, Wav};

/// The most tables there can be, built in and loaded together.
pub const MAX_TABLES: usize = N_TABLES;

/// A setting of the preview.
#[derive(Clone, Copy, PartialEq, Eq, Debug)]
pub enum PreviewRow {
    Osc,
    Frame,
    Keep,
    Back,
}

impl PreviewRow {
    pub const ALL: [PreviewRow; 4] = [PreviewRow::Osc, PreviewRow::Frame, PreviewRow::Keep, PreviewRow::Back];

    pub const fn name(self) -> &'static str {
        match self {
            PreviewRow::Osc => "OSC",
            PreviewRow::Frame => "FRAME",
            PreviewRow::Keep => "KEEP",
            PreviewRow::Back => "BACK",
        }
    }
}

/// What the browser wants done.
#[derive(Clone, Copy, PartialEq, Eq, Debug)]
pub enum BrowserAction {
    /// Open the row: a folder, or a file to load.
    Open(usize),
    /// Play the preview on the other oscillator, or read it with another frame length.
    Osc(i32),
    Frame(i32),
    Keep,
    Discard,
}

/// Where the encoder is on the Browser screen.
#[derive(Clone, Copy, PartialEq, Eq, Debug, Default)]
pub struct BrowserCursor {
    /// The row highlighted, and how many there are.
    pub at: usize,
    pub rows: usize,
    /// In a preview: which of its settings, and whether it is being edited.
    pub preview: Option<usize>,
    pub editing: bool,
}

impl BrowserCursor {
    pub fn event(&mut self, event: Event) -> Option<BrowserAction> {
        match (self.preview, event) {
            (_, Event::Hold) => None,
            (None, Event::Turn(n)) => {
                if self.rows > 0 {
                    self.at = (self.at as i32 + n).rem_euclid(self.rows as i32) as usize;
                }
                None
            }
            (None, Event::Click) => (self.rows > 0).then_some(BrowserAction::Open(self.at)),
            (Some(r), Event::Turn(n)) if self.editing => match PreviewRow::ALL[r] {
                PreviewRow::Osc => Some(BrowserAction::Osc(n)),
                PreviewRow::Frame => Some(BrowserAction::Frame(n)),
                _ => None,
            },
            (Some(r), Event::Turn(n)) => {
                self.preview = Some((r as i32 + n).rem_euclid(PreviewRow::ALL.len() as i32) as usize);
                None
            }
            (Some(r), Event::Click) => match PreviewRow::ALL[r] {
                PreviewRow::Keep => Some(BrowserAction::Keep),
                PreviewRow::Back => Some(BrowserAction::Discard),
                _ => {
                    self.editing = !self.editing;
                    None
                }
            },
        }
    }

    /// A preview has begun: the encoder starts on what to do about it.
    pub fn enter_preview(&mut self) {
        self.preview = Some(2);
        self.editing = false;
    }

    pub fn leave_preview(&mut self) {
        self.preview = None;
        self.editing = false;
    }

    /// The first row of a screenful of `shown`, keeping the highlight in the middle where it can.
    pub fn top(&self, shown: usize) -> usize {
        self.at.saturating_sub(shown / 2).min(self.rows.saturating_sub(shown))
    }
}

/// Where the browser is on the drive: in short names to open things by, `WAVES/SERUMT~1`, and in
/// the names a user knows, `Waves/Serum Tables`.
#[derive(Clone, PartialEq, Eq, Debug, Default)]
pub struct DrivePath {
    path: String<PATH_BYTES>,
    names: String<160>,
}

impl DrivePath {
    pub fn as_str(&self) -> &str {
        self.path.as_str()
    }

    /// As much of the end of where it is as fits `most` characters, to show.
    pub fn shown(&self, most: usize) -> &str {
        let s = self.names.as_str();
        s.get(s.len().saturating_sub(most)..).unwrap_or("")
    }

    pub fn clear(&mut self) {
        self.path.clear();
        self.names.clear();
    }

    /// Goes into a folder. False if the path would be too long for a patch to keep.
    pub fn enter(&mut self, short: &str, name: &str) -> bool {
        let (Some(path), Some(names)) = (joined(&self.path, short), joined(&self.names, name)) else {
            return false;
        };
        self.path = path;
        self.names = names;
        true
    }

    pub fn up(&mut self) {
        self.path.truncate(self.path.rfind('/').unwrap_or(0));
        self.names.truncate(self.names.rfind('/').unwrap_or(0));
    }

    /// The path of a file in this folder. None if too long.
    pub fn of(&self, short: &str) -> Option<String<PATH_BYTES>> {
        joined(&self.path, short)
    }
}

/// `folder/name`, or just `name` at the top. None if it doesn't fit.
fn joined<const N: usize>(folder: &String<N>, name: &str) -> Option<String<N>> {
    let mut new = folder.clone();
    ((new.is_empty() || new.push('/').is_ok()) && new.push_str(name).is_ok()).then_some(new)
}

/// A file's name as a table's: without its extension, in capitals, and short enough for the screens.
pub fn table_name(file: &str) -> String<11> {
    let stem = match file.rfind('.') {
        Some(i) if i > 0 => &file[..i],
        _ => file,
    };
    let mut out = String::new();
    for c in stem.chars().take(11) {
        out.push(c.to_ascii_uppercase()).ok();
    }
    out
}

/// A WAV's shape in a line: `2048 x64  16 BIT  44 KHZ`. The rate says nothing about pitch here,
/// but it can tell a user which file this is.
pub fn wav_summary(w: &Wav, frame_len: u32, guessed: bool) -> String<40> {
    let mut s = String::new();
    let frames = w.samples() / frame_len as usize;
    let format = match w.format {
        Format::Pcm8 => "8 BIT",
        Format::Pcm16 => "16 BIT",
        Format::Pcm24 => "24 BIT",
        Format::Pcm32 => "32 BIT",
        Format::Float32 => "FLOAT",
    };
    write!(s, "{}{} x{}  {}  {} KHZ", if guessed { "~" } else { "" }, frame_len, frames, format, w.sample_rate / 1000).ok();
    s
}

/// A shape's room in the pool, if it's one that can be played.
#[derive(Clone, Copy, PartialEq, Eq, Debug)]
pub struct Shape {
    pub frame_log2: u8,
    pub frames: u16,
}

/// The file's shape: frames as many whole ones as it holds, at most the engine's limit.
pub fn shape_of(w: &Wav) -> Option<Shape> {
    let (len, _) = crate::wav::frame_len(w);
    let frames = (w.samples() / len as usize).min(crate::table::MAX_FRAMES as usize);
    (frames > 0).then_some(Shape { frame_log2: len.trailing_zeros() as u8, frames: frames as u16 })
}

/// A frame of a table that needs its levels made.
#[derive(Clone, Copy, PartialEq, Eq, Debug)]
pub struct MipJob {
    pub table: usize,
    pub shape: Table,
    pub frame: u16,
}

/// The tables resident in PSRAM.
pub struct Library {
    pub tables: [Table; MAX_TABLES],
    /// What each really holds: its frame length can change, its samples can't.
    pub samples: [usize; MAX_TABLES],
    /// How many band-limited levels each has ready, as it is shaped now: 0 until they are all made.
    pub mips: [u8; MAX_TABLES],
    /// How many of its frames have theirs, on the way there.
    mip_frames: [u16; MAX_TABLES],
    pub names: [String<11>; MAX_TABLES],
    pub files: [TableFile; MAX_TABLES],
    pub n: usize,
    built: usize,
    pool: Pool,
}

impl Library {
    pub fn new(pool: Pool) -> Library {
        Library {
            tables: [Table { offset: 0, frame_log2: 8, frames: 1 }; MAX_TABLES],
            samples: [0; MAX_TABLES],
            mips: [0; MAX_TABLES],
            mip_frames: [0; MAX_TABLES],
            names: core::array::from_fn(|_| String::new()),
            files: [TableFile::NONE; MAX_TABLES],
            n: 0,
            built: 0,
            pool,
        }
    }

    fn push(&mut self, name: &str, table: Table, samples: usize, file: TableFile) -> Option<usize> {
        if self.n == MAX_TABLES {
            return None;
        }
        let i = self.n;
        self.tables[i] = table;
        self.samples[i] = samples;
        self.mips[i] = 0;
        self.mip_frames[i] = 0;
        self.names[i].clear();
        self.names[i].push_str(name).ok();
        self.files[i] = file;
        self.n += 1;
        Some(i)
    }

    /// Room for a table to be made at boot.
    pub fn pool(&mut self) -> &mut Pool {
        &mut self.pool
    }

    /// A table made at boot. These stay, and saved patches refer to them by number.
    pub fn add_built(&mut self, name: &str, table: Table, samples: usize) -> Option<usize> {
        let i = self.push(name, table, samples, TableFile::NONE)?;
        self.built = self.n;
        Some(i)
    }

    /// The table that came from this file, if it's still here.
    pub fn find_file(&self, path: &str) -> Option<usize> {
        (self.built..self.n).find(|i| self.files[*i].path() == path)
    }

    /// A built-in table by name, as a patch file names one. Case and spaces don't matter there.
    pub fn find_built(&self, name: &str) -> Option<usize> {
        let letters = |s: &str| s.bytes().filter(|c| *c != b' ').map(|c| c.to_ascii_uppercase()).collect::<heapless::Vec<u8, 80>>();
        (0..self.built).find(|i| letters(self.names[*i].as_str()) == letters(name))
    }

    /// Room for a table to be loaded. If there isn't any, loaded tables neither layer is playing
    /// are let go first (`layers`' table numbers are kept right). None if that still doesn't do.
    pub fn make_room(&mut self, shape: Shape, layers: &mut [Layer; N_LAYERS]) -> Option<Table> {
        if self.n < MAX_TABLES {
            if let Some(t) = self.pool.alloc(shape.frame_log2, shape.frames) {
                return Some(t);
            }
        }
        self.let_go_unused(layers);
        if self.n == MAX_TABLES {
            return None;
        }
        self.pool.alloc(shape.frame_log2, shape.frames)
    }

    fn let_go_unused(&mut self, layers: &mut [Layer; N_LAYERS]) {
        let mut kept = self.built;
        for i in self.built..self.n {
            let playing = layers.iter().any(|l| l.table as usize == i);
            if !playing {
                continue;
            }
            if kept != i {
                self.tables[kept] = self.tables[i];
                self.samples[kept] = self.samples[i];
                self.mips[kept] = self.mips[i];
                self.mip_frames[kept] = self.mip_frames[i];
                self.names[kept] = self.names[i].clone();
                self.files[kept] = self.files[i];
                for l in layers.iter_mut() {
                    if l.table as usize == i {
                        l.table = kept as u8;
                    }
                }
            }
            kept += 1;
        }
        self.n = kept;
        // The pool goes back to just past whatever is left at the top of it. (The playing table
        // can't move, as the engine is reading it.)
        let end = (0..self.n).map(|i| self.tables[i].offset + self.samples[i] * 4).max().unwrap_or(0);
        self.pool.rewind_to(end);
    }

    /// Lets every loaded table go, even one playing: a table at the top of the pool can leave no room
    /// for a patch's other one. The layers playing one go back on the built-in table 0, and `missing`
    /// says which file each wants, to load again.
    pub fn let_all_go(&mut self, layers: &mut [Layer; N_LAYERS], missing: &mut [TableFile; N_LAYERS]) {
        for (l, layer) in layers.iter_mut().enumerate() {
            let t = layer.table as usize;
            if t >= self.built && t < self.n {
                missing[l] = TableFile { frame_log2: self.tables[t].frame_log2, ..self.files[t] };
                layer.table = 0;
            }
        }
        self.n = self.built;
        let end = (0..self.n).map(|i| self.tables[i].offset + self.tables[i].room()).max().unwrap_or(0);
        self.pool.rewind_to(end);
    }

    /// A loaded table, made in the room `make_room` gave. Returns its number.
    pub fn add_loaded(&mut self, name: &str, table: Table, samples: usize, file: TableFile) -> Option<usize> {
        self.push(name, table, samples, file)
    }

    /// Takes back the newest table, as a discarded preview's room goes back to the pool.
    pub fn discard_newest(&mut self) {
        if self.n > self.built {
            self.n -= 1;
            let table = self.tables[self.n];
            self.pool.rewind_to(table.offset);
        }
    }

    /// Reads a table with another shape. Its levels were made for the old one, so they go.
    pub fn reshape(&mut self, i: usize, frame_log2: u8) {
        let table = self.tables[i].reshaped(frame_log2, self.samples[i]);
        if table != self.tables[i] {
            self.tables[i] = table;
            self.mips[i] = 0;
            self.mip_frames[i] = 0;
        }
    }

    /// Whether a table can have levels as it is shaped now: they go straight after its frames, so
    /// the frames have to be all it holds.
    fn can_have_mips(&self, i: usize) -> bool {
        self.tables[i].samples() == self.samples[i]
    }

    /// What to make levels for next: the tables playing, as `layers` says, then the rest in turn.
    pub fn next_mip_job(&self, layers: &[Layer; N_LAYERS]) -> Option<MipJob> {
        let wanted = |i: usize| i < self.n && self.mips[i] == 0 && self.can_have_mips(i);
        let playing = layers.iter().map(|l| l.table as usize).find(|i| wanted(*i));
        let i = playing.or_else(|| (0..self.n).find(|i| wanted(*i)))?;
        Some(MipJob { table: i, shape: self.tables[i], frame: self.mip_frames[i] })
    }

    /// A frame's levels are made. True if that finishes its table: they can be read now. (If the
    /// table has changed shape since the job was given out, it is forgotten.)
    pub fn mip_done(&mut self, job: MipJob) -> bool {
        if self.tables[job.table] != job.shape || self.mip_frames[job.table] != job.frame {
            return false;
        }
        self.mip_frames[job.table] += 1;
        if self.mip_frames[job.table] == job.shape.frames {
            self.mips[job.table] = crate::mip::levels_of(job.shape.frame_log2);
            return true;
        }
        false
    }

    pub const fn is_loaded(&self, i: usize) -> bool {
        i >= self.built
    }

    pub const fn built(&self) -> usize {
        self.built
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use std::format;

    fn layers() -> [Layer; N_LAYERS] {
        core::array::from_fn(Layer::default_for)
    }

    #[test]
    fn turning_walks_the_rows_wrapping_and_a_click_opens_the_row() {
        let mut c = BrowserCursor { rows: 3, ..Default::default() };
        assert_eq!(c.event(Event::Turn(2)), None);
        assert_eq!(c.at, 2);
        assert_eq!(c.event(Event::Turn(1)), None);
        assert_eq!(c.at, 0);
        assert_eq!(c.event(Event::Turn(-1)), None);
        assert_eq!(c.at, 2);
        assert_eq!(c.event(Event::Click), Some(BrowserAction::Open(2)));
    }

    #[test]
    fn an_empty_list_does_nothing() {
        let mut c = BrowserCursor::default();
        assert_eq!(c.event(Event::Turn(1)), None);
        assert_eq!(c.at, 0);
        assert_eq!(c.event(Event::Click), None);
    }

    #[test]
    fn a_preview_starts_on_keep_and_walks_its_settings() {
        let mut c = BrowserCursor { rows: 3, ..Default::default() };
        c.enter_preview();
        assert_eq!(PreviewRow::ALL[c.preview.unwrap()], PreviewRow::Keep);
        assert_eq!(c.event(Event::Click), Some(BrowserAction::Keep));
        c.event(Event::Turn(1));
        assert_eq!(PreviewRow::ALL[c.preview.unwrap()], PreviewRow::Back);
        assert_eq!(c.event(Event::Click), Some(BrowserAction::Discard));
        c.event(Event::Turn(1));
        assert_eq!(PreviewRow::ALL[c.preview.unwrap()], PreviewRow::Osc);
        assert_eq!(c.at, 0, "the list stays where it was");
    }

    #[test]
    fn a_previews_settings_are_edited_as_any_are() {
        let mut c = BrowserCursor::default();
        c.enter_preview();
        c.event(Event::Turn(-1));
        assert_eq!(PreviewRow::ALL[c.preview.unwrap()], PreviewRow::Frame);
        assert_eq!(c.event(Event::Click), None);
        assert!(c.editing);
        assert_eq!(c.event(Event::Turn(-2)), Some(BrowserAction::Frame(-2)));
        assert_eq!(PreviewRow::ALL[c.preview.unwrap()], PreviewRow::Frame, "turning edits: it doesn't move");
        assert_eq!(c.event(Event::Click), None);
        assert!(!c.editing);
        c.event(Event::Turn(-1));
        c.event(Event::Click);
        assert_eq!(c.event(Event::Turn(1)), Some(BrowserAction::Osc(1)));
    }

    #[test]
    fn the_screenful_keeps_the_highlight_in_the_middle_where_it_can() {
        let mut c = BrowserCursor { rows: 20, ..Default::default() };
        assert_eq!(c.top(9), 0);
        c.at = 3;
        assert_eq!(c.top(9), 0);
        c.at = 10;
        assert_eq!(c.top(9), 6);
        c.at = 19;
        assert_eq!(c.top(9), 11);
        c.rows = 4;
        c.at = 3;
        assert_eq!(c.top(9), 0, "fewer than a screenful");
    }

    #[test]
    fn a_path_goes_in_and_out_of_folders() {
        let mut p = DrivePath::default();
        assert_eq!(p.as_str(), "");
        assert_eq!(p.of("A.WAV").unwrap().as_str(), "A.WAV");
        assert!(p.enter("WAVES", "waves"));
        assert!(p.enter("SERUM~1", "Serum Tables"));
        assert_eq!(p.as_str(), "WAVES/SERUM~1");
        assert_eq!(p.shown(40), "waves/Serum Tables");
        assert_eq!(p.of("A.WAV").unwrap().as_str(), "WAVES/SERUM~1/A.WAV");
        p.up();
        assert_eq!(p.as_str(), "WAVES");
        assert_eq!(p.shown(40), "waves");
        p.up();
        assert_eq!(p.as_str(), "");
        assert_eq!(p.shown(40), "");
        p.up();
        assert_eq!(p.as_str(), "");
    }

    #[test]
    fn a_path_shows_its_end_if_it_doesnt_all_fit() {
        let mut p = DrivePath::default();
        assert!(p.enter("A", "A long name for a folder"));
        assert!(p.enter("B", "Another one"));
        assert_eq!(p.shown(14), "er/Another one");
    }

    #[test]
    fn a_path_too_deep_to_keep_is_refused() {
        let mut p = DrivePath::default();
        for _ in 0..4 {
            assert!(p.enter("LONGNAME", "A longer name"));
        }
        assert!(!p.enter("LONGNAME", "A longer name"), "{}", p.as_str());
        assert_eq!(p.shown(160).len(), 4 * 13 + 3, "and left as it was");
        assert_eq!(p.as_str().len(), 4 * 8 + 3, "and left as it was");
        assert!(p.of("LONGNAME.WAV").is_none());
    }

    #[test]
    fn a_table_is_named_after_its_file() {
        assert_eq!(table_name("Basic Shapes.wav").as_str(), "BASIC SHAPE");
        assert_eq!(table_name("PAD.WAV").as_str(), "PAD");
        assert_eq!(table_name("noext").as_str(), "NOEXT");
        assert_eq!(table_name(".wav").as_str(), ".WAV");
    }

    fn a_wav(format: Format, channels: u16, data_bytes: usize) -> Wav {
        Wav { format, channels, sample_rate: 44100, data_offset: 44, data_bytes, stated_frame_len: None }
    }

    #[test]
    fn a_summary_says_the_shape_and_marks_a_guess() {
        let w = a_wav(Format::Pcm16, 1, 2048 * 64 * 2);
        assert_eq!(wav_summary(&w, 2048, false).as_str(), "2048 x64  16 BIT  44 KHZ");
        assert_eq!(wav_summary(&w, 2048, true).as_str(), "~2048 x64  16 BIT  44 KHZ");
    }

    #[test]
    fn a_files_shape_is_what_the_engine_can_play() {
        assert_eq!(shape_of(&a_wav(Format::Pcm16, 1, 2048 * 8 * 2)), Some(Shape { frame_log2: 11, frames: 8 }));
        assert_eq!(shape_of(&a_wav(Format::Pcm24, 2, 256 * 3 * 2 * 3)), Some(Shape { frame_log2: 8, frames: 3 }));
        assert_eq!(shape_of(&a_wav(Format::Pcm16, 1, 100)), None, "shorter than a frame");
        let huge = shape_of(&a_wav(Format::Pcm16, 1, 2048 * 5000 * 2)).unwrap();
        assert_eq!(huge.frames, 1024, "cut to what the engine can address");
    }

    fn library() -> Library {
        let mut lib = Library::new(Pool::new(0x10_0000, 0x10_0000));
        let t = lib.pool().alloc(8, 16).unwrap();
        lib.add_built("MORPH", t, t.samples()).unwrap();
        let t = lib.pool().alloc(8, 16).unwrap();
        lib.add_built("PULSE", t, t.samples()).unwrap();
        lib
    }

    const SMALL: Shape = Shape { frame_log2: 8, frames: 16 };

    fn load(lib: &mut Library, l: &mut [Layer; N_LAYERS], name: &str) -> Option<usize> {
        let t = lib.make_room(SMALL, l)?;
        lib.add_loaded(name, t, t.samples(), TableFile::new(name, 8))
    }

    fn levels_library() -> Library {
        let mut lib = Library::new(Pool::new(0x80_0000, 1 << 22));
        for (log2, frames, name) in [(9, 2, "A"), (8, 3, "B"), (8, 1, "C")] {
            let t = lib.pool().alloc(log2, frames).unwrap();
            lib.add_built(name, t, t.samples());
        }
        lib
    }

    /// Does every job there is, on `layers`' say, and returns the tables' order as they finished.
    fn finish_all(lib: &mut Library, l: &[Layer; N_LAYERS]) -> std::vec::Vec<usize> {
        let mut done = std::vec::Vec::new();
        while let Some(job) = lib.next_mip_job(l) {
            if lib.mip_done(job) {
                done.push(job.table);
            }
        }
        done
    }

    #[test]
    fn a_table_has_no_levels_until_every_frame_has_them() {
        let mut lib = levels_library();
        let l = layers();
        for f in 0..2 {
            assert_eq!(lib.mips[0], 0, "not yet: {f}");
            let job = lib.next_mip_job(&l).unwrap();
            assert_eq!((job.table, job.frame), (0, f));
            assert_eq!(lib.mip_done(job), f == 1);
        }
        assert_eq!(lib.mips[0], 6, "512 samples down to 8");
    }

    #[test]
    fn the_tables_playing_come_first() {
        let mut lib = levels_library();
        let mut l = layers();
        l[0].table = 2;
        l[1].table = 1;
        assert_eq!(finish_all(&mut lib, &l), [2, 1, 0]);
        assert_eq!(lib.mips[..3], [6, 5, 5]);
        assert_eq!(lib.next_mip_job(&l), None, "all done");
    }

    #[test]
    fn a_table_read_with_another_frame_length_needs_its_levels_again() {
        let mut lib = levels_library();
        let l = layers();
        finish_all(&mut lib, &l);
        lib.reshape(1, 8);
        assert_eq!(lib.mips[1], 5, "the same shape: nothing to do");
        lib.reshape(0, 8);
        assert_eq!(lib.mips[0], 0);
        assert_eq!(lib.tables[0].frames, 4);
        let done = finish_all(&mut lib, &l);
        assert_eq!(done, [0]);
        assert_eq!(lib.mips[0], 5);
    }

    #[test]
    fn a_job_for_a_shape_since_changed_is_forgotten() {
        let mut lib = levels_library();
        let l = layers();
        let job = lib.next_mip_job(&l).unwrap();
        lib.reshape(0, 8);
        assert!(!lib.mip_done(job));
        assert_eq!(lib.next_mip_job(&l).unwrap().frame, 0, "from the first frame, of the new shape");
    }

    #[test]
    fn a_table_that_isnt_whole_frames_as_read_gets_no_levels() {
        let mut lib = levels_library();
        let l = layers();
        // Three frames of 256 don't make whole frames of 512: its levels would land on its own samples.
        lib.reshape(1, 9);
        assert_eq!(lib.tables[1].samples(), 512);
        assert_eq!(finish_all(&mut lib, &l), [0, 2]);
        assert_eq!(lib.mips[1], 0);
        // Back to what it holds, it can have them.
        lib.reshape(1, 8);
        assert_eq!(finish_all(&mut lib, &l), [1]);
    }

    #[test]
    fn a_tables_levels_stay_with_it_when_others_are_let_go() {
        let mut lib = library();
        let mut l = layers();
        let a = load(&mut lib, &mut l, "A.WAV").unwrap();
        let b = load(&mut lib, &mut l, "B.WAV").unwrap();
        while let Some(job) = lib.next_mip_job(&l) {
            lib.mip_done(job);
        }
        l[0].table = b as u8;
        let levels = lib.mips[b];
        assert!(levels > 0);
        lib.let_go_unused(&mut l);
        let kept = l[0].table as usize;
        assert_eq!(kept, a, "it moved down to the first free number");
        assert_eq!(lib.mips[kept], levels);
    }

    #[test]
    fn a_loaded_table_is_found_again_by_its_file() {
        let mut lib = library();
        let mut l = layers();
        let i = load(&mut lib, &mut l, "A.WAV").unwrap();
        assert_eq!(i, 2);
        assert_eq!(lib.find_file("A.WAV"), Some(2));
        assert_eq!(lib.find_file("B.WAV"), None);
        assert!(lib.is_loaded(2) && !lib.is_loaded(1));
    }

    #[test]
    fn a_built_in_table_is_found_by_its_name_however_a_file_writes_it() {
        let mut lib = library();
        let mut l = layers();
        load(&mut lib, &mut l, "PULSE2.WAV").unwrap();
        assert_eq!(lib.find_built("PULSE"), Some(1));
        assert_eq!(lib.find_built("pulse"), Some(1));
        assert_eq!(lib.find_built("MO RPH"), Some(0));
        assert_eq!(lib.find_built("PULSE2.WAV"), None, "a loaded one isn't built in");
        assert_eq!(lib.find_built("NOPE"), None);
    }

    #[test]
    fn letting_everything_go_leaves_the_built_in_tables_and_says_what_was_wanted() {
        // (16 KB each with their levels: room for the built-in one and three more, exactly)
        let mut lib = Library::new(Pool::new(0x10_0000, 0x1_0000));
        let t = lib.pool().alloc(8, 16).unwrap();
        lib.add_built("MORPH", t, t.samples()).unwrap();
        let mut l = layers();
        l[0].table = 0;
        l[1].table = 0;
        for i in 0..3 {
            load(&mut lib, &mut l, &format!("{i}.WAV")).unwrap();
        }
        // The last in the pool is playing: it can't be moved, and nothing fits over it.
        l[0].table = 3;
        assert_eq!(lib.make_room(SMALL, &mut l), None);
        assert_eq!(l[0].table, 1, "renumbered, as what was below it went");
        assert_eq!(lib.files[1].path(), "2.WAV");

        let mut missing = [TableFile::NONE; N_LAYERS];
        lib.let_all_go(&mut l, &mut missing);
        assert_eq!(lib.n, 1);
        assert_eq!(l[0].table, 0);
        assert_eq!(missing[0].path(), "2.WAV");
        assert!(missing[1].is_none(), "that one was on a built-in table");
        assert_eq!(lib.make_room(SMALL, &mut l).unwrap().offset, lib.tables[0].offset + lib.tables[0].room(), "it has the room");
    }

    #[test]
    fn discarding_a_preview_gives_its_memory_back() {
        let mut lib = library();
        let mut l = layers();
        let i = load(&mut lib, &mut l, "A.WAV").unwrap();
        let at = lib.tables[i].offset;
        lib.discard_newest();
        assert_eq!(lib.n, 2);
        let j = load(&mut lib, &mut l, "B.WAV").unwrap();
        assert_eq!(lib.tables[j].offset, at);
    }

    #[test]
    fn built_in_tables_are_never_discarded() {
        let mut lib = library();
        lib.discard_newest();
        lib.discard_newest();
        assert_eq!(lib.n, 2);
    }

    #[test]
    fn when_the_list_is_full_unused_tables_go_and_playing_ones_stay() {
        let mut lib = library();
        let mut l = layers();
        for i in 0..MAX_TABLES - 2 {
            load(&mut lib, &mut l, &format!("{i}.WAV")).unwrap();
        }
        assert_eq!(lib.n, MAX_TABLES);
        l[0].table = 5;
        l[1].table = 9;
        let (keep_a, keep_b) = (lib.tables[5], lib.tables[9]);
        let new = load(&mut lib, &mut l, "NEW.WAV").unwrap();
        assert_eq!(lib.n, 5, "two built in, two playing, one new");
        assert_eq!(new, 4);
        assert_eq!((l[0].table, l[1].table), (2, 3), "the layers follow their tables");
        assert_eq!((lib.tables[2], lib.tables[3]), (keep_a, keep_b), "and those haven't moved");
        assert_eq!(lib.files[2].path(), "3.WAV");
        // Nothing playing overlaps the new one.
        let t = lib.tables[new];
        assert!(t.offset >= keep_b.offset + keep_b.room());
    }

    #[test]
    fn when_memory_runs_out_it_is_reclaimed_up_to_what_is_playing() {
        let mut lib = Library::new(Pool::new(0x10_0000, 0x8000));
        let t = lib.pool().alloc(8, 16).unwrap();
        lib.add_built("MORPH", t, t.samples()).unwrap();
        let mut l = layers();
        l[0].table = 0;
        l[1].table = 0;
        // 8 KB each, 32 KB in all: three more fit.
        for i in 0..3 {
            load(&mut lib, &mut l, &format!("{i}.WAV")).unwrap();
        }
        let n = load(&mut lib, &mut l, "NEXT.WAV").unwrap();
        assert_eq!(n, 1, "the three unused went");
        assert_eq!(lib.tables[1].offset, lib.tables[0].offset + lib.tables[0].room());
    }

    #[test]
    fn a_table_too_big_for_the_pool_is_refused() {
        let mut lib = Library::new(Pool::new(0x10_0000, 0x4000));
        let t = lib.pool().alloc(8, 16).unwrap();
        lib.add_built("MORPH", t, t.samples()).unwrap();
        let mut l = layers();
        l[0].table = 0;
        l[1].table = 0;
        assert_eq!(lib.make_room(Shape { frame_log2: 11, frames: 64 }, &mut l), None);
    }
}
