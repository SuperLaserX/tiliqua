//! Run the H3000 host firmware on a PC.
//!
//! usage: h3000-host <firmware dir> <v153|h3500|files:KERNEL,ROM,..> [script|@file]
//!        h3000-host <packed image> image [script]   (see ../pack_roms.py)
//!
//! The script is a `;`-separated list of commands:
//!   wait <seconds>      run the emulation
//!   key <n> [hold s]    press matrix switch n (0-24), default hold 0.1 s
//!   knob <detents>      turn the knob
//!   factory             factory reset (clear NV memory through the kernel)
//!   lcd                 print the display
//!   log on|off          print every DSP host-latch write and bus port access
//!   stats               print counters
//!   midi <hex bytes>    queue MIDI input
//!   dsp on              simulate the DSP board (closed loop; give it first)
//!   tone <hz> <amp>     DSP input: a sine on both channels (`tone off`)
//!   rec on|off          record the DSP output
//!   wav <file>          write the recorded output (16-bit stereo 44.1 kHz)
//!   env <ms>            print the recorded output level per block
//!   cache [reset]       delay cache misses per frame (gateware cache model)
//! The display is printed whenever it changes during a `wait`.

use h3000_emu::browse::{Browser, Keys, ProgramList};
use h3000_emu::cv::{Cv, Settings, RANGES};
use h3000_emu::dspsim::Board;
use h3000_emu::machine::{Host, Memories, H3000, E_HZ, INT_FIRQ, INT_Q0, PARAM_FIRQ_ACK, SAMPLE_CYCLES};
use h3000_emu::remote::{Action, Remote, Values};
use h3000_emu::roms::{image_program_list, parse_image, RomSet};
use std::collections::BTreeMap;

#[derive(Default)]
struct Log {
    now: u64,
    /// DSP bad opcodes (dsp, word, pc) seen since last taken, when they are
    /// not fatal (`report`).
    bad_ops: Vec<(usize, u16, u16)>,
    /// Words of the last program load per DSP, and the cycle it was released.
    programs: [Vec<(u16, u16)>; 4],
    run_cycle: u64,
    /// Every host-latch write: (cycle, addr, data); FIRQ acknowledges in
    /// order with them as addr PARAM_FIRQ_ACK.
    param_writes: Vec<(u64, u16, u16)>,
    hold: bool,
    program_words: [u32; 4],
    params: u32,
    param_log: bool,
    /// First bus port writes (port, data), for stats.
    io: Vec<(u8, u16)>,
    /// Every bus port write (cycle, port, data) and clock select change.
    bus_writes: Vec<(u64, u8, u16)>,
    modes: Vec<(u64, u8)>,
    /// Last value written to each port (reads return it; there are no DSPs).
    ports: [u16; 8],
    result: u16,
    /// Without DSPs, FIRQ (their parameter update tick) is requested every
    /// FIRQ_POLLS polls.
    polls: u32,
    firq: bool,
    latches: BTreeMap<u16, u8>,
    unmapped: BTreeMap<(u16, bool), u32>,
    midi: Vec<u8>,
    loads: u32,
    /// Simulated DSP board (`dsp on`), its input tone and recorded output.
    sim: Option<Box<Board>>,
    next_frame: u64,
    tone: Option<(f64, f64)>,
    tone_n: u64,
    rec: bool,
    out: Vec<(i16, i16)>,
    max_params: usize,
    /// Bus reads, and FIRQ / Q0 interrupts seen (rising edges), for `rates`.
    reads: u32,
    /// DSP hold / release transitions (cycle, hold).
    holds: Vec<(u64, bool)>,
    firqs: u32,
    irqs: u32,
    last_int: u8,
    /// Calls of dsp_param_ready ($8053 reads), bus_result, interrupts.
    calls: [u32; 3],
}

impl Log {
    /// Run one board frame (one sample).
    fn sim_frame(&mut self) {
        let (l, r) = match self.tone {
            Some((f, a)) => {
                let x = 2.0 * std::f64::consts::PI * f * self.tone_n as f64 / 44100.0;
                let v = (a * x.sin()).round() as i16;
                (v, v)
            }
            None => (0, 0),
        };
        self.tone_n += 1;
        if let Some(b) = self.sim.as_mut() {
            let o = b.frame(l, r);
            if self.rec {
                self.out.push(o);
            }
            #[allow(static_mut_refs)]
            if let Some(h) = unsafe { DSP_PCS.as_mut() } {
                for (i, d) in b.dsps.iter().enumerate() {
                    *h[i].entry(d.pc).or_insert(0) += 1;
                }
            }
            for (i, d) in b.dsps.iter_mut().enumerate() {
                if let Some((w, pc)) = d.bad_op.take() {
                    if unsafe { BAD_OP_FATAL } {
                        panic!("dsp {} bad op {:04x} at {:03x}", i + 1, w, pc);
                    }
                    if self.bad_ops.len() < 16 {
                        self.bad_ops.push((i + 1, w, pc));
                    }
                }
            }
        }
    }
}

impl Host for Log {
    fn dsp_hold(&mut self, hold: bool) {
        if hold != self.hold {
            self.holds.push((self.now, hold));
            if !hold {
                println!(
                    "  [dsp] run (program words {} {} {})",
                    self.program_words[1], self.program_words[2], self.program_words[3]
                );
                self.loads += 1;
            }
            if let Some(b) = self.sim.as_mut() {
                b.set_run(!hold);
            }
            if hold {
                self.program_words = [0; 4];
                for p in self.programs.iter_mut() {
                    p.clear();
                }
            } else {
                self.run_cycle = self.now;
            }
            self.hold = hold;
        }
    }
    fn dsp_program(&mut self, dsp: u8, word: u16, data: u16) {
        if !self.hold && std::env::var_os("PROG_TRACE").is_some() {
            eprintln!("program write while running: dsp {} {:03x} = {:04x}", dsp, word, data);
        }
        self.program_words[dsp as usize] += 1;
        self.programs[dsp as usize].push((word, data));
        if let Some(b) = self.sim.as_mut() {
            b.dsps[(dsp - 1) as usize].pstore(word, data);
        }
    }
    fn dsp_param(&mut self, addr: u16, data: u16) {
        self.params += 1;
        self.param_writes.push((self.now, addr, data));
        unsafe {
            if PWATCH == Some(addr) {
                PWATCH_HIT = true;
            }
        }
        if let Some(b) = self.sim.as_mut() {
            b.bus.params.push_back((addr, data));
            let q = b.bus.params.len();
            if q > self.max_params {
                self.max_params = q;
            }
        }
        if self.param_log {
            println!("  [param] {:04x} = {:04x}", addr, data);
        }
    }
    fn bus_write(&mut self, port: u8, data: u16) {
        if self.io.len() < 64 {
            self.io.push((port, data));
        }
        self.bus_writes.push((self.now, port, data));
        if port != 0 {
            self.ports[port as usize] = data;
        }
        if let Some(b) = self.sim.as_mut() {
            b.bus.bus_queue.push_back((port, data, false));
        }
        if self.param_log {
            println!("  [bus] PA{} = {:04x} at {:.4}s", port, data, self.now as f64 / E_HZ as f64);
        }
    }
    fn bus_read(&mut self, port: u8) {
        self.reads += 1;
        self.result = self.ports[port as usize];
        if let Some(b) = self.sim.as_mut() {
            b.bus.bus_queue.push_back((port, 0, true));
        }
        if self.param_log {
            println!("  [bus] PA{} read at {:.4}s", port, self.now as f64 / E_HZ as f64);
        }
    }
    fn bus_result(&mut self) -> u16 {
        self.calls[1] += 1;
        let r = match self.sim.as_ref() {
            Some(b) => b.bus.bus_result,
            None => self.result,
        };
        if self.param_log {
            println!("  [bus] result {:04x} at {:.4}s", r, self.now as f64 / E_HZ as f64);
        }
        r
    }
    fn dsp_param_ready(&mut self) -> bool {
        self.calls[0] += 1;
        self.sim.as_ref().map_or(true, |b| b.bus.params.len() < 28)
    }
    fn clock_mode(&mut self, mode: u8) {
        if self.modes.last().map(|m| m.1) != Some(mode) {
            self.modes.push((self.now, mode));
            if self.param_log {
                println!("  [clock] mode {}", mode);
            }
        }
        if let Some(b) = self.sim.as_mut() {
            b.bus.clock_mode = mode;
        }
    }
    fn interrupts(&mut self) -> u8 {
        self.calls[2] += 1;
        if let Some(b) = self.sim.as_ref() {
            let mut i = 0;
            if b.bus.firq {
                i |= INT_FIRQ;
            }
            if b.bus.flags & 1 != 0 && b.bus.bus_queue.is_empty() {
                i |= INT_Q0;
            }
            let rising = i & !self.last_int;
            self.firqs += (rising & INT_FIRQ != 0) as u32;
            self.irqs += (rising & INT_Q0 != 0) as u32;
            self.last_int = i;
            return i;
        }
        self.polls += 1;
        if self.polls >= FIRQ_POLLS {
            self.polls = 0;
            self.firq = true;
        }
        if self.firq {
            INT_FIRQ
        } else {
            0
        }
    }
    fn firq_ack(&mut self) {
        self.firq = false;
        self.param_writes.push((self.now, PARAM_FIRQ_ACK, 0));
        if let Some(b) = self.sim.as_mut() {
            b.firq_ack();
        }
    }
    fn midi_out(&mut self, byte: u8) {
        self.midi.push(byte);
    }
    fn latch(&mut self, addr: u16, val: u8) {
        self.latches.insert(addr, val);
    }
    fn unmapped(&mut self, addr: u16, write: Option<u8>) {
        *self.unmapped.entry((addr, write.is_some())).or_insert(0) += 1;
    }
}

