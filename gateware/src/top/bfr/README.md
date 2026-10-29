# bfr — reverb engine on Tiliqua

Status:

- The reference model, compiler and two example algorithms work (`model/`,
  `algorithms/`).
- The engine core's gateware (`bfr/core.py`) and the PSRAM stream engine
  (`bfr/stream.py`) match the model bit for bit in simulation, through a
  PSRAM model with latency and contention. Together they meet 60 MHz on
  their own (see [Gateware](#gateware)).
- The engine's semantics are in [SPEC.md](SPEC.md).
- The SoC (`top.py`) and its firmware (`fw/`, `cpu/`) build into a
  bitstream (see [SoC and firmware](#soc-and-firmware)). Not yet tried on
  hardware.

An experimental reverb for Tiliqua. The DSP is our own design, not a clone of
any existing chip or product. A Rust program on the softcore loads algorithms
into it, maps the user interface (encoder menu, CV inputs) to its parameters,
and draws the display.

## Goals

- Our own DSP in fabric: free to experiment with the instruction set, word
  widths and memory system.
- Sample rate chosen at build time: 48, 96 or 192 kHz. Bring-up at 48 kHz.
- At least 24-bit precision throughout. Floating point for data and
  coefficients (see [Number format](#number-format)).
- Delay memory in PSRAM from the start.
- The softcore can change every algorithm parameter live. Algorithms can be
  loaded at runtime, so new ones don't need a new bitstream.
- Leave room for the SoC (video, UI, USB) without breaking timing.

## Decisions

| Date | Decision |
|------|----------|
| 2026-10-22 | Own design; no emulation of existing chips or products. |
| 2026-10-22 | Time-multiplexed microcoded sequencer (see [Options considered](#options-considered)). |
| 2026-10-23 | Sample rate is a build parameter (48/96/192 kHz); algorithms are written in physical units (ms, Hz, s). |
| 2026-10-23 | At least 24-bit precision; floating point for storage and coefficients, with a wide fixed-point accumulator. |
| 2026-10-23 | Delay memory in PSRAM first; block RAM only for buffers and very short lines. |
| 2026-10-23 | Parameters live in a bank the softcore writes; each algorithm declares its parameters with ranges and units. |
| 2026-10-23 | 8 accumulators, and a compiler that schedules around pipeline latency (see [Accumulators](#accumulators)). |
| 2026-10-23 | Tap delays can be parameters too (size, predelay): the CPU rewrites tap offsets. |
| 2026-10-23 | Size and predelay crossfade (linear, A/B taps, hardware fade units) instead of jumping (see [Crossfades](#crossfades)). |

## Budget

Measured from existing nextpnr reports (`build/*/top.rpt`). The bootloader is
used as the closest stand-in for a bare SoC:

| Build | LUTs (of 24,288) | EBR (of 56) | MULT18X18D (of 28) |
|-------|------------------|-------------|--------------------|
| bootloader (SoC + video, no DSP) | 13,842 (56%) | 31 | 7 |
| H3000 r5 (3 x IKA32010 + glue + PSRAM cache) | 19,773 (81%) | 47 | 12 |
| macro_osc (`sync` fails timing at 60 MHz) | 21,601 (88%) | 56 | 12 |

That leaves roughly 10k LUTs, 25 EBR and 21 multipliers. Builds start missing
timing above about 82–85% LUT use, so the DSP should stay within about 6–8k
LUTs.

**PSRAM:** the oSPI PSRAM on the SoldierCrab module is the only RAM outside
the FPGA; the Tiliqua board adds none. It is an APS256XXN, 32 MB, behind
`vendor/psram_ospi.py`. Its PHY moves 32 bits per 60 MHz clock, so the peak
is about 240 MB/s. Each burst also costs a command and latency overhead; the
H3000 work measured about 28 clocks for a cache miss.

`TiliquaSoc` maps only 16 MB of it (`psram_size = 0x01000000`, from the
older 16 MB module), so the upper 16 MB is unused. Giving the engine that
half needs a wider address on the PSRAM arbiter's DMA side
(`tiliqua/periph/psram.py`). The CPU window should stay 16 MB, because
`bootinfo` sits at the window's end and the bootloader has to agree on it.
The controller sends full 32-bit addresses, but nothing has accessed the
upper half on hardware yet. 16 MB is 4M words: 87 s of delay at 48 kHz and
22 s at 192 kHz, far more than reverbs need.

The capacity is shared too: all masters share one chip and one bus, so bandwidth, not size,
is the limit:

- framebuffer DMA (720 x 720 x 1 byte at 60 Hz is about 31 MB/s)
- the CPU's cache fills
- the plotter/persistence engine

Other memory isn't usable as delay memory. The SPI flash holds bitstreams,
firmware and settings, and is too slow to write. Inside the FPGA there are
the 56 EBR (126 KB) and LUT RAM, which costs LUTs.

## Sample rate

Tiliqua already has 48 kHz and 192 kHz (`--fs-192khz`, `AudioClock.FINE_192KHZ`)
and the 44.1 kHz added for H3000. 96 kHz needs a new `AudioClock` entry and an
AK4619 mode in `tiliqua/periph/eurorack_pmod.py`.

Concerns at 192 kHz:

| Concern | 48 kHz | 96 kHz | 192 kHz |
|---------|--------|--------|---------|
| Clock cycles per sample at 60 MHz | 1250 | 625 | 312 |
| Delay words per second of reverb, per line | 48K | 96K | 192K |
| PSRAM traffic per delay tap (32-bit words) | 192 KB/s | 384 KB/s | 768 KB/s |
| One-pole coefficient for a 10 Hz corner | 1.3e-3 | 6.5e-4 | 3.3e-4 |

- **Instructions:** about 300 instructions per sample is enough for a plate
  or a 16-line network, but not much more (see [Capacity](#capacity-estimates)).
- **PSRAM bandwidth:** every delay tap costs four times its 48 kHz traffic,
  so PSRAM time limits how many taps an algorithm can use.
- **Coefficients:** they get small at high rates. A fixed-point 18-bit
  coefficient keeps only about 4 significant bits at 3.3e-4. This is one
  reason for floating point.
- **Audible benefit:** little for a reverb's wet signal, which is mostly
  below 20 kHz anyway. The gains are lower aliasing in nonlinear or
  pitch-shifting parts, smoother modulation, and lower latency.

Plan:

- The engine and the assembler take the sample rate as a parameter.
- Algorithms are written in milliseconds, hertz and seconds, and the
  assembler converts them at build time.
- The assembler reports, per rate, whether an algorithm fits.
- Later option: run the codec at 192 kHz with the dry path untouched, and
  the reverb at 96 or 48 kHz through half-band resamplers.

**Where the types stand at higher rates** (each compiled alone, the
gateware's sizes as built: 2,048 read-buffer words, 2,048 block-RAM words):

| Type | 96 kHz | 192 kHz (312 clocks) |
|---|---|---|
| plate | read buffer 2,848 words | read buffer 4,896 |
| space | fits | read buffer 2,784 |
| spring | fits (409 clocks) | 409 clocks |
| shimmer | fits (4,096 block-RAM words) | block RAM 8,005 |
| reverse | fits | fits |
| ambient | read buffer 2,256 | read buffer 4,304 |

So a 192 kHz build needs its own small `--algorithms` set (today only
`reverse`), and the 48 kHz types don't change that. Modulated PSRAM taps
are the limit (the read buffer grows with depth x rate), then the frame
budget; more needs a second datapath lane or bigger buffers, and block RAM
is nearly all used.

## Number format

Floating point is worth it for an experimentation platform:

- **No gain staging:** internal values in feedback networks can exceed full
  scale without clipping. Only the output saturates.
- **Clean tails:** a decaying tail keeps its full relative precision instead
  of sinking into a fixed-point noise floor, where rounding in long feedback
  loops makes it grainy.
- **Small coefficients:** coefficients and filter states keep full precision
  at any sample rate.
- **Simpler tools:** the reference model is ordinary float32 arithmetic, and
  the Rust UI computes `f32` coefficients directly. The rv32im CPU has no
  FPU, but software floating point is fast enough at UI rates.

### The problem with a fully floating-point datapath

A floating-point add needs alignment, addition, normalisation and rounding,
which won't fit in one 60 MHz clock on the ECP5. That breaks the
one-multiply-accumulate-per-clock loop.

### Hybrid: floating-point storage, fixed-point accumulation

- **Storage format:** IEEE-754 binary32 for registers, parameters and delay
  memory. Denormals flush to zero; overflow saturates (no NaN or Inf). 32
  bits matches the PSRAM PHY word.
- **Multiplier:** 24 x 24 mantissas (4 MULT18X18D), exponents added.
- **Alignment:** the product is shifted by its exponent into a wide
  fixed-point accumulator. This is pipelined before the accumulator, outside
  the accumulate loop.
- **Accumulator:** signed fixed point, 8 integer bits (+48 dB headroom) and
  48 fraction bits (floor about -289 dB). The accumulate loop is an ordinary
  57-bit add, so it still runs one per clock.
- **Writeback:** leading-zero count, normalise and round back to binary32,
  pipelined.
- **Codec conversion:** audio arrives and leaves as fixed point, converted at
  the I/O registers.
- **Cheap extras:** log2/exp2 come almost for free from the float fields,
  which helps envelopes, ducking and dB-domain math.
- **Estimated cost over 24-bit fixed point:** about 1k LUTs (shifters,
  leading-zero count), 2 more multipliers, 2–3 more pipeline stages. Block
  RAM holds 512 x 36 words, so short lines and buffers get half the depth of
  18-bit words.

## Options considered

**Open reimplementations of real DSP chips.** The ones that exist come from
the retro-gaming community: IKA32010 (TMS32010), jotego's jtdsp16 (AT&T
DSP16A, only the instructions QSound uses), and the SCSP DSP and SVP inside
the MiSTer Saturn and MegaDrive cores (not standalone). They are 16-bit
1980s parts with small on-chip memory and little or no toolchain.

**A second RISC-V core with DSP instructions.** Easy to program in Rust, but
it spends several thousand LUTs on fetch, decode and caches to get less than
one multiply-accumulate per cycle, and its memory timing isn't fixed.

**Fixed-function delay network in Amaranth** (from `tiliqua.dsp` blocks, as in
`PSRAMDiffuser` in `src/top/dsp/top.py`). Every delay line and tap is
separate hardware, so the LUT cost grows with the algorithm, and changing the
algorithm means a new bitstream.

**Faust-to-FPGA compilers** (Syfala and similar) target the Xilinx toolchain,
not ECP5 with yosys/nextpnr.

**Chosen: a time-multiplexed microcoded sequencer.** One multiply-accumulate
datapath runs a straight-line program once per sample, one instruction per
clock.

## Reference model

Everything runs from this directory with the Tiliqua venv's Python:

```
python -m model.render plate --report --fs 48000,96000,192000   # resources per rate
python -m model.render plate --list                             # program, taps, coefficients
python -m model.render plate --demo 7 --out ../../../build/bfr/plate.wav
python -m model.render fdn8 --impulse 6 --param mix=1 --param decay=4
python -m model.render plate --in dry.wav --tail 3 --param size=1.5 --out wet.wav
python -m model.render plate --demo 6 --sweep size=0.6:1.8@0.5:5 --out sweep.wav   # turn a knob
python -m model.render plate --demo 6 --sweep size=0.6:1.8@0.5:5 --no-fade ...    # jumps, for A/B
python -m pytest model                                          # 103 tests, ~11 s
```

- `--demo` plays four plucked notes and a noise burst.
- `--impulse` also prints the measured decay time (RT60).
- `--sweep` moves a parameter every 20 ms, like a knob through the UI.

Rendering at 48 kHz runs at about 0.45x real time.

How the pieces fit:

- **An algorithm** is a Python function `build(a)`. It declares parameters
  and delay lines and writes one sample's processing as arithmetic on
  signals. See `algorithms/plate.py` and `algorithms/fdn8.py`, and
  `model/lib.py` for allpass, lowpass, Householder/Hadamard mixing and
  decay-time gains.
- **The compiler** (`model/compiler.py`) turns that into a scheduled
  program. Every value used once is folded into its consumer's sum of
  products. Instructions are list-scheduled around the pipeline latencies
  into 8 accumulators, and stores ride in each instruction's store slot.
  Delay lines are placed in PSRAM, or in block RAM if they are very short.
- **The engine** (`model/engine.py`) runs programs bit-exactly. The fast
  path compiles a program to one Python function; it is tested against a
  plain interpreter, and the arithmetic against its integer definitions in
  `model/fp.py`. `engine.check` verifies a program's pipeline hazards
  independently of the compiler.
- **Tests:** 80 randomly generated algorithms are compiled and run on both
  engines, covering every operand kind, feedback, saturation, parameter
  changes, crossfades and accumulator spills.

## Measured capacity

From the compiler's report, with size and predelay crossfaded (the tables in
[Capacity estimates](#capacity-estimates) below were written before the
compiler existed):

| | plate | fdn8 |
|---|---|---|
| Instructions | 108 (8 NOP) | 108 (8 NOP) |
| Clocks per frame (+53 overhead) at 48 / 96 / 192 kHz | 161 of 1250 / 625 / 312 | 161 of 1250 / 625 / 312 |
| Accumulators used | 8 | 6 |
| Coefficients | 18 | 27 |
| PSRAM streams (read/write/modulated) | 25 / 13 / 2 | 11 / 13 / 2 |
| Extra streams while crossfading | 27 | 13 |
| PSRAM traffic at 48 / 96 / 192 kHz | 7.7 / 15.4 / 30.7 MB/s | 5.0 / 10.0 / 20.0 MB/s |
| ... while crossfading | 12.9 / 25.7 / 51.5 MB/s | 7.5 / 15.0 / 30.0 MB/s |
| PSRAM bus time, 8-word bursts, at 48 / 96 / 192 kHz | 11 / 22 / 45% | 7 / 15 / 29% |
| ... while crossfading | 19 / 38 / 75% | 11 / 22 / 44% |
| Stream buffers (read + write words) at 48 / 96 / 192 kHz | 2,032 / 3,056 / 5,104 | 1,072 / 1,584 / 2,608 |
| Crossfade warm-up (size, predelay) at 48 kHz | 209, 16 samples | 113, 16 samples |

Both fit at 192 kHz with room to spare: the instruction count is not the
limit. PSRAM bus time and the stream engine's block RAM are.

- **Bus time** assumes 20 clocks per burst besides its beats (the H3000's
  cache measured 28 clocks per 8-word line). 16-word bursts cut it by a
  third but double the plain streams' buffers.
- **The read buffer** is mostly the modulated taps' windows. The plate's
  2 ms depth range is 192 samples of window per modulated tap at 48 kHz and
  768 at 192 kHz, and each crossfaded modulated tap has two.
- **The default build** has a 2,048-word read buffer, so the plate as it
  stands compiles only up to 48 kHz. It fits 96 kHz with a smaller depth
  range.

Measured decay: fdn8 with `decay=0.8 s` and damping open measures 0.8 s
±15% (a test); the plate at the paper's decay 0.5 measures 1.7 s.

## Crossfades

Changing a delay length (size, predelay) would jump the tap and click. A
parameter declared with `fade_ms` instead crossfades.

**How it works:**

- Each tap that depends on the parameter is two tap entries, A and B.
- Every read of it is two instructions, each weighted by one of the fade
  unit's weights. A B-operand mode multiplies the coefficient by the weight,
  so this adds no latency.
- On a change, the CPU writes the new tap positions into the silent side,
  together with any coefficients that depend on the parameter (fdn8's
  per-line decay gains). The fade unit then ramps over to that side.
- Changes made during a fade are held; the latest one starts the next fade.
- There are two fade units, so size and predelay fade independently.

**Linear, not equal-power.** Inside a feedback tank, an equal-power fade
between two nearly equal taps would raise the loop gain to 1.41 halfway
through, and the reverb could swell. Linear weights sum to 1, so it can't.
The cost: two uncorrelated signals blended linearly lose energy mid-fade,
and the tank loses level while a knob keeps moving.

**Measured** on a 220 Hz sine, so that anything above 4 kHz is an artifact,
with size swept 0.6 -> 1.8 over 4.5 s, updated every 20 ms:

| | Artifacts > 4 kHz (relative to signal) | Level change while sweeping |
|---|---|---|
| plate, size jumps | -32 dB (clicks peaking at -15 dBFS) | |
| plate, size fade 20 ms (chosen) | -79 dB | -1.8 dB |
| plate, size fade 60 ms | -95 dB (same as not moving) | -5.8 dB |
| fdn8, predelay jumps (5 -> 150 ms) | -41 dB | |
| fdn8, predelay fade 40 ms (chosen) | -96 dB | |

Size fades in 20 ms because it is inside the loop. Predelay is outside it,
so it can afford 40 ms.

**Cost:**

- plate: 67 -> 106 instructions, +27 streams while fading
- fdn8: 85 -> 106 instructions, +13 streams while fading
- the side-B stream buffers are block RAM that sits idle between fades
- a fade starts only after the silent side's streams have warmed up: 16
  samples for plain taps, the window plus 16 for modulated ones (209
  samples, 4.4 ms, for the plate's size at 48 kHz)
- rendering in the model is slower (0.45x real time)

A/B files (demo signal, wet only): `build/bfr/plate-size-sweep-{xfade,jump}.wav`
and `build/bfr/fdn8-predelay-sweep-{xfade,jump}.wav`.

## Gateware

`bfr/core.py` is the engine: sequencer, pipeline, register file,
coefficients, taps, LFOs, noise, fade units, and the block-RAM delay space.
The PSRAM delay space is a port (`pmem`) served by the stream engine
(`bfr/stream.py`, below).
The stage-by-stage plan is in the file's docstring; the hazards it implies
are in SPEC.md and `model/isa.py`, so the compiler schedules for the real
pipeline.

**Verification.** `bfr/test_core.py` runs the gateware in Amaranth's
simulator in lockstep with the model and compares every output sample. The
model plays the CPU: parameter changes, crossfades, tap offsets and LFO
rates are written into the gateware between samples. Covered:

- delays, allpasses (including block-RAM lines), filters, signal products,
  constants
- modulated taps, including a 600-sample excursion; every LFO output and
  noise
- plate and fdn8 with a size crossfade mid-run
- 12 random programs

All match bit for bit. The simulator runs at about 2,600 clocks/s, so runs
are short.

```
python -m pytest bfr                                # 36 tests, ~4.5 min (test_firmware needs cargo)
python -m pytest bfr --runslow                      # + plate crossfade through PSRAM
python -m bfr.synth [--stream]                      # yosys + nextpnr, core (+ stream engine), ~1 min
python -m bfr.sta ../../../build/bfr-core/top.sdf   # every failing path, grouped
```

**Measured, core alone** (out of context, LFE5U-25F speed 6, with the plate
loaded):

| Resource | Used | Of |
|---|---|---|
| LUTs (TRELLIS_COMB) | 6,294 | 24,288 |
| Flip-flops | 3,262 | 24,288 |
| Block RAM | 11 EBR | 56 |
| Multipliers | 10 MULT18X18D | 28 |
| Fmax | 66.2 MHz | 60 MHz target |

The block RAM is: program 3, register file 2 (two read ports), coefficients
1, taps 3, sine table 1, block-RAM delay pool 1 (512 words). The PSRAM stream
engine's FIFOs and windows come on top.

**Pipeline numbers** (replacing the assumptions):

| | Assumed | Real |
|---|---|---|
| Accumulator as operand | 6 | 8 |
| Register | 4 | 5 |
| Modulation register | 5 | 5 |
| Frame overhead | 8 | 53 (prologue 33, drain 11, epilogue 8, idle 1) |

The longer latencies cost the plate 2 instructions (106 -> 108); the 8
accumulators absorb them. The frame overhead matters most at 192 kHz: 53 of
312 clocks.

**What timing taught us.** Block-RAM outputs take about 6 ns to settle, so
little logic can follow one in the same clock. The first build reached 45
MHz. Moving work off block-RAM outputs, single-add product sums and
bit-test saturation got it to 49 MHz. The last failing path was the
modulation register's float-to-fixed conversion, which led to the
fixed-point store mode in SPEC.md. That mode also fixed a real limit:
modulation offsets went through the accumulator, which saturates at ±256
samples, so the plate's 2 ms depth at 192 kHz (384 samples) would have
clipped.

### Stream engine

The core reads and writes the PSRAM space every clock and can't wait, so it
never touches the PSRAM itself. `bfr/stream.py` gives every PSRAM tap a
power-of-two region in a block-RAM buffer, indexed by the low bits of the
PSRAM address. The core addresses the buffers itself: the tap entries carry
the region. The rules are in SPEC.md:

- Every 8 samples each stream moves one aligned 8-word burst. A scanner
  visits the stream table once per sample and queues fetches (one burst
  ahead) and flushes (the burst just completed).
- Requests are served in order, and each has N = 8 samples to complete. So a
  read 17 or more samples behind its line's write sees the data. The
  compiler keeps lines at 64 samples or more.
- A stream that changes or restarts must warm up before it is heard. The
  CPU waits for that before starting a crossfade, and stops the silent
  side's streams between fades.
- `clear` zeroes the ring (in 64-word bursts) and the buffers. The PSRAM
  holds noise at power-up.

**Verification.** `bfr/test_stream.py` runs the core with the stream engine
against `sim.PsramModel`. That is a wishbone slave with 18 clocks to the
first beat, 2 recovery clocks, and optional contention (other masters
holding the bus before a burst) and wait states. Frames start on the
sample clock (at 192 kHz, 312 clocks, unless set faster), so the deadlines
are real. Each of these matches the model bit for bit:

- short PSRAM lines with feedback and a modulated tap; data really makes
  the round trip through the PSRAM model
- a crossfaded tap, with two queued changes (warm-up, fade, fade back)
- clear over a PSRAM full of noise
- contention on 80% of bursts (40–120 clocks) with 20% wait states. The
  worst lag from request to completion was 1 sample of the 8 allowed.
- plate and fdn8 at 48 kHz, with frames 3× faster than the sample clock
- with `--runslow`, a plate size change through the PSRAM: 33 streams start,
  warm up and fade in

A bus too slow to keep up (1,000-clock bursts) raises `late`. With 410-clock
bursts the engine still kept up with 6 streams at 192 kHz.

**Measured, core + stream engine** (out of context, plate at 48 kHz, read
buffer 2,048 words, write buffer 256):

| Resource | Core | Core + stream engine |
|---|---|---|
| LUTs (TRELLIS_COMB) | 6,452 | 7,342 |
| Flip-flops | 3,476 | 4,172 |
| Block RAM | 12 EBR | 19 EBR |
| LUT RAM (request FIFO) | 0 | 11 |
| Fmax | 65.7 MHz | 65.2 MHz |

- The stream engine is about 890 LUTs and 7 EBR: read buffer 4, stream
  table 2, write buffer 1.
- The core grew by 160 LUTs and 1 EBR for the buffer addresses in its tap
  entries.
- The stream table would fit in 1 EBR with a tighter encoding.

**In the SoC** (measured, below): 88% of LUTs and 34 of 56 EBR. Block RAM
turned out to be far less tight than the bootloader build suggested.

The project-local PSRAM peripheral is `bfr/psram.py`
(`WidePsramPeripheral`, used inside `wide_psram()`):

- the CPU, framebuffer and other masters keep their 16 MB view
- the engine gets a master that reaches all 32 MB
- shared code is untouched
- `bfr/test_psram.py` checks the address routing; the chip itself is a
  hardware test

## Reverb types

One bitstream carries every type (`algorithms/__init__.py`, `TYPES`: menu
order, also what the tests and `tools/render_presets.py` cover); the type
cell on the screen's ring picks one, and the firmware loads it into the
engine (below). Each type is a module in `algorithms/` with a `TITLE`, a
one-sentence `DESCRIPTION`, `PRESETS` (named starting points), and a `help`
sentence per parameter, which the screen's hub shows for the selected item.

| Type | Module | How it works | Presets |
|---|---|---|---|
| Plate | `plate` | Dattorro's figure-8 tank | Bright plate, Vocal plate, Dark plate, Big plate, Extreme |
| Room / Hall | `space` | early reflections from the predelay line, then an 8-line Householder network | Small room, Studio, Chamber, Concert hall, Cathedral, Extreme |
| Spring | `spring` | two springs: chains of 36 stretched allpasses (the chirp) in feedback loops; a kick (a noise burst into both) | Amp spring, Surf, Dark tank, Short spring, Extreme |
| Shimmer | `shimmer` | 4-line network; one line crossfaded with its own pitch-shifted copy (any interval) before the mixing | Octave up, Fifth, Octave down, Choir, Extreme |
| Reverse | `reverse` | 24 taps over `length` with rising gains: a swell that cuts off | Short reverse, Long reverse, Soft swell, Extreme |
| Ambient | `ambient` | long 8-line network, four lines drifting on two LFOs, and freeze | Cloud, Pad, Endless, Glass, Extreme |
| Bloom | `bloom` | four long allpasses in series (their echoes multiply, sparse to dense) into an 8-line network | Slow bloom, Echo cloud, Soft room, Night garden, Extreme |
| Void | `void` | a huge 8-line network (lines up to 0.65 s, decay up to 100 s); negative `gravity` feeds it through a rising-gain swell, as `reverse` | Event horizon, Deep space, Dark matter, Collapse, Extreme |
| Resonator | `resonator` | six tuned feedback combs (`pitch` as a note, `chord` from six interval sets), fractional delays so they are in tune; a strike trigger | Harp, Bells, Sitar, Dark drone, Extreme |
| Ensemble | `ensemble` | chorused diffusers (four allpasses in block RAM on four LFO phases), an 8-line network with two lines drifting, three chorus voices over the tail | Strings, Choir loft, Velvet, Seasick, Extreme |
| Pulse | `pulse` | an 8-line network times a gate (signal x LFO): smooth to near-square, the right side up to half a cycle later, optionally gating the input too | Heartbeat, Chopper, Swing, Stutter hall, Extreme |
| Tunnel | `tunnel` | four short combs in block RAM through a Hadamard mix, each delay swept by an LFO: a ringing pipe and a slow flange | Drain pipe, Jet, Culvert, Tin can, Extreme |
| Echo | `echo` | tape ping-pong: two lines up to 1.5 s, a wow-and-flutter "head" line, tone filters and a smearing allpass in the loop | Slapback, Ping pong, Worn tape, Dub space, Extreme |
| Morph | `morph` | a hall with a stereo swept lowpass on its tail (signal x LFO coefficient); its presets set the input followers | Ducked hall, Breathing room, Dark when bright, Bass bloom, Envelope filter, Extreme |
| Split | `split` | an 8-line network split at `crossover` in every line: lows and highs decay at their own rates | Warm hall, Airy, Tight room, Rumble, Extreme |
| Rotor | `rotor` | a rotating speaker: a Doppler-swept "horn" for the highs, a level-swept "drum" for the lows, two microphones, a small room | Chorale, Tremolo, Gospel hall, Slow swirl, Extreme |
| Gated | `gated` | 24 taps over `length` with even, falling or rising gains, after heavy diffusion: a burst that stops dead | Big snare, Nonlinear, Short gate, Backwards, Extreme |
| Spiral | `spiral` | a delay whose feedback is frequency-shifted (a Hilbert pair and an LFO) into an 8-line network: repeats that climb or fall | Rising, Falling, Slow drift, Bells, Extreme |
| Orbit | `orbit` | the sound and part of the reverb circling the listener (left, right, over, under) at a distance: interaural delay, level and shadow, front/back and up/down brightness, a floor bounce, air absorption and time of flight | Close orbit, Overhead, Carousel, Distant moon, Extreme |
| Fold | `fold` | an 8-line network whose tail is wavefolded (`lib.SineShaper`) inside the loop and on the way out | Warm grit, Folded hall, Buzz cloud, Broken tape, Extreme |
| Carrier | `carrier` | a 4-line network modulated at audio rate by FM (delays), AM (level) or phase distortion (level, by a phase-warped wave), inside the loop and out | FM bells, AM shimmer, PD reso, Slow FM drift, Extreme |
| Vowel | `vowel` | the tail through three formant resonators per side, sliding between a, e, i, o, u | Ahh, Eee, Ooh hall, Whisper, Extreme |
| Bounce | `bounce` | 16 taps whose intervals shrink (or grow) geometrically, each quieter: a dropped ball; then a small room | Ping pong ball, Marble, Stairs, Basketball, Extreme |
| Crusher | `crusher` | sample-rate reduction (a saw-swept tap as a sample-and-hold): of block means inside the network, raw on the way out; aliasing on every pass | Sampler, Toy, Grit hall, Radio, Extreme |
| Strobe | `strobe` | the input multiplied by a pulse train (a raised cosine to the 8th to 32nd power), the slices ringing in a small bright network | Sonar, Stutter, Ticks, Slow flash, Extreme |
| Swirl | `swirl` | a hall through a four-stage phaser with feedback, its coefficient swept by an LFO | Gentle swirl, Jet hall, Wah room, Negative, Extreme |
| Lab | `lab` | the open slot: a small, commented reverb to start a design from (below); not in the default build | Small, Large, Extreme |

Every type's **Extreme** preset pushes it to where its character is
loudest (longest decay, largest size, most modulation, brightest, mix
0.85-0.9), to make plain what the type does. They are stable: after an
impulse, the last of 5 seconds is quieter than the loudest before it
(`model/test_model.py`; not the first, as void's swell holds the energy back
for over a second).

The newer types, in detail:

- **Bloom.** An allpass tens to hundreds of ms long doesn't blur a sound,
  it repeats it; four in series multiply the repeats, so a note comes back
  as a few distinct echoes that grow denser and denser (`bloom`, their
  feedback, sets how slowly) into the network's tail.
- **Void** (a black-hole-style space, our own design; the name is ours).
  `gravity` -1..1: at 0 and above the input goes straight in (above 0 more
  smeared); below 0 it also passes 16 taps over a swell line with rising
  gains, the oldest loudest, so each sound swells up out of nothing over
  0.3 s x `size` before the tail takes it. Two lines drift on two LFOs.
- **Resonator.** Comb k rings at `pitch` (MIDI note, A1 to A3, shown as a
  note name) plus the chord's k-th interval (unison, fifths, major, minor,
  sus4, cluster), each for `decay`. The chord is chosen inside the
  coefficient math by a degree-5 polynomial through each comb's six
  intervals (exact at the integer chords; a few multiplies in the
  firmware). Each comb's delay is fractional: an interpolated tap whose
  fraction is a constant offset, less the damping lowpass's own delay
  ((1 - k) / k samples), so the combs are in tune to well under a cent
  (`test_resonator_is_in_tune_and_silent_until_struck`). The input is scaled
  by sqrt(1 - g^2) so broadband input rings at a similar level at any
  decay; a tone right on a comb's note still rings up, as a string does.
  The strike is a 6 ms noise burst (wet peaks -5 to -13 dBFS); the kick
  button and kick gate fire it.

- **Ensemble.** Every path wanders: the input's four diffusers are
  allpasses in block RAM (so their modulation costs no stream buffer) on
  two LFOs in quadrature, two of the network's lines drift on the same
  LFOs, and three chorus voices read the tail back from a short block-RAM
  line (one each side, one in the middle). `chorus` sets all the depths,
  `rate` the LFOs, `voices` the voices' level.
- **Pulse.** The tail times a gate: g = 1 - depth (1 - u) / 2, where u is
  the LFO's sine blended (`shape`) with the sine flattened twice by
  (15s - 10s^3 + 3s^5) / 8, which stays within -1..1 and is nearly square.
  The right side's LFO is sin(t + pi `width`) from the sine and cosine;
  `feed` gates the network's input as well, so the tail fills in pulses.
- **Tunnel.** Four combs of 2.3 to 6.1 ms x `size` in block RAM, mixed by a
  Hadamard matrix (lossless), each with `feedback` and a damping lowpass;
  their delays sweep by up to 0.5 ms on four LFO phases. The input is
  scaled by sqrt(1 - feedback^2), as the resonator's.
- **Echo.** Each side's repeat passes a 3 ms block-RAM "tape head" line
  whose delay moves by `wow` x 2 ms on a 0.7 Hz LFO plus `flutter` x
  0.25 ms on a 9.3 Hz one (the two normalised into one modulation signal,
  so they share one modulated tap), the tone lowpass, a low cut and an
  allpass (`smear`); the main lines are shortened by the head's 3 ms. Each
  side feeds the other, so at `spread` 1 the repeats bounce.
- **Morph.** One-pole lowpass with a moving coefficient, y += k(t) (x - y),
  k(t) = k0 (1 + depth s(t)) with k0 (1 + depth) kept at most 1 (a one-pole
  with k above 1 rings). The right side's LFO is `filter_phase` degrees
  behind. Its six presets set follower depths (below): Ducked hall (level
  -> mix -70 %), Breathing room (level -> size and decay), Dark when bright
  (treble -> damping -70 %), Bass bloom (bass -> decay and size), Envelope
  filter (level -> filter +65 %), and an Extreme with all three.
- **Split.** In every line, low = lowpass(t, crossover) and high = t - low,
  each with its own decay gain (`decay` x `low_decay`, `decay` x
  `high_decay`). The parts are complementary, so a line's gain is never
  more than the larger of the two: stable at any setting.
- **Rotor** (our own take on the rotating-speaker cabinet). The highs (above
  about 800 Hz, two one-poles) go through a block-RAM line whose delay
  swings 0.8 ms x `horn` (the Doppler shift) and whose level swings with it;
  the lows' level swings at 0.86 x `speed` (`drum`). The microphones are a
  quarter turn apart (sine left, cosine right). A small 4-line room around
  the cabinet (`room`, `size`, `decay`).
- **Gated.** The input is diffused (four allpasses, `density`) into a line;
  24 taps over `length`, alternating sides, with gains 1 + shape (1 - 2t):
  even at 0 (gated), falling at 1 (a nonlinear decay), rising at -1. A short
  allpass per side fills the gaps between taps and rings for a few tens of
  ms, so the burst still ends where `length` says.
- **Spiral.** `lib.freq_shift`: two chains of four allpass sections in z^-2
  (O. Niemitalo's 90-degree pair: within a degree of 90 from about 15 Hz to
  0.99 x Nyquist) give i and q, and i cos(wt) + q sin(wt) moves every
  frequency up by w (a negative LFO rate: down). Measured: the other
  sideband 44 to 64 dB below from 60 Hz to 18 kHz, the gain within 0.05 dB
  (`test_freq_shift_moves_a_tone_up_or_down`). In the delay's feedback
  (`feedback` at most 0.9, with damping) every repeat moves `shift` Hz:
  harmonics stop being harmonic, so a few Hz sounds like bells, under one
  like a sweeping chorus. The repeats feed an 8-line network.

- **Orbit.** A stereo pair can't put a sound truly above or behind, but it
  carries enough cues to follow one moving. The position is an LFO's
  phase: left/right turn it in the horizontal plane (side = sin, front =
  cos), up/down in the vertical one (front, overhead, behind, below); the
  direction is the rate's sign, chosen by coefficients, so changing it
  reverses the turn from where it is. Each ear: a modulated tap on a
  block-RAM line (the far ear up to 0.35 ms later), a level (louder on
  its side), and a one-pole whose coefficient the position moves (head
  shadow; darker behind and below, brighter above), a signal times a
  signal. Below adds a 1.6 ms floor bounce. Distance: the time of flight
  (crossfaded), 1/distance level, an air-absorption lowpass, and the
  room's tail, which doesn't move, taking over.
- **Fold.** `lib.SineShaper` computes sin(k x) and cos(k x) of any signal,
  which the instruction set can't: an LFO's sine and cosine are written to
  two block-RAM lines, and a tap the signal moves reads the LFO's past,
  sin(psi - w D x); with the sine and cosine of psi from fixed taps,
  sin(t) = sin(psi) cos(psi - t) - cos(psi) sin(psi - t) gives the shaped
  value exactly, up to the taps' interpolation (within 0.2 % in
  `test_sine_shaper_is_a_sine_of_its_input`). The tap's swing is clamped,
  so the output stays within -1..1. Low drives saturate, past pi/2 it
  folds. In the loop it is sin(k x) / k, never more than x, so each line's
  gain stays below its linear one and the tail can't grow while it gets
  rougher pass by pass.
- **Carrier.** FM moves two lines' delays and a short output line per
  side by up to 1.2 ms at the carrier's rate (phase modulation); AM
  multiplies the level by 1 - index (1 - sin) / 2; PD by the same with
  cos(pi w) (`lib.cos_pi`, five products) of a triangle bent toward a
  sawtooth by `shape`, Casio's phase warp. All three are in the loop, so
  sidebands compound. AM and PD can't raise the gain; FM could (a delay
  swept at audio rate in a loop is a parametric pump: the first version's
  "FM bells" grew 5 dB in 6 seconds). A tap whose delay moves at most `d`
  samples per sample passes at most 1 / (1 - d) of the energy into it, so
  the loop's FM swing is limited to a slope of 0.3 (less swing at higher
  carriers) and those lines' gain is sqrt(1 - slope): never a gain, at
  any carrier. The output's FM line, outside the loop, swings to a slope
  of 1. The mode weights are coefficients, so switching mode needs no
  reload.
- **Vowel.** Two-pole resonators at the first three formants (from tables
  of a, e, i, o, u, interpolated linearly between neighbours by
  coefficients), normalised to unity at their peaks. Map a CV or the
  level follower to `vowel` and the room talks.
- **Bounce.** Tap k at time T (1 + r + r^2 + ... + r^(k-1)), gain loss^k:
  r < 1 is a ball settling, r > 1 a stair. `time` is crossfaded, `bounce`
  moves the taps at once.
- **Crusher.** A sawtooth LFO at fs / N sweeps a block-RAM tap backwards
  one sample per sample, so it reads one sample for N samples, then
  jumps: a sample-and-hold, exact at whole N (a ramp in becomes a
  staircase). That is the way out. A hold never raises the level, but it
  can raise the energy (one sample copied N times), and in the loop the
  first version's Extreme grew 2.5 dB in 6 seconds, the network finding
  signals locked to the hold. The two crushed lines inside hold the mean
  of the last N samples instead (a running sum less the sum N samples
  ago, slightly leaky): no more energy than those N samples had, so the
  loop can't grow, and the tail is still decimated on every pass.
- **Stability check.** `tools/stress_types.py` renders each type's presets
  and random corners of its parameters (decay at its maximum) and flags
  any whose last second is louder than its loudest before; every type
  passes.
- **Strobe.** u = (1 + cos) / 2 squared five times gives u^8, u^16, u^32,
  ever narrower pulses (a parabola through them follows `width`); the input
  times the pulse train slices it into a bright, diffuse network.
- **Swirl.** Four first-order allpasses with a coefficient swept between
  those of two frequencies two octaves either side of `center` (linear in
  the coefficient, so always inside -1..1), mixed with the tail, with
  feedback round them.

Two menu conventions for discrete parameters: unit `"note"` is shown as a
note name (A2), and a unit starting with `|` lists the choices' names
(`"|unison|fifths|..."`).

### Lab: the open slot

Lab isn't in the default build (`TYPES`). To work on it, append `"lab"` to
`TYPES` in `algorithms/__init__.py`, or build with `--algorithms` listing
the types you want and `lab`; the model's tests cover it either way.


`algorithms/lab.py` is a complete, working type that is meant to be
changed: a predelay, two diffusers, a four-line network with one drifting
line, damping, and a "ping" trigger (the kick button drops a noise burst
into the network, to hear the tail alone). Its docstring explains the DSL.
To try a design:

1. Edit `algorithms/lab.py` (keep `NAME = "lab"`; `TITLE` and
   `DESCRIPTION` are what the menu shows). `python tools/render_presets.py
   --types lab` renders its presets to WAV, with each one's decay time and
   a check that it doesn't grow.
2. `python -m pytest model -k lab` runs it through the model's checks (the
   wet outputs, the Extreme preset's decay).
3. `python src/top/bfr/top.py build --fw-only` (from `gateware/`): the
   firmware alone, packaged with the existing bitstream. That works because
   the engine's pools are fixed (`top.py`, `POOLS`), whatever the types
   use: 512 instructions, 1,250 clocks per sample at 48 kHz, a 2,048-word
   stream read buffer and 512-word write buffer, and 2,048 words of block
   RAM for short lines. A design that doesn't fit stops the build with the
   pool it needs more of.

What costs what: a plain PSRAM tap takes 16 read-buffer words (32 if its
delay is crossfaded); a modulated one its swing x 2 + 16, rounded up to a
power of two (1 ms of swing at 48 kHz: 128 words; crossfaded, twice that);
lines whose taps can be under 64 samples are in block RAM, and so is any
`a.delay(name, block_ram=True)` (no stream buffer: modulate freely there,
about 42 ms of lines in all). 4 LFOs, 2 crossfaded parameters, 11 dials.

To keep Lab and add another slot, copy `lab.py` to a new name, change its
`NAME`, and add it to `TYPES` (at the end: the saved type is an index into
the list). The firmware is full with the 26 default types (3.9 KiB of the
320 KiB slot left, below): to add one, leave another out.

`tools/type_report.py [TYPE ...]` prints what each type uses of the pools.

**Triggers.** `a.trigger(name, decay_ms, help)` declares a one-shot
envelope the firmware fires: firing writes 1.0 to its state register
(between frames, like every register write) and the program decays it by
60 dB every `decay_ms`. The spring's kick is a 20 ms burst of the noise
register into both springs (`KICK_LEVEL` 1.1: wet peaks of -5 to -9 dBFS
across the presets), which their dispersion turns into the crash of a hit
tank. `Program.triggers` lists them (name, register, help) for the
firmware (`Control::trigger`).

At 48 kHz (`python tools/render_presets.py` renders every preset to WAV):

| Type | Instructions | Clocks of 1250 | Streams | Read buffer (of 2048) | Block-RAM pool | Bus load (fading) |
|---|---|---|---|---|---|---|
| Plate | 110 | 163 | 67 | 1824 | — | 19% |
| Room / Hall | 142 | 195 | 63 | 1248 | — | 18% |
| Spring | 356 | 409 | 6 | 64 | 256 words | 2% |
| Shimmer | 81 | 134 | 18 | 176 | 2048 words | 5% |
| Reverse | 88 | 141 | 57 | 832 | — | 16% |
| Ambient | 118 | 171 | 34 | 1232 | — | 10% |
| Bloom | 114 | 167 | 39 | 864 | — | 11% |
| Void | 147 | 200 | 72 | 1888 | — | 20% |
| Resonator | 101 | 154 | 12 | 256 | 2048 words | 3% |
| Ensemble | 135 | 188 | 27 | 736 | 2048 words | 8% |
| Pulse | 163 | 216 | 34 | 528 | — | 10% |
| Tunnel | 81 | 134 | 3 | 32 | 2048 words | 1% |
| Echo | 84 | 137 | 6 | 64 | 2048 words | 2% |
| Morph | 128 | 181 | 39 | 608 | — | 11% |
| Split | 139 | 192 | 39 | 608 | — | 11% |
| Rotor | 112 | 165 | 14 | 144 | 128 words | 4% |
| Gated | 94 | 147 | 61 | 864 | — | 17% |
| Spiral | 125 | 178 | 31 | 320 | 64 words | 9% |
| Orbit | 136 | 189 | 31 | 320 | 128 words | 9% |
| Fold | 165 | 218 | 35 | 368 | 2048 words | 10% |
| Carrier | 126 | 179 | 18 | 1136 | 256 words | 5% |
| Vowel | 160 | 213 | 30 | 304 | — | 8% |
| Bounce | 122 | 175 | 43 | 592 | — | 12% |
| Crusher | 115 | 168 | 30 | 304 | 256 words | 8% |
| Strobe | 136 | 189 | 18 | 192 | 256 words | 5% |
| Swirl | 157 | 210 | 30 | 304 | — | 8% |
| Lab (not in the build) | 69 | 122 | 18 | 400 | — | 5% |

(The clocks are far below the budget: the read buffer and block RAM are
what a type runs out of first.)

Wet levels (the demo signal, mix 1) are matched to within about 3 dB of
the dry signal's, so a type switch doesn't jump in level; spring, shimmer
and reverse needed 4 to 14 dB more output gain. For steady noise at the
defaults, the wet RMS of every type is 4 to 19 dB below the input (long
tails build up slowly); the new types sit inside that range.

`compiler.compile_set` checks that every type fits what they share: the
frame budget, 512 instructions, the 2048-word stream read buffer, the write
buffer, and the block-RAM pool. The gateware's pools are fixed in `top.py`
(`POOLS`), not the largest of the set, so a changed set of types runs on the
same bitstream (Lab, above).

**Building blocks** (`model/lib.py`; any line can also be put in block
RAM, `a.delay(name, block_ram=True)`, and `allpass(..., block_ram=True)`):

- `stretched_allpass`: (g + z^-k) / (1 + g z^-k), written so a chain costs
  one dependent step per stage. As y = d - g*v from the lattice, each stage
  took two steps and the chain held a temporary register per stage; 36
  stages ran out of registers.
- `pitch_shift`: two taps sweeping a short line on saw LFOs half a cycle
  apart, faded by complementary raised-cosine windows from one LFO's cosine.
  The sweep rate fs (r - 1) / (2 depth) sets the ratio r; a negative rate
  runs the saw backwards (pitch down).
- `early_reflections`: a pattern of (ms, gain, channel) taps scaled by a size.
- `lowcut`.
- `hilbert` and `freq_shift`: a 90-degree allpass pair, and single-sideband
  modulation of it by an LFO (Spiral, above).

**Not possible on this engine:**

- **Convolution.** A real convolution reverb multiplies the input by a
  second or more of measured impulse response: 50,000 to 200,000
  multiply-adds a sample. The engine does about 1,200 (one a clock), and has
  256 taps. A hybrid would fit: the strongest early reflections of a
  measured response as sparse taps, then an algorithmic tail.
- **A level detector in the engine.** The instruction set has no
  rectifier, so a type can't follow its own input's level. The firmware's
  input followers do it instead (below), for every type's parameters; the
  `gated` type is gated by its taps' length, as the classic nonlinear
  reverbs were.

## SoC and firmware

`top.py` is the SoC (`BfrSoc`):

- It is built inside `wide_psram()`, so the PSRAM arbiter is 32 MB wide.
  The engine is its priority master (see below).
- The engine (`bfr/peripheral.py`) is a CSR peripheral at 0xF0001000. Its
  delay ring is at 8 MB into the PSRAM (up to 4 MB). That is above the
  framebuffer and firmware and below `bootinfo`, in the CPU's 16 MB.
- CODEC inputs and outputs connect straight to the engine; every input
  sample starts a frame.
- `--algorithms` (default: every type, in menu order) are compiled at
  build time for the build's rate, 48 kHz or `--fs-192khz`. The first is in
  the bitstream's memory init; the firmware loads any of them.
- `model/rustgen.py` writes the firmware's tables, parameter grids,
  expressions, presets, help text and menu pages to `fw/target/gen-<fs>/`.

**CPU interface** (SPEC.md): configuration registers; table writes through a
staging register, applied between frames; `clear`; statistics.

**Firmware.**

- `cpu/` (`bfr-cpu`, `no_std`, tested on the host) holds everything that
  doesn't touch hardware:
  - `control`: the model's parameter and crossfade policy, ported
  - `math`: f64 `exp`, `ln`, `pow`, `sin`, `cos`, `tan`, `sqrt` after
    fdlibm, since there is no `libm` offline
  - `encode`: the table entries
  - `cv`: modulation (two control voltages and three input followers) to
    parameter positions (ranges, depths, discrete parameters, change
    detection), and the followers' envelopes
  - `expr`: the coefficient expressions' bytecode evaluator
  - `layout`: the round screen's geometry (tested: every cell fits the
    circle and misses the hub and its neighbours)
- `fw/` is the application:
  - **the screen** (`screen.rs`, `glyphs.rs`, `theme.rs`, `ui.rs`): a ring
    of cells round a 720 px circle (type, preset, a kick button for a type
    with a trigger, the type's parameters as dials, setup) and a hub with
    the type, preset, selected item, its description, the control voltages
    and the engine's status. Drawn incrementally and never faded: only what
    changed is erased (its own glyphs in black) and redrawn (text with the
    blitter, from one sheet of three font sizes uploaded at boot). The
    Sunset theme (amber, coral, magenta, warm white) is written into the
    palette.
  - **the dials** (`cpu/src/dial.rs`, `screen.rs`): a 4 pixel ring (radii
    20-23) lit up to the value through 270 degrees, a 2 pixel needle inside
    it, and a 2 pixel CV notch 12 pixels long across the ring where the CVs
    move the value. The ring is rasterised once from each pixel's distance
    to the centre (so it is round at this size), on the host by the
    firmware's build script, into a table of 540 pixels in flash with each
    pixel's position along the sweep; the screen plots them through the
    pixel plotter, and a value change repaints only the pixels between the
    old and new positions (a moved notch: the ring under it as well). The
    line plotter is no longer used (a register-only stub, below).
  - **the backdrop** (`bfr/backdrop.py`): a scan-out overlay fills every
    black pixel with a sunset glow (wine in the hub, crimson at the rim:
    the SKY hue's palette ramp runs through colours) and rings rippling out
    from the centre, as bright as the reverb is loud (`wet_peak`, the
    loudest OUT2/3 sample since the last read, followed fast up and over
    0.7 s down). r = sqrt(dx^2 + dy^2) from two multipliers and a root
    table in one block RAM; 2x2 ordered dither; 12 pipeline stages, the
    timing signals delayed alike. No framebuffer memory, bandwidth or CPU.
    The rings' width is a register too (a soft-edged ring, `width/2` of the
    triangle's 127 above its threshold): the firmware widens them from
    thin to about half their spacing with the level, speeds them up a
    little and lifts the glow, so the whole sky breathes with the tail.
  - **animation without redrawing**: the selected item is drawn in the
    PULSE hue, whose brightest palette entry the firmware breathes (1.4 s);
    the kick button's ring is the KICK hue, flashed on a hit. Dials glide to
    their values (45 % of the way each drawn frame), sweeping up from 0 on a
    new screen.
  - **a type change**: the click only queues it. The main loop closes the
    backdrop's curtain (160 ms: outside its radius only the backdrop shows,
    with a bright rim), loads the type (interrupts off, as before), clears
    and redraws the whole screen behind it, then opens it (260 ms). The boot
    screen opens the same way. The serial log gives the longest draw and
    the last full redraw in ms (not the load: the timer's count stops while
    interrupts are off).
  - **clearing** (`bfr/fill.py`): a PSRAM master writes the framebuffer in
    aligned 32-word bursts, about 3 ms of the bus for 518 KB (the CPU's
    stores took about 60 ms). The plotter writes through a 16-line cache
    whose lines could be written back over a fresh clear (16 old pixels
    each), so the firmware first draws a line along the framebuffer's top
    edge at the left corner, off the round screen: every cache line then
    holds pixels nobody sees.
  - **input** (`input.rs`): turn to move round the ring, click to edit
    (turn, click again), hold on a parameter for its modulation depths
    (CV1, then a click for CV2, level, bass, treble; a click after treble
    or a hold ends). A type loads
    on the click; presets apply as you turn through them; the kick button
    fires on a click. Setup holds the output (reverb, bypass, mute), each CV
    input's range (+-5 V, 0-5 V, 0-10 V), the kick gate (off, CV1, CV2),
    save and reset (the list scrolls). The jack touch pads are not used yet.
  - **saved state** (`options.rs`, generated `ui.rs`): the opts crate's
    pages are only a container now (type, preset, every slot, a depth page
    per modulation source, settings); every page lists all its slots, so a
    saved type other than the first restores all its values. A type loaded
    or a preset chosen in the menu is saved by itself 1.5 s later (once the
    curtain is open and the encoder still), so the next power-up starts
    with it: the whole state, as setup's save writes it, with the options
    crate's line per option kept off the serial port (half a second of the
    main loop).
  - **modulation without lag**: with CVs or followers moving several
    dials, a frame took 55 ms to draw (14-17 a second; 10 ms otherwise),
    so the screen answered the encoder late: the notches moved by fractions
    of a pixel every frame, each move repainting part of a ring, and the
    inputs' readout line was redrawn whole. The notches now move in steps
    of 1/128 of the sweep (about a pixel), and the readout is a `--debug`
    feature.
  - **cell values on two lines**: a value longer than a cell's 9
    characters (a preset's name) breaks at a space onto a second line
    (`layout::cell_lines`); the ring moved out to 276 px so the taller cells
    still clear the hub, the screen's edge and each other for 4 to 15
    cells (`layout` tests).
  - parameters on a grid in their own units, linear or log, with the
    default on the grid
  - **a type switch** (`App::load_type`, `Engine::load`,
    `Control::load`): mute and stop the engine; write the whole program
    (instructions, state and output registers cleared, taps, coefficients,
    stream table, LFO phases and rates); clear the delay memory (PSRAM ring,
    stream buffers, and the core's block-RAM space); run muted until the
    streams have warmed up (at least 10 ms), then set the crossfade rates
    and unmute. `bfr/test_peripheral.py` does exactly this over the CSR bus
    and checks the new program bit for bit from silence; it found that the
    output registers and the block-RAM space kept the old program's sound.
  - a status line: what is wrong, if anything (LATE, CLEAR TIMEOUT, NO
    FRAMES, STACK); with `--debug` also the rate, the frame clocks used of
    the budget and the control tick's longest time
  - with `--debug`, engine, CPU, screen and bus statistics on the serial
    port once a second, and the CV and follower values on screen; without
    it the serial port carries only warnings
  - at boot: load the saved type (its saved values, clamped to its grid),
    as a type switch does
  - STACK means under 2 KB of stack left; with `--debug` the serial log
    reports free stack each second.
  - the bootloader lists the bitstream as "Sunset" (`top.py`,
    `MANIFEST_NAME`); the build directory and archive keep the project's
    name, `bfr`.

**Outputs and control voltages.**

- OUT0/1 are the type's mix of dry and reverb (its `mix` parameter); OUT2/3
  are the reverb alone (every algorithm writes `a.output(k + 2, wet)`; at
  mix 1 they equal OUT0/1 to 1 LSB, `model/test_model.py`). In bypass
  OUT0/1 are IN0/1 and OUT2/3 silent.
- IN2/3 are CV1 and CV2. The timer interrupt (every 5 ms) reads them
  calibrated (`sample_i`, `counts_per_v`), smooths them (about 10 ms), and
  for every parameter with a depth adds `depth x amount` to its menu
  position (`cpu/src/cv.rs`). A change of at least 1/2048 of the range
  recomputes the parameter, at most 3 a tick (menu changes always at once).
  Switches and note steps (`freeze`, `interval`) move from grid point to
  grid point.
- Delay-length parameters (size, predelay, length) are crossfaded, so CV
  moves them in 20-40 ms steps rather than at audio rate.
- **Input followers.** The peripheral splits the audio input's mix
  (IN0 + IN1) / 2 at the sample rate into bass (two one-pole lowpasses at
  about 240 Hz) and treble (two one-pole highpasses at about 1.9 kHz; 12 dB
  per octave, shift-only filters, no multipliers), and `follow` holds the
  peaks of level, bass and treble (|x| / 32) since it was last read
  (`test_followers_split_level_bass_treble`: a 100 Hz tone is bass with
  under 5 % treble, an 8 kHz one treble with under 2 % bass). Each tick the
  firmware reads them and turns each into an envelope (`cv::Follower`): -54
  to -6 dBFS (about 16 mV to 4 V) as 0 to 1, rising 40 % of the way to a
  louder peak each tick (about 10 ms), falling from 1 to 0 in 300 ms. They
  are three more modulation sources beside CV1 and CV2, with a depth per
  parameter each: louder playing (or more bass, or more treble) moves the
  parameter by its depth, a negative depth the other way. A dial's gap
  shows "1", "2" and "f" (any follower) for what moves it, the notch where;
  the CV line shows the followers as `L B T` percentages. A type's presets
  may set follower depths (a preset's third item, `[(follower, parameter,
  percent)]`, `compiler.compile_module`; rustgen's `Preset::mods`): if any
  of a type's presets does, every preset sets them (the others to 0) and
  the CV depths are left alone.
- The kick gate: IN2/3 each have a gate detector in the peripheral, at the
  sample rate (an edge above 1 V after falling below 0.5 V latches a bit
  until the CPU reads it), so a trigger of one sample is caught although
  the CPU looks every 5 ms. With setup's kick gate on CV1 or CV2, a rising
  gate fires the type's first trigger. The same input can still modulate
  parameters.

**CPU RAM.** The SoC gives the CPU 32 KB of block RAM for data and stack
(`mainram_size=0x8000`); before that it had the default 16 KB. The first firmware didn't fit: `main` had a 17 KB stack frame
(a 5 KB application state copied several times), overflowed at its first
instruction, and drew nothing.

- Now the state is static and its tables are sized for the program
  (`program::N_COEFS` and friends). `main`'s frame is 6 KB, and 14.7 KB of
  stack is free for it, drawing and the timer interrupt.
- Check with `rust-objdump -d` on `main`'s prologue before shipping.
- A rebuild could double the RAM: `mainram_size=0x8000` costs 8 EBR, and
  22 are free. (No longer: 53 of 56 EBR are used.)
- **It happened again** with nine types and the size-optimised firmware:
  `main` grew to 14.2 KB and the main loop's closure to 8.1 KB, leaving
  about 650 bytes, and a type switch (since the curtain, run from the main
  loop: `load_type` and `Control::new`, 2 KB each) overflowed into the
  statics and hung the CPU. Now:
  - the boot is its own function (`boot()`, 13.7 KB, not inlined), so its
    temporaries are gone before the loop (`run()`) starts;
  - the font sheet is rendered in free PSRAM, not a 4.7 KB static: the
    stack is 30.3 KB;
  - `Control::reset` rebuilds the control state in place (`load_type`'s
    frame went from 2 KB to 0.6 KB);
  - the stack is painted again when the loop starts, so the log's "stack
    free" is what the loop and the timer interrupt leave (their deepest
    path is about 10 KB).
  Measure every function's frame from the disassembly (the prologue's
  `addi sp, sp, -N`, plus `lui`/`sub` for large frames) after changing
  optimisation settings.

**Verification.**

- `bfr/test_peripheral.py` drives the peripheral only through its CSR bus
  and audio streams, as firmware and CODEC would, with a noisy PSRAM model:
  - stream round trips
  - a crossfade done entirely through table writes
  These found two real races. A `status` read straight after `clear` or
  `wcmd` missed the request, so firmware could start frames during a clear
  or overwrite a pending table write. Both flags are now raised by the
  write itself.
- `bfr/test_firmware.py` writes vectors from the Python model and replays
  them in Rust (`cargo test`). The vectors are math reference values, table
  encodings, and random sessions of menu changes, time passing and CPU
  polls, with the model's whole table state after each step. Programs:
  plate, fdn8, a crossfaded tap and 3 random programs.
  - The firmware's coefficients match the model bit for bit in every
    session.
  - Tap offsets, stream entries, LFO increments and fade targets match
    exactly.
  - Math stays within 2 ulp of the host's C library (`pow`: 37 ulp, still
    far below an f32 ulp).

**Building on Windows** (native, no Docker; from `gateware/`):

```
set PYTHONUTF8=1                                  (the docstring's box characters)
set YOSYS=yowasp-yosys & set NEXTPNR_ECP5=yowasp-nextpnr-ecp5 & set ECPPACK=yowasp-ecppack
python src/top/bfr/top.py build                   (elaborates, PAC, firmware; build_top.bat then fails;
                                                   add --debug for the serial statistics)
cd build/bfr-r5
yowasp-yosys -q -l top.rpt top.ys
yowasp-nextpnr-ecp5 --quiet --timing-allow-fail --log top.tim --25k --package CABGA256 --speed 6 \
    --json top.json --lpf top.lpf --textcfg top.config --sdf top.sdf --seed 1 \
    --placer-heap-timingweight 25 --placer-heap-critexp 3      (optional; try several seeds)
cd ../../src/top/bfr && python -m bfr.sta ../../../build/bfr-r5/top.sdf 16.667 8
python -m bfr.phy_check ../../../build/bfr-r5/top.sdf  (the PSRAM PHY's unchecked routes)
cd ../../../build/bfr-r5
yowasp-ecppack --freq 38.8 --compress --bootaddr 0x0 --input top.config --bit top.bit --svf top.svf
cd ../.. && python src/top/bfr/top.py build --skip-build    (the archive, with current firmware)
```

**Measured** (six types, 48 kHz, nextpnr seed 1 of 8 tried):

| Resource | Used | Of |
|---|---|---|
| LUTs (TRELLIS_COMB) | 21,843 (89%) | 24,288 |
| Flip-flops | 11,155 | 24,288 |
| Block RAM | 45 EBR | 56 |
| Multipliers | 17 | 28 |
| DVI clock | 78.9 MHz | 74.25 MHz |
| System clock | 58.8 MHz | 60 MHz |
| Firmware | 287 KB | 320 KB region |

The system clock misses 60 MHz only on stock paths, as in the first build
(which ran): the blitter's `sheet_width_px` (−0.35 ns), from a register that
changes only when sprites are set up, and the PSRAM controller's
acknowledge into the CPU's L1 data LUT-RAM (−0.07 ns). Every endpoint in
the engine meets 60 MHz (`python -m bfr.sta ../../../build/bfr-r5/top.sdf
16.667 20 bfr.`). Seeds 2–8 reached 53.8 to 58.2 MHz.

**Update: that build didn't start** (black screen, nothing on the serial
port after the bootloader). The SoC now uses `bfr_rv32im_medcache`
(`top.py`: 8 KB instruction and 4 KB data cache, their data in block RAM),
which removes the failing LUT-RAM paths: 52 EBR, 90% logic, and with
seed 3 the only failing endpoint is the blitter's (−0.70 ns); the DVI clock
reaches 66.7 MHz, enough for the 39 MHz panel but not 720p.

That PSRAM-to-CPU path is long (controller state, acknowledge, the CPU's
load/store response, its register file) and gets worse with the
utilisation: at 94% (with the bus monitor and 1024 instructions) seeds
reached only 49–55 MHz, and nextpnr's router2 was worse still. The
large-cache CPU (H3000's) met 61 MHz once at 98%, but its 16 more block
RAMs no longer fit beside the delay pool. Logic is the constraint to watch.

**Logic reduced** (same features, bit-exact with the model):

| Change | LUTs saved |
|---|---|
| The prologue's arithmetic done once for all steps; the special registers' sources are chosen first | about 600 |
| The accumulators in LUT RAM, 2 copies (one per read), rather than flip-flops behind two 8-way multiplexers | about 500 |
| The modulation clamp moved from stage 2 to stage 3, off two block-RAM outputs | about 200, and the core's slowest path |
| The configuration registers write-only (the firmware keeps its own copies): smaller CSR read multiplexer | about 290 |
| The palette as one 24-bit block RAM with a registered output (`bfr/video.py`) | 2 EBR; the DVI clock passes 74.25 MHz (91 MHz) |

The SoC went from 22,082 LUTs (90%) and 52 EBR to 20,245 (83%) and
50 EBR. Out of context the core went from 6,601 LUTs at 66 MHz to 5,332 at
69–74 MHz. Seeds 2 and 5 of 10 meet every clock, the blitter's static
`sheet_width_px` path included; seeds 1 and 10 reached only 46 and 49 MHz,
so try several. Seed 5 shipped (60.8 MHz).

Not worth it: one shared fade unit (2 LUTs, and 61–63 MHz).

**Then** the persistence effect went (`bfr/video.py`: a stub with its
registers, no DMA engine) and the blitter's sprite address was registered
(`bfr/blit.py`); the blitter's memory grew to 8 KB for the UI's font sheet.
That build is 19,905 LUTs (81%) and 52 EBR, and 9 of 10 seeds meet 60 MHz
(46–49 MHz worst before, 66.2 MHz best now): with the blitter's false path
gone, the placer's effort goes to real paths. Seed 10 shipped.

**Then** (with the backdrop, fill engine, gate detectors and level meter
added, 21,573 LUTs (88%) and only 1 of 10 seeds meeting 60 MHz, its worst
path the stock CPU <- PSRAM acknowledge, about 77% routing: congestion),
another pass, measured in the flattened netlist:

| Change | LUTs saved |
|---|---|
| The line plotter as a register-only stub (`bfr/video.py`, `no_line_plotter()`): the dials are plotted pixel by pixel | 404 |
| The stream engine's statistics behind `DIAGNOSTICS` (off: `bursts` and `stream_stats` read 0, their counters go; `late` stays) | 270 (CSR bridge) |
| The outputs as fixed point: OUT registers written by fixed-point stores (value x 2^24), so the epilogue's float-to-integer conversion is a rounding shift and a saturation | 167 |
| The output FIFO (8 deep, buffered) as one sample's register: the CODEC side has its own FIFO | 116 |

20,390 LUTs (83%), 53 EBR, 23 MULT18; every one of 10 seeds meets 60 MHz
(60.9-67.2 MHz) and 8 meet every clock. Seed 8 shipped (66.1 MHz, DVI
86.7 MHz, 0 failing endpoints). The fixed-point outputs round half up
where the float conversion rounded half away from zero; OUT2/3 now equal
OUT0/1 at mix 1 to 1 LSB rather than exactly (OUT0/1 multiply an
f32-rounded reverb by mix).

**Then** (the scan-out fix, the input followers, 19 types: the types cost
no logic) 19,766 LUTs (81%), 53 EBR, 23 MULT18, but none of seeds 1-10
met 60 MHz (51.7-57.9): every failing path was the stock one from the
PSRAM controller's state through its acknowledge into the CPU's cache, 13
of its 17 ns routing (the controller sits at the PSRAM's pins on the left
edge, the CPU at the right). nextpnr's placer with a heavier timing weight,
`--placer-heap-timingweight 25 --placer-heap-critexp 3`, passed with 4 of 5
seeds (60.5-65.5 MHz; plain seeds 11-15: 1 of 5).

**But seed 16 (65.45 MHz, 0 failing endpoints) didn't start**: a black
screen, nothing on the serial port after the bootloader, only the CODEC's
hardware bypass audible. Crossing it with the last good build found the
placement at fault: the new bitstream with the old firmware was black, the
old bitstream with the new firmware ran, and seed 14 of the same netlist
ran too. Seed 16's one outlier is the route out of the PSRAM PHY's DQSBUFM
hard macro on its DATAVALID pin (read data has arrived, into the
controller's state machine): 3.23 ns, where the other 19 placements had
1.59 to 2.59 ns. nextpnr has no clock-to-output for that pin, so the
path's real delay isn't checked; the CPU's first fetch from the PSRAM
failed. `python -m bfr.phy_check <sdf...>` lists those routes and fails a
placement whose DATAVALID route is longer than seed 14's (2.3 ns): run it
before shipping a seed. Seed 14 shipped (normal placer options): 61.48 MHz,
DVI 80.8 MHz, 0 failing endpoints, DATAVALID 2.27 ns.

Where the logic was before that pass (flattened netlist, cells attributed by name):

| Block | LUTs |
|---|---|
| bfr core | 4,056 |
| CPU | 4,012 |
| Video (framebuffer, plotter, persistence, blitter, lines) | 2,860 |
| CODEC board (I2C sequencer, calibrator) | 1,150 |
| bfr stream engine | 980 |
| PSRAM controller | 880 |
| SPI flash | 870 |
| bfr CSRs and output FIFO | 460 |
| UART, timer, I2C, reboot, encoder, bus | about 1,100 |

The per-module synthesis (`synth_ecp5 -noflatten`) overstates some blocks:
it put the palette in LUT RAM and the CSR multiplexers at several times
their flattened size. Measure in the flattened netlist.

The firmware's slot holds 320 KB. At opt-level 2 each type cost 3-45 KB
(its expression functions inline the math they call; the resonator's
chord lookup was in every comb's expressions), and nine types came to
383 KiB. Now:

| Change | firmware.bin |
|---|---|
| Nine types, opt-level 2 | 383 KiB |
| `bfr-cpu` (generated expressions, math) at opt-level "z" | 324 KiB |
| The resonator's chords as polynomials; the firmware at opt-level "s" | 301 KiB |
| No float formatting: values, volts and logs through `Fixed` (integer arithmetic; core's float formatting was about 16 KB) | 278 KiB |

So a type now costs about 2-10 KB of code plus its tables, and 42 KiB are
free. The control tick's time ("ui" on the status line) is the thing to
watch, as size-optimised code calls its math rather than inlining it.

**Then** the expressions became data: `model/rustgen.py` emits each one as
postfix bytecode over its program's constant pool (`cpu/src/expr.rs`: push a
constant or parameter, the four operations, pow/min/max, exp/ln/sqrt,
sin/cos/tan, floor/abs/round, a 16-entry stack; every type needs 9 at most),
in the same order as the tree, calling the same math functions, so the
values are bit for bit the compiled ones (`test_type_switch` replays every
type against the model):

| Change | firmware.bin |
|---|---|
| Nine types, expressions compiled | 278 KiB |
| Expressions as bytecode, one evaluator | 227 KiB |
| Input followers (three more depth pages, the UI) | 235 KiB |
| Fifteen types (Ensemble, Pulse, Tunnel, Echo, Morph, Lab) | 260 KiB |
| Nineteen types (and Split, Rotor, Gated, Spiral) | 280 KiB |
| Debug statistics behind `--debug`, Lab out, Orbit, Fold and Carrier (21 types) | 289 KiB |
| And Vowel, Bounce, Crusher, Strobe, Swirl (26 types) | 315.6 KiB (4.4 KiB left) |
| Stable Carrier and Crusher, levels matched | 316.1 KiB (3.9 KiB left) |

A type costs about 4-6 KB (its tables, menu text and bytecode), so the
slot is now full; its biggest part is the tables (`.rodata`, 165 KB of
the image: taps, instructions, parameters). The control tick no longer drives
the motherboard's LED bargraph: its I2C transfer (about 20 bytes, every
fourth tick) was most of the tick's time, and the main loop now sends it
when the selected dial moves.

### First hardware runs

**Black screen.**
- First, the firmware overflowed its 16 KB stack before drawing anything
  (see CPU RAM above).
- Then the screen showed drifting static, the audio whined, and the serial
  log (USB debug port, 115200) read:

      frames 2060314  clocks 160/160  overruns 0  bursts 2600887  lag 255/8  late true

  The engine ran its frames, but the stream engine managed about 59k bursts
  a second of the roughly 240k needed. The log came every ~4 s instead of
  every second: the CPU, which runs from PSRAM, was starved too, as was the
  framebuffer DMA. The drifting picture is the same symptom H3000 had.

**Cause.** The stock arbiter is round-robin per transaction. The other
masters' transactions are long:
- the framebuffer's bursts of up to 128 words (about 150 clocks)
- the persistence effect's 16-word read and write pairs, about 72 clocks,
  every 32 clocks
- the CPU's cache fills

The engine needs an 8-word burst about every 250 clocks at 48 kHz. One
round took longer than that, so the engine fell behind for good, and from
then on it requested constantly.

**Fix.**
- The engine is the arbiter's priority master (`add_priority_master`). It
  gets the bus whenever it is idle, and no transaction is cut short. Its own
  load is about 11–19% at 48 kHz.
- The firmware slows the persistence effect to 512 clocks between pairs,
  as H3000 throttles it.
- The delay ring moved from the upper 16 MB to 8 MB, the region H3000 used.
  Whether the upper half works is not yet known, and if it wrapped onto the
  framebuffer it would look the same.

**Still the same.** The screen and audio did not change, and the log read
about 78k bursts a second (1.6 a frame of the 4.75 needed). Two more facts
came from it:
- For about 30 s the burst count stood still while the frames ran on. The
  scanner, hopelessly behind, had fallen more than 2^21 samples back; its
  "behind ptr" test wraps there, so it stopped until ptr came round again.
- The CPU stayed about 2x slow even while the engine was stopped.

With the priority stage alone, the engine and the round-robin alternate: one
engine burst, then one transaction of another master. 1.6 bursts a frame
means the others' transactions averaged about 740 clocks, or the bus is
much slower than its 1 word a clock. Neither is understood yet, so the next
build measures as well as fixes.

**Changes.**
- The arbiter is replaced (`bfr/psram.py`, still round-robin per
  transaction). The engine keeps the bus while `pending` (it has requests
  queued or a burst under way), so a sample's bursts go back to back.
- The scanner jumps to the present when it is more than 32 samples behind
  (`resyncs`), instead of keeping a backlog that makes every request late.
- The CPU is the large-cache variant with 32 KB of RAM, as in H3000 (same
  netlist): the firmware runs from PSRAM, and the stock 512-byte
  instruction cache turns it into a constant stream of line fills. That
  takes 23 more block RAMs; to fit (56 of 56) the engine's program memory
  is 512 instructions deep instead of 1024 (`BFR_PROG_DEPTH` in `top.py`;
  plate uses 108).
- The firmware redraws 15 times a second, timed by the engine's frames,
  instead of on every loop pass.

**Measurements** (serial log, once a second):
- engine: bursts per frame, scanner lag and resyncs;
- `cpu:` loop passes, redraws, and how far the UI's uptime moved in that
  second of audio (it counts timer interrupts, so it runs slow if they are
  missed);
- `psram:` the controller's busy share and words read and written;
- `bus <master>:` from the arbiter's monitor, which watches one master per
  2^24-clock window in turn: share of the bus held, share spent waiting,
  words and transactions a second, and the longest hold and wait in clocks.

**Root cause: no bursts.** With that build the audio was clean (5.00
bursts a frame, lag 2, no resyncs), but the picture was still torn. The
monitor showed why:

      psram: busy 85%  read 2764 kw/s  write 770 kw/s
      bus fb  : hold 32.4%  1081 kw/s   8457 txn/s  longest 2304 clk
      bus bfr : hold 49.1%  1920 kw/s 240000 txn/s  longest  143 clk

The framebuffer's 128-word bursts took 2,304 clocks and the engine's
8-word ones 143: 18 clocks a word, where the controller streams one word a
clock after ~15 clocks of setup. Every beat had become a transaction of its
own. `WidePsramPeripheral` forwarded `cti` and `bte` only if
`"cti" in signature.features`, but those features are `wishbone.Feature`
members, so the test was always false: since the first wide build no
master's bursts reached the controller, the bus moved about a sixth of
what it can, and the framebuffer got 1.1 M of the 7.8 M words a second the
720x720 panel needs. (`bfr/psram.py` now converts the features to strings,
asserts cti/bte are there, and `test_psram` checks that a burst arrives as
one.)

**The picture shifted after type loads** (the UI half a screen down and
wrapped round into an X, the backdrop, drawn by the scan-out itself, still
centred). The framebuffer DMA fills an asynchronous FIFO that the scan-out
empties a word per four pixels, and the stock scan-out realigns only its
byte counter at vsync, never the FIFO: once the DMA was starved in the
active area, the scan-out waited on the empty FIFO while the beam moved on,
and every later frame was shifted by the words it had missed, more with
each starvation. A type load starved it: the stream engine's ring clear
held `pending`, so the priority arbiter kept the bus for the whole clear
(about 2 ms). Now (`bfr/video.py`, `bfr/stream.py`):

- the DMA tags each frame's first word (the FIFO is 33 bits wide), and from
  vsync the scan-out discards words until a tagged one is at the FIFO's
  head, locking onto it before the active area (a frame whose first word
  comes too late shows the backdrop; the next one locks): a shift lasts at
  most a frame;
- a DMA still on the last frame at vsync starts the next one as soon as it
  is done, rather than waiting for the following vsync;
- the frame's last word ends the DMA's frame only once acknowledged (the
  stock FSM left on its request, dropping the word if the PSRAM wasn't
  ready on that clock), and a word's other three pixels shift out whether
  or not the FIFO holds the next word (the stock scan-out waited, which
  repeated each frame's last pixel three times);
- the ring clear's bursts take turns with the other masters (`pending` is
  low while clearing), so it no longer starves the framebuffer at all.

`test_scanout_realigns_after_a_starved_frame` stops a fake PSRAM for a
frame's visible lines: the stock framebuffer stays shifted for good, this
one shows every pixel where it belongs from the next frame on. (H3000 has
its own copy of the stock scan-out with the same latent fault; it hasn't
shown there, nothing starves its framebuffer that long.)

## Proposed architecture (draft, for discussion)

### Accumulators

With floating-point storage, using an accumulator as operand A (to scale it,
filter it or store it) goes through the float converter and the multiplier
again: about 6 clocks before the result can be used. With one accumulator,
like the FV-1, most instructions would wait.

So there are 8 accumulators. The compiler interleaves independent work
(other delay lines, the other channel, output taps) into the gaps. Plain
sum-of-products chains into one accumulator still issue one per clock,
because accumulation is forwarded. Each instruction also has an independent
store slot, so stores mostly cost no instruction.

### Sequencer

- Each sample starts a pass through a program of up to N instructions (N =
  cycles per sample minus pipeline depth).
- There are no branches, so timing is fixed and there are no stalls.
  Conditional behaviour comes from select and predicate ops.
- Program RAM is writable from the CPU and has two banks, so the CPU can load
  one algorithm while the other plays and switch between them at a sample
  boundary.
- Pipeline:
  1. fetch
  2. decode and address generation
  3. operand read
  4. multiply
  5. align into the accumulator
  6. accumulate
  7. normalise and round
  8. writeback

  The assembler schedules around read-after-write hazards.

### Instructions

Version 0, as implemented in the model, is in [SPEC.md](SPEC.md):

- MUL and MAC with operand A from delay memory, a register or an
  accumulator, and B from the coefficient bank, a register (signal x
  signal), the interpolation fraction, or a coefficient times a fade weight
- plus one store per instruction

The list below was the first cut. Not yet in version 0: abs, min/max, clip,
log2/exp2, butterflies.

- read-multiply-accumulate from delay memory or a register
- write the accumulator, then scale it (two-instruction allpass, like the
  FV-1's WRA)
- load
- one-pole filter step
- scale + offset
- abs, min/max, clip
- log2/exp2
- interpolated (fractional-address) read
- add/subtract pair for Hadamard butterflies

Special registers:

- audio inputs and outputs
- CV inputs (Tiliqua's jacks are DC-coupled, so CV can reach the DSP at audio
  rate without the CPU)
- LFO phases and sine/triangle values
- a noise source

### Memory

- **Registers:** 64 x binary32 in one EBR.
- **Parameters:** see [Parameters](#parameters).
- **Delay memory: PSRAM.** Each delay line is a ring buffer. Every tap moves
  forward one word per sample, and the program is fixed, so the hardware
  knows each tap's next addresses in advance.
  - A stream engine reads each tap ahead in bursts into a small FIFO in
    block RAM, and collects writes into bursts the same way. Nothing stalls;
    FIFO depth is the slack against framebuffer and CPU traffic.
  - A modulated tap uses a window buffer of twice the modulation depth
    instead of a FIFO. Its window still slides one word per sample, so it
    costs block RAM but no extra bandwidth.
  - Built: see [Stream engine](#stream-engine). Each FIFO is a region of
    2 bursts (16 words), and the slack is 8 samples per request.
- **Short lines: block RAM.** Lines shorter than the stream engine's
  round-trip latency live in block RAM. The round trip (write, burst to
  PSRAM, prefetch back) is 17 samples as built; the compiler uses 64. The
  assembler places these lines automatically.

### Parameters

- A bank of 64–256 binary32 values that the softcore writes over CSRs.
  Changes are double-buffered and take effect at a sample boundary. Each
  parameter can optionally be slewed in hardware, so knob moves don't zipper.
- Each algorithm declares its parameters in the DSL: name, range, unit, curve
  (linear or log) and how the value maps to coefficients. For example, decay
  time in seconds becomes one feedback gain per delay line, computed from the
  line lengths at the build sample rate. The assembler emits this as a Rust
  table, so the UI menu and CV assignments come from the algorithm and need
  no hand-written UI code.
- The CPU does the mapping in Rust (`f32`) at UI rate. The DSP only sees
  coefficients.

### Toolchain

- **Python assembler/DSL** (build time): named delay lines and taps,
  allpass, filter and mixing-matrix helpers, parameter declarations. It
  emits program images and the Rust parameter table, and prints a resource
  report per sample rate: instructions, PSRAM streams, PSRAM bandwidth,
  block RAM.
- **Bit-exact Python reference model** of the engine: the golden reference
  for the gateware (as `H3000/model` is). It renders WAV files offline, so
  algorithms can be auditioned before hardware.

### Softcore

- A Rust firmware with a menu UI in the style of `macro_osc`.
- A CSR peripheral for:
  - loading programs
  - the parameter bank
  - algorithm select
  - status: instructions used, PSRAM FIFO underruns, peak meters

### Rough cost (estimate, not yet synthesised)

| Resource | Estimate |
|----------|----------|
| LUTs | 3.5–5k (sequencer, float datapath, PSRAM stream engine) |
| MULT18X18D | 4–6 |
| EBR | about 3–4 for program, registers and parameters, plus 4–8 for stream FIFOs and modulation windows, plus any short-line pool |

## Capacity estimates

These estimates are for the instruction set above (one multiply and one
memory access per instruction). The assembler's report will replace them
with real numbers.

### Building blocks

| Block | Instructions | PSRAM streams |
|-------|--------------|---------------|
| Allpass (Schroeder) | 2 | 2 (or block RAM if short) |
| Delay line with one-pole damping and decay gain | 3–4 | 2 |
| Modulated, interpolated read (plus LFO update) | 3–5 | 1 (window buffer) |
| Hadamard mix, 8 lines | about 36 | 0 |
| Hadamard mix, 16 lines | about 96 | 0 |
| Biquad EQ | 5 | 0 |
| Early-reflection tap | 1 | 1 |
| Pitch-shift voice (for shimmer) | about 10 | 2 (modulated) |

### Whole algorithms

| Algorithm | Instructions | PSRAM streams |
|-----------|--------------|---------------|
| Stereo figure-8 plate (Dattorro-style) + EQ | about 80 | about 30 |
| 8-line FDN + diffusers + early reflections | about 120 | about 30 |
| 16-line FDN + diffusers | about 250 | about 40 |
| Shimmer add-on | about 25 | about 4 |

### What fits at each rate

| Rate | Instructions available | PSRAM payload for 40 streams | Fits |
|------|------------------------|------------------------------|------|
| 48 kHz | about 1230 | 7.7 MB/s | Any of the above, or two reverbs in series or parallel |
| 96 kHz | about 610 | 15 MB/s | 16-line FDN + diffusers + early reflections + shimmer |
| 192 kHz | about 300 | 31 MB/s, about the framebuffer's share | Plate or 8-line FDN with extras; 16-line FDN alone |

If 192 kHz needs more, the options are a second datapath lane (about +2k
LUTs, +4 multipliers) or a faster DSP clock domain.

## Open questions

- **LUT budget in the SoC.** The whole SoC is at 83% of LUTs (after the
  reductions above). Further options:
  - keeping the special registers in flip-flops, computed during the
    previous frame. That would also cut most of the 33-clock prologue,
    which matters at 192 kHz.
- **Short PSRAM delays.** The stream engine needs 17 samples (2N + 1), but
  the compiler keeps PSRAM lines at 64 samples or more, so `predelay` starts
  at 2 ms. Lowering `MIN_PSRAM_DELAY` would move more lines to PSRAM: more
  streams, less of the block-RAM pool. Forwarding from the write buffer
  would remove the limit.
- **Modulation windows.** The read buffer grows with depth × rate. The
  plate's 2 ms depth range needs 2,848 words at 96 kHz and 4,896 at
  192 kHz. Options:
  - a smaller depth range at high rates
  - a bigger buffer (EBR is tight)
  - a window that follows the modulation, which would no longer be
    guaranteed never to stall
- **Coefficient math on the CPU.** The firmware's f64 math matches the
  model's coefficients bit for bit in every tested session. The contract
  still doesn't promise it: a value can round differently.
- **First hardware test.** Things to check:
  - the upper 16 MB of PSRAM
  - the bus margin (`lag`, `LATE`)
  - frame clocks against the budget
  - the menu pages
  - that the stock timing misses are harmless, as they were for H3000
- **Crossfade refinements.**
  - A raised-cosine curve (still summing to 1, from the LFO sine table)
    would lose a little less level mid-fade than linear: -1.25 dB average
    instead of -1.76 dB.
  - The firmware could also hold size changes until the knob pauses.
  - Side B's stream buffers could share block RAM, since few taps fade at
    once.
- **Accumulator split** (8 integer bits + 48 fraction bits), and whether
  coefficients need full 24-bit mantissas or 18 bits are enough (2
  multipliers instead of 4).
- **The real PSRAM bus.** How much overhead each burst has, and how much
  the framebuffer takes. Each request has 8 samples of slack; `late` and
  `max_lag` will show the margin on hardware.
- Whether to add a codec at 192 kHz with the reverb at a lower internal rate.

## Layout

| Path | Contents |
|------|----------|
| `SPEC.md` | Engine semantics, version 0 (the contract for the gateware) |
| `model/fp.py` | Number formats: integer definitions and float-backed versions |
| `model/isa.py` | Instruction fields, register map, tap table, pipeline latencies, `Program` |
| `model/dsl.py` | Algorithm language: parameters and coefficient math (`P`), signals (`Sig`), delay lines, states, LFOs |
| `model/lib.py` | Building blocks: allpass, lowpass, mixing matrices, decay gains |
| `model/compiler.py` | Lowering, inlining, scheduling, memory/tap/coefficient layout, resource report |
| `model/engine.py` | Bit-exact engine (generated fast path + interpreter) and the hazard checker |
| `model/render.py` | Command line: report, listing, WAV rendering |
| `model/test_model.py` | Tests |
| `algorithms/` | Reverb types, one module each, `TYPES` (menu order) in `__init__.py`; `lab.py` is the template slot; `fdn8` for tests |
| `tools/render_presets.py` | Renders every preset to WAV and checks decay and stability |
| `tools/type_report.py` | What each type uses of the engine's pools |
| `tools/stress_types.py` | Looks for parameter settings that make a type grow instead of decay |
| `tools/stack_frames.py` | The firmware's largest stack frames, from its disassembly |
| `tools/pnr_seeds.sh` | Places and routes several nextpnr seeds in parallel, with the PHY check |
| `bfr/core.py` | Engine gateware: sequencer, pipeline, memories, LFO/noise/fade units |
| `bfr/fpu.py` | Arithmetic helpers for the datapath (decode, leading-one, int/f32 conversions) |
| `bfr/stream.py` | PSRAM stream engine: stream table, scanner, burst engine, buffers, clear |
| `bfr/peripheral.py`, `bfr/test_peripheral.py` | The engine as a CSR peripheral, tested through its CSR bus |
| `bfr/sim.py` | Runs the gateware in lockstep with the model (the model plays the CPU); PSRAM model |
| `bfr/test_core.py`, `bfr/test_stream.py` | Gateware against the model, bit for bit (core alone; with the stream engine) |
| `bfr/psram.py`, `bfr/test_psram.py` | PSRAM peripheral widened to 32 MB for this project only |
| `bfr/video.py`, `bfr/test_video.py` | Palette with a registered output, in one block RAM, no persistence effect, the framebuffer's DVI timing fixes and a scan-out that realigns every frame, for this project only (no shared Tiliqua file is edited) |
| `bfr/blit.py`, `bfr/test_blit.py` | Blitter with its sprite address registered (timing), for this project only; tested against the stock one |
| `bfr/backdrop.py`, `bfr/test_backdrop.py` | The UI's backdrop (scan-out overlay): glow, rings, dither, curtain; tested against a Python reference pixel for pixel |
| `bfr/fill.py`, `bfr/test_fill.py` | PSRAM fill engine (clears the framebuffer in bursts) |
| `bfr/synth.py`, `bfr/sta.py` | Standalone synthesis of the core, and a full failing-path report |
| `bfr/phy_check.py` | The PSRAM PHY's hard-macro routes nextpnr doesn't time (a placement with a long DATAVALID route doesn't start): run on a seed before shipping it |
| `model/rustgen.py` | Rust tables, expressions and saved-state pages for the firmware |
| `top.py` | SoC top level (`BfrSoc`), `--algorithms` |
| `cpu/` | `bfr-cpu` crate: math, encodings, parameter/crossfade policy, CV mapping, screen and dial geometry (`dial.rs`, also included by `fw/build.rs`), all host-tested |
| `fw/` | Firmware: round UI (screen, glyphs, theme, input), CV, engine interface, status |
| `pac/` | Peripheral access crate (generated by `top.py build`) |
| `bfr/test_firmware.py` | `bfr-cpu` against the model (runs `cargo test`) |
| `conftest.py` | `--runslow` for long simulations |

The model is a top-level package (`model`), as in H3000, so run everything
from this directory. That is also why there is no `__init__.py` here.
