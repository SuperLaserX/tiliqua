//! FairWave's firmware: oscillators, envelopes, LFOs, the matrix and the mixer play, all in
//! gateware at audio rate, and the screens edit them and keep patches in flash. The screens still
//! to come are placeholders with the input meters (README.md).
//!
//! The timer interrupt runs the controls, every `TIMER0_ISR_PERIOD_MS`: the encoder and, when
//! an edit changes the patch, the words that tell the gateware. The main loop draws from a
//! snapshot of all that, does what the Patches screen asks (flash is slow, and mustn't hold up
//! the controls), and logs a line now and then. The serial port (the USB debug port, 115200)
//! carries the boot steps and that line.

#![no_std]
#![no_main]

use core::cell::RefCell;
use core::fmt::Write;
use core::sync::atomic::{AtomicU32, Ordering};

use critical_section::Mutex;
use guh_dma::DmaBuf;
use heapless::{String, Vec};
use irq::handler;
use log::{info, warn};
use riscv_rt::entry;
use tiliqua_hal::embedded_graphics::prelude::*;

use fairwave_cpu::browser::{self, BrowserAction, BrowserCursor, DrivePath, Library};
use fairwave_cpu::disk::{Entry, HOME_FOLDER, MAX_ENTRIES};
use fairwave_cpu::nav::{Event, Nav, Page};
use fairwave_cpu::pages::{self, CrossRow, MixRow, ModCursor, PatchAction, PatchCursor, WaveRow, ROUTE_CELLS};
use fairwave_cpu::patch::{self, adjust, Cursor, Patch, Row, N_LAYERS};
use fairwave_cpu::patchfile::{self, PatchFile};
use fairwave_cpu::presets;
use fairwave_cpu::store::{Saved, Store, TableFile, N_PATCHES, N_TABLES, WINDOW_BYTES};
use fairwave_cpu::wave::{Line, DEFAULT_TRACES};
use fairwave_cpu::wav;
use hal::pmod::EurorackPmod;
use pac::constants::*;
use tiliqua_fw::engine::{clean_dcache, Engine};
use tiliqua_fw::flash::FlashPort;
use tiliqua_fw::glyphs::{self, Face, Glyphs, SHEET_BYTES};
use tiliqua_fw::input::Input;
use tiliqua_fw::screen::{clear_framebuffer, BrowserView, Fill, PatchesView, Screen, View};
use tiliqua_fw::tables::{self, MAX_TABLES};
use tiliqua_fw::usb::{Drive, DriveEvent};
use tiliqua_fw::theme;
use tiliqua_fw::*;
use tiliqua_hal as hal;
use tiliqua_lib::*;
use tiliqua_pac as pac;

const TIMER0_ISR_PERIOD_MS: u32 = 5;
/// Screen updates per second at most (each draws only what changed).
const DRAW_MS: u32 = 33;
/// How often the status line and the log's numbers change.
const STATUS_MS: u32 = 1000;
/// The serial line, this often: at 115200 it costs the main loop about 6 ms.
const LOG_MS: u32 = 5000;
/// Clocks a sample has at 48 kHz, for the status line.
const SAMPLE_CLOCKS: u32 = CLOCK_SYNC_HZ / AUDIO_FS;

const _: () = assert!(N_TABLES == MAX_TABLES);
const _: () = assert!(WINDOW_BYTES as usize == PATCH_WINDOW);

/// The controls: the interrupt's state, and all the main loop reads of it.
struct App {
    encoder: Encoder0,
    input: Input,
    pmod: EurorackPmod0,
    engine: Engine,
    nav: Nav,
    cursor: Cursor,
    mod_cursor: ModCursor,
    route_cursor: pages::Cursor,
    mix_cursor: pages::Cursor,
    patch_cursor: PatchCursor,
    wave_cursor: pages::Cursor,
    wave_traces: usize,
    cross_cursor: pages::Cursor,
    /// What the Patches screen has asked for: the main loop does it.
    requested: Option<(PatchAction, usize)>,
    patches: PatchesView,
    /// The patch last loaded or saved, to tell if it has been edited since.
    current: Option<Saved>,
    /// The tables' frame lengths as built, for INIT.
    built_frames: [u8; N_TABLES],
    patch: Patch,
    library: Library,
    browser_cursor: BrowserCursor,
    /// What the Browser has asked to open: the main loop does it.
    browser_open: Option<usize>,
    audition: Option<Audition>,
    /// The files a patch's tables came from, still to be found: the main loop looks for them.
    missing: [TableFile; N_LAYERS],
    /// Whether the drive has been tried for them, since they went missing or it was plugged in.
    missing_tried: bool,
    words: patch::Words,
    clocks_max: u32,
    samples: u32,
}

/// A file being tried out: which oscillator is playing it, and what that one played before.
#[derive(Clone, Copy)]
struct Audition {
    layer: usize,
    previous: u8,
}

impl App {
    fn table_index(&self, layer: usize) -> usize {
        (self.patch.layers[layer].table as usize).min(self.library.n - 1)
    }

    /// Puts a table just loaded on the oscillator showing, as a preview.
    fn begin_preview(&mut self, table: usize) {
        let layer = self.cursor.layer;
        self.audition = Some(Audition { layer, previous: self.patch.layers[layer].table });
        self.patch.layers[layer].table = table as u8;
        self.browser_cursor.enter_preview();
        self.apply();
    }

