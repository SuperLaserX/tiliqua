# H3000 / H3500 on Tiliqua

Emulation of the Eventide H3000 (OS v1.53) and H3500 Ultra-Harmonizer. The
three TMS32010 DSPs run the original microcode as gateware (IKA32010 cores);
the softcore runs the original 6809 control firmware in an emulator, which
loads the DSP programs and computes every parameter as the original did. The
front panel is drawn on the video output and driven by the encoder.

## Layout

| Path | Contents |
|------|----------|
| `top.py` | SoC top level (`python src/top/H3000/top.py build`), 44.1 kHz audio clock |
| `h3000/board.py` | DSP board: 3 cores in lockstep, shared bus, status port, frequency synthesizers, DACs, host latch and bus slot |
| `h3000/cache.py` | 64K x 16 delay memory in PSRAM behind a block-RAM cache |
| `h3000/peripheral.py` | CSR peripheral for the softcore, CODEC streams |
| `model/` | Python reference model of the board (`board.py` is the golden reference) and test harnesses |
| `sim/` | CXXRTL simulation of the board gateware, compared event by event with the model |
| `emu/` | `h3000-emu` crate: 6809, HD44780, host board; `h3000-host` PC runner |
| `fw/` | Softcore firmware: emulator + panel UI + `DspBoard` (the emulator's `Host` on the CSRs) |
| `pack_roms.py` | The ROM sets: packs one into an image, LZMA-compressed for the firmware |
| `PROGRAMS.md` | Every H3500 program: soft keys, Soft Functions, modulation patches and MIDI assignments |
| `tools/programs_report.py` | Formats the emulator's `report` output as `PROGRAMS.md` |
| `tools/cachebench/` | The 6809 emulator as RISC-V code and `cachesim.py`: its instruction count and cache misses on the softcore, under Unicorn (`linesprof.py`, `missprof.py`: per source line) |
| `tools/kernelprof.py` | The 6809's time per kernel function, from the runner's `profile` |
| `tools/hlecheck.sh` | The natively run kernel code (`emu/src/hle.rs`) against the interpreter |
| `IKA32010/` | TMS32010 core (with fixes marked "H3000/Tiliqua fix") |
| `H3000-Firmware/` | ROM images and extracted DSP program images |

## Building

`python src/top/H3000/top.py build` builds the H3000 (OS v1.53, 69 programs) and
`python src/top/H3000/top.py build --h3500` the H3500 (OS 2.17, 780 programs). The firmware
embeds the ROM set of its variant as a packed image (`pack_roms.py`)
compressed with LZMA, which `top.py` makes and passes to `fw/build.rs` in
`H3K_ROMS`; `emu/src/lzma.rs` decodes it into PSRAM at boot. The H3500 set
is 832 KB, 135 KB compressed: its firmware is 304 KB of the 320 KB a flash
slot has for it. The image also carries the set's program list
(`H3000-Firmware/programs-<kind>.txt`, made with the runner's `programs`
command), which the front panel browses. On Windows the generated `build_top.bat` fails; run the
`yowasp-yosys` / `yowasp-nextpnr-ecp5` / `yowasp-ecppack` lines of
`build_top.sh` by hand.

The H3500 set is the OS 2.17 kernel with all five program ROMs found, 780
programs (every v1.53 program among them): `H3000-Upgrade_ROM1`-`5` with ROM3
replaced by the newer revision from the H3500 DFX set in `H3000-Firmware/H3500_DFX`
(`215031-A_5D00_ROM3-22`: changed mod factory code; 290 is INSIDE OUT 3D,
397 ACID REIGN instead of IN YOUR FACE). The DFX set itself lacks ROM5
(programs 300-363 and 400-415). `H3000 High Tide.zip` holds the same chips as
`H3000-Upgrade_ROM1`-`5`, its ROM4 a corrupted read (bytes at addresses 1 and
2 mod 4 copied from their neighbours), so it is not used.

Timing: nextpnr reports the `sync` clock at about 40 MHz against 60 MHz, but
that worst path is always inside an IKA32010 core, whose data paths are
multi-cycle (each DSP instruction cycle is four clocks and results are only
taken in the last). To see the real single-cycle paths underneath, add
`--sdf top.sdf` to nextpnr and run `sim/sta.py top.sdf '$gbuf$clk/' 16.667`.
Anything the DSP clock enable (`stall` / `pcen`) depends on must be
registered: the delay cache's hit and way select are, for that reason.
The DVI pixel clock (74.25 MHz) used to be placement-sensitive (65-72 MHz
on most seeds); with the framebuffer path registered (see Emulator speed)
it passes on every seed at 79-86 MHz. The released bitstream uses
`--seed 8`.

## The DSP board

One frame of 104 instruction cycles per 44.1 kHz sample. Port map (see
`model/board.py` for the details and timing):

| Port | IN | OUT |
|------|----|-----|
| PA0 | status: parity, DAC FSYN STAT, flags Q0-Q7 | status port: synthesizers (`$2xxx`/`$3xxx`), flags (`$8xxx`-`$9xxx`), FIRQ (`$C000`) |
| PA1-3 | mailbox | mailbox |
| PA4 | delay memory read (address += 1) | delay memory write |
| PA5 / PA6 | host latch address / data | left / right DAC |
| PA7 | ADC (left while BIO low, then right) | delay address |

The DACs are double buffered and clocked either at the input rate or by two
frequency synthesizers (period `(4096 - v) / 8` instruction cycles, `$CC0` =
unity), selected by the 6809's `$80A4/$80A5` latches; this is how the pitch
shifters change pitch. On Tiliqua each output sample is the converter value
averaged over the frame. The 6809 reads or writes one port per frame in the
host bus slot (frame position 58, unused by every DSP program).

The 6809 writes parameters through the host latch: bank `$8n` (n = 0-3)
offset `o` is latch address `n << 12 | o / 2`. Only while the DSPs are held
do banks `$81-$83` load program RAM instead. The address is a convention
between the kernel and the DSP code: bits 8-11 usually select DSPs (each
DSP checks its own bit), and the programs of ROM module `$7A` (56 programs,
between 123 and 898, e.g. 294 FAR LEFT, 833 ethereal) route their outputs and
modulation by latch addresses `$3700` and up, which they take without a DSP
check. Treating `$81-$83` as program RAM while running (an earlier mistake)
left those programs at DC or silent.

## Checking the gateware against the model

```sh
PYTHON=<venv python> sim/build.sh               # CXXRTL build (YoWASP yosys + zig c++)
sim/regress.sh "$(cygpath -m "$PWD/sim/build/tb_board.exe")"   # 26 DSP program triples
H3K_CLOCK=2,0xD45,0xBA9 py sim/compare.py <tb> <images dir> 0410 0411 0412   # synthesizer clocks
```

Traces cover every bus event, the DAC output and one host read per frame.
`SIMTOP_ARGS=--cache` builds with the PSRAM cache and a mock PSRAM.
`H3K_DUMP=<dump>` replays a recorded 6809 session (programs, host latch
writes, bus writes, clock selects; see `dump` below) with a 441 Hz tone and
logs the output only, e.g. to compare the cache build with the block-RAM
build on real delay-program traffic:

```sh
H3K_DUMP=s.txt sim/build_cache/tb_board.exe - - - 0 30000 cache.txt
H3K_DUMP=s.txt sim/build/tb_board.exe - - - 0 30000 bram.txt; diff bram.txt cache.txt
```

## Running the 6809 firmware on a PC

```sh
cd emu && cargo build --release --features std --target x86_64-pc-windows-msvc
h3000-host ../H3000-Firmware v153 "factory; wait 3; lcd; key 8; ...; dump p.txt"
py ../pack_roms.py ../H3000-Firmware h3500 h3500.lzma --lzma
h3000-host h3500.lzma image "factory; wait 4; lcd"  # a packed image, plain or compressed
py -m model.audio p.txt 30000 out.txt 441       # run the dumped session through the model
```

Commands: `wait s`, `key n [hold s]`, `knob n`, `factory`, `lcd`, `log on`,
`stats`, `midi hex..`, `dump file` (programs, host latch writes, bus writes
and clock selects); `ACIA_TRACE=1` logs each MIDI byte the 6809 reads. The
panel's key handling: `press n` (a press timed by the keypad scans),
`browse`, `turn n`, `click` (browse mode; the LCD's first row is then
printed as it changes), `browse ?` (browser state), `keys on`, `scanrate ms`
(keypad row reads per millisecond). `programs <out>` writes the ROM set's
program list (for `pack_roms.py`). A script can come from a file: `@file`. `report <list> <out>` loads each program of a
list and records its soft keys, Soft Functions and patches for
`tools/programs_report.py` (run it with `dsp on`, the samplers wait for the
DSPs); `badops log` collects DSP undefined opcodes instead of stopping.
Without DSPs the runner requests a FIRQ every 256 samples to keep parameter
updates flowing. `profile on` / `profile <file>` counts instructions and E
cycles per (bank, PC) for `tools/kernelprof.py`; `hle` counts the traps
into natively run code. `H3K_NOHLE=1` interprets that code too,
`H3K_HLE_EXACT=1` runs it natively with the interpreter's exact timing
(`tools/hlecheck.sh` compares the two). Control voltages (see below):
`cvset cc3 cc4 range3 range4 channel` (ranges 0-3: 0-5V, 0-8V, +-5V,
+-8V; channel 1-16), `cv secs in3 in4` (each input volts, `tri<hz>` for a
triangle over its range, or `-` unplugged; prints the messages sent and
the DSP parameter writes per second), `cvmin ms` (the inputs' shortest
message interval); `ccsweep secs cc ms` turns a controller at the MIDI
jack one step every `ms`.

`dsp on` (first) runs the DSP board closed loop: `emu/src/dspsim.rs`, a Rust
port of the model, advances one frame per 26 E cycles with the real FIRQ /
IRQ / bus traffic, about 9x faster than real time. `tone hz amp` / `tone off`
drive its input, `rec on`, `wav file` and `env ms` capture and summarise its
output, `cache` reports misses per frame of the gateware's delay cache
geometry, and `params` the deepest host latch queue:

```sh
h3000-host ../H3000-Firmware v153 "dsp on; factory; wait 2; key 8; wait 0.3; key 12; wait 0.3; \
    key 2; wait 0.3; key 17; wait 0.3; key 3; wait 3; rec on; tone 441 8000; wait 0.5; tone off; \
    wait 3; env 250; wav p109.wav"
```

Verified: program 103 (Stereo Shift) at +700¢ turns 441 Hz into 661.2 Hz;
program 100 (Diatonic Shift) gives 539.5 Hz / 661.2 Hz from its default
synthesizer values.

## Front panel

The encoder has four modes, shown above the keys: **knob** (turning is
the H3000's big knob; click for keys), **keys** (turning selects a key;
click presses it), **cv** (the CV key, see "Control voltages" below) and
**browse**, entered by pressing PROGRAM. Browsing goes
through the ROM set's program list: the line above the LCD shows the
selected program's number and name at once, however fast the encoder turns,
while the emulated H3000 carries on undisturbed. The selection is loaded
once it has been on show with the encoder untouched for 3 s, or at once on
a click, which also ends browsing; the PROGRAM key is lit until it has
loaded. Loading types the program's number on the kernel's program page and
presses ENTER (about a second on the H3500, wherever the program is in the
list), and tries again if the kernel did not take the number. Stepping
through the programs with the kernel's own up/down keys instead costs the
H3500 0.1-0.6 s per program.

To go straight to a program, hold the encoder down for half a second
without turning (from any mode): the line above the LCD shows `NUM 1[0]0`
and the program the number selects. Turning sets the bracketed digit, a
click moves on to the next digit and the click on the last digit loads the
program; a number with no program selects the next one up (`-> NNN name`).
Nothing loads while a number is being entered; another long press goes
back to plain browsing. Turning with the encoder held down while browsing
moves ten programs per detent. The click that ends a long press or a held
turn is ignored. In the runner: `number` (start), `jump n`.

Key presses are timed by the 6809's keypad scans (`emu/src/browse.rs`): a key
is held until a scan has read it and the next press waits until a scan has
read the key released. The kernel scans the rows in turn about every 16 ms
from its main loop, and not at all while it is busy (up to 0.6 s over some
H3500 program names), so presses of a fixed length would be lost or taken
late. Row 5 (digits 4-6, DOWN) is also read outside the scan, all the time;
its scan read is the one after row 4's. Nothing queues up while the kernel
is busy: a clicked key waits for the keypad at most 1.5 s, knob turns made
during a program load are dropped, and at most 32 knob detents wait for the
kernel.

The soft keys are orange on the H3000 build and blue on the H3500 build.

## MIDI

The TRS MIDI input feeds the H3000's MIDI port (its 6850 ACIA): the
gateware receives the bytes at 31250 baud, the firmware passes them to the
emulator, and the original OS does the rest (program changes, notes for the
pitch-tracking programs, controllers through its MIDI modulation setup,
SysEx dumps). Both OSes receive on every channel by default (Base 1,
Omni on). The H3500 loads program *n* on program change *n* (SETUP, "MIDI
Program Change Functions": Pgm=ID, Bank 0; Pgm=Map uses the map table);
v1.53 ships with program changes ignored: SETUP, "Enables for Receiving MIDI
Sequences", Pgm=Y. Like every setting, these are kept over a power cycle
(see "Memory" below).
Tiliqua has no MIDI output, so the H3000's MIDI out is only counted (the
`midi in/out` figures in the serial log).

Continuous controllers (control changes, channel pressure, pitch bend) are
passed on at most every 20 ms per controller and channel, the latest value
received in between following at the end of the interval. The kernel reads
all of its MIDI input, each byte going to all of its modules, before it
updates the parameters patched to controllers, at best some 45 times a
second; a knob turned fast sends a few hundred messages a second, and the
updates all but stop while it turns (program 150 with one patch: a message
every 3 ms gave 7 updates a second, the thinned stream 45). Bank select,
data entry and (N)RPN numbers, whose order matters, pass at once.

### Front panel by MIDI

Control changes 85-88 and 102-118, on any channel, work the front panel
(`emu/src/remote.rs`): the keys used most, the big knob, and the values of
the soft keys' parameters, so that a MIDI controller can stand in for the
panel's one encoder. They are taken out of
the stream; everything else reaches the H3000 unchanged (with the status
byte sent again where running status needs it).

| CC | Function |
|----|----------|
| 85-88 | Value of soft key 1-4's parameter (see below) |
| 102-105 | Soft keys 1-4 |
| 106, 107 | <PAGE, PAGE> |
| 108-111 | PROGRAM, LEVELS, SETUP, AUX |
| 112 | ENTER |
| 113, 114 | up, down |
| 115 | knob, absolute: turns by the change of the value |
| 116 | knob, relative, two's complement: 1-63 up, 127-65 down |
| 117 | knob, relative, offset: above 64 up, below 64 down |
| 118 | knob, relative, sign and magnitude: 1-63 up, 65-127 down |

A key is pressed by a value of 64 or more (a button's release, 0, does
nothing); up to four presses wait for the kernel, each at most 1.5 s, and
the key lights up on the screen. The knob CCs are the same knob in the
encodings controllers use: pick the one yours sends (for a relative
encoder, one step per detent). As with the encoder, knob turns are dropped
while a program loads. The keys are the H3000's own: PROGRAM opens its
program page, where the knob or up/down select and ENTER loads (program
changes do it in one step, see above). These numbers are undefined in the
MIDI specification, but an H3000 patch can take its modulation from any
controller ("Undefined Small/Large" sources): CCs 85-88 and 102-118 never
reach it. In the runner, `midi b0 66 7f` presses soft key 1.

CCs 85-88 type their value into the parameter of soft key 1-4 on the page
shown, as on the keypad: the soft key (unless its parameter is already
selected), the digits, ENTER. The value is in the parameter's units as the
keypad takes them: 1 is 1 mS of a predelay, 30 is 3.0 s of a decay shown
in tenths, and for a list (voices, waveforms) the entry's number; the
kernel keeps it within the parameter's range and steps (a decay of 3.0
becomes 3.2). A CC reaches 0-127 only: no negative values, and a parameter
that goes further (a 999 mS delay) only up to 127. Typing takes some
0.3 s; while a value is being typed only the latest from a fader is kept,
so the parameter follows the fader a few times a second and ends at its
last value. The value CCs only act on a program's parameter pages and on
the LEVELS page (elsewhere the program page would take the digits as a
program number); on a soft key that toggles something rather than editing
a value (program 100's quan=on/off) the press toggles it.

## Control voltages

Inputs 3 and 4 (jacks in2 and in3; 1 and 2 carry the audio) are control
voltages, CV1 and CV2 on the screen and in the bootloader. Each
becomes a MIDI controller, merged into the H3000's MIDI input between the
messages from the MIDI jack (`emu/src/cv.rs`), so the H3000 assigns them to
parameters itself, with its modulation patches: per program, kept with the
program when it is saved. Its kernel writes a patched parameter straight
to the DSPs as the controller changes, without any front-panel editing.
By default CV1 is CC 16 and CV2 CC 17 (the patch sources "GP
Controller # 1" and "# 2"), 0-5 V, on channel 1. To patch a parameter:

- H3500: SETUP ("Modulation of Parameters"), Patch; the knob selects the
  parameter; Source, the knob to "GP Controller # 1" (CV1) or "# 2"
  (CV2), Done; range sets how far the input moves it.
- v1.53: SETUP twice ("MIDI Modulation of Parameters"), Mod=N to switch
  MIDI modulation on (Mod=Y), then MIDI-Mod; the knob selects the
  parameter; Source, the knob to the controller, Done; range.

MIDI controllers can be patched the same way. A patch replaces the
parameter's earlier one (many factory programs patch parameters to their
Soft Functions).

A line under the keypad always shows both inputs: `CV1 CC16   64   CV2
CC17   --`, each input's controller and its value (`--`: nothing plugged
in, `off`: the input is switched off). The CV key (below ENTER) opens the
inputs' menu on the line above the LCD:
`CV1[CC 16] 0-5V  CV2 CC 17  0-5V   CH 1`. Turning changes the bracketed
field: each input's controller (0-119, or OFF) and range (0-5 V, 0-8 V,
±5 V, ±8 V), then the channel. A click sets it and moves on, and the last
click leaves the menu. Meanwhile the status line shows each input's voltage
and controller value. The settings are kept in flash with the H3000's memory
once the menu is left.

