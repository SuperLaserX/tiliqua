# Copyright (c) 2026
#
# SPDX-License-Identifier: CERN-OHL-S-2.0

"""
bfr: an experimental reverb on its own DSP engine.

The DSP is a microcoded sequencer in the FPGA: once per sample it runs a
straight-line program of multiply-accumulates in a hybrid floating-point
format (f32 storage, 57-bit accumulators), with LFOs, crossfades for delay
changes, and delay lines in the PSRAM, streamed through block RAM. The softcore loads nothing at audio rate: it turns the menu
values into coefficients, tap positions and LFO rates, and runs the
crossfades when a delay length changes.

Every reverb type (`--algorithms`) is compiled at build time for the
build's sample rate (48 kHz, or `--fs-192khz`); the firmware loads the one
chosen in the menu, muting for a moment while it does. The delay lines live
at 8 MB into the PSRAM (up to 4 MB), and the engine has priority on the
PSRAM bus.

    .. code-block:: text

        ┌────┐
        │in0 │◄─ audio in (left)
        │in1 │◄─ audio in (right)
        │in2 │◄─ (IN2 register, unused by plate)
        │in3 │◄─ (IN3 register, unused by plate)
        └────┘
        ┌────┐
        │out0│─► audio out (left)
        │out1│─► audio out (right)
        │out2│─► audio out (left)
        │out3│─► audio out (right)
        └────┘

    .. code-block:: text

                     coefficients, taps,
                     LFO rates, fades
        ┌──────────┐      CSR      ┌──────────────────────┐
        │VexiiRiscv│──────────────►│ engine core          │◄── in
        └──────────┘               │ (sequencer, 8 accs,  │──► out
                                   │  LFOs, fade units)   │
                                   └──────────┬───────────┘
                                              │ delay memory
                                   ┌──────────┴───────────┐   ┌──────────────┐
                                   │ stream engine        ├──►│PSRAM (4 MB   │
                                   │ (block-RAM buffers)  │   │at 8 MB)      │
                                   └──────────────────────┘   └──────────────┘

The UI: a ring of cells round the round screen (type, preset, the type's
dials, setup) and a hub with the selected item's help. Turn to move, click
to change, hold on a dial to set how far CV1, CV2 and the input's level,
bass and treble move it.

Types (`algorithms/__init__.py`): plate, rooms and halls, spring, shimmer,
reverse, ambient, bloom, void, resonator, ensemble, pulse, tunnel, echo,
morph, split, rotor, gated, spiral, orbit, fold, carrier, vowel, bounce,
crusher, strobe and swirl; `algorithms/lab.py` is an open slot to design in
(not in the default build). Size, predelay and the like crossfade between
the old and new length instead of jumping. `--debug` adds the firmware's
serial statistics and on-screen readouts.
"""

import importlib
import os
import sys

from amaranth import *
from amaranth.lib import wiring

from tiliqua.build.cli import top_level_cli
from tiliqua.build.types import BitstreamHelp
from tiliqua.tiliqua_soc import TiliquaSoc
from vendor.vexiiriscv import vexiiriscv

HERE = os.path.dirname(os.path.realpath(__file__))
sys.path.insert(0, HERE)
from bfr import backdrop, peripheral  # noqa: E402
from bfr.fill import FillEngine  # noqa: E402
from bfr.peripheral import BfrPeripheral  # noqa: E402
from bfr.psram import wide_psram  # noqa: E402
from bfr.blit import pipelined_blit  # noqa: E402
from bfr.video import (fixed_timing_framebuffer, no_line_plotter, no_persistence,  # noqa: E402
                       registered_palette)
from algorithms import TYPES  # noqa: E402
from model import rustgen  # noqa: E402
from model.compiler import CompileError, compile_set  # noqa: E402

# The CPU: rv32im with mid-sized caches whose data is in block RAM (4 EBR
# each). The stock variant keeps its cache data in LUT RAM, and the paths
# from the PSRAM's acknowledge into it miss 60 MHz at this utilisation (a
# build with them failing by 0.07 ns didn't start); H3000's large caches
# (also in block RAM) need 16 EBR, which no longer fit beside the delay pool.
# Registered here rather than in the shared variant list.
CPU_VARIANT = "bfr_rv32im_medcache"
vexiiriscv.CPU_VARIANTS.setdefault(CPU_VARIANT, vexiiriscv.CPU_BASE + [
    '--lsu-l1-sets=64',
    '--lsu-l1-ways=1',
    '--fetch-l1-sets=64',
    '--fetch-l1-ways=2',
])

# The compiled programs and their shared sizes, and `--debug`, set by
# argparse_fragment before the SoC is built.
_build = {"progs": None, "sizes": None, "debug": False}

