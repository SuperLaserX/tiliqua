//! The on-screen H3000 front panel: the 2 x 40 LCD and every front-panel
//! key, operated with the Tiliqua encoder.
//!
//! The encoder has two modes:
//!
//! - **knob**: turning it is the H3000's big knob; a click switches to
//!   key mode.
//! - **keys**: turning it moves a cursor over the panel keys; a click presses
//!   the selected key. Pressing a soft or function key returns to knob mode
//!   (select a parameter, then turn); digits, sign, decimal point and the
//!   up/down keys stay in key mode for further entry. Key mode also falls
//!   back to knob mode after a few seconds without encoder activity.
//! - **browse**: entered by pressing PROGRAM. Turning goes through the ROM
//!   set's programs, showing number and name above the LCD at once (the
//!   emulated H3000 is not involved); a click returns to knob mode. The
//!   selected program is loaded once it has been on show, with the encoder
//!   untouched, for 3 s, or at once on the click (see [`h3000_emu::browse`]);
//!   until it has loaded the PROGRAM key is lit.
//!
//! Holding the encoder down (half a second, without turning) enters a
//! program number from any mode: turning sets the digit (hundreds, tens,
//! ones), a click moves on to the next and the last click loads it; another
//! hold goes back to browsing. Turning with the encoder held while browsing
//! moves ten programs per detent.
//!
//! The panel never queues up input while the emulated H3000 is busy (the
//! H3500 can take most of a second over a program change): a key click
//! waits for the keypad at most `CLICK_EXPIRE_MS`, and knob turns made
//! while a program loads are dropped.
//!
//! - **cv**: entered by the CV key, sets what the control voltages on
//!   inputs 3 and 4 (in2/in3, CV1/CV2 on screen) send ([`h3000_emu::cv`]): turning changes the field in
//!   brackets (each input's MIDI controller and voltage range, then the
//!   channel), a click sets it and moves on to the next, and the last click
//!   leaves. The status line shows the inputs' voltages meanwhile; a line
//!   under the keypad always shows their controllers and values. The
//!   settings are kept with the memory once the menu is left.
//!
//! MIDI control changes press keys, turn the knob and type values into the
//! soft keys' parameters too ([`Panel::remote`], [`h3000_emu::remote`]): a
//! few presses can wait, each at most `CLICK_EXPIRE_MS`, a value being
//! typed holds every other press back, and the keys light up on the screen.
//!
//! The layout is centred on the screen and fits inside a 720 pixel circle
//! (the round Tiliqua screen). Drawing is incremental: the framebuffer keeps
//! what was drawn (persistence is off), and only what changed is redrawn,
//! which keeps the plotting traffic on the shared PSRAM low.

use h3000_emu::browse::{Browser, ProgramList, KEY_PROGRAM};
use h3000_emu::cv::{self, Settings, RANGES};
use h3000_emu::lcd::{Lcd, COLS, ROWS};
use h3000_emu::machine::{Host, H3000};
use h3000_emu::remote::{Action, Values};
use tiliqua_hal::embedded_graphics::prelude::*;
use tiliqua_lib::color::HI8;

use crate::glyphs::{self, Sheet, CH_DOWN, CH_LEFT, CH_RIGHT, CH_UP, GLYPH_H, GLYPH_W};

/// LCD character pitch on screen.
const CX: i32 = 17;
const CY: i32 = 30;
/// Character pitch of labels and text lines.
const LX: i32 = 15;
/// LCD position (top left of the first character), relative to the centre.
const LCD_X: i32 = -(COLS as i32 * CX) / 2;
const LCD_Y: i32 = -58;
/// Text lines (top), relative to the centre.
const STATUS_Y: i32 = -190;
const HELP_Y: i32 = -155;
/// The control voltage inputs' line (top), below the keypad.
const INPUTS_Y: i32 = 245;
/// Longest status line.
pub const STATUS_MAX: usize = 40;

