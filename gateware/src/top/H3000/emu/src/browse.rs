//! Front-panel key presses made on the user's behalf, and program browsing.
//!
//! Browsing goes through a list of the ROM set's programs (made by the PC
//! runner's `programs` command and carried in the packed ROM image): turning
//! moves through it at once and the panel shows the selected program, while
//! the emulated H3000 carries on undisturbed. Once the selection has been on
//! show, with the encoder untouched, for [`APPLY_IDLE_MS`] (or at once when
//! browsing ends), it is loaded the quickest way wherever it is in the list:
//! its number typed on the kernel's program page, then ENTER. A load that
//! goes wrong (a key press lost while the kernel is busy) is tried again.
//!
//! A program can also be called up by number ([`Browser::begin_entry`]):
//! turning sets one digit at a time, a click moves on to the next digit and
//! the last click loads it. [`Browser::jump`] moves the selection by tens. (Stepping the kernel through the programs with
//! its up/down keys instead costs 0.1-0.6 s a program on the H3500, which
//! works out its program list as it goes.)
//!
//! The kernel scans the keypad from its main loop, so while it is busy a
//! press of fixed length can go unseen, or be seen late. Presses are
//! therefore timed by the kernel's keypad scans: a key is held until the
//! kernel has read it, and the next press waits until it has read the key
//! released.

use crate::machine::{Host, E_HZ, H3000};

/// H3000 key matrix positions.
pub const KEY_PROGRAM: u8 = 8;
pub const KEY_ENTER: u8 = 3;
/// Next parameter page; on the program page it leaves the page.
pub const KEY_PARAM: u8 = 9;
/// Keypad matrix positions of the digits 0-9.
pub const KEY_DIGITS: [u8; 10] = [2, 12, 14, 13, 20, 22, 21, 16, 18, 17];

const CYCLES_PER_MS: u64 = E_HZ as u64 / 1000;
/// Key presses are held at least this long, and released once the kernel
/// has read the key (it auto-repeats a key held for about 0.16 s), or at the
/// latest after `PRESS_MAX`.
const PRESS_MIN: u64 = 20 * CYCLES_PER_MS;
const PRESS_MAX: u64 = 1500 * CYCLES_PER_MS;
/// After a release the next press waits for the kernel to read the key
/// released, but no longer than this.
const RELEASE_MAX: u64 = 3000 * CYCLES_PER_MS;
/// PROGRAM is pressed again if the program page is not up this long after
/// a press, at most `PAGE_TRIES` times.
const PAGE_WAIT: u64 = 1500 * CYCLES_PER_MS;
const PAGE_TRIES: u8 = 3;
/// A load whose number the kernel did not take is tried this many times.
const ATTEMPTS: u8 = 3;
/// The typed number must show on the program page within this.
const CONFIRM_TIMEOUT: u64 = 3000 * CYCLES_PER_MS;
/// A load is over after this long even if the program page still shows (the
/// H3000 keeps it up for under a second while loading, the H3500 shows its
/// loading page).
const LOAD_TIMEOUT: u64 = 5000 * CYCLES_PER_MS;
/// The selection is loaded once it has been on show, with the encoder
/// untouched, for this long.
pub const APPLY_IDLE_MS: u32 = 3000;

/// First LCD row of the program page, and the H3500's page while it loads.
const PROGRAM_PAGE: &[u8] = b"Selected Program";
const LOADING_PAGE: &[u8] = b"Loading";
/// The selection field of the program page (row 0): "[NNN] NAME".
const SEL_COL: usize = 19;

/// The programs of a ROM set, by number: per program a 2-byte LE number and
/// a 16-byte space-padded name (`pack_roms.py`).
#[derive(Clone, Copy)]
pub struct ProgramList<'a>(&'a [u8]);

const ENTRY: usize = 18;

impl<'a> ProgramList<'a> {
    pub fn new(bytes: &'a [u8]) -> Self {
        ProgramList(&bytes[..bytes.len() / ENTRY * ENTRY])
    }

    pub fn len(&self) -> usize {
        self.0.len() / ENTRY
    }

    pub fn is_empty(&self) -> bool {
        self.0.is_empty()
    }

