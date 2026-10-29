# Copyright (c) 2026
#
# SPDX-License-Identifier: CERN-OHL-S-2.0

"""
Emulation of the Eventide H3000 / H3500 Ultra-Harmonizer.

The three TMS32010 DSPs of the original are instantiated as gateware
(IKA32010 cores) and run the original DSP microcode from the H3000 ROMs,
cycle-locked at 104 instruction cycles per sample, at the original 44.1kHz
sample rate. The board around them (shared I/O bus, 64K-word delay memory,
ADC, variable-rate DACs driven by two frequency synthesizers for the pitch
shifters, host parameter latch, host bus slot, interrupts to the host) is
reproduced from the microcode and the H3000 service manual; the delay
memory lives in PSRAM behind a block-RAM cache.

The softcore runs the original 6809 control firmware in an emulator, which
loads the DSP programs and computes every parameter exactly as the original
did; the H3000 front panel is shown on screen and driven by the encoder.
The default build runs H3000 OS v1.53 (69 programs); `--h3500` builds the
H3500 (OS 2.17, 780 programs). Either ROM set is embedded in the firmware,
LZMA-compressed, and decoded into PSRAM at boot.

Inputs in2 and in3 (CV1 and CV2 on screen) are control voltages: the
firmware turns each into a MIDI controller, by default CC 16 and CC 17
(the H3000's patch sources "GP Controller # 1" and "# 2"; the on-screen
CV key sets the controller, voltage range and channel), and the H3000
patches them to parameters on its own modulation pages.

    .. code-block:: text

        ┌────┐
        │in0 │◄─ audio in (left / mono)
        │in1 │◄─ audio in (right)
        │in2 │◄─ CV mod 1 (MIDI CC 16 by default)
        │in3 │◄─ CV mod 2 (MIDI CC 17 by default)
        └────┘
        TRS MIDI in ─► the H3000's MIDI input (program changes, notes,
                       controllers, SysEx dumps; MIDI out goes nowhere)
        ┌────┐
        │out0│─► audio out (left)
        │out1│─► audio out (right)
        │out2│─► audio out (left)
        │out3│─► audio out (right)
        └────┘

    .. code-block:: text

          (6809 emulator: loads programs,
           writes DSP parameters, bus
           ports, takes FIRQ / IRQ)
        ┌──────────┐        ┌─────────────────────────────┐
        │VexiiRiscv│◄──────►│ 3x TMS32010 (IKA32010)      │
        └──────────┘  CSR   │ shared bus, host latch, BIO │──► out
                            │ status port, synthesizers   │◄── in
                            └──────────────┬──────────────┘
                                           │ 64K x 16 delay memory
                                       ┌───┴───┐   ┌─────┐
                                       │ cache ├──►│PSRAM│
                                       └───────┘   └─────┘
"""

import os
import sys

from amaranth import *
from amaranth.lib import wiring

from tiliqua import midi
from tiliqua.build import sim
from tiliqua.build.cli import top_level_cli
from tiliqua.build.types import BitstreamHelp
from tiliqua.tiliqua_soc import TiliquaSoc
from vendor.vexiiriscv import vexiiriscv

sys.path.insert(0, os.path.dirname(os.path.realpath(__file__)))
from h3000 import clocks  # noqa: E402
from h3000.peripheral import H3000Peripheral  # noqa: E402
from h3000.video import blitter_memory, fixed_timing_framebuffer  # noqa: E402

# Project-local versions of what this project needs from Tiliqua's shared
# code (those files are never edited):
#
# - rv32im with large L1 caches (16 KiB 4-way fetch, 8 KiB 2-way data): the
#   emulator's hot code and data don't fit the small caches and would
#   otherwise saturate PSRAM.
# - the 44.1 kHz audio clock (h3000/clocks.py).
# - the framebuffer's DVI timing fixes and a 2048-word blitter memory
#   (h3000/video.py).
CPU_VARIANT = "tiliqua_rv32im_bigcache"
vexiiriscv.CPU_VARIANTS.setdefault(CPU_VARIANT, vexiiriscv.CPU_BASE + [
    '--lsu-l1-sets=64',
    '--lsu-l1-ways=2',
    '--fetch-l1-sets=64',
    '--fetch-l1-ways=4',
])
clocks.install()


