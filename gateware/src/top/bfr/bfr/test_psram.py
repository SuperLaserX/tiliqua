"""WidePsramPeripheral: narrow masters unchanged, wide masters reach the upper half.

Run from src/top/bfr: python -m pytest bfr/test_psram.py
"""

from amaranth import *
from amaranth.sim import Simulator
from amaranth_soc import wishbone

from tiliqua.platform import SoldierCrabR3Platform

from .psram import BusMonitor, WidePsramPeripheral, _Arbiter, wide_psram


class FakePlatform:
    """Enough of a platform for the peripheral's simulation path (fake PHY)."""
    psram_id = SoldierCrabR3Platform.psram_id
    psram_registers = SoldierCrabR3Platform.psram_registers


def test_widths():
    p = WidePsramPeripheral(size=16 << 20)
    assert p.bus.addr_width == 22                       # CPU window: 16 MB of words
    assert p.wide_bus_signature.addr_width == 23        # 32 MB
    assert p.shared_bus.addr_width == 23


def test_wide_psram_context():
    from tiliqua import tiliqua_soc
    stock = tiliqua_soc.psram
    with wide_psram():
        assert isinstance(tiliqua_soc.psram.Peripheral(size=16 << 20), WidePsramPeripheral)
    assert tiliqua_soc.psram is stock


def test_masters_reach_their_addresses():
    """The arbiter's output (which the controller turns into `adr << 2`) carries
    a narrow master's address unchanged and a wide master's into the upper half.

    The controller itself can't be exercised here: its PHY training doesn't
    complete against the simulation fake, so the full path to the chip is a
    hardware test.
    """
    dut = WidePsramPeripheral(size=16 << 20)
    narrow = dut.bus.signature.flip().create()   # like the framebuffer's port
    wide = dut.wide_bus_signature.create()
    dut.add_master(narrow)
    dut.add_master(wide)
    m = Module()
    m.submodules.dut = dut
    frag = Fragment.get(m, FakePlatform())
    seen = []

    async def bench(ctx):
        for bus, adr in ((narrow, 0x3FFFFF), (wide, 0x500000), (dut.bus, 0x123456)):
            ctx.set(bus.cyc, 1)
            ctx.set(bus.stb, 1)
            ctx.set(bus.adr, adr)
            ctx.set(bus.cti, wishbone.CycleType.INCR_BURST)
            ctx.set(bus.bte, wishbone.BurstTypeExt.WRAP_4)
            for _ in range(3):
                await ctx.tick()
            sb = dut.shared_bus
            seen.append((ctx.get(sb.cyc), ctx.get(sb.adr)))
            # Bursts reach the controller as bursts.
            assert ctx.get(sb.cti) == wishbone.CycleType.INCR_BURST.value
            assert ctx.get(sb.bte) == wishbone.BurstTypeExt.WRAP_4.value
            ctx.set(bus.cyc, 0)
            ctx.set(bus.stb, 0)
            ctx.set(bus.cti, 0)
            await ctx.tick()

    sim = Simulator(frag)
    sim.add_clock(1 / 60e6)
    sim.add_testbench(bench)
    sim.run()
    assert seen == [(1, 0x3FFFFF), (1, 0x500000), (1, 0x123456)]


def test_priority_master_wins_between_transactions():
    """The priority master gets the bus whenever it goes idle, and never cuts
    another master's transaction."""
    dut = WidePsramPeripheral(size=16 << 20)
    narrow = dut.bus.signature.flip().create()
    pri = dut.wide_bus_signature.create()
    dut.add_master(narrow)
    dut.add_priority_master(pri)
    m = Module()
    m.submodules.dut = dut
    frag = Fragment.get(m, FakePlatform())
    seen = []

    def req(ctx, bus, on, adr=0):
        ctx.set(bus.cyc, on)
        ctx.set(bus.stb, on)
        ctx.set(bus.adr, adr)

    async def owner(ctx, n=3):
        for _ in range(n):
            await ctx.tick()
        return ctx.get(dut.shared_bus.adr) if ctx.get(dut.shared_bus.cyc) else None

    async def bench(ctx):
        req(ctx, narrow, 1, 0x111)              # a long transaction starts
        seen.append(await owner(ctx))
        req(ctx, pri, 1, 0x400222)              # the priority master asks: it waits
        seen.append(await owner(ctx))
        req(ctx, narrow, 0)                     # the transaction ends: priority next
        seen.append(await owner(ctx))
        req(ctx, narrow, 1, 0x333)              # the other asks again: it waits
        seen.append(await owner(ctx))
        req(ctx, pri, 0)
        seen.append(await owner(ctx))

    sim = Simulator(frag)
    sim.add_clock(1 / 60e6)
    sim.add_testbench(bench)
    sim.run()
    assert seen == [0x111, 0x111, 0x400222, 0x400222, 0x333]