/// Key mode times out to knob mode after this many milliseconds.
const KEY_MODE_TIMEOUT_MS: u32 = 5000;
/// A clicked key that cannot be pressed for this long (the kernel is busy)
/// is dropped.
const CLICK_EXPIRE_MS: u32 = 1500;
/// Holding the encoder down this long (without turning) is a long press.
const LONG_PRESS_MS: u32 = 500;
/// Key presses by MIDI that can wait for the keypad.
const REMOTE_QUEUE: usize = 4;
/// The CV key (not an H3000 key).
const KEY_CV: u8 = 0xF0;
/// Fields of the CV menu: each input's controller and range, the channel.
const CV_FIELDS: u8 = 5;

pub struct Button {
    pub label: &'static [u8],
    /// Switch index in the H3000 key matrix.
    pub key: u8,
    /// Stay in key mode after pressing.
    pub stay: bool,
    /// Position relative to the screen centre, and size.
    pub x: i16,
    pub y: i16,
    pub w: i16,
    pub h: i16,
}

const fn b(label: &'static [u8], key: u8, stay: bool, x: i16, y: i16, w: i16, h: i16) -> Button {
    Button { label, key, stay, x, y, w, h }
}

/// All keys, in encoder navigation order: the soft keys under their LCD
/// fields, the function keys above the LCD, the keypad below.
pub static BUTTONS: [Button; 26] = [
    b(b"SOFT 1", 7, false, -340, 12, 160, 35),
    b(b"SOFT 2", 4, false, -170, 12, 160, 35),
    b(b"SOFT 3", 6, false, 0, 12, 160, 35),
    b(b"SOFT 4", 5, false, 170, 12, 160, 35),
    b(b"PROGRAM", 8, true, -335, -116, 105, 35),
    b(b"LEVELS", 11, false, -222, -116, 105, 35),
    b(b"SETUP", 10, false, -109, -116, 105, 35),
    b(&[CH_LEFT, b'P', b'A', b'G', b'E'], 19, false, 4, -116, 105, 35),
    b(&[b'P', b'A', b'G', b'E', CH_RIGHT], 9, false, 117, -116, 105, 35),
    b(b"AUX", 24, false, 230, -116, 105, 35),
    b(&[CH_UP], 15, true, -270, 60, 110, 35),
    b(&[CH_DOWN], 23, true, -270, 105, 110, 35),
    b(b"ENTER", 3, false, 160, 60, 110, 80),
    b(b"7", 16, true, -130, 60, 80, 35),
    b(b"8", 18, true, -40, 60, 80, 35),
    b(b"9", 17, true, 50, 60, 80, 35),
    b(b"4", 20, true, -130, 105, 80, 35),
    b(b"5", 22, true, -40, 105, 80, 35),
    b(b"6", 21, true, 50, 105, 80, 35),
    b(b"1", 12, true, -130, 150, 80, 35),
    b(b"2", 14, true, -40, 150, 80, 35),
    b(b"3", 13, true, 50, 150, 80, 35),
    b(b"-", 1, true, -130, 195, 80, 35),
    b(b"0", 2, true, -40, 195, 80, 35),
    b(b".", 0, true, 50, 195, 80, 35),
    b(b"CV", KEY_CV, false, 160, 150, 110, 35),
];

#[derive(Clone, Copy, PartialEq, Eq)]
pub enum Mode {
    Knob,
    Keys,
    Browse,
    Cv,
}

pub struct Panel {
    pub mode: Mode,
    pub sel: usize,
    flash_ms: u32,
    idle_ms: u32,
    /// Key presses and program browsing.
    browser: Browser<'static>,
    /// A key clicked and not yet pressed (the kernel may be busy), and how
    /// long it has waited.
    clicked: Option<(u8, u32)>,
    /// The encoder button while it is down.
    press: Option<Press>,
    /// The click reported on release ends a long press or a turn made with
    /// the button down: ignore it.
    swallow_click: bool,
    /// Keys pressed by MIDI, oldest first, and how long the first has
    /// waited.
    remote: [u8; REMOTE_QUEUE],
    remote_len: usize,
    remote_waited: u32,
    /// The button last pressed by MIDI, lit while `flash_ms` runs.
    remote_lit: Option<usize>,
    /// Values typed into soft-key parameters by MIDI.
    values: Values,
    /// What the control voltages send, the settings in the CV menu (set
    /// field by field), and the menu's field.
    pub cv: Settings,
    cv_edit: Settings,
    cv_field: u8,
}