An input sends only while a cable is plugged into it (Tiliqua's jack
detection), when its value changes by a step (128 over the range, with a
quarter step of hysteresis), and at most every 20 ms. Faster would not
help: more messages leave the kernel less time to apply them (program 150,
one input patched: 45 updates a second with a message every 20 ms, 38 at
10 ms, 25 at 5 ms). A change reaches the DSPs some 20-40 ms after it reaches
the jack.

## Memory

The H3000's battery-backed RAM (16 KB: setup, MIDI setup and maps, user
programs, the current program and its edits) is kept in flash, in the
bitstream slot's option storage (64 KB, two alternating copies with a
checksum, so a save cut short by a power loss leaves the previous one). The
firmware saves it 3 s after it stops changing, a flash operation at a time
between emulation slices (`emu/src/nvstore.rs`). At start-up the newest copy
is restored and the original firmware carries on with the last program, as
the real unit does; with no saved copy it starts from the factory state.
Hold the encoder button down while the H3000 starts (until the panel shows)
to start from the factory state instead; that state is then saved over the
old one. The CV settings are kept after each copy's header (a copy saved
before they were is still restored, with the default CV settings).

## Display

The panel is laid out around the screen centre and fits inside a 720 pixel
circle (the round Tiliqua screen). It is drawn incrementally: persistence is
off and only changed LCD cells, key highlights and text lines are redrawn,
because the framebuffer DMA shares PSRAM with the CPU (which runs the 6809
emulator from PSRAM), the plotter and the delay memory, and a starved
framebuffer DMA shows as a drifting picture. For the same reason the SoC
uses a CPU variant with large L1 caches (`tiliqua_rv32im_bigcache`). The
status line shows `6809 speed/capacity%` (emulated speed, 100% = real time,
and the speed the emulator would reach with the CPU to itself), `W` the
share of time spent waiting on the DSP board (a bus slot or room in a
queue), `DSP` the worst DSP frame time against its budget, and PSRAM busy
%. The serial log adds the share of CPU time spent emulating (`emu=`), the
worst frame in clocks and waits given up (`timeouts=`). Below 100% the
emulated H3000 runs slow (its own timing, MIDI and modulation included);
the audio itself is timed by the DSP board in gateware and never slows.

