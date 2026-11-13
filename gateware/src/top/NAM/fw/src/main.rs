//! NAM's firmware: a first build. Boots the screen, shows the title, runs the controls on the
//! timer interrupt and logs the engine's figures. The loader, the browser and the screens
//! follow (README.md).

#![no_std]
#![no_main]

use core::cell::RefCell;
use core::fmt::Write;
use core::sync::atomic::{AtomicU32, Ordering};

use critical_section::Mutex;
use heapless::{String, Vec};
use irq::handler;
use log::info;
use riscv_rt::entry;
use tiliqua_hal::embedded_graphics::prelude::*;

use hal::pmod::EurorackPmod;
use nam_cpu::nav::{Event, Nav};
use pac::constants::*;
use tiliqua_fw::engine::Engine;
use tiliqua_fw::glyphs::{self, Face, Glyphs, SHEET_BYTES};
use tiliqua_fw::input::Input;
use tiliqua_fw::screen::{centred, clear_framebuffer, Fill};
use tiliqua_fw::theme;
use tiliqua_fw::*;
use tiliqua_hal as hal;
use tiliqua_lib::*;
use tiliqua_pac as pac;

const TIMER0_ISR_PERIOD_MS: u32 = 5;
const DRAW_MS: u32 = 50;
const LOG_MS: u32 = 5000;
/// Engine clocks a sample has at 48 kHz (the engine runs at twice the system clock).
const SAMPLE_CLOCKS: u32 = 2 * CLOCK_SYNC_HZ / AUDIO_FS;

/// The controls: the interrupt's state, and all the main loop reads of it.
struct App {
    encoder: Encoder0,
    input: Input,
    pmod: EurorackPmod0,
    engine: Engine,
    nav: Nav,
    turns: i32,
    clicks: u32,
}

impl App {
    fn tick(&mut self) {
        let pressed = unsafe { pac::ENCODER0::steal() }.button().read().bits() != 0;
        let mut events: Vec<Event, 4> = Vec::new();
        self.input.poll(&mut self.encoder, pressed, TIMER0_ISR_PERIOD_MS, &mut events);
        for e in events {
            if let Some(e) = self.nav.handle(e) {
                match e {
                    Event::Turn(n) => self.turns += n,
                    Event::Click => self.clicks += 1,
                    Event::Hold => {}
                }
            }
        }
    }
}

static APP: Mutex<RefCell<Option<App>>> = Mutex::new(RefCell::new(None));
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

struct Booted {
    timer: Timer0,
    display: DMAFramebuffer0,
    fill: Fill,
    fb_words: usize,
}

#[entry]
fn main() -> ! {
    tiliqua_fw::stack::paint();
    let booted = boot();
    run(booted)
}

#[inline(never)]
fn boot() -> Booted {
    let peripherals = pac::Peripherals::take().unwrap();

    let serial = Serial0::new(peripherals.UART0);
    tiliqua_fw::handlers::logger_init(serial);
    unsafe { log::set_max_level_racy(log::LevelFilter::Info) };
    info!("boot: NAM {} at {} Hz", UI_TAG, AUDIO_FS);

    let sysclk = pac::clock::sysclk();
    let timer = Timer0::new(peripherals.TIMER0, sysclk);

    let bootinfo = unsafe { bootinfo::BootInfo::from_addr(BOOTINFO_BASE) }.unwrap();
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

    theme::write_palette(&mut display);
    clear_framebuffer(&mut display, &mut fill, fb_words);
    let scratch = PSRAM_BASE + PSRAM_UI_SCRATCH;
    let glyph_sheet = Glyphs::new(unsafe { &mut *(scratch as *mut [u8; SHEET_BYTES]) });
    if !glyph_sheet.upload(&mut display) {
        log::warn!("boot: font sheet too large for the blitter");
    }
    info!("boot: screen ready");

    let mut i2cdev1 = I2c1::new(peripherals.I2C1);
    let mut pmod = EurorackPmod0::new(peripherals.PMOD0_PERIPH);
    calibration::CalibrationConstants::load_or_default(&mut i2cdev1, &mut pmod);
    info!("boot: codec calibration loaded");

    let mut engine = Engine::new(peripherals.NAM);
    engine.bypass(true);
    let app = App {
        encoder: Encoder0::new(peripherals.ENCODER0),
        input: Input::default(),
        pmod,
        engine,
        nav: Nav::default(),
        turns: 0,
        clicks: 0,
    };
    critical_section::with(|cs| APP.borrow(cs).replace(Some(app)));
    Booted { timer, display, fill, fb_words }
}

#[inline(never)]
fn run(booted: Booted) -> ! {
    let Booted { mut timer, mut display, mut fill, fb_words } = booted;
    tiliqua_fw::stack::paint();
    handler!(timer0 = || timer0_handler());

    irq::scope(|sc| {
        sc.register(handlers::Interrupt::TIMER0, timer0);
        timer.enable_tick_isr(TIMER0_ISR_PERIOD_MS, pac::Interrupt::TIMER0);

        let size = display.size();
        let (cx, cy) = (size.width as i32 / 2, size.height as i32 / 2);
        clear_framebuffer(&mut display, &mut fill, fb_words);
        centred(&mut display, Face::Big, cx, cy - 40, "NAM", theme::TITLE);
        centred(&mut display, Face::Text, cx, cy, "NO PROFILE LOADED", theme::DIM);
        let mut last_draw_ms = 0u32;
        let mut last_log_ms = 0u32;
        let mut shown: String<48> = String::new();
        loop {
            let now = uptime_ms();
            if now.wrapping_sub(last_draw_ms) >= DRAW_MS {
                last_draw_ms = now;
                let (turns, clicks, (in_peak, out_peak), page) = critical_section::with(|cs| {
                    let mut app = APP.borrow_ref_mut(cs);
                    let app = app.as_mut().unwrap();
                    (app.turns, app.clicks, app.engine.meters(), app.nav.page())
                });
                let mut line: String<48> = String::new();
                write!(line, "{} turn {} click {}  in {} out {}", page.name(), turns, clicks, in_peak, out_peak).ok();
                if line != shown {
                    let y = cy + 40 - Face::Small.font().h / 2;
                    glyphs::erase(&mut display, Face::Small, cx - glyphs::width(Face::Small, shown.len()) / 2, y,
                                  shown.len());
                    centred(&mut display, Face::Small, cx, cy + 40, line.as_str(), theme::TEXT);
                    shown = line;
                }
            }
            if now.wrapping_sub(last_log_ms) >= LOG_MS {
                last_log_ms = now;
                let (stats, status) = critical_section::with(|cs| {
                    let mut app = APP.borrow_ref_mut(cs);
                    let app = app.as_mut().unwrap();
                    (app.engine.stats(), app.engine.status())
                });
                info!("engine {}/{} clocks, {} overruns, late {}, stack free {} bytes, up {} s",
                      stats.clocks_max, SAMPLE_CLOCKS, stats.overruns, status.late,
                      tiliqua_fw::stack::free(), now / 1000);
            }
        }
    })
}