# The name the bootloader shows (the manifest's); the build directory and the
# archive keep the project's (`bfr`).
MANIFEST_NAME = "Sunset"


class BfrSoc(TiliquaSoc):

    # Used by `tiliqua_soc.py` to create a MODULE_DOCSTRING rust constant used by the 'help' page.
    module_docstring = sys.modules[__name__].__doc__

    # Stored in manifest and used by bootloader for brief summary of each bitstream.
    bitstream_help = BitstreamHelp(
        brief="Sunset Reverb",
        io_left=['in L', 'in R', 'in CV1', 'in CV2', 'out L', 'out R', 'wet L', 'wet R'],
        io_right=['navigate menu', '', 'video out', '', '', ''],
    )

    # Delay memory: up to 4 MB at 8 MB into the PSRAM, as a word address
    # (above the framebuffer at 0 and the firmware at 2 MB, below bootinfo at
    # the end of the CPU's 16 MB). The arbiter reaches all 32 MB (bfr/psram.py)
    # but the upper half is untested on hardware.
    PSRAM_RING_BASE_WORD = 0x200000
    # Per-master PSRAM bus statistics (bfr/psram.py BusMonitor); off, as the
    # logic is short.
    BUS_MONITOR = False
    # The stream engine's statistics (bursts, lags, resyncs) for the serial
    # log: off, they read 0 and their counters go.
    DIAGNOSTICS = False

    def __init__(self, **kwargs):
        self.bfr_periph_base = 0x00001000
        self.busmon_base     = 0x00001100
        self.backdrop_base   = 0x00001200
        self.fill_base       = 0x00001300
        progs, sizes = _build["progs"], _build["sizes"]
        assert progs, "argparse_fragment compiles the algorithms"

        # The PSRAM peripheral gets a 32 MB DMA side (bfr/psram.py). Don't
        # finalize the CSR bridge in TiliquaSoc, we're adding a peripheral.
        # 32 KB of RAM for data and stack; the CPU with caches in block RAM
        # (CPU_VARIANT, above). Project-local overrides of stock Tiliqua
        # parts (shared files are never edited): the palette's output
        # registered and the framebuffer's DVI timing fixed, for the pixel
        # clock; no persistence, as the UI must stay on screen
        # (bfr/video.py); the blitter's sprite address registered, with 8 KB
        # of sprite memory for the UI's three font sizes in one sheet
        # (bfr/blit.py). The backdrop under the UI is a scan-out overlay
        # (bfr/backdrop.py).
        self.backdrop_periph = backdrop.Peripheral()
        with (wide_psram(monitor=self.BUS_MONITOR), registered_palette(), no_persistence(),
              fixed_timing_framebuffer(), pipelined_blit(memory_words=2048), no_line_plotter()):
            super().__init__(finalize_csr_bridge=False, mainram_size=0x8000,
                             cpu_variant=CPU_VARIANT, fb_overlay=self.backdrop_periph.backdrop,
                             **kwargs)
        fs = self.clock_settings.audio_clock.fs()
        assert fs == progs[0].fs, f"programs compiled for {progs[0].fs} Hz, CODEC runs at {fs} Hz"

        # Sized for every type the firmware can load; it starts with the first.
        self.bfr = BfrPeripheral(progs[0], prog_depth=sizes["prog_depth"],
                                 rbuf_words=sizes["rbuf_words"], wbuf_words=sizes["wbuf_words"],
                                 ebr_words=sizes["ebr_words"], diagnostics=self.DIAGNOSTICS)
        self.csr_decoder.add(self.bfr.csr_bus, addr=self.bfr_periph_base, name="bfr")
        # The engine's stream bursts are short and frequent; with the stock
        # round-robin it fell behind the framebuffer and persistence DMA.
        self.psram_periph.add_priority_master(self.bfr.psram, self.bfr.psram_pending)

        # The UI: its backdrop's settings, and a PSRAM fill engine that clears
        # the framebuffer (bfr/fill.py).
        self.csr_decoder.add(self.backdrop_periph.bus, addr=self.backdrop_base, name="backdrop")
        self.fill = FillEngine(addr_width=self.psram_periph.wide_bus_signature.addr_width)
        self.csr_decoder.add(self.fill.csr_bus, addr=self.fill_base, name="fill")
        self.psram_periph.add_master(self.fill.bus)
        if self.BUS_MONITOR:
            # PSRAM bus statistics per master, for the firmware's serial log
            # (build the firmware with `--features busmon`).
            self.csr_decoder.add(self.psram_periph.monitor.csr_bus, addr=self.busmon_base,
                                 name="busmon")
            names = self.psram_periph.master_names([
                (self.psram_periph.bus, "cpu"), (self.fb.bus, "fb"),
                (self.persist_periph.persist.bus, "persist"),
                (self.framebuffer_plotter.bus, "plot"), (self.fill.bus, "fill"),
                (self.bfr.psram, "bfr")])
            quoted = ", ".join(f'"{n}"' for n in names)
            self.add_rust_constant(f"pub const BUS_MASTERS: [&str; {len(names)}] = [{quoted}];\n")

        self.add_rust_constant(
            f"pub const BFR_RING_BASE_WORD: u32 = 0x{self.PSRAM_RING_BASE_WORD:x};\n")
        self.add_rust_constant(
            f"pub const BFR_DIAGNOSTICS: bool = {'true' if self.DIAGNOSTICS else 'false'};\n")
        # `--debug`: the firmware's serial statistics and its on-screen
        # readouts (inputs, rate, frame budget, control tick).
        self.add_rust_constant(
            f"pub const BFR_DEBUG: bool = {'true' if _build['debug'] else 'false'};\n")
        for name in ("PROG", "COEF", "RTAP", "WTAP", "REG", "STAB", "LFO"):
            self.add_rust_constant(
                f"pub const BFR_T_{name}: u8 = {getattr(peripheral, f'T_{name}')};\n")

        # Now we can freeze the memory map.
        self.finalize_csr_bridge()

    def elaborate(self, platform):
        m = Module()
        m.submodules.bfr = self.bfr
        m.submodules.backdrop_periph = self.backdrop_periph
        m.submodules.fill = self.fill
        m.submodules += super().elaborate(platform)
        pmod0 = self.pmod0_periph.pmod
        wiring.connect(m, pmod0.o_cal, self.bfr.i)
        wiring.connect(m, self.bfr.o, pmod0.i_cal)
        return m