## Emulator speed

The 6809 emulator must run 1.1466 M E cycles a second on the 60 MHz
VexiiRiscv, whose code and the 6809's ROMs live in PSRAM behind its L1
caches (`tiliqua_rv32im_bigcache`: 16 KB 4-way instruction cache, 8 KB
2-way data cache). `tools/cachebench` measures it offline: `cargo build
--release` there builds the emulator as the firmware does (same target,
profile and addresses) and `python cachesim.py <elf> fw/target/roms-h3500.lzma
[warm_ms] [window_ms] [--profile] [--program=N] [--firq-polls=N]` runs it
under Unicorn from a factory reset to program 100 (or N, loaded with the
keypad) idling, then counts instructions and replays fetches and data
accesses through cache models. There are no DSPs: a FIRQ comes every N
interrupt polls (1 for a gate program such as 440, whose detector asks
all the time; 175 for program 100's 30 a second). `linesprof.py` and `missprof.py`
attribute the instructions and the instruction cache misses to source
lines. On the 6809 side the runner's `profile` and `tools/kernelprof.py`
show where the kernel spends its cycles.

The hardware status line calibrates the model. The first firmware, at 38 M
instructions per emulated second, ran at 49% of real time: 170 RISC-V
instructions per 6809 instruction (the kernel executes about 226 k a
second). With the first round below, program 100 measured 127% (capacity)
and 440 81%; fitted to the bench, about 2.8 cycles per instruction (the
softcore has no branch prediction) and 54 per instruction cache miss.

- `emu/src/cpu.rs` is a new interpreter: one 256-way dispatch whose arms
  have the addressing mode fixed at compile time, instruction bytes read
  through one pointer per instruction, the stack accessed directly when it
  is in RAM, flags computed without branches, and the run loop inside the
  CPU. Only the commonest data accesses (the RAM at $6000) are inline; the
  rest is out of line and marked cold, which keeps the hot code within the
  instruction cache. Interrupts cost nothing per instruction unless one
  can be taken: one flag, kept up to date when the lines change and by
  instructions that can unmask (440's gate detector keeps FIRQ asserted
  while the kernel has it masked; checking every instruction then cost a
  third of the time). `cpu_ref.rs`, the first interpreter, is kept as the
  reference: the tests run every opcode and indexed post-byte from random
  states, random instruction streams and random interrupt lines (changing,
  and held while code unmasks them) through both and compare registers,
  cycles and every bus access.
- The DSP board's interrupt lines are polled every 8 samples instead of
  every sample (`POLL_CYCLES`), and the CPU only returns to the event loop
  after an access that can change them: runs of instructions are about ten
  times longer.
- `emu/src/hle.rs` runs the hottest kernel code natively: the NMI handler
  with its knob scan (a quarter of the 6809's cycles), two 16/16
  divisions, three walks over the H3500's 19 modules and a table search in
  module $65. Found by byte templates in both ROM sets and replaced by an
  undefined opcode in a copy of the ROM used only for code fetch, they run
  with the interpreter's own operations and cycle counts. By default a
  hooked loop finishes its pass (at most 75 cycles) before events are
  handled; in exact mode (`H3K_HLE_EXACT=1`) it stops where the
  interpreter would, and `tools/hlecheck.sh` checks that everything the
  runner records is then identical. The program health scan (39 programs,
  with the DSP board model) is identical in exact mode too.

Now, per emulated second: program 100 10.8 M instructions and 0.15 M
instruction cache misses (v1.53 10.9 M, 0.15 M), 440 with its FIRQs 12.8 M
and 0.20 M: the model predicts some 158% and 129% of real time.

The bigger caches took the design to 88% of the LUTs and 55 of 56 block
RAMs, where no placement met the 74.25 MHz pixel clock. Its critical path
was in the Tiliqua framebuffer: the timing generator derived its sync
coordinates from the timing registers in the same cycle as comparing the
counters with them, and vsync then gated the FIFO read. Both are now
registered (`tiliqua/video/dvi.py`, `framebuffer.py`; behaviour checked
cycle by cycle against the original), and every seed tried passes at
79-86 MHz. The bitstream is nextpnr seed 8, picked with `sim/sta.py` for
the 60 MHz domain: CPU register-file paths -3.4 ns (as the previous
bitstream, which works) and core-to-board paths -0.5 ns (multi-cycle).

## FIRQ rate limit

After a FIRQ acknowledge the emulated 6809 sees no new FIRQ for 1 ms. The
gate programs 440, 448 and 456 request a FIRQ on every 3-frame pass of
their gate detector while the input is quiet, faster than the kernel's
handler (about 240 E cycles, one bus read) can take them: without the
holdoff the main loop got one instruction per interrupt, so the panel
stopped answering and program changes timed out. Every other program
interrupts at most every 2 ms.

## Open items

- Bit positions of flags Q2-Q7 in the status word; NMI rate (`CLK1KS`,
  1638.4 Hz assumed from the tempo display); ADC half order.
- IKA32010 timing at 60 MHz relies on multicycle paths.
- DSP data RAM is cleared while the DSPs are held for a program load (a
  real TMS32010 keeps it): with it kept, loading some H3500 programs after
  others (e.g. 202 after 201) makes DSP 3 overwrite its own code from stale
  table addresses. The reference model always cleared it; `KEEP_RAM=1`
  keeps it in the PC simulator.
