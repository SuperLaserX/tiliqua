//! HD44780 character LCD controller, as used for the H3000's 2 x 40 display.
//!
//! Only the parts the H3000 kernel uses are modelled in detail: 8-bit
//! interface, 2-line mode (DDRAM rows at $00 and $40), entry mode, display
//! shift, cursor/blink flags and the 8 user-defined CGRAM characters. The
//! controller is never busy.

pub const COLS: usize = 40;
pub const ROWS: usize = 2;

#[derive(Clone)]
pub struct Lcd {
    ddram: [u8; 0x80],
    pub cgram: [u8; 0x40],
    ac: u8,
    cg_mode: bool,
    increment: bool,
    entry_shift: bool,
    /// Display shift in characters (positive = shifted left).
    shift: i8,
    pub display_on: bool,
    pub cursor_on: bool,
    pub blink_on: bool,
    /// Set on every change that affects what is shown.
    pub dirty: bool,
}

impl Default for Lcd {
    fn default() -> Self {
        Self::new()
    }
}

impl Lcd {
    pub const fn new() -> Self {
        Lcd {
            ddram: [b' '; 0x80],
            cgram: [0; 0x40],
            ac: 0,
            cg_mode: false,
            increment: true,
            entry_shift: false,
            shift: 0,
            display_on: false,
            cursor_on: false,
            blink_on: false,
            dirty: true,
        }
    }

    fn step_ac(&mut self) {
        if self.cg_mode {
            self.ac = if self.increment { self.ac.wrapping_add(1) } else { self.ac.wrapping_sub(1) } & 0x3F;
            return;
        }
        // 2-line mode: $00-$27 and $40-$67, wrapping from one line to the other.
        self.ac = if self.increment {
            match self.ac {
                0x27 => 0x40,
                0x67 => 0x00,
                a => a + 1,
            }
        } else {
            match self.ac {
                0x00 => 0x67,
                0x40 => 0x27,
                a => a - 1,
            }
        };
    }

    fn shift_display(&mut self, left: bool) {
        self.shift = if left { (self.shift + 1) % COLS as i8 } else { (self.shift - 1) % COLS as i8 };
        self.dirty = true;
    }

    pub fn write_command(&mut self, cmd: u8) {
        if cmd & 0x80 != 0 {
            self.ac = cmd & 0x7F;
            self.cg_mode = false;
        } else if cmd & 0x40 != 0 {
            self.ac = cmd & 0x3F;
            self.cg_mode = true;
        } else if cmd & 0x20 != 0 {
            // function set: 8-bit, 2-line assumed
        } else if cmd & 0x10 != 0 {
            let display = cmd & 0x08 != 0;
            let right = cmd & 0x04 != 0;
            if display {
                self.shift_display(!right);
            } else {
                let entry = self.increment;
                self.increment = right;
                self.step_ac();
                self.increment = entry;
            }
            self.dirty = true;
        } else if cmd & 0x08 != 0 {
            self.display_on = cmd & 0x04 != 0;
            self.cursor_on = cmd & 0x02 != 0;
            self.blink_on = cmd & 0x01 != 0;
            self.dirty = true;
        } else if cmd & 0x04 != 0 {
            self.increment = cmd & 0x02 != 0;
            self.entry_shift = cmd & 0x01 != 0;
        } else if cmd & 0x02 != 0 {
            self.ac = 0;
            self.cg_mode = false;
            self.shift = 0;
            self.dirty = true;
        } else if cmd & 0x01 != 0 {
            self.ddram = [b' '; 0x80];
            self.ac = 0;
            self.cg_mode = false;
            self.increment = true;
            self.shift = 0;
            self.dirty = true;
        }
    }

    pub fn write_data(&mut self, v: u8) {
        if self.cg_mode {
            self.cgram[(self.ac & 0x3F) as usize] = v;
        } else {
            self.ddram[(self.ac & 0x7F) as usize] = v;
        }
        self.dirty = true;
        self.step_ac();
        if self.entry_shift && !self.cg_mode {
            self.shift_display(self.increment);
        }
    }

    /// Busy flag (never set) and address counter.
    pub fn read_status(&self) -> u8 {
        self.ac & 0x7F
    }

    pub fn read_data(&mut self) -> u8 {
        let v = if self.cg_mode {
            self.cgram[(self.ac & 0x3F) as usize]
        } else {
            self.ddram[(self.ac & 0x7F) as usize]
        };
        self.step_ac();
        v
    }

    /// Character code shown at a display position (0..ROWS, 0..COLS).
    pub fn char_at(&self, row: usize, col: usize) -> u8 {
        let c = (col as i32 + self.shift as i32).rem_euclid(COLS as i32) as usize;
        self.ddram[row * 0x40 + c]
    }

    /// Display column of the cursor, if it is on screen.
    pub fn cursor(&self) -> Option<(usize, usize)> {
        if self.cg_mode || !(self.cursor_on || self.blink_on) {
            return None;
        }
        let row = (self.ac >> 6) as usize & 1;
        let a = (self.ac & 0x3F) as i32;
        if a >= COLS as i32 {
            return None;
        }
        let col = (a - self.shift as i32).rem_euclid(COLS as i32) as usize;
        Some((row, col))
    }

    /// 5x8 bitmap of a user-defined character (codes 0-7 and 8-15).
    pub fn cg_row(&self, code: u8, row: usize) -> u8 {
        self.cgram[((code as usize & 7) << 3) | (row & 7)] & 0x1F
    }
}