    /// A preview over: kept, or put back as it was with the memory given back.
    fn end_preview(&mut self, keep: bool) {
        if let Some(a) = self.audition.take() {
            if !keep {
                let newest = self.library.n as u8 - 1;
                for l in self.patch.layers.iter_mut() {
                    if l.table == newest {
                        l.table = a.previous;
                    }
                }
                self.library.discard_newest();
            }
        }
        self.browser_cursor.leave_preview();
    }

    fn browser_action(&mut self, action: BrowserAction) {
        match action {
            BrowserAction::Open(i) => self.browser_open = Some(i),
            BrowserAction::Keep => self.end_preview(true),
            BrowserAction::Discard => self.end_preview(false),
            BrowserAction::Frame(n) => self.change_frame_len(n),
            BrowserAction::Osc(n) => {
                if let Some(a) = self.audition.as_mut() {
                    let table = self.patch.layers[a.layer].table;
                    self.patch.layers[a.layer].table = a.previous;
                    a.layer = (a.layer as i32 + n).rem_euclid(N_LAYERS as i32) as usize;
                    a.previous = self.patch.layers[a.layer].table;
                    self.patch.layers[a.layer].table = table;
                    self.cursor.layer = a.layer;
                }
            }
        }
    }

    /// Reads the table the oscillator showing plays with another frame length.
    fn change_frame_len(&mut self, detents: i32) {
        let t = self.table_index(self.cursor.layer);
        let to = patch::adjust_frame_len(&self.library.tables[t], detents, self.library.samples[t]);
        self.library.reshape(t, to.frame_log2);
    }

    /// Applies an encoder event to the oscillators screen.
    fn edit_oscillators(&mut self, event: Event) {
        match event {
            Event::Click => self.cursor.click(),
            Event::Turn(n) if self.cursor.editing => {
                let row = self.cursor.current_row();
                if row == Row::Frame {
                    self.change_frame_len(n);
                } else {
                    adjust(&mut self.patch.layers[self.cursor.layer], row, n, self.library.n as u8);
                }
            }
            Event::Turn(n) => self.cursor.turn(n),
            Event::Hold => {}
        }
    }

    /// All of what a patch keeps, as things stand.
    fn saved(&self) -> Saved {
        let lib = &self.library;
        let mut patch = self.patch;
        let mut files = [TableFile::NONE; N_LAYERS];
        for (l, file) in files.iter_mut().enumerate() {
            let t = self.table_index(l);
            if lib.is_loaded(t) {
                *file = TableFile { frame_log2: lib.tables[t].frame_log2, ..lib.files[t] };
                // (its number means nothing after a reboot: the file says which)
                patch.layers[l].table = 0;
            }
        }
        // A table still being looked for is still this patch's.
        for (l, m) in self.missing.iter().enumerate() {
            if !m.is_none() {
                files[l] = *m;
                patch.layers[l].table = 0;
            }
        }
        let frame_log2 = core::array::from_fn(|i| if i < lib.built() { lib.tables[i].frame_log2 } else { 0 });
        Saved { patch, frame_log2, files }
    }

    /// Makes `saved` the patch playing.
    fn restore(&mut self, saved: &Saved) {
        self.end_preview(false);
        self.patch = saved.patch;
        let lib = &mut self.library;
        for i in 0..lib.built() {
            if saved.frame_log2[i] != 0 {
                lib.reshape(i, saved.frame_log2[i]);
            }
        }
        self.missing = [TableFile::NONE; N_LAYERS];
        self.missing_tried = false;
        for (l, file) in saved.files.iter().enumerate() {
            if file.is_none() {
                continue;
            }
            match lib.find_file(file.path()) {
                Some(t) => {
                    self.patch.layers[l].table = t as u8;
                    if file.frame_log2 != 0 {
                        lib.reshape(t, file.frame_log2);
                    }
                }
                None => self.missing[l] = *file,
            }
        }
        self.apply();
    }

    /// Applies an encoder event to whichever screen is showing.
    fn edit(&mut self, event: Event) {
        let (list, cells) = match self.nav.page() {
            Page::Oscillators => return self.edit_oscillators(event),
            Page::Browser => {
                if let Some(action) = self.browser_cursor.event(event) {
                    self.browser_action(action);
                }
                return;
            }
            Page::Patches => {
                let used = self.patches.used[self.patch_cursor.in_bank()];
                if let Some(request) = self.patch_cursor.event(event, used) {
                    self.requested = Some(request);
                }
                return;
            }
            Page::Envelopes => return self.mod_cursor.event(event, &mut self.patch),
            Page::Routing => (&mut self.route_cursor, ROUTE_CELLS),
            Page::Mixer => (&mut self.mix_cursor, MixRow::ALL.len()),
            Page::Wave => (&mut self.wave_cursor, WaveRow::ALL.len()),
            Page::Cross => (&mut self.cross_cursor, CrossRow::ALL.len()),
        };
        match event {
            Event::Click => list.click(),
            Event::Turn(n) if !list.editing => list.turn(n, cells),
            Event::Turn(n) => {
                let at = list.at;
                match self.nav.page() {
                    Page::Routing => pages::adjust_route(&mut self.patch, at, n),
                    // (the oscillators screen's layer: both follow the same oscillator)
                    Page::Wave => pages::adjust_wave(&mut self.patch, &mut self.cursor.layer, &mut self.wave_traces,
                                                     WaveRow::ALL[at], n, self.library.n as u8),
                    Page::Cross => pages::adjust_cross(&mut self.patch, CrossRow::ALL[at], n),
                    _ => pages::adjust_mix(&mut self.patch, MixRow::ALL[at], n),
                }
            }
            Event::Hold => {}
        }
    }