#[derive(Clone, Copy, Default)]
struct Press {
    ms: u32,
    turned: bool,
    long: bool,
}

impl Panel {
    /// `programs`: the ROM set's program list, for browsing.
    pub const fn new(programs: ProgramList<'static>) -> Self {
        Panel {
            mode: Mode::Knob,
            sel: 0,
            flash_ms: 0,
            idle_ms: 0,
            browser: Browser::new(programs),
            clicked: None,
            press: None,
            swallow_click: false,
            remote: [0; REMOTE_QUEUE],
            remote_len: 0,
            remote_waited: 0,
            remote_lit: None,
            values: Values::new(),
            cv: Settings::DEFAULT,
            cv_edit: Settings::DEFAULT,
            cv_field: 0,
        }
    }

    /// Whether the CV menu is on show (its settings may be changing).
    pub fn cv_menu(&self) -> bool {
        self.mode == Mode::Cv
    }

    /// A front-panel action from MIDI ([`h3000_emu::remote`]).
    pub fn remote<H: Host>(&mut self, action: Action, m: &mut H3000<'_, H>) {
        match action {
            Action::Key(key) => {
                if self.remote_len < REMOTE_QUEUE {
                    if self.remote_len == 0 {
                        self.remote_waited = 0;
                    }
                    self.remote[self.remote_len] = key;
                    self.remote_len += 1;
                }
            }
            Action::Knob(detents) => {
                // As the encoder: not while a program loads.
                if self.browser.loading().is_none() {
                    m.turn_knob(detents);
                }
            }
            Action::Value { soft, value } => self.values.set(soft, value),
        }
    }

    /// Light up the on-screen key `key` (pressed by MIDI).
    fn light(&mut self, key: u8) {
        self.remote_lit = BUTTONS.iter().position(|b| b.key == key);
        self.flash_ms = 150;
    }