class H3000Soc(TiliquaSoc):

    # Used by `tiliqua_soc.py` to create a MODULE_DOCSTRING rust constant used by the 'help' page.
    module_docstring = sys.modules[__name__].__doc__

    # Stored in manifest and used by bootloader for brief summary of each bitstream.
    bitstream_help = BitstreamHelp(
        brief="Eventide H3000/H3500 emulation.",
        io_left=['in L', 'in R', 'CV mod 1', 'CV mod 2', 'out L', 'out R', 'out L', 'out R'],
        io_right=['navigate menu', '', 'video out', '', '', 'TRS MIDI in'],
    )

    # PSRAM layout (byte offsets from the start of PSRAM). The framebuffer
    # starts at 0 and the firmware image at 0x200000.
    PSRAM_DELAY_OFFSET = 0x600000  # 64K x 16-bit delay memory (128 KiB)
    PSRAM_EMU_OFFSET   = 0x700000  # 6809 emulator memory (RAM, panel sprites)
    PSRAM_ROM_OFFSET   = 0x800000  # ROM image, decoded at boot
    PSRAM_ROM_SIZE     = 0x140000

    def __init__(self, **kwargs):
        self.h3000_periph_base = 0x00001000

        # The H3000's own sample rate, 44.1 kHz (`--fs-44khz`, on by default).
        # Changed in place: the CLI configures the external PLL from this same
        # object after the SoC is built.
        if _variant["fs_44khz"]:
            clocks.use_44khz(kwargs["clock_settings"])

        # Don't finalize the CSR bridge in TiliquaSoc, we're adding more peripherals.
        # More block RAM than the default: the 6809 RAM lives there. Large CPU
        # caches: the emulator's code and ROM reads otherwise hammer PSRAM,
        # which the framebuffer also needs. A blitter memory big enough for
        # the panel's glyph sheet.
        with fixed_timing_framebuffer(), blitter_memory(2048):
            super().__init__(finalize_csr_bridge=False, mainram_size=0x8000,
                             cpu_variant=CPU_VARIANT, **kwargs)

        self.h3000 = H3000Peripheral(
            psram_signature=self.psram_periph.bus.signature.flip(),
            delay_base_word=self.PSRAM_DELAY_OFFSET // 4)
        self.csr_decoder.add(self.h3000.csr_bus, addr=self.h3000_periph_base, name="h3000")
        self.psram_periph.add_master(self.h3000.psram)

        self.add_rust_constant(
            f"pub const PSRAM_DELAY_OFFSET: usize = 0x{self.PSRAM_DELAY_OFFSET:x};\n")
        self.add_rust_constant(
            f"pub const PSRAM_EMU_OFFSET: usize = 0x{self.PSRAM_EMU_OFFSET:x};\n")
        self.add_rust_constant(
            f"pub const PSRAM_ROM_OFFSET: usize = 0x{self.PSRAM_ROM_OFFSET:x};\n")
        self.add_rust_constant(
            f"pub const PSRAM_ROM_SIZE: usize = 0x{self.PSRAM_ROM_SIZE:x};\n")

        # Now we can freeze the memory map.
        self.finalize_csr_bridge()

    def elaborate(self, platform):
        m = Module()
        m.submodules.h3000 = self.h3000
        m.submodules += super().elaborate(platform)
        pmod0 = self.pmod0_periph.pmod
        wiring.connect(m, pmod0.o_cal, self.h3000.i)
        wiring.connect(m, self.h3000.o, pmod0.i_cal)
        if sim.is_hw(platform):
            # TRS MIDI input -> the emulated H3000's MIDI port.
            m.submodules.midi_rx = midi_rx = midi.SerialRx(
                system_clk_hz=self.clock_settings.frequencies.sync,
                pins=platform.request("midi"))
            wiring.connect(m, midi_rx.o, self.h3000.midi)
        return m


# The firmware embeds the ROM set of its variant, packed and LZMA-compressed
# by pack_roms.py (the H3500 set: 832 KB, compressed 135 KB, which fits in the
# firmware's part of a flash slot). fw/build.rs takes the file from H3K_ROMS.
_variant = {"h3500": False, "fs_44khz": True}


def argparse_callback(parser):
    parser.add_argument('--h3500', action='store_true',
                        help="H3500 variant: OS 2.17 with all its program ROMs (780 programs).")
    parser.add_argument('--fs-44khz', action='store_true', default=True,
                        help="Use the 44.1kHz CODEC sample rate (the H3000's; on by default).")


def argparse_fragment(args):
    _variant["h3500"] = args.h3500
    _variant["fs_44khz"] = args.fs_44khz and not args.fs_192khz
    kind = "h3500" if args.h3500 else "v153"
    if args.h3500:
        if args.name == "H3000":
            args.name = "H3500"
        H3000Soc.bitstream_help = BitstreamHelp(
            brief="Eventide H3500 emulation.",
            io_left=H3000Soc.bitstream_help.io_left,
            io_right=H3000Soc.bitstream_help.io_right,
        )
    import pack_roms
    here = os.path.dirname(os.path.realpath(__file__))
    out = os.path.join(here, "fw", "target", f"roms-{kind}.lzma")
    os.makedirs(os.path.dirname(out), exist_ok=True)
    data = pack_roms.compressed(os.path.join(here, "H3000-Firmware"), kind)
    # Only rewrite a changed image, so cargo does not rebuild for nothing.
    if not os.path.exists(out) or open(out, "rb").read() != data:
        with open(out, "wb") as f:
            f.write(data)
    os.environ["H3K_ROMS"] = out
    return {}


def archiver_callback(archiver):
    # The whole 64 KB between the firmware and the manifest: the firmware
    # keeps two copies of the H3000's battery-backed RAM there (fw nvstore).
    archiver.with_option_storage(size=0x10000)


if __name__ == "__main__":
    this_path = os.path.dirname(os.path.realpath(__file__))
    top_level_cli(H3000Soc, path=this_path,
                  argparse_callback=argparse_callback,
                  argparse_fragment=argparse_fragment,
                  archiver_callback=archiver_callback)