/// Samples between FIRQs when no DSPs are present.
const FIRQ_POLLS: u32 = 256;

/// One LCD row as text: the soft-key brackets (0x08 / 0x09) as parentheses,
/// other user characters as spaces.
fn lcd_row(m: &H3000<Log>, row: usize) -> String {
    (0..40)
        .map(|i| match m.board.lcd.char_at(row, i) {
            0x08 => '(',
            0x09 => ')',
            c @ 0x20..=0x7E => c as char,
            _ => ' ',
        })
        .collect()
}

fn press_key(m: &mut H3000<Log>, key: u8, after: f64) {
    m.set_key(key, true);
    run_secs(m, 0.1);
    m.set_key(key, false);
    run_secs(m, after);
}

/// Run until `f` holds (checked every 10 ms) or `secs` pass.
fn wait_until(m: &mut H3000<Log>, secs: f64, f: impl Fn(&H3000<Log>) -> bool) -> bool {
    let mut t = 0.0;
    while t < secs {
        if f(m) {
            return true;
        }
        run_secs(m, 0.01);
        t += 0.01;
    }
    f(m)
}

/// Keypad matrix positions of the digits 0-9.
const DIGIT_KEYS: [u8; 10] = [2, 12, 14, 13, 20, 22, 21, 16, 18, 17];

/// `report`: load program `num` and write what the front panel shows of it:
///   P <num> <name>
///   G <soft 1> <soft 2> <soft 3> <soft 4>       one line per parameter page
///   S <soft function line>                      Soft Functions 1-4
///   M <parameter> <patch source> <range line>   one line per patchable parameter
///   X <dsp> <opcode> <pc>                       a DSP ran into an undefined opcode
/// (tab separated), or `E <num> <what>` if something did not show up.
fn report_program(m: &mut H3000<Log>, num: u32, out: &mut impl std::io::Write) {
    let e = |out: &mut dyn std::io::Write, what: &str| writeln!(out, "E\t{}\t{}", num, what).unwrap();
    // Program page: type the number, then load it.
    if !lcd_row(m, 0).starts_with("Selected Program") {
        press_key(m, 8, 0.5);
    }
    for d in num.to_string().bytes() {
        press_key(m, DIGIT_KEYS[(d - b'0') as usize], 0.25);
    }
    let want = format!("[{}]", num);
    if !wait_until(m, 3.0, |m| lcd_row(m, 0)[19..].starts_with(&want)) {
        return e(out, &format!("not selected: {}", lcd_row(m, 0)));
    }
    run_secs(m, 0.3);
    let name = lcd_row(m, 0)[25..].trim_end().to_string();
    press_key(m, 3, 0.2);
    // Loaded once neither the program page, the H3500's loading page nor the
    // samplers' memory clearing shows, for a second.
    let busy = |m: &H3000<Log>| {
        let r = lcd_row(m, 0);
        r.starts_with("Selected Program") || r.starts_with("Loading") || r.contains("clearing")
    };
    let mut steady = 0;
    for _ in 0..600 {
        run_secs(m, 0.1);
        steady = if busy(m) { 0 } else { steady + 1 };
        if steady >= 10 {
            break;
        }
    }
    if steady < 10 {
        return e(out, &format!("not loaded: {}", lcd_row(m, 0)));
    }
    writeln!(out, "P\t{}\t{}", num, name).unwrap();

    // Parameter pages: PAGE> until the first one comes round again.
    let soft = |r: &str| -> Vec<String> {
        (0..4).map(|k| r[k * 10..k * 10 + 10].trim_matches(|c| c == '(' || c == ')').trim().to_string()).collect()
    };
    let mut pages: Vec<String> = Vec::new();
    for _ in 0..16 {
        let r = soft(&lcd_row(m, 1)).join("\t");
        if pages.contains(&r) {
            break;
        }
        pages.push(r);
        press_key(m, 9, 0.4);
    }
    for p in &pages {
        writeln!(out, "G\t{}", p).unwrap();
    }

    // Soft Functions: SETUP up to its modulation page, SoftFunc, then the
    // knob through Soft 1-4.
    let modulation = |m: &mut H3000<Log>| {
        wait_until_pressing(m, 10, 8, |m| lcd_row(m, 0).contains("Modulation of Parameters"))
    };
    if !modulation(m) {
        return e(out, "no modulation page");
    }
    press_key(m, 4, 0.4);
    for n in 1..=4 {
        let want = format!("Soft {} is", n);
        let mut found = false;
        for _ in 0..12 {
            if lcd_row(m, 0).starts_with(&want) {
                found = true;
                break;
            }
            m.turn_knob(1);
            run_secs(m, 0.12);
        }
        if !found {
            e(out, &format!("no {}: {}", want, lcd_row(m, 0)));
            break;
        }
        writeln!(out, "S\t{}", lcd_row(m, 0).trim_end()).unwrap();
    }

    // Modulation patches: Patch, then the knob through the parameters.
    if !modulation(m) {
        return e(out, "no modulation page");
    }
    press_key(m, 7, 0.4);
    if !lcd_row(m, 1).contains("Parmtr") {
        return e(out, &format!("no patch page: {}", lcd_row(m, 1)));
    }
    let mut first: Option<String> = None;
    for _ in 0..96 {
        let r = lcd_row(m, 0);
        let param = r[..8].trim().to_string();
        if first.as_deref() == Some(param.as_str()) {
            break;
        }
        first.get_or_insert(param.clone());
        let source = r.split_once("->").map(|(_, s)| s.trim().to_string()).unwrap_or_default();
        let mut range = String::new();
        if source != "Patch is disabled" {
            press_key(m, 6, 0.3);
            range = lcd_row(m, 0).trim().to_string();
            press_key(m, 7, 0.3);
        }
        writeln!(out, "M\t{}\t{}\t{}\t{}", param, source, range, r.trim_end()).unwrap();
        // Next parameter (the kernel needs a few detents per step).
        let mut moved = false;
        for _ in 0..12 {
            m.turn_knob(1);
            run_secs(m, 0.12);
            if lcd_row(m, 0)[..8].trim() != param {
                moved = true;
                break;
            }
        }
        if !moved {
            break;
        }
    }
    press_key(m, 8, 0.5);
    for (d, w, pc) in std::mem::take(&mut m.board.host.bad_ops) {
        writeln!(out, "X\t{}\t{:04x}\t{:03x}", d, w, pc).unwrap();
    }
}