    /// Whether a patch is still waiting for its tables to be looked for: until they come it would
    /// only play the wrong one.
    fn awaiting_tables(&self) -> bool {
        !self.missing_tried && self.audition.is_none() && self.missing.iter().any(|m| !m.is_none())
    }

    /// Tells the gateware the patch.
    fn apply(&mut self) {
        let tables = core::array::from_fn(|i| self.library.tables[self.table_index(i)]);
        let mips = core::array::from_fn(|i| self.library.mips[self.table_index(i)]);
        self.words = self.patch.words(&tables, &mips, AUDIO_FS);
        if self.awaiting_tables() {
            self.words.hush();
        }
        self.engine.apply(&self.words);
    }

    fn tick(&mut self) {
        let pressed = unsafe { pac::ENCODER0::steal() }.button().read().bits() != 0;
        let mut events: Vec<Event, 4> = Vec::new();
        self.input.poll(&mut self.encoder, pressed, TIMER0_ISR_PERIOD_MS, &mut events);
        let mut edited = false;
        for e in events {
            if let Some(e) = self.nav.handle(e) {
                self.edit(e);
                edited = true;
            }
        }
        if edited {
            self.apply();
        }
        self.engine.route(self.words.routing, self.pmod.jack());
    }

    /// The engine's statistics; called from the main loop, as a read clears them.
    fn poll_stats(&mut self) {
        let s = self.engine.stats();
        self.clocks_max = s.clocks_max as u32;
        self.samples = s.samples as u32;
    }
}

static APP: Mutex<RefCell<Option<App>>> = Mutex::new(RefCell::new(None));

/// Milliseconds since the timer started, as the tick counts them. (Load and
/// store only: rv32im has no atomic read-modify-write, and the interrupt is the
/// only writer.)
static UPTIME_MS: AtomicU32 = AtomicU32::new(0);

fn uptime_ms() -> u32 {
    UPTIME_MS.load(Ordering::Relaxed)
}

fn timer0_handler() {
    UPTIME_MS.store(uptime_ms().wrapping_add(TIMER0_ISR_PERIOD_MS), Ordering::Relaxed);
    critical_section::with(|cs| {
        if let Some(app) = APP.borrow_ref_mut(cs).as_mut() {
            app.tick();
        }
    });
}

/// What the main loop needs from the boot.
/// What `boot` hands the main loop.
struct Booted {
    timer: Timer0,
    display: DMAFramebuffer0,
    fill: Fill,
    fb_words: usize,
    store: Option<Store<FlashPort>>,
}

#[entry]
fn main() -> ! {
    tiliqua_fw::stack::paint();
    let booted = boot();
    run(booted)
}

