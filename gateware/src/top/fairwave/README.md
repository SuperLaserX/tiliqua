# FairWave: a WaveScan wavetable synthesizer for Tiliqua

Status: **All phases built. Phase 6 has been played on hardware, with [sound files](#sound-files) added since, verified in
simulation and awaiting hardware.** Position past a table's ends wraps and mirrors, one oscillator can ring modulate, AM, FM or
phase distort the other, tables are band-limited, there are reading styles, grains and a factory bank, and sounds can be loaded
from a drive as text files (`library/` has 33). On hardware so far: Phases 0 to 2, a saved patch surviving a power cycle, the
Wave View ("perfect"), a real USB drive, and the factory bank ("most of the presets sound okay"). This file records what we
learned from the existing projects, the architecture, the decisions, and the phases.

Two oscillator layers read wavetables out of PSRAM. Each layer scans its table
either frame by frame (a classic wavetable) or along a tilted line through the
table treated as a 3D surface (WaveScan, below), and one can modulate the other. Two DAHDSR
envelopes that can loop, three LFOs, a modulation matrix and an output mixer sit around them. Wavetables are
`.wav` files from a USB drive. Every screen is its own round UI, and the Fairlight
CMI's waveform page is the model for the wave view.

## Terms

**Table**: a WAV holding `N` frames of `S` samples each, laid end to end (see
[Table format](#table-format)). **Frame**: one cycle of the waveform.
**Layer**: one oscillator (two of them).

**WaveScan** (our definition; the term isn't an established technique, and
searching for it turned up only general wavetable-scanning discussions):

    sample(phi) = table[ frame(phi) ][ phi ]       phi in [0, 1) is the cycle phase
    frame(phi)  = pos + shift * phi                pos, shift in frames

- `shift = 0` is the usual wavetable: `pos` selects (and blends) frames.
- `shift != 0` tilts the read line through the (phase, frame) surface, so one
  cycle crosses several frames: you read "across" the table as if it were a
  3D object. The sign is the scan direction.
- Reads are bilinear: between two adjacent samples and between two adjacent
  frames. Past the table's ends the scan clamps, wraps or mirrors (per layer).

## Assumptions

Confirmed by the user on 2026-11-02, with table format changed as below.

| # | Assumption |
|---|------------|
| 1 | WaveScan means the tilted read line above. |
| 2 | "2 wavetable layers or grains" means two oscillators. A grain mode (windowed, retriggered cycles) is deferred to the last phase. |
| 3 | Inputs: `in0` CV1, `in1` CV2, `in2` Gate1, `in3` Gate2. Outputs, by default: `out0` oscillator 1, `out1` oscillator 2, `out2` envelope 1, `out3` envelope 2. Every output is assignable. The screens call them what the panel does: `OUT 0` to `OUT 3`. |
| 4 | CV1 is 1 V/oct pitch and CV2 is wavetable position **by default**; both are re-mappable in the routing screen. |
| 5 | The synth runs at 48 kHz on Tiliqua R5, with the 16 MB PSRAM window every project here uses. (That is the codec's rate; a table's own rate means nothing to it, see [Table format](#table-format).) |
| 6 | Navigation uses the encoder (turn, click, hold) only. Touch jacks may come later. |
| 7 | A VCA with no envelope routed to it stays open (a drone). Two envelopes on one VCA multiply. |

## Table format

Decided with the user: **assume neither the frame length nor the sample rate.**

- **Frame length** is per table, a power of two from 256 to 2048 samples
  (older synths' tables are short because of their memory limits, and they
  should load unchanged). The file says so if it carries a `clm ` chunk
  (Serum) or `smpl` loop data; otherwise the loader offers a choice and
  guesses from which lengths divide the data evenly. Nothing in the engine
  or the UI may hard-code 2048: both layers can hold tables of different
  lengths at once.
- **The file's sample rate is ignored for pitch.** A frame is one cycle, so
  pitch comes from the phase increment alone: the WAV's `fmt ` rate says
  nothing about how a single cycle should sound. It is shown in the browser
  for information only.
- **Samples:** PCM 8/16/24-bit or float32, mono or stereo (summed), converted
  to 16-bit in PSRAM on load.

So the engine holds, per layer: base address, `log2(frame length)` (8 to 11),
frame count. Phase-to-index is a shift by the frame length, which makes table
length a register rather than a build parameter. The pool allocates by table
size instead of fixed slots.

## What the existing projects teach us

- **`wavplay`** shows that a bitstream can ask the bootloader (a `UsbLoad`
  region, `with_usb_load`) to copy one named file from the USB drive into a
  fixed PSRAM window before it starts. It is boot-time and fixed-filename:
  no browsing, no hot swap. Useful as a first way to hear real tables.
- **The bootloader** reads USB drives at runtime with `guh.periph.msc`
  (gateware, about 30 lines of `top.py`), the `guh-usb-msc` and `fatfs` Rust
  crates (git dependencies), and a PSRAM scratch window under `bootinfo`.
  That pair is what a runtime file browser in our own SoC needs.
- **`bfr`** is the closest model for a UI-heavy SoC with a realtime PSRAM
  master. Its README records problems we would otherwise rediscover:
  - The stock PSRAM arbiter is round-robin per transaction. A realtime master
    needs priority, or it falls behind the framebuffer and CPU cache fills.
    Stock `psram.Peripheral` has only `add_master`; BFR's `bfr/psram.py` adds
    `add_priority_master`.
  - The stock scan-out can desync for good if the framebuffer DMA is starved;
    BFR's `bfr/video.py` fixes it, and also provides `no_persistence()` (our
    UI must not fade), a registered palette and fixed DVI timing.
  - The framebuffer pixel is 4 bits of hue and 4 of intensity through a
    palette. Text is blitted from a 1 bpp sprite sheet. BFR removed the line
    plotter to save about 400 LUTs; we keep it, because the wave view and the
    envelope curves are thousands of line segments and we have LUTs to spare.
  - Placement is a lottery near 85% LUTs: try several nextpnr seeds, and run
    a PSRAM PHY route check before trusting one (a timing-clean seed once
    produced a black screen).
  - The CPU's 32 KB RAM holds data and stack with no guard. Check frame
    sizes from the disassembly; keep `main` small.
  - Firmware size matters (its slot is 320 KB); strings and tables add up.

Budget (from BFR's measurements): a bare SoC with video and USB host is about
56% of the 24,288 LUTs. Our DSP should add 2-3k. Timing starts to suffer at
82-85%, so we have room, but not unlimited.

## Architecture

```
 in0 CV1   ─┐                       ┌─ Env1, Env2 ─► VCA L1 / VCA L2
 in1 CV2   ─┤                       ├─ LFO1, LFO2, LFO3 (sync from the gates)
 in2 Gate1 ─┼─ gate detectors ──────┤
 in3 Gate2 ─┘                       │
        │                           │
        └──► mod matrix ◄───────────┘          sources:      CV1 CV2 Env1 Env2 LFO1-3
              (audio rate)                     destinations: per layer: pitch,
                 │                                           position, shift,
        ┌────────┴────────┐                                  level; mix balance
        ▼                 ▼
   layer 1 scan      layer 2 scan  ◄── PSRAM (wavetable pool), priority master
        │ VCA             │ VCA
        └───► mixer ───► each of out0-3 picks: mix, layer 1 or 2, an envelope, an LFO, or off
```

- **Oscillator engine (gateware).** Both layers share one time-multiplexed
  datapath. Per output sample a layer needs the two samples around the phase
  in each of two frames: at most 8 single-word PSRAM reads for both layers
  (two samples share a 32-bit word half the time). BFR/H3000 measured about
  28 clocks per PSRAM access, so roughly 220 of the 1250 clocks per sample
  at 48 kHz *if uncontended*. That is an estimate, not a measurement. The
  engine is a priority PSRAM master with a deadline of one sample period.
  Frames are addressed directly, so a tilted scan is only a different
  address per sample.
- **Pitch.** 32-bit phase accumulator; the increment comes from a CV-to-pitch
  path calibrated with the codec's `counts_per_v` (as BFR's `cv.rs`).
- **Aliasing.** A long frame read at high pitch skips samples; with no
  band-limiting that is audible. Band-limited levels take it out, computed by the CPU
  in the background ([Phase 6](#phase-6-as-built)). Short frames behave differently,
  and that is the point of loading them: a 256-sample frame read with linear
  interpolation has the character of the old machines it came from, which `READ` keeps
  to hand.
- **Envelopes (gateware).** Two DAHDSR generators (delay, attack, hold, decay,
  sustain level, release; attack, decay and release curves), gate edges detected
  at the sample rate. Each can loop: while its gate is high, or free-running as an
  LFO of that shape. Each has a mask of the VCAs it closes, so Gate1 can drive both
  VCAs and, through the outputs' choices, both envelope outputs.
- **LFOs (gateware).** Three, with rate, shape, polarity, phase, level and sync.
- **Mod matrix (gateware).** Twelve slots, each a source, a destination and a signed
  amount, added up at audio rate, so envelope-to-position is smooth and CV1 is
  pitch without a control tick in the way.
- **Cross modulation (gateware).** In the oscillators' datapath: ring and phase modulation between
  the layers, with the modulator computed first.
- **Mixer.** The layers crossfade into a mix bus. Each of the four outputs picks one
  of {off, mix, layer 1, layer 2, envelope 1 or 2, LFO 1, 2 or 3}.
- **Wavetable pool.** A PSRAM region at an address to be fixed in Phase 0
  against the SoC's real map (framebuffer at 0, firmware, USB scratch and
  `bootinfo` at the top). Tables are allocated by size, 16-bit samples: 64
  frames at 2048 is 256 KB, at 256 it is 32 KB, and as much again for its levels. Both layers
  can point at any resident table, so loading is separate from selecting.
- **Software.** As in BFR, a pure `cpu/` crate (no hardware, host-tested:
  WAV parsing, frame/mip geometry, envelope and matrix maths, screen
  layout) and a `fw/` crate (hardware, screens, input). A Python `model/`
  reference of the oscillator is the oracle for the gateware simulation.
- **Reuse from BFR: copy, don't import.** `video.py`, `blit.py`, `fill.py` and
  the priority arbiter are vendored into `fairwave/` (with their tests and a
  note in each file), so BFR can keep changing. Cost: fixes must be ported by
  hand. BFR's backdrop overlay is *not* reused; each screen draws its own look.
  (The scan-out overlay hook, `fb_overlay`, stays available for per-screen
  backgrounds.)
- **PSRAM map** (byte offsets, `top.py`): framebuffer at 0, UI scratch at 1 MB,
  firmware at 2 MB (320 KB at most), wavetable pool from 4 MB to 15 MB, the top
  MB reserved for USB scratch and `bootinfo`.

## Screens

Each is a distinct round layout (no shared ring-of-cells template, no
persistence trails).

| Screen | Contents |
|--------|----------|
| Oscillators | Mirrored about a column of names: table, frame, reading style, tune, fine tune, position, shift (WaveScan), scan edge mode, grain clock, level. Arc gauges at the rim for position, shift and level. |
| Wave view | The oscillator's table as stacked, skewed traces in a rhombus (Fairlight page D), with the line it is reading now drawn over them. Above: which oscillator, its table. Below: position, shift, edge, how many traces. |
| Cross Mod | What the mode makes of a cycle in a dome, the two oscillators' cycles under it, mode, who modulates and depth on an arc at the bottom, a gauge for the depth at the rim. |
| Envelopes | Tabs on an arc for the two envelopes and three LFOs: pick one, then walk its settings. The shape in a dome with a playhead under it, an arc for the live level, the times on an arc underneath in the order they happen. |
| Routing | A patch bay: sources on the left arc, destinations on the right, a line for each slot, and the slot being edited underneath. |
| Mixer / output | A crossfader arc with the layers' levels at its ends, the four outputs on an arc at the bottom. |
| Browser | Drive status, the folder's path and list, starting in a `FAIRWAVE` folder if the drive has one. The highlighted table's frame size and format, or what a patch is about. Clicking a table plays it and draws it, to keep or send back; clicking a patch plays it. |
| Patches | The eight in a ring, and on past them the factory bank's eight: load, save, erase, or back to the default patch. |
| Settings (later) | Input ranges, gate thresholds. |

Input: turn moves, click edits, long press opens the screen switcher.

## Phases

Each phase ends in something checkable. Gateware is checked in simulation
against the model and by a nextpnr timing report; "on hardware" items need
you to flash and listen.

0. **Foundation. Done; ran on hardware 2026-11-03.** Add
   `top.py` (`FairWaveSoc` on `TiliquaSoc`, vendored video overrides, no
   persistence), a firmware that draws one round screen and reads the
   encoder, and the build recipe. *Exit:* bitstream meets timing; on
   hardware the screen is steady and the encoder works.
1. **WaveScan oscillator. Done; ran on hardware 2026-11-03.** Model, gateware engine, priority PSRAM master,
   CSRs; firmware writes a generated table (sine to saw morph) into the pool
   so it sounds with no USB. Stepping stone: a `UsbLoad` of `fairwave.wav` so
   you can hear your own tables early. *Exit:* simulation bit-exact against
   the model with a PSRAM model that has latency and contention; on hardware
   it plays, scans and tilts without glitches.
2. **Envelopes, LFOs, matrix, routing, mixer. Done; ran on hardware 2026-11-03.**
   Gate detectors, DAHDSR x 2 with looping, LFO x 3, VCAs, the matrix, output
   assignment, and working screens for all of them. *Exit:* simulated envelope timing
   is exact; on hardware gates shape the audio and the envelope outputs.
3. **The look of the screens, and patches. Done; ran on hardware 2026-11-03.**
   Arc gauges and incremental redraw, each screen's own round layout, a live playhead on
   the curves, and patch save/load in flash. *Exit:* host tests for layout (everything fits
   the circle); on hardware every parameter is reachable and changes the sound, and a saved
   patch comes back after a power cycle.
4. **Wave view. Done; ran on hardware 2026-11-03.** The Fairlight-style view, read from
   PSRAM by the CPU and drawn through the line plotter, redrawn only when the table changes, with
   the read line over it. *Exit:* host tests for the projection; on hardware a 64-frame table
   redraws in well under a second.
5. **USB browser and loader. Built; simulated on a disk image; awaiting hardware.** `guh`
   mass-storage peripheral and VBUS in the SoC, FAT browsing, the WAV parser (host-tested on PCM
   16/24, float32, stereo, odd chunks), conversion into the pool, audition; added at the user's
   request, nine built-in tables and choosing an envelope or LFO before its settings. *Exit:* host
   tests; on hardware plug a drive in, pick a table, hear it, hot-swap.
6. **Polish. Built and simulated; awaiting hardware.** Band-limited levels, reading styles, the grain mode, a
   factory bank; added at the user's request, ring modulation, AM, FM and phase distortion between the oscillators, and a
   fix for position past a table's ends. Tuning against real use is what's left. *Exit:* on hardware, each sounds as it should.

7. **Sound files. Built and simulated; awaiting hardware.** Added at the user's request after playing Phase 6: patches as text
   files on a drive, a library of classic sounds to load, the Browser starting in a `FAIRWAVE` folder, fine tuning, and `GRAINS` put
   right. See [Sound files](#sound-files).

## Building and testing

From `gateware/`, with `C:\Users\SlaserX\.venvs\tiliqua-win\Scripts` on PATH (this
machine's Tiliqua environment; the repo's `.venv` is empty):

```
set PYTHONUTF8=1
set YOSYS=yowasp-yosys& set NEXTPNR_ECP5=yowasp-nextpnr-ecp5& set ECPPACK=yowasp-ecppack
set AMARANTH_USE_YOSYS=builtin
python src/top/fairwave/top.py build             (about 3 minutes)
python src/top/fairwave/tools/seeds.py --heavy   (place-and-route seeds, below)
python src/top/fairwave/tools/seeds.py --ship 6  (pack the chosen one)
python src/top/fairwave/top.py build --skip-build   (the archive, with current firmware)
python src/top/fairwave/top.py build --fw-only   (firmware alone, with the existing bitstream)
```

If `build_top.bat` "is not recognized" (BFR's README records this as a failure),
`NoDefaultCurrentDirectoryInExePath` is set in that shell, which stops `cmd.exe`
looking in the current directory. Clear it and the normal flow works.

**Seeds.** A plain build can miss 60 MHz: the slowest path is the stock one from the PSRAM
controller's state through its acknowledge into the CPU's cache, across the chip, and
whether it meets timing depends on the placement. No path in this project's own logic has
been the problem. `seeds.py` tries seeds, reports every clock and the PSRAM PHY route that
nextpnr doesn't check (`fairwave/phy_check.py`), and only packs a seed that passes both.

**Tests:**

```
cd src/top/fairwave
python -m pytest fairwave model                 (gateware against the model, 365 tests, 2 to 3 minutes)
cargo test --manifest-path cpu/Cargo.toml       (logic, 256 tests)
```

`model/test_wavescan.py` and `model/test_modulation.py` check the models against what they should
mean, in plain arithmetic, so that `fairwave/test_osc.py` and `test_mod.py` (the gateware against the
models) mean something.

**The whole SoC in Verilator**, firmware on the real CPU netlist (`fairwave/socsim.py`, this
project's own flow; it needs `oss-cad-suite` at the repository's root and `ziglang` in the
venv). `--name` keeps its firmware away from the archive you flash. About a million clocks a
second, once compiled:

```
set FAIRWAVE_SIM_ARGS=cycles=240000000 dump=0x800000,0x700000 cv=1000,1000,0,0 pulse=2,0,5000,9600,4800,150000 pulse=3,0,5000,14400,2400,160000
python src/top/fairwave/top.py sim --name FAIRWAVE-SIM --modeline 720x720p60proto1
python src/top/fairwave/tools/check_sim.py build/fairwave-sim/out --settled 148000
```

Boot takes about 134 million of those clocks, so gates and encoder events belong after that. Frames land in
`build/fairwave-sim/out` as PNGs, so the screen can be looked at. Options
for voltages and square waves on the inputs, encoder events and a file where the bootloader
would leave it are at the top of `socsim.py`. `check_sim.py --patch` names a patch set through
the screens by encoder events, listed with it, including each of the factory bank's. A simulation has
no flash, so its firmware keeps patches in free PSRAM instead (`PATCHES_IN_PSRAM`, set by the `sim` command).

## Phase 1 as built

- **Engine** (`fairwave/osc.py`, `peripheral.py`): two layers through one multiplier, reading
  PSRAM as the arbiter's priority master. Frame length, frame count and base address are one
  register per layer, so they change atomically, and table shape is never a build parameter.
- **Tables** (`cpu/src/table.rs`, `wavegen.rs`): built at boot, a 2048 x 31 harmonic morph
  (sine, triangle, saw, square) and a 256 x 16 raw pulse with moving width. Different frame
  lengths on purpose. Booting takes about 0.75 s, most of it the morph.
- **`--usb-table`** has the bootloader load `fairwave.wav` as a third table (`cpu/src/wav.rs`:
  PCM 8/16/24/32 and float32, mono or stereo, Serum's `clm ` and Surge's `srge` frame lengths).
  The bitstream then won't start without a drive in, so it is off by default.
- **The `FRAME` row** reads any table with another frame length, live: a file that doesn't
  state its length gets a guess (a 64 x 256 file divides by 2048 too), and this corrects it.
- **Pitch** comes from the increment alone, so frame length and a file's sample rate don't
  affect it. 0 V is C4. An empty jack counts as exactly 0 V, or tuning would depend on the
  board's calibration: unpatched, a board on default calibration can read 100 mV, over a semitone.
- **The oscillators screen**: turn to move, click to edit, hold for the switcher.

**Verified:**

| | |
|---|---|
| Model against the definition | floating-point reference, every edge mode and frame length |
| Engine against the model | bit-exact: frame lengths, tilt, edges, contention, parameter changes |
| Registers | through the CSR bus; a table change is atomic |
| Whole SoC against the model | both layers bit-exact for 44,000 samples on the shipped firmware, firmware to DAC stream |
| Tilt through the UI | bit-exact through 8 encoder steps, up to 6 frames a cycle |
| Tables through the data cache | every frame reached PSRAM (`cbo.clean` on the real CPU RTL) |
| 1 V/oct | +1199.33 cents at +1 V on both outputs; the harness injects in 0.6 mV (0.75 cent) steps |
| USB path | a 44.1 kHz 64 x 256 file: plays at 24 x C4 on the wrong guess, 3 x C4 once corrected |

Simulation found these before hardware did: a flat tuning error from CV smoothing (up to
3.6 cents), an empty jack detuning the synth, `exp2` off at whole negative octaves, and wavetable
key frames at the wrong level.

**Measured** (seed 6, shipped):

| | Used | Of |
|---|---|---|
| LUTs (TRELLIS_COMB) | 14,141 (58%) | 24,288 |
| Flip-flops | 7,221 (29%) | 24,288 |
| Block RAM | 31 EBR (55%) | 56 |
| Multipliers | 8 (28%) | 28 |
| System clock | 63.36 MHz | 60 MHz target |
| DVI clock | 92.76 MHz | 74.25 MHz target |
| PSRAM PHY's DATAVALID route | 1.63 ns | 2.3 ns limit |
| Firmware | 63.9 KB | 320 KB slot |
| Largest stack frame | 2.5 KB | about 32 KB of stack |
| A sample's computation, worst seen in the SoC simulation | 423 clocks | 1250 at 48 kHz |
| The same, on hardware | about 366 clocks | 1250 at 48 kHz |

The engine and its registers cost about 1,400 LUTs and 1 multiplier over Phase 0.

**On hardware** (2026-11-03): no clicks while switching screens, the CVs work, every oscillator
parameter works, and the oscillators' computation tops out around 366 clocks. The simulation's
stand-in PSRAM, at 423, was on the pessimistic side.

## Phase 2 as built

Everything here is gateware running once per sample, chained around the oscillators: inputs,
envelopes, LFOs, matrix, oscillators, mixer (`fairwave/mod.py`, `peripheral.py`). The firmware only
writes parameters when an edit changes them, so nothing depends on the 5 ms control tick any more:
a CV or an LFO moves pitch and position at audio rate.

- **Envelopes.** Delay, attack, hold, decay, sustain, release, with a curve for each of attack, decay
  and release: 0 is a straight line, positive starts fast and ends slow, like a capacitor. Times run
  from 0 to 32.8 s in steps of an eighth of an octave. A segment lasts exactly its samples up to
  1.4 s, and within 0.04% at the longest. A rising gate restarts from the current level, so there is
  no click, and a falling gate releases from wherever it has got to.
- **Looping** (`LOOP` on an envelope's tab): `GATED` repeats while the gate is high, then releases and
  stops. `FREE` repeats with no gate at all, and a rising gate restarts the cycle: an LFO of whatever
  shape the segments make. Looping, it runs delay, attack, hold, decay, release with no sustain, so
  every segment shapes the cycle, delay is the rest between cycles, and `SUSTAIN` is where decay hands
  over to release.
- **LFOs.** Three, on the same screen as tabs: rate (0.01 to 105 Hz), shape (sine, triangle, two saws,
  square, random), polarity, phase, level, sync (free, or restart on either gate), and which jacks they
  go to. Their sine is a parabola per half cycle: 3.8% third harmonic, and smooth, which is all an LFO
  needs, for no table.
- **Sources** are 5 V at the top of an envelope or the peak of an LFO. Through the matrix a pitch slot's
  100% is an octave a volt, so an LFO at 0.5%, one detent, is about +-30 cents, and a narrower vibrato takes a
  lower `LEVEL` on the LFO; anywhere else 5 V is the destination's whole range, so an envelope at 100% sweeps a whole table.
- **VCAs.** An envelope's `VCA` row closes either layer or both; two on one layer multiply, and a layer
  with none stays open. So by default both layers drone, as they did.
- **The defaults** keep Phase 1's sound: CV1 to both pitches and CV2 to both positions, gate 1 to
  envelope 1 to its jack, gate 2 likewise, no VCA closed, the LFOs running but routed nowhere.
- **Gates** are Schmitt triggers on the inputs: high from 1.5 V, low under 0.75 V.
- **Screens.** Envelopes has the five tabs; turning walks straight through the tabs' rows. Routing has the
  twelve slots. Mixer has the four outputs, balance and the layer levels. An envelope's or LFO's `SEND TO`
  row and the Mixer's rows are two views of the same choice: a jack carries one thing, so taking a jack
  displaces what it carried. `SEND TO` moves `out2` and `out3`, and also shows any other output the Mixer has
  given it.

**Verified:**

| | |
|---|---|
| Model against what it means | 43 tests in plain arithmetic: segment lengths to the sample, curves, both loop modes, retriggers, LFO shapes, 1 V/oct within 0.02 cents through the matrix, VCA routing |
| Stages against the model | 26 tests comparing every source and result each sample: all stages, curves, loops, edits mid-stage, every shape and destination, random patches |
| Audio path through its registers | 12 tests: all four outputs against the models, through a PSRAM with latency |
| Whole SoC, default patch | all four outputs bit-exact for 241,986 samples (5 s) on the real firmware (built for the simulation's fixed video mode), with CVs and gates on the inputs, while walking every screen |
| Whole SoC, edited through the screens | all four outputs bit-exact for 51,988 samples after encoder events set a VCA, both loop modes, an LFO's sync and a new matrix slot |
| Layout | every cell of the new screens fits the circle and touches nothing, for both kinds of tab |

The whole-SoC checks derive the parameters independently of the firmware (`tools/check_sim.py`), so a
mistake in its arithmetic would show. The harness records each sample's inputs, and the check picks up the
phases and levels at the first gate. It caught one mistake of its own: a key string with a detent more than it
claimed. Simulation also found a CV bias of 0.07 cents, fixed before it reached gateware.

**Measured** (seed 1, shipped). Over Phase 1 this adds 2,442 LUTs, 1,459 flip-flops, 1 block RAM and 4
multipliers; placement got easier, if anything, and all six seeds tried pass:

| | Used | Of |
|---|---|---|
| LUTs (TRELLIS_COMB) | 16,583 (68%) | 24,288 |
| Flip-flops | 8,680 (35%) | 24,288 |
| Block RAM | 32 EBR (57%) | 56 |
| Multipliers | 12 (42%) | 28 |
| System clock | 71.46 MHz | 60 MHz target |
| DVI clock | 92.52 MHz | 74.25 MHz target |
| PSRAM PHY's DATAVALID route | 1.20 ns | 2.3 ns limit |
| Firmware | 86.1 KB | 320 KB slot |
| Stack left free, running | 25.0 KB | |
| A sample's computation, worst seen in the SoC simulation | 619 clocks | 1250 at 48 kHz |
| The modulation's share, the longest possible | 206 clocks | |

**On hardware** (2026-11-03): "everything is looking good". After it, matrix amounts moved to whole
percents, and the jacks' names on the screens to the numbers on the panel: `OUT` at `1` had meant
envelope output 1, which is the jack marked `out2`.

## Phase 3 as built

Every working screen now has its own round layout, in `cpu/src/layout.rs`, where tests check that
everything fits the circle and nothing touches (see [Screens](#screens)). There is no shared template:
the screens share only their parts, which are text, arcs and lines, all incremental. Wave View and Browser
stay placeholders until Phases 4 and 5.

- **Patches** are kept in the slot's flash (`cpu/src/store.rs`): eight, with two 4 KB sectors each. That is
  the whole of a slot's option window, the 64 KB from `0xE0000` to the manifest at `0xF0000`.
  A save writes whichever sector doesn't hold the newest copy and checks it by reading it back, so power
  lost during a save costs that save and nothing else. Reflashing the slot keeps them, so a patch has a
  version number and is written field by field; a value out of range when it is read comes back in
  range. `--erase-option-storage` on the flash command clears them.
- **At boot** the patch saved last plays, or the default patch if none has been saved. The patch you are
  on shows `CURRENT`, or `EDITED` once anything has changed, so it is clear when a change isn't saved.
  There is no autosave: a patch only changes when you save it.
- **Using it:** on the Patches screen turn to pick a patch, click for `LOAD`, `SAVE`, `ERASE`, `INIT`
  and `BACK`, turn to one and click to do it. `INIT` is the default patch, with nothing saved touched.
  A patch keeps every setting on the other screens, and each table's `FRAME` length.
- **A save shouldn't touch the sound.** It runs in the main loop; the audio is all gateware, and the
  controls keep their timer interrupt. The screen stops for the length of a sector erase.
- **Live playhead:** a mark under the shape on the Envelopes screen follows the stage and how far through
  it the envelope is, or an LFO's phase. The gateware reports both (`mon2`, `mon3`).
- **Redraw:** the CPU has no FPU, and an arc that worked out a sine for each end of each line took
  295 ms to change screen, in simulation. Arcs now walk round the circle in integers (`geometry::Walk`).

**Verified:**

| | |
|---|---|
| Patch store | host tests with a flash that only clears bits: every save and load, power cut at each step of a save, a partly written copy, leftovers from another bitstream, every setting reaching the bytes, nonsense values coming back in range |
| Save and load through the screens | the patch set by encoder events, saved, layer 1 turned down, loaded again: all four outputs bit-exact for 50,985 samples |
| Boot from a saved patch | the saved bytes put in a fresh simulation's memory, no keys pressed: all four outputs bit-exact for 49,993 samples |
| Flash layout | `fairwave/test_flash_layout.py`: the regions through the flasher's own check, in every slot. Packing an archive doesn't run that check |
| Layout | every screen, both kinds of tab: on the glass, nothing touching, gauges clear of text |
| Playhead | lines up with the curve's corners, host tests; seen moving in simulation frames |

**Not checked:** the save and load path through the real SPI flash, because a simulation has no flash and
keeps its patches in PSRAM. The store's logic is tested, and the flash calls are the ones H3000 uses on this
hardware, with one difference: flash is read through the data cache, so `fw/src/flash.rs` flushes it first
with `cbo.flush`. That makes a power cycle the check that matters most for this phase.

**Measured** (seed 5, shipped). Phase 3 changes almost nothing in gateware: one monitor register.

| | Used | Of |
|---|---|---|
| LUTs (TRELLIS_COMB) | 16,435 (67%) | 24,288 |
| Flip-flops | 8,680 (35%) | 24,288 |
| Block RAM | 32 EBR (57%) | 56 |
| Multipliers | 12 (42%) | 28 |
| System clock | 64.55 MHz | 60 MHz target |
| DVI clock | 97.06 MHz | 74.25 MHz target |
| DVI 5x clock | 406.50 MHz | 371.33 MHz target; the one that fails most seeds |
| PSRAM PHY's DATAVALID route | 1.32 ns | 2.3 ns limit |
| Firmware | 120 KB | 320 KB slot |
| Chain's longest run, both layers sounding, in simulation | 597 clocks | 1250 |
| Stack left free, running | 25.2 KB | |
| Longest draw once a screen is up, in simulation | 15 to 25 ms | |

**On hardware**, the exit check for this phase. Hold the encoder for the switcher; turn to move, click to
edit:

- Every screen fits and reads well on the real panel, at arm's length. Nothing is cut off at the rim.
- Move through every parameter on every screen: each one reachable, each one changes the sound or the
  outputs. The gauges and the patch bay's lines follow.
- A gate on `in2` with the Envelopes screen open: the bar and the playhead follow the envelope.
- `SEND TO` on `ENV 1` reads `OUT 2`, and the envelope really is on the jack marked `out2`.
- **Save a patch, change something, load it:** the change goes. Save again, **power-cycle**: it comes back,
  with `CURRENT` showing on it. This is the first thing here to run on the real flash.
- Reflash the same archive: the patches should survive.
- No clicks while saving: listen across a save.
- The status line's `dsp N/1250` should stay near what simulation saw, 597 with both layers sounding. Phase 1
  read lower on hardware than in simulation, so higher than this would be news.

**Known limits:** patches are numbered, not named; times and rates step by 9% and amounts by 0.5%, with no
acceleration for fast turns, so a long sweep takes many detents; moving between tabs clears the screen for a
frame or two.

## Phase 4 as built

The Wave View (`cpu/src/wave.rs`, drawn by `draw_wave` in `fw/src/screen.rs`) is a rhombus of up to 64 traces of
128 segments each, the first frame at the front and the table going back up to the right, see-through as on the
CMI. A table is scaled so its peak stands 56 pixels off the floor, so a quiet one is as easy to read as a loud one.

- **The read line** is the white curve: the oscillator's `frame(phi) = pos + shift * phi`, read and blended as the
  gateware reads it. With `SHIFT` at zero it lies along the frames; tilted it crosses them. At `WRAP` the pen lifts
  where it jumps from the back of the table to the front; at `MIRROR` it bounces.
- **It shows what is playing, not what is set.** New monitor registers `scan0` and `scan1` report each layer's
  position and shift after the matrix, so CV2 or an LFO moves the line. So `POS` can read 40% with the line at 60%:
  the first is the setting, the second the setting plus 1 V on CV2.
- **Moving the line** can't redraw the surface: 64 traces take 130 ms, and it can move on every draw. The framebuffer
  has no layers, so the old line is rubbed out in black and only the segments of the surface it could have touched
  are drawn again. A line's pixels all lie inside the box its ends make, so comparing boxes misses nothing.
  (`Surface::under`. It is worked out before anything is rubbed out: done after, the 20 to 30 ms it took showed as
  dark pixels along the old line for a couple of frames, which the simulation's frames caught.)
- **The settings:** `OSC`, `TABLE`, `POS`, `SHIFT` and `EDGE` are the oscillator's own, the same ones the Oscillators
  screen edits, and `OSC` follows that screen's cursor. `TRACES` (8, 16, 32 or 64, at most as many as the table has
  frames, evenly through it) belongs to the view and isn't saved in a patch.
- **Drawing** takes 16 traces each time round the loop, from the back, so a large table doesn't hold the screen up.
  The surface's heights are kept in PSRAM's UI scratch (`WAVE_SCRATCH`), 16.5 KB the main RAM has no room for.

Matrix amounts now step by 0.5%, kept as half-percents. Reflashing keeps patches, so the patch format went to version
2 and a version 1 patch's amounts are doubled as it is read: `+5%` stays `+5.0%`.

**Verified:**

| | |
|---|---|
| The read line | against `model/wavescan.py`'s own samples, at clamp, wrap and mirror, level and tilted |
| Moving the line | host test with the plotter's Bresenham, after every move, on the firmware's table at 124 frames and 64 traces: exactly the surface and the new line |
| The same, in the whole SoC | CV2 swinging the line 40% of the table, 5 periods at 64 traces, through the real plotter, cache and PSRAM model: across 82 settled frames no pixel of the surface is ever dark. 3 of 23,656 changed shade, where a nearer and a further trace cross |
| Layout | everything on the glass, the surface at its full height touching no text |
| Monitor registers | gateware against the model |
| Everything else | Phase 3's two checks again on this firmware: edit, save, change and load through the screens, 50,985 samples, and boot from what was saved, 49,993 samples, all four outputs bit-exact |
| Patches | a version 1 record keeps its amounts; a record from a later version is left alone |

**Not checked:** on hardware, any of it. The draw times come from a simulation whose PSRAM runs slower than the real
one (Phase 1 read 423 clocks there against 366 on hardware).

**Measured** (seed 6, shipped). The one gateware change is the two monitor registers: 381 LUTs.

| | Used | Of |
|---|---|---|
| A table of 31 traces, drawn | 55 ms | |
| 64 traces | 130 ms | "well under a second" |
| LUTs (TRELLIS_COMB) | 16,816 (69%) | 24,288 |
| Flip-flops | 8,680 (35%) | 24,288 |
| Block RAM | 32 EBR (57%) | 56 |
| Multipliers | 12 (42%) | 28 |
| System clock | 68.14 MHz | 60 MHz target |
| DVI clock | 100.02 MHz | 74.25 MHz target |
| DVI 5x clock | 428.45 MHz | 371.33 MHz target |
| PSRAM PHY's DATAVALID route | 1.65 ns | 2.3 ns limit |
| Firmware | 126 KB | 320 KB slot |
| Longest sample seen on this screen, both layers sounding, in simulation | 626 clocks | 1250 |
| Stack left free, running | 21.8 KB | |

**On hardware**, the exit check for this phase. Hold the encoder for the switcher; `WAVE VIEW` is next to Oscillators:

- The table should appear in a blink. The serial line says how long: `wave view: 31 traces in N ms`.
- Turn CV2, or route an LFO to `POS 1` at a low rate: the white line moves through the table, and leaves nothing behind.
- `SHIFT` tilts it. `EDGE` at `WRAP` breaks it in two, `MIRROR` folds it. `TABLE` and `OSC` redraw the surface.
- On the Oscillators screen set `FRAME` shorter so the table has more frames, then `TRACES` to 64: the largest surface.
- No clicks from any of it, and the status line's `dsp N/1250` near 626 or lower.
- On Routing, amounts move by 0.5%, and a patch saved before this build still sounds the same.

**Known limits:** the line follows at the draw rate, about 28 times a second, so audio-rate modulation shows as a
snapshot. A trace has 128 points whatever the frame's length, read not averaged, so fine detail in a long frame isn't
all drawn. Frames between the traces aren't drawn, though the line reads them.

## Phase 5 as built

**The Browser** (`cpu/src/browser.rs`, `fw/src/usb.rs`, `Shelf` in `fw/src/main.rs`) lists a drive's folders and WAV
files, by their long names, sorted, folders first.

- **Turn** to pick. A moment after the highlight stops, a line says what the file is: `2048 x8  16 BIT  44 KHZ`, with
  a `~` where the frame length is a guess. A file that isn't a table says so here, before anyone tries to load it.
- **Click a folder** to go in; `.. (UP)` comes back.
- **Click a file** and it loads and plays straight away on the oscillator showing, drawn as in the Wave View. This is the
  preview: `OSC` moves it to the other oscillator, `FRAME` cuts it into frames of another length, `KEEP` keeps it, and
  `BACK` puts the oscillator back on the table it had and gives the memory back. It starts on `KEEP`.
- **A kept table** is on the `TABLE` row of the other screens, after the built-in ones.
- **Tables stay when the drive goes**, as they are in PSRAM. Pulling the drive only empties the list.

**The drive** is read, never written. The firmware asks the USB-C controller (`TUSB322`, on `I2C0`) every 250 ms whether
anything is there, powers it, and gives it 8 s to enumerate; the top of the screen says `INSERT A USB DRIVE`,
`READING THE DRIVE` or what went wrong. FAT32 only, as the bootloader reads: an exFAT drive, which most drives over 32 GB
are out of the box, says `CAN'T READ THIS DRIVE`. A read blocks the main loop, so the screen waits for it; the audio is
all gateware and the controls have their interrupt, so neither does. Pulling a drive during a read ends the read with an
error, as the library's waits watch the link.

**Memory.** 24 tables in all: the 11 built in and up to 13 from the drive, sharing about 6.5 MB of PSRAM, which holds 25
tables of 64 x 2048. If a table won't fit, loaded tables neither oscillator is playing are let go to make room. A file can
be up to 4 MB, the window it is read into before conversion, and a folder lists up to 256 entries.

**Patches** keep a loaded table by its path and frame length (format 3). Loading such a patch, or booting into it, finds the
file on the drive again. With no drive, or without the file, that oscillator plays table 0 and the Patches screen says
`NEEDS BASICS~1.WAV`; it keeps the table in the patch if saved again, and loads it when a drive arrives. The path is in 8.3
names: plain ASCII, always short enough for a patch to keep. It does mean a patch can lose a file that was copied again and
got a different `~2`. A patch's built-in tables go by number, so new ones are only ever added at the end. A version 2 patch
reads as it was: the table lengths it didn't hold keep their defaults.

**The Envelopes screen** now picks first (`ModCursor`, `cpu/src/pages.rs`). Turning moves between `ENV 1`, `ENV 2` and
`LFO 1` to `LFO 3`, a click opens one, and turning walks its settings as before, a click editing each. Past the last setting
the tab's name is underlined, and a click there goes back to picking; the hint line says so.

**Nine new tables**, made at boot from how each sound is really made (`cpu/src/wavetables.rs`). All are level across frames,
so scanning changes the timbre and not the volume:

| Table | Shape | How it's made | What scanning does |
|---|---|---|---|
| `VOWELS` | 512 x 25 | Formants of A, E, I, O and U from Peterson and Barney's measurements | A voice sings the five vowels |
| `FM BELL` | 512 x 65 | Two-operator FM, ratios 2, 3, 5, 7 in turn, the index swelling and falling for each | Bells and metal, through a plain sine between ratios |
| `CZ RESO` | 512 x 48 | Casio CZ's phase distortion: a sine read faster inside a falling window | A resonant filter sweep with no filter |
| `HARD SYNC` | 512 x 48 | A slave restarted every cycle, rising four octaves | The tearing of an oscillator sync sweep |
| `WAVEFOLD` | 512 x 48 | A sine driven into a wavefolder, an offset drifting in | West-coast folding, with even harmonics joining the odd |
| `PLUCK` | 512 x 48 | Noise with the pick's position notched out, losing its highs (Karplus-Strong's idea) | A string from the pluck to its ring |
| `HARMONICS` | 512 x 63 | A narrow peak walking up the harmonic series | Overtone singing |
| `CRUSH 256` | 256 x 32 | A short wave losing bits and sample rate together | An old machine getting older; keeps the 256-sample character |
| `SWARM` | 512 x 32 | Seven saws spreading in phase, a comb until only every seventh harmonic is left | A unison opening up |

They are worked out rather than stored, to spare the firmware slot, at the cost of boot time: 2.2 s in simulation, up from
0.75 s. The frames are 512 samples because that holds the harmonics they use and takes a quarter of the time of 2048.

**To simulate a drive** the firmware reads a FAT32 image in PSRAM through the same `UsbMsc` trait (`DISK_IN_PSRAM`, set by
the `sim` command), so the real `fatfs` and DMA stream paths run, on the real CPU. A test writes the image, with long names,
a partition table and scattered clusters: `FAIRWAVE_DISK_OUT=disk.img cargo test make_the_simulations_disk`. Then
`load=disk.img,0xB00000` on `FAIRWAVE_SIM_ARGS`.

**Verified:**

| | |
|---|---|
| File system | host tests through the real `fatfs` and `FatStream` on an image: long names, an MBR or none, scattered clusters, sorting, hidden and `._` files, a file too large |
| A drive, in the whole SoC | list, a broken file refused with a note, a 24-bit stereo file and a 16-bit file from a folder loaded: 0 samples differ from what the files hold |
| Keep, and play it | saved after keeping, all four outputs bit-exact for 77,981 samples playing the loaded table |
| Boot into it | the saved patch found its file on the image, named as in the Browser: all four outputs bit-exact for 41,990 samples |
| Everything else | Phase 3's checks on this firmware and the new Envelopes navigation: edit, save, change, load, 47,982 samples, and boot from what was saved, 41,990, all bit-exact |
| The new tables | 12 host tests against what each means: a vowel's formants where they belong, FM back to a sine, brightness rising, every seventh harmonic, level and no DC throughout; all nine seen in the Wave View |
| Preview | in the whole SoC, a file sent back twice, once after moving it to the other oscillator: the next load lands at the same address, and all four outputs then match the untouched patch for 77,984 samples. Host tests: memory running out, and the list filling, let go only of what isn't playing |
| Patches | a version 1 or 2 record reads as it was; a record from a later version is left alone |
| Layout | the Browser and preview on the glass, nothing touching |

**Not checked:** on hardware, any of it. That includes the whole of what a simulation can't reach: the USB-C controller, VBUS,
enumeration, real DMA from a real drive, drives coming and going, and `NEEDS ...` with no drive at all (in a simulation the
image is always there). That a pulled drive ends a read comes from reading the library's wait loops, not from pulling one.
Load times from a real drive are unknown.

**Measured** (seed 3, shipped). `guh`'s host and the VBUS control are the gateware's whole change:

| | Used | Of |
|---|---|---|
| LUTs (TRELLIS_COMB) | 20,981 (86%) | 24,288 |
| Flip-flops | 10,210 (42%) | 24,288 |
| Block RAM | 36 (64%) | 56 |
| Multipliers | 13 (46%) | 28 |
| System clock | 65.31 MHz | 60 MHz target |
| DVI clock | 101.90 MHz | 74.25 MHz target |
| DVI 5x clock | 436.68 MHz | 371.33 MHz target |
| PSRAM PHY's DATAVALID route | 1.59 ns | 2.3 ns limit |
| Firmware | 204 KB | 320 KB slot |
| Longest sample, both layers sounding, in simulation | 620 clocks | 1250 |
| Stack left free, running | 12.2 KB | down from 21.8 KB |
| Boot, in simulation | 2.2 s | was 0.75 s |

LUTs are past the 82 to 85% where placement starts to get harder, and it shows: of the seeds tried, 3 and 4 pass, 1 and 6 miss
the DVI 5x clock (365 and 359 MHz), and 5 crashed nextpnr itself.

**On hardware**, the exit check for this phase. A FAT32 drive with a few tables on it, some in folders, long names among them:

- With no drive the Browser says `INSERT A USB DRIVE`, and every other screen works as before.
- Plug it in: `READING THE DRIVE`, then the list. This is the first thing here to run on a real drive, so the serial log
  (`drive: ...`) matters most if it doesn't appear. Another make of drive is worth trying too.
- Turn: the detail line. Click a folder, then `.. (UP)`. The path above the list follows.
- Click a table: it should be heard and seen within moments. Try `OSC`, then `FRAME`, then `BACK`: the sound you had returns.
  Do it again and `KEEP`: it's on the `TABLE` row of Oscillators and Wave View.
- A 2048-sample file from Serum and a short one from an older synth, and a `.wav` that isn't a table.
- **Hot-swap:** pull the drive with a kept table playing. It keeps playing, and the Browser asks for a drive. Plug one back:
  it lists. Pull one while a large file is loading: a note, no hang.
- **Save a patch using a kept table, power-cycle** with the drive in: it comes back playing that table, a moment after boot.
  Without the drive: Patches says `NEEDS ...`; plug it in and the table arrives.
- Reflash over patches saved by an earlier build: they keep their amounts and frame lengths.
- No clicks from any of it, other than the table itself changing, with `dsp N/1250` near 620 or lower.
- On Envelopes: turn picks a tab, click opens it. On the nine new tables, sweep `POS` on each.

**Known limits:** a preview lasts until it's kept or sent back, on other screens too, and loading a patch sends it back; only
a drive's first FAT32 partition is read; a name past 27 characters is cut in the list, and letters outside ASCII show as `?`, as the fonts are ASCII; folders can go as
deep as 39 bytes of short names, about four levels; a table's name is its file's first 11 letters; a loaded table's samples
stay at the file's level, while the built-in ones share a peak.

## Phase 6 as built

**Position past the table's ends** (a fix, from the user's report): an LFO taking `POS` past 100% behaved the same on Wrap and
Mirror as on Clamp. The matrix was stopping position at 0% and 100% before the engine's edge rule ever saw it, so the edge
rule only applied to what `SHIFT` added. Now position reaches 8 tables either way (`pos` is signed, with 15 integer bits in the
engine), and the rule decides. On Clamp a tilted line now slides off the end of the table rather than pivoting about it, which
is the one change to a patch that already worked. The read line in the Wave View follows, as the monitor now reports position
as a fraction of the table (Q4.12): a position past the ends can't be told apart from another in frames at that width.

**Cross modulation** (`CROSS MOD`, a new screen after the Wave View). `MODE` is `OFF`, `RING`, `AM`, `FM` or `PD`; `FROM` picks the
oscillator that modulates, and the other is the carrier; `DEPTH` runs from 0 to 100% in half-percent steps, and is a matrix
destination, `X DEPTH`, so an envelope or LFO can move it at audio rate. In `model/wavescan.py`:

| Mode | What it does | At 100% |
|---|---|---|
| `RING` | carrier x (1 + depth x (modulator - 1)) | carrier x modulator |
| `AM` | the same at half the depth, which is exactly classic AM | carrier x (1 + modulator) / 2 |
| `FM` | the carrier's read phase moves by depth x modulator (phase modulation, as a DX7) | 2 cycles either way, an index of 12.6, at the modulator's full 5 V |
| `PD` | as `FM`, with the modulator read at the carrier's own phase, ignoring its own pitch | only the carrier's pitch and its harmonics |

The modulator's output is used as it leaves its `LEVEL` and VCA, so an envelope on the modulator's level does what an
envelope on an FM operator does. The carrier's output is what changes; the modulator's stays as it was (except that under `PD` it
follows the carrier's phase), and `BALANCE` on the Mixer decides how much of each to hear. Under `PD`, a triangle modulator gives
the Casio CZ's own bent saw, and any other table a bend of its own.

The screen draws what the mode makes of one cycle, at one pitch, from what each oscillator is reading now, with the two
oscillators' cycles under it. That is the truth for `PD`, and for the rest it shows the effect on a cycle's shape rather than
what comes out at another ratio.

The engine computes the modulator first, whichever it is (`layer` counts turns, and `whose` says whose turn it is), so nothing
is a sample late. Sharing the engine's multiplier keeps this cheap: `RING` needs two more products, and `AM` nothing in gateware at
all, as the firmware just halves the depth.

**Band-limited levels** (`READ` = `CLEAN`, the default). Under each table the CPU keeps its frames at half the length, a quarter and
so on, down to 8 samples, each holding only what a pitch that reads it can use (`cpu/src/mip.rs`). A level is made by halving the
length twice with a half-band filter and then doubling it once, so it holds half what it could: most of what is left otherwise is
linear interpolation's own images, and this takes another 10 to 16 dB off the aliasing for no more memory. The engine picks the level from the
increment each sample, with no extra reads. Against the plain read, with a saw, below 12 kHz, where it is heard:

| Pitch | Plain | Clean |
|---|---|---|
| 880 Hz | -21 dB | -48 dB |
| 1.76 kHz | -17 dB | -41 dB |
| 3.5 kHz | -14 dB | -38 dB |
| 4.3 kHz | -13 dB | -41 dB |

It isn't alias-free. Counted all the way up, more is left, between 12 and 24 kHz: -27 dB at 1.76 kHz and -16 dB at 4.3 kHz, from -13 and
-9 on the plain read. A level changes where the step through the frame reaches 3 samples a sample, half way between folding a little back in the
top octave and losing too much of it: at that point the top harmonics reach 0.6 of the sample rate, and they reach 0.3 just after.

The levels are made in the main loop, a frame at a time, the tables playing first, and a table plays as it stands until all of
its levels are there; then they come on at the next sample. So boot takes as long as before, and a file loaded from a drive
plays at once. In simulation the tables playing are done within about 1 s of being asked for, and all eleven built-in tables within
about 3.8 s of boot. They take as much PSRAM again as the table itself, so the pool now holds about 11 loaded tables of 64 x 2048 rather than Phase 5's 25. A table needs reading in whole frames to have levels
(they go straight after its frames): one whose `FRAME` setting doesn't divide its length plays as `PLAIN` however `READ` is set.

**Reading styles** (`READ`, on the Oscillators screen, per oscillator):

| Style | Levels | Between samples | Between frames | Sounds like |
|---|---|---|---|---|
| `CLEAN` | yes | blended | blended | modern |
| `PLAIN` | no | blended | blended | every earlier build: aliases at high pitch |
| `STEPS` | no | blended | stepped | a PPG, with its audible steps through a table |
| `RAW` | no | stepped | stepped | stairs, at its coarsest on a short table |

**Grains** (`GRAIN`, on the Oscillators screen, per oscillator). `OFF`, or the LFO whose cycles make grains: at each cycle's start
the oscillator goes back to the top of its cycle and takes up its position, holding it until the next, so a grain stays on one
place in the table however the position moves in between. That is all the gateware does. The rest of granular synthesis comes
from what is already here: a slot from that LFO onto the oscillator's `LEVEL`, with the LFO unipolar, is the grain's window; the
LFO's rate, up to 105 Hz, is the grain rate; a `RANDOM` LFO onto `POS` is the spray; and with
`LEVEL` at 0 on the Oscillators screen, the window is all there is. With no window it is a hard sync from an LFO, which is
worth having too. The `GRAINS` preset is all of this set up.

A cycle starts when the LFO's phase counter wraps, and its `PHASE` setting only offsets the shape it reads from that. So two things
follow, both of which this section and the first `GRAINS` got wrong, and which the user caught as "mostly noise" (see
[Sound files](#sound-files)). A window is only shut when a grain starts if it is a `SINE` or `TRI` at `PHASE` 270: at 0, the default,
it is at 50% and every restart clicks. And `PHASE` can't stagger two streams: two LFOs at one rate restart on the same sample
whatever their phases, so overlapping streams need two different rates.

**The factory bank.** Turning on past patch 8 on the Patches screen reaches eight patches that come with the firmware
(`cpu/src/presets.rs`): `LOAD` plays one, and it can be saved over a patch of your own; `SAVE` and `ERASE` won't touch them. All sound
with nothing patched. Between them they show each thing above:

| Patch | What it shows |
|---|---|
| `VOWEL RIDE` | An LFO taking position 150% past the table's ends, one oscillator wrapping and one mirroring |
| `FM CHIME` | FM at a bright ratio, an envelope on the modulator's level dying as a struck thing does |
| `RING GLASS` | A rich table ring modulated by a sine a fifth up |
| `AM FLUTTER` | AM, with an LFO on the depth |
| `CZ BEND` | Phase distortion by a triangle, an LFO opening and closing the bend |
| `GRAINS` | Two streams of slow grains drifting over each other, a `TRI` LFO walking their place in the table (changed: see [Sound files](#sound-files)) |
| `TILT SWARM` | An LFO on `SHIFT`, tilting the read line opposite ways on each oscillator |
| `LOFI STEPS` | `RAW` and `STEPS` reading, stepping through a crushed table |

These are starting points chosen by reasoning about the parameters, not by ear: none has been heard yet, so expect some to want
changing. Patches are format 4 now. Earlier ones read as they were, with `READ` at `CLEAN`, no grains and no cross modulation,
so an older patch sounds a little cleaner at high pitch and is otherwise the same.

**Not done from the plan:** more banks of user patches. The slot's 64 KB holds eight, each with a copy for power cuts, and
fitting more would mean changing a format that has only just been shown to work. Cubic interpolation neither: it needs four reads a
frame, twice the PSRAM traffic, for what the levels mostly already give. Tuning against real use waits for real use.

**Verified:**

| | |
|---|---|
| Models against their meaning | in plain floating point: position past the ends by each rule; levels' pass and stop bands, DC, their addresses; aliasing measured across the keyboard; FM, PD (harmonics only, measured), ring and AM as defined; grains restarting and holding |
| Gateware against the models | bit-exact: every level of every frame length, the furthest position and tilt on the largest table, every reading style by every edge rule, all four modes both ways round, grains from each LFO, under PSRAM contention |
| Firmware's levels | every table reaching an oscillator in the runs below, all 0 samples different from the model's own making of them: 63,488 samples of `MORPH 2048` and so on down |
| All eight presets, whole SoC | each loaded through the screens with the encoder, each derived independently in `check_sim.py`, then all four outputs bit-exact for 53,590 samples or more |
| The sample levels come on | it can be worked out with the old count or the new, depending on when the write lands, and the check insists on one or the other at that one sample and exactness at every other |
| Editing, saving, loading | Phase 3's checks on this firmware and the new page order: 47,982 samples, bit-exact |
| Patches | format 3 reads with its files intact and these settings at their defaults; nonsense values come back in range; every preset survives being bytes |
| Layout | the new screen and the extra rows on the glass, nothing touching; seen in simulated frames |

**Not checked:** on hardware, any of this. The presets haven't been heard, and no test can say whether a mode sounds good. A level
changing as a pitch sweeps across it may be audible as a small step; it should be slight, as the two levels differ only in their top
octave, and the on-hardware list below asks for it.

**Measured** (seed 1, shipped). 302 more LUTs by the synthesis's count, 183 of them in the engine:

| | Used | Of |
|---|---|---|
| LUTs (TRELLIS_COMB) | 21,297 (87%) | 24,288 |
| Flip-flops | 10,332 (42%) | 24,288 |
| Block RAM | 36 (64%) | 56 |
| Multipliers | 13 (46%) | 28 |
| System clock | 67.62 MHz | 60 MHz target |
| DVI clock | 94.79 MHz | 74.25 MHz target |
| DVI 5x clock | 464.47 MHz | 371.33 MHz target |
| PSRAM PHY's DATAVALID route | 1.33 ns | 2.3 ns limit |
| Firmware | 216 KB | 320 KB slot |
| Longest sample, in simulation | 607 clocks | 1250 |
| Stack left free, running | 13.1 KB | was 12.2 KB |
| Boot, in simulation | 2.2 s | unchanged |

Despite more LUTs, placement was far easier than Phase 5's: 7 of 8 seeds pass, with more margin on the system clock than any
before. Nothing here says why, and the next change may not be so lucky.

**On hardware**, the exit check:

- `VOWEL RIDE` first, as it is the bug you found: position should go round past the table's ends, differently on each oscillator, and
  neither should sit still at an end. The Wave View's read line should go round with it.
- Each factory patch, and whichever sound worth keeping as they are. Gate 1 restarts most of what runs free.
- `CROSS MOD`: each mode, both ways round with `FROM`, sweeping `DEPTH`. Try a modulator tuned up with `TUNE`, and an envelope on
  its `LEVEL` for FM.
- `READ`: on a saw (`MORPH 2048`, `POS` about 66%) at a high pitch, `PLAIN` against `CLEAN`. And sweep the pitch slowly on `CLEAN`:
  a step you can hear where a level changes is worth telling me about.
- `GRAIN`, with and without a window.
- Load a table from a drive and play it high straight away: it should clean up by itself within a moment. Change its `FRAME`: the same.
- A patch saved by an earlier build still loads and sounds the same at ordinary pitches.
- `dsp N/1250` stays under about 607, and no clicks when changing screens.

## Sound files

The user's report on Phase 6: the USB drive worked, most presets sound okay, `GRAINS` is mostly noise, and could the sounds live on
a drive, in a simple file holding everything, rather than all in the build.

**Patch files** (`cpu/src/patchfile.rs`, reference in [`library/README.md`](library/README.md)) are text, with the extension `.fwp`, under the
names the screens show:

```
FAIRWAVE PATCH 1
NAME  = PSY SNAP
ABOUT = ROLLS ABOUT 145 BPM, GATE RESTARTS

[OSC 1]
TABLE = TABLES/SAWLP.WAV
TUNE  = -24
POS   = 22%

[ENV 1]
ATTACK = 1 MS
DECAY  = 64 MS
SUSTAIN = 0%
LOOP   = FREE
VCA    = BOTH

[ROUTING]
CV 1 > PITCH 1 = 100%
ENV 1 > POS 1  = 46%
```

Text rather than `store.rs`'s bytes because anyone can read and write it with no tool, a file says only what differs from the default
patch, and it needs no version handling: a later firmware's settings are just lines an older one leaves out and counts. What a file
doesn't say stays at the default, a value out of range stops at its end, and a line not understood is skipped and counted, so a slip
costs that line and not the sound. The screens can't write one, as the drive is only ever read: a patch from a
file can be saved to flash from the Patches screen, which keeps the path to its tables.

**The Browser** starts in a folder called `FAIRWAVE`, in any case, if the drive has one, and in the root if not. Patch files list alongside tables.
Turning to one shows its `ABOUT`, read from its first kilobyte. Clicking plays it straight away and stays in the list, so sounds can be
walked through, with no keep-or-back step: nothing is lost that a Patches `LOAD` wouldn't lose.

**A patch's tables** go by name: a built-in one (`TABLE = VOWELS`), or a file, looked for from the patch's folder and then from
`FAIRWAVE`, by either of its names, and kept as a path of short names as ever. While they load the outputs are hushed rather than playing the wrong
table (`Words::hush`). That now covers a patch from flash too, so a saved patch waiting for its file is silent until it arrives or can't be
found; then it plays table 0 and says `NEEDS`, as before. If the pool is too full for a patch's tables, everything loaded is let go and they
load again from its bottom (`Library::let_all_go`), since a table at the top of the pool can't otherwise be got past: this drops kept tables that aren't
playing, which running out of room already did.

**`FINE`** is a new row on the Oscillators screen and in patches (format 5), in cents up to 50 either way: a Reese is two saws a few cents apart, and
semitones couldn't do that. It's firmware only: the gateware's pitch is already in Q.16 octaves. Earlier patches read as in tune. The rows moved
closer together to fit it, 32 pixels apart rather than 36.

**The library** (`library/FAIRWAVE`, 33 patches and 13 tables, 1.6 MB; [its README](library/README.md) lists them) goes on a drive as it is: `REESE`,
`ROLLING`, `BASS`, `CLASSIC`, `TABLES`. With no filter here, a table's frames are what a filter at some cutoff would leave (`tools/make_library.py`), so
`POS` is the cutoff and an envelope on it a filter envelope, following the note. Frames are 1024 samples: 512 harmonics are plenty for a
bass, and all 13 fit the pool and the 13 places for loaded tables at once, so walking the library never runs out. The rolling patches are one looping
envelope on both the VCA and `POS`, as two free-running ones wouldn't stay in step: nothing resets an envelope when a patch loads.

**`GRAINS` was wrong**, three ways, none of them the feature's. Measured in the model:

| | First version | Now |
|---|---|---|
| Window when a grain starts | 50%, every time: triangle at `PHASE` 0 | 0%: sine at `PHASE` 270 |
| Output's jump at a grain start, median | 4,367 counts, 18 times the ordinary movement | 47 counts, a fifth of it |
| Grains | 20.48 a second, 49 ms | 2.56 and 3.62 a second, 391 and 276 ms |
| Streams starting on the same sample | all of them: I had thought `PHASE` staggered them | none, in 8 s |
| Place in the table, from one grain to the next | 41.5% of it, at random | 7.2%, a slow walk |

So it was twenty hard clicks a second, each landing on a timbre about a random half a table from the last, on two tables built to change a lot from
frame to frame. The test said "the streams overlap", because it only checked that `PHASE` was 180. It now works out the window's value at the start of
its cycle, and the rates are held to differ.

**To hear a sound without flashing**, `tools/render_patch.py` plays a patch through the models and writes a WAV. Every sound here was rendered and
measured that way, for level, DC and how fast it changes, and looked at as a spectrogram. That caught Reese Neuro's FM being far too hot (jumps of 25,000 counts in a
sample), Glass Bell's band sitting above what its pitch could play, Grain Spray's table changing too little from grain to grain to hear, and Acid Roll at half
the level of the others. They are still chosen by reasoning and by looking, not by ear.

**Verified:**

| | |
|---|---|
| The parser | 22 host tests: every setting, every name a screen shows, values out of range, slips counted and the rest kept, a file that isn't one, 400 runs of nonsense with no panic, and whatever is read a patch can keep |
| Firmware against the model | `tools/check_library.py`: two parsers written apart agree on every word sent to the gateware, for all 33 patches, and on the tables each names |
| Finding things | through the real `fatfs` on an image: a folder in any case, a file by either name, relative paths, `..`, a folder with no `FAIRWAVE` |
| A patch file, in the whole SoC | clicked in the Browser, tables found on the image, all four outputs bit-exact: Psy Snap and Reese Over Sub (after another patch) 67,986 samples, Reese Classic, FM Solid (a built-in table by name) and Grain Drift 63,987 |
| Saved from a file | Reese Classic saved to a slot, then a fresh boot from those bytes with no keys: its table found again, 63,987 samples bit-exact |
| The hush | the outputs stay at exactly 0 until a patch's last table is in, and match to the sample from then on: its length, 1,491 samples in one run and 7,613 in another, is when that table was logged |
| No `FAIRWAVE` folder | the root lists, and a table loads and plays as before: 63,987 samples bit-exact |
| Broken files, in the whole SoC | a missing table says `NEEDS NOPE.WAV` and plays table 0; a file that isn't a patch is refused with a note; slips say `2 LINES NOT UNDERSTOOD` and name line 5 in the log. All seen on the screen too |
| The rest | the new `GRAINS` 63,987 samples and edit, save, change, load 55,982, bit-exact; older patches' format read as format 5 in a host test; 290 host tests and 365 gateware and model tests pass |
| Layout | the Oscillators screen's tenth row and the Browser's new lines on the glass, nothing touching; seen in simulated frames |

**Measured.** The gateware didn't change at all, so this is the same bitstream as Phase 6, byte for byte, and its timing stands:

| | |
|---|---|
| Firmware | 238 KB of the 320 KB slot, up 22 KB |
| Stack left free, running, after loading patch files | 9.9 KB, down from 13.4 KB |
| Loading a patch with two tables, in simulation | 1.2 s from the click to sound, 0.7 s of it quiet. A real drive will differ |
| Library on a drive | 1.6 MB |

**Not checked:** on hardware, any of it. Nobody has heard a sound in the library, or the new `GRAINS`. In a simulation the "drive" is an image in PSRAM, so
nothing here has read a patch file over real USB, though the path it uses is the one that read tables for the user. A real drive's folder named `fairwave`
is found by the same code as the image's, but with a different short name. The free-running rolls' tempo is the sum of their segments' steps, so it's
about 145 BPM (145.6 by the numbers) and can't be set exactly: a gate from a sequencer is what puts one on the beat.

**On hardware:**

- Copy `library/FAIRWAVE` to the top of the drive. The Browser should open inside it, with `.. (UP)` as the first row.
- Turn to a sound: its `ABOUT` line appears. Click: it plays within moments, and the outputs are quiet until its tables are there.
- Walk through `ROLLING` with nothing patched, then with sixteenths on gate 1: the loop should follow the gate.
- `REESE`: `FINE` on the Oscillators screen should show `-9 ct` and `+9 ct` on Reese Classic. Do they phase slowly, as a Reese should?
- A patch from a file, saved to a slot: power-cycle with the drive in, and it comes back, tables and all.
- Factory `GRAINS`: should be slow, soft and clickless, each grain audibly a different vowel or bell.
- A drive with no `FAIRWAVE` folder starts at its root, as before.
- Old patches should sound the same: format 4 reads as format 5 with `FINE` at 0.

**Known limits:** a `FAIRWAVE` folder has to be at the top of the drive; a drive's patch can't be written back to it; a free-running envelope's phase isn't reset on
loading a patch, so two in one patch keep whatever relationship they fall into until a gate restarts them; and a table's formants or filter follow the note,
so `TALK`'s vowels are only right around C2.

## Repository notes

- **Submodules.** The import into this repository dropped the submodules' git metadata, so
  `git.Repo('deps/VexiiRiscv')` raised and no SoC could elaborate here. Both are restored from
  the old checkout's metadata, with their working trees untouched. They sit where the old checkout
  had moved them, ahead of what this repository records: `VexiiRiscv` at `de53da01` (recorded
  `dd2fb21c`) and `sid` at `560d226` (recorded `9e7af498`). Every cached netlist for BFR, H3000 and
  FairWave is keyed on `de53da01`, so `git submodule update` would change the CPU and force
  sbt to regenerate them all, until the recorded commits are updated to match. (`.git/config`
  sets `ignore = all` on both, so `git status` doesn't show this; `git submodule status` does.)
- **The venv's editable `tiliqua`** points at the old `D:\midi\tiliqua` checkout, so `top.py`
  and `conftest.py` put this tree's `src` first.
- **Shared code is never edited**: anything that changes core behaviour is overridden from
  this folder (`fairwave/video.py`, `socsim.py` and so on).
- **The shared test driver `src/tb_cpp/i2s.h`** takes channel 2's next sample twice a frame. A constant
  voltage never showed it; a gate pattern ran at double speed. `sim/tb_soc.cpp` queues that channel's samples
  twice, rather than changing what other projects' simulations rely on.

## Risks

- The DSP's deadline has margin, about half of it, against 1250 clocks. The status line (`dsp N/1250`) shows it.
- Real USB hasn't run. The drive's path below the `UsbMsc` trait, the USB-C controller and VBUS are the
  bootloader's on this hardware, used the same way, but only a real drive will show.
- Past 85% LUTs, a future gateware change may not place, however many seeds are tried.
- The stack has 13.1 KB left free, with no guard under it. `dsp longest ... stack free` in the serial log
  reports what running has left; a folder on a real drive shouldn't take more than the image did, but
  that log line is worth a look.
- Booting takes about 2.2 s, nearly all of it making the built-in tables. Audio starts after that.
- The build fetches git dependencies (`guh`, a `fatfs` fork) on first use, which needs network access.
- A level changing as a pitch sweeps across it could be heard as a small step. If so, the place to look is `mip_level` and the
  filter: the levels themselves cost only memory and CPU.

## Decisions

| Date | Decision |
|------|----------|
| 2026-11-02 | Own project under `top/fairwave`; model it on BFR's structure (cpu/fw/model split, README as the record). |
| 2026-11-02 | Frame length and table sample rate are not assumed: length is per table (256 to 2048), a register in the engine; a file's sample rate never affects pitch. |
| 2026-11-02 | Direct PSRAM reads (no BRAM frame cache) for the oscillator, with a priority master. Revisit if measured contention says otherwise. |
| 2026-11-02 | Envelopes and the mod matrix in gateware, at audio rate. |
| 2026-11-02 | Runtime USB browsing through the SoC (`guh`), with the bootloader's `UsbLoad` only as a stepping stone. |
| 2026-11-02 | Vendor BFR's video, blit, fill and arbiter code rather than import it. |
| 2026-11-02 | Keep the stock line plotter (BFR stubbed it out): the wave view and envelope curves are made of lines. |
| 2026-11-02 | Use BFR's CPU variant and memory map, so the netlist it ran on hardware is reused as is. |
| 2026-11-03 | Anything changing core behaviour is overridden in this folder, never edited in shared code. |
| 2026-11-03 | Submodules restored at the commits their working trees and cached netlists match, not the recorded ones. |
| 2026-11-03 | An empty input jack is exactly 0 V; a reading past 150 mV counts as patched regardless. |
| 2026-11-03 | The `FRAME` row reads a table with another frame length, so a wrong guess can be corrected before Phase 5's loader. |
| 2026-11-03 | The whole SoC is simulated with this project's Verilator flow, checked bit for bit against the model. |
| 2026-11-03 | Added at the user's request to Phase 2: three LFOs, edited on the Envelopes screen, and envelopes that can loop. |
| 2026-11-03 | A looping envelope runs delay, attack, hold, decay, release with no sustain, either while its gate is high (`GATED`) or always (`FREE`, where a gate only restarts it). |
| 2026-11-03 | Phase 2 includes working Envelopes, Routing and Mixer screens, because it can't be checked on hardware without them; Phase 3 is their look. |
| 2026-11-03 | The matrix is twelve slots, not a full grid: 7 sources by 9 destinations would be 63 amounts, nearly all zero. |
| 2026-11-03 | Each output picks one source; two envelopes don't sum on a jack. Output 3 and 4 can also carry an LFO, and output 1 and 2 an envelope. |
| 2026-11-03 | Gates: high from 1.5 V, low under 0.75 V, fixed until the Settings screen. |
| 2026-11-03 | Matrix amounts move by 0.5% (user, after trying whole percents), kept as half-percents; patch format 2 reads format 1's whole percents. A narrower vibrato than a detent allows comes from lowering the LFO's `LEVEL`. |
| 2026-11-03 | The screens name outputs as the panel does, `OUT 0` to `OUT 3`, after `OUT` at `1` turned out to mean the jack marked `out2` (user). The row is now `SEND TO`. |
| 2026-11-03 | Eight numbered patches in the slot's 64 KB option window, two sectors each. (Sixteen in 128 KB ran over the manifest, and the flasher refused it.) At boot the patch saved last plays. No autosave, and no names yet. |
| 2026-11-03 | The Settings screen becomes Patches; input ranges and gate thresholds wait until they are wanted. |
| 2026-11-03 | The wave view is see-through like the CMI's, no hidden-line removal: cheaper, and the read line stays visible behind nearer traces. |
| 2026-11-03 | The read line shows the position after the matrix, reported by the gateware, rather than the firmware working it out again: one definition of what is playing. Costs 381 LUTs. |
| 2026-11-03 | On Envelopes, pick the envelope or LFO first, then walk its settings (user). |
| 2026-11-03 | A file plays as it loads, a preview to keep or send back, rather than a separate audition step. `BACK` restores what was playing and frees the memory. |
| 2026-11-03 | The drive is only ever read, and FAT32 only, as the bootloader reads. |
| 2026-11-03 | A patch keeps a loaded table as an 8.3 path and frame length, and finds it again; it plays table 0 and says `NEEDS` until it can. Format 3. |
| 2026-11-03 | Built-in tables go by number in patches, so new ones are only added at the end. |
| 2026-11-03 | The new built-in tables are generated at boot, not stored, and from how each sound is really made rather than crossfades (user asked for interesting ones). 512-sample frames: enough for their harmonics, a quarter of the boot time. |
| 2026-11-03 | Position isn't stopped at the table's ends by the matrix: the oscillator's edge rule decides (user found Wrap and Mirror behaving as Clamp). It goes 8 tables either way, at the cost of two bits of resolution. |
| 2026-11-03 | Ring, AM, FM and PD between the oscillators (user), on their own screen, with the depth a matrix destination. FM is phase modulation, as on a DX7: DC in a table can't detune it. PD is FM with the modulator following the carrier's phase, so a table is the curve, which is more general than the CZ's fixed shapes. |
| 2026-11-03 | The modulator's level is part of its output, so an envelope on it sets the modulation as on any FM synth, and the mix's balance chooses what is heard. |
| 2026-11-03 | Levels are made in the background, not at boot or at load: boot time stays, a file plays at once, and a table plays as it stands until they're done. |
| 2026-11-03 | Levels are stored at twice the rate their band needs, after measuring: it took another 10 to 16 dB off the aliasing under 12 kHz, at no cost in memory or gateware. |
| 2026-11-03 | Grains are an LFO restarting an oscillator and sampling its position. Windows, spray and overlap come from the LFOs and matrix already there, so they cost next to no gateware. |
| 2026-11-03 | A factory bank in the firmware rather than more user patches: the flash format has only just been shown to work, and eight patches is the slot's room without changing it. |
| 2026-11-04 | Sounds as text files on a drive (user), rather than more in the build. Text so they need no tool and no version handling: unknown lines are skipped and counted, values clamp. The model reads them separately and the two are checked against each other. |
| 2026-11-04 | The Browser starts in a `FAIRWAVE` folder if the drive has one (user), else the root. |
| 2026-11-04 | A patch file plays when clicked, with no keep-or-back: its use is walking through sounds. |
| 2026-11-04 | The outputs are hushed while a patch's tables load, not playing table 0 for a moment. It stays table 0 and `NEEDS` if one can't be found. |
| 2026-11-04 | `FINE`, in cents, for detuning: patch format 5, firmware only. |
| 2026-11-04 | Library tables are 64 x 1024 rather than 2048: enough for a bass, and all 13 fit at once. |
| 2026-11-04 | Basses need a gate, as a sequenced bass line would be spoiled by a free-running one. Only sounds that are their own rhythm or drone run free. |
| 2026-11-04 | The grain feature stays as it is for now, with `GRAINS` rebuilt on how it really works. A window built into the gateware is the user's call. |
