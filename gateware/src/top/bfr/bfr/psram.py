"""The PSRAM peripheral with its DMA side widened to the whole chip, for bfr only.

`TiliquaSoc` maps 16 MB of the 32 MB APS256XXN (`psram_size`), and every
master of `tiliqua.periph.psram.Peripheral` shares that 16 MB window. This
subclass keeps the CPU's window and memory map as they are (the bootloader
expects `bootinfo` at its end) but replaces the internal arbiter with one
wide enough for the whole chip:

- masters added with the usual 16 MB signature (CPU, framebuffer, plotter,
  persistence) are zero-extended, so they see exactly what they saw before;
- masters with `wide_bus_signature` reach all 32 MB.

The arbiter is round-robin per transaction, like the stock one, except for
one priority master (`add_priority_master`): the other masters'
transactions are long (framebuffer bursts of up to 128 words, the
persistence effect's read-and-write pairs), while the bfr stream engine
needs several short bursts every sample. The priority master gets the bus
whenever the current transaction ends, and keeps it while its `pending`
signal says it has more queued, so a sample's bursts go back to back. No
transaction is ever cut short.

With `monitor=True`, `monitor` (`BusMonitor`) watches one master at a time:
how long it held the bus, waited for it, and what it moved. `master_names`
lists the masters in the monitor's numbering. (It found the dropped-burst
bug; it costs logic the SoC is short of, so it is off by default.)

Use it without touching shared code by constructing the SoC inside
`wide_psram()`, which hands `TiliquaSoc` this class instead of the stock one.
"""

import contextlib
import functools
import types

from amaranth import *
from amaranth.lib import wiring
from amaranth.lib.wiring import In, Out
from amaranth.utils import exact_log2
from amaranth_soc import csr, wishbone

from tiliqua.periph import psram

PSRAM_PHYS_SIZE = 32 << 20


def _feature_names(features):
    """Wishbone features as strings: a signature's `features` holds
    `wishbone.Feature` members, so `"cti" in sig.features` is always False.
    (That test once dropped cti, turning every burst into single-word
    transactions at about 18 clocks a word.)"""
    return {wishbone.Feature(f).value for f in features}


