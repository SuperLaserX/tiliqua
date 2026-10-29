"""The 44.1 kHz audio clock, for this project only (the H3000 ran at 44.1 kHz).

Tiliqua's clock code (`tiliqua/pll.py`, `tiliqua/build/cli.py`) knows the 48
and 192 kHz families. Rather than editing those shared files, this module
holds what 44.1 kHz needs:

- `AudioClock`: the stock audio clocks plus FINE_44KHZ / COARSE_44KHZ, with
  the same methods (members compare and hash equal to the stock ones of the
  same name, as both are `str` enums).
- `DomainGenerator2PLLs` / `DomainGenerator4PLLs`: copies of the stock
  internal-PLL clock generators (Tiliqua R2/R3) with the 44.1 kHz branches.
  R4/R5 take the audio clock from the external PLL, configured from
  `ClockSettings.frequencies.audio`, so they need no generator change.
- `install()` points the platforms' clock generators at these copies, in
  this process only; `use_44khz(settings)` switches a `ClockSettings` to the
  44.1 kHz family in place (the CLI keeps using the same object after the
  SoC is built, to configure the external PLL).
"""

import enum

from amaranth import *

from tiliqua import platform as tiliqua_platform
from tiliqua import pll
from tiliqua.pll import ClockSettings
from tiliqua.video.modeline import DVIPLL

class AudioClock(str, enum.Enum):
    FINE_48KHZ  = "fine_48khz"
    FINE_192KHZ = "fine_192khz"
    COARSE_48KHZ  = "coarse_48khz"
    COARSE_192KHZ = "coarse_192khz"
    # 44.1kHz family (e.g. for emulating hardware that ran at 44.1kHz).
    FINE_44KHZ   = "fine_44khz"
    COARSE_44KHZ = "coarse_44khz"

    def mclk(self):
        return {
            self.FINE_48KHZ: 12_288_000,
            self.FINE_192KHZ: 49_152_000,
            self.COARSE_48KHZ: 12_500_000, # These don't need an extra PLL.
            self.COARSE_192KHZ: 50_000_000,
            self.FINE_44KHZ: 11_289_600,
            self.COARSE_44KHZ: 11_320_754, # 600MHz VCO / 53, fs = 44.22kHz
        }[self]

    def fs(self):
        return self.mclk() // 256

    def to_192khz(self):
        return {
            self.FINE_48KHZ: self.FINE_192KHZ,
            self.COARSE_48KHZ: self.COARSE_192KHZ,
        }[self]

    def to_44khz(self):
        return {
            self.FINE_48KHZ: self.FINE_44KHZ,
            self.COARSE_48KHZ: self.COARSE_44KHZ,
        }[self]

    def is_192khz(self):
        return self in [
            self.FINE_192KHZ,
            self.COARSE_192KHZ,
        ]

# Maximum allowed pixel clock that may be set by external PLL when `dynamic_modeline`


def use_44khz(settings: ClockSettings):
    """Switch `settings` (48 kHz family) to 44.1 kHz, in place."""
    settings.audio_clock = AudioClock(settings.audio_clock.value).to_44khz()
    settings.frequencies.audio = settings.audio_clock.mclk()


def install():
    """Use the generators below for every platform with an internal audio PLL."""
    swap = {pll.TiliquaDomainGenerator2PLLs: DomainGenerator2PLLs,
            pll.TiliquaDomainGenerator4PLLs: DomainGenerator4PLLs}
    for cls in vars(tiliqua_platform).values():
        gen = getattr(cls, "clock_domain_generator", None)
        if isinstance(cls, type) and gen in swap:
            cls.clock_domain_generator = swap[gen]


