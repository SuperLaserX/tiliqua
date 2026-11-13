"""Project-local overrides that take stock SoC parts out of the NAM build, to fit.

`TiliquaSoc` with the USB host and the engine is more than the ECP5-25 holds
(README, "Fitting"). These context managers swap what `tiliqua_soc` builds
during `__init__`, as `nam/psram.py`'s `wide_psram()` does, so no shared code
changes:

- `no_spiflash()`: no SPI flash controller, memory-mapped reader or PHY. The
  CPU's flash window and the `spiflash_ctrl` registers still exist (the memory
  map, the cached CPU netlist and the PAC keep their shape) but nothing is
  behind them: the window reads zeros, the registers do nothing, and the
  flash's pins idle (chip select off). NAM keeps its settings in a file on
  the USB drive instead of the slot's option storage. About 1,150 LUTs.

- `no_uart()`: no debug UART (the user's choice, 2026-11-12, for timing headroom:
  about 400 LUTs). A stub keeps its registers and pins: transmit always reads
  ready and bytes go nowhere, so the firmware's log is a no-op; nothing is
  received; TX idles high.

- `small_mainram(size)`: the CPU's block RAM is `size` bytes while the CPU is
  still told 32 KB (its regions are part of the cached netlist's key; past
  `size` there is nothing, as past the end of any RAM). The firmware's data,
  heap and stack get `size`: the linker script follows the memory map. Each
  2 KB is one block RAM.
"""

import contextlib
import types

from amaranth import *
from amaranth.lib import wiring
from amaranth.lib.wiring import In, Out
from amaranth.utils import exact_log2
from amaranth_soc import csr, wishbone
from amaranth_soc.memory import MemoryMap
from luna_soc.gateware.core.spiflash.phy import SPIPinSignature

__all__ = ["no_spiflash", "no_uart", "small_mainram", "NoFlashPhy", "NoFlashPeripheral", "NoUart"]


class NoFlashPhy(wiring.Component):
    """In place of `SPIPHYController`: the pins, left idle (every output zero: chip
    select off, clock low, data not driven)."""

    pins: Out(SPIPinSignature())

    def __init__(self, data_width=32, divisor=0, domain="sync"):
        self._domain = domain
        super().__init__()

    def elaborate(self, platform):
        return Module()


class NoFlashPeripheral(wiring.Component):
    """In place of luna_soc's SPI flash `Peripheral`: the same two buses, nothing behind them.

    The registers are the stock controller's, where it has them (`tiliqua_hal`'s
    `impl_tiliqua_soc_pac!` builds a flash driver on them): writes go nowhere, `data`
    reads zero and `status` reads both FIFOs ready, so a stray flash access returns
    at once instead of waiting forever."""

    class Phy(csr.Register, access="rw"):
        length: csr.Field(csr.action.RW, unsigned(6))
        width: csr.Field(csr.action.RW, unsigned(4))
        mask: csr.Field(csr.action.RW, unsigned(8))

    class Cs(csr.Register, access="w"):
        select: csr.Field(csr.action.W, unsigned(1))

    class Status(csr.Register, access="r"):
        rx_ready: csr.Field(csr.action.R, unsigned(1))
        tx_ready: csr.Field(csr.action.R, unsigned(1))

    class Data(csr.Register, access="rw"):
        rx: csr.Field(csr.action.R, unsigned(32))
        tx: csr.Field(csr.action.W, unsigned(32))

    def __init__(self, phy, *, data_width=32, granularity=8, mmap_size=None, mmap_name=None, **_):
        self.phy = phy
        regs = csr.Builder(addr_width=5, data_width=8)
        regs.add("phy", self.Phy(), offset=0x00)
        regs.add("cs", self.Cs(), offset=0x04)
        self._status = regs.add("status", self.Status(), offset=0x05)
        regs.add("data", self.Data(), offset=0x08)
        self._bridge = csr.Bridge(regs.as_memory_map())
        depth = (mmap_size * granularity) // data_width
        super().__init__({
            "csr": In(csr.Signature(addr_width=regs.addr_width, data_width=regs.data_width)),
            "bus": In(wishbone.Signature(addr_width=exact_log2(depth), data_width=data_width,
                                         granularity=granularity)),
        })
        self.csr.memory_map = self._bridge.bus.memory_map
        mmap = MemoryMap(addr_width=exact_log2(mmap_size), data_width=granularity)
        mmap.add_resource(self, name=("memory", mmap_name), size=mmap_size)
        self.bus.memory_map = mmap

    def elaborate(self, platform):
        m = Module()
        m.submodules.bridge = self._bridge
        wiring.connect(m, wiring.flipped(self.csr), self._bridge.bus)
        m.d.comb += [self._status.f.rx_ready.r_data.eq(1), self._status.f.tx_ready.r_data.eq(1)]
        # The window: each access is acknowledged the next cycle, with zeros.
        with m.If(self.bus.cyc & self.bus.stb & ~self.bus.ack):
            m.d.sync += self.bus.ack.eq(1)
        with m.Else():
            m.d.sync += self.bus.ack.eq(0)
        return m