/// Peripherals, the screen and the tables (the App is left in APP). Not inlined: its
/// temporaries are off the stack before the main loop starts.
#[inline(never)]
fn boot() -> Booted {
    let peripherals = pac::Peripherals::take().unwrap();

    let serial = Serial0::new(peripherals.UART0);
    tiliqua_fw::handlers::logger_init(serial);
    unsafe { log::set_max_level_racy(log::LevelFilter::Info) };
    info!("boot: FairWave {} at {} Hz", UI_TAG, AUDIO_FS);

    let sysclk = pac::clock::sysclk();
    let timer = Timer0::new(peripherals.TIMER0, sysclk);

    let bootinfo = unsafe { bootinfo::BootInfo::from_addr(BOOTINFO_BASE) }.unwrap();
    let window = if PATCHES_IN_PSRAM {
        Some(0..WINDOW_BYTES)
    } else {
        bootinfo.manifest.get_option_storage_window().filter(|w| w.end - w.start >= WINDOW_BYTES)
    };
    let modeline = bootinfo.modeline.maybe_override_fixed(FIXED_MODELINE, CLOCK_DVI_HZ);
    let fb_words = modeline.h_active as usize * modeline.v_active as usize / 4;
    let mut fill = Fill::new(peripherals.FILL);
    let mut display = DMAFramebuffer0::new(
        peripherals.FRAMEBUFFER_PERIPH,
        peripherals.PALETTE_PERIPH,
        peripherals.BLIT,
        peripherals.PIXEL_PLOT,
        peripherals.LINE,
        PSRAM_FB_BASE,
        modeline.clone(),
        BLIT_MEM_BASE,
    );
    info!("boot: display {} x {}", display.size().width, display.size().height);

    // The theme, a blank screen (whatever the bootloader left), and the UI's
    // font sheet in the blitter: never replaced, so no other text drawing
    // (embedded-graphics' would upload its own sheet). The sheet is rendered in
    // free PSRAM: 4.7 KB the block RAM (data and stack) can't spare.
    theme::write_palette(&mut display);
    clear_framebuffer(&mut display, &mut fill, fb_words);
    let scratch = PSRAM_BASE + PSRAM_UI_SCRATCH;
    let glyph_sheet = Glyphs::new(unsafe { &mut *(scratch as *mut [u8; SHEET_BYTES]) });
    if !glyph_sheet.upload(&mut display) {
        warn!("boot: font sheet too large for the blitter");
    }
    info!("boot: screen ready");

    let mut i2cdev1 = I2c1::new(peripherals.I2C1);
    let mut pmod = EurorackPmod0::new(peripherals.PMOD0_PERIPH);
    calibration::CalibrationConstants::load_or_default(&mut i2cdev1, &mut pmod);
    info!("boot: codec calibration loaded");

    // (a moment's work, in which there is nothing else to show)
    let text = "building tables";
    let (x, y) = (display.size().width as i32 / 2 - glyphs::width(Face::Text, text.len()) / 2,
                  display.size().height as i32 / 2);
    glyphs::draw(&mut display, Face::Text, x, y, text, theme::DIM);
    let mut library = Library::new(tables::pool());
    tables::build(&mut library);
    assert!(library.n > 0, "no tables");
    info!("boot: {} tables ready", library.n);

    let flash = SPIFlash0::new(peripherals.SPIFLASH_CTRL, SPIFLASH_BASE, SPIFLASH_SZ_BYTES);
    let mut store = window.map(|w| Store::new(FlashPort(flash), w.start));
    let patches = PatchesView {
        available: store.is_some(),
        used: core::array::from_fn(|i| store.as_ref().is_some_and(|s| s.used(i))),
        current: None,
        edited: false,
        note: String::new(),
    };
    let built_frames: [u8; N_TABLES] =
        core::array::from_fn(|i| if i < library.n { library.tables[i].frame_log2 } else { 0 });
    let patch = Patch::default();
    let newest = store.as_ref().and_then(|s| s.newest());
    let saved = match (store.as_mut(), newest) {
        (Some(s), Some(n)) => s.load(n),
        _ => None,
    };

    let n = library.n;
    let tables = core::array::from_fn(|i| library.tables[(patch.layers[i].table as usize).min(n - 1)]);
    let words = patch.words(&tables, &[0; N_LAYERS], AUDIO_FS);
    let mut engine = Engine::new(peripherals.WAVESCAN);
    engine.route(words.routing, pmod.jack());
    engine.apply(&words);
    info!("boot: patch written");
    let mut app = App {
        encoder: Encoder0::new(peripherals.ENCODER0),
        input: Input::default(),
        pmod,
        engine,
        nav: Nav::default(),
        cursor: Cursor::default(),
        mod_cursor: ModCursor::default(),
        route_cursor: pages::Cursor::default(),
        mix_cursor: pages::Cursor::default(),
        patch_cursor: PatchCursor { patch: newest.unwrap_or(0), action: None },
        wave_cursor: pages::Cursor::default(),
        wave_traces: DEFAULT_TRACES,
        cross_cursor: pages::Cursor::default(),
        requested: None,
        patches,
        current: None,
        built_frames,
        patch,
        library,
        browser_cursor: BrowserCursor::default(),
        browser_open: None,
        audition: None,
        missing: [TableFile::NONE; N_LAYERS],
        missing_tried: false,
        words,
        clocks_max: 0,
        samples: 0,
    };
    // The patch saved last is what plays, if there is one.
    if let (Some(saved), Some(n)) = (saved, newest) {
        info!("boot: patch {}", n + 1);
        app.restore(&saved);
        app.patches.current = Some(n);
        app.current = Some(saved);
    }
    critical_section::with(|cs| APP.borrow(cs).replace(Some(app)));
    Booted { timer, display, fill, fb_words, store }
}

/// What a table's loading says when the pool is full.
const NO_ROOM: &str = "NO ROOM FOR THIS TABLE";

/// Reads a file to the start of the pool, where nothing stays. The bytes are there until the next read.
fn read_whole(drive: &mut Drive, path: &str) -> Result<&'static [u8], &'static str> {
    let base = PSRAM_BASE + PSRAM_POOL_BASE;
    let staging = unsafe { DmaBuf::from_raw_parts(base as *mut u8, PSRAM_USB_WINDOW) };
    let size = drive.read_file(path, staging).map_err(|e| e.text())?;
    Ok(unsafe { core::slice::from_raw_parts(base as *const u8, size) })
}

/// Reads a patch file.
fn read_patch(drive: &mut Drive, path: &str) -> Result<PatchFile, &'static str> {
    let bytes = read_whole(drive, path)?;
    if bytes.len() > patchfile::MAX_BYTES {
        return Err("TOO LONG FOR A PATCH");
    }
    patchfile::parse(bytes, AUDIO_FS).map_err(|_| "NOT A PATCH THIS CAN READ")
}

/// Reads a file to the start of the pool and converts it into a new table in the library.
fn load_table(drive: &mut Drive, path: &str, name: &str) -> Result<usize, &'static str> {
    let file = read_whole(drive, path)?;
    let w = wav::parse(file).map_err(|_| "NOT A WAV THIS CAN READ")?;
    let shape = browser::shape_of(&w).ok_or("SHORTER THAN A FRAME")?;
    let table = critical_section::with(|cs| {
        let mut app = APP.borrow_ref_mut(cs);
        let app = app.as_mut().unwrap();
        let t = { let App { library, patch, .. } = app; library.make_room(shape, &mut patch.layers) };
        app.apply();
        t
    }).ok_or(NO_ROOM)?;
    wav::convert(file, &w, tables::slice(&table));
    clean_dcache(PSRAM_BASE + table.offset, table.bytes());
    // (the same line the tables made at boot log: `tools/check_sim.py` reads it)
    info!("table {}: {} frames of {} samples at {:#x}", name, table.frames, table.frame_len(), table.offset);
    let from = TableFile::new(path, table.frame_log2);
    critical_section::with(|cs| {
        APP.borrow_ref_mut(cs).as_mut().unwrap().library.add_loaded(name, table, table.samples(), from)
    }).ok_or(NO_ROOM)
}