class BusMonitor(wiring.Component):
    """Bus statistics for one master, over windows of 2**`window_log2` clocks.

    The master is chosen with `select` and takes effect at the next window;
    when a window ends its results replace the previous ones and `result.seq`
    increments, with `result.master` the master they describe. All counts are
    clocks except `words` (acknowledged beats) and `txns` (times it got the
    bus); `longest` and `longest_wait` saturate.
    """

    class Select(csr.Register, access="rw"):
        master: csr.Field(csr.action.RW, unsigned(3))

    class Result(csr.Register, access="r"):
        seq:    csr.Field(csr.action.R, unsigned(8))
        master: csr.Field(csr.action.R, unsigned(3))

    class Count(csr.Register, access="r"):
        count: csr.Field(csr.action.R, unsigned(25))

    class Longest(csr.Register, access="r"):
        hold: csr.Field(csr.action.R, unsigned(16))
        wait: csr.Field(csr.action.R, unsigned(16))

    def __init__(self, window_log2=24):
        self.window_log2 = window_log2
        regs = csr.Builder(addr_width=5, data_width=8)
        self._select  = regs.add("select",  self.Select(),  offset=0x00)
        self._result  = regs.add("result",  self.Result(),  offset=0x04)
        self._hold    = regs.add("hold",    self.Count(),   offset=0x08)
        self._wait    = regs.add("wait",    self.Count(),   offset=0x0C)
        self._words   = regs.add("words",   self.Count(),   offset=0x10)
        self._txns    = regs.add("txns",    self.Count(),   offset=0x14)
        self._longest = regs.add("longest", self.Longest(), offset=0x18)
        self._bridge = csr.Bridge(regs.as_memory_map())
        super().__init__({
            "csr_bus": In(csr.Signature(addr_width=regs.addr_width, data_width=regs.data_width)),
            "select":  Out(3),          # the master watched in this window
            # The selected master: requesting, holding the bus, acknowledged.
            "cyc":     In(1),
            "granted": In(1),
            "ack":     In(1),
        })
        self.csr_bus.memory_map = self._bridge.bus.memory_map

    def elaborate(self, platform):
        m = Module()
        m.submodules.bridge = self._bridge
        wiring.connect(m, wiring.flipped(self.csr_bus), self._bridge.bus)

        window = Signal(self.window_log2)
        watched = Signal(3)
        hold, wait, words, txns = (Signal(25, name=n) for n in ("hold", "wait", "words", "txns"))
        run_hold, run_wait = Signal(16), Signal(16)
        max_hold, max_wait = Signal(16), Signal(16)
        was_holding = Signal()
        seq = Signal(8)

        holding = self.cyc & self.granted
        waiting = self.cyc & ~self.granted
        m.d.comb += self.select.eq(watched)
        m.d.sync += [window.eq(window + 1), was_holding.eq(holding)]

        def sat(x):
            return Mux(x == 0xFFFF, x, x + 1)

        new_hold = Mux(holding, sat(run_hold), 0)
        new_wait = Mux(waiting, sat(run_wait), 0)
        m.d.sync += [run_hold.eq(new_hold), run_wait.eq(new_wait)]

        with m.If(window == (1 << self.window_log2) - 1):
            r = self._result.f
            m.d.sync += [
                r.seq.r_data.eq(seq + 1), r.master.r_data.eq(watched), seq.eq(seq + 1),
                self._hold.f.count.r_data.eq(hold + holding),
                self._wait.f.count.r_data.eq(wait + waiting),
                self._words.f.count.r_data.eq(words + self.ack),
                self._txns.f.count.r_data.eq(txns + (holding & ~was_holding)),
                self._longest.f.hold.r_data.eq(Mux(new_hold > max_hold, new_hold, max_hold)),
                self._longest.f.wait.r_data.eq(Mux(new_wait > max_wait, new_wait, max_wait)),
                hold.eq(0), wait.eq(0), words.eq(0), txns.eq(0), max_hold.eq(0), max_wait.eq(0),
                watched.eq(self._select.f.master.data),
            ]
        with m.Else():
            m.d.sync += [
                hold.eq(hold + holding), wait.eq(wait + waiting), words.eq(words + self.ack),
                txns.eq(txns + (holding & ~was_holding)),
            ]
            with m.If(new_hold > max_hold):
                m.d.sync += max_hold.eq(new_hold)
            with m.If(new_wait > max_wait):
                m.d.sync += max_wait.eq(new_wait)
        return m


class _Arbiter(Elaboratable):
    """Round-robin over `masters` per transaction, `priority` first (see module doc)."""

    def __init__(self, shared_bus, features, monitor):
        self.bus = shared_bus
        self.features = _feature_names(features)
        self.monitor = monitor
        self.masters = []
        self.priority = self.pending = None

    def elaborate(self, platform):
        m = Module()
        sb = self.bus
        rr = self.masters
        n = len(rr)
        assert n > 0
        allm = rr + ([self.priority] if self.priority is not None else [])
        P = n                                   # the priority master's grant
        grant = Signal(range(len(allm)))
        last = Signal(range(n))                 # the round-robin's last grant

        cur_cyc = Array(b.cyc for b in allm)[grant]
        hold = cur_cyc
        if self.priority is not None:
            hold = cur_cyc | ((grant == P) & self.pending)
        with m.If(~hold):
            def round_robin():
                with m.Switch(last):
                    for r in range(n):
                        with m.Case(r):
                            # The first requester after the last grant wins.
                            for i in reversed([(r + k) % n for k in range(1, n + 1)]):
                                with m.If(rr[i].cyc):
                                    m.d.sync += [grant.eq(i), last.eq(i)]
            if self.priority is not None:
                with m.If(self.priority.cyc | self.pending):
                    m.d.sync += grant.eq(P)
                with m.Else():
                    round_robin()
            else:
                round_robin()

        outputs = ["cyc", "stb", "adr", "we", "sel", "dat_w"]
        outputs += [n for n in ("cti", "bte") if n in self.features]
        with m.Switch(grant):
            for i, b in enumerate(allm):
                with m.Case(i):
                    for name in outputs:
                        m.d.comb += getattr(sb, name).eq(getattr(b, name))
        for i, b in enumerate(allm):
            m.d.comb += [b.dat_r.eq(sb.dat_r), b.ack.eq(sb.ack & (grant == i))]

        mon = self.monitor
        if mon is None:
            return m
        sel = mon.select
        with m.Switch(sel):
            for i, b in enumerate(allm):
                with m.Case(i):
                    m.d.comb += [mon.cyc.eq(b.cyc), mon.granted.eq(grant == i), mon.ack.eq(b.ack)]
        return m