@contextlib.contextmanager
def no_spiflash():
    """Within this block, `TiliquaSoc` builds the stubs above instead of the SPI flash parts.
    (Its `elaborate` still connects the stub's pins to the configuration flash provider.)"""
    from tiliqua import tiliqua_soc
    stock = tiliqua_soc.spiflash
    tiliqua_soc.spiflash = types.SimpleNamespace(
        SPIPHYController=NoFlashPhy, Peripheral=NoFlashPeripheral,
        ECP5ConfigurationFlashProvider=stock.ECP5ConfigurationFlashProvider)
    try:
        yield
    finally:
        tiliqua_soc.spiflash = stock


class NoUart(wiring.Component):
    """In place of luna_soc's UART `Peripheral`: its registers and pins, nothing behind
    them. `tx_ready` always reads ready and written bytes go nowhere, so the firmware's
    log costs nothing; nothing is ever received; the TX pin idles high."""

    class TxData(csr.Register, access="w"):
        data: csr.Field(csr.action.W, unsigned(8))

    class RxData(csr.Register, access="r"):
        data: csr.Field(csr.action.R, unsigned(8))

    class TxReady(csr.Register, access="r"):
        txe: csr.Field(csr.action.R, unsigned(1))

    class RxAvail(csr.Register, access="r"):
        rxe: csr.Field(csr.action.R, unsigned(1))

    class BaudRate(csr.Register, access="w"):
        div: csr.Field(csr.action.W, unsigned(24))

    def __init__(self, *, divisor):
        from luna_soc.gateware.core.uart import PinSignature
        regs = csr.Builder(addr_width=5, data_width=8)
        regs.add("tx_data", self.TxData(), offset=0x00)
        regs.add("rx_data", self.RxData(), offset=0x04)
        self._tx_ready = regs.add("tx_ready", self.TxReady(), offset=0x08)
        regs.add("rx_avail", self.RxAvail(), offset=0x0c)
        regs.add("divisor", self.BaudRate(), offset=0x10)
        self._bridge = csr.Bridge(regs.as_memory_map())
        super().__init__({
            "bus": In(csr.Signature(addr_width=regs.addr_width, data_width=regs.data_width)),
            "pins": Out(PinSignature()),
        })
        self.bus.memory_map = self._bridge.bus.memory_map

    def elaborate(self, platform):
        m = Module()
        m.submodules.bridge = self._bridge
        wiring.connect(m, wiring.flipped(self.bus), self._bridge.bus)
        m.d.comb += [self._tx_ready.f.txe.r_data.eq(1), self.pins.tx.o.eq(1), self.pins.tx.oe.eq(1)]
        return m


@contextlib.contextmanager
def no_uart():
    """Within this block, `TiliquaSoc` builds `NoUart` instead of the debug UART."""
    from tiliqua import tiliqua_soc
    stock = tiliqua_soc.uart
    tiliqua_soc.uart = types.SimpleNamespace(Peripheral=NoUart, PinSignature=stock.PinSignature)
    try:
        yield
    finally:
        tiliqua_soc.uart = stock


@contextlib.contextmanager
def small_mainram(size):
    """Within this block, `TiliquaSoc`'s main RAM is `size` bytes, whatever `mainram_size` says."""
    from tiliqua import tiliqua_soc
    stock = tiliqua_soc.blockram

    def peripheral(**kwargs):
        kwargs["size"] = size
        return stock.Peripheral(**kwargs)

    tiliqua_soc.blockram = types.SimpleNamespace(Peripheral=peripheral)
    try:
        yield
    finally:
        tiliqua_soc.blockram = stock
