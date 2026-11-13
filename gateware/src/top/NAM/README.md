# NAM on Tiliqua

A guitar amp from a Neural Amp Modeler profile, running in the FPGA. Plug a
guitar into IN0, take OUT0 to the cab or interface, pick a `.nam` from a USB
drive on the 720 × 720 screen, and set levels, gate and tone there too.

This file is the plan and the record: what was decided, what was measured, and
what is left. It changes as the work does.

## What NAM is, and which part runs here

NAM's `.nam` files are JSON: an architecture name, a `config` describing the
network and a flat list of float weights. The architectures the C++ core
(`NeuralAmpModelerCore/`) supports are LSTM, a general WaveNet, and since
0.7 the **A2** family: a WaveNet with a fixed shape that the core runs through
a hand-optimised path (`NAM/wavenet/a2_fast.cpp`). Published A2 profiles carry
two networks in a `SlimmableContainer`: **A2-Lite** (3 channels, 1,871 weights)
and **A2-Full** (8 channels, 12,146 weights). This project runs A2, both widths,
and refuses other files with the reason on screen.

The A2 shape (per sample, `C` channels, input `x`):

    lin[c]  = rechannel[c] * x
    hsum[c] = 0
    for each of 23 layers (kernel K, dilation D):
        hist_l[t] = lin                                   # stored for later taps
        z[i]  = conv_b[i] + sum_k sum_j conv_w[k][i][j] * hist_l[t - (K-1-k)*D][j]
        z[i] += mixin[i] * x
        z[i]  = z[i] if z[i] >= 0 else 0.01 * z[i]        # LeakyReLU
        hsum[i] += z[i]
        lin[c] += l1x1_b[c] + sum_b l1x1_w[c][b] * z[b]
    y = head_b + sum_k sum_b head_w[k][b] * hsum[t - (15-k)][b]
    out = y * head_scale

Kernels are 6 taps (two layers of 15), dilations 1, 3, 7, 17, 41, 101, 239 in
three stacks (plus a 1 and a 13), receptive field 6,347 samples. Per sample
A2-Full is 11,776 multiply-accumulates; at 48 kHz that is 565 million a second.
`model/a2.py` loads a file and runs this in floating point; it matches the
compiled core to -130 dB on the core's example audio (both widths, both the A2
path and the generic WaveNet path).

The plugin around the core (`NeuralAmpModelerPlugin/`) adds what a player
expects, and this project mirrors it: input level and calibration, a noise
gate, a bass/middle/treble tone stack, output level with Raw/Normalized/
Calibrated modes, and the Lite/Full choice. (Its cabinet IR convolution is a
possible later phase; it is not in the plan.)

## Hardware

