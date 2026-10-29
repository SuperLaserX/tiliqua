//! MIDI remote control of the front panel.
//!
//! The Tiliqua has one encoder for the whole H3000 panel; MIDI control
//! changes on any channel stand in for the keys used most and for the big
//! knob. The CC numbers are in the range the MIDI specification leaves
//! undefined, so they rarely clash with anything else. The H3000's patches
//! can still be modulated by any controller, these included: one taken
//! here never reaches the emulated MIDI port.
//!
//! | CC  | Function |
//! |-----|----------|
//! | 85-88 | the value of soft key 1-4's parameter (see below) |
//! | 102-105 | soft keys 1-4 |
//! | 106, 107 | <PAGE, PAGE> |
//! | 108-111 | PROGRAM, LEVELS, SETUP, AUX |
//! | 112 | ENTER |
//! | 113, 114 | up, down |
//! | 115 | knob, absolute: turns by the change of the value |
//! | 116 | knob, relative, two's complement: 1-63 up, 127-65 down (1 = one step) |
//! | 117 | knob, relative, offset: 65 and up up, 63 and down down (64 = 0) |
//! | 118 | knob, relative, sign and magnitude: 1-63 up, 65-127 down |
//!
//! A key is pressed by a value of 64 or more (a button's press; its
//! release, 0, does nothing). Everything else passes through to the
//! emulated MIDI port unchanged, with the status byte sent again where a
//! message taken here would otherwise break running status.
//!
//! CCs 85-88 type their value into the parameter of soft key 1-4, as on the
//! keypad ([`Values`]): the soft key (unless its parameter is already
//! selected), the value's digits, ENTER. The value is in the parameter's
//! units as the keypad takes them: 1 is 1 mS of a delay, 0.1 s of a decay
//! shown in tenths; the kernel keeps it within the parameter's range and
//! steps. Only on a program's parameter pages and on the LEVELS page.
//!
//! Continuous controllers (control changes, channel pressure, pitch bend)
//! reach the emulated port at most every [`THIN_MS`] per controller and
//! channel, the latest value of those received in between following the
//! interval's end ([`Remote::due`]): a knob turned fast sends a few hundred
//! a second, and the kernel, which reads all of its MIDI input before it
//! updates the parameters patched to them, would stall (see
//! [`crate::cv`]). Bank select, data entry and (N)RPN numbers, whose order
//! matters, and the channel mode messages pass at once.

use crate::lcd::Lcd;

/// Front-panel switch indices (see [`crate::machine::Board::keys`]).
const SOFT1: u8 = 7;
const SOFT2: u8 = 4;
const SOFT3: u8 = 6;
const SOFT4: u8 = 5;
const PAGE_LEFT: u8 = 19;
const PAGE_RIGHT: u8 = 9;
const PROGRAM: u8 = 8;
const LEVELS: u8 = 11;
const SETUP: u8 = 10;
const AUX: u8 = 24;
const ENTER: u8 = 3;
const UP: u8 = 15;
const DOWN: u8 = 23;

/// The first CC for the soft keys' values.
pub const VALUE_CC: u8 = 85;
/// The first CC for keys, and the keys of CCs 102-114.
pub const FIRST_CC: u8 = 102;
/// The soft keys, by number.
const SOFT: [u8; 4] = [SOFT1, SOFT2, SOFT3, SOFT4];
/// Keypad digits 0-9.
const DIGITS: [u8; 10] = [2, 12, 14, 13, 20, 22, 21, 16, 18, 17];
const KEYS: [u8; 13] = [SOFT1, SOFT2, SOFT3, SOFT4, PAGE_LEFT, PAGE_RIGHT, PROGRAM, LEVELS, SETUP, AUX, ENTER, UP, DOWN];
const KNOB_ABSOLUTE: u8 = 115;
const KNOB_TWOS: u8 = 116;
const KNOB_OFFSET: u8 = 117;
const KNOB_SIGN: u8 = 118;

/// Shortest time between two values of a continuous controller.
pub const THIN_MS: u32 = 20;
/// Controllers being thinned at a time.
const THIN_SLOTS: usize = 8;