class WidePsramPeripheral(psram.Peripheral):

    def __init__(self, *, size, phys_size=PSRAM_PHYS_SIZE, monitor=False, **kwargs):
        super().__init__(size=size, **kwargs)
        if phys_size < size or phys_size & (phys_size - 1):
            raise ValueError(f"phys_size {phys_size:#x} must be a power of two >= size {size:#x}")
        self.phys_size = phys_size
        sig = self.bus.signature
        self.wide_bus_signature = wishbone.Signature(
            addr_width=exact_log2(phys_size * sig.granularity // sig.data_width),
            data_width=sig.data_width, granularity=sig.granularity, features=sig.features)
        self.monitor = BusMonitor() if monitor else None
        # The controller's side.
        self.shared_bus = self.wide_bus_signature.create()
        # Replaces the stock arbiter (the parent elaborates it as `arbiter`).
        self._hram_arbiter = _Arbiter(self.shared_bus, sig.features, self.monitor)
        self._widened = []
        self._sources = []                      # as added, for master_names
        self.add_master(self.bus)

    def _widen(self, narrow):
        wide = self.wide_bus_signature.create()
        self._widened.append((narrow, wide))
        return wide

    def add_master(self, bus):
        self._sources.append(bus)
        if bus.addr_width == self.wide_bus_signature.addr_width:
            self._hram_arbiter.masters.append(bus)
        else:
            self._hram_arbiter.masters.append(self._widen(bus))

    def add_priority_master(self, bus, pending=C(0)):
        """A wide master that gets the bus whenever a transaction ends, and
        keeps it while `pending` (one only)."""
        arb = self._hram_arbiter
        assert arb.priority is None and bus.addr_width == self.wide_bus_signature.addr_width
        arb.priority, arb.pending = bus, pending

    def master_names(self, known):
        """The monitor's numbering: `known` pairs buses (as added) with names."""
        known = list(known.items() if hasattr(known, "items") else known)
        names = [next((v for k, v in known if k is b), f"m{i}")
                 for i, b in enumerate(self._sources)]
        if self._hram_arbiter.priority is not None:
            p = self._hram_arbiter.priority
            names.append(next((v for k, v in known if k is p), "pri"))
        return names

    def elaborate(self, platform):
        m = super().elaborate(platform)
        if self.monitor is not None:
            m.submodules.monitor = self.monitor
        features = _feature_names(self.wide_bus_signature.features)
        assert {"cti", "bte"} <= features
        for narrow, wide in self._widened:
            m.d.comb += [
                wide.cyc.eq(narrow.cyc),
                wide.stb.eq(narrow.stb),
                wide.adr.eq(narrow.adr),        # zero-extended: the lower 16 MB
                wide.we.eq(narrow.we),
                wide.sel.eq(narrow.sel),
                wide.dat_w.eq(narrow.dat_w),
                narrow.dat_r.eq(wide.dat_r),
                narrow.ack.eq(wide.ack),
            ]
            for name in ("cti", "bte"):
                if name in features:
                    m.d.comb += getattr(wide, name).eq(getattr(narrow, name))
            if "err" in features:
                m.d.comb += narrow.err.eq(wide.err)
        return m


@contextlib.contextmanager
def wide_psram(phys_size=PSRAM_PHYS_SIZE, monitor=False):
    """Within this block, `TiliquaSoc` builds a `WidePsramPeripheral`."""
    from tiliqua import tiliqua_soc
    stock = tiliqua_soc.psram
    tiliqua_soc.psram = types.SimpleNamespace(
        Peripheral=functools.partial(WidePsramPeripheral, phys_size=phys_size, monitor=monitor))
    try:
        yield
    finally:
        tiliqua_soc.psram = stock