    /// Handle encoder input: `ticks` and `click` as the encoder reports
    /// them, `held` the button's level. `elapsed_ms` is the time since the
    /// last call.
    pub fn update<H: Host>(&mut self, ticks: i8, click: bool, held: bool, elapsed_ms: u32, m: &mut H3000<'_, H>) {
        // Long press and turning with the button down.
        let mut long = false;
        let mut held_turn = false;
        if held {
            let p = self.press.get_or_insert(Press::default());
            p.ms = p.ms.saturating_add(elapsed_ms);
            if ticks != 0 {
                p.turned = true;
                held_turn = true;
            }
            if !p.turned && !p.long && p.ms >= LONG_PRESS_MS {
                p.long = true;
                long = true;
            }
        } else if let Some(p) = self.press.take() {
            self.swallow_click = p.turned || p.long;
        }
        let click = click && !core::mem::take(&mut self.swallow_click);
        if long {
            if self.browser.entry().is_some() {
                self.browser.cancel_entry();
            } else {
                self.clicked = None;
                self.browser.begin_entry(m);
                self.mode = Mode::Browse;
            }
        }
        self.flash_ms = self.flash_ms.saturating_sub(elapsed_ms);
        let activity = ticks != 0 || click;
        if activity {
            self.idle_ms = 0;
        } else {
            self.idle_ms = self.idle_ms.saturating_add(elapsed_ms);
        }
        let loading = self.browser.loading().is_some();
        // A value being typed by MIDI goes first: no other key in between.
        let typing = self.values.busy();
        if let Some((key, waited)) = self.clicked {
            if !loading && !typing && self.browser.keys.free(m) {
                self.browser.keys.press(m, key, 0);
                self.clicked = None;
            } else if waited >= CLICK_EXPIRE_MS {
                self.clicked = None;
            } else {
                self.clicked = Some((key, waited + elapsed_ms));
            }
        }
        if self.remote_len > 0 {
            let key = self.remote[0];
            let pressed = !loading && !typing && self.clicked.is_none() && self.browser.keys.free(m);
            if pressed {
                self.browser.keys.press(m, key, 0);
                self.light(key);
            }
            if pressed || self.remote_waited >= CLICK_EXPIRE_MS {
                self.remote.copy_within(1.., 0);
                self.remote_len -= 1;
                self.remote_waited = 0;
            } else {
                self.remote_waited += elapsed_ms;
            }
        }
        let others = self.clicked.is_some() || self.remote_len > 0;
        if (typing || (!others && self.values.pending())) && !loading && self.browser.keys.free(m) {
            if let Some(key) = self.values.next_key(&m.board.lcd) {
                self.browser.keys.press(m, key, 0);
                self.light(key);
            }
        }
        if self.mode == Mode::Browse {
            if held_turn && self.browser.entry().is_none() {
                self.browser.jump(ticks as i32);
                self.browser.update(0, click, elapsed_ms, m);
            } else {
                self.browser.update(ticks, click, elapsed_ms, m);
            }
            if !self.browser.active() {
                self.mode = Mode::Knob;
            }
            return;
        }
        self.browser.update(0, false, elapsed_ms, m);
        match self.mode {
            Mode::Knob => {
                // While a program loads the knob would only get in the way
                // (on the program page it changes the selection).
                if ticks != 0 && !loading {
                    m.turn_knob(ticks as i32);
                }
                if click {
                    self.mode = Mode::Keys;
                }
            }
            Mode::Keys => {
                let n = BUTTONS.len() as i32;
                self.sel = (self.sel as i32 + ticks as i32).rem_euclid(n) as usize;
                if click {
                    let button = &BUTTONS[self.sel];
                    self.flash_ms = 150;
                    if button.key == KEY_PROGRAM {
                        self.clicked = None;
                        self.browser.start(m);
                        self.mode = Mode::Browse;
                    } else if button.key == KEY_CV {
                        self.cv_edit = self.cv;
                        self.cv_field = 0;
                        self.mode = Mode::Cv;
                    } else {
                        self.clicked = Some((button.key, 0));
                        if !button.stay {
                            self.mode = Mode::Knob;
                        }
                    }
                }
                if self.idle_ms > KEY_MODE_TIMEOUT_MS {
                    self.mode = Mode::Knob;
                }
            }
            Mode::Cv => {
                let c = &mut self.cv_edit;
                let t = ticks as i32;
                let i = (self.cv_field / 2) as usize;
                let step = |v: u8, max: u8| (v as i32 + t).clamp(0, max as i32) as u8;
                match self.cv_field {
                    0 | 2 => c.cc[i] = step(c.cc[i], cv::OFF),
                    1 | 3 => c.range[i] = (c.range[i] as i32 + t).rem_euclid(RANGES.len() as i32) as u8,
                    _ => c.channel = step(c.channel, 15),
                }
                if click {
                    self.cv = self.cv_edit;
                    self.cv_field += 1;
                    if self.cv_field == CV_FIELDS {
                        self.mode = Mode::Knob;
                    }
                }
            }
            Mode::Browse => {}
        }
    }