/// A continuous controller lately passed on.
#[derive(Clone, Copy)]
struct Slot {
    /// Status byte and controller number (0: free).
    key: u16,
    /// When it was last passed on.
    last: u32,
    /// A value held back, to pass on at `last + THIN_MS`.
    held: Option<[u8; 2]>,
}

/// What a control change asks of the front panel.
#[derive(Clone, Copy, PartialEq, Eq, Debug)]
pub enum Action {
    /// Press a key (a switch of the keypad matrix).
    Key(u8),
    /// Turn the knob by this many detents (positive = up).
    Knob(i32),
    /// Type `value` into the parameter of soft key `soft` (0-3).
    Value { soft: u8, value: u8 },
}

/// The result of one received byte: bytes for the emulated MIDI port, and
/// what to do on the front panel.
#[derive(Clone, Copy, Default)]
pub struct Received {
    bytes: [u8; 3],
    len: u8,
    pub action: Option<Action>,
}

impl Received {
    /// The bytes to pass on to the emulated MIDI port.
    pub fn forward(&self) -> &[u8] {
        &self.bytes[..self.len as usize]
    }

    fn push(&mut self, b: u8) {
        self.bytes[self.len as usize] = b;
        self.len += 1;
    }
}

/// The MIDI stream filter: takes the remote-control CCs out.
pub struct Remote {
    /// Running status of the incoming stream (0: none).
    status: u8,
    /// Data bytes of the message being received.
    data: [u8; 2],
    have: u8,
    /// Inside a system exclusive message.
    sysex: bool,
    /// The status byte the emulated port last received (0: none), for
    /// running status.
    sent: u8,
    /// Last value of the absolute knob CC.
    absolute: Option<u8>,
    /// Continuous controllers being thinned, and the time ([`Remote::due`]).
    slots: [Slot; THIN_SLOTS],
    now: u32,
}

impl Default for Remote {
    fn default() -> Self {
        Self::new()
    }
}

impl Remote {
    pub const fn new() -> Self {
        Remote {
            status: 0,
            data: [0; 2],
            have: 0,
            sysex: false,
            sent: 0,
            absolute: None,
            slots: [Slot { key: 0, last: 0, held: None }; THIN_SLOTS],
            now: 0,
        }
    }

    /// Data bytes of a message with status `s`.
    fn length(s: u8) -> u8 {
        match s {
            0xC0..=0xDF | 0xF1 | 0xF3 => 1,
            0xF4..=0xF6 => 0,
            _ => 2,
        }
    }

    /// One byte received.
    pub fn byte(&mut self, b: u8) -> Received {
        let mut r = Received::default();
        if b >= 0xF8 {
            // Real time: anywhere, unchanged.
            r.push(b);
            return r;
        }
        if b >= 0x80 {
            if b == 0xF0 || b == 0xF7 {
                self.sysex = b == 0xF0;
                self.status = 0;
                self.sent = 0;
                r.push(b);
                return r;
            }
            self.sysex = false;
            self.status = b;
            self.have = 0;
            if b >= 0xF0 {
                // System common: no running status after it.
                self.sent = 0;
                if Self::length(b) == 0 {
                    self.status = 0;
                    r.push(b);
                }
            }
            return r;
        }
        if self.sysex || self.status == 0 {
            r.push(b);
            return r;
        }
        self.data[self.have as usize] = b;
        self.have += 1;
        if self.have < Self::length(self.status) {
            return r;
        }
        self.have = 0;
        let (status, data) = (self.status, self.data);
        if status >= 0xF0 {
            self.status = 0;
        }
        if status & 0xF0 == 0xB0 {
            if let Some(a) = self.control(data[0], data[1]) {
                r.action = a;
                return r;
            }
        }
        if self.thin(status, data) {
            return r;
        }
        if status != self.sent || status >= 0xF0 {
            r.push(status);
        }
        if status < 0xF0 {
            self.sent = status;
        }
        for &d in &data[..Self::length(status) as usize] {
            r.push(d);
        }
        r
    }

