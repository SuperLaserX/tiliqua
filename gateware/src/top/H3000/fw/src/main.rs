// See top-level comment in 'top.py' for usage information.

#![no_std]
#![no_main]

use core::fmt::Write;

use log::{info, warn};
use riscv_rt::entry;
use tiliqua_hal::embedded_graphics::prelude::*;

use tiliqua_fw::*;
use tiliqua_hal as hal;
use tiliqua_lib::*;
use tiliqua_pac as pac;

use hal::encoder::Encoder;
use hal::pmod::EurorackPmod;
use pac::constants::*;

use h3000_emu::browse::ProgramList;
use h3000_emu::cv::{self, Cv, Settings};
use h3000_emu::hle::{self, Hle};
use h3000_emu::lzma;
use h3000_emu::machine::{Memories, E_HZ, H3000};
use h3000_emu::nvstore::{self, NvStore, NV_BYTES};
use h3000_emu::remote::Remote;
use hal::spiflash::SpiFlash;
use h3000_emu::roms::{image_program_list, parse_image, Firmware, RomSet};

use tiliqua_fw::dsp::DspBoard;
use tiliqua_fw::glyphs::{Sheet, SHEET_BYTES};
use tiliqua_fw::panel::{Painter, Panel, Theme};

/// The ROM set of this variant (H3000 v1.53 or H3500), a packed image (see
/// ../pack_roms.py) compressed with LZMA: 135 KB instead of 832 KB for the
/// H3500, so that it fits in a flash slot. Decoded at boot.
static ROMS_LZMA: &[u8] = include_bytes!(concat!(env!("OUT_DIR"), "/roms.lzma"));

/// 6809 RAM `$6000-$7FFF`, the most used emulated memory: kept in block RAM.
static mut RAM6000: [u8; 0x2000] = [0; 0x2000];

// The emulator's other memories live in PSRAM.
const EMU_BASE: usize = PSRAM_BASE + PSRAM_EMU_OFFSET;
const RAM4000_ADDR: usize = EMU_BASE;
const NVRAM_ADDR: usize = EMU_BASE + 0x2000;
const SHEET_ADDR: usize = EMU_BASE + 0x6000;
/// Working copies of the battery-backed RAM for keeping it in flash.
const NV_SEEN_ADDR: usize = EMU_BASE + 0x8000;
const NV_SAVED_ADDR: usize = EMU_BASE + 0xC000;
const NV_BUF_ADDR: usize = EMU_BASE + 0x10000;
/// ROM copies with the traps of the natively run loops (`hle::SPACE`).
const HLE_ADDR: usize = EMU_BASE + 0x20000;

/// The SPI flash as `nvstore` uses it. The firmware runs from PSRAM, so the
/// flash can be erased and programmed while it runs.
struct FlashPort(SPIFlash0);

impl nvstore::Flash for FlashPort {
    fn busy(&mut self) -> Result<bool, ()> {
        self.0.busy().map_err(|_| ())
    }
    fn erase_sector(&mut self, addr: u32) -> Result<(), ()> {
        self.0.write_enable().map_err(|_| ())?;
        self.0.sector_erase(addr).map_err(|_| ())
    }
    fn program(&mut self, addr: u32, data: &[u8]) -> Result<(), ()> {
        self.0.write_enable().map_err(|_| ())?;
        self.0.page_program(addr, data).map_err(|_| ())
    }
    fn read(&mut self, addr: u32, data: &mut [u8]) {
        for (i, b) in data.iter_mut().enumerate() {
            *b = unsafe { core::ptr::read_volatile((SPIFLASH_BASE + addr as usize + i) as *const u8) };
        }
    }
}

/// The end of the PSRAM ROM window holds the LZMA decoder's model while the
/// ROM image is decoded into the rest.
const PROBS_SPACE: usize = 0x8000;