    pub fn number(&self, i: usize) -> u16 {
        u16::from_le_bytes([self.0[i * ENTRY], self.0[i * ENTRY + 1]])
    }

    /// The name, without the padding.
    pub fn name(&self, i: usize) -> &'a [u8] {
        let n = &self.0[i * ENTRY + 2..(i + 1) * ENTRY];
        let end = n.iter().rposition(|&c| c != b' ').map_or(0, |p| p + 1);
        &n[..end]
    }

    /// The index of program `num`, or of the next one after it (or the last).
    pub fn nearest(&self, num: u16) -> usize {
        let (mut lo, mut hi) = (0, self.len());
        while lo < hi {
            let mid = (lo + hi) / 2;
            if self.number(mid) < num {
                lo = mid + 1;
            } else {
                hi = mid;
            }
        }
        lo.min(self.len().saturating_sub(1))
    }
}

/// Matrix row of a key (see [`crate::machine::Board::keys`]).
fn row_of(key: u8) -> usize {
    if key == 24 { 0 } else { key as usize / 4 }
}

/// Waits for a keypad scan to read a row. The kernel scans the rows one
/// after the other, row 0 first, about every 16 ms; row 5 is also read on
/// its own all the time, so for row 5 the scan is the read after row 4's.
#[derive(Clone, Copy)]
struct Scan {
    row: usize,
    /// The row being watched (row 4 first, for row 5) and its read count.
    watch: usize,
    reads: u16,
}

impl Scan {
    fn start<H: Host>(m: &H3000<'_, H>, row: usize) -> Self {
        let watch = if row == 5 { 4 } else { row };
        Scan { row, watch, reads: m.board.row_scans[watch] }
    }

    /// Whether a scan has read the row since the start.
    fn done<H: Host>(&mut self, m: &H3000<'_, H>) -> bool {
        if m.board.row_scans[self.watch] == self.reads {
            return false;
        }
        if self.watch == self.row {
            return true;
        }
        self.watch = self.row;
        self.reads = m.board.row_scans[self.row];
        false
    }
}

#[derive(Clone, Copy)]
struct Held {
    key: u8,
    scan: Scan,
    /// Release window (E cycle counts).
    min: u64,
    max: u64,
    gap: u64,
}

/// Key presses on the 6809's keypad, one at a time.
pub struct Keys {
    held: Option<Held>,
    /// The last release, until the kernel has read the key released (and
    /// the E cycle count at the release).
    released: Option<(Scan, u64)>,
    /// The next press may start at this E cycle count.
    next_press: u64,
}

impl Keys {
    pub const fn new() -> Self {
        Keys { held: None, released: None, next_press: 0 }
    }

    /// Press `key` until the kernel has read it; no other press for `gap`
    /// E cycles after the release.
    pub fn press<H: Host>(&mut self, m: &mut H3000<'_, H>, key: u8, gap: u64) {
        m.set_key(key, true);
        let now = m.cpu.cycles;
        let scan = Scan::start(m, row_of(key));
        self.held = Some(Held { key, scan, min: now + PRESS_MIN, max: now + PRESS_MAX, gap });
    }

    /// Release the held key once due. Call often.
    pub fn poll<H: Host>(&mut self, m: &mut H3000<'_, H>) {
        if let Some(h) = self.held.as_mut() {
            let now = m.cpu.cycles;
            let seen = h.scan.done(m);
            if now >= h.max || (now >= h.min && seen) {
                m.set_key(h.key, false);
                self.next_press = now + h.gap;
                self.released = Some((Scan::start(m, row_of(h.key)), now));
                self.held = None;
            }
        }
        if let Some((scan, _)) = self.released.as_mut() {
            if scan.done(m) {
                self.released = None;
            }
        }
    }

    /// Whether a key is down.
    pub fn held(&self) -> bool {
        self.held.is_some()
    }

    /// Whether a new press can start: the kernel has read the last key
    /// released (or not for `RELEASE_MAX`).
    pub fn free<H: Host>(&self, m: &H3000<'_, H>) -> bool {
        let now = m.cpu.cycles;
        let release_seen = self.released.map_or(true, |(_, t)| now >= t + RELEASE_MAX);
        self.held.is_none() && release_seen && now >= self.next_press && !m.busy()
    }
}