/// A press timed by the 6809's keypad reads, as the panel makes them.
fn press_scanned(m: &mut H3000<Log>, keys: &mut Keys, key: u8) {
    while !keys.free(m) {
        run_secs(m, 0.001);
        keys.poll(m);
    }
    keys.press(m, key, 0);
    while keys.held() {
        run_secs(m, 0.001);
        keys.poll(m);
    }
}

/// `programs <out>`: every program of the ROM set, "number<tab>name" per
/// line, by stepping through the kernel's program page.
fn list_programs(m: &mut H3000<Log>, out: &mut impl std::io::Write) -> usize {
    let mut keys = Keys::new();
    let field = |m: &H3000<Log>| {
        let r = lcd_row(m, 0);
        r.starts_with("Selected Program").then(|| r[19..].trim_end().to_string())
    };
    let mut tries = 0;
    while field(m).is_none() {
        tries += 1;
        if tries > 4 {
            return 0;
        }
        press_scanned(m, &mut keys, 8);
        run_secs(m, 0.5);
    }
    let mut n = 0;
    loop {
        // The field once it has stopped changing (the name follows the number).
        let mut f = field(m).unwrap_or_default();
        let mut stable = 0;
        while stable < 5 {
            run_secs(m, 0.01);
            let g = field(m).unwrap_or_default();
            stable = if g == f { stable + 1 } else { 0 };
            f = g;
        }
        // "[NNN] NAME"; the list ends with "Last Edit" (the edit buffer),
        // which is left out.
        let b = f.as_bytes();
        if b.len() > 5 && b[0] == b'[' && b[4] == b']' {
            writeln!(out, "{}\t{}", f[1..4].trim(), f[6..].trim_end()).unwrap();
            n += 1;
        }
        press_scanned(m, &mut keys, 15);
        if !wait_until(m, 3.0, |m| field(m).map_or(true, |g| g != f)) {
            return n;
        }
    }
}

/// Press `key` (at most `n` times) until `f` holds.
fn wait_until_pressing(m: &mut H3000<Log>, key: u8, n: usize, f: impl Fn(&H3000<Log>) -> bool) -> bool {
    for _ in 0..n {
        if f(m) {
            return true;
        }
        press_key(m, key, 0.5);
    }
    f(m)
}

fn print_lcd(m: &H3000<Log>) {
    let lcd = &m.board.lcd;
    let mut specials = Vec::new();
    println!("  +----------------------------------------+");
    for row in 0..2 {
        let mut s = String::new();
        for col in 0..40 {
            let c = lcd.char_at(row, col);
            s.push(if (0x20..0x7F).contains(&c) { c as char } else { '?' });
            if !(0x20..0x7F).contains(&c) {
                specials.push((row, col, c));
            }
        }
        println!("  |{}|", s);
    }
    let cur = lcd.cursor().map(|(r, c)| format!(" cursor r{} c{}", r, c)).unwrap_or_default();
    println!("  +----------------------------------------+{}", cur);
    if !specials.is_empty() {
        println!("  special chars (row,col,code): {:x?}", specials);
    }
}

static mut WATCH: Vec<(u16, u64)> = Vec::new();
/// `pwatch`: host latch address whose writes print the 6809's PC and stack.
static mut PWATCH: Option<u16> = None;
static mut PWATCH_HIT: bool = false;
/// `rwatch`: RAM address ($6000-$7FFF) whose changes print the 6809's PC
/// while profiling (single-stepped with the DSPs running).
static mut RWATCH: Option<u16> = None;
/// Print the display whenever it changes during a wait.
static mut AUTO_LCD: bool = true;
/// Front-panel program browsing (`browse`, `turn`, `click`), updated every
/// millisecond of emulated time once started.
static mut BROWSER: Option<Browser<'static>> = None;
/// The MIDI input's front-panel CCs (`midi`).
static mut REMOTE: Remote = Remote::new();
/// Control voltages on inputs 3 and 4 (`cv`, `cvset`).
static mut CV: Cv = Cv::new(Settings::DEFAULT, 4000);
/// The ROM set's program list, which the browser goes through.
static mut PROGRAM_LIST: &[u8] = &[];

#[allow(static_mut_refs)]
fn browser() -> &'static mut Browser<'static> {
    unsafe { BROWSER.get_or_insert_with(|| Browser::new(ProgramList::new(PROGRAM_LIST))) }
}

/// A program list file of the `programs` command (number, tab, name) in the
/// packed form of `pack_roms.py`.
fn program_list_file(path: &std::path::Path) -> Vec<u8> {
    let mut out = Vec::new();
    for line in std::fs::read_to_string(path).unwrap_or_default().lines() {
        if let Some((num, name)) = line.split_once('\t') {
            out.extend_from_slice(&num.parse::<u16>().unwrap().to_le_bytes());
            let mut n = [b' '; 16];
            for (d, c) in n.iter_mut().zip(name.bytes()) {
                *d = c;
            }
            out.extend_from_slice(&n);
        }
    }
    out
}
static mut ROW0: String = String::new();
static mut NV_SNAP: Option<Vec<u8>> = None;
/// RAM and NV RAM as `snap` saw them.
static mut SNAP: Option<Vec<u8>> = None;
/// DSP program counters at frame ends (`dsppc`).
static mut DSP_PCS: Option<[BTreeMap<u16, u32>; 3]> = None;
/// A DSP executing an undefined opcode stops the runner (not in `report`).
static mut BAD_OP_FATAL: bool = true;
/// Print key presses and releases made by the browser (`keys on`).
static mut SHOW_KEYS: bool = false;
/// When Some, every executed instruction is counted by (bank, PC): the
/// bank latch for PCs in the bank window, else $FF (profile command).
/// Values: instructions, E cycles.
static mut PROFILE: Option<std::collections::BTreeMap<(u8, u16), (u64, u64)>> = None;

/// Run `cycles`, counting hits of watched PCs (slow path when watching).
fn run_watched(m: &mut H3000<Log>, cycles: u32) {
    #[allow(static_mut_refs)]
    let watch = unsafe { &mut WATCH };
    #[allow(static_mut_refs)]
    let profile = unsafe { &mut PROFILE };
    if m.board.host.sim.is_some() {
        // One board frame per sample period of 6809 time.
        let end = m.cpu.cycles + cycles as u64;
        while m.cpu.cycles < end {
            let h = &mut m.board.host;
            if h.next_frame <= m.cpu.cycles {
                h.sim_frame();
                h.next_frame += SAMPLE_CYCLES as u64;
                continue;
            }
            let n = (h.next_frame.min(end) - m.cpu.cycles) as u32;
            if profile.is_some() {
                let stop = m.cpu.cycles + n.max(1) as u64;
                while m.cpu.cycles < stop {
                    profile_step(m, profile.as_mut().unwrap());
                }
            } else {
                m.run(n.max(1));
            }
        }
        return;
    }
    if watch.is_empty() && profile.is_none() {
        m.run(cycles);
        return;
    }
    let end = m.cpu.cycles + cycles as u64;
    while m.cpu.cycles < end {
        for w in watch.iter_mut() {
            if m.cpu.pc == w.0 {
                w.1 += 1;
            }
        }
        match profile.as_mut() {
            Some(p) => profile_step(m, p),
            None => m.run(1),
        }
    }
}