Tiliqua R5: Lattice ECP5-25F (24,288 LUTs, 56 block RAMs of 18 kbit, 28
18 × 18 multipliers), 32 MB PSRAM (16 MB mapped), audio at 48 kHz, the
Eurorack-level inputs with ±8.192 V at full scale (+17.5 dBu). Clocks: `sync`
60 MHz (CPU, buses), `fast` 120 MHz (so far only the PSRAM's DDR PHY), `dvi`
74.25 MHz.

The SoC this builds on is FairWave's (`top/fairwave`): VexiiRiscv, firmware
in PSRAM, the 720 × 720 framebuffer, USB host for a drive, no persistence
effect, the registered palette and fixed DVI timing. The first plan put that
SoC at about 10k LUTs; measured, it is about **18,300**: FairWave's bare SoC
was 14,141 and `guh`'s USB host added about 4,200. Builds on this part start
missing timing above about 85–89% of LUTs, so the engine's share is a few
thousand LUTs, not ten. See [Fitting](#fitting).

## Architecture

### The budget

565 M MACs/s needs the multipliers busy: 8 multipliers at 120 MHz (or 16 at
60 MHz) give 960 M MACs/s. The engine therefore runs in the **`fast` (120 MHz)
domain with 8 multipliers** per voice; at 60 MHz, 16 multipliers would leave
none for a second voice. 120 MHz on this part is reachable only with the
multipliers' own registers, block RAM output registers and short logic between
registers; the engine is built that way, and timing is a build-time result to
check (see Status).

History is the other constraint. A2-Full keeps 9,568 words for each D = 239
layer and 4,048 for each D = 101 layer: 45 block RAMs at 16 bits, more than the
chip has. Those six layers' history lives in **PSRAM**, streamed through small
block-RAM buffers by a DMA engine as BFR's delay memory is (`top/bfr`); the
short layers (D ≤ 41, 10 block RAMs at 18 bits) stay in block RAM. PSRAM traffic
for mono Full is 28 MB/s (one write and five reads of a 16-byte frame per layer
per sample), beside the framebuffer's 31 MB/s.

Each (ring, tap) is a read stream with a region of two bursts in the read
buffer, and each ring a write stream in the write buffer. All of a profile's
streams share one geometry (words per frame, per burst, per PSRAM ring, all
powers of two), so a region's address comes from the stream's number, and a
ring's streams step through their regions together: one position per ring,
the rings staggered so their transfers spread over a burst's samples. PSRAM
rings are all the same power-of-two size and aligned to it, so a stream's
PSRAM position (the only per-stream state, 18 bits) wraps with a mask. The
buffers are dual-clock block RAMs: the PSRAM master writes fetched words
straight into the read buffer and takes a flush's words straight out of the
write buffer, on the bus clock.

### The datapath

One 18-bit activation per clock, broadcast to 8 multipliers against a column of
8 weights (18-bit) read from a 144-bit-wide weight memory. Products (36-bit)
add into 40-bit accumulators: two banks **Z** (the layer's convolution output,
alternating between layers so the next layer's taps run while this one is
finished), **LIN** (the residual stream, kept wide across all 23 layers so
rounding only happens where history is stored) and a small **H** (the running
sum of z for the head). A serial **post unit** takes one accumulator per clock:
LeakyReLU (the negative side times 10486/2²⁰ = 0.01 within 2.3e-5, by shifts
and adds), a shift, round-half-up, saturate, and routes the result to a history
ring, the z FIFO, the hsum ring or a scalar register (x, y, out). Biases are
multiplies of a constant activation 2¹⁶. Every weight class has a binary
exponent chosen per profile so it fills 18 bits; the shifts come out of the
exponents (`model/fixed.py`, `quantise`).

The engine is a small interpreter: it runs a **program** of segments, each
"stream these activations against these weight rows into this bank" (MAC) or
"post these accumulators to there" (POST), with the data dependencies between
them as stalls (an accumulator bank is posted once its last product has landed;
the newest tap of a layer waits for the post unit to have written that layer's
history; the 1 × 1 mix waits for z values in the FIFO). The program, the ring
table, the stream tables and the weight images are generated from the profile
(`model/program.py` in Python for the tests, `fw/` in Rust on the device), so
the gateware knows nothing of A2's layer list, and the same machinery runs the
input gain, the head, the output gain and later the tone stack. Full is about
1,850 MAC clocks plus a few stalls per sample against 2,500 available; Lite
about 800.

### Number formats (measured)

`model/fixed.py` is the bit-exact model of the datapath; `quantise` picks the
exponents, `run_fixed` runs the integers. Formats were chosen by running the
float and fixed models on a synthesised guitar (plucked strings at -30 to
-12 dBFS, single notes and a chord), the core's example audio, noise and
sines, with the input quantised to 16 bits as the codec delivers it, and
comparing the error-to-signal ratio (ESR) against the ESR the 16-bit input
quantisation alone causes (the "input floor": -61 dB on the guitar, -81 dB on
the example audio, for A2.nam).

| Signal | Width | Format | Why |
|---|---|---|---|
| x (input after gain) | 18 | Q15 | the 16-bit sample with 2 bits of headroom |
| history in block RAM | 18 | Q13 (per layer) | ±16: Lite's late layers reach 16 on hard signals |
| history in PSRAM | 16 | Q11 (per layer) | halves the traffic; costs 0–3 dB ESR |
| z (layer output) | 24 | Q18 | see below |
| hsum | 18 | Q11 | ±64; 12 bits changed nothing |
| Z, LIN accumulators | 40 | per layer / per profile | peaks seen 2³⁶; 8× margin |
| y (head output) | 18 | Q(fits 2/head_scale) | |
| out | 16 | Q15 | |

z was the dominant error: at 18 bits (Q12, range ±32 for Lite's peaks of 26)
the ESR was -47 dB on the guitar (Full), 14 dB above the input floor, and each
bit of z was worth 3 dB. z therefore has **24 bits**, fed to the 1 × 1 mix as
two MACs: the high 18 bits against the weight, the low 6 bits against the
weight shifted right by 6 (truncated, in the datapath, no extra storage). The
1 × 1 mix is 8 activations per layer, so this costs 184 clocks per sample and
brings the engine within a few dB of the input floor:

| ESR, dB (A2.nam) | guitar | example audio | noise -20 dBFS | 82 Hz sine -40 dBFS |
|---|---|---|---|---|
| input floor (16-bit input, float model) | -61.3 | -80.6 / -81.2 | -71.0 / -74.4 | -64.7 / -64.5 |
| Lite, engine formats | -56.7 | -66.1 | -60.5 | -58.7 |
| Full, engine formats | -53.3 | -70.8 | -59.0 | -55.8 |

The remaining error is the 18-bit history (Q14 would give Full another 6 dB
but saturates Lite). The history formats are per layer and programmable; a
calibration pass at load time (run a test signal through the engine, read the
per-ring peak registers, give each layer the finest format with headroom) is
planned as a phase.

### Levels

NAM's `input_level_dbu` is the dBu that was digital full scale when the profile
was recorded; Tiliqua's full scale is +17.5 dBu. So the calibrated input gain is
`17.5 − input_level_dbu` (+2.7 dB for A2.nam) when calibration is on, plus the
input level trim. A guitar straight into a Eurorack-level input is quiet
(roughly -40 to -18 dBFS), so the trim allows more than the plugin's ±20 dB.
Output: Normalized mode applies `−18 − loudness` dB as the plugin does.

### Stereo

Lite is small enough that one datapath can run two voices one after the other
(2 × 800 clocks), with both voices' history in block RAM. Full needs a second
datapath in lockstep (8 more multipliers, a second set of accumulators, rings
and streams; 55 MB/s of PSRAM). The engine takes a `voices` parameter; mono
first, then stereo Lite on one datapath, then stereo Full if the build has room.

## Fitting

The first full build (2026-11-12) did not fit: **64 of 56 block RAMs and 108%
of LUTs** (26,359 of 24,288 TRELLIS_COMB, plus 547 LUT-RAM write ports). A
hierarchical synthesis split it as about 15k for the SoC, 4.4k for the USB host
and 9.5k for the NAM peripheral.

`tools/synth_engine.py` synthesises the peripheral alone in about 30 s, which
is how each change below was measured (yosys cells; a LUT-RAM `DPR16X4` counts
as about 6 LUT sites: 4 LUTs and a write-port slice that blocks 2 more, so a
table with several asynchronous read ports, each a copy, is expensive). Every
change is bit-exact: `tests/test_engine.py` (small network, 60 samples) and
`--full` (A2-Full) still match the interpreter word for word.

| Change | LUT4 | CCU2C | DPR16X4 | EBR |
|---|---|---|---|---|
| NAM peripheral as first built | 6,265 | 1,116 | 307 | 29 |
| Accumulators cleared by the flip-flops' synchronous reset one stage ahead (no clear mux before the 960 adder bits); the eight H sums share one adder; post unit: rounding as an increment after the shift, saturation from the top bits (no comparators), LeakyReLU adders only as wide as their operands | 5,012 | 882 | 307 | 29 |
| Streams: one geometry per program, regions found from the stream number, one position per ring, equal power-of-two PSRAM rings; the stream table (102 bits, four read ports) becomes an 18-bit position table with one | 4,623 | 846 | 149 | 29 |
| Dual-clock stream buffers: the PSRAM master moves words straight to and from them (its two 64-word async FIFOs go) | 4,312 | 800 | 148 | 27 |

In LUT sites (LUT4 + 2 × CCU2C + 6 × DPR16X4) that is 10,400 down to 6,800.
Clocks per A2-Full sample went from 2,040 to 2,028 (the advance loop visits
rings, not streams). The register bridge then went from 418 to 246 LUT4 by
writing table entries through one shifting `twrite` register instead of five
data registers and an address.

**Timing.** The next build placed at 91% but its estimate for the engine was
73 MHz. `tools/time_engine.py` places and routes the engine alone at 120 MHz
(its ports fed and drained by shift registers, so nothing is optimised away)
and prints the worst path; on an empty chip a path that fails will fail in the
SoC. Two findings first: the `MULT18X18D` instances tied their unused pins to
ground, which nextpnr can't route (the "arc of net `$PACKER_GND_NET`" failure,
on an empty chip too: that, not congestion, was the routing failure), and
yosys maps every block RAM without its output register, so a read's data comes
5.8 ns after the clock. `nam/bram.py` instantiates the block RAMs with their
output registers. Then, one worst path at a time, each fix bit-exact:

| Worst path | Fix | Engine alone |
|---|---|---|
| history RAM → 10-way select → activation | memories split per block RAM, outputs registered | 82 → 86 MHz |
| ring position read → add → write back, queue a transfer | advance loop in two stages | 99 |
| H sum select → add → H | H accumulate in two stages (p8 read, p9 write) | 106 |
| block RAM data (5.8 ns) → register | `BlockRam`: the RAMs' output registers | 107 |
| stream position read → add → write back | position read into a register first | 106 |
| post unit → history write enables (10 RAMs) | writes registered per RAM | 114 |
| history select → source mux → activation | ring value gets its own stage (s6) | 116 |
| stall conditions → issue → segment load | busy, idle, landing and FIFO-empty kept as registers | 118 |
| post queue head → bank landed? → pop | buffered queue, landed and pipeline-empty as registers | 117 |
| counters → last op? → load | "last op" kept as a register | **122.6** |

The first full build with these routed (the ground-pin fix) at 90% of LUTs:
system clock 62.8 MHz and video passed, the engine 99.2 MHz against 120: on a
full chip, wiring costs it about 20%. So the engine needs about 140 MHz alone,
and the harness's target went up to that (`NAM_TIME_MHZ=140`):

| Worst path | Fix | Engine alone (140 target) |
|---|---|---|
| advance loop's update → transfer queue | a third stage: compute, then write and queue | 110 |
| issue → end segment → segment FIFO's read logic | the next segment waits in a register, refilled when empty (a clock's bubble after a one-op segment: +27 clocks a sample) | 125 |
| (load decodes) | the next segment's decodes made as it is fetched | 122 |
| item counter → lane and bank select of 3 banks and H | split: each bank's lane at p0, the bank at p1 | 124 |
| the issue loop (stall → issue → end → load → counters) | two segment slots: one issues while the other loads from the queue, a segment's end only flips the issuing slot, each slot decides from its own registers | 125 |
| issue → in-flight counters' adders | the count takes an op a clock later; the "landing" flag takes it at once | **131.8** |

On a full chip the previous netlist (before the last two rows) placed at 90%
and its engine routed at 90 MHz, the one before that at 99: the routing is 8.7
of 11 ns on the worst path, so placement decides much of it. Clocks per
A2-Full sample: 2,079 of 2,500 (the two slots also took out the load bubbles).

The SoC gives up three things (`nam/trim.py`, project-local overrides):

- **No SPI flash controller** (about 1,150 LUTs; the user's choice, 2026-11-12):
  settings will live in a file on the USB drive instead of the slot's option
  storage. A stub keeps the flash window and the controller's registers, with
  nothing behind them, so the memory map, the cached CPU netlist and the HAL's
  driver are unchanged.
- **No debug UART** (about 400 LUTs; the user's choice, 2026-11-12, once the
  engine's timing showed it needs the room): a stub keeps its registers and
  pins, transmit always ready and bytes going nowhere, so logging is a no-op.
- **16 KB of CPU RAM** instead of 32 (8 block RAMs): the CPU is still told 32 KB
  (its regions key the cached netlist), the RAM and the linker script have 16.
  The firmware's data is 84 bytes; the rest is stack, and FairWave, with USB
  and FAT, used under 11 KB of it.

## Plan

| Phase | What | State |
|---|---|---|
| 1 | Float reference (`model/a2.py`) checked against the compiled core | done |
| 2 | Fixed-point study and bit-exact model (`model/fixed.py`) | done |
| 3 | Program generator and interpreter (`model/program.py`), engine gateware (`nam/engine.py`) with tests against the model | done |
| 4 | PSRAM streams, the peripheral and `top.py`; first build: resources, timing at 120 MHz, clocks per sample | fitting (see [Fitting](#fitting)) |
| 5 | Firmware: `.nam` parser and loader, quantisation in Rust, USB browser, prewarm | |
| 6 | UI: level meters, input/output/gate/tone/mode/Lite-Full, round-screen design | |
| 7 | Noise gate and tone stack (in the program), DC blocker | |
| 8 | Whole-SoC simulation and hardware check; calibration pass | |
| 9 | Stereo: Lite on one datapath, Full with a second | |
| 10 | Visualisation: oscilloscope and spectrum of in and out | |

## Decisions

| Decision | Choice | Why |
|---|---|---|
| Which networks | A2 Lite and Full only | the only shape the fixed-point engine is built for; others refused with a reason |
| Engine clock | `fast`, 120 MHz, 8 multipliers per voice | Full needs 565 M MAC/s; 16 multipliers at 60 MHz would leave no second voice |
| Where history lives | D = 101 and 239 in PSRAM (16-bit), the rest in block RAM (18-bit) | 45 block RAMs don't exist; the six long layers are 28 MB/s |
| z width | 24 bits as two MACs | the dominant error at 18 bits; +184 clocks per sample |
| Biases | a MAC against the constant 2¹⁶ | no separate adder path; resolution 2⁻¹⁴ or better |
| Control | program of MAC/POST segments, generated per profile | A2's layer list, the head, gains and tone stack in one mechanism; testable in Python |
| CPU RAM | 16 KB of block RAM, the CPU told 32 KB (FairWave's map) | 8 block RAMs; the cached VexiiRiscv netlist is keyed on the map, a new one means sbt |
| Persistence | removed as in FairWave | the UI is drawn incrementally |
| SPI flash controller | removed (a stub keeps its window and registers); settings in a file on the USB drive | about 1,150 LUTs; the user's choice when the first build didn't fit |
| Debug UART | removed (a stub keeps its registers: logging is a no-op) | about 400 LUTs; the user's choice for the engine's timing headroom (line and pixel drawing kept) |
| Stream layout | one geometry per program, one position per ring, equal power-of-two PSRAM rings | the per-stream table with four read ports cost about 950 LUT sites |
| Stream buffers | dual-clock block RAMs that the PSRAM master reads and writes | its two async FIFOs were 2 block RAMs and about 300 LUTs |
| Accumulator clear | the flip-flops' synchronous reset, one stage before the clearing op lands | a mux in front of 960 adder bits was about 960 LUTs |

## Status

Nothing has run on hardware yet. Measured so far: the float model against the
core (-130 dB), the fixed-point ESRs above, the engine against the
interpreter in simulation (bit-exact; A2-Full 2,028 clocks a sample of the
2,500 at 120 MHz), the Rust program builder against the Python one (bit-exact,
Lite and Full), and the fitting work above. The firmware is a skeleton: the
engine driver, the display and input; no loader or UI yet.

## Layout

    model/      a2.py (loader, float reference), fixed.py (bit-exact datapath),
                program.py (program, tables and images for the engine)
    nam/        engine.py (datapath, post unit, sequencer), streams.py (PSRAM master),
                peripheral.py, trim.py (SoC parts left out to fit), project-local
                overrides vendored from FairWave (video, blit, fill, psram, cpu)
    cpu/        Rust, host-tested: .nam scanning and quantisation, the program builder
                (checked against golden/, written by tools/dump_program.py), UI geometry
    fw/         firmware (Rust): engine driver, display, input; loader, UI, USB to come
    pac/        the register crate, generated by the build
    tests/      the program against the fixed-point model, the engine against the program
    tools/      dump_program.py (golden files for cpu/), synth_engine.py (the peripheral's
                cost, alone). The float model's check against the compiled core was a
                one-off outside the repo (model/a2.py says how).