    /// The line above the LCD: the encoder mode, or the program browsed or
    /// being loaded.
    fn help(&self, out: &mut heapless::Vec<u8, STATUS_MAX>) {
        out.clear();
        if self.mode == Mode::Cv {
            self.cv_help(out);
            return;
        }
        let Some((num, name)) = self.browser.selection() else {
            let text: &[u8] = match self.mode {
                Mode::Knob => b"KNOB turn:adjust click:keys hold:number",
                Mode::Keys => b"KEYS turn:select click:press hold:number",
                _ => b"PROG turn:browse click:exit hold:number",
            };
            out.extend_from_slice(text).ok();
            return;
        };
        if let Some(e) = self.browser.entry() {
            // "NUM 7[4]7  TRIPPLE TREAT     click: next"
            out.extend_from_slice(b"NUM ").ok();
            for (i, d) in e.digits.iter().enumerate() {
                if i == e.pos as usize {
                    out.extend_from_slice(&[b'[', b'0' + d, b']']).ok();
                } else {
                    out.push(b'0' + d).ok();
                }
            }
            out.extend_from_slice(b"  ").ok();
            let mut field: heapless::Vec<u8, 16> = heapless::Vec::new();
            if num != e.number() {
                // No such program: the next one is selected.
                field.extend_from_slice(b"-> ").ok();
                for d in [num / 100 % 10, num / 10 % 10, num % 10] {
                    field.push(b'0' + d as u8).ok();
                }
                field.push(b' ').ok();
            }
            for &c in name {
                if field.push(c).is_err() {
                    break;
                }
            }
            out.extend_from_slice(&field).ok();
            for _ in field.len()..18 {
                out.push(b' ').ok();
            }
            out.extend_from_slice(if e.pos == 2 { b"click: load" } else { b"click: next" }).ok();
            return;
        }
        // "PROG 152 3+ OF ME           click: load"
        out.extend_from_slice(b"PROG ").ok();
        for d in [num / 100 % 10, num / 10 % 10, num % 10] {
            out.push(b'0' + d as u8).ok();
        }
        out.push(b' ').ok();
        let name = &name[..name.len().min(16)];
        out.extend_from_slice(name).ok();
        for _ in name.len()..18 {
            out.push(b' ').ok();
        }
        let state: &[u8] = if self.browser.loading() == Some(num) {
            b"loading"
        } else if self.mode != Mode::Browse {
            b"waiting"
        } else if self.browser.pending() {
            b"click: load"
        } else {
            b"click: exit"
        };
        out.extend_from_slice(state).ok();
    }

    /// The CV menu: "CV1[CC 16] 0-5V  CV2 CC 17  +-8V   CH 1 ", the field
    /// being set in brackets.
    fn cv_help(&self, out: &mut heapless::Vec<u8, STATUS_MAX>) {
        out.clear();
        let c = &self.cv_edit;
        // Up to three digits, right-aligned.
        let digits = |v: u8| {
            let d = |x: u8, blank: bool| if blank { b' ' } else { b'0' + x % 10 };
            [d(v / 100, v < 100), d(v / 10, v < 10), b'0' + v % 10]
        };
        for n in 0..CV_FIELDS {
            let i = (n / 2) as usize;
            let mut text = [b' '; 5];
            let len = match n {
                0 | 2 => {
                    out.extend_from_slice(&[b'C', b'V', b'1' + i as u8]).ok();
                    if c.cc[i] >= cv::OFF {
                        text = *b" OFF ";
                    } else {
                        text[..2].copy_from_slice(b"CC");
                        text[2..].copy_from_slice(&digits(c.cc[i]));
                    }
                    5
                }
                1 | 3 => {
                    text[..4].copy_from_slice(RANGES[c.range[i] as usize % RANGES.len()].0);
                    4
                }
                _ => {
                    text[..2].copy_from_slice(b"CH");
                    text[2..4].copy_from_slice(&digits(c.channel + 1)[1..]);
                    4
                }
            };
            let on = self.cv_field == n;
            out.push(if on { b'[' } else { b' ' }).ok();
            out.extend_from_slice(&text[..len]).ok();
            out.push(if on { b']' } else { b' ' }).ok();
            if n == 1 || n == 3 {
                out.push(b' ').ok();
            }
        }
    }

    /// How button `i` is highlighted: 0 normal, 1 selected, 2 pressed.
    fn style(&self, i: usize) -> u8 {
        if self.mode == Mode::Keys && self.sel == i {
            if self.flash_ms > 0 { 2 } else { 1 }
        } else if self.remote_lit == Some(i) && self.flash_ms > 0 {
            2
        } else if BUTTONS[i].key == KEY_CV {
            (self.mode == Mode::Cv) as u8
        } else if BUTTONS[i].key != KEY_PROGRAM {
            0
        } else if self.browser.pending() {
            // A program is about to be loaded.
            2
        } else {
            (self.mode == Mode::Browse) as u8
        }
    }
}

pub struct Theme {
    pub hue: u8,
}

/// Cell state value that never matches a drawn cell.
const UNDRAWN: u16 = 0xFFFF;
const CELL_CURSOR_BLOCK: u16 = 0x100;
const CELL_CURSOR_LINE: u16 = 0x200;
const CELL_OFF: u16 = 0x400;