impl Default for Keys {
    fn default() -> Self {
        Self::new()
    }
}

/// A program number being entered digit by digit.
#[derive(Clone, Copy, PartialEq, Eq, Debug)]
pub struct Entry {
    /// Hundreds, tens, ones.
    pub digits: [u8; 3],
    /// The digit being set (0-2).
    pub pos: u8,
}

impl Entry {
    pub fn number(&self) -> u16 {
        self.digits[0] as u16 * 100 + self.digits[1] as u16 * 10 + self.digits[2] as u16
    }
}

/// Loading the selection, step by step.
#[derive(Clone, Copy, PartialEq, Eq, Debug)]
enum Load {
    Idle,
    /// Leave the program page, so that the number is typed afresh: PARAM
    /// pressed (E cycle count, tries).
    Leave(Option<u64>, u8),
    /// Bring up the program page: PROGRAM pressed (E cycle count, tries).
    Page(Option<u64>, u8),
    /// Type the next digit of the number.
    Digit(usize),
    /// Wait for the page to show the number (since E cycle count), then ENTER.
    Confirm(u64),
    /// ENTER pressed (E cycle count): wait for the load to be over.
    Loading(u64),
}

pub struct Browser<'a> {
    pub keys: Keys,
    list: ProgramList<'a>,
    /// Browsing: encoder turns move the selection.
    active: bool,
    /// The selected program (list index), while browsing and until loaded.
    sel: Option<usize>,
    /// The loaded program, as the kernel last showed it.
    current: Option<u16>,
    /// Time since the selection last moved.
    idle_ms: u32,
    load: Load,
    /// The program being loaded, as three digits.
    target: u16,
    digits: [u8; 3],
    attempts: u8,
    /// A program number being entered (the selection follows it).
    entry: Option<Entry>,
    /// Loads given up (the kernel did not take the number or did not load).
    pub failures: u32,
}

impl<'a> Browser<'a> {
    pub const fn new(list: ProgramList<'a>) -> Self {
        Browser {
            keys: Keys::new(),
            list,
            active: false,
            sel: None,
            current: None,
            idle_ms: 0,
            load: Load::Idle,
            target: 0,
            digits: [0; 3],
            attempts: 0,
            entry: None,
            failures: 0,
        }
    }

    pub fn active(&self) -> bool {
        self.active
    }

    /// A selection is waiting to be loaded, or being loaded.
    pub fn pending(&self) -> bool {
        self.load != Load::Idle || self.sel.is_some_and(|i| Some(self.list.number(i)) != self.current)
    }

    /// The program being loaded, while a load is under way.
    pub fn loading(&self) -> Option<u16> {
        (self.load != Load::Idle).then_some(self.target)
    }

    /// The selected program (number and name) while browsing or until it
    /// has been loaded.
    pub fn selection(&self) -> Option<(u16, &'a [u8])> {
        let i = self.sel?;
        (self.active || self.pending()).then(|| (self.list.number(i), self.list.name(i)))
    }

    /// The program number being entered, if any.
    pub fn entry(&self) -> Option<Entry> {
        self.entry
    }

    /// Start entering a program number (browsing, if not already), from
    /// the selected program's number.
    pub fn begin_entry<H: Host>(&mut self, m: &mut H3000<'_, H>) {
        self.start(m);
        let n = self.sel.map_or(100, |i| self.list.number(i));
        self.entry = Some(Entry { digits: [(n / 100 % 10) as u8, (n / 10 % 10) as u8, (n % 10) as u8], pos: 0 });
    }

    /// Back to browsing by turning.
    pub fn cancel_entry(&mut self) {
        self.entry = None;
    }

    /// Move the selection by `tens` times ten program numbers.
    pub fn jump(&mut self, tens: i32) {
        let Some(i) = self.sel else { return };
        let n = (self.list.number(i) as i32 + tens * 10).clamp(0, 999) as u16;
        let mut j = self.list.nearest(n);
        // Keep moving where a gap of ten numbers has no program.
        if j == i {
            j = (i as i32 + tens.signum()).clamp(0, self.list.len() as i32 - 1) as usize;
        }
        self.sel = Some(j);
        self.idle_ms = 0;
    }