    /// Whether a continuous controller's value is held back (see
    /// [`THIN_MS`]); if not, it is passed on now.
    fn thin(&mut self, status: u8, data: [u8; 2]) -> bool {
        let key = match status & 0xF0 {
            0xB0 if !matches!(data[0], 0 | 6 | 32 | 38 | 96..=101 | 120..) => (status as u16) << 8 | data[0] as u16,
            0xD0 | 0xE0 => (status as u16) << 8,
            _ => return false,
        };
        let now = self.now;
        if let Some(s) = self.slots.iter_mut().find(|s| s.key == key) {
            if now.wrapping_sub(s.last) < THIN_MS {
                s.held = Some(data);
                return true;
            }
            *s = Slot { key, last: now, held: None };
            return false;
        }
        // A free slot, or the one passed on longest ago with nothing held
        // (if every slot holds a value, this controller is not thinned).
        let age = |s: &Slot| if s.key == 0 { u32::MAX } else { now.wrapping_sub(s.last) };
        let free = self.slots.iter().enumerate().filter(|(_, s)| s.held.is_none());
        if let Some((i, _)) = free.min_by_key(|(_, s)| u32::MAX - age(s)) {
            self.slots[i] = Slot { key, last: now, held: None };
        }
        false
    }

    /// Call often with the time in milliseconds: a controller value held
    /// back that is due now (to send with [`Remote::inject`]).
    pub fn due(&mut self, now_ms: u32) -> Option<[u8; 3]> {
        self.now = now_ms;
        if self.sysex {
            return None;
        }
        // The one passed on longest ago first.
        let due = self.slots.iter_mut().filter(|s| s.held.is_some() && now_ms.wrapping_sub(s.last) >= THIN_MS);
        let s = due.min_by_key(|s| s.last.wrapping_sub(now_ms))?;
        let d = s.held.take()?;
        s.last = now_ms;
        Some([(s.key >> 8) as u8, d[0], d[1]])
    }

    /// Whether a message made here can go into the stream now: not inside
    /// a system exclusive message (`quiet`: nothing has arrived for a
    /// while; one cut short is given up). A channel message being received
    /// is only passed on once complete, so any other time will do.
    pub fn can_inject(&mut self, quiet: bool) -> bool {
        if quiet && self.sysex {
            self.sysex = false;
            self.status = 0;
        }
        !self.sysex
    }

    /// A channel message made here (see [`Remote::can_inject`]): the bytes
    /// for the emulated MIDI port, under running status where it allows.
    pub fn inject(&mut self, msg: [u8; 3]) -> Received {
        let mut r = Received::default();
        if msg[0] != self.sent {
            r.push(msg[0]);
            self.sent = msg[0];
        }
        for &d in &msg[1..1 + Self::length(msg[0]) as usize] {
            r.push(d);
        }
        r
    }

    /// A control change: None if it is not one of ours, else what it does.
    fn control(&mut self, cc: u8, v: u8) -> Option<Option<Action>> {
        let knob = |d: i32| Some(if d != 0 { Some(Action::Knob(d)) } else { None });
        match cc {
            VALUE_CC..=88 => Some(Some(Action::Value { soft: cc - VALUE_CC, value: v })),
            FIRST_CC..=114 => Some(if v >= 64 { Some(Action::Key(KEYS[(cc - FIRST_CC) as usize])) } else { None }),
            KNOB_ABSOLUTE => {
                let last = self.absolute.replace(v);
                knob(last.map_or(0, |l| v as i32 - l as i32))
            }
            KNOB_TWOS => knob(if v < 64 { v as i32 } else { v as i32 - 128 }),
            KNOB_OFFSET => knob(v as i32 - 64),
            KNOB_SIGN => knob(if v & 0x40 != 0 { -((v & 0x3F) as i32) } else { v as i32 }),
            _ => None,
        }
    }
}

/// Typing values into soft-key parameters ([`Action::Value`]): a sequence
/// of key presses at a time, with only the latest value of each soft key
/// kept while one is typed (a fader sends many).
#[derive(Default)]
pub struct Values {
    /// The value waiting for each soft key.
    waiting: [Option<u8>; 4],
    /// The keys being pressed, and how many have been.
    keys: [u8; 5],
    len: u8,
    done: u8,
}

impl Values {
    pub const fn new() -> Self {
        Values { waiting: [None; 4], keys: [0; 5], len: 0, done: 0 }
    }