/// What is on the screen, so that only changes are drawn.
pub struct Painter {
    cx: i32,
    cy: i32,
    full: bool,
    cells: [[u16; COLS]; ROWS],
    styles: [u8; BUTTONS.len()],
    /// The line above the LCD as drawn (None: not drawn).
    help: Option<heapless::Vec<u8, STATUS_MAX>>,
    status: heapless::Vec<u8, STATUS_MAX>,
    inputs: heapless::Vec<u8, STATUS_MAX>,
    sheet_key: u32,
}

impl Painter {
    /// `width` x `height`: the display size.
    pub fn new(width: u32, height: u32) -> Self {
        Painter {
            cx: width as i32 / 2,
            cy: height as i32 / 2,
            full: true,
            cells: [[UNDRAWN; COLS]; ROWS],
            styles: [0; BUTTONS.len()],
            help: None,
            status: heapless::Vec::new(),
            inputs: heapless::Vec::new(),
            sheet_key: 0,
        }
    }

    /// Draw whatever changed since the last call. `blink` toggles at the
    /// HD44780's cursor blink rate; `inputs` is the control voltage inputs'
    /// line.
    pub fn draw<D: DrawTarget<Color = HI8>>(
        &mut self,
        d: &mut D,
        sheet: &Sheet,
        lcd: &Lcd,
        panel: &Panel,
        theme: &Theme,
        blink: bool,
        status: &[u8],
        inputs: &[u8],
    ) {
        let key = sheet.key();
        d.upload_spritesheet(key, sheet.bytes(), glyphs::SHEET_W, glyphs::SHEET_H, 1);
        if key != self.sheet_key {
            // User characters may have changed: redraw the cells showing them.
            self.sheet_key = key;
            for row in self.cells.iter_mut() {
                for cell in row.iter_mut() {
                    if *cell & 0xF0 == 0 {
                        *cell = UNDRAWN;
                    }
                }
            }
        }
        let (cx, cy) = (self.cx, self.cy);
        let frame = HI8::new(theme.hue, 5);

        if self.full {
            self.full = false;
            // LCD bezel, 8 pixels around the characters.
            let w = (COLS as i32 - 1) * CX + GLYPH_W as i32;
            let h = (ROWS as i32 - 1) * CY + GLYPH_H as i32;
            draw_rect(d, cx + LCD_X - 8, cy + LCD_Y - 8, w + 16, h + 16, frame);
            for row in self.cells.iter_mut() {
                row.fill(UNDRAWN);
            }
            for i in 0..BUTTONS.len() {
                self.styles[i] = 0xFF;
            }
            self.help = None;
            self.status.clear();
            self.status.push(0).ok();
            self.inputs.clear();
            self.inputs.push(0).ok();
        }

        // LCD characters.
        let lit = HI8::new(theme.hue, 15);
        let unlit = HI8::new(theme.hue, 2);
        let cursor = lcd.cursor();
        for row in 0..ROWS {
            for col in 0..COLS {
                let mut cell = lcd.char_at(row, col) as u16;
                if !lcd.display_on {
                    cell = CELL_OFF;
                } else if cursor == Some((row, col)) {
                    if lcd.blink_on && blink {
                        cell |= CELL_CURSOR_BLOCK;
                    } else if lcd.cursor_on {
                        cell |= CELL_CURSOR_LINE;
                    }
                }
                if self.cells[row][col] == cell {
                    continue;
                }
                self.cells[row][col] = cell;
                let x = cx + LCD_X + col as i32 * CX;
                let y = cy + LCD_Y + row as i32 * CY;
                blit(d, key, glyphs::G_ALL, x, y, unlit);
                if cell == CELL_OFF {
                    continue;
                }
                if let Some(g) = Sheet::glyph(cell as u8) {
                    blit(d, key, g, x, y, lit);
                }
                if cell & CELL_CURSOR_BLOCK != 0 {
                    blit(d, key, glyphs::G_ALL, x, y, lit);
                } else if cell & CELL_CURSOR_LINE != 0 {
                    blit(d, key, glyphs::G_CURSOR, x, y, lit);
                }
            }
        }

        // Keys.
        for (i, button) in BUTTONS.iter().enumerate() {
            let style = panel.style(i);
            if self.styles[i] == style {
                continue;
            }
            self.styles[i] = style;
            let (border, text) = match style {
                2 => (HI8::new(theme.hue.wrapping_add(4), 15), HI8::new(theme.hue.wrapping_add(4), 15)),
                1 => (HI8::new(theme.hue.wrapping_add(8), 15), HI8::new(theme.hue.wrapping_add(8), 15)),
                _ => (frame, HI8::new(theme.hue, 9)),
            };
            let (x, y, w, h) = (cx + button.x as i32, cy + button.y as i32, button.w as i32, button.h as i32);
            draw_rect(d, x, y, w, h, border);
            let tw = button.label.len() as i32 * LX - (LX - GLYPH_W as i32);
            draw_text(d, key, x + (w - tw) / 2, y + (h - GLYPH_H as i32) / 2, button.label, text);
        }

        // Mode indicator, or the program browsed.
        let mut help = heapless::Vec::new();
        panel.help(&mut help);
        if self.help.as_ref() != Some(&help) {
            let x = |n: usize| cx - (n as i32 * LX) / 2;
            if let Some(old) = self.help.as_ref() {
                erase_text(d, key, x(old.len()), cy + HELP_Y, old.len());
            }
            draw_text(d, key, x(help.len()), cy + HELP_Y, &help, HI8::new(theme.hue, 12));
            self.help = Some(help);
        }

        // Status line.
        let status = &status[..status.len().min(STATUS_MAX)];
        if self.status.as_slice() != status {
            let n = self.status.len().max(status.len());
            let x = cx - (STATUS_MAX as i32 * LX) / 2;
            erase_text(d, key, x, cy + STATUS_Y, n);
            draw_text(d, key, x, cy + STATUS_Y, status, HI8::new(theme.hue, 7));
            self.status.clear();
            self.status.extend_from_slice(status).ok();
        }

        // Control voltage inputs, centred.
        let inputs = &inputs[..inputs.len().min(STATUS_MAX)];
        if self.inputs.as_slice() != inputs {
            let x = |n: usize| cx - (n as i32 * LX) / 2;
            erase_text(d, key, x(self.inputs.len()), cy + INPUTS_Y, self.inputs.len());
            draw_text(d, key, x(inputs.len()), cy + INPUTS_Y, inputs, HI8::new(theme.hue, 9));
            self.inputs.clear();
            self.inputs.extend_from_slice(inputs).ok();
        }
    }
}