/// Decode the embedded ROM image into PSRAM: the ROM set and its program
/// list.
fn unpack_roms(timer: &Timer0, ticks_per_ms: u32) -> (Firmware, RomSet<'static>, &'static [u8]) {
    const _: () = assert!(core::mem::size_of::<lzma::Probs>() <= PROBS_SPACE);
    let base = PSRAM_BASE + PSRAM_ROM_OFFSET;
    let t0 = timer.counter();
    let (out, probs) = unsafe {
        (
            core::slice::from_raw_parts_mut(base as *mut u8, PSRAM_ROM_SIZE - PROBS_SPACE),
            lzma::Probs::init_at((base + PSRAM_ROM_SIZE - PROBS_SPACE) as *mut lzma::Probs),
        )
    };
    let n = match lzma::decode(ROMS_LZMA, out, probs) {
        Ok(n) => n,
        Err(e) => panic!("ROM image ({} bytes): {:?}", ROMS_LZMA.len(), e),
    };
    let ms = t0.wrapping_sub(timer.counter()) / ticks_per_ms;
    info!("ROM image: {} -> {} bytes in {} ms", ROMS_LZMA.len(), n, ms);
    let img: &'static [u8] = &out[..n];
    match parse_image(img) {
        Some((firmware, roms)) => (firmware, roms, image_program_list(img).unwrap_or(&[])),
        None => panic!("ROM image: not a packed ROM set"),
    }
}

/// Longest emulation slice between UI polls.
const SLICE_CYCLES: u32 = E_HZ / 1000;
/// If the emulation falls further behind real time than this, the excess is
/// dropped (the emulated machine runs slow instead of trying to catch up).
const MAX_BEHIND_CYCLES: u64 = E_HZ as u64 / 10;
const DRAW_PERIOD_MS: u32 = 40;
const STATS_PERIOD_MS: u32 = 1000;

