# Eventide H3000 / H3500 firmware architecture

What the ROM dumps in this folder contain and how the pieces fit together, as recovered
from the code. Statements marked *(tentative)* are inferences that the code supports but does
not prove; everything else was read directly from the disassembly.

## 1. The ROM sets

| Files | Firmware | Notes |
|---|---|---|
| `H3000_153_BigROM.BIN` (64 KB) + `H3000_153_SmallROM.BIN` (32 KB) | **H3000 Ultra-Harmonizer, OS rev 1.53** ("COPYRIGHT 1987 EVENTIDE INC") | 11 algorithms (Diatonic/Layered/Dual/Stereo/Reverse Shift, Swept Combs, Swept Reverb, Reverb Factory, Ultra-Tap, Long/Dual Digiplex) |
| `H3000-Upgrade_ROM1.BIN` … `ROM5.BIN` | **H3500 Dynamic Ultra-Harmonizer** ("* THE H3500 DYNAMIC ULTRA-HARMONIZER *") | adds Patch Factory, Stutter, Dense Room, Vocoder, Multi-Shift, Band Delay, String Modeller, Phaser, Studio/Stereo Sampler and the two "mod factory" modules |

ROM2 and ROM5 contain the same 128 KB twice (each is a 128 KB image dumped as 256 KB).
ROM2 and ROM4 both carry the core algorithm banks (Reverb Factory, modules 65/69, Ultra-Tap); the
two copies of module `69 02` differ slightly. `tools/split_roms.py` deduplicates identical banks.

## 2. Processors

* **Host CPU: Motorola 6809** (not a 68000). It runs the kernel and all user interface, MIDI and
  parameter code.
* **3 × TI TMS32010 DSPs** run the audio microcode. The 6809 writes each DSP's program memory
  through the bank window (section 5).

## 3. 6809 memory map