# The engine's pools, the same in every build whichever types it carries:
# program memory (instructions; 512 is two block RAMs, 1024 would be
# three), the PSRAM stream buffers (read, write) and the block-RAM delay
# pool, in 32-bit words. Every type must fit them (`compile_set` says which
# doesn't), and so any set of types that fits runs on the same bitstream:
# a changed or new type needs only `top.py build --fw-only`.
POOLS = {"prog_depth": 512, "rbuf_words": 2048, "wbuf_words": 512, "ebr_words": 2048}

# The reverb types, in menu order (modules in algorithms/).
ALGORITHMS = TYPES


def argparse_callback(parser):
    parser.add_argument('--algorithms', default=",".join(ALGORITHMS),
                        help="reverb types to build, in menu order (modules in algorithms/; "
                             f"default: {','.join(ALGORITHMS)})")
    parser.add_argument('--debug', action='store_true',
                        help="firmware: statistics on the serial port once a second, and the "
                             "inputs, rate, frame budget and control tick on screen")


def argparse_fragment(args):
    fs = 192000 if args.fs_192khz else 48000
    names = [n.strip() for n in args.algorithms.split(",") if n.strip()]
    mods = [importlib.import_module(f"algorithms.{n}") for n in names]
    try:
        progs, used = compile_set(mods, fs, **POOLS)
    except CompileError as e:
        raise SystemExit(f"bfr: {e}")
    sizes = dict(POOLS)
    for p in progs:
        r = p.report
        print(f"bfr: {p.name}: {len(p.instrs)} instructions, {r['cycles']}/{r['budget']} clocks, "
              f"{len(p.streams['taps'])} streams, block-RAM pool {p.mem_words[1]} words")
    print(f"bfr: pools {sizes}, the types use at most {used}")
    _build["progs"], _build["sizes"], _build["debug"] = progs, sizes, args.debug
    # The firmware's tables, for the cargo build (fw/build.rs, cpu/build.rs).
    gen = os.path.join(HERE, "fw", "target", f"gen-{fs}")
    program_rs, _ = rustgen.write(progs, gen)
    os.environ["BFR_PROGRAM"] = program_rs
    return {}


def archiver_callback(archiver):
    """The option storage, and the bootloader's name (MANIFEST_NAME) without
    renaming the archive."""
    archiver.with_option_storage()
    stock = type(archiver)
    project = archiver.name

    class Archive(stock):
        @property
        def archive_name(self):
            return f"{project.lower()}-{self.tag}-{self.hw_rev.value}.tar.gz"

    archiver.__class__ = Archive
    archiver.name = MANIFEST_NAME


if __name__ == "__main__":
    top_level_cli(BfrSoc, path=HERE, argparse_callback=argparse_callback,
                  argparse_fragment=argparse_fragment, archiver_callback=archiver_callback)