#[inline(never)]
fn blit<D: DrawTarget<Color = HI8>>(d: &mut D, key: u32, glyph: u8, x: i32, y: i32, color: HI8) {
    let (sx, sy) = Sheet::src(glyph);
    d.blit_sprite(key, sx, sy, GLYPH_W, GLYPH_H, x, y, color);
}

/// Draw `text` (glyph codes) at a pixel position.
#[inline(never)]
fn draw_text<D: DrawTarget<Color = HI8>>(d: &mut D, key: u32, x: i32, y: i32, text: &[u8], color: HI8) {
    for (i, &c) in text.iter().enumerate() {
        if let Some(g) = Sheet::glyph(c) {
            blit(d, key, g, x + i as i32 * LX, y, color);
        }
    }
}

/// Clear `n` text positions (the glyph dots; the gaps are never drawn).
#[inline(never)]
fn erase_text<D: DrawTarget<Color = HI8>>(d: &mut D, key: u32, x: i32, y: i32, n: usize) {
    for i in 0..n {
        blit(d, key, glyphs::G_ALL, x + i as i32 * LX, y, HI8::new(0, 0));
    }
}

#[inline(never)]
fn draw_rect<D: DrawTarget<Color = HI8>>(d: &mut D, x: i32, y: i32, w: i32, h: i32, color: HI8) {
    d.draw_line_solid(x, y, x + w, y, 1, color);
    d.draw_line_solid(x + w, y, x + w, y + h, 1, color);
    d.draw_line_solid(x + w, y + h, x, y + h, 1, color);
    d.draw_line_solid(x, y + h, x, y, 1, color);
}