/// What the Browser shows of the drive, and the work it asks for. All in the main loop: reading
/// blocks, and the screen has to have said so first.
struct Shelf {
    entries: &'static mut [Entry],
    count: usize,
    path: DrivePath,
    /// The folder of ours on this drive, if it has one, in short names; else the root.
    home: String<{ fairwave_cpu::store::PATH_BYTES }>,
    detail: String<40>,
    note: String<40>,
    /// A row to load once the screen has said it is loading.
    load: Option<usize>,
    /// Whether the screen has been drawn since `load` was set.
    drawn: bool,
    /// The row `detail` describes, and when the highlight last moved.
    described: Option<usize>,
    at: usize,
    moved_ms: u32,
}

impl Shelf {
    fn new() -> Shelf {
        let entries = unsafe {
            core::slice::from_raw_parts_mut((PSRAM_BASE + PSRAM_UI_SCRATCH + 0x90000) as *mut Entry, MAX_ENTRIES)
        };
        Shelf { entries, count: 0, path: DrivePath::default(), home: String::new(), detail: String::new(),
                note: String::new(), load: None, drawn: false, described: None, at: 0, moved_ms: 0 }
    }

    fn view(&self, cursor: BrowserCursor, drive: &Drive, preview_name: String<11>) -> BrowserView {
        let mut path = String::new();
        // (one short of the label: it starts with a slash)
        path.push_str(self.path.shown(path.capacity() - 1)).ok();
        BrowserView {
            cursor,
            entries: unsafe { core::slice::from_raw_parts(self.entries.as_ptr(), self.count) },
            drive: drive.state.text(),
            path,
            detail: self.detail.clone(),
            note: self.note.clone(),
            preview_name,
        }
    }

    fn set_note(&mut self, text: &str) {
        self.note.clear();
        self.note.push_str(text).ok();
    }

    /// Lists the folder it is on, the highlight at the top.
    fn relist(&mut self, drive: &mut Drive) {
        self.described = None;
        self.detail.clear();
        self.count = match drive.list(self.path.as_str(), self.entries) {
            Ok(n) => n,
            Err(e) => {
                warn!("drive: {:?} listing '{}'", e, self.path.as_str());
                self.set_note(e.text());
                0
            }
        };
        info!("drive: '{}' lists {}", self.path.as_str(), self.count);
        let count = self.count;
        critical_section::with(|cs| {
            let mut app = APP.borrow_ref_mut(cs);
            let c = &mut app.as_mut().unwrap().browser_cursor;
            c.rows = count;
            c.at = 0;
        });
    }

    fn open(&mut self, drive: &mut Drive, row: usize) {
        if row >= self.count {
            return;
        }
        let e = self.entries[row];
        self.note.clear();
        if e.is_up() {
            self.path.up();
            self.relist(drive);
        } else if e.is_dir {
            if self.path.enter(e.short(), e.name()) {
                self.relist(drive);
            } else {
                self.set_note("FOLDERS TOO DEEP");
            }
        } else {
            let mut text: String<40> = String::new();
            write!(text, "LOADING {}", e.name()).ok();
            self.note = text;
            self.load = Some(row);
            self.drawn = false;
        }
    }

    /// Starts on the drive's folder of ours, if it has one.
    fn go_home(&mut self, drive: &mut Drive) {
        self.path.clear();
        self.home.clear();
        if let Ok(e) = drive.find(HOME_FOLDER) {
            if e.is_dir && self.path.enter(e.short(), e.name()) {
                self.home.push_str(e.short()).ok();
            }
        }
    }

    /// Where a table a patch file names is: beside the patch, or from our folder. If neither, its own
    /// name, so that what's missing can be said.
    fn locate(&self, drive: &mut Drive, name: &str, frame_log2: u8) -> TableFile {
        for from in [self.path.as_str(), self.home.as_str()] {
            if let Ok(path) = drive.resolve(from, name) {
                if drive.find(path.as_str()).is_ok_and(|e| !e.is_dir) {
                    return TableFile::new(path.as_str(), frame_log2);
                }
            }
        }
        TableFile::new(name.rsplit('/').next().unwrap_or(name), frame_log2)
    }

    /// Plays a patch file: its tables follow from the drive, the outputs quiet until they have.
    fn load_patch_file(&mut self, drive: &mut Drive, path: &str, shown: &str) {
        let file = match read_patch(drive, path) {
            Ok(file) => file,
            Err(why) => {
                warn!("{}: {}", shown, why);
                self.set_note(why);
                return;
            }
        };
        if file.skipped != 0 {
            warn!("{}: {} lines not understood, the first is line {}", shown, file.skipped, file.first_skipped);
        }
        // (the built-in tables by name first: those need no drive)
        let (built_frames, built_names): ([u8; N_TABLES], [Option<usize>; N_LAYERS]) = critical_section::with(|cs| {
            let app = APP.borrow_ref(cs);
            let app = app.as_ref().unwrap();
            (app.built_frames, core::array::from_fn(|l| app.library.find_built(file.tables[l].as_str())))
        });
        let mut saved = Saved { patch: file.patch, frame_log2: built_frames, files: [TableFile::NONE; N_LAYERS] };
        for l in 0..N_LAYERS {
            let name = file.tables[l].as_str();
            if name.is_empty() {
                continue;
            }
            if let Some(t) = built_names[l] {
                saved.patch.layers[l].table = t as u8;
                if file.frame_log2[l] != 0 {
                    saved.frame_log2[t] = file.frame_log2[l];
                }
            } else {
                saved.files[l] = self.locate(drive, name, file.frame_log2[l]);
                saved.patch.layers[l].table = 0;
            }
        }
        let mut note: String<24> = String::new();
        write!(note, "LOADED {}", if file.name.is_empty() { shown } else { file.name.as_str() }).ok();
        critical_section::with(|cs| {
            let mut app = APP.borrow_ref_mut(cs);
            let app = app.as_mut().unwrap();
            app.restore(&saved);
            // (nothing in flash holds this: saving it is the Patches screen's to do)
            app.current = None;
            app.patches.current = None;
            app.patches.note = note.clone();
        });
        info!("patch file {}: {}", path, note.as_str());
        self.note.clear();
        if file.skipped != 0 {
            write!(self.note, "{} LINES NOT UNDERSTOOD", file.skipped).ok();
        } else {
            self.note.push_str(note.as_str()).ok();
        }
    }

