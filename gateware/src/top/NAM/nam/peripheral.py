"""The NAM peripheral: the engine in the `fast` domain, its PSRAM master, the
audio path and the registers.

Each input sample from the codec starts the engine, when it is enabled and
idle (a sample arriving while it is still busy is an overrun: counted, and the
previous output repeats). Its output goes to OUT0 and OUT1; OUT2 carries the
dry input. With `bypass` the input goes straight to the outputs.

Registers (32-bit, byte addressed):

    0x00 twrite    the next 32-bit word of an entry, least significant first: a weight
                   row is five words (eight 18-bit lanes, 144 bits), a program word two
                   (36 bits), a ring entry two (46), an aux word or a stream position one
    0x04 tcommit   table (3): 0 weights, 1 aux, 2 program, 3 rings, 4 stream positions;
                   index (11). Puts the entry just written into the table.
    0x08 config    n_rings (6), n_segments (9), late_after (4), and the streams' geometry
                   as powers of two: words per frame (2), per burst (3), per PSRAM ring (5)
    0x0C ctrl      enable (1), bypass (1), clear (1, pulse), prefill (1, pulse)
    0x10 status    busy (1), late (1), clocks of the last sample (16)
    0x14 stats     longest sample in clocks since last read (16), overruns (8), samples (8)
    0x18 meters    input peak (16), output peak (16), held since last read

The tables are written while the engine is disabled; `clear` zeroes the
block-RAM history (and the write pointers follow table writes), `prefill`
fetches every read stream's first burst, then `enable` runs. The firmware
keeps its own copies of what it writes.
"""

from amaranth import *
from amaranth.lib import data, stream, wiring
from amaranth.lib.cdc import FFSynchronizer, PulseSynchronizer
from amaranth.lib.wiring import In, Out
from amaranth_soc import csr

from tiliqua.dsp import ASQ

from .engine import POS_BITS, Engine, RingEntry
from .streams import PsramMaster, bus_signature

N_CHANNELS = 4
TAB_WMEM, TAB_AUX, TAB_PROG, TAB_RING, TAB_POS = range(5)