/// One instruction, counted in the profile.
fn profile_step(m: &mut H3000<Log>, p: &mut std::collections::BTreeMap<(u8, u16), (u64, u64)>) {
    let key = (if m.cpu.pc < 0x4000 { m.board.bank } else { 0xFF }, m.cpu.pc);
    let c0 = m.cpu.cycles;
    let (pc0, bank0) = (m.cpu.pc, m.board.bank);
    let rw = unsafe { RWATCH }.map(|a| (a, m.board.ram[(a & 0x1FFF) as usize]));
    m.run(1);
    if let Some((a, v0)) = rw {
        let v = m.board.ram[(a & 0x1FFF) as usize];
        if v != v0 {
            let s = m.cpu.s;
            let stack: Vec<String> = (0..8u16)
                .map(|i| format!("{:02x}{:02x}", m.board.ram[(s.wrapping_add(2 * i) & 0x1FFF) as usize], m.board.ram[(s.wrapping_add(2 * i + 1) & 0x1FFF) as usize]))
                .collect();
            println!(
                "  [rwatch] {:04x}: {:02x} -> {:02x} by pc {:04x} bank {:02x} t={:.4} s {:04x}: {}",
                a, v0, v, pc0, bank0, m.cpu.cycles as f64 / E_HZ as f64, s, stack.join(" ")
            );
        }
    }
    if unsafe { PWATCH_HIT } {
        use h3000_emu::cpu::Bus;
        unsafe { PWATCH_HIT = false };
        let s = m.cpu.s;
        let stack: Vec<String> = (0..12).map(|i| format!("{:02x}", m.board.read(s.wrapping_add(i)))).collect();
        println!(
            "  [pwatch] pc {:04x} bank {:02x} s {:04x} u {:04x} cc {:02x}: {}",
            pc0, bank0, s, m.cpu.u, m.cpu.cc, stack.join(" ")
        );
    }
    let e = p.entry(key).or_insert((0, 0));
    e.0 += 1;
    e.1 += m.cpu.cycles - c0;
}

fn run_secs(m: &mut H3000<Log>, secs: f64) {
    let total = (secs * E_HZ as f64) as u64;
    #[allow(static_mut_refs)]
    let browser = unsafe { BROWSER.as_mut() };
    let ui = browser.is_some();
    let slice = if ui { E_HZ as u64 / 1000 } else { E_HZ as u64 / 100 };
    let mut done = 0;
    if let Some(b) = browser {
        // Print LCD row 0 whenever it changes and then stays for 20 ms.
        let row0 = |m: &H3000<Log>| (0..40).map(|i| m.board.lcd.char_at(0, i) as char).collect::<String>();
        #[allow(static_mut_refs)]
        let shown = unsafe { &mut ROW0 };
        let mut seen = (row0(m), 0u32);
        while done < total {
            m.board.host.now = m.cpu.cycles;
            run_watched(m, slice as u32);
            done += slice;
            remote_due(m);
            let k0 = m.board.keys;
            b.update(0, false, 1, m);
            if m.board.keys != k0 && unsafe { SHOW_KEYS } {
                println!("  {:7.3}s keys {:08x}", m.cpu.cycles as f64 / E_HZ as f64, m.board.keys);
            }
            let r = row0(m);
            if r != seen.0 {
                seen = (r, 0);
            } else {
                seen.1 += 1;
                if seen.1 == 20 && seen.0 != *shown && unsafe { AUTO_LCD } {
                    println!("  {:7.3}s |{}|{}", m.cpu.cycles as f64 / E_HZ as f64, seen.0,
                             if b.pending() { " pending" } else { "" });
                    *shown = seen.0.clone();
                }
            }
        }
        return;
    }
    while done < total {
        m.board.host.now = m.cpu.cycles;
        run_watched(m, slice as u32);
        done += slice;
        remote_due(m);
        if m.board.lcd.dirty && unsafe { AUTO_LCD } {
            m.board.lcd.dirty = false;
            // print only after the display settles for a slice
            run_watched(m, slice as u32);
            done += slice;
            if !m.board.lcd.dirty {
                println!("t={:.2}s pc={:04x}", m.cpu.cycles as f64 / E_HZ as f64, m.cpu.pc);
                print_lcd(m);
            }
        }
    }
}

/// Pass on the controller values the MIDI filter has held back
/// (h3000_emu::remote), as the firmware does between emulation slices.
fn remote_due(m: &mut H3000<Log>) {
    #[allow(static_mut_refs)]
    let remote = unsafe { &mut REMOTE };
    while let Some(msg) = remote.due((m.cpu.cycles / (E_HZ as u64 / 1000)) as u32) {
        for &b in remote.inject(msg).forward() {
            m.midi_in(b);
        }
    }
}

