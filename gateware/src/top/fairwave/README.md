# FairWave: a WaveScan wavetable synthesizer for Tiliqua

Status: **Phase 4 built and verified in simulation, not yet tried on hardware.** The Wave View
draws a table as the Fairlight's page D did, with the line an oscillator is reading across it (see
[Phase 4](#phase-4-as-built)). Phases 0, 1 and 2 ran on hardware on 2026-11-03; Phase 3 was flashed
that day, but whether a saved patch survives a power cycle hasn't been reported. This file records
what we learned from the existing projects, the architecture, the decisions, and the phases.

Two oscillator layers read wavetables out of PSRAM. Each layer scans its table
either frame by frame (a classic wavetable) or along a tilted line through the
table treated as a 3D surface (WaveScan, below). Two DAHDSR envelopes that can loop,
three LFOs, a modulation matrix and an output mixer sit around them. Wavetables are
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
  band-limiting that is audible. Phase 1 accepts it; a later phase adds
  band-limited mip levels (computed by the CPU when a table is loaded).
  Short frames behave differently, and that is the point of loading them:
  a 256-sample frame read with linear interpolation has the character of the
  old machines it came from.
- **Envelopes (gateware).** Two DAHDSR generators (delay, attack, hold, decay,
  sustain level, release; attack, decay and release curves), gate edges detected
  at the sample rate. Each can loop: while its gate is high, or free-running as an
  LFO of that shape. Each has a mask of the VCAs it closes, so Gate1 can drive both
  VCAs and, through the outputs' choices, both envelope outputs.
- **LFOs (gateware).** Three, with rate, shape, polarity, phase, level and sync.
- **Mod matrix (gateware).** Twelve slots, each a source, a destination and a signed
  amount, added up at audio rate, so envelope-to-position is smooth and CV1 is
  pitch without a control tick in the way.
- **Mixer.** The layers crossfade into a mix bus. Each of the four outputs picks one
  of {off, mix, layer 1, layer 2, envelope 1 or 2, LFO 1, 2 or 3}.
- **Wavetable pool.** A PSRAM region at an address to be fixed in Phase 0
  against the SoC's real map (framebuffer at 0, firmware, USB scratch and
  `bootinfo` at the top). Tables are allocated by size, 16-bit samples: 64
  frames at 2048 is 256 KB, at 256 it is 32 KB. Both layers can point at any
  resident table, so loading is separate from selecting.
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
| Oscillators | Mirrored about a column of names: table, frame, tune, position, shift (WaveScan), scan edge mode, level. Arc gauges at the rim for position, shift and level. |
| Wave view | The oscillator's table as stacked, skewed traces in a rhombus (Fairlight page D), with the line it is reading now drawn over them. Above: which oscillator, its table. Below: position, shift, edge, how many traces. |
| Envelopes | Tabs on an arc for the two envelopes and three LFOs. The shape in a dome with a playhead under it, an arc for the live level, the times on an arc underneath in the order they happen. |
| Routing | A patch bay: sources on the left arc, destinations on the right, a line for each slot, and the slot being edited underneath. |
| Mixer / output | A crossfader arc with the layers' levels at its ends, the four outputs on an arc at the bottom. |
| Browser | Drive status, file list, frame size and format, load into a pool slot, audition. |
| Patches | The eight in a ring: load, save, erase, or back to the default patch. |
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
3. **The look of the screens, and patches. Built and simulated; flashed 2026-11-03.**
   Arc gauges and incremental redraw, each screen's own round layout, a live playhead on
   the curves, and patch save/load in flash. *Exit:* host tests for layout (everything fits
   the circle); on hardware every parameter is reachable and changes the sound, and a saved
   patch comes back after a power cycle.
4. **Wave view. Built and simulated; awaiting hardware.** The Fairlight-style view, read from
   PSRAM by the CPU and drawn through the line plotter, redrawn only when the table changes, with
   the read line over it. *Exit:* host tests for the projection; on hardware a 64-frame table
   redraws in well under a second.
5. **USB browser and loader.** `guh` mass-storage peripheral and VBUS in the
   SoC, FAT browsing, the WAV parser (host-tested on PCM 16/24, float32,
   stereo, odd chunks), conversion into the pool, audition. *Exit:* host
   tests; on hardware plug a drive in, pick a table, hear it, hot-swap.
6. **Polish.** Band-limited mip levels, interpolation options, the grain
   mode if wanted, preset banks, tuning against real use.

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
python -m pytest fairwave model                 (gateware against the model, 160 tests, 2 minutes)
cargo test --manifest-path cpu/Cargo.toml       (logic, 162 tests)
```

`model/test_wavescan.py` and `model/test_modulation.py` check the models against what they should
mean, in plain arithmetic, so that `fairwave/test_osc.py` and `test_mod.py` (the gateware against the
models) mean something.

**The whole SoC in Verilator**, firmware on the real CPU netlist (`fairwave/socsim.py`, this
project's own flow; it needs `oss-cad-suite` at the repository's root and `ziglang` in the
venv). `--name` keeps its firmware away from the archive you flash. About a million clocks a
second, once compiled:

```
set FAIRWAVE_SIM_ARGS=cycles=150000000 dump=0x800000,0x40000 cv=1000,1000,0,0 pulse=2,0,5000,9600,4800,70000 pulse=3,0,5000,14400,2400,80000
python src/top/fairwave/top.py sim --name FAIRWAVE-SIM --modeline 720x720p60proto1
python src/top/fairwave/tools/check_sim.py build/fairwave-sim/out --settled 60000
```

Frames land in `build/fairwave-sim/out` as PNGs, so the screen can be looked at. Options
for voltages and square waves on the inputs, encoder events and a file where the bootloader
would leave it are at the top of `socsim.py`. `check_sim.py --patch` names a patch set through
the screens by encoder events, listed with it. A simulation has no flash, so its firmware keeps
patches in free PSRAM instead (`PATCHES_IN_PSRAM`, set by the `sim` command).

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

- Patches haven't been through the real flash yet (Phase 3's exit check). If a save reads back wrong, the
  screen says `SAVE FAILED` and the previous copy is still there.
- The DSP's deadline has margin: about 366 clocks measured for the oscillators, 206 at most for
  the modulation, against 1250. The status line (`dsp N/1250`) shows it.
- Booting takes 0.75 s, and converting a file costs about 200 clocks a sample through the
  cached byte path: fine for a stepping stone, slow for Phase 5's large tables.
- A runtime USB stack adds firmware size, RAM and git dependencies
  (`guh`, a `fatfs` fork) that need network access to fetch.
- Aliasing at high pitch until the band-limited levels exist.

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
