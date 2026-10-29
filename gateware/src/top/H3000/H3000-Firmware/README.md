# Eventide H3000 / H3500 firmware: reverse-engineered

The `.BIN` files in this folder are EPROM dumps of two firmware sets:

* **H3000 Ultra-Harmonizer OS 1.53**: `H3000_153_BigROM.BIN`, `H3000_153_SmallROM.BIN`
* **H3500 Dynamic Ultra-Harmonizer**: `H3000-Upgrade_ROM1.BIN` … `ROM5.BIN`

The host processor is a **Motorola 6809** (kernel, UI, MIDI, parameter handling). Three
**TMS32010** DSPs run the audio microcode, which the 6809 loads from the same ROMs.
[docs/ARCHITECTURE.md](docs/ARCHITECTURE.md) explains the memory map, bank switching, the ROM
record format, the kernel API and the DSP loading.

## What to read

| Path | Contents |
|---|---|
| [export/H3000_v153/](export/H3000_v153/) | Decompiled C (`*.c`) and annotated assembly (`*.asm`) for the v1.53 kernel and each code bank: 1741 functions |
| [export/H3500/](export/H3500/) | The same for the H3500: 6423 functions |
| [export/dsp_h3000_v153/](export/dsp_h3000_v153/), [export/dsp_h3500/](export/dsp_h3500/) | Decompiled C of every DSP program (one `.c` per program, e.g. `7710_PHASER_dsp1.c`) |
| [dsp/asm/](dsp/asm/) | TMS32010 disassembly of every DSP program (21 for v1.53, 52 for the H3500), with an `INDEX.md` per set |
| [dsp/romfs_listing.txt](dsp/romfs_listing.txt) | Every record in every ROM bank: algorithms, code, DSP programs, presets |
| [docs/ARCHITECTURE.md](docs/ARCHITECTURE.md) | How the firmware is put together |

In the exports, `KERNEL.*` is the fixed ROM at `$8400-$FFFF`. Each `M<id>_<rom>_<offset>.*` file is
one 16 KB ROM bank as seen through the `$0000-$3FFF` window. Calls into the kernel go through the
API tables, so `JSR [$FC38]` appears as `LcdPrintInline()`; unnamed slots appear as `API_FCxx`.
Inline arguments after calls are decoded in comments such as `inline[API_FC38]: "Welcome to …"`.

## Ghidra project

`H3000.gpr` is a Ghidra 12.1.4 project with two 6809 programs:

* `/H3000_v153`: kernel plus 4 bank overlays
* `/H3500`: kernel plus 38 bank overlays (preset, microcode and table banks are marked non-executable)

Each ROM bank is an **overlay block** at `$0000` named `M<first-record-id>_<rom>_<offset>`, so
cross-bank calls into the kernel resolve. Records are labelled (`MODULE_6B_01_entry`,
`PRESET_026_BIG_SNARE_hdr`, `DSPPROG_14_DSP1`, …), and the record headers use the `RomRecordHeader`
structure.

### TMS32010 processor module

Ghidra has no TMS32010 support, so [ghidra/TMS320C1x/](ghidra/TMS320C1x/) adds a SLEIGH
processor module (`TMS32010:BE:16:default`), installed as a user extension in
`%APPDATA%\ghidra\ghidra_12.1.4_PUBLIC\Extensions\TMS320C1x`. Every DSP program is imported as
its own program in the project folders `/dsp_h3000_v153` and `/dsp_h3500` (named
`<key>_<algorithm>_dsp<n>`, loaded at `$800`, entry function `dsp_main`).

DP and ARP are tracked as context registers, so direct operands show absolute data addresses
and indirect operands resolve to AR0/AR1. I/O ports decompile as `PA0`-`PA7` (volatile) and the
BIO pin as `bio_pin()`. Overflow saturation (SOVM) is not modelled in p-code. The standalone
disassembler [tools/tms32010_dis.py](tools/tms32010_dis.py) uses the same decoding;
[tools/check_dsp_sleigh.py](tools/check_dsp_sleigh.py) compares the two. On all 73 programs
(27,112 instructions) they agree completely. Both were written from the same reading of the TMS32010
encoding, so this checks consistency, not hardware behaviour.

## Rebuilding everything

Python 3 tools (no dependencies):

```
python tools/split_roms.py        # kernels + unique 16 KB banks -> modules/, manifest.json
python tools/romfs.py --extract dsp/images > dsp/romfs_listing.txt
python tools/dsp_listings.py      # dsp/asm/<set>/*.asm + INDEX.md
```

The Ghidra scripts are in `ghidra/scripts/`. Copy them to `~/ghidra_scripts` first (Ghidra only
loads scripts from its script directories). For each firmware set:

1. Import `modules/<set>/kernel.bin` as a raw binary, language `6809:BE:16:default`, no analysis.
2. `H3000Setup <modules/set dir> <bank files...>`: memory map, overlays, vectors, API tables.
3. `H3000Disasm <ghidra/rules_*.txt> clear scan`: controlled disassembly that understands
   inline-argument helpers (rule formats are documented in the script header).
4. `H3000RomFs`: annotates record chains and creates the code-record entry points.
5. Run Ghidra auto-analysis, then `H3000Disasm <rules> scan` again to repair anything it broke.
6. `H3000Names ghidra/api_names.txt <v153|h3500>`, then `H3000Proto` (the `__h3000` calling convention).
7. `H3000Export <output dir>`.

For the DSP programs (after `tools/dsp_listings.py` has written `dsp/images/<set>/names.txt`):

1. `H3000ImportDsp <dsp/images/<set>> dsp_<set>`: one TMS32010 program per image.
2. `H3000ExportDsp /dsp_<set> <output dir>`: decompiled C.
3. Optional check: `H3000DspDump /dsp_<set> <dir>`, then
   `python tools/check_dsp_sleigh.py <dir> dsp/images/<set>`.

`H3000Coverage [gaps <block>]` and `H3000FindInline [rules]` are diagnostics for finding
undecoded regions and new inline-argument helpers.

The scripts need `GHIDRA_MCP_ALLOW_SCRIPTS=1` only when they are run through GhidraMCP; from the
Ghidra Script Manager they work as normal scripts.

## Status and limits

* Of each kernel's non-blank bytes, 92% (v1.53) and 88% (H3500) are typed as code or data,
  and every code bank is largely decoded. What remains is mostly untyped strings and tables,
  plus some code reached only through computed jumps.
* Only API slots whose behaviour was checked are named (`ghidra/api_names.txt`). Most internal
  functions keep their `FUN_` names.
* The decompiler prints 6809 status returns as `(extraout_CC >> 2 & 1)`, which means "Z flag set".
* On the DSP side nothing is named yet: data RAM words appear as `DAT_data_xxxx`. The
  decompiled C shows the signal flow well; for example `7710_PHASER_dsp1.c` is a chain of six
  first-order all-pass stages.
