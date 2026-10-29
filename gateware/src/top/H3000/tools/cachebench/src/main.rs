//! Runs the 6809 emulator as the firmware does, for `cachesim.py`: from a
//! factory reset to program 100 (or another, loaded with the keypad 3 s
//! after the reset sequence) idling, then a measured window. `ecall` with a7 = 1 / 2
//! marks the window; a7 = 9 is a panic.
//!
//! cachesim.py loads the unpacked ROM image at 0x2080_0000 and the
//! parameters in the words before it: image length, warm-up and window
//! (ms), program number (0: stay on 100), polls between FIRQs.

#![no_std]
#![no_main]

use h3000_emu::machine::{Host, Memories, E_HZ, H3000, INT_FIRQ};
use h3000_emu::hle;
use h3000_emu::roms::parse_image;

core::arch::global_asm!(
    ".section .text.start",
    ".global _start",
    "_start:",
    "li sp, 0x8000",
    "call bench_main",
    "1: j 1b",
);

fn mark(n: u32) {
    unsafe { core::arch::asm!("ecall", in("a7") n) }
}

#[panic_handler]
fn panic(_: &core::panic::PanicInfo) -> ! {
    mark(9);
    loop {}
}

/// No DSPs: a FIRQ every `firq_polls` polls (1400: about 30 a second, as
/// program 100 asks for).
struct Board {
    polls: u32,
    firq_polls: u32,
    firq: bool,
}

impl Host for Board {
    fn dsp_hold(&mut self, _hold: bool) {}
    fn dsp_program(&mut self, _dsp: u8, _word: u16, _data: u16) {}
    fn dsp_param(&mut self, _addr: u16, _data: u16) {}
    fn interrupts(&mut self) -> u8 {
        self.polls += 1;
        if self.polls >= self.firq_polls {
            self.polls = 0;
            self.firq = true;
        }
        if self.firq { INT_FIRQ } else { 0 }
    }
    fn firq_ack(&mut self) {
        self.firq = false;
    }
}

static mut RAM6000: [u8; 0x2000] = [0; 0x2000];

const IMAGE: usize = 0x2080_0000;
const EMU: usize = 0x2070_0000;

#[no_mangle]
extern "C" fn bench_main() -> ! {
    let len = unsafe { core::ptr::read_volatile((IMAGE - 4) as *const u32) } as usize;
    let img: &'static [u8] = unsafe { core::slice::from_raw_parts(IMAGE as *const u8, len) };
    let (_, roms) = parse_image(img).unwrap();
    let (ram, ram4, nvram) = unsafe {
        (
            &mut *core::ptr::addr_of_mut!(RAM6000),
            &mut *(EMU as *mut [u8; 0x2000]),
            &mut *((EMU + 0x2000) as *mut [u8; 0x4000]),
        )
    };
    ram4.fill(0);
    nvram.fill(0xFF);
    let param = |i: usize| unsafe { core::ptr::read_volatile((IMAGE - 4 * i) as *const u32) };
    let board = Board { polls: 0, firq_polls: param(5).max(1), firq: false };
    let mut m = H3000::new(roms, Memories { ram, ram4, nvram }, board);
    // The loops run natively (as in the firmware).
    let space = unsafe { core::slice::from_raw_parts_mut((EMU + 0x10000) as *mut u8, hle::SPACE) };
    m.set_hle(hle::Hle::new(&roms, space));
    m.factory_reset();
    // In 1 ms slices, as the firmware's main loop runs it.
    let slice = E_HZ / 1000;
    let (warm, window, program) = (param(2), param(3), param(4));
    // Keypad: PROGRAM, three digits, ENTER, each held 100 ms, 300 ms apart.
    const DIGIT: [u8; 10] = [2, 12, 14, 13, 20, 22, 21, 16, 18, 17];
    let keys = [8, DIGIT[(program / 100 % 10) as usize], DIGIT[(program / 10 % 10) as usize], DIGIT[(program % 10) as usize], 3];
    // The key presses start 3 s after the factory reset sequence is over.
    let mut start = u32::MAX;
    for ms in 0..warm {
        if start == u32::MAX && !m.busy() {
            start = ms + 3000;
        }
        if program != 0 && ms >= start {
            let (k, t) = (((ms - start) / 400) as usize, (ms - start) % 400);
            if k < keys.len() && (t == 0 || t == 100) {
                m.set_key(keys[k], t == 0);
            }
        }
        m.run(slice);
    }
    mark(1);
    for _ in 0..window {
        m.run(slice);
    }
    // The LCD's top row, for cachesim.py to show.
    for i in 0..40 {
        unsafe { core::ptr::write_volatile((IMAGE - 0x100 + i) as *mut u8, m.board.lcd.char_at(0, i)) };
    }
    mark(2);
    loop {}
}
