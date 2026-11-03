# Copyright (c) 2026
#
# SPDX-License-Identifier: CERN-OHL-S-2.0

"""
FairWave: a WaveScan wavetable synthesizer.

Two oscillator layers read wavetables out of PSRAM, frame by frame or along a
tilted line through the table, with two DAHDSR envelopes, a modulation matrix
and an output mixer. Wavetables come from a USB drive; each screen is its own
round UI. See README.md in this directory for the plan.

The oscillators, from tables made at boot, with envelopes, LFOs, the matrix, VCAs and mixer
around them, all at audio rate. By default CV1 is pitch (1 V/oct) and CV2 position, gate 1
runs envelope 1 and gate 2 envelope 2, each to its output. Turn, click and hold the encoder
to edit them; patches are kept in this slot's flash.

    .. code-block:: text

        ┌────┐
        │in0 │◄─ CV1
        │in1 │◄─ CV2
        │in2 │◄─ gate 1
        │in3 │◄─ gate 2
        └────┘
        ┌────┐
        │out0│─► oscillator 1 (assignable)
        │out1│─► oscillator 2 (assignable)
        │out2│─► envelope 1 (assignable)
        │out3│─► envelope 2 (assignable)
        └────┘

Build from `gateware/`, with the venv's Scripts on PATH:

    python src/top/fairwave/top.py build

`--usb-table` also has the bootloader load `fairwave.wav` from a thumbdrive as a third
table. The bitstream then won't start without a drive in, so it is off by default.
"""

import os
import sys

HERE = os.path.dirname(os.path.realpath(__file__))
# This tree's library first: the venv's editable install may point elsewhere.
sys.path.insert(0, os.path.abspath(os.path.join(HERE, "..", "..")))
sys.path.insert(0, HERE)

from amaranth import *  # noqa: E402
from amaranth.lib import wiring  # noqa: E402
from guh.engines.msc import MAX_BLOCKS_PER_XFER  # noqa: E402
from guh.periph import msc  # noqa: E402

from tiliqua.build import sim as stock_sim  # noqa: E402
from tiliqua.build.cli import top_level_cli  # noqa: E402
from tiliqua.build.types import BitstreamHelp  # noqa: E402
from tiliqua.periph import vbus  # noqa: E402
from tiliqua.tiliqua_soc import TiliquaSoc  # noqa: E402

from fairwave import socsim  # noqa: E402
from fairwave.blit import pipelined_blit  # noqa: E402
from fairwave.cpu import CPU_VARIANT  # noqa: E402
from fairwave.fill import FillEngine  # noqa: E402
from fairwave.peripheral import WaveScanPeripheral  # noqa: E402
from fairwave.psram import wide_psram  # noqa: E402
from fairwave.video import fixed_timing_framebuffer, no_persistence, registered_palette  # noqa: E402

# What `--usb-table` has the bootloader load (FAT, in the drive's root directory).
USB_TABLE_NAME = "fairwave.wav"
# PSRAM for the USB host's buffers, just under `bootinfo`: two to read through and a FAT cache.
USB_SCRATCH_BYTES = 3 * MAX_BLOCKS_PER_XFER * 512

_build = {"usb_table": False}