| Range | Contents |
|---|---|
| `$0000-$3FFF` | **Bank window**: one 16 KB ROM bank selected by the bank latch, or DSP program RAM when the latch value has bit 7 set |
| `$4000-$5FFF` | Unidentified; touched only at `$40FC`, `$42FF` (module 65) and `$5000` (reset). Possibly extra RAM *(tentative)* |
| `$6000-$7FFF` | RAM. Stack `S=$6500`, user stack `U=$6580`; IRQ/SWI trampolines copied to `$6600`, `$6700`, `$6780`, `$67C0`; algorithm parameter block at `$7000-$71FF`; LCD/edit state in `$60xx-$61xx` |
| `$8000-$83FF` | I/O (the kernel EPROM's first 1 KB is hidden behind it) |
| `$8400-$FFFF` | Kernel ROM: the first 32 KB of the kernel EPROM |

Interrupt vectors at `$FFF0`: RESET `$8400`, NMI `$8823`, IRQ `$85C2`, FIRQ `$8878`, and SWI/SWI2/SWI3
through RAM trampolines (v1.53 addresses). `DP` stays 0; the kernel never reloads it.

### I/O registers (v1.53 kernel)

| Address | Use |
|---|---|
| `$8052` | **Bank latch** (write). The value is mirrored in RAM at `$600B`. `$80+n` selects DSP *n* program RAM |
| `$8053`, `$8050` | read-only status *(tentative: bank/ROM presence)* |
| `$8054`, `$8055` | written at reset; `$6600` IRQ trampoline is `STA $8055 / RTI` (interrupt acknowledge, *tentative*) |
| `$8056` / `$8057` | write a channel to `$8057`, read a value from `$8056`: front panel / ADC scanner *(tentative)* |
| `$8060`, `$8062` | LCD controller (2 × 40 characters; cursor position `$80 + addr`, line 2 at `$40`) |
| `$8020`, `$80A1-$80A7` | DSP / audio control latches; `$80A3=$FF` before a microcode load (`API_FD7E`), `$80A2` during the copy, `$80A7` written by `Io80A7_Clear/Set` and by the NMI handler |
| `$8300` / `$8301` | **MC6850 ACIA = MIDI** (control `$03` master reset, then `$15` = ÷16, 8N1; status bit 1 = TDRE) |

## 4. The ROM file system

Every 16 KB bank holds a chain of records. `tools/romfs.py` walks them.

```
+0  key     2 bytes  (module id, sub id); AA55 = bank header, FFFF = end of chain
+2  length  2 bytes  total record length including this 8-byte header
+4  extra   4 bytes  F9 00 00 00 on the bank header, FA 00 00 00 on the end marker
+8  payload
```

The kernel finds records by key through `RomFindRecord` (API `$FC02`), which walks every bank's
chain via `RomFirstRecord`/`RomNextRecord` (`$FDA0`/`$FDA2`). `RomStreamReadByte` (`$FC04`) then
reads the payload, switching banks when a record crosses a 16 KB boundary.

| Key | Meaning |
|---|---|
| `mm00` | Algorithm *mm*'s default program: `mm 01`, 16-character name, parameter values |
| `mm01` | Algorithm *mm*'s 6809 entry code (loads the DSP programs, defines parameters) |
| `mm02`-`mm05` | Further 6809 code for module *mm* (large shared engines, e.g. `6502`, `6902`, `7801-7803`) |
| `mm06` | Tables (e.g. `7806`) |
| `pp10`, `pp11`, `pp12` | **TMS32010 program *pp* for DSP 1, 2, 3** |
| `C8xx`-`CBxx` | Factory presets (same layout as `mm00`: algorithm key, name, values) |
| `96xx`-`C7xx` (H3500) | More named factory programs, same layout |

Code records are position independent. Each starts with `JSR [$FC60]` plus an inline offset
(`ModuleSetBase`), which stores the record's base address in `$600D`. Code then builds absolute
pointers with `LDD #offset / ADDD $600D` or `JSR [$FC62]` (`ModuleStorePtr`). The H3500 kernel
also uses self-relative words (`TFR X,D / ADDD ,X++`). In practice code always runs in the
`$0000` window, so module offsets equal window addresses.

## 5. DSP programs (TMS32010)

A microcode record payload is one word, `$0800` (the load address), followed by program words.
`DspLoadProgram` (API `$FD30`) is called with `B` = DSP number (1-3) and `X` = record key. It:

1. holds the DSPs (`$80A3 = $FF`),
2. selects bank `$80 | B`, which maps that DSP's program RAM into `$0000-$3FFF`,
3. finds the record, takes `(word & $0FFF) * 2` = `$1000` as the window offset (word address `$800`), and
4. copies the program words across, following the record into the next ROM bank if needed.

An algorithm's `mm01` entry code loads three programs, for example
`DspLoadProgram(1, $1410)`, `(2, $1411)`, `(3, $1412)`, and shows *"UH OH.... TMS320 LOADING ERROR"*
if any load fails. DSP program ids (`pp`) are separate from algorithm ids (`mm`), and programs are
shared between algorithms.

Each program starts by clearing data RAM (`LARK AR0,$8F / SACH * / BANZ`), sets up constants, then
loops on `BIOZ` (sample clock), exchanging data through the eight I/O ports with `IN`/`OUT`.

Port usage across all 73 programs (references in the decompiled C):

| Port | Refs | Observed use |
|---|---|---|
| PA4 | 1310 | written once, then read several times in a row: data port of external delay memory *(tentative)* |
| PA7 | 1215 | written just before PA4 accesses: delay-memory address/offset *(tentative)* |
| PA1 | 406 | reads into coefficient words (e.g. Phaser all-pass coefficient): parameters from the 6809 *(tentative)* |
| PA0, PA3, PA5, PA6 | 150-350 | audio and inter-DSP inputs |
| PA2 | 181 | audio output (e.g. end of the Phaser all-pass chain) |

The TMS32010 has only 144 words of data RAM, so delay lines must live in external memory, which
fits the PA4/PA7 pattern.

The image counts:

| Set | DSP programs | Disassembly | Decompiled C | Ghidra folder |
|---|---|---|---|---|
| H3000 v1.53 | 21 | `dsp/asm/h3000_v153/` | `export/dsp_h3000_v153/` | `/dsp_h3000_v153` |
| H3500 | 52 | `dsp/asm/h3500/` | `export/dsp_h3500/` | `/dsp_h3500` |

## 6. Kernel API

Modules call the kernel only through two pointer tables: `JSR [$FCxx]` (256 slots at `$FC00`)
and `JSR [$FExx]` (50 slots in v1.53, 64 in the H3500, at `$FE00`). Slot numbers are stable within
one kernel, but **some slots changed meaning between v1.53 and the H3500** (for example `$FC0A`,
`$FDBC`, `$FDCC`, `$FE22`). Named slots are listed in `ghidra/api_names.txt`.

### Inline arguments

Many helpers take their arguments from the bytes that follow the call instruction and return
past them. In the listings these bytes are typed as data, the call carries a fall-through
override, and an EOL comment `inline[API_xxxx]: …` decodes them. The formats are in
`ghidra/rules_v153.txt` and `ghidra/rules_h3500.txt`; the main ones:

| Slot | Name | Inline data |
|---|---|---|
| `$FC38` | LcdPrintInline | text with control codes: 0 end, 1, 2+byte (cursor), 3+word (string ptr), 4+2 bytes, 5+byte (spaces), 6, 7 |
| `$FC8A` | SoftKeyDefine | handler (absolute in v1.53, self-relative in H3500) + 10-character label |
| `$FC16` | SetupParamEditPage | 24-byte record: 8 bytes, limits, display and adjust callbacks |
| `$FD84` | DefineParameter | index, flags, 8-character name, byte, 2 pointers (15 bytes) |
| `$FD14` | JumpTableDispatch | code-pointer table indexed by D; never returns to the call site |
| `$FD16` | SwitchInline | (value, target)* list; an entry with target `$FFFF` ends it |
| `$FD18`/`$FD1A` | StoreWordsInline / StoreBytesInline | ([addr] = value)* until `$FFFF` |
| `$FE04`-`$FE08` | LoadParams* | (parameter, `$70xx` offset) byte pairs, 0-terminated |
| `$FE20` | InterpTableLookup | byte *n*, then 2^*n*+1 words |
| `$FE00` | SetModuleHandlers | 6 module-relative handler pointers |

### Calling convention

Arguments travel in A, B, D, X, Y and U (and on the U stack); results come back in B, D or X.
**Status comes back in the Z flag** (`JSR [$FD30] / LBNE error`). The Ghidra programs use a
custom `__h3000` convention in which CC is clobbered by calls, so the decompiler shows these
tests as `(extraout_CC >> 2 & 1)`, meaning Z set. `BankPushSelect`/`BankPop` (`$FC9C`/`$FC9E`)
push and pop the previous bank number on the caller's stack.

## 7. Open questions

* `$4000-$5FFF`: what is mapped there (sample RAM for the sampler algorithms?).
* The DSP-side I/O ports: confirm the delay-memory reading of PA4/PA7, and which ports are
  ADC/DAC versus inter-DSP links.
* What `SST` to page-1 address `$FD` (outside the 144-word RAM) does on real hardware.
* How DSP address `$000` (reset) reaches the code at `$800` (mirrored 2 K-word RAM, or a stub
  written by the 6809).
* Names for most API slots and kernel functions: only verified behaviour is named.