#[entry]
fn main() -> ! {
    let peripherals = pac::Peripherals::take().unwrap();

    let serial = Serial0::new(peripherals.UART0);
    tiliqua_fw::handlers::logger_init(serial);

    info!("Hello from Tiliqua H3000!");

    // Free-running timer: our real-time reference.
    let sysclk = pac::clock::sysclk();
    let mut timer = Timer0::new(peripherals.TIMER0, sysclk);
    timer.disable();
    timer.set_mode(hal::timer::Mode::Periodic);
    timer.set_timeout_ticks(u32::MAX);
    timer.enable();
    let ticks_per_ms = sysclk / 1000;

    let bootinfo = unsafe { bootinfo::BootInfo::from_addr(BOOTINFO_BASE) }.unwrap();
    let (firmware, roms, programs) = unpack_roms(&timer, ticks_per_ms);
    let modeline = bootinfo.modeline.maybe_override_fixed(FIXED_MODELINE, CLOCK_DVI_HZ);
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
    palette::ColorPalette::default().write_to_hardware(&mut display);
    // The panel is drawn incrementally and must stay on screen: no
    // persistence (fading), and the persistence engine's PSRAM traffic
    // throttled to almost nothing.
    let persist = peripherals.PERSIST_PERIPH;
    persist.decay().write(|w| unsafe { w.decay().bits(0) });
    persist.skip().write(|w| unsafe { w.skip().bits(0) });
    persist.persist().write(|w| unsafe { w.persist().bits(0xFFFF) });
    // Clear what the bootloader left in the framebuffer.
    unsafe {
        let words = modeline.h_active as usize * modeline.v_active as usize / 4;
        let fb = PSRAM_FB_BASE as *mut u32;
        for i in 0..words {
            fb.add(i).write_volatile(0);
        }
    }
    // PSRAM bandwidth statistics (shared by the CPU, framebuffer, plotter
    // and the delay memory), reported once per second.
    let psram = peripherals.PSRAM_CSR;
    psram.ctrl().write(|w| w.collect().bit(true));

    let mut i2cdev1 = I2c1::new(peripherals.I2C1);
    let mut pmod = EurorackPmod0::new(peripherals.PMOD0_PERIPH);
    calibration::CalibrationConstants::load_or_default(&mut i2cdev1, &mut pmod);

    // Holding the encoder button down at start-up starts from the factory
    // state instead of the saved memory.
    let factory = peripherals.ENCODER0.button().read().bits() != 0;
    let mut encoder = Encoder0::new(peripherals.ENCODER0);

    //
    // Emulated H3000
    //

    let (ram, ram4, nvram, sheet_buf) = unsafe {
        (
            &mut *core::ptr::addr_of_mut!(RAM6000),
            &mut *(RAM4000_ADDR as *mut [u8; 0x2000]),
            &mut *(NVRAM_ADDR as *mut [u8; 0x4000]),
            &mut *(SHEET_ADDR as *mut [u8; SHEET_BYTES]),
        )
    };
    ram4.fill(0);
    nvram.fill(0xFF);

    let is_h3500 = firmware == Firmware::H3500;
    let rom_name = if is_h3500 { "H3500" } else { "v1.53" };

    // The battery-backed RAM is kept in the slot's option storage.
    let flash = FlashPort(SPIFlash0::new(peripherals.SPIFLASH_CTRL, SPIFLASH_BASE, SPIFLASH_SZ_BYTES));
    let mut store = match bootinfo.manifest.get_option_storage_window() {
        Some(w) if w.end - w.start >= nvstore::WINDOW_BYTES => {
            let (seen, saved, buf) = unsafe {
                (
                    &mut *(NV_SEEN_ADDR as *mut [u8; NV_BYTES]),
                    &mut *(NV_SAVED_ADDR as *mut [u8; NV_BYTES]),
                    &mut *(NV_BUF_ADDR as *mut [u8; NV_BYTES]),
                )
            };
            Some(NvStore::new(flash, w.start, firmware as u8, seen, saved, buf))
        }
        _ => {
            warn!("no option storage for the memory: it is not kept");
            None
        }
    };
    let restored = match store.as_mut() {
        Some(s) if factory => {
            s.load(nvram);
            nvram.fill(0xFF);
            info!("encoder held: starting from the factory state");
            false
        }
        Some(s) => s.load(nvram),
        None => false,
    };
    let dsp = DspBoard::new(peripherals.H3000);
    let mut m = H3000::new(roms, Memories { ram, ram4, nvram }, dsp);
    // The kernel's hottest code runs natively.
    let hle = Hle::new(&roms, unsafe { core::slice::from_raw_parts_mut(HLE_ADDR as *mut u8, hle::SPACE) });
    info!("{} native loops", hle.len());
    m.set_hle(hle);
    if restored {
        // The kernel carries on where it was: the last program, edits included.
        info!("memory restored from flash");
    } else {
        // No stored memory: start like a factory-fresh unit.
        m.factory_reset();
    }
    let mut saves = 0;

    let mut sheet = Sheet::new(sheet_buf);
    let programs = ProgramList::new(programs);
    info!("{} programs", programs.len());
    let mut panel = Panel::new(programs);
    let mut remote = Remote::new();
    // Control voltages on inputs 3 and 4, as MIDI controllers; their
    // settings are kept with the memory.
    let mut cv_kept = store.as_ref().and_then(|s| Settings::from_bytes(&s.extra())).unwrap_or(Settings::DEFAULT);
    panel.cv = cv_kept;
    let mut cv = Cv::new(cv_kept, pmod.counts_per_v());
    // Milliseconds since start, and since the last MIDI byte.
    let mut clock_ms: u32 = 0;
    let mut midi_quiet_ms: u32 = 0;
    let size = display.size();
    let mut painter = Painter::new(size.width, size.height);
    // Soft key colours: palette hue 1 is orange (H3000), 10 blue (H3500).
    let theme = Theme { hue: if is_h3500 { 10 } else { 1 } };


    let mut last = timer.counter();
    // Timer ticks * E_HZ not yet converted to E cycles (sysclk is not a
    // multiple of the E clock).
    let mut tick_acc: u64 = 0;
    let mut owed: u64 = 0;
    let mut ms_acc: u32 = 0;
    let mut draw_ms: u32 = DRAW_PERIOD_MS;
    let mut stats_ms: u32 = 0;
    let mut blink_ms: u32 = 0;
    let mut window_cycles: u64 = 0;
    // Timer ticks spent emulating (the rest goes to the display, UI, MIDI
    // and flash): with `window_cycles`, how fast the emulator can run.
    let mut run_ticks: u64 = 0;
    let mut wait_ticks: u64 = 0;
    let mut status: heapless::String<64> = heapless::String::new();
    let mut inputs: heapless::String<40> = heapless::String::new();

    loop {
        // Real time since the last iteration (the timer counts down).
        let now = timer.counter();
        let dt = last.wrapping_sub(now);
        last = now;
        tick_acc += dt as u64 * E_HZ as u64;
        let e = tick_acc / sysclk as u64;
        tick_acc -= e * sysclk as u64;
        owed += e;
        if owed > MAX_BEHIND_CYCLES {
            owed = MAX_BEHIND_CYCLES;
        }
        ms_acc += dt;
        let elapsed_ms = ms_acc / ticks_per_ms;
        ms_acc -= elapsed_ms * ticks_per_ms;
        clock_ms = clock_ms.wrapping_add(elapsed_ms);
        midi_quiet_ms = midi_quiet_ms.saturating_add(elapsed_ms);

        // Emulate.
        let slice = core::cmp::min(owed, SLICE_CYCLES as u64) as u32;
        if slice > 0 {
            let c0 = m.cpu.cycles;
            let t0 = timer.counter();
            m.run(slice);
            run_ticks += t0.wrapping_sub(timer.counter()) as u64;
            let done = m.cpu.cycles - c0;
            owed = owed.saturating_sub(done);
            window_cycles += done;
        }

        // MIDI input (TRS) into the emulated MIDI port, but for the CCs
        // that work the front panel.
        while let Some(byte) = m.board.host.midi_byte() {
            midi_quiet_ms = 0;
            let r = remote.byte(byte);
            for &b in r.forward() {
                m.midi_in(b);
            }
            if let Some(action) = r.action {
                panel.remote(action, &mut m);
            }
        }
        // Between those messages: controller values the filter held back,
        // and the control voltages (while the emulated port is not behind).
        cv.set(panel.cv);
        let msg = match remote.due(clock_ms) {
            Some(msg) => Some(msg),
            None if remote.can_inject(midi_quiet_ms > 1000) && m.board.acia.state().3 < 8 => {
                let s = pmod.sample_i();
                cv.poll([s[2], s[3]], pmod.jack() >> 2 & 3, clock_ms)
            }
            None => None,
        };
        if let Some(msg) = msg {
            for &b in remote.inject(msg).forward() {
                m.midi_in(b);
            }
        }

        // Encoder.
        encoder.update();
        let ticks = encoder.poke_ticks();
        let click = encoder.poke_btn();
        let held = unsafe { pac::ENCODER0::steal() }.button().read().bits() != 0;
        panel.update(ticks, click, held, elapsed_ms, &mut m);

        // Keep the battery-backed RAM in flash, and the CV settings once
        // they are set.
        if let Some(s) = store.as_mut() {
            if panel.cv != cv_kept && !panel.cv_menu() {
                cv_kept = panel.cv;
                s.set_extra(cv_kept.to_bytes());
            }
            s.poll(m.board.nvram, elapsed_ms);
            if s.saves != saves {
                saves = s.saves;
                info!("memory saved to flash ({} saves, {} errors)", s.saves, s.errors);
            }
        }

        // Statistics.
        stats_ms += elapsed_ms;
        if stats_ms >= STATS_PERIOD_MS {
            let speed = window_cycles * 100 * 1000 / (E_HZ as u64 * stats_ms as u64);
            // Emulated speed if the emulator had the CPU to itself, and the
            // share of the CPU it takes.
            let capacity = window_cycles * 100 * sysclk as u64 / (E_HZ as u64 * run_ticks.max(1));
            let window_ticks = stats_ms as u64 * ticks_per_ms as u64;
            let emu_load = run_ticks * 100 / window_ticks;
            // Of which waiting on the DSP board (bus slots, full queues).
            let waited = m.board.host.wait_ticks - wait_ticks;
            wait_ticks = m.board.host.wait_ticks;
            let wait_load = waited * 100 / window_ticks;
            let (_, worst) = m.board.host.frame_clocks();
            m.board.host.clear_max();
            psram.ctrl().write(|w| w.collect().bit(false));
            let elapsed = psram.stats0().read().cycles_elapsed().bits() as u64;
            let idle = psram.stats1().read().cycles_idle().bits() as u64;
            psram.ctrl().write(|w| w.collect().bit(true));
            let psram_busy = if elapsed > 0 { 100 - idle * 100 / elapsed } else { 0 };
            status.clear();
            write!(
                status,
                "6809 {}/{}% W {}% DSP {}% RAM {}%",
                speed,
                capacity,
                wait_load,
                worst as u32 * 100 / (sysclk / AUDIO_FS),
                psram_busy
            )
            .ok();
            let h = &m.board.host;
            info!(
                "{} {} emu={}% dsp clocks={} timeouts={} loads={} pc={:04x} params={} stalls={} bus w/r={}/{} firq={} irq={} clock={} misses={} midi in/out={}/{}",
                rom_name,
                status.as_str(),
                emu_load,
                worst,
                m.board.host.timeouts,
                h.loads,
                m.cpu.pc,
                h.params,
                h.param_stalls,
                h.bus_writes,
                h.bus_reads,
                h.firqs,
                h.irqs,
                h.clock_mode,
                h.cache_misses(),
                h.midi_in,
                h.midi_out
            );
            stats_ms = 0;
            window_cycles = 0;
            run_ticks = 0;
        }

        // Display.
        draw_ms += elapsed_ms;
        blink_ms = (blink_ms + elapsed_ms) % 1000;
        if draw_ms >= DRAW_PERIOD_MS {
            draw_ms = 0;
            if panel.cv_menu() {
                // The inputs instead of the statistics.
                let jack = pmod.jack() >> 2;
                status.clear();
                for i in 0..cv::INPUTS {
                    let (mv, value) = cv.reading(i);
                    let (sign, mv) = if mv < 0 { ('-', -mv) } else { ('+', mv) };
                    if jack & (1 << i) == 0 {
                        write!(status, "CV{} unplugged    ", i + 1).ok();
                    } else {
                        write!(status, "CV{} {}{}.{:02}V {:3}    ", i + 1, sign, mv / 1000, mv % 1000 / 10, value).ok();
                    }
                }
                stats_ms = 0;
            }
            // "CV1 CC16   64   CV2 CC17   --": each input's controller and
            // value (-- unplugged).
            let jack = pmod.jack() >> 2;
            inputs.clear();
            for i in 0..cv::INPUTS {
                let cc = panel.cv.cc[i];
                write!(inputs, "{}CV{} ", if i > 0 { "   " } else { "" }, i + 1).ok();
                if cc >= cv::OFF {
                    write!(inputs, "off      ").ok();
                } else if jack & (1 << i) == 0 {
                    write!(inputs, "CC{:<3}  --", cc).ok();
                } else {
                    write!(inputs, "CC{:<3} {:3}", cc, cv.reading(i).1).ok();
                }
            }
            sheet.sync_cgram(&m.board.lcd.cgram);
            painter.draw(
                &mut display,
                &sheet,
                &m.board.lcd,
                &panel,
                &theme,
                blink_ms < 500,
                status.as_bytes(),
                inputs.as_bytes(),
            );
        }
    }
}