class FairWaveSoc(TiliquaSoc):

    # Used by `tiliqua_soc.py` to create a MODULE_DOCSTRING rust constant.
    module_docstring = sys.modules[__name__].__doc__

    # Stored in manifest and used by bootloader for brief summary of each bitstream.
    bitstream_help = BitstreamHelp(
        brief="WaveScan wavetable synth",
        io_left=['cv 1', 'cv 2', 'gate 1', 'gate 2', 'osc 1', 'osc 2', 'env 1', 'env 2'],
        io_right=['navigate menu', 'USB drive', 'video out', '', '', ''],
    )

    # PSRAM, as byte offsets in the CPU's 16 MB window:
    #
    #   0x000000  framebuffer (518 KB on the 720 x 720 panel)
    #   0x100000  UI scratch (the font sheet while it is rendered)
    #   0x200000  firmware (the CLI's default, 320 KB at most)
    #   0x400000  wavetable pool (its first 4 MB: where the bootloader leaves a file)
    #   0xF00000  reserved: USB scratch buffers (96 KB, Phase 5) and `bootinfo`
    PSRAM_UI_SCRATCH = 0x100000
    PSRAM_POOL_BASE  = 0x400000
    PSRAM_POOL_BYTES = 0xB00000
    PSRAM_USB_WINDOW = 0x400000
    # Eight patches of two 4 KB sectors each (cpu/src/store.rs). A slot's option window starts at
    # 0xE0000 and its manifest at 0xF0000, so this is the most it can be.
    PATCH_WINDOW = 0x10000

    FILL_BASE     = 0x00001000
    WAVESCAN_BASE = 0x00001100
    USB_MSC_BASE  = 0x00001200
    USB_VBUS_BASE = 0x00001300

    def __init__(self, **kwargs):
        # 32 KB of RAM for data and stack, and project-local overrides of stock
        # parts (fairwave/video.py, blit.py, psram.py); shared code is untouched.
        # 8 KB of sprite memory holds the UI's three font sizes in one sheet.
        with (wide_psram(), registered_palette(), no_persistence(), fixed_timing_framebuffer(),
              pipelined_blit(memory_words=2048)):
            super().__init__(finalize_csr_bridge=False, mainram_size=0x8000,
                             cpu_variant=CPU_VARIANT, **kwargs)

        # Clears the framebuffer in about 3 ms (the CPU takes 60): every screen
        # change does this.
        self.fill = FillEngine(addr_width=self.psram_periph.wide_bus_signature.addr_width)
        self.csr_decoder.add(self.fill.csr_bus, addr=self.FILL_BASE, name="fill")
        self.psram_periph.add_master(self.fill.bus)

        # The oscillators, the PSRAM's priority master: they must finish every sample.
        self.wavescan = WaveScanPeripheral(addr_width=self.psram_periph.wide_bus_signature.addr_width)
        self.csr_decoder.add(self.wavescan.csr_bus, addr=self.WAVESCAN_BASE, name="wavescan")
        self.psram_periph.add_priority_master(self.wavescan.bus, self.wavescan.pending)

        # The USB host, for the browser: reads blocks straight into PSRAM.
        self.usb_msc = msc.Peripheral(addr_width=self.psram_periph.bus.signature.addr_width)
        self.csr_decoder.add(self.usb_msc.csr_bus, addr=self.USB_MSC_BASE, name="usb_msc")
        self.psram_periph.add_master(self.usb_msc.dma_bus)
        self.usb_vbus = vbus.UsbVbusPeripheral()
        self.csr_decoder.add(self.usb_vbus.bus, addr=self.USB_VBUS_BASE, name="usb_vbus")
        self.add_rust_constant(f"pub const USB_MSC_MAX_BLOCKS_PER_READ: u32 = {MAX_BLOCKS_PER_XFER};\n")
        self.add_rust_constant(
            f"pub const USB_SCRATCH_PSRAM_OFFSET: usize = 0x{self.bootinfo_base - self.psram_base - USB_SCRATCH_BYTES:x};\n")

        self.add_rust_constant(
            f"pub const PSRAM_UI_SCRATCH: usize = 0x{self.PSRAM_UI_SCRATCH:x};\n")
        self.add_rust_constant(
            f"pub const PSRAM_POOL_BASE: usize = 0x{self.PSRAM_POOL_BASE:x};\n")
        self.add_rust_constant(
            f"pub const PSRAM_POOL_BYTES: usize = 0x{self.PSRAM_POOL_BYTES:x};\n")
        self.add_rust_constant(
            f"pub const PSRAM_USB_WINDOW: usize = 0x{self.PSRAM_USB_WINDOW:x};\n")
        self.add_rust_constant(
            f"pub const USB_TABLE: bool = {'true' if _build['usb_table'] else 'false'};\n")
        self.add_rust_constant(f'pub const USB_TABLE_NAME: &str = "{USB_TABLE_NAME}";\n')
        self.add_rust_constant(f"pub const PATCH_WINDOW: usize = 0x{self.PATCH_WINDOW:x};\n")
        # Nor has it a USB drive: it reads a disk image, put in PSRAM with `load=` (`tools/`).
        self.add_rust_constant(
            f"pub const DISK_IN_PSRAM: bool = {'true' if 'sim' in sys.argv else 'false'};\n")
        self.add_rust_constant("pub const PSRAM_DISK: usize = 0xB00000;\n")
        self.add_rust_constant("pub const PSRAM_DISK_BYTES: usize = 0x300000;\n")
        self.add_rust_constant("pub const DISK_BLOCKS: u32 = 70000;\n")
        # A simulation has no flash: its patches go in free PSRAM, at the top of the pool.
        self.add_rust_constant(
            f"pub const PATCHES_IN_PSRAM: bool = {'true' if 'sim' in sys.argv else 'false'};\n")
        self.add_rust_constant(
            f"pub const PSRAM_PATCHES: usize = 0x{self.PSRAM_POOL_BASE + self.PSRAM_POOL_BYTES - self.PATCH_WINDOW:x};\n")

        self.finalize_csr_bridge()

    def elaborate(self, platform):
        m = Module()
        m.submodules.fill = self.fill
        m.submodules.wavescan = self.wavescan
        m.submodules.usb_msc = self.usb_msc
        m.submodules.usb_vbus = self.usb_vbus
        if stock_sim.is_hw(platform):
            m.d.comb += platform.request("usb_vbus_en").o.eq(self.usb_vbus.en)
        m.submodules += super().elaborate(platform)

        # The inputs to the modulation, and the mixer to the outputs. (The CPU reads the
        # inputs for its meters from the calibrator's peek registers.)
        pmod0 = self.pmod0_periph.pmod
        wiring.connect(m, pmod0.o_cal, self.wavescan.i)
        wiring.connect(m, self.wavescan.o, pmod0.i_cal)
        return m


def argparse_callback(parser):
    parser.add_argument('--usb-table', action='store_true',
                        help=f"have the bootloader load {USB_TABLE_NAME} from a thumbdrive as a "
                             "third table (the bitstream won't start without a drive)")


def argparse_fragment(args):
    _build["usb_table"] = args.usb_table
    return {}


def archiver_callback(archiver):
    archiver.with_option_storage(size=FairWaveSoc.PATCH_WINDOW)
    if _build["usb_table"]:
        archiver.with_usb_load(filename=USB_TABLE_NAME,
                               psram_dst=FairWaveSoc.PSRAM_POOL_BASE,
                               max_size=FairWaveSoc.PSRAM_USB_WINDOW)


if __name__ == "__main__":
    # `sim`: the whole SoC in Verilator, with this project's flow (fairwave/socsim.py).
    stock_sim.simulate = socsim.simulate
    top_level_cli(FairWaveSoc, path=HERE, sim_ports=socsim.ports, sim_harness=socsim.HARNESS,
                  argparse_callback=argparse_callback, argparse_fragment=argparse_fragment,
                  archiver_callback=archiver_callback)