class DomainGenerator2PLLs(pll.TiliquaDomainGenerator2PLLs):

    """
    Top-level clocks and resets for Tiliqua platform with 2 PLLs available:

    sync, usb: 60 MHz (Main clock)
    fast:      120 MHz (PSRAM DDR clock)
    audio:     12.5 MHz or 50 MHz (audio CODEC master clock, divide by 256 for CODEC sample rate)
    dvi/dvi5x: video clocks, depend on resolution passed with `--resolution` flag.

    """

    def __init__(self, settings: ClockSettings):
        super().__init__()
        self.settings = settings

    def elaborate(self, platform):
        m = Module()

        if self.settings.frequencies.dvi is not None:
            print(f"PLL configured for STATIC video mode: {self.settings.modeline}.")

        # Create our domains.
        m.domains.sync   = ClockDomain()
        m.domains.usb    = ClockDomain()
        m.domains.fast   = ClockDomain()
        m.domains.audio  = ClockDomain()
        m.domains.raw48  = ClockDomain()

        clk48 = platform.request(platform.default_clk, dir='i').i
        reset  = Signal(init=0)

        # ecppll -i 48 --clkout0 60 --clkout1 120 --clkout2 50 --reset -f pll60.v
        # 60MHz for USB (currently also sync domain. fast is for DQS)

        m.d.comb += [
            ClockSignal("raw48").eq(clk48),
        ]

        clkos2_dividers = {
            AudioClock.COARSE_48KHZ:  48,
            AudioClock.COARSE_192KHZ: 12,
            AudioClock.COARSE_44KHZ:  53,
        }
        # With 2 PLLs only coarse audio clocks are supported.
        assert self.settings.audio_clock in clkos2_dividers.keys()

        feedback60 = Signal()
        locked60   = Signal()
        m.submodules.pll = Instance("EHXPLLL",

                # Clock in.
                i_CLKI=clk48,

                # Generated clock outputs.
                o_CLKOP=feedback60,
                o_CLKOS=ClockSignal("fast"),
                o_CLKOS2=ClockSignal("audio"),

                # Status.
                o_LOCK=locked60,

                # PLL parameters...
                p_PLLRST_ENA="ENABLED",
                p_INTFB_WAKE="DISABLED",
                p_STDBY_ENABLE="DISABLED",
                p_DPHASE_SOURCE="DISABLED",
                p_OUTDIVIDER_MUXA="DIVA",
                p_OUTDIVIDER_MUXB="DIVB",
                p_OUTDIVIDER_MUXC="DIVC",
                p_OUTDIVIDER_MUXD="DIVD",
                p_CLKI_DIV=4,
                p_CLKOP_ENABLE="ENABLED",
                p_CLKOP_DIV=10,
                p_CLKOP_CPHASE=4,
                p_CLKOP_FPHASE=0,
                p_CLKOS_ENABLE="ENABLED",
                p_CLKOS_DIV=5,
                p_CLKOS_CPHASE=4,
                p_CLKOS_FPHASE=0,
                p_CLKOS2_ENABLE="ENABLED",
                p_CLKOS2_DIV=clkos2_dividers[self.settings.audio_clock],
                p_CLKOS2_CPHASE=4,
                p_CLKOS2_FPHASE=0,
                p_FEEDBK_PATH="CLKOP",
                p_CLKFB_DIV=5,

                # Internal feedback.
                i_CLKFB=feedback60,

                # Control signals.
                i_RST=reset,
                i_PHASESEL0=0,
                i_PHASESEL1=0,
                i_PHASEDIR=1,
                i_PHASESTEP=1,
                i_PHASELOADREG=1,
                i_STDBY=0,
                i_PLLWAKESYNC=0,

                # Output Enables.
                i_ENCLKOP=0,
                i_ENCLKOS=0,
                i_ENCLKOS2=0,
                i_ENCLKOS3=0,

                # Synthesis attributes.
                a_ICP_CURRENT="12",
                a_LPF_RESISTOR="8"
        )

        # Video PLL and derived signals

        if self.settings.modeline is not None:

            m.domains.dvi   = ClockDomain()
            m.domains.dvi5x = ClockDomain()

            feedback_dvi = Signal()
            locked_dvi   = Signal()

            pll_settings = DVIPLL.get(self.settings.modeline.pixel_clk_mhz)
            m.submodules.pll_dvi = create_dvi_pll(pll_settings, clk48,
                                                  reset, feedback_dvi, locked_dvi)

            m.d.comb += [
                ResetSignal("dvi")  .eq(~locked_dvi),
                ResetSignal("dvi5x").eq(~locked_dvi),
            ]

        # Derived clocks and resets
        m.d.comb += [
            ClockSignal("sync")  .eq(feedback60),
            ClockSignal("usb")   .eq(feedback60),

            ResetSignal("sync")  .eq(~locked60),
            ResetSignal("fast")  .eq(~locked60),
            ResetSignal("usb")   .eq(~locked60),
            ResetSignal("audio") .eq(~locked60),
        ]


        return m