fn main() {
    let args: Vec<String> = std::env::args().collect();
    if args.len() < 3 {
        eprintln!("usage: {} <firmware dir> <v153|h3500|files:KERNEL,ROM,..> [script|@file]", args[0]);
        std::process::exit(2);
    }
    let dir = std::path::Path::new(&args[1]);
    let read = |name: &str| -> &'static [u8] {
        let v = std::fs::read(dir.join(name)).unwrap_or_else(|e| panic!("{}: {}", name, e));
        Box::leak(v.into_boxed_slice())
    };
    let roms = match args[2].as_str() {
        "image" => {
            let mut img: &'static [u8] = Box::leak(std::fs::read(dir).unwrap().into_boxed_slice());
            if !img.starts_with(b"H3K1") {
                // An LZMA-compressed image, as the firmware embeds them.
                let mut out = vec![0u8; 0x200000];
                let mut probs: Box<std::mem::MaybeUninit<h3000_emu::lzma::Probs>> = Box::new_uninit();
                let probs = unsafe { h3000_emu::lzma::Probs::init_at(probs.as_mut_ptr()) };
                let t = std::time::Instant::now();
                let n = h3000_emu::lzma::decode(img, &mut out, probs).expect("not a packed ROM image");
                println!("lzma: {} -> {} bytes in {:?}", img.len(), n, t.elapsed());
                out.truncate(n);
                if let Ok(path) = std::env::var("H3K_UNPACKED") {
                    std::fs::write(path, &out).unwrap();
                }
                img = Box::leak(out.into_boxed_slice());
            }
            let (fw, roms) = parse_image(img).expect("not a valid packed ROM image");
            println!("packed image: {:?}", fw);
            unsafe { PROGRAM_LIST = image_program_list(img).unwrap_or(&[]) };
            roms
        }
        "v153" => {
            unsafe { PROGRAM_LIST = program_list_file(&dir.join("programs-v153.txt")).leak() };
            RomSet::h3000_v153(read("H3000_153_BigROM.BIN"), read("H3000_153_SmallROM.BIN"))
        }
        m if m.starts_with("files:") => {
            // files:KERNEL,SOCKET0,SOCKET1,..: an H3500 set from any chips
            // (names relative to the firmware dir; an empty name = no chip)
            let names: Vec<&str> = m[6..].split(',').collect();
            let chips: Vec<&'static [u8]> =
                names[1..].iter().map(|n| if n.is_empty() { &[][..] } else { read(n) }).collect();
            RomSet::h3500(read(names[0]), Box::leak(chips.into_boxed_slice()))
        }
        // The set of pack_roms.py: ROM3 is the newer one of the DFX set.
        _ => {
            unsafe { PROGRAM_LIST = program_list_file(&dir.join("programs-h3500.txt")).leak() };
            RomSet::h3500(
            read("H3000-Upgrade_ROM1.BIN"),
            &[
                read("H3000-Upgrade_ROM2.BIN"),
                read("H3500_DFX/215031-A_5D00_ROM3-22.U253"),
                read("H3000-Upgrade_ROM4.BIN"),
                read("H3000-Upgrade_ROM5.BIN"),
            ],
            )
        }
    };
    let mem = Memories {
        ram: Box::leak(Box::new([0u8; 0x2000])),
        ram4: Box::leak(Box::new([0u8; 0x2000])),
        nvram: Box::leak(Box::new([0xFFu8; 0x4000])),
    };
    let mut m = Box::new(H3000::new(roms, mem, Log::default()));
    // H3K_NOHLE=1: interpret the hot loops too; H3K_HLE_EXACT=1: run them
    // natively with the interpreter's exact timing (see h3000_emu::hle).
    if std::env::var_os("H3K_NOHLE").is_none() {
        let space = Box::leak(vec![0u8; h3000_emu::hle::SPACE].into_boxed_slice());
        let mut hle = h3000_emu::hle::Hle::new(&roms, space);
        hle.exact = std::env::var_os("H3K_HLE_EXACT").is_some();
        m.set_hle(hle);
    }
    let script = args.get(3).cloned().unwrap_or_else(|| "wait 5; lcd; stats".into());
    // @file: read the script from a file (newlines separate commands too)
    let script = match script.strip_prefix('@') {
        Some(path) => std::fs::read_to_string(path).unwrap().replace('\n', ";"),
        None => script,
    };
    let t0 = std::time::Instant::now();
    for cmd in script.split(';') {
        let w: Vec<&str> = cmd.split_whitespace().collect();
        if w.is_empty() {
            continue;
        }
        println!("> {}", cmd.trim());
        match w[0] {
            "wait" => run_secs(&mut m, w[1].parse().unwrap()),
            "key" => {
                let n: u8 = w[1].parse().unwrap();
                let hold: f64 = w.get(3).map(|s| s.parse().unwrap()).unwrap_or(0.1);
                m.set_key(n, true);
                run_secs(&mut m, hold);
                m.set_key(n, false);
            }
            "knob" => m.turn_knob(w[1].parse().unwrap()),
            "press" => {
                // press n: a key press timed by the 6809's keypad reads, as
                // the panel makes them
                #[allow(static_mut_refs)]
                let b = browser();
                while !b.keys.free(&m) {
                    run_secs(&mut m, 0.001);
                }
                b.keys.press(&mut m, w[1].parse().unwrap(), 0);
                while b.keys.held() {
                    run_secs(&mut m, 0.001);
                }
            }
            "browse" | "turn" | "click" | "number" | "jump" => {
                // browse: start browsing; turn n: encoder ticks; click
                #[allow(static_mut_refs)]
                let b = browser();
                match w[0] {
                    "browse" if w.get(1) == Some(&"?") => println!("  {}", b.describe()),
                    "browse" => b.start(&mut m),
                    "turn" => b.update(w[1].parse().unwrap(), false, 0, &mut m),
                    // number: enter a program number (turn sets a digit, click moves on)
                    "number" => b.begin_entry(&mut m),
                    // jump n: move the selection by n tens of programs
                    "jump" => b.jump(w[1].parse().unwrap()),
                    _ => b.update(0, true, 0, &mut m),
                }
            }
            "factory" => {
                m.factory_reset();
                while m.busy() {
                    run_secs(&mut m, 0.1);
                }
            }
            "lcd" => print_lcd(&m),
            "programs" => {
                unsafe { AUTO_LCD = false };
                let mut out = std::io::BufWriter::new(std::fs::File::create(w[1]).unwrap());
                let n = list_programs(&mut m, &mut out);
                println!("  {} programs", n);
            }
            "nvdiff" => {
                // nvdiff: bytes of the battery-backed RAM changed since the last nvdiff
                #[allow(static_mut_refs)]
                let snap = unsafe { &mut NV_SNAP };
                let now = m.board.nvram.to_vec();
                if let Some(old) = snap.as_ref() {
                    let d: Vec<usize> = (0..now.len()).filter(|&i| now[i] != old[i]).collect();
                    println!("  nvram: {} bytes changed {:x?}", d.len(), &d[..d.len().min(16)]);
                }
                *snap = Some(now);
            }
            "powercycle" => {
                // powercycle [keep]: reset with only the battery-backed RAM
                // (bank $A0) kept; `keep` also keeps $4000-$7FFF
                if w.get(1) != Some(&"keep") {
                    m.board.ram.fill(0);
                    m.board.ram4.fill(0);
                }
                m.reset();
            }
            "report" => {
                // report <program list file> <out file>: see report_program
                unsafe {
                    AUTO_LCD = false;
                    BAD_OP_FATAL = false;
                }
                let list = std::fs::read_to_string(w[1]).unwrap();
                let mut out = std::io::BufWriter::new(std::fs::File::create(w[2]).unwrap());
                for n in list.split_whitespace().filter_map(|t| t.trim_matches(|c| c == '[' || c == ']').parse::<u32>().ok()) {
                    report_program(&mut m, n, &mut out);
                    use std::io::Write;
                    out.flush().unwrap();
                }
            }
            "scanrate" => {
                // scanrate ms: keypad row reads per millisecond
                let mut line = String::new();
                for _ in 0..w[1].parse::<u32>().unwrap() {
                    let r0 = m.board.row_scans;
                    run_watched(&mut m, (E_HZ / 1000) as u32);
                    let d: Vec<u16> = (0..6).map(|i| m.board.row_scans[i].wrapping_sub(r0[i])).collect();
                    line += &format!("{}", d.iter().map(|&x| if x > 9 { 9 } else { x }).map(|x| x.to_string()).collect::<String>());
                    line.push(' ');
                }
                println!("  {}", line);
            }
            "rates" => {
                // rates s: host-interface traffic per second over s seconds
                let secs: f64 = w[1].parse().unwrap();
                let snap = |m: &H3000<Log>| {
                    let h = &m.board.host;
                    [h.params, h.bus_writes.len() as u32, h.reads, h.firqs, h.irqs, h.calls[0], h.calls[1], h.calls[2]]
                };
                let a = snap(&m);
                run_secs(&mut m, secs);
                let b = snap(&m);
                let r = |i: usize| (b[i] - a[i]) as f64 / secs;
                println!(
                    "  per second: params {:.0}  bus writes {:.0}  bus reads {:.0}  firq {:.0}  irq {:.0}
                       status reads {:.0}  bus results {:.0}  polls {:.0}",
                    r(0), r(1), r(2), r(3), r(4), r(5), r(6), r(7)
                );
            }
            "loadtime" => {
                // loadtime n: load program n from the keypad; emulated seconds
                // from ENTER until its parameter page shows
                unsafe { AUTO_LCD = false };
                let mut keys = Keys::new();
                if !lcd_row(&m, 0).starts_with("Selected Program") {
                    press_scanned(&mut m, &mut keys, 8);
                    wait_until(&mut m, 3.0, |m| lcd_row(m, 0).starts_with("Selected Program"));
                }
                let t0 = m.cpu.cycles;
                for d in format!("{:03}", w[1].parse::<u32>().unwrap()).bytes() {
                    press_scanned(&mut m, &mut keys, DIGIT_KEYS[(d - b'0') as usize]);
                }
                let typed = (m.cpu.cycles - t0) as f64 / E_HZ as f64;
                let want = format!("[{}]", w[1]);
                let ok = wait_until(&mut m, 3.0, |m| lcd_row(m, 0)[19..].starts_with(&want));
                let t1 = m.cpu.cycles;
                press_scanned(&mut m, &mut keys, 3);
                let head = format!("{} ", w[1]);
                let loaded = wait_until(&mut m, 30.0, |m| lcd_row(m, 0).starts_with(&head));
                println!(
                    "  load {}: typed {:.2}s, shown {:.2}s, loaded {:.2}s{}{}",
                    w[1], typed, (t1 - t0) as f64 / E_HZ as f64 - typed,
                    (m.cpu.cycles - t1) as f64 / E_HZ as f64,
                    if ok { "" } else { " (number not shown)" },
                    if loaded { "" } else { " (not loaded)" }
                );
            }
            "health" => {
                // health n: load program n, play a tone and summarise the
                // output: one line per program for scanning the ROM set
                let n = w[1];
                let mut keys = Keys::new();
                unsafe { AUTO_LCD = false };
                if !lcd_row(&m, 0).starts_with("Selected Program") {
                    press_scanned(&mut m, &mut keys, 8);
                    wait_until(&mut m, 3.0, |m| lcd_row(m, 0).starts_with("Selected Program"));
                }
                for d in format!("{:03}", n.parse::<u32>().unwrap()).bytes() {
                    press_scanned(&mut m, &mut keys, DIGIT_KEYS[(d - b'0') as usize]);
                }
                let want = format!("[{}]", n);
                wait_until(&mut m, 3.0, |m| lcd_row(m, 0)[19..].starts_with(&want));
                let loads = m.board.host.loads;
                press_scanned(&mut m, &mut keys, 3);
                let head = format!("{} ", n);
                let loaded = wait_until(&mut m, 30.0, |m| lcd_row(m, 0).starts_with(&head));
                let words = m.board.host.program_words;
                let row0 = lcd_row(&m, 0);
                run_secs(&mut m, 1.5);
                let p0 = m.board.host.params;
                m.board.host.out.clear();
                m.board.host.rec = true;
                m.board.host.tone = Some((220.0, 6000.0));
                run_secs(&mut m, 1.0);
                m.board.host.tone = None;
                m.board.host.rec = false;
                let out = std::mem::take(&mut m.board.host.out);
                let k = out.len().max(1) as f64;
                let mean = |f: &dyn Fn(&(i16, i16)) -> i16| out.iter().map(|s| f(s) as f64).sum::<f64>() / k;
                let (ml, mr) = (mean(&|s| s.0), mean(&|s| s.1));
                let ac = |f: &dyn Fn(&(i16, i16)) -> i16, m0: f64| (out.iter().map(|s| (f(s) as f64 - m0).powi(2)).sum::<f64>() / k).sqrt();
                let (al, ar) = (ac(&|s| s.0, ml), ac(&|s| s.1, mr));
                let peak = out.iter().map(|s| s.0.unsigned_abs().max(s.1.unsigned_abs())).max().unwrap_or(0);
                let bad_ops = std::mem::take(&mut m.board.host.bad_ops);
                let bad = bad_ops.len();
                if bad > 0 {
                    println!("  bad ops (dsp, op, pc): {:x?}", &bad_ops[..bad.min(4)]);
                }
                let flags = m.board.host.sim.as_mut().map_or([0; 8], |b| std::mem::take(&mut b.bus.flag_writes));
                if flags.iter().any(|&f| f != 0) {
                    println!("  flag writes (Q0..Q7): {:?}", flags);
                }
                println!(
                    "HEALTH	{}	{}	{:?}	{:.0}	{:.0}	{:.0}	{:.0}	{}	{}	{}	{}",
                    n, loaded as u8 + (m.board.host.loads > loads) as u8, words, ml, mr, al, ar, peak,
                    m.board.host.params - p0, bad, row0.trim_end()
                );
            }
            "hostreads" => {
                // hostreads s: PA5 / PA6 reads per second by each DSP
                let secs: f64 = w[1].parse().unwrap();
                let r0 = m.board.host.sim.as_ref().unwrap().bus.host_reads;
                run_secs(&mut m, secs);
                let r1 = m.board.host.sim.as_ref().unwrap().bus.host_reads;
                for d in 0..3 {
                    println!(
                        "  dsp {}: PA5 {:.1}/s, PA6 {:.1}/s",
                        d + 1, (r1[d][0] - r0[d][0]) as f64 / secs, (r1[d][1] - r0[d][1]) as f64 / secs
                    );
                }
            }
            "rwatch" => unsafe { RWATCH = u16::from_str_radix(w[1], 16).ok() },
            "pwatch" => unsafe { PWATCH = u16::from_str_radix(w[1], 16).ok() },
            "dspram" => {
                // dspram d: DSP d's (1-3) data RAM, 16 words a line
                if let Some(b) = m.board.host.sim.as_ref() {
                    let ram = &b.dsps[w[1].parse::<usize>().unwrap() - 1].ram;
                    for (i, row) in ram.chunks(16).enumerate() {
                        let line: Vec<String> = row.iter().map(|v| format!("{:04x}", v)).collect();
                        println!("  {:02x}: {}", i * 16, line.join(" "));
                    }
                }
            }
            "dsppc" => {
                // dsppc s: where each DSP is at the end of frames, over s seconds
                unsafe { DSP_PCS = Some(Default::default()) };
                run_secs(&mut m, w[1].parse().unwrap());
                #[allow(static_mut_refs)]
                for (i, h) in unsafe { DSP_PCS.take() }.unwrap().iter().enumerate() {
                    let mut v: Vec<_> = h.iter().collect();
                    v.sort_by_key(|e| std::cmp::Reverse(*e.1));
                    println!("  dsp {}: {} pcs {:x?}", i + 1, v.len(), &v[..v.len().min(8)]);
                }
            }
            "auto" => unsafe { AUTO_LCD = w[1] == "on" },
            "keys" => unsafe { SHOW_KEYS = w[1] == "on" },
            // badops log: DSP undefined opcodes are collected (`stats`) instead of fatal
            "badops" => unsafe { BAD_OP_FATAL = w[1] != "log" },
            "profile" => {
                // profile on: start; profile <file>: write "bank pc instructions
                // cycles" lines (hex bank and pc; bank ff = not the window) and stop
                #[allow(static_mut_refs)]
                let profile = unsafe { &mut PROFILE };
                if w[1] == "on" {
                    *profile = Some(Default::default());
                } else if let Some(p) = profile.take() {
                    use std::io::Write;
                    let mut f = std::fs::File::create(w[1]).unwrap();
                    for ((bank, pc), (n, c)) in p {
                        writeln!(f, "{:02x} {:04x} {} {}", bank, pc, n, c).unwrap();
                    }
                }
            }
            "mem" => {
                // mem <hex addr> [len]: dump CPU-visible memory (current bank)
                use h3000_emu::cpu::Bus;
                let a = u16::from_str_radix(w[1], 16).unwrap();
                let n: u16 = w.get(2).map(|s| s.parse().unwrap()).unwrap_or(16);
                let mut line = String::new();
                for i in 0..n {
                    line += &format!("{:02x} ", m.board.read(a.wrapping_add(i)));
                }
                println!("  {:04x}: {}", a, line);
            }
            "snap" => {
                // snap: remember the RAM ($4000-$7FFF) and the NV RAM, for `diff`
                let mut v = m.board.ram4.to_vec();
                v.extend_from_slice(&m.board.ram[..]);
                v.extend_from_slice(&m.board.nvram[..]);
                unsafe { SNAP = Some(v) };
            }
            "diff" => {
                // diff: bytes changed since `snap` (RAM by CPU address, NV RAM as nv+offset)
                #[allow(static_mut_refs)]
                if let Some(old) = unsafe { SNAP.as_ref() } {
                    let mut now = m.board.ram4.to_vec();
                    now.extend_from_slice(&m.board.ram[..]);
                    now.extend_from_slice(&m.board.nvram[..]);
                    let mut line = String::new();
                    let mut n = 0;
                    for (i, (a, b)) in old.iter().zip(now.iter()).enumerate() {
                        if a != b {
                            let name = if i < 0x4000 { format!("{:04x}", 0x4000 + i) } else { format!("nv{:04x}", i - 0x4000) };
                            line += &format!("{}:{:02x}>{:02x} ", name, a, b);
                            n += 1;
                        }
                    }
                    println!("  {} changed: {}", n, line);
                }
            }
            "wwatch" => {
                // wwatch <hex addr | nvOFFSET> <secs>: run instruction by
                // instruction, printing the PC (and bank) of each write that
                // changes the byte
                let nv = w[1].strip_prefix("nv");
                let a = usize::from_str_radix(nv.unwrap_or(w[1]), 16).unwrap();
                let secs: f64 = w[2].parse().unwrap();
                let end = m.cpu.cycles + (secs * E_HZ as f64) as u64;
                let get = |m: &H3000<Log>| -> u8 {
                    match nv {
                        Some(_) => m.board.nvram[a],
                        None => m.board.ram[a.wrapping_sub(0x6000) & 0x1FFF],
                    }
                };
                let mut v = get(&m);
                let mut n = 0;
                while m.cpu.cycles < end && n < 40 {
                    let (pc, bank) = (m.cpu.pc, m.board.bank);
                    m.run(1);
                    let x = get(&m);
                    if x != v {
                        let mut stack = String::new();
                        for i in 0..12u16 {
                            let s = m.cpu.s.wrapping_add(2 * i);
                            let w = (m.board.ram[(s & 0x1FFF) as usize] as u16) << 8 | m.board.ram[(s.wrapping_add(1) & 0x1FFF) as usize] as u16;
                            stack += &format!("{:04x} ", w);
                        }
                        println!("  {:02x} -> {:02x} by pc {:04x} (bank {:02x}) t={:.4} s={:04x}: {}", v, x, pc, bank, m.cpu.cycles as f64 / E_HZ as f64, m.cpu.s, stack);
                        v = x;
                        n += 1;
                    }
                }
            }
            "seek" => {
                // seek <+1|-1> <text..>: turn the knob a detent at a time until
                // the LCD's first row contains the text (at most 200 detents)
                let dir: i32 = w[1].parse().unwrap();
                let want = w[2..].join(" ");
                let mut found = false;
                for _ in 0..200 {
                    if lcd_row(&m, 0).contains(&want) {
                        found = true;
                        break;
                    }
                    m.turn_knob(dir);
                    run_secs(&mut m, 0.12);
                }
                println!("  {} {}", if found { "found" } else { "NOT FOUND" }, lcd_row(&m, 0).trim_end());
            }
            "pokenv" => {
                // pokenv <hex offset> <hex byte>..: write the battery-backed RAM
                let a = usize::from_str_radix(w[1], 16).unwrap();
                for (i, b) in w[2..].iter().enumerate() {
                    m.board.nvram[(a + i) & 0x3FFF] = u8::from_str_radix(b, 16).unwrap();
                }
            }
            "poke" => {
                // poke <hex addr> <hex byte>..: write CPU-visible memory
                use h3000_emu::cpu::Bus;
                let a = u16::from_str_radix(w[1], 16).unwrap();
                for (i, b) in w[2..].iter().enumerate() {
                    m.board.write(a.wrapping_add(i as u16), u8::from_str_radix(b, 16).unwrap());
                }
            }
            "watch" => {
                // watch <hex pc>...: count executions; "watch" alone prints them
                #[allow(static_mut_refs)]
                let watch = unsafe { &mut WATCH };
                if w.len() == 1 {
                    for (pc, n) in watch.iter() {
                        println!("  pc {:04x}: {} hits", pc, n);
                    }
                }
                for a in &w[1..] {
                    watch.push((u16::from_str_radix(a, 16).unwrap(), 0));
                }
            }
            "dump" => {
                // dump <file>: last DSP program load and all host-latch writes
                // (FIRQ acknowledges as writes to PARAM_FIRQ_ACK)
                use std::io::Write;
                let h = &m.board.host;
                let mut f = std::fs::File::create(w[1]).unwrap();
                writeln!(f, "RUN {}", h.run_cycle).unwrap();
                for d in 1..4 {
                    for (a, v) in &h.programs[d] {
                        writeln!(f, "PROG {} {:03x} {:04x}", d, a, v).unwrap();
                    }
                }
                for (c, a, v) in &h.param_writes {
                    writeln!(f, "PARAM {} {:04x} {:04x}", c, a, v).unwrap();
                }
                for (c, p, v) in &h.bus_writes {
                    writeln!(f, "BUS {} {} {:04x}", c, p, v).unwrap();
                }
                for (c, mode) in &h.modes {
                    writeln!(f, "MODE {} {}", c, mode).unwrap();
                }
                for (c, hold) in &h.holds {
                    writeln!(f, "HOLD {} {}", c, *hold as u8).unwrap();
                }
                println!("  dumped {} params, {} bus writes", h.param_writes.len(), h.bus_writes.len());
            }
            "trace" => {
                // trace <n> [skip]: print n instructions, after skipping some
                let n: u64 = w[1].parse().unwrap();
                let skip: u64 = w.get(2).map(|s| s.parse().unwrap()).unwrap_or(0);
                for i in 0..n + skip {
                    let c = &m.cpu;
                    if i >= skip {
                        println!(
                            "  {:04x}: a={:02x} b={:02x} x={:04x} y={:04x} u={:04x} s={:04x} cc={:02x} bank={:02x} cyc={}",
                            c.pc, c.a, c.b, c.x, c.y, c.u, c.s, c.cc, m.board.bank, c.cycles
                        );
                    }
                    run_watched(&mut m, 1);
                }
            }
            "log" => m.board.host.param_log = w[1] == "on",
            "dsp" => {
                let h = &mut m.board.host;
                h.sim = Some(Box::new(Board::new()));
                h.next_frame = m.cpu.cycles;
            }
            "tone" => {
                m.board.host.tone = if w[1] == "off" {
                    None
                } else {
                    Some((w[1].parse().unwrap(), w[2].parse().unwrap()))
                };
            }
            "rec" => m.board.host.rec = w[1] == "on",
            "params" => {
                println!("  max queued host-latch writes: {}", m.board.host.max_params);
                m.board.host.max_params = 0;
            }
            "cache" => {
                if let Some(b) = m.board.host.sim.as_mut() {
                    let c = &mut b.bus.cache;
                    if w.get(1) == Some(&"reset") {
                        c.reset_stats();
                    } else {
                        let frames: u64 = c.hist.iter().sum();
                        println!(
                            "  frames {}  misses/frame {:.3}  writebacks/frame {:.3}  worst {}  round trips/frame {:.3}",
                            frames,
                            c.misses as f64 / frames.max(1) as f64,
                            c.writebacks as f64 / frames.max(1) as f64,
                            c.worst,
                            c.round_trips as f64 / frames.max(1) as f64
                        );
                        println!("  frames by misses: {:?}", c.hist);
                    }
                }
            }
            "wav" => {
                let out = &m.board.host.out;
                let mut f: Vec<u8> = Vec::new();
                let n = out.len() as u32 * 4;
                f.extend_from_slice(b"RIFF");
                f.extend_from_slice(&(36 + n).to_le_bytes());
                f.extend_from_slice(b"WAVEfmt ");
                f.extend_from_slice(&16u32.to_le_bytes());
                f.extend_from_slice(&1u16.to_le_bytes());
                f.extend_from_slice(&2u16.to_le_bytes());
                f.extend_from_slice(&44100u32.to_le_bytes());
                f.extend_from_slice(&(44100u32 * 4).to_le_bytes());
                f.extend_from_slice(&4u16.to_le_bytes());
                f.extend_from_slice(&16u16.to_le_bytes());
                f.extend_from_slice(b"data");
                f.extend_from_slice(&n.to_le_bytes());
                for (l, r) in out {
                    f.extend_from_slice(&l.to_le_bytes());
                    f.extend_from_slice(&r.to_le_bytes());
                }
                std::fs::write(w[1], f).unwrap();
                println!("  wrote {} samples", out.len());
            }
            "env" => {
                let ms: usize = w.get(1).map(|s| s.parse().unwrap()).unwrap_or(100);
                let blk = (44100 * ms / 1000).max(1);
                for (i, c) in m.board.host.out.chunks(blk).enumerate() {
                    let rms_l = (c.iter().map(|s| (s.0 as f64).powi(2)).sum::<f64>() / c.len() as f64).sqrt();
                    let rms_r = (c.iter().map(|s| (s.1 as f64).powi(2)).sum::<f64>() / c.len() as f64).sqrt();
                    let peak = c.iter().map(|s| s.0.unsigned_abs().max(s.1.unsigned_abs())).max().unwrap_or(0);
                    println!("  {:7.3}s  L {:6.0}  R {:6.0}  peak {:5}", (i * blk) as f64 / 44100.0, rms_l, rms_r, peak);
                }
            }
            "midi" => {
                // midi hex..: into the MIDI input; the front-panel CCs
                // (h3000_emu::remote) press keys and turn the knob
                remote_due(&mut m);
                #[allow(static_mut_refs)]
                let remote = unsafe { &mut REMOTE };
                let mut keys = Keys::new();
                for b in &w[1..] {
                    let r = remote.byte(u8::from_str_radix(b, 16).unwrap());
                    for &x in r.forward() {
                        m.midi_in(x);
                    }
                    match r.action {
                        Some(Action::Key(k)) => press_scanned(&mut m, &mut keys, k),
                        Some(Action::Knob(d)) => m.turn_knob(d),
                        Some(Action::Value { soft, value }) => {
                            let mut values = Values::new();
                            values.set(soft, value);
                            while let Some(k) = values.next_key(&m.board.lcd) {
                                press_scanned(&mut m, &mut keys, k);
                            }
                        }
                        None => {}
                    }
                }
            }
            "cvset" => {
                // cvset cc3 cc4 range3 range4 channel: what inputs 3 and 4
                // send (h3000_emu::cv; ranges 0-3: 0-5V 0-8V +-5V +-8V,
                // channel 1-16)
                let n: Vec<u8> = w[1..6].iter().map(|x| x.parse().unwrap()).collect();
                #[allow(static_mut_refs)]
                unsafe { CV.set(Settings { cc: [n[0], n[1]], range: [n[2], n[3]], channel: n[4] - 1 }) };
            }
            "ccsweep" => {
                // ccsweep secs cc ms: a controller turned up and down one
                // step every ms milliseconds (channel 1), through the MIDI
                // filter as at the MIDI jack; prints the DSP parameter writes
                let secs: f64 = w[1].parse().unwrap();
                let (cc, every): (u8, u32) = (w[2].parse().unwrap(), w[3].parse().unwrap());
                let p0 = m.board.host.params;
                let (mut forwarded, mut n) = (0, 0u32);
                for t in 0..(secs * 1000.0) as u32 {
                    if t % every == 0 {
                        let v = (n % 254) as i32;
                        let v = if v < 127 { v } else { 254 - v } as u8;
                        n += 1;
                        remote_due(&mut m);
                        #[allow(static_mut_refs)]
                        let remote = unsafe { &mut REMOTE };
                        for b in [0xB0, cc, v] {
                            for &x in remote.byte(b).forward() {
                                m.midi_in(x);
                                forwarded += 1;
                            }
                        }
                    }
                    run_secs(&mut m, 0.001);
                }
                println!(
                    "  {} messages, {} bytes passed on; {:.0} DSP parameter writes/s",
                    n, forwarded, (m.board.host.params - p0) as f64 / secs
                );
            }
            "cvmin" => {
                // cvmin ms: shortest time between two messages of an input
                #[allow(static_mut_refs)]
                unsafe { CV.min_ms = w[1].parse().unwrap() };
            }
            "cv" => {
                // cv secs in3 in4: run with control voltages on inputs 3
                // and 4: volts, "tri<hz>" (a triangle over the input's
                // range) or "-" (unplugged); prints the controller messages
                // sent and the DSP parameter writes
                #[allow(static_mut_refs)]
                let (remote, cv) = unsafe { (&mut REMOTE, &mut CV) };
                let steps = (w[1].parse::<f64>().unwrap() * 1000.0) as u32;
                let p0 = m.board.host.params;
                let (mut msgs, mut bytes) = (0, 0);
                for t in 0..steps {
                    let (mut raw, mut plugged) = ([0; 2], 0);
                    for i in 0..2 {
                        let spec = w[2 + i];
                        if spec == "-" {
                            continue;
                        }
                        plugged |= 1 << i;
                        let (_, lo, hi) = RANGES[cv.settings.range[i] as usize];
                        let volts = match spec.strip_prefix("tri") {
                            Some(hz) => {
                                let ph = (t as f64 / 1000.0 * hz.parse::<f64>().unwrap()).fract();
                                lo as f64 + (hi - lo) as f64 * (1.0 - (2.0 * ph - 1.0).abs())
                            }
                            None => spec.parse().unwrap(),
                        };
                        raw[i] = (volts * 4000.0) as i32;
                    }
                    let now_ms = (m.cpu.cycles / (E_HZ as u64 / 1000)) as u32;
                    if remote.can_inject(false) && m.board.acia.state().3 < 8 {
                        if let Some(msg) = cv.poll(raw, plugged, now_ms) {
                            let r = remote.inject(msg);
                            msgs += 1;
                            bytes += r.forward().len();
                            for &b in r.forward() {
                                m.midi_in(b);
                            }
                        }
                    }
                    run_secs(&mut m, 0.001);
                }
                let secs = steps as f64 / 1000.0;
                println!(
                    "  {} messages ({:.0}/s, {:.0} bytes/s), {:.0} DSP parameter writes/s; now {:?} {:?}",
                    msgs, msgs as f64 / secs, bytes as f64 / secs,
                    (m.board.host.params - p0) as f64 / secs, cv.reading(0), cv.reading(1)
                );
            }
            "hle" => match m.board.hle() {
                Some(h) => println!("  {} hooks, {} traps{}", h.len(), h.traps, if h.exact { " (exact)" } else { "" }),
                None => println!("  no hooks"),
            },
            "stats" => {
                let h = &m.board.host;
                println!(
                    "  cycles={} pc={:04x} illegal={} (last {:04x}) bank={:02x} dsp loads={} params={}",
                    m.cpu.cycles, m.cpu.pc, m.cpu.illegal, m.cpu.last_illegal, m.board.bank, h.loads, h.params
                );
                println!("  latches: {:x?}", h.latches);
                println!("  bus writes: {:x?}", h.io);
                println!("  clock modes: {:?}", h.modes);
                println!("  unmapped: {:x?}", h.unmapped);
                println!("  midi out: {:x?}", h.midi);
                println!("  acia (control, rx full, overrun, queued): {:x?}", m.board.acia.state());
                println!("  dsp bad ops (dsp, op, pc): {:x?}", m.board.host.bad_ops);
            }
            other => println!("  unknown command {}", other),
        }
    }
    let secs = m.cpu.cycles as f64 / E_HZ as f64;
    eprintln!("emulated {:.2}s in {:.2}s", secs, t0.elapsed().as_secs_f64());
}