    /// A value for soft key `soft` (0-3).
    pub fn set(&mut self, soft: u8, value: u8) {
        self.waiting[soft as usize & 3] = Some(value);
    }

    /// Typing a value: no other key should be pressed until it is done.
    pub fn busy(&self) -> bool {
        self.done < self.len
    }

    /// Whether there is anything to type.
    pub fn pending(&self) -> bool {
        self.busy() || self.waiting.iter().any(|w| w.is_some())
    }

    /// The next key to press (call when the keypad is free); `lcd` shows
    /// what the kernel has on display. Values for soft keys that edit
    /// nothing there are dropped.
    pub fn next_key(&mut self, lcd: &Lcd) -> Option<u8> {
        while !self.busy() {
            let soft = self.waiting.iter().position(|w| w.is_some())?;
            let value = self.waiting[soft].take().unwrap();
            let Some(selected) = Self::field(lcd, soft) else { continue };
            let mut n = 0;
            if !selected {
                self.keys[n] = SOFT[soft];
                n += 1;
            }
            if value >= 100 {
                self.keys[n] = DIGITS[value as usize / 100];
                n += 1;
            }
            if value >= 10 {
                self.keys[n] = DIGITS[value as usize / 10 % 10];
                n += 1;
            }
            self.keys[n] = DIGITS[value as usize % 10];
            self.keys[n + 1] = ENTER;
            self.len = n as u8 + 2;
            self.done = 0;
        }
        self.done += 1;
        Some(self.keys[self.done as usize - 1])
    }

