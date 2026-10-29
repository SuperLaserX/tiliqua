# bfr engine — specification, version 0

This is the contract between the reference model (`model/`) and the
gateware, which doesn't exist yet. The model is the golden reference:
`model/fp.py` defines the arithmetic on bit patterns, and `model/engine.py`
runs programs. Anything not stated here is open. Version 0 will change as
the gateware is designed.

## Machine state

| State | Size | Notes |
|-------|------|-------|
| Accumulators `a0`..`a7` | 57-bit fixed point | Keep their values between samples |
| Registers | 128 x 32 bits | f32, or fixed point in modulation registers; see [Register map](#register-map) |
| Coefficient bank `C0`..`C255` | 256 x f32 | Written by the CPU |
| Tap table `T0`..`T255` | 256 entries | Offsets of parameter-driven taps are rewritten by the CPU |
| Delay memory, PSRAM space | power-of-two ring of f32 words | Each space has its own pointer |
| Delay memory, block-RAM space | power-of-two ring of f32 words | |
| LFOs 0..3 | 32-bit phase + 32-bit increment each | |
| Noise generator | 32-bit xorshift state | Seed `0x1234567` |
| Fade units 0..1 | position p in 0..2^24, target 0 or 2^24, rate | See [Crossfades](#crossfades) |
| Program | up to (clock / fs - 53) instructions, 41 bits each | |

## Number formats

### f32 values

f32 values are IEEE-754 binary32 bit patterns, read with two exceptions:

- Exponent 0 (zero and denormals) reads as zero.
- Exponent 255 reads as the ordinary number ±1.m × 2^128. There is no Inf
  or NaN.

The engine itself only ever writes +0 or normal numbers.

### Accumulator

Signed fixed point with 48 fraction bits, saturating symmetrically at
±(2^56 - 1) LSBs, which is just under ±256.

### Product

- `A × B` is formed exactly: the 24 x 24-bit mantissas are multiplied and
  the exponents added.
- The result is truncated toward zero to a multiple of 2^-48, then
  saturated.
- If either operand is zero, the product is zero.

### Accumulate

`MAC` adds the product to the accumulator and saturates.

### Writeback

Converting an accumulator to f32 rounds the magnitude to 24 significant
bits, ties away from zero. Zero becomes +0.

### Scaled coefficient

The B modes `C × FADE` produce `scale(C, W)`:

- the exact product of the coefficient and the weight is rounded to 24
  significant bits, ties away from zero;
- results below 2^-126 are zero;
- results above the f32 range saturate. A weight of at most 1 can't cause
  this.

### CODEC conversion

- **In:** a signed W-bit sample x becomes x / 2^(W-1). This is exact.
- **Out:** v × 2^(W-1) is rounded with ties away from zero, then saturated
  to W bits.
- W is a build parameter (24 by default; Tiliqua's standard is 16).

## Register map

| Index | Name | Access | Contents |
|-------|------|--------|----------|
| 0–63 | R0–R63 | read/write | State registers, modulation registers, temporaries |
| 64–67 | IN0–IN3 | read | Audio inputs, written at the start of each sample |
| 68–71 | OUT0–OUT3 | read/write | Audio outputs: fixed point (value × 2^24, written by fixed-point stores), read at the end of each sample |
| 72 + 4k + p | LFOk sin/cos/tri/saw (p = 0..3) | read | Written at the start of each sample |
| 88 | NOISE | read | Written at the start of each sample |
| 89 | ONE | read | 1.0 |
| 90 + 2g | FADEg.a | read | Weight of side A: (2^24 - p) / 2^24 |
| 91 + 2g | FADEg.b | read | Weight of side B: p / 2^24 |

Stores to read-only registers are ignored.

## Instruction

Fields, least significant bit first:

| Bits | Field | Meaning |
|------|-------|---------|
| 2:0 | `op` | 0 NOP, 1 MUL, 2 MAC; 3–7 reserved |
| 5:3 | `d` | Destination accumulator |
| 7:6 | `asel` | Operand A: 0 delay memory (tap `aidx`), 1 register `aidx`, 2 accumulator `aidx` as f32 |
| 15:8 | `aidx` | |
| 18:16 | `bsel` | Operand B: 0 coefficient `bidx`, 1 register `bidx`, 2 interpolation 1-frac, 3 interpolation frac, 4 + 2g + s `scale(C[bidx], FADEg.a/b)` (s = 0/1) |
| 26:19 | `bidx` | |
| 27 | `st` | Store enable |
| 30:28 | `sacc` | Accumulator to store |
| 32:31 | `ssel` | 0 delay memory (write tap `sidx`), 1 register `sidx` (f32), 2 register `sidx` fixed point |
| 40:33 | `sidx` | |

An instruction executes in this order:

1. Read operands A and B, and the store value: accumulator `sacc` as f32,
   or for a fixed-point store `floor(a[sacc] / 2^24)` saturated to 32 bits
   signed (a modulation offset, see below, or an output).
2. Do the store.
3. For MUL: `a[d] = A × B`. For MAC: `a[d] = sat(a[d] + A × B)`.

So a store writes the accumulator's value from before this instruction, and
reads in the same instruction see registers before the store. With `d` equal
to `sacc` and A equal to accumulator `sacc`, one instruction stores a value
and scales it (like the FV-1's WRA).

Rules, checked by `engine.check`:

- If A is an accumulator, a store in the same instruction must store that
  same accumulator (there is one float converter).
- B = interpolation requires A to be a modulated tap, and the reverse. Its
  `bidx` names the tap's modulation register (the hardware reads it early,
  in stage 1).
- Each write tap is stored exactly once per sample.
- Taps are never read and written through the same entry.

## Taps and delay memory

Each memory space is a ring of 2^k words with a pointer `ptr` that advances
by one word per sample. The tap kinds:

| Kind | Address |
|------|---------|
| Read | `(ptr + offset) & mask` |
| Write | `(ptr + offset) & mask` |
| Modulated | Two reads: `(ptr + offset - n) & mask` (B = 1 - frac) and `(ptr + offset - n - 1) & mask` (B = frac) |

For a modulated tap, `n` and `frac` come from its register `mreg`. The
register holds a fixed-point delay offset, samples × 2^16 as a 32-bit signed
integer, written by a fixed-point store:

- the value is clamped to ±depth × 2^16
- `n` is the whole part (floor) and `frac` the 16 fraction bits; B is frac
  / 65536 or (65536 - frac) / 65536, both exact

The compiler computes the offset scaled by 1/256 in the accumulator (depth ×
1/256 × modulation signal). A fixed-point store's floor(acc / 2^24) then
gives samples × 2^16, and excursions up to 2^15 samples fit the
accumulator's ±256 range.

The compiler places a delay line of up to L samples at `base`: its write tap
has offset `base`, and a tap d samples old has offset `base - d`.

## Crossfades

A tap whose delay depends on a crossfaded parameter (`fade_ms` > 0; at most
two such parameters, one fade unit each) is compiled as two tap entries,
sides A and B. Each read of it becomes two products:

`tapA × scale(C, FADEg.a) + tapB × scale(C, FADEg.b)`

Coefficients that depend on the crossfaded parameter, in those products, also
get an A and a B entry. So the old and new configuration are blended as a
whole.

A fade unit only moves its position. Each sample, after the program,
p moves toward its target by `rate` (clamped at the target). The weights sum
to exactly 1 (a linear crossfade), so feedback loops never gain energy
during a fade. Idle weights are exactly 1 and 0, so the silent side's reads
don't matter and its streams can stop.

What the CPU does (modelled by `Engine.set_param` and
`Engine._service_fades`, which runs every 32 samples):

1. When a crossfaded parameter changes and its unit is idle, write the new
   values into the silent side: its tap offsets, and the coefficients that
   depend on the parameter. Start the silent side's PSRAM streams.
2. Wait the group's warm-up (`Program.streams["warmup"]`, in samples; 0 if
   the group has no PSRAM taps), so the streams' buffers hold the new taps'
   words (see [PSRAM stream engine](#psram-stream-engine)). At the first
   check after that, set the target to that side, and write the coefficients
   that depend on the parameter outside the crossfaded products.
3. A change that arrives during the warm-up or a fade is held. When the fade
   ends, the latest value starts the next fade, toward the other side.
4. A change back to the value already active starts no fade.
5. A side whose weight is 0 and that nothing is fading to may stop its PSRAM
   streams (`Engine.stream_enabled`). This saves bus time; its reads are
   multiplied by 0.

`rate` = round(2^24 / fade samples).

## Each sample

1. IN0–3 are loaded from the CODEC. Each LFO's outputs are computed from its
   current phase, NOISE from the current noise state, and the fade weights
   from each fade position.
2. The instructions run in order.
3. OUT0–3 go to the CODEC: a `W`-bit sample is `(x + 2^(24−W)) >> (25−W)`
   (x the register as a signed integer, so rounded half up), saturated to
   `W` bits.
4. `ptr` advances, each LFO phase advances by its increment (mod 2^32), the
   noise generator steps, and each fade position moves toward its target.

**LFO outputs** of a 32-bit phase ph:

- **sin(ph):** `i = ph >> 22`, `f = (ph >> 6) & 0xFFFF`,
  `v = T[i] + (((T[i+1] - T[i]) * f) >> 16)`, value `v / 2^23`. T is a
  1024-entry sine table (plus wrap) built by symmetry from the quarter-wave
  table `round(sin(πi/512) * (2^23 - 1))` for i = 0..256.
- **cos(ph):** sin(ph + 2^30).
- **tri:** `(2^23 - (|u - 2^31| >> 7)) / 2^23` with `u = (ph + 2^30) mod
  2^32`, in phase with sin.
- **saw:** `ph >> 8`, read as a signed 24-bit value, / 2^23.

**Noise:** the top 24 bits of the state, read as a signed value, / 2^23. The
step is xorshift32 (13, 17, 5).

## Pipeline (gateware `bfr/core.py`)

The compiler schedules so that instructions in program order give the same
result as the pipelined hardware. The pipeline implies these minimum
distances between a producer and a consumer instruction:

| Producer -> consumer | Distance | Why |
|----------------------|----------|-----|
| Write of `a[k]` -> read of `a[k]` as operand A, or a store of `a[k]` | 8 | written in stage 10, read in stage 3 |
| Write of `a[k]` -> MAC into `a[k]` | 1 | both in stage 10 |
| Store to register r -> read of r | 5 | stored in stage 6, read in stage 1 (transparent) |
| Store to a modulation register -> interpolated read through it | 5 | read in stage 1 (via `bidx`) |

A frame takes the program length plus 53 clocks:

| Phase | Clocks |
|-------|--------|
| Prologue (26 special registers) | 33 |
| Drain | 11 |
| Epilogue (outputs, advance) | 8 |
| Idle, to accept the next start | 1 |

These live in `model/isa.py`. The coefficient × fade scaling runs in
parallel with operand preparation, so it adds no latency.

## PSRAM stream engine (gateware `bfr/stream.py`)

The core never waits for the PSRAM. Each PSRAM tap is a stream with a region
in one of two block-RAM buffers. The region is a power of two at an aligned
base, so the word for PSRAM address a is at `buf | (a & bmask)`. The tap
entries carry `buf` and `bmask`, and the core addresses the buffers itself,
with the block-RAM space's timing.

| Tap | Region | Contents |
|-----|--------|----------|
| Read | >= 2N words | the word read this sample, the next burst, and the burst being fetched |
| Modulated, depth D | >= 2D + 1 + 2N words | the window `offset - D - 1 .. offset + D` and two bursts |
| Write | 2N words | the burst being written and the burst being flushed |

N is the burst length (8 words by default; `Program.streams["burst"]`).
Every N samples each stream moves one aligned burst. Once per sample f, a
scanner visits every enabled stream, with lead L = offset (plus depth for a
modulated tap):

- a read stream with `(f + L) % N == 0` fetches the burst starting at
  `f + L + N`. It is first read N samples later;
- a write stream with `(f + L) % N == 0` flushes the burst ending at
  `f + L - 1`, written during the last N samples. Its slots are written again
  N samples later.

So every request has N samples to complete. A later one sets the sticky
`late` flag; `max_lag` keeps the worst time from request to completion. The
requests are served in order, one burst at a time. The flush of a word is
queued at most 2N samples after it is written, and its fetch N samples
before it is read. So a tap at least 2N + 1 samples behind its line's write
(`offset + depth`, against the write's offset) sees the written data
(`engine.check`). The compiler keeps PSRAM lines at least 64 samples long:
a line whose taps can be shorter is in block RAM, as is any line declared
with `block_ram=True` (`Algorithm.delay`), whatever its length.

After a stream's offset changes, or it is enabled, its region holds the
right words once the scanner has fetched the window and two more bursts.
That is the warm-up, `window + 2N` samples (window = 2D + 1, or 0). Until
then it reads stale words: audio from before, never noise. A tap that jumps
without a crossfade reads them for that long.

`clear` zeroes the ring in the PSRAM (in 64-word bursts) and both buffers.
At power-up the PSRAM holds noise, and the model's memory starts at zero.

The stream table has one entry per stream:

| Field | Bits | |
|-------|------|-|
| `lead` | 22 | offset, plus depth for a modulated tap |
| `buf`, `bmask` | 13 + 13 | the tap's region |
| `write` | 1 | write stream |
| `en` | 1 | stream runs |

The engine's bus is a wishbone master with linear incrementing bursts on the
wide side of the PSRAM arbiter. The ring is at `ring_base`; the SoC puts it
in the upper 16 MB.

## CPU interface (gateware `bfr/peripheral.py`)

The engine is a CSR peripheral. Configuration: `config` (instruction count,
stream count), `psram_mask`, `ebr_mask`, `ring_base` (word address of the
PSRAM ring), `lfo_inc0..3`, `fade_rate0..1`, `fade_target0..1`. `control`
holds run and mute: while not running, the outputs follow the inputs.

Each CODEC sample starts a frame if the core is idle. If it isn't, the
sample is an overrun and is counted. The frame's outputs go back to the
CODEC.

**Table writes** go through one staging register. The CPU writes `wdata0..2`
(the entry, least significant word first), then `wcmd` (table and address):

| Table | Entry |
|-------|-------|
| 0 program | 41-bit instruction |
| 1 coefficients | f32 |
| 2 read taps | 68 bits: offset, space, mod, depth, mreg, buf, bmask |
| 3 write taps | 36 bits: offset, space, buf |
| 4 registers | 32 bits |
| 5 stream table | 50 bits: lead, buf, bmask, write, en |
| 6 LFO phases | 32 bits (address = LFO) |

The write is applied between frames, while the core is idle. So a value
changes at a sample boundary, and the register file and LFO phases can be
written at all. `status.wpend` is set from the `wcmd` write until the write
is applied; the CPU waits for it to clear before the next `wcmd`.

`clear` zeroes the PSRAM ring and the stream buffers. `status.clearing` is
set from the write until the clear is done; the CPU must not run frames
before that.

**Statistics:** `frames` (samples processed), `frame_clocks` (last and most),
`overruns`, `bursts`, `stream_stats.max_lag`, `status.late`. `clear_max`
resets the most frame clocks.

The firmware's side is the `bfr-cpu` crate:

- `control` ports `Engine.set_param` / `_service_fades` / `_recompute` /
  `stream_enabled`. It works through a `Hw` trait, writes only changed
  values, and sets everything with no fades at boot (`init`).
- `math` provides the f64 functions coefficient expressions use.
- `encode` lays out the entries above.

The tables, parameter grids and expressions come from the compiled program
(`model/rustgen.py`). How the CPU computes coefficients is outside the
bit-exact contract; `bfr/test_firmware.py` measures it against the model.