    fn select_number(&mut self, n: u16) {
        if !self.list.is_empty() {
            self.sel = Some(self.list.nearest(n));
        }
        self.idle_ms = 0;
    }

    /// Start browsing, from the loaded program.
    pub fn start<H: Host>(&mut self, m: &mut H3000<'_, H>) {
        self.active = true;
        self.idle_ms = 0;
        if let Some(n) = shown_program(m) {
            if self.load == Load::Idle {
                self.current = Some(n);
            }
        }
        if self.sel.is_none() && !self.list.is_empty() {
            self.sel = Some(self.current.map_or(0, |n| self.list.nearest(n)));
        }
    }

    /// Call often. `ticks` and `click` are the encoder input while browsing:
    /// turns move the selection, a click stops browsing (and loads the
    /// selection); while a number is entered, turns set the digit and a
    /// click moves on to the next (the last loads). `elapsed_ms`: time
    /// since the last call.
    pub fn update<H: Host>(&mut self, ticks: i8, click: bool, elapsed_ms: u32, m: &mut H3000<'_, H>) {
        self.keys.poll(m);
        self.idle_ms = self.idle_ms.saturating_add(elapsed_ms);
        if self.active && self.entry.is_some() {
            let mut e = self.entry.unwrap();
            if ticks != 0 {
                let p = e.pos as usize;
                e.digits[p] = (e.digits[p] as i32 + ticks as i32).rem_euclid(10) as u8;
                self.select_number(e.number());
            }
            if click {
                e.pos += 1;
            }
            if e.pos >= 3 {
                self.entry = None;
                self.active = false;
            } else {
                self.entry = Some(e);
            }
        } else if self.active {
            if ticks != 0 {
                self.idle_ms = 0;
                if !self.list.is_empty() {
                    let i = self.sel.unwrap_or(0) as i32 + ticks as i32;
                    self.sel = Some(i.clamp(0, self.list.len() as i32 - 1) as usize);
                }
            }
            if click {
                self.active = false;
            }
        }
        let now = m.cpu.cycles;
        match self.load {
            Load::Idle => {
                // Programs also change from the keypad and over MIDI.
                if let Some(n) = shown_program(m) {
                    self.current = Some(n);
                }
                let Some(i) = self.sel else { return };
                let n = self.list.number(i);
                if Some(n) == self.current {
                    if !self.active {
                        self.sel = None;
                    }
                } else if self.entry.is_none() && (!self.active || self.idle_ms >= APPLY_IDLE_MS) && self.keys.free(m) {
                    self.target = n;
                    self.digits = [(n / 100 % 10) as u8, (n / 10 % 10) as u8, (n % 10) as u8];
                    self.attempts = 1;
                    // A digit entry may be under way on the page.
                    self.load = if program_page(m) { Load::Leave(None, 0) } else { Load::Page(None, 0) };
                }
            }
            Load::Leave(asked, tries) => {
                if !program_page(m) {
                    if self.attempts > ATTEMPTS {
                        self.give_up();
                    } else {
                        self.load = Load::Page(None, 0);
                    }
                } else if self.keys.free(m) && asked.map_or(true, |t| now >= t + PAGE_WAIT) {
                    if tries >= PAGE_TRIES {
                        self.give_up();
                    } else {
                        self.keys.press(m, KEY_PARAM, 0);
                        self.load = Load::Leave(Some(now), tries + 1);
                    }
                }
            }
            Load::Page(asked, tries) => {
                if program_page(m) {
                    self.load = Load::Digit(0);
                } else if self.keys.free(m) && asked.map_or(true, |t| now >= t + PAGE_WAIT) {
                    if tries >= PAGE_TRIES {
                        self.give_up();
                    } else {
                        self.keys.press(m, KEY_PROGRAM, 0);
                        self.load = Load::Page(Some(now), tries + 1);
                    }
                }
            }
            Load::Digit(k) => {
                if self.keys.free(m) {
                    self.keys.press(m, KEY_DIGITS[self.digits[k] as usize], 0);
                    self.load = if k + 1 < self.digits.len() { Load::Digit(k + 1) } else { Load::Confirm(now) };
                }
            }
            Load::Confirm(t) => {
                match selected_number(m) {
                    Some(n) if n == self.target => {
                        if self.keys.free(m) {
                            self.keys.press(m, KEY_ENTER, 0);
                            self.load = Load::Loading(now);
                        }
                    }
                    // A digit was lost: the kernel takes no more once it
                    // has three.
                    Some(_) if self.keys.free(m) => self.retry(),
                    _ if now >= t + CONFIRM_TIMEOUT => self.retry(),
                    _ => {}
                }
            }
            Load::Loading(t) => {
                let loading_page = row0_starts(m, LOADING_PAGE);
                let on_page = program_page(m);
                if (on_page || loading_page) && now < t + LOAD_TIMEOUT {
                    return;
                }
                if on_page {
                    // Still on the page: the kernel did not load it.
                    self.retry();
                } else {
                    self.current = Some(self.target);
                    self.load = Load::Idle;
                }
            }
        }
    }