def test_priority_master_keeps_bus_while_pending():
    """Between its own bursts the priority master drops cyc; while `pending`
    is high the others still wait."""
    dut = WidePsramPeripheral(size=16 << 20)
    narrow = dut.bus.signature.flip().create()
    pri = dut.wide_bus_signature.create()
    pending = Signal()
    dut.add_master(narrow)
    dut.add_priority_master(pri, pending)
    m = Module()
    m.submodules.dut = dut
    frag = Fragment.get(m, FakePlatform())
    seen = []

    def req(ctx, bus, on, adr=0):
        ctx.set(bus.cyc, on)
        ctx.set(bus.stb, on)
        ctx.set(bus.adr, adr)

    async def owner(ctx, n=3):
        for _ in range(n):
            await ctx.tick()
        return ctx.get(dut.shared_bus.adr) if ctx.get(dut.shared_bus.cyc) else None

    async def bench(ctx):
        ctx.set(pending, 1)
        req(ctx, pri, 1, 0x400001)              # first burst
        seen.append(await owner(ctx))
        req(ctx, narrow, 1, 0x111)              # another master asks
        req(ctx, pri, 0)                        # gap between bursts, still pending
        seen.append(await owner(ctx))
        req(ctx, pri, 1, 0x400002)              # second burst
        seen.append(await owner(ctx))
        req(ctx, pri, 0)
        ctx.set(pending, 0)                     # done: the other master's turn
        seen.append(await owner(ctx))

    sim = Simulator(frag)
    sim.add_clock(1 / 60e6)
    sim.add_testbench(bench)
    sim.run()
    assert seen == [0x400001, None, 0x400002, 0x111]


def test_round_robin_and_monitor():
    """Two masters that always want the bus alternate per transaction, and the
    monitor accounts one of them (master 0) over a window. The arbiter alone:
    the controller can't run against the simulation fake."""
    dut = WidePsramPeripheral(size=16 << 20, monitor=True)
    b = dut.bus.signature.flip().create()
    dut.add_master(b)
    assert dut.master_names({b: "b"}) == ["m0", "b"]
    sig = dut.wide_bus_signature
    a = sig.create()
    b = sig.create()
    mon = BusMonitor(window_log2=7)
    sb = sig.create()
    arb = _Arbiter(sb, sig.features, mon)
    arb.masters += [a, b]
    m = Module()
    m.submodules.arb = arb
    m.submodules.mon = mon
    # A fake slave: acks a beat every 3 clocks.
    delay = Signal(2)
    with m.If(sb.cyc & sb.stb):
        m.d.sync += delay.eq(delay + 1)
        with m.If(delay == 2):
            m.d.comb += sb.ack.eq(1)
            m.d.sync += delay.eq(0)
    frag = Fragment.get(m, FakePlatform())
    grants = []

    def master(bus, adr):
        async def process(ctx):
            await run(ctx, bus, adr)
        return process

    async def run(ctx, bus, adr):
        while True:
            ctx.set(bus.cyc, 1)
            ctx.set(bus.stb, 1)
            ctx.set(bus.adr, adr)
            acks = 0
            while acks < 4:                     # 4-beat transactions
                ack = ctx.get(bus.ack)
                await ctx.tick()
                acks += ack
            ctx.set(bus.cyc, 0)
            ctx.set(bus.stb, 0)
            await ctx.tick()

    results = {}

    async def watch(ctx):
        last = None
        for _ in range(3 * 128 + 4):
            await ctx.tick()
            if ctx.get(sb.cyc) and ctx.get(sb.adr) != last:
                last = ctx.get(sb.adr)
                grants.append(last)
        results.update(
            seq=ctx.get(mon._result.f.seq.r_data), master=ctx.get(mon._result.f.master.r_data),
            hold=ctx.get(mon._hold.f.count.r_data), wait=ctx.get(mon._wait.f.count.r_data),
            words=ctx.get(mon._words.f.count.r_data), txns=ctx.get(mon._txns.f.count.r_data),
            longest=ctx.get(mon._longest.f.hold.r_data),
            longest_wait=ctx.get(mon._longest.f.wait.r_data))

    sim = Simulator(frag)
    sim.add_clock(1 / 60e6)
    sim.add_testbench(master(a, 0xA), background=True)
    sim.add_testbench(master(b, 0xB), background=True)
    sim.add_testbench(watch)
    sim.run()
    assert grants[:8] in ([0xA, 0xB] * 4, [0xB, 0xA] * 4), grants[:8]
    r = results
    assert r["seq"] == 3 and r["master"] == 0, r
    # 128 clocks: about half held, a 4-beat transaction is 12 clocks.
    assert 52 <= r["hold"] <= 68 and 44 <= r["wait"] <= 68, r
    assert 16 <= r["words"] <= 24 and 4 <= r["txns"] <= 6, r
    assert r["longest"] == 12 and 12 <= r["longest_wait"] <= 15, r