class DomainGenerator4PLLs(pll.TiliquaDomainGenerator4PLLs):
    """
    Top-level clocks and resets for Tiliqua platform with 4 PLLs available:

    sync, usb: 60 MHz (Main clock)
    fast:      120 MHz (PSRAM DDR clock)
    audio:     12.288 MHz or 49.152 MHz (*hires* audio CODEC master clock, divide by 256 for CODEC sample rate)
    dvi/dvi5x: video clocks, depend on resolution passed with `--resolution` flag.
    """

    def __init__(self, settings: ClockSettings):
        super().__init__()
        self.settings = settings

    def elaborate(self, platform):
        m = Module()

        if self.settings.frequencies.dvi is not None:
            print(f"PLL configured for STATIC video mode: {self.settings.modeline}.")

        # Create our domains.
        m.domains.sync   = ClockDomain()
        m.domains.usb    = ClockDomain()
        m.domains.fast   = ClockDomain()
        m.domains.audio  = ClockDomain()
        m.domains.raw48  = ClockDomain()

        clk48 = platform.request(platform.default_clk, dir='i').i
        reset  = Signal(init=0)

        m.d.comb += [
            ClockSignal("raw48").eq(clk48),
        ]

        feedback60 = Signal()
        locked60   = Signal()
        m.submodules.pll = Instance("EHXPLLL",

                # Clock in.
                i_CLKI=clk48,

                # Generated clock outputs.
                o_CLKOP=feedback60,
                o_CLKOS=ClockSignal("fast"),

                # Status.
                o_LOCK=locked60,

                # PLL parameters...
                p_PLLRST_ENA="ENABLED",
                p_INTFB_WAKE="DISABLED",
                p_STDBY_ENABLE="DISABLED",
                p_DPHASE_SOURCE="DISABLED",
                p_OUTDIVIDER_MUXA="DIVA",
                p_OUTDIVIDER_MUXB="DIVB",
                p_OUTDIVIDER_MUXC="DIVC",
                p_OUTDIVIDER_MUXD="DIVD",
                p_CLKI_DIV=4,
                p_CLKOP_ENABLE="ENABLED",
                p_CLKOP_DIV=10,
                p_CLKOP_CPHASE=4,
                p_CLKOP_FPHASE=0,
                p_CLKOS_ENABLE="ENABLED",
                p_CLKOS_DIV=5,
                p_CLKOS_CPHASE=4,
                p_CLKOS_FPHASE=0,
                p_FEEDBK_PATH="CLKOP",
                p_CLKFB_DIV=5,

                # Internal feedback.
                i_CLKFB=feedback60,

                # Control signals.
                i_RST=reset,
                i_PHASESEL0=0,
                i_PHASESEL1=0,
                i_PHASEDIR=1,
                i_PHASESTEP=1,
                i_PHASELOADREG=1,
                i_STDBY=0,
                i_PLLWAKESYNC=0,

                # Output Enables.
                i_ENCLKOP=0,
                i_ENCLKOS=0,
                i_ENCLKOS2=0,
                i_ENCLKOS3=0,

                # Synthesis attributes.
                a_ICP_CURRENT="12",
                a_LPF_RESISTOR="8"
        )

        if self.settings.modeline is not None:

            m.domains.dvi   = ClockDomain()
            m.domains.dvi5x = ClockDomain()

            feedback_dvi = Signal()
            locked_dvi   = Signal()
            pll_settings = DVIPLL.get(self.settings.modeline.pixel_clk_mhz)
            m.submodules.pll_dvi = create_dvi_pll(pll_settings, clk48,
                                                  reset, feedback_dvi, locked_dvi)

            m.d.comb += [
                ResetSignal("dvi")  .eq(~locked_dvi),
                ResetSignal("dvi5x").eq(~locked_dvi),
            ]

        # With 4 PLLs available we can afford another high-res PLL for
        # the audio domains.
        feedback_audio  = Signal()
        locked_audio    = Signal()
        if self.settings.audio_clock == AudioClock.FINE_192KHZ:
            # 49.152MHz for 256*Fs Audio domain (192KHz Fs)
            # ecppll -i 48 --clkout0 49.152 --highres --reset -f pll2.v
            m.submodules.audio_pll = Instance("EHXPLLL",
                    # Status.
                    o_LOCK=locked_audio,
                    # PLL parameters...
                    p_PLLRST_ENA="ENABLED",
                    p_INTFB_WAKE="DISABLED",
                    p_STDBY_ENABLE="DISABLED",
                    p_DPHASE_SOURCE="DISABLED",
                    p_OUTDIVIDER_MUXA="DIVA",
                    p_OUTDIVIDER_MUXB="DIVB",
                    p_OUTDIVIDER_MUXC="DIVC",
                    p_OUTDIVIDER_MUXD="DIVD",
                    p_CLKI_DIV = 13,
                    p_CLKOP_ENABLE = "ENABLED",
                    p_CLKOP_DIV = 71,
                    p_CLKOP_CPHASE = 9,
                    p_CLKOP_FPHASE = 0,
                    p_CLKOS_ENABLE = "ENABLED",
                    p_CLKOS_DIV = 16,
                    p_CLKOS_CPHASE = 0,
                    p_CLKOS_FPHASE = 0,
                    p_FEEDBK_PATH = "CLKOP",
                    p_CLKFB_DIV = 3,
                    # Clock in.
                    i_CLKI=clk48,
                    # Internal feedback.
                    i_CLKFB=feedback_audio,
                    # Control signals.
                    i_RST=reset,
                    i_PHASESEL0=0,
                    i_PHASESEL1=0,
                    i_PHASEDIR=1,
                    i_PHASESTEP=1,
                    i_PHASELOADREG=1,
                    i_STDBY=0,
                    i_PLLWAKESYNC=0,
                    # Output Enables.
                    i_ENCLKOP=0,
                    i_ENCLKOS2=0,
                    # Generated clock outputs.
                    o_CLKOP=feedback_audio,
                    o_CLKOS=ClockSignal("audio"),
                    a_ICP_CURRENT="12",
                    a_LPF_RESISTOR="8",
                    a_MFG_ENABLE_FILTEROPAMP="1",
                    a_MFG_GMCREF_SEL="2"
            )
        elif self.settings.audio_clock == AudioClock.FINE_48KHZ:
            # 12.288MHz for 256*Fs Audio domain (48KHz Fs)
            # ecppll -i 48 --clkout0 12.288 --highres --reset -f pll2.v
            m.submodules.audio_pll = Instance("EHXPLLL",
                    # Status.
                    o_LOCK=locked_audio,
                    # PLL parameters...
                    p_PLLRST_ENA="ENABLED",
                    p_INTFB_WAKE="DISABLED",
                    p_STDBY_ENABLE="DISABLED",
                    p_DPHASE_SOURCE="DISABLED",
                    p_OUTDIVIDER_MUXA="DIVA",
                    p_OUTDIVIDER_MUXB="DIVB",
                    p_OUTDIVIDER_MUXC="DIVC",
                    p_OUTDIVIDER_MUXD="DIVD",
                    p_CLKI_DIV = 5,
                    p_CLKOP_ENABLE = "ENABLED",
                    p_CLKOP_DIV = 32,
                    p_CLKOP_CPHASE = 9,
                    p_CLKOP_FPHASE = 0,
                    p_CLKOS_ENABLE = "ENABLED",
                    p_CLKOS_DIV = 50,
                    p_CLKOS_CPHASE = 0,
                    p_CLKOS_FPHASE = 0,
                    p_FEEDBK_PATH = "CLKOP",
                    p_CLKFB_DIV = 2,
                    # Clock in.
                    i_CLKI=clk48,
                    # Internal feedback.
                    i_CLKFB=feedback_audio,
                    # Control signals.
                    i_RST=reset,
                    i_PHASESEL0=0,
                    i_PHASESEL1=0,
                    i_PHASEDIR=1,
                    i_PHASESTEP=1,
                    i_PHASELOADREG=1,
                    i_STDBY=0,
                    i_PLLWAKESYNC=0,
                    # Output Enables.
                    i_ENCLKOP=0,
                    i_ENCLKOS2=0,
                    # Generated clock outputs.
                    o_CLKOP=feedback_audio,
                    o_CLKOS=ClockSignal("audio"),
                    a_ICP_CURRENT="12",
                    a_LPF_RESISTOR="8",
                    a_MFG_ENABLE_FILTEROPAMP="1",
                    a_MFG_GMCREF_SEL="2"
            )
        elif self.settings.audio_clock == AudioClock.FINE_44KHZ:
            # 11.2896MHz (11.2899 actual) for 256*Fs Audio domain (44.1KHz Fs)
            # ecppll -i 48 --clkout0 11.2896 --highres --reset -f pll2.v
            m.submodules.audio_pll = Instance("EHXPLLL",
                    # Status.
                    o_LOCK=locked_audio,
                    # PLL parameters...
                    p_PLLRST_ENA="ENABLED",
                    p_INTFB_WAKE="DISABLED",
                    p_STDBY_ENABLE="DISABLED",
                    p_DPHASE_SOURCE="DISABLED",
                    p_OUTDIVIDER_MUXA="DIVA",
                    p_OUTDIVIDER_MUXB="DIVB",
                    p_OUTDIVIDER_MUXC="DIVC",
                    p_OUTDIVIDER_MUXD="DIVD",
                    p_CLKI_DIV = 13,
                    p_CLKOP_ENABLE = "ENABLED",
                    p_CLKOP_DIV = 3,
                    p_CLKOP_CPHASE = 9,
                    p_CLKOP_FPHASE = 0,
                    p_CLKOS_ENABLE = "ENABLED",
                    p_CLKOS_DIV = 52,
                    p_CLKOS_CPHASE = 0,
                    p_CLKOS_FPHASE = 0,
                    p_FEEDBK_PATH = "CLKOP",
                    p_CLKFB_DIV = 53,
                    # Clock in.
                    i_CLKI=clk48,
                    # Internal feedback.
                    i_CLKFB=feedback_audio,
                    # Control signals.
                    i_RST=reset,
                    i_PHASESEL0=0,
                    i_PHASESEL1=0,
                    i_PHASEDIR=1,
                    i_PHASESTEP=1,
                    i_PHASELOADREG=1,
                    i_STDBY=0,
                    i_PLLWAKESYNC=0,
                    # Output Enables.
                    i_ENCLKOP=0,
                    i_ENCLKOS2=0,
                    # Generated clock outputs.
                    o_CLKOP=feedback_audio,
                    o_CLKOS=ClockSignal("audio"),
                    a_ICP_CURRENT="12",
                    a_LPF_RESISTOR="8",
                    a_MFG_ENABLE_FILTEROPAMP="1",
                    a_MFG_GMCREF_SEL="2"
            )
        else:
            raise ValueError("Unsupported audio PLL requested.")

        # Derived clocks and resets
        m.d.comb += [
            ClockSignal("sync")  .eq(feedback60),
            ClockSignal("usb")   .eq(feedback60),

            ResetSignal("sync")  .eq(~locked60),
            ResetSignal("fast")  .eq(~locked60),
            ResetSignal("usb")   .eq(~locked60),
            ResetSignal("audio") .eq(~locked_audio),
        ]

        return m