    /// Type the number again, from a fresh program page.
    fn retry(&mut self) {
        self.attempts += 1;
        self.load = Load::Leave(None, 0);
    }

    fn give_up(&mut self) {
        self.failures += 1;
        self.load = Load::Idle;
        self.sel = None;
    }

    #[cfg(feature = "std")]
    pub fn describe(&self) -> std::string::String {
        format!(
            "active={} entry={:?} sel={:?} current={:?} load={:?} idle={}ms held={} failures={}",
            self.active,
            self.entry,
            self.sel.map(|i| self.list.number(i)),
            self.current,
            self.load,
            self.idle_ms,
            self.keys.held.is_some(),
            self.failures
        )
    }
}

fn row0_starts<H: Host>(m: &H3000<'_, H>, text: &[u8]) -> bool {
    text.iter().enumerate().all(|(i, &c)| m.board.lcd.char_at(0, i) == c)
}

/// The program page is up (and drawn as far as its selection field).
fn program_page<H: Host>(m: &H3000<'_, H>) -> bool {
    let lcd = &m.board.lcd;
    row0_starts(m, PROGRAM_PAGE) && lcd.char_at(0, SEL_COL) == b'[' && lcd.char_at(0, SEL_COL + 4) == b']'
}

/// The number in the program page's selection field.
fn selected_number<H: Host>(m: &H3000<'_, H>) -> Option<u16> {
    if !program_page(m) {
        return None;
    }
    number_at(m, SEL_COL + 1)
}

/// The program a parameter page belongs to: "NNN " at the start of row 0.
fn shown_program<H: Host>(m: &H3000<'_, H>) -> Option<u16> {
    if m.board.lcd.char_at(0, 3) != b' ' {
        return None;
    }
    number_at(m, 0)
}

fn number_at<H: Host>(m: &H3000<'_, H>, col: usize) -> Option<u16> {
    let mut n = 0u16;
    for i in 0..3 {
        let c = m.board.lcd.char_at(0, col + i);
        if !c.is_ascii_digit() {
            return None;
        }
        n = n * 10 + (c - b'0') as u16;
    }
    Some(n)
}

#[cfg(test)]
mod tests {
    use super::ProgramList;

    #[test]
    fn program_list() {
        let mut bytes = std::vec::Vec::new();
        for (num, name) in [(100u16, &b"DIATONIC SHIFT  "[..]), (101, b"LAYERED SHIFT   "), (105, b"A               ")] {
            bytes.extend_from_slice(&num.to_le_bytes());
            bytes.extend_from_slice(name);
        }
        bytes.push(0); // a partial entry is ignored
        let list = ProgramList::new(&bytes);
        assert_eq!(list.len(), 3);
        assert_eq!(list.number(2), 105);
        assert_eq!(list.name(0), b"DIATONIC SHIFT");
        assert_eq!(list.name(2), b"A");
        assert_eq!(list.nearest(0), 0);
        assert_eq!(list.nearest(101), 1);
        assert_eq!(list.nearest(102), 2);
        assert_eq!(list.nearest(999), 2);
    }
}