    fn load_row(&mut self, drive: &mut Drive, row: usize) {
        let e = self.entries[row];
        let Some(path) = self.path.of(e.short()) else {
            self.set_note("PATH TOO LONG");
            return;
        };
        if e.is_patch() {
            self.note.clear();
            self.load_patch_file(drive, path.as_str(), e.name());
            return;
        }
        let name = browser::table_name(e.name());
        self.note.clear();
        match load_table(drive, path.as_str(), name.as_str()) {
            Ok(table) => {
                critical_section::with(|cs| APP.borrow_ref_mut(cs).as_mut().unwrap().begin_preview(table));
            }
            Err(why) => {
                warn!("{}: {}", e.name(), why);
                self.set_note(why);
            }
        }
    }

    /// Says what the highlighted file is, once the highlight has stopped moving.
    fn describe(&mut self, drive: &mut Drive, now: u32) {
        const SETTLE_MS: u32 = 150;
        if self.described == Some(self.at) || now.wrapping_sub(self.moved_ms) < SETTLE_MS || self.at >= self.count {
            return;
        }
        self.described = Some(self.at);
        self.detail.clear();
        let e = self.entries[self.at];
        if e.is_dir {
            return;
        }
        let Some(path) = self.path.of(e.short()) else { return };
        let mut head = [0u8; 1024];
        let looked = drive.peek(path.as_str(), &mut head).ok();
        if e.is_patch() {
            // (what a patch is about is the first thing in it, as far as anyone is checking)
            let about = looked.and_then(|(_, got)| patchfile::parse(&head[..got], AUDIO_FS).ok());
            let text = match &about {
                Some(f) if !f.about.is_empty() => f.about.as_str(),
                Some(_) => "A PATCH",
                None => "NOT A PATCH THIS CAN READ",
            };
            self.detail.push_str(text).ok();
            return;
        }
        let summary = looked.and_then(|(size, got)| {
            let w = wav::parse_head(&head[..got], size).ok()?;
            let (len, guessed) = wav::frame_len(&w);
            Some(browser::wav_summary(&w, len, guessed))
        });
        match summary {
            Some(s) => self.detail = s,
            None => {
                write!(self.detail, "{} KB, NOT A TABLE THIS CAN READ", e.size / 1024).ok();
            }
        }
    }

    /// Looks for the tables a loaded patch needs.
    fn find_missing(&mut self, drive: &mut Drive) {
        let wanted = critical_section::with(|cs| {
            let mut app = APP.borrow_ref_mut(cs);
            let app = app.as_mut().unwrap();
            if app.missing_tried || app.audition.is_some() {
                return None;
            }
            let l = app.missing.iter().position(|m| !m.is_none())?;
            let file = app.missing[l];
            // Both layers may want the one file.
            if let Some(t) = app.library.find_file(file.path()) {
                app.patch.layers[l].table = t as u8;
                app.missing[l] = TableFile::NONE;
                app.apply();
                return None;
            }
            Some((l, file))
        });
        let Some((l, file)) = wanted else { return };
        // (a patch keeps the short path; the table goes by the name the Browser would have given it)
        let found = drive.find(file.path()).ok();
        let name = browser::table_name(found.as_ref().map_or(file.short_name(), Entry::name));
        let mut result = load_table(drive, file.path(), name.as_str());
        if result == Err(NO_ROOM) {
            // The other oscillator's table can be in the way, at the top of the pool: both can load
            // again from the bottom of it.
            critical_section::with(|cs| {
                let mut app = APP.borrow_ref_mut(cs);
                let App { library, patch, missing, .. } = app.as_mut().unwrap();
                library.let_all_go(&mut patch.layers, missing);
            });
            result = load_table(drive, file.path(), name.as_str());
        }
        let failed = critical_section::with(|cs| {
            let mut app = APP.borrow_ref_mut(cs);
            let app = app.as_mut().unwrap();
            let mut note: String<24> = String::new();
            let failed = match result {
                Ok(t) => {
                    if file.frame_log2 != 0 {
                        app.library.reshape(t, file.frame_log2);
                    }
                    app.patch.layers[l].table = t as u8;
                    app.missing[l] = TableFile::NONE;
                    write!(note, "LOADED {}", name).ok();
                    false
                }
                Err(_) => {
                    write!(note, "NEEDS {}", file.short_name()).ok();
                    app.missing_tried = true;
                    true
                }
            };
            app.apply();
            let shown = note.clone();
            app.patches.note = note;
            failed.then_some(shown)
        });
        if let Some(note) = failed {
            warn!("{}", note.as_str());
            self.set_note(note.as_str());
        }
    }

