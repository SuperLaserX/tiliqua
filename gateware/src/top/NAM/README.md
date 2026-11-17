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

### Loading a profile (the firmware)

The PROFILES screen lists the USB drive, starting in a `NAM` folder if the
drive has one. Listing a folder reads the first 32 KB of every `.nam` in it
(one USB read each): a network's config and metadata come before its weights
(13 KB in for the example), so that says whether it is A2, and what its
metadata calls it (`namfile::summarise`). Files that aren't A2 are left out;
one whose start doesn't say (a config longer than that) stays, and loading it
says. The list is the way up, the folders, then the profiles grouped by the
metadata's `tone_type`, cleanest first (CLEAN, CRUNCH, OVERDRIVE, HIGH GAIN,
FUZZ, then OTHER for those without one) under a heading each, and by title
within a group; no headings if no profile says its tone. A profile's title is
its metadata `name`, else its file's name (underscores as spaces); under the
list, the highlighted one's gear make and model, tone, kind and who captured
it, as far as the metadata says. A file's own name is no longer shown once
the metadata names it.

Clicking a profile reads the file into PSRAM (the 4 MB profile buffer, its
last 64 KB the quantised weights) and loads it in two steps
(`cpu/src/loader.rs`):

1. **Prepare**, while the last profile keeps playing: find the A2 networks,
   pick the width (Full if the file has both), take the class maxima and
   quantise the weights (the two passes over the file's text), and build the
   program once into nothing. Anything that can fail fails here, with its
   reason on the screen, and the sound doesn't change.
2. **Write**: the engine off (the output silent), the program built again
   into its tables, the configuration, `clear` and `prefill`, then the engine
   on with both gain words at zero.

**Prewarm**: with the input gain zero the engine runs on silence; after
250 ms, past the receptive field (6,347 samples, 132 ms), every delay line
holds what silence leaves in it, as the core's prewarm does. Then the input
gain word goes in and the output gain word comes up in 16 steps over 80 ms.
The gain words are single aux words, written while the engine runs; a sample
reads the old one or the new.

Levels by default follow the plugin's Calibrated input and Normalized output:
input `17.5 − input_level_dbu` dB, output `−18 − loudness` dB, each 0 when the
file doesn't say (the Amp screen shows both). With no profile loaded the input
passes straight through, as the engine's bypass.

### The screens and controls (phase 6)

Five screens on the switcher (hold the encoder anywhere): AMP, TONE, PROFILES,
SCOPE and SYSTEM, round the circle where each one's part of the rim is; the
rim shows which screen is up. Turning moves, a click edits (the value shows
as `< +6 DB >`), turning then changes it and a click again stops.

**AMP**: the profile's title, what its metadata says of it, the network
(width and channels), and five settings in a column, names left of the centre
line and values right of it:

| Setting | Values | What it does |
|---|---|---|
| INPUT | -30 to +40 dB | the input trim, on top of the calibration |
| OUTPUT | -40 to +20 dB | the output trim, on top of the mode |
| INPUT CAL | ON, OFF | add `17.5 − input_level_dbu` (nothing if the file doesn't say) |
| OUTPUT MODE | RAW, NORMALIZED, CALIBRATED | nothing; `−18 − loudness`; `output_level_dbu − 17.5` |
| NETWORK | LITE, FULL (or `FULL ONLY`) | loads the profile again at the other width |

Under them the status (playing, warming up, engine late) and the levels
applied, `IN +2.7 DB   OUT -6.4 DB`. The level meters run up the rim, input on
the left and output on the right: 30 segments of 2 dB from -60 dBFS, up at
once to a peak and back down at 50 dB a second, amber within 6 dB of full scale
and red, with the label, for a second after a clip.

Levels change **live**, with no reload: a gain is an aux word and its shift
a field of a post segment's low program word, each written whole, so the
firmware writes the two (the shift first when it grows, the word first when
it shrinks: the sample that sees one without the other is quieter, never
louder). `loader::level_words` gives them, and a test checks that a level
changed live leaves every table as a fresh build at that level would. The
width can't change live: it reloads from the file buffer, which keeps the
profile playing whole (the listing's scratch moved to its end), with the
usual prewarm.

Where everything goes is `cpu/src/layout.rs`, and its tests check that every
piece of text fits the glass, none overlaps another, and none comes within
3 pixels of a meter or the rim. Gauges and lines redraw only what changed.

### The noise gate (phase 7)

The plugin's gate (AudioDSPTools' `noise_gate::Trigger` and `Gain`, as the
plugin sets them up), run by the CPU: `cpu/src/gate.rs`, in integers. The
trigger follows the input's power after the input gain, smoothed with a 10 ms
half-life; open, it stays open while that is above the threshold and for
10 ms after; then it moves towards a reduction of 0.1 dB per dB² under the
threshold, closing its full reduction in 50 ms at most and opening it in 5 ms.
The gain scales the engine's output gain word, so no gateware changed.

It runs on a 250 µs timer tick (the HAL's tick is whole milliseconds, so the
firmware sets the timer up itself; the controls run every 20 ticks). Each
tick it reads the meters register (the input's peak over those 12 samples:
for a guitar's fundamentals near its power) and, when its gain changes,
writes the gated output word. The interrupt is now the only reader of the
meters, and every table write the main loop makes is a critical section, so
the interrupt's one-word write never lands inside another entry. A level
change in the main loop writes the output word as the gate scales it.
Host tests check the dB arithmetic to a hundredth of a dB and the gate against
the plugin's algorithm in floating point to half a dB (a note into hiss: it
opens within 5 ms and doesn't close until the note is under the threshold).

The TONE screen: NOISE GATE on or off and THRESHOLD (-100 to 0 dB, -80 by
default, as the plugin), what the gate is doing, the level it hears on the
left arc and how far it has closed on the right.

### Tone stack and DC blocker: not in the program

The plan had them in the engine's program, as biquads over rings. A model of
that (the plugin's RBJ biquads, 18-bit coefficients, exact accumulation,
history at 18 bits as the rings keep it) against floating point, on A2-Full's
output for a synthetic guitar:

| Setting | ESR |
|---|---|
| all flat | -34.5 dB |
| bass +20 dB | -4.8 dB |
| bass -20 dB | -37.6 dB |
| middle +15 dB | -28.6 dB |
| treble +10 dB | -41.8 dB |
| DC blocker (5 Hz high pass) | -44.1 dB |

Unusable: at 150 Hz the feedback amplifies the 18-bit rounding of the stored
outputs by thousands, so even flat it is the largest error in the chain (the
engine itself is about -53 dB). Wider history doesn't fit the program either
(a MAC can scale a product only by its weight, which can't carry the low half
of a split value). Filters with wide states need gateware; whether to spend
the LUTs and another timing sweep on them is the user's decision (open).

**The user chose gateware (2026-11-17).** `nam/tone.py`, bit-exact with
`model/tone.py`: the four sections (bass shelf, middle peak, treble shelf, the
5 Hz high pass) in direct form I, one after another on the engine's output in
the `sync` domain, about 110 clocks of the 1,250 a sample has. Signals are 32
bits (Q4.27, room for +20 dB of bass over a full-scale sample) and
coefficients 27 bits (Q3.23: 18 bits put the bass shelf up to 2.1 dB off;
Q2.24 held every setting within 0.003 dB but the treble shelf's coefficients
reach 5, so Q3.23, within about 0.006 dB). One 18 x 18 multiplier makes each
product as four partial products into a 61-bit accumulator. Coefficients are in
two banks: the CPU writes the one not playing and asks for a swap, made as the
next sample starts (a status bit until then), so a sample never sees half a
setting; both banks start flat with the DC blocker, so the sound passes before
the firmware writes anything. `tests/test_tone.py`: the model against
floating point at every extreme (its error is the output's 16-bit rounding,
to a tenth of a dB, at each), flat passing the signal exactly, DC removed, and
the gateware against the model sample for sample through three bank swaps and
saturating noise. Its cost, alone: about 380 LUT4, 2 multipliers and a block RAM
(the coefficients; 55 of 56 now used). The firmware writes coefficients from
`cpu/src/tone_tables.rs`, written by `tools/tone_tables.py` from the model,
one set per dB: what the model and gateware were tested with. The TONE screen
has EQ on or off, BASS (±20 dB), MIDDLE (±15) and TREBLE (±10), as the
plugin's knobs.

### Building and shipping, unattended

`tools/ship.py` does what used to be watched by hand: `top.py build`, then
seeds on the netlist as soon as synthesis writes it (alongside the default
seed's place-and-route), several at a time, each judged as it ends by
`tools/seeds.py`'s checks (every clock at its target, the PSRAM PHY's
data-valid route); the first that passes wins and the rest are stopped
(`--all` runs every seed and takes the most engine margin); once the build has
finished, the winner is packed and `top.py build --skip-build` makes the
archive with the firmware as it is then, also copied to `nam-shipped.tar.gz`.
The archive there before is kept as `nam-before-ship.tar.gz`. Progress is in
`build/nam-ship.log`, the outcome in `build/nam-ship.json`; it exits 1 if no
seed passes.

    python src/top/NAM/tools/ship.py [--seeds 1-24] [--jobs N] [--all]   (from gateware/)

### Themes

Six, picked on the SYSTEM screen (click THEME, turn, click): SLATE (the
first look, on a blue-black ground), TWEED (cream and gold on brown), NEON
(magenta and cyan on violet), PHOSPHOR (a green screen), STAGE (white, red and
yellow on black) and DAYLIGHT (ink on paper, for a bright room). A theme is a
ground colour, the five colours drawn on it, and a bezel round the rim (a
ring, two rings, a knob's skirt of ticks, or a glow). Every colour's
intensities run from the ground to its full value, so faint things fade into
the ground and every erase is the ground; switching is a palette write and a
redraw. The theme resets to SLATE at power-up (nothing is kept yet).

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

With the two slots and the delayed count the full build routed the engine at
108 MHz (system 61.3, DVI 93.0, DVI 5x 398: all pass). `tools/seeds.py
--heavy` on that netlist, eight seeds: engine 114.3, 113.3, 111.4, 110.3 and
101.8 MHz, three didn't route. Then two more fixes, alone at 140: the
transfers' lateness check as a subtraction then a comparison, a clock each
(135 MHz), and the segment queue's head registered (the slots load from it
off the issue path; 128 to 135 MHz, placement noise). That netlist's sweep
did worse on the full chip (best 108.9 MHz), and its worst paths showed why:
in six seeds of seven, `advancing` (read all over the chip) through the issue
decision into the z or newest FIFO's level counter. So: `advancing` left the
issue decision (no slot holds a segment while advancing, so it was redundant),
the two FIFOs became `nam/fifo.py`'s (the read enable is a pointer's clock
enable and the select of a precomputed "holds a value"), and the slots' count
limits are set as they load. Full build: 88% of LUTs (21,559); ten seeds:
engine 117.0, 114.9, 111.6, 110.1, then 104.8 to 108.4 MHz. The common worst
path moved to the transfer request's handshake (queue room → position write),
now registered.

With that, the build placed at 89% and routed the engine at 117.2 MHz; twelve
seeds: 118.7, 115.9, 115.5, 111.9, 111.7, 111.3, 110.9, 109.8, 108.6, 107.5
and 105.4 MHz (one never finished routing), two of them also under 60 MHz on
the system clock. Their worst paths, by how often: the issue decision through
a slot's stall terms into the z or newest FIFO's read enable and its "holds a
value" flag (six of thirteen: eight LUTs, 6.6 ns of routing); the post unit's
fit test (four: its pieces chained into one another, seven LUTs); the three
control pulses' synchronisers, by the register bridge, into the sample state
machine and the clock counter's enable (one, 6.7 ns of routing); the segment
fetch's end-of-program compare (one). So, each bit-exact:

- **Only a segment's first op can stall.** A bank is posted only after the
  segment into it has ended, and the post unit writes a command's z and newest
  values a clock apart, as fast as they are read or faster. So each slot keeps
  a register, `ok`, saying whether its first op may go, worked out from this
  clock's registers: a stall that lifts is seen a clock late; one that falls
  can only come from a POST queued this clock, which the register's logic
  includes (read from the other slot's registers; worked out twice, for the
  slot's own fields and for the queue head's, the load choosing last: in one
  piece yosys chained it ten LUTs deep). The issue decision is three registers
  and the slot select, and from it to the FIFO's flag is four LUTs rather than
  eight. The check that
  nothing is still landing in a clearing op's bank went: a POST of the bank
  always comes between its last accumulation and the clear, and holds the bank
  until everything has landed (`model/program.py`'s interpreter now checks
  programs for that).
- `nam/fifo.py`: a write lands the clock after it is offered, so the pointer
  logic sees registers only, and "holds a value" is chosen by the read enable
  between two registers worked out a clock ahead: the read enable reaches one
  LUT and a clock enable.
- The fit test's pieces (the bit groups all equal, the low bits all set) are
  registers of a stage of their own, p7b; the test comes a stage later.
- The control pulses are registered in the engine's domain, and the clock
  counter is cleared throughout IDLE rather than on `start`.
- The end-of-program compare runs against a register holding the last
  segment's number, beside the fetch decision rather than after it.

Clocks per A2-Full sample: 2,168 (a clock at the start of each z, newest and
waiting segment for the late view of a lifted stall, and one per post for the
stage). The peripheral: 4,128 LUT4, 807 CCU2C, 148 LUT-RAM cells and 4,369
flip-flops (242 more). Alone at the 140 MHz target: 142.6 MHz (141.4 before),
the sequencer gone from its worst paths, which are now the transfer machine's
ring-table read (7.0 ns).

Full builds: with `ok` in one piece, 109.8 MHz (its worst path that ten-LUT
chain); in two, 110.1, and that netlist's twelve seeds: 119.7, 119.4, 117.5,
115.9, 114.5, 111.6, 108.8, 107.8, 103.4, 103.2, 99.4 and 91.3 MHz. The six
worst and the main build all failed on one path: the post unit's write enable
for the newest FIFO, 4.6 to 4.8 ns of wire, the post unit placed by the block
RAMs at one edge of the chip and the FIFOs by the sequencer at the other. The
best six failed on five others, each a register or two short: the op's source,
decided from the slot's fields as it issues, choosing the FIFO head into the
activation pipeline (3 ns of wire); the transfer machine using the ring
table's read in the clock after setting its address; the post unit's
"last item" compare, a carry chain, into its command flags; the slot-load
decision fanning out to a hundred-odd clock enables; and the item strobe
reaching the H sums' reset across the chip. So, bit-exact and still 2,168
clocks a sample: the FIFOs' write enables are decoded a stage early into
registers; both FIFO heads are captured as the op issues and chosen a stage
later from the pipeline's own copy of the op, whose source is a register per
slot; the ring's entry is read as a transfer is taken; the last item is `pi`
against a register holding count less one; an empty slot takes the queue's
head every clock, so its registers' enables come from the "full" flag and the
load decision only pops the queue and sets it; the H sums clear the clock
after they are read. The quasi-static inputs the engine used as they came
(burst size, ring count, lateness) are registered too, so the engine-alone
harness no longer times its own shift register through them.

With the first of those (the FIFOs' write enables) the full build **passed
every clock on its one seed**: engine 120.8 MHz, system 61.9, DVI 96.9, DVI 5x
437.8, at 89% of LUTs; its worst engine path the op-source wire above, 8.28 of
8.33 ns. The rest of the fixes are in for the margin: alone at the 140 MHz
target that netlist gives 142.4 MHz (the bank lane select into the post unit
its worst path, 7.0 ns), and the peripheral is 4,095 LUT4, 805 CCU2C, 4,426
flip-flops. Its one-seed build routed the engine at 113.8 MHz, failing on the
advance loop's ring-count compare into its state machine, so "more rings to
visit" became a register kept beside the index. Its sweep showed two more
wire paths: the transfer request from the engine's state machine into the
PSRAM master's queue (five seeds of ten, 2 to 2.5 ns of wire), and the post
unit's item fields decoded into the history RAMs' write enables, 3.3 ns to
the RAM columns; the post unit's "done" into the sample state machine is the
same kind. (The build with the advance register in routed the engine at 114.0
MHz, failing on that request wire: 5.0 ns of it, from the queue's room through
the request's write flag to the master's queue across the chip.) So the
request, the done event and the per-RAM write enables are
registers at their source (the enables decoded at p7b); 2,169 clocks a
sample, 4,096 LUT4 and 4,475 flip-flops, 144.4 MHz alone (the frame index's
two carry chains at s1 its worst path, 6.9 ns). Its full build **passed every
clock on its one seed with room**: engine 135.7 MHz, system 62.7, DVI 93.8,
DVI 5x 409.2, at 86% of LUT4s (21,011) and 49% of flip-flops. The worst engine
path is no longer the engine's: it is inside the PSRAM master's request queue,
from its synchronised read pointer through the "full" check to its write
pointer (7.4 ns, 5.4 of them wire).

Twelve seeds of each netlist since, on the engine clock: the one with the
op-source and ring-read fixes (the 113.8 MHz build) 113.2 to 126.9 MHz, five
at or above 120, three passing every clock; with the advance register, 115.0
to 135.3, ten at or above 120, six passing everything; with the request,
done event and write enables registered, 108.3 and 112.5, then 121.6 to
137.3: ten of twelve at or above 120. Its seed 5 (engine 133.8 MHz, every
clock passing, the PSRAM PHY's data-valid route at 1.49 ns) is packed as
`build/nam-r5-r5/top.bit`. What misses now on the full chip is mostly not the
engine: the DVI serialiser clock (371.33 MHz) on four seeds of twelve and the
PSRAM PHY's data-valid route on three, placement noise in shared parts of a
chip 86% full. The two seeds where the engine missed, and nine of the twelve
worst engine paths, were one path: the post unit's p8 fields into the history
RAMs' write-enable registers, five LUTs and 3.7 ns of wire. The write's decode
had moved a stage early, but the enable register also took the clear
machine's write, through the port signals the two writers shared, whose
select was the p8 cone. So the clear's enables are registers decoded beside
its index, each writer has its own way to the port registers, chosen by the
`clearing` register (one LUT from registers), and the stream buffer's port is
done the same way (its enables decoded at p7b too). Bit-exact and still
2,169 clocks; 4,101 LUT4 and 4,484 flip-flops; 143.7 MHz alone, the worst
path the transfer machine's ring-table read through the pending queue's head
select (7.0 ns). Its full build passed every clock, the engine at 120.06 MHz
and 85% of LUT4s (20,740); that seed's worst path was the result, saturated
in the clock it is written, crossing the chip into the stream buffer's block
RAM (3.3 ns of wire of 8.3): the buffer sits by the PSRAM master, and its
port registers are the RAM's own. So that port goes through registers of the
engine's, like the history RAMs': the write lands a clock later, and the
earliest read of it, a flush, comes with the next sample. Bit-exact, 2,169
clocks; 4,056 LUT4 and 4,494 flip-flops; 140.5 MHz alone on the same
ring-table read (7.1 ns: `advancing` into the pending queue's "holds a
value", the read address chosen by it, the LUT-RAM and its output mux). Its
full build's seed routed the engine at 118.1 MHz, failing on the history
write enables' decode: four LUTs from the p7b registers, with 4.3 ns of wire
across the chip between the first and the second (the enable register placed
by its RAM). So every write enable (history, stream buffer, z and newest
FIFOs) is decoded from p7 into registers at p7b and copied once more at p8:
the hop that crosses the chip carries no logic. Bit-exact, 2,169 clocks;
4,058 LUT4 and 4,503 flip-flops; 144.5 MHz alone, the ring-table read again
(6.9 ns). Its full build's seed: 118.5 MHz, on the same decode. The placer
had pulled the new p7b registers to the RAM side, so the crossing landed
inside the three-LUT decode anyway (4.1 ns of wire between its first and
second LUT). A hop with no logic in it is no guarantee, then: the placer
puts the crossing where it likes, so the rule is that no stage on the way
out of the post unit is deeper than two LUTs. The saturation gave two LUTs a
bit before the clear mux, three to the data registers, so the limit is a
register beside the saturate flag (from the width and the sign at p7b) and
the result is one LUT a bit; and the history and stream-buffer writes'
conditions and the RAM select (a one-hot) are registers at p7 from p6's
fields, the per-RAM enables one LUT from them. Bit-exact, 2,169 clocks;
4,077 LUT4 and 4,512 flip-flops; 148.9 MHz alone, the ring-table read again
(6.7 ns). Its full build **passed every clock**: engine 125.1 MHz, system
61.7, DVI 88.1, DVI 5x 451.1, at 86% of LUT4s (20,969); the worst engine path
a slot's "last op" register, from the channel counter's compare through the
source select and the load mux (four LUTs, 2.9 ns of the wire between them).

The sweeps of the netlists between: with the write ports separated (before
the stream buffer's was registered), 111.0 to 133.6 MHz, six of twelve at or
above 120, four passing everything, the misses mostly that stream-buffer
data path; with the enables decoded at p7, 105.5 to 132.0, four of twelve
at or above 120, two passing everything; of the misses on the engine clock, a
third on the decode (fixed above), a third
on the segment queue's pop (the sample state machine's `advancing` and
`running` into the load decision and the queue's level, three LUTs and
7 ns of wire) and a third on the issue decision's loop through the slot
select (the active slot's fields into the POST queue's write enable, the
"last op" and back into `act`, four LUTs). Those two are the sequencer's own
floor, at 118 to 121 MHz on half the seeds once the longer wires are gone.
For the first, `running & ~advancing` is a register kept in step with the
sample state machine (set as the advance loop ends, cleared with `running`),
so the loads read one register of their own instead of two from across the
chip. Bit-exact, 2,169 clocks; 4,076 LUT4 and 4,513 flip-flops; alone,
134.4 MHz on a harness artefact (its input shift register into the stream
geometry; the engine's own worst paths were 6.7 to 6.9 ns the rounds before).
Its full build passed every clock: engine 120.7 MHz, system 64.5, DVI 92.3,
DVI 5x 382.0, at 86% of LUT4s (21,050); the worst engine path the post unit's
bank-lane select, the item index into the accumulator read mux (four LUTs,
6.8 ns of wire).

**Where it ended (2026-11-17).** Twelve seeds of that netlist: the engine
passes 120 MHz on **every seed**, 123.1 to 137.8 MHz, and six seeds pass every
check. The other six miss on parts the engine doesn't touch: the DVI
serialiser clock (327 to 363 MHz against 371.33) on four, the PSRAM PHY's
data-valid route (2.37 and 3.12 ns against 2.3) on two. The engine's worst
paths are now spread over a dozen places (the H sums' read mux, the slots'
`ok`, the transfer machine's ring read, the stream geometry's carry chains),
none common to more than three seeds, so there is no next path to fix. Seed
12 (engine 131.2 MHz, system 66.0, DVI 90.9, DVI 5x 434.2, data-valid 1.65 ns)
is packed into `build/nam-r5/top.bit` and the archive; the main build's
bitstream (one seed: engine 120.7 MHz) and archive are kept in
`build/nam-r5-r10/`. To ship a netlist after a change: `top.py build`, then
`tools/seeds.py --seeds 1-12`, `--ship N` for the best seed, and
`top.py build --skip-build` to repackage it.

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
| 4 | PSRAM streams, the peripheral and `top.py`; first build: resources, timing at 120 MHz, clocks per sample | done: fits at 86%, the engine meets 120 MHz on every seed (see [Fitting](#fitting)) |
| 5 | Firmware: `.nam` parser and loader, quantisation in Rust, USB browser, prewarm | done; runs on the instrument (see Status) |
| 6 | UI: level meters, input/output/gate/tone/mode/Lite-Full, round-screen design | done in code and host tests, not yet on the instrument; gate and tone controls go with their DSP in phase 7 |
| 7 | Noise gate and tone stack (in the program), DC blocker | noise gate on the CPU; tone stack and DC blocker in gateware (they don't work in the program); built and tested in simulation, the bitstream from `tools/ship.py` |
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
| Drive code | FairWave's (`disk.rs`, `usb.rs`), copied into this project with `.nam` profiles for its tables and patches | read-only, host-tested on FAT32 images; a copy keeps either project's change from breaking the other |
| Loading | prepare (parse, quantise, a checking build) while the old profile plays, then write | a file that can't run never silences the one playing; the build is quick, the parsing about a second |
| Prewarm | 250 ms on silence by zeroing the input gain word, then the output up over 80 ms | firmware only: no gateware change, so the swept bitstream stays |
| Default width | Full when a file has both | it fits the sample (2,169 clocks of 2,500); the choice is a control in phase 6 |
| Firmware stack | the parser, the builder, the drive's calls and the screens out of line (`#[inline(never)]`) | the stack is the CPU's 16 KB; inlined into the main loop they made an 8.7 KB frame with the file system under it |
| Browser list | each `.nam`'s first 32 KB read as a folder lists: not-A2 left out, titled by the metadata's name, grouped by its tone type | the user's: crowded folders were hard to search and file names cluttered; the start is one USB read and holds the config and metadata |
| Levels | changed live: a gain word and its shift's program word, ordered so a half-changed sample is quieter | a reload would silence the sound for a third of a second at every detent |
| Calibrated output | `output_level_dbu − 17.5` dB: the captured gear's level, Tiliqua's outputs taken as +17.5 dBu at full scale like its inputs | the plugin's meaning as I read it; not checked against the plugin's code |
| Gate and tone controls | with their DSP in phase 7, not before | a control that does nothing can't be judged by ear; the TONE screen holds them then |
| Settings kept | not yet: levels and width reset at power-up | the drive code only reads; settings in a file on the drive need writing to it |
| Noise gate | on the CPU, every 250 µs, scaling the output gain word | firmware only, so the swept bitstream stays; the plugin's algorithm at a 4 kHz control rate |
| Tone stack and DC blocker | gateware, 32-bit signals and 27-bit coefficients, one multiplier, two coefficient banks | in the program they were the largest error even flat; the user's choice of the three options |
| Builds | `tools/ship.py`: build, seeds as soon as there is a netlist, first passing seed shipped | the last rounds took a day of watching; the user asked for builds that run unattended |
| Themes | palette and bezel; the ground is every colour's intensity 0 | erases stay clean on any ground; switching needs no new drawing code |
| Drive that doesn't answer | powered off for 600 ms and tried again, three times | the user had to replug until it read; FairWave, with the same USB host and code, hasn't shown it, and the shipped seed's USB pin timing is like FairWave's |
| Parsing a profile | each JSON object walked once for all its keys, the weights parsed once and kept | a load took 6 to 7 s on the instrument; the file was walked about seven times and every weight parsed twice |

## Status

Nothing has run on hardware yet. Measured so far: the float model against the
core (-130 dB), the fixed-point ESRs above, the engine against the
interpreter in simulation (bit-exact; A2-Full 2,169 clocks a sample of the
2,500 at 120 MHz), the Rust program builder against the Python one (bit-exact,
Lite and Full), and the fitting work above (the full build fits at 86% of
LUTs; the engine meets 120 MHz on all twelve seeds swept, 123 to 138 MHz,
and half the seeds pass every clock and the PSRAM PHY check; the shipped
bitstream is seed 12). **Phase 6 ran on the instrument (the user, 2026-11-17):
the new features work; a load takes 6 to 7 seconds (timed; the 1 to 2 below
was a guess); 4,416 bytes of stack free; the drive sometimes didn't answer
until replugged.** Since then, not yet on the instrument: the drive is
retried by itself, parsing walks the file less (the System screen shows each
step of a load in ms: read, scan, parse, quantise, check, write), and the
noise gate (74 host tests in all). **Phase 5 ran on the instrument (the user, 2026-11-17):
profiles load and play, a load takes 1 to 2 seconds, no overruns, the engine
never late, 4,924 bytes of stack free.** Its logic is host-tested (`cargo
test` in `cpu/`, 56 tests): the drive listed and read from FAT32 images, the
example profile loaded off one and checked against the Python program table
for table, the gains from its metadata, other architectures refused with the
reason, a file's start judged as loading would judge the whole of it (on
every example model, and never the other way when cut short), the list's
grouping and titles. The browser's reading of each file's start and phase 6
(the screens, live levels, meters, Lite/Full) came after that check and
haven't run on the instrument yet; their logic is host-tested too (67 tests:
live levels against fresh builds, every reachable level's words fitting,
the controls and meters, the layouts). The System screen shows how long the
last listing and load took and how many files a listing left out, and the
stack left (worked out at about 10.6 KB deep at most, the load's check
build, as before). The firmware is 230 KB of the 320 KB slot, packed with
the seed-12 bitstream in `build/nam-r5/nam-9cc3ca1--r5.tar.gz`.

## Layout

    model/      a2.py (loader, float reference), fixed.py (bit-exact datapath),
                program.py (program, tables and images for the engine)
    nam/        engine.py (datapath, post unit, sequencer), streams.py (PSRAM master),
                fifo.py (the z and newest FIFOs), bram.py (block RAMs with output
                registers), peripheral.py, trim.py (SoC parts left out to fit),
                project-local overrides vendored from FairWave (video, blit, fill,
                psram, cpu)
    cpu/        Rust, host-tested: .nam scanning and quantisation, the program builder
                (checked against golden/, written by tools/dump_program.py), the loader and
                live levels, the drive (disk.rs) and browser, the Amp screen's settings and
                meters (controls.rs), the screens' layout, geometry and navigation
    fw/         firmware (Rust): engine driver, USB drive, the screens (ui.rs), display,
                input, and main.rs (browsing, loading, prewarm)
    pac/        the register crate, generated by the build
    tests/      the program against the fixed-point model, the engine against the program
    tools/      ship.py (build, seeds and archive, unattended), seeds.py (the seed checks),
                dump_program.py (golden files for cpu/), tone_tables.py (cpu/'s tone
                coefficients), tonestack_study.py (why not in the program), synth_engine.py
                (the peripheral's cost, alone). The float model's check against the compiled
                core was a one-off outside the repo (model/a2.py says how).