class NamPeripheral(wiring.Component):

    class TWrite(csr.Register, access="w"):
        word: csr.Field(csr.action.W, unsigned(32))

    class TCommit(csr.Register, access="w"):
        table: csr.Field(csr.action.W, unsigned(3))
        index: csr.Field(csr.action.W, unsigned(11))

    class Config(csr.Register, access="w"):
        n_rings: csr.Field(csr.action.W, unsigned(6))
        n_segments: csr.Field(csr.action.W, unsigned(9))
        late_after: csr.Field(csr.action.W, unsigned(4))
        wpf_log2: csr.Field(csr.action.W, unsigned(2))
        burst_log2: csr.Field(csr.action.W, unsigned(3))
        ring_log2: csr.Field(csr.action.W, unsigned(5))

    class Ctrl(csr.Register, access="w"):
        enable: csr.Field(csr.action.W, unsigned(1))
        bypass: csr.Field(csr.action.W, unsigned(1))
        clear: csr.Field(csr.action.W, unsigned(1))
        prefill: csr.Field(csr.action.W, unsigned(1))

    class Status(csr.Register, access="r"):
        busy: csr.Field(csr.action.R, unsigned(1))
        late: csr.Field(csr.action.R, unsigned(1))
        clocks: csr.Field(csr.action.R, unsigned(16))

    class Stats(csr.Register, access="r"):
        clocks_max: csr.Field(csr.action.R, unsigned(16))
        overruns: csr.Field(csr.action.R, unsigned(8))
        samples: csr.Field(csr.action.R, unsigned(8))

    class Meters(csr.Register, access="r"):
        in_peak: csr.Field(csr.action.R, unsigned(16))
        out_peak: csr.Field(csr.action.R, unsigned(16))

    def __init__(self, addr_width=23, engine_domain="fast", hw_mult=True, **engine_args):
        self.engine_domain = engine_domain
        # The engine's `bus` domain (its stream buffers' bus side) is the SoC's `sync`.
        self.engine = Engine(host_domain="sync", bus_domain="bus", hw_mult=hw_mult, **engine_args)
        self.master = PsramMaster(addr_width=addr_width, engine_domain=engine_domain,
                                  sbuf_r_addr=len(self.engine.sbr_w.addr), sbuf_w_addr=len(self.engine.sbw_addr))
        regs = csr.Builder(addr_width=8, data_width=8)
        self._twrite = regs.add("twrite", self.TWrite(), offset=0x00)
        self._tcommit = regs.add("tcommit", self.TCommit(), offset=0x04)
        self._config = regs.add("config", self.Config(), offset=0x08)
        self._ctrl = regs.add("ctrl", self.Ctrl(), offset=0x0C)
        self._status = regs.add("status", self.Status(), offset=0x10)
        self._stats = regs.add("stats", self.Stats(), offset=0x14)
        self._meters = regs.add("meters", self.Meters(), offset=0x18)
        self._bridge = csr.Bridge(regs.as_memory_map())
        super().__init__({
            "csr_bus": In(csr.Signature(addr_width=regs.addr_width, data_width=regs.data_width)),
            "bus": Out(bus_signature(addr_width)),
            "pending": Out(1),
            "i": In(stream.Signature(data.ArrayLayout(ASQ, N_CHANNELS))),
            "o": Out(stream.Signature(data.ArrayLayout(ASQ, N_CHANNELS))),
        })
        self.csr_bus.memory_map = self._bridge.bus.memory_map

    def elaborate(self, platform):
        m = Module()
        ed = self.engine_domain
        m.submodules.bridge = self._bridge
        m.submodules.engine = eng = DomainRenamer({"sync": ed, "bus": "sync"})(self.engine)
        m.submodules.master = master = self.master
        wiring.connect(m, wiring.flipped(self.csr_bus), self._bridge.bus)
        wiring.connect(m, master.bus, wiring.flipped(self.bus))
        wiring.connect(m, eng.req, master.req)
        m.d.comb += [eng.xfer_done.eq(master.done), eng.sbr_w.eq(master.sbr_w),
                     eng.sbw_addr.eq(master.sbw_addr), master.sbw_data.eq(eng.sbw_data)]
        m.d.comb += self.pending.eq(master.pending)

        def held(field, target):
            with m.If(field.w_stb):
                m.d.sync += target.eq(field.w_data)

        # ---- tables ----------------------------------------------------------------
        # Words shift in from the top, so an entry of n words ends up in the top n
        # words: each table takes its slice from there, whatever came before.
        sr = Signal(5 * 32)
        with m.If(self._twrite.f.word.w_stb):
            m.d.sync += sr.eq(Cat(sr[32:], self._twrite.f.word.w_data))
        table = Signal(3)
        index = Signal(11)
        commit = Signal()
        m.d.sync += commit.eq(self._tcommit.f.table.w_stb)
        held(self._tcommit.f.table, table)
        held(self._tcommit.f.index, index)

        def top(words, width):
            return sr[160 - 32 * words:160 - 32 * words + width]

        m.d.comb += [
            eng.wmem_w.addr.eq(index), eng.wmem_w.data.eq(top(5, len(eng.wmem_w.data))),
            eng.wmem_w.en.eq(commit & (table == TAB_WMEM)),
            eng.aux_w.addr.eq(index), eng.aux_w.data.eq(top(1, len(eng.aux_w.data))),
            eng.aux_w.en.eq(commit & (table == TAB_AUX)),
            eng.prog_w.addr.eq(index), eng.prog_w.data.eq(top(2, len(eng.prog_w.data))),
            eng.prog_w.en.eq(commit & (table == TAB_PROG)),
            eng.ring_w.addr.eq(index), eng.ring_w.data.eq(top(2, RingEntry.size)),
            eng.ring_w.en.eq(commit & (table == TAB_RING)),
            eng.pos_w.addr.eq(index), eng.pos_w.data.eq(top(1, POS_BITS)),
            eng.pos_w.en.eq(commit & (table == TAB_POS)),
        ]

        # ---- configuration and control -----------------------------------------------
        n_rings = Signal(6)
        n_segments = Signal(9)
        late_after = Signal(4)
        wpf_log2 = Signal(2)
        burst_log2 = Signal(3)
        ring_log2 = Signal(5)
        enable = Signal()
        bypass = Signal()
        cfg = self._config.f
        held(cfg.n_rings, n_rings)
        held(cfg.n_segments, n_segments)
        held(cfg.late_after, late_after)
        held(cfg.wpf_log2, wpf_log2)
        held(cfg.burst_log2, burst_log2)
        held(cfg.ring_log2, ring_log2)
        held(self._ctrl.f.enable, enable)
        held(self._ctrl.f.bypass, bypass)
        # (quasi-static: only changed while the engine is disabled)
        m.d.comb += [eng.n_rings_used.eq(n_rings), eng.n_segments.eq(n_segments),
                     eng.late_after.eq(late_after), eng.wpf_log2.eq(wpf_log2),
                     eng.burst_log2.eq(burst_log2), eng.ring_log2.eq(ring_log2)]

        m.submodules.clear_ps = clear_ps = PulseSynchronizer("sync", ed)
        m.submodules.prefill_ps = prefill_ps = PulseSynchronizer("sync", ed)
        m.submodules.start_ps = start_ps = PulseSynchronizer("sync", ed)
        m.submodules.done_ps = done_ps = PulseSynchronizer(ed, "sync")
        busy_sync = Signal()
        late_sync = Signal()
        m.submodules.busy_ff = FFSynchronizer(eng.busy, busy_sync, o_domain="sync")
        m.submodules.late_ff = FFSynchronizer(eng.late, late_sync, o_domain="sync")
        # (the pulses registered in the engine's domain: the synchronisers sit by the
        # registers they come from, the engine's control a long way off)
        clear_q, prefill_q, start_q = Signal(), Signal(), Signal()
        m.d[ed] += [clear_q.eq(clear_ps.o), prefill_q.eq(prefill_ps.o), start_q.eq(start_ps.o)]
        m.d.comb += [
            clear_ps.i.eq(self._ctrl.f.clear.w_stb & self._ctrl.f.clear.w_data),
            prefill_ps.i.eq(self._ctrl.f.prefill.w_stb & self._ctrl.f.prefill.w_data),
            eng.clear.eq(clear_q), eng.prefill.eq(prefill_q), eng.start.eq(start_q),
            done_ps.i.eq(eng.done),
        ]

        # ---- audio -----------------------------------------------------------------------
        adc = Signal(signed(16))
        dry = Signal(signed(16))
        wet = Signal(signed(16))
        in_flight = Signal()            # a sample is in the engine
        overruns = Signal(8)
        samples = Signal(8)
        clocks_max = Signal(16)
        in_peak = Signal(16)
        out_peak = Signal(16)
        m.d.comb += [self.i.ready.eq(1), eng.adc.eq(adc)]
        new_sample = Signal()
        with m.If(self.i.valid):
            m.d.sync += [adc.eq(self.i.payload[0].as_value()), dry.eq(self.i.payload[0].as_value())]
            with m.If(enable & ~in_flight):
                m.d.comb += start_ps.i.eq(1)
                m.d.sync += in_flight.eq(1)
            with m.Elif(enable):
                m.d.sync += overruns.eq(overruns + 1)
                m.d.comb += new_sample.eq(1)      # repeat the last output
            with m.Else():
                m.d.comb += new_sample.eq(1)
        with m.If(done_ps.o):
            m.d.sync += [in_flight.eq(0), wet.eq(eng.out), samples.eq(samples + 1)]
            m.d.comb += new_sample.eq(1)
            with m.If(eng.clocks > clocks_max):
                m.d.sync += clocks_max.eq(eng.clocks)
        with m.If(~enable):
            m.d.sync += in_flight.eq(0)

        out = Signal(signed(16))
        m.d.comb += out.eq(Mux(bypass, dry, Mux(enable, wet, 0)))
        # The next output: offered until the DAC takes it (it keeps up).
        pending_out = Signal()
        with m.If(new_sample):
            m.d.sync += pending_out.eq(1)
        m.d.comb += [
            self.o.payload[0].as_value().eq(out), self.o.payload[1].as_value().eq(out),
            self.o.payload[2].as_value().eq(dry), self.o.payload[3].as_value().eq(0),
            self.o.valid.eq(pending_out),
        ]
        with m.If(self.o.valid & self.o.ready & ~new_sample):
            m.d.sync += pending_out.eq(0)

        def peak(sig, value):
            mag = Signal(16)
            m.d.comb += mag.eq(Mux(value < 0, -value, value))
            with m.If(mag > sig):
                m.d.sync += sig.eq(mag)

        with m.If(self.i.valid):
            peak(in_peak, self.i.payload[0].as_value().as_signed())
        with m.If(done_ps.o):
            peak(out_peak, eng.out)

        # ---- status ----------------------------------------------------------------------
        st = self._status.f
        m.d.comb += [st.busy.r_data.eq(busy_sync | in_flight), st.late.r_data.eq(late_sync),
                     st.clocks.r_data.eq(eng.clocks)]
        sf = self._stats.f
        m.d.comb += [sf.clocks_max.r_data.eq(clocks_max), sf.overruns.r_data.eq(overruns),
                     sf.samples.r_data.eq(samples)]
        with m.If(sf.clocks_max.r_stb):
            m.d.sync += [clocks_max.eq(0), overruns.eq(0)]
        mf = self._meters.f
        m.d.comb += [mf.in_peak.r_data.eq(in_peak), mf.out_peak.r_data.eq(out_peak)]
        with m.If(mf.in_peak.r_stb):
            m.d.sync += [in_peak.eq(0), out_peak.eq(0)]
        return m
