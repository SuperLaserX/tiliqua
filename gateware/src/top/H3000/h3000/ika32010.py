"""Amaranth wrapper for the IKA32010 TMS32010 core (SystemVerilog)."""

import os

from amaranth import *
from amaranth.lib import wiring
from amaranth.lib.wiring import In, Out

IKA_SRC = os.path.join(os.path.dirname(os.path.realpath(__file__)), "..", "IKA32010", "src")
IKA_FILES = ["IKA32010.sv", "IKA32010_mnemonics.sv"]


def add_ika_sources(platform):
    """Add the IKA32010 sources to an Amaranth platform (once per build)."""
    if getattr(platform, "_ika32010_added", False):
        return
    for f in IKA_FILES:
        with open(os.path.join(IKA_SRC, f)) as fh:
            platform.add_file(f, fh.read())
    platform._ika32010_added = True


class IKA32010(wiring.Component):

    """One TMS32010, clocked from ``sync`` with a CLKIN clock enable.

    An instruction cycle is 4 enabled clocks. ``ncen`` pulses on the enabled
    clock that ends an instruction cycle; bus strobes (``men_n``, ``den_n``,
    ``we_n``) are registered and stay valid up to and including that clock.
    """

    pcen:    In(1)
    rs_n:    In(1)
    bio_n:   In(1)

    men_n:   Out(1)
    den_n:   Out(1)
    we_n:    Out(1)
    aout:    Out(12)
    din:     In(16)
    dout:    Out(16)
    ncen:    Out(1)

    def elaborate(self, platform):
        m = Module()
        if platform is not None:
            add_ika_sources(platform)
        m.submodules.core = Instance("IKA32010",
            i_i_EMUCLK      = ClockSignal("sync"),
            i_i_CLKIN_PCEN  = self.pcen,
            o_o_CLKOUT_NCEN = self.ncen,
            i_i_RS_n        = self.rs_n,
            o_o_MEN_n       = self.men_n,
            o_o_DEN_n       = self.den_n,
            o_o_WE_n        = self.we_n,
            o_o_AOUT        = self.aout,
            i_i_DIN         = self.din,
            o_o_DOUT        = self.dout,
            i_i_BIO_n       = self.bio_n,
            i_i_INT_n       = 1,
        )
        return m