    /// With no drive to look on, says what a loaded patch is missing. It looks when one arrives.
    fn say_missing(&self) {
        critical_section::with(|cs| {
            let mut app = APP.borrow_ref_mut(cs);
            let app = app.as_mut().unwrap();
            if app.missing_tried {
                return;
            }
            if let Some(file) = app.missing.iter().find(|m| !m.is_none()).copied() {
                let mut note: String<24> = String::new();
                write!(note, "NEEDS {}", file.short_name()).ok();
                app.patches.note = note;
                app.missing_tried = true;
                app.apply();
            }
        });
    }

    /// The Browser's and the drive's work, a piece each time round the main loop.
    fn tend(&mut self, drive: &mut Drive, now: u32) {
        match drive.poll(now) {
            Some(DriveEvent::Mounted) => {
                self.go_home(drive);
                self.note.clear();
                self.relist(drive);
                critical_section::with(|cs| APP.borrow_ref_mut(cs).as_mut().unwrap().missing_tried = false);
            }
            Some(DriveEvent::Gone) => {
                self.count = 0;
                self.path.clear();
                self.home.clear();
                self.detail.clear();
                self.note.clear();
                self.load = None;
                self.described = None;
                critical_section::with(|cs| {
                    let mut app = APP.borrow_ref_mut(cs);
                    let c = &mut app.as_mut().unwrap().browser_cursor;
                    c.rows = 0;
                    c.at = 0;
                });
            }
            None => {}
        }
        if !drive.is_ready() {
            self.say_missing();
            return;
        }
        if let (Some(row), true) = (self.load, self.drawn) {
            self.load = None;
            self.load_row(drive, row);
            return;
        }
        let (open, cursor, page) = critical_section::with(|cs| {
            let mut app = APP.borrow_ref_mut(cs);
            let app = app.as_mut().unwrap();
            (app.browser_open.take(), app.browser_cursor, app.nav.page())
        });
        if let Some(row) = open {
            self.open(drive, row);
            return;
        }
        if cursor.at != self.at {
            self.at = cursor.at;
            self.moved_ms = now;
            self.detail.clear();
            self.described = None;
            self.note.clear();
        }
        if page == Page::Browser && cursor.preview.is_none() {
            self.describe(drive, now);
        }
        self.find_missing(drive);
    }
}

/// Does what the Patches screen asked: the flash's part outside the critical section, as a sector
/// erase takes a moment and the controls must go on.
fn do_patch_request(store: &mut Option<Store<FlashPort>>, action: PatchAction, n: usize) {
    let with_app = |f: &mut dyn FnMut(&mut App)| {
        critical_section::with(|cs| {
            let mut app = APP.borrow_ref_mut(cs);
            f(app.as_mut().unwrap());
        });
    };
    let mut note: String<24> = String::new();
    match (action, store.as_mut()) {
        (PatchAction::Back, _) => {}
        (PatchAction::Load, _) if n >= N_PATCHES => {
            let name = presets::NAMES[n - N_PATCHES];
            with_app(&mut |app| {
                let saved = Saved { patch: presets::preset(n - N_PATCHES), frame_log2: app.built_frames,
                                    files: [TableFile::NONE; N_LAYERS] };
                app.restore(&saved);
                app.current = Some(saved);
                app.patches.current = Some(n);
            });
            write!(note, "LOADED {}", name).ok();
        }
        (PatchAction::Save | PatchAction::Erase, _) if n >= N_PATCHES => {
            note.push_str("THE FACTORY BANK STAYS").ok();
        }
        (PatchAction::Init, _) => {
            with_app(&mut |app| {
                let saved = Saved { patch: Patch::default(), frame_log2: app.built_frames,
                                    files: [TableFile::NONE; N_LAYERS] };
                app.restore(&saved);
                app.current = None;
                app.patches.current = None;
            });
            note.push_str("DEFAULT PATCH").ok();
        }
        (_, None) => {
            note.push_str("NOWHERE TO KEEP PATCHES").ok();
        }
        (PatchAction::Load, Some(s)) => match s.load(n) {
            Some(saved) => {
                with_app(&mut |app| {
                    app.restore(&saved);
                    app.current = Some(saved);
                    app.patches.current = Some(n);
                });
                write!(note, "LOADED {}", n + 1).ok();
            }
            None => {
                write!(note, "{} IS EMPTY", n + 1).ok();
            }
        },
        (PatchAction::Save, Some(s)) => {
            let mut saved = None;
            with_app(&mut |app| saved = Some(app.saved()));
            let saved = saved.unwrap();
            match s.save(n, &saved) {
                Ok(()) => {
                    with_app(&mut |app| {
                        app.current = Some(saved);
                        app.patches.current = Some(n);
                        app.patches.used[n] = true;
                    });
                    write!(note, "SAVED TO {}", n + 1).ok();
                }
                Err(e) => {
                    warn!("patch {}: {:?}", n + 1, e);
                    write!(note, "SAVE FAILED").ok();
                }
            }
        }
        (PatchAction::Erase, Some(s)) => match s.erase(n) {
            Ok(()) => {
                with_app(&mut |app| {
                    app.patches.used[n] = false;
                    if app.patches.current == Some(n) {
                        app.patches.current = None;
                        app.current = None;
                    }
                });
                write!(note, "ERASED {}", n + 1).ok();
            }
            Err(e) => {
                warn!("patch {}: {:?}", n + 1, e);
                write!(note, "ERASE FAILED").ok();
            }
        },
    }
    with_app(&mut |app| app.patches.note = note.clone());
    info!("patches: {}", note.as_str());
}