    /// Soft key `soft`'s field on a parameter page: Some(selected), or None
    /// if the page shows none (anywhere but a program's parameter pages and
    /// the LEVELS page: the program page would take the digits as a program
    /// number, other pages' soft keys do other things).
    fn field(lcd: &Lcd, soft: usize) -> Option<bool> {
        let row0 = |i: usize| lcd.char_at(0, i);
        // "NNN NAME..." or " Left In   Right In  Left Out  Right Out"
        let program = (0..3).all(|i| row0(i).is_ascii_digit()) && row0(3) == b' ';
        let levels = b" Left In".iter().enumerate().all(|(i, &c)| row0(i) == c);
        if !(program || levels) {
            return None;
        }
        // "(name    )", or selected "<name    >" (characters 8 and 9).
        match lcd.char_at(1, soft * 10) {
            b'(' => Some(false),
            8 => Some(true),
            _ => None,
        }
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    /// Feed bytes; return what is forwarded and the actions.
    fn feed(r: &mut Remote, bytes: &[u8]) -> (Vec<u8>, Vec<Action>) {
        let (mut out, mut acts) = (Vec::new(), Vec::new());
        for &b in bytes {
            let x = r.byte(b);
            out.extend_from_slice(x.forward());
            acts.extend(x.action);
        }
        (out, acts)
    }

    #[test]
    fn keys_and_knob() {
        let mut r = Remote::new();
        // Soft 1 pressed and released, PAGE> pressed, on channel 3.
        let (out, acts) = feed(&mut r, &[0xB2, 102, 127, 102, 0, 107, 100]);
        assert!(out.is_empty());
        assert_eq!(acts, [Action::Key(SOFT1), Action::Key(PAGE_RIGHT)]);
        // Relative knob: two's complement, offset, sign and magnitude.
        let (_, acts) = feed(&mut r, &[0xB0, 116, 1, 116, 127, 117, 66, 117, 63, 118, 2, 118, 0x43]);
        assert_eq!(acts, [Action::Knob(1), Action::Knob(-1), Action::Knob(2), Action::Knob(-1), Action::Knob(2), Action::Knob(-3)]);
        // Absolute: the first value only sets the position.
        let (_, acts) = feed(&mut r, &[0xB0, 115, 40, 115, 43, 115, 41]);
        assert_eq!(acts, [Action::Knob(3), Action::Knob(-2)]);
    }

    #[test]
    fn values() {
        let mut r = Remote::new();
        let (out, acts) = feed(&mut r, &[0xB5, 85, 1, 88, 127]);
        assert!(out.is_empty());
        assert_eq!(acts, [Action::Value { soft: 0, value: 1 }, Action::Value { soft: 3, value: 127 }]);
    }

    #[test]
    fn passes_everything_else() {
        let mut r = Remote::new();
        let stream = [0x90, 60, 100, 62, 90, 0xB0, 7, 100, 0xF8, 1, 64, 0xC1, 5, 0xF0, 0x1C, 0x10, 0xF7, 0xE0, 0, 64];
        let (out, acts) = feed(&mut r, &stream);
        assert_eq!(out, stream);
        assert!(acts.is_empty());
    }

    #[test]
    fn running_status_kept() {
        let mut r = Remote::new();
        // Volume, ours (soft 2), then pan under running status: the port
        // has seen B0 last, so no status byte is needed.
        let (out, acts) = feed(&mut r, &[0xB0, 7, 100, 103, 127, 10, 90]);
        assert_eq!(out, [0xB0, 7, 100, 10, 90]);
        assert_eq!(acts, [Action::Key(SOFT2)]);
        // Ours first after a note: the CC under running status that
        // follows needs its status byte.
        let (out, _) = feed(&mut r, &[0x90, 60, 100, 0xB0, 104, 127, 1, 64]);
        assert_eq!(out, [0x90, 60, 100, 0xB0, 1, 64]);
        // A real-time byte inside a message changes nothing.
        let (out, acts) = feed(&mut r, &[0xB0, 105, 0xF8, 127]);
        assert_eq!(out, [0xF8]);
        assert_eq!(acts, [Action::Key(SOFT4)]);
    }

    #[test]
    fn thinned() {
        let mut r = Remote::new();
        // CC 16 on channel 2 and pitch bend: the first passes, the next
        // within THIN_MS is held, the last held one follows at the end.
        let (out, _) = feed(&mut r, &[0xB1, 16, 1, 16, 2, 16, 3, 0xE0, 0, 64, 0, 65]);
        assert_eq!(out, [0xB1, 16, 1, 0xE0, 0, 64]);
        assert_eq!(r.due(THIN_MS - 1), None);
        assert_eq!(r.due(THIN_MS), Some([0xB1, 16, 3]));
        assert_eq!(r.due(THIN_MS), Some([0xE0, 0, 65]));
        assert_eq!(r.due(THIN_MS + 1), None);
        // Then held again until THIN_MS after those; a late one passes.
        let (out, _) = feed(&mut r, &[0xB1, 16, 4]);
        assert!(out.is_empty());
        r.due(3 * THIN_MS);
        assert_eq!(r.due(3 * THIN_MS), None);
        let (out, _) = feed(&mut r, &[16, 5]);
        assert!(out.is_empty());
        assert_eq!(r.due(4 * THIN_MS), Some([0xB1, 16, 5]));
        r.due(10 * THIN_MS);
        let (out, _) = feed(&mut r, &[16, 6]);
        assert_eq!(out, [0xB1, 16, 6]);
        // Bank select and data entry are never held.
        let (out, _) = feed(&mut r, &[0, 1, 0, 2, 6, 3, 6, 4]);
        assert_eq!(out, [0, 1, 0, 2, 6, 3, 6, 4]);
    }

    #[test]
    fn injected() {
        let mut r = Remote::new();
        // Between a note and its running-status successor, and halfway
        // through one: the stream's status byte is sent again after ours.
        let (mut out, _) = feed(&mut r, &[0x90, 60, 100, 62]);
        assert!(r.can_inject(false));
        out.extend_from_slice(r.inject([0xB0, 16, 5]).forward());
        out.extend_from_slice(r.inject([0xB0, 17, 6]).forward());
        let (rest, _) = feed(&mut r, &[90, 64, 1]);
        out.extend(rest);
        assert_eq!(out, [0x90, 60, 100, 0xB0, 16, 5, 17, 6, 0x90, 62, 90, 64, 1]);
        // Not inside a system exclusive message, unless it has stopped.
        feed(&mut r, &[0xF0, 0x1C]);
        assert!(!r.can_inject(false));
        assert!(r.can_inject(true));
        assert_eq!(r.inject([0xB0, 16, 7]).forward(), [0xB0, 16, 7]);
    }
}
