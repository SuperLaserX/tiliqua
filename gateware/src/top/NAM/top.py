# Copyright (c) 2026
#
# SPDX-License-Identifier: CERN-OHL-S-2.0

"""
NAM: a guitar amp from a Neural Amp Modeler profile.

A2 profiles (Lite and Full) run in the FPGA at 48 kHz. Plug the guitar into
IN0 and take OUT0 (OUT1 carries the same, OUT2 the dry signal). Profiles load
from a USB drive; the screen has the browser, levels, gate and tone controls.
See README.md in this directory for the plan.

    .. code-block:: text

        ┌────┐
        │in0 │◄─ guitar
        │in1 │◄─ (stereo, later)
        └────┘
        ┌────┐
        │out0│─► amp
        │out1│─► amp
        │out2│─► dry
        └────┘

Build from `gateware/`, with the venv's Scripts on PATH:

    python src/top/NAM/top.py build
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

from model import program  # noqa: E402
from nam.blit import pipelined_blit  # noqa: E402
from nam.cpu import CPU_VARIANT  # noqa: E402
from nam.fill import FillEngine  # noqa: E402
from nam.peripheral import NamPeripheral  # noqa: E402
from nam.psram import wide_psram  # noqa: E402
from nam.trim import no_spiflash, no_uart, small_mainram  # noqa: E402
from nam.video import fixed_timing_framebuffer, no_persistence, registered_palette  # noqa: E402

# PSRAM for the USB host's buffers, just under `bootinfo`: two to read through and a FAT cache.
USB_SCRATCH_BYTES = 3 * MAX_BLOCKS_PER_XFER * 512


class NamSoc(TiliquaSoc):

    # Used by `tiliqua_soc.py` to create a MODULE_DOCSTRING rust constant.
    module_docstring = sys.modules[__name__].__doc__

    bitstream_help = BitstreamHelp(
        brief="Neural Amp Modeler (A2)",
        io_left=['guitar', 'in 1', '', '', 'amp', 'amp', 'dry', ''],
        io_right=['navigate menu', 'USB drive', 'video out', '', '', ''],
    )

    # PSRAM, as byte offsets in the CPU's 16 MB window:
    #
    #   0x000000  framebuffer (518 KB on the 720 x 720 panel)
    #   0x100000  UI scratch (the font sheet while it is rendered)
    #   0x200000  firmware (the CLI's default, 320 KB at most)
    #   0x400000  profile file buffer (a .nam as read from the drive, 4 MB)
    #   0x800000  engine history rings (D = 101 and 239 layers; 1 MB)
    #   0xF00000  reserved: USB scratch buffers (96 KB) and `bootinfo`
    PSRAM_UI_SCRATCH = 0x100000
    PSRAM_FILE_BASE = 0x400000
    PSRAM_FILE_BYTES = 0x400000
    PSRAM_RINGS_BASE = 0x800000
    PSRAM_RINGS_BYTES = 0x100000
    # The CPU's block RAM: data, heap and stack (big buffers are in PSRAM).
    MAINRAM_BYTES = 0x4000

    FILL_BASE     = 0x00001000
    NAM_BASE      = 0x00001100
    USB_MSC_BASE  = 0x00001200
    USB_VBUS_BASE = 0x00001300

    def __init__(self, **kwargs):
        # FairWave's SoC (the CPU told 32 KB of RAM: the cached CPU netlist's memory map),
        # the project-local overrides vendored in nam/ (video, blit, psram), and, to fit
        # (nam/trim.py): no SPI flash controller (settings live in a file on the USB
        # drive), no debug UART (its registers stay, as a no-op) and 16 KB of RAM.
        with (wide_psram(), registered_palette(), no_persistence(), fixed_timing_framebuffer(),
              pipelined_blit(memory_words=2048), no_spiflash(), no_uart(),
              small_mainram(self.MAINRAM_BYTES)):
            super().__init__(finalize_csr_bridge=False, mainram_size=0x8000,
                             cpu_variant=CPU_VARIANT, **kwargs)

        self.fill = FillEngine(addr_width=self.psram_periph.wide_bus_signature.addr_width)
        self.csr_decoder.add(self.fill.csr_bus, addr=self.FILL_BASE, name="fill")
        self.psram_periph.add_master(self.fill.bus)

        # The engine, the PSRAM's priority master: its history streams every sample.
        self.nam = NamPeripheral(addr_width=self.psram_periph.wide_bus_signature.addr_width,
                                 pring_base=self.PSRAM_RINGS_BASE // 4)
        self.csr_decoder.add(self.nam.csr_bus, addr=self.NAM_BASE, name="nam")
        self.psram_periph.add_priority_master(self.nam.bus, self.nam.pending)

        self.usb_msc = msc.Peripheral(addr_width=self.psram_periph.bus.signature.addr_width)
        self.csr_decoder.add(self.usb_msc.csr_bus, addr=self.USB_MSC_BASE, name="usb_msc")
        self.psram_periph.add_master(self.usb_msc.dma_bus)
        self.usb_vbus = vbus.UsbVbusPeripheral()
        self.csr_decoder.add(self.usb_vbus.bus, addr=self.USB_VBUS_BASE, name="usb_vbus")

        consts = {
            "USB_MSC_MAX_BLOCKS_PER_READ": ("u32", MAX_BLOCKS_PER_XFER),
            "USB_SCRATCH_PSRAM_OFFSET": ("usize", self.bootinfo_base - self.psram_base - USB_SCRATCH_BYTES),
            "PSRAM_UI_SCRATCH": ("usize", self.PSRAM_UI_SCRATCH),
            "PSRAM_FILE_BASE": ("usize", self.PSRAM_FILE_BASE),
            "PSRAM_FILE_BYTES": ("usize", self.PSRAM_FILE_BYTES),
            "PSRAM_RINGS_BASE": ("usize", self.PSRAM_RINGS_BASE),
            "PSRAM_RINGS_BYTES": ("usize", self.PSRAM_RINGS_BYTES),
            "ENGINE_WMEM_ROWS": ("usize", program.WMEM_ROWS),
            "ENGINE_AUX_WORDS": ("usize", program.AUX_WORDS),
            "ENGINE_HIST_WORDS": ("usize", program.HIST_WORDS),
            "ENGINE_SBUF_R_WORDS": ("usize", program.SBUF_R_WORDS),
            "ENGINE_SBUF_W_WORDS": ("usize", program.SBUF_W_WORDS),
            "ENGINE_SEGMENTS": ("usize", self.nam.engine.segments),
            "ENGINE_N_RINGS": ("usize", program.N_RINGS),
            "ENGINE_N_READ_STREAMS": ("usize", program.N_READ_STREAMS),
            "ENGINE_N_WRITE_STREAMS": ("usize", program.N_WRITE_STREAMS),
        }
        for name, (ty, value) in consts.items():
            self.add_rust_constant(f"pub const {name}: {ty} = 0x{value:x};\n")
        self.add_rust_constant(
            f"pub const DISK_IN_PSRAM: bool = {'true' if 'sim' in sys.argv else 'false'};\n")
        self.add_rust_constant("pub const PSRAM_DISK: usize = 0xB00000;\n")
        self.add_rust_constant("pub const PSRAM_DISK_BYTES: usize = 0x300000;\n")
        self.finalize_csr_bridge()

    def elaborate(self, platform):
        m = Module()
        m.submodules.fill = self.fill
        m.submodules.nam = self.nam
        m.submodules.usb_msc = self.usb_msc
        m.submodules.usb_vbus = self.usb_vbus
        if stock_sim.is_hw(platform):
            m.d.comb += platform.request("usb_vbus_en").o.eq(self.usb_vbus.en)
        m.submodules += super().elaborate(platform)

        pmod0 = self.pmod0_periph.pmod
        wiring.connect(m, pmod0.o_cal, self.nam.i)
        wiring.connect(m, self.nam.o, pmod0.i_cal)
        return m


if __name__ == "__main__":
    top_level_cli(NamSoc, path=HERE)