/// Makes one frame's worth of band-limited levels, if any table is still short of them. The tables
/// play as they are until then, and a finished table is told to the engine at once.
fn make_some_levels() {
    let job = critical_section::with(|cs| {
        let mut app = APP.borrow_ref_mut(cs);
        let app = app.as_mut().unwrap();
        app.library.next_mip_job(&app.patch.layers)
    });
    let Some(job) = job else { return };
    tables::make_mips(&job.shape, job.frame);
    let finished = critical_section::with(|cs| {
        let mut app = APP.borrow_ref_mut(cs);
        let app = app.as_mut().unwrap();
        let finished = app.library.mip_done(job);
        if finished {
            app.apply();
        }
        finished
    });
    if finished {
        info!("levels: table {} at {:#x}", job.table, job.shape.offset);
    }
}

/// The main loop: draws from a snapshot of the controls, and logs.
#[inline(never)]
fn run(booted: Booted) -> ! {
    let Booted { mut timer, mut display, mut fill, fb_words, mut store } = booted;
    // (painted again: the boot's frames are gone, and the log's "stack free" is
    // then what the main loop and the timer interrupt leave)
    tiliqua_fw::stack::paint();
    handler!(timer0 = || timer0_handler());

    irq::scope(|sc| {
        sc.register(handlers::Interrupt::TIMER0, timer0);
        timer.enable_tick_isr(TIMER0_ISR_PERIOD_MS, pac::Interrupt::TIMER0);

        let size = display.size();
        let mut screen = Screen::new(size.width, size.height);
        let mut status: String<48> = String::new();
        let mut last_draw_ms = 0u32;
        let mut last_status_ms = 0u32;
        let mut last_log_ms = 0u32;
        let mut draws = 0u32;
        let mut draw_ms_max = 0u32;
        let mut shown = (0u32, 0u32); // (draws a second, longest draw)
        let mut clocks_max = 0u32;
        let mut painting_since = None;
        let mut drive = Drive::new();
        let mut shelf = Shelf::new();

        loop {
            let now = uptime_ms();
            shelf.tend(&mut drive, now);
            let requested = critical_section::with(|cs| {
                APP.borrow_ref_mut(cs).as_mut().unwrap().requested.take()
            });
            if let Some((action, n)) = requested {
                do_patch_request(&mut store, action, n);
            }
            make_some_levels();
            if now.wrapping_sub(last_status_ms) >= STATUS_MS {
                last_status_ms = now;
                shown = (draws, draw_ms_max);
                draws = 0;
                draw_ms_max = 0;
                clocks_max = critical_section::with(|cs| {
                    let mut app = APP.borrow_ref_mut(cs);
                    let app = app.as_mut().unwrap();
                    app.poll_stats();
                    app.clocks_max
                });
                status.clear();
                write!(status, "dsp {}/{} clk  draw {} ms  {}/s", clocks_max, SAMPLE_CLOCKS, shown.1,
                       shown.0).ok();
            }
            if now.wrapping_sub(last_draw_ms) >= DRAW_MS {
                last_draw_ms = now;
                let view = critical_section::with(|cs| {
                    let mut app = APP.borrow_ref_mut(cs);
                    let app = app.as_mut().unwrap();
                    app.patches.edited = app.current.is_some_and(|c| c != app.saved());
                    let monitor = app.engine.monitor();
                    let layer = app.cursor.layer;
                    let layer_tables: [_; N_LAYERS] =
                        core::array::from_fn(|i| app.library.tables[app.table_index(i)]);
                    let lines: [Line; N_LAYERS] = core::array::from_fn(|i| {
                        let (pos, shift) = monitor.scan[i];
                        Line::from_monitor(pos, shift, app.patch.layers[i].edge, layer_tables[i].frames as u32)
                    });
                    View { nav: app.nav,
                           patch: app.patch, monitor, cursor: app.cursor,
                           mod_cursor: app.mod_cursor, route_cursor: app.route_cursor,
                           mix_cursor: app.mix_cursor, patch_cursor: app.patch_cursor,
                           wave_cursor: app.wave_cursor, wave_traces: app.wave_traces, wave_layer: layer,
                           wave_table: layer_tables[layer],
                           wave_line: lines[layer],
                           cross_cursor: app.cross_cursor, layer_tables, lines,
                           patches: app.patches.clone(), tables: app.library.tables,
                           table_names: app.library.names.clone(), status: status.clone(),
                           browser: shelf.view(app.browser_cursor, &drive,
                                               app.library.names[app.table_index(layer)].clone()) }
                });
                let start = uptime_ms();
                screen.draw(&mut display, &mut fill, fb_words, &view);
                draw_ms_max = draw_ms_max.max(uptime_ms().wrapping_sub(start));
                draws += 1;
                shelf.drawn = true;
                match (screen.painting(), painting_since) {
                    (Some(_), None) => painting_since = Some(start),
                    (None, Some(since)) => {
                        info!("wave view: {} traces in {} ms", screen.traces(), uptime_ms().wrapping_sub(since));
                        painting_since = None;
                    }
                    _ => {}
                }
            }
            if now.wrapping_sub(last_log_ms) >= LOG_MS {
                last_log_ms = now;
                info!("dsp longest {}/{} clocks, {} draws/s, longest {} ms, stack free {} bytes, up {} s",
                      clocks_max, SAMPLE_CLOCKS, shown.0, shown.1, tiliqua_fw::stack::free(), now / 1000);
            }
        }
    })
}
