"""The synthesizer's audio path and its registers.

Once per output sample, paced by the DAC's FIFO:

    MOD     the inputs, envelopes, LFOs and matrix (`mod.py`)
    OSC     both layers read their tables (`osc.py`)
    MIX     the layers crossfade into a mix, and each output picks what it carries

Registers, per layer 0x20 apart:

    0x00 table    base (16, in units of 256 bytes), frame_log2 (2, less 8), frames_m1 (10),
                  max_level (4): the band-limited levels there are to read, 0 until they are made
    0x04 ctrl     edge (2), stepped (1), raw (1), grain (2): the LFO whose cycles restart it

and:

    0x40 param_addr     where the next `param_data` goes (`model/modulation.py`, `write`)
    0x44 param_data
    0x48 routing        four outputs' selections (4 bits each), the two envelopes' VCA masks
                        (2 bits each), the CV jacks' switches (2 bits), how one layer modulates the
                        other (ring, pm, lock, modulator: `model/wavescan.py`)
    0x50 mon0 to 0x5C mon3              what the modulation is doing, for the screens
    0x60 scan0, 0x64 scan1              where each layer is reading: pos in Q4.12 of the table,
                                        shift in Q11.4 frames
    0x80 stats          the longest sample's computation in clocks since it was last read,
                        and a count of samples

The firmware keeps its own copies of what it writes: a smaller read multiplexer costs fewer
LUTs. Each register's bytes arrive together (the CSR bus's write shadow), so one register
changes atomically; that is why a table's address and shape are one register.
At reset everything is silent: every level is 0, and a silent layer reads nothing.
"""

from amaranth import *
from amaranth.lib import data, stream, wiring
from amaranth.lib.wiring import In, Out
from amaranth_soc import csr

from tiliqua.dsp import ASQ

from .fill import bus_signature
from .mod import ModEngine, multiplier
from .osc import WaveScanEngine

N_OUTPUTS = 4


class WaveScanPeripheral(wiring.Component):

    class Table(csr.Register, access="w"):
        base: csr.Field(csr.action.W, unsigned(16))
        frame_log2: csr.Field(csr.action.W, unsigned(2))
        frames_m1: csr.Field(csr.action.W, unsigned(10))
        max_level: csr.Field(csr.action.W, unsigned(4))

    class Ctrl(csr.Register, access="w"):
        edge: csr.Field(csr.action.W, unsigned(2))
        stepped: csr.Field(csr.action.W, unsigned(1))
        raw: csr.Field(csr.action.W, unsigned(1))
        grain: csr.Field(csr.action.W, unsigned(2))

    class ParamAddr(csr.Register, access="w"):
        addr: csr.Field(csr.action.W, unsigned(8))

    class ParamData(csr.Register, access="w"):
        data: csr.Field(csr.action.W, unsigned(32))

    class Routing(csr.Register, access="w"):
        outs: csr.Field(csr.action.W, unsigned(16))
        vca: csr.Field(csr.action.W, unsigned(4))
        patched: csr.Field(csr.action.W, unsigned(2))
        cross: csr.Field(csr.action.W, unsigned(4))

    class Monitor(csr.Register, access="r"):
        a: csr.Field(csr.action.R, unsigned(16))
        b: csr.Field(csr.action.R, unsigned(16))

    class MonitorStages(csr.Register, access="r"):
        lfo: csr.Field(csr.action.R, unsigned(16))
        stage0: csr.Field(csr.action.R, unsigned(3))
        stage1: csr.Field(csr.action.R, unsigned(3))
        gates: csr.Field(csr.action.R, unsigned(2))
        lfo2_phase: csr.Field(csr.action.R, unsigned(8))

    class MonitorProgress(csr.Register, access="r"):
        env0: csr.Field(csr.action.R, unsigned(8))
        env1: csr.Field(csr.action.R, unsigned(8))
        lfo0: csr.Field(csr.action.R, unsigned(8))
        lfo1: csr.Field(csr.action.R, unsigned(8))

    class MonitorScan(csr.Register, access="r"):
        pos: csr.Field(csr.action.R, unsigned(16))
        shift: csr.Field(csr.action.R, unsigned(16))

    class Stats(csr.Register, access="r"):
        clocks_max: csr.Field(csr.action.R, unsigned(16))
        samples: csr.Field(csr.action.R, unsigned(16))

    def __init__(self, n_layers=2, addr_width=23):
        assert n_layers == 2, "the modulation is built for two layers"
        self.n_layers = n_layers
        self.addr_width = addr_width
        self.engine = WaveScanEngine(n_layers=n_layers, addr_width=addr_width)
        self.modulation = ModEngine()
        # For the simulation's harness, which records it with each sample: this sample's
        # inputs, and the state it can't work out for itself. (Nothing reads it on hardware.)
        self.trace = Signal(data.StructLayout({
            "adc": data.ArrayLayout(unsigned(16), 4),
            "phase": data.ArrayLayout(unsigned(32), 2),
            "lfo_phase": data.ArrayLayout(unsigned(32), 3),
            "env_level": data.ArrayLayout(unsigned(32), 2),
            "max_level": data.ArrayLayout(unsigned(16), 2),
            "lfo_held": data.ArrayLayout(signed(32), 3),
            "lfsr": unsigned(32),
            "pos": data.ArrayLayout(signed(32), 2),
        }))
        regs = csr.Builder(addr_width=8, data_width=8)
        self._layers = []
        for i in range(n_layers):
            at = 0x20 * i
            self._layers.append({
                "table": regs.add(f"l{i}_table", self.Table(), offset=at + 0x00),
                "ctrl": regs.add(f"l{i}_ctrl", self.Ctrl(), offset=at + 0x04),
            })
        self._param_addr = regs.add("param_addr", self.ParamAddr(), offset=0x40)
        self._param_data = regs.add("param_data", self.ParamData(), offset=0x44)
        self._routing = regs.add("routing", self.Routing(), offset=0x48)
        self._mon0 = regs.add("mon0", self.Monitor(), offset=0x50)
        self._mon1 = regs.add("mon1", self.Monitor(), offset=0x54)
        self._mon2 = regs.add("mon2", self.MonitorStages(), offset=0x58)
        self._mon3 = regs.add("mon3", self.MonitorProgress(), offset=0x5C)
        self._scan = [regs.add(f"scan{i}", self.MonitorScan(), offset=0x60 + 4 * i) for i in range(n_layers)]
        self._stats = regs.add("stats", self.Stats(), offset=0x80)
        self._bridge = csr.Bridge(regs.as_memory_map())
        super().__init__({
            "csr_bus": In(csr.Signature(addr_width=regs.addr_width, data_width=regs.data_width)),
            "bus": Out(bus_signature(addr_width)),
            "pending": Out(1),
            "i": In(stream.Signature(data.ArrayLayout(ASQ, N_OUTPUTS))),
            "o": Out(stream.Signature(data.ArrayLayout(ASQ, N_OUTPUTS))),
        })
        self.csr_bus.memory_map = self._bridge.bus.memory_map

    def elaborate(self, platform):
        m = Module()
        m.submodules.bridge = self._bridge
        m.submodules.engine = engine = self.engine
        m.submodules.modulation = mod = self.modulation
        wiring.connect(m, wiring.flipped(self.csr_bus), self._bridge.bus)
        wiring.connect(m, engine.bus, wiring.flipped(self.bus))
        m.d.comb += self.pending.eq(engine.pending)

        def held(field, target):
            with m.If(field.w_stb):
                m.d.sync += target.eq(field.w_data)

        for i, r in enumerate(self._layers):
            table_base = Signal(16, name=f"table_base{i}")
            frame_log2 = Signal(2, name=f"frame_log2{i}")
            frames_m1 = Signal(10, name=f"frames_m1{i}")
            max_level = Signal(4, name=f"max_level{i}")
            edge = Signal(2, name=f"edge{i}")
            stepped = Signal(name=f"stepped{i}")
            raw = Signal(name=f"raw{i}")
            grain = Signal(2, name=f"grain{i}")
            held(r["table"].f.base, table_base)
            held(r["table"].f.frame_log2, frame_log2)
            held(r["table"].f.frames_m1, frames_m1)
            held(r["table"].f.max_level, max_level)
            held(r["ctrl"].f.edge, edge)
            held(r["ctrl"].f.stepped, stepped)
            held(r["ctrl"].f.raw, raw)
            held(r["ctrl"].f.grain, grain)
            p = engine.layers[i]
            m.d.comb += [
                p.table_base.eq(table_base),
                p.frame_log2.eq(frame_log2),
                p.frames_m1.eq(frames_m1),
                p.max_level.eq(max_level),
                p.edge.eq(edge),
                p.stepped.eq(stepped),
                p.raw.eq(raw),
                p.inc.eq(mod.matrix.inc[i]),
                p.pos.eq(mod.matrix.pos[i]),
                p.shift.eq(mod.matrix.shift[i]),
                p.level.eq(mod.matrix.level[i]),
                mod.frames_m1[i].eq(frames_m1),
                mod.grain[i].eq(grain),
                self.trace.max_level[i].eq(max_level),
            ]
        m.d.comb += engine.restart.eq(mod.matrix.restart)

        # The parameter port.
        param_addr = Signal(8)
        held(self._param_addr.f.addr, param_addr)
        m.d.comb += [
            mod.wr_addr.eq(param_addr),
            mod.wr_en.eq(self._param_data.f.data.w_stb),
            mod.wr_data.eq(self._param_data.f.data.w_data),
        ]

        outs_sel = Signal(16)
        vca = Signal(4)
        patched = Signal(2)
        cross = Signal(4)
        routing = self._routing.f
        held(routing.outs, outs_sel)
        held(routing.vca, vca)
        held(routing.patched, patched)
        held(routing.cross, cross)
        m.d.comb += [
            mod.vca[0].eq(vca[:2]), mod.vca[1].eq(vca[2:]), mod.patched.eq(patched),
            engine.cross.ring.eq(cross[0]),
            engine.cross.pm.eq(cross[1]),
            engine.cross.lock.eq(cross[2]),
            engine.cross.modulator.eq(cross[3]),
            engine.cross.depth.eq(mod.matrix.depth),
        ]

        # The newest input samples; a run uses what is here when it starts.
        m.d.comb += self.i.ready.eq(1)
        adc = Signal(data.ArrayLayout(unsigned(16), N_OUTPUTS))
        latched = Signal(data.ArrayLayout(unsigned(16), N_OUTPUTS))
        with m.If(self.i.valid):
            for k in range(N_OUTPUTS):
                m.d.sync += adc[k].eq(self.i.payload[k].as_value())
        for k in range(N_OUTPUTS):
            m.d.comb += mod.adc[k].eq(latched[k])

        # The mixer.
        a, b, prod = multiplier(m)
        l1 = engine.o.payload[0].as_value().as_signed()
        l2 = engine.o.payload[1].as_value().as_signed()
        mix = Signal(signed(16))
        env, lfo = mod.envelopes.out, mod.lfos.out
        bus = Array([C(0, signed(16)), mix, l1, l2,
                     env[0] >> 2, env[1] >> 2, lfo[0] >> 2, lfo[1] >> 2, lfo[2] >> 2,
                     *[C(0, signed(16))] * 7])
        outs = [Signal(signed(16), name=f"out{k}") for k in range(N_OUTPUTS)]
        for k in range(N_OUTPUTS):
            m.d.comb += self.o.payload[k].as_value().eq(outs[k])
        k = Signal(range(N_OUTPUTS))

        with m.FSM() as fsm:

            with m.State("MOD"):
                m.d.comb += mod.start.eq(1)
                m.next = "MOD_WAIT"

            with m.State("MOD_WAIT"):
                with m.If(mod.done):
                    m.next = "OSC"

            with m.State("OSC"):
                with m.If(engine.o.valid):
                    m.d.sync += [a.eq(l2 - l1), b.eq(mod.matrix.balance), k.eq(0)]
                    m.next = "MIX_WAIT"

            with m.State("MIX_WAIT"):
                m.next = "MIX"

            with m.State("MIX"):
                m.d.sync += mix.eq(l1 + (prod >> 16))
                m.next = "PICK"

            with m.State("PICK"):
                sel = outs_sel.word_select(k, 4)
                m.d.sync += Array(outs)[k].eq(bus[sel])
                m.d.sync += k.eq(k + 1)
                with m.If(k == N_OUTPUTS - 1):
                    m.next = "OFFER"

            with m.State("OFFER"):
                m.d.comb += self.o.valid.eq(1)
                with m.If(self.o.ready):
                    m.d.comb += engine.o.ready.eq(1)
                    # (the trace must keep this sample's inputs until now)
                    for ch in range(N_OUTPUTS):
                        m.d.sync += latched[ch].eq(adc[ch])
                    m.next = "MOD"

        m.d.comb += engine.go.eq(fsm.ongoing("OSC"))

        # What the screens can show. (The sources, as DAC counts.)
        m.d.comb += [
            self._mon0.f.a.r_data.eq(env[0] >> 2),
            self._mon0.f.b.r_data.eq(env[1] >> 2),
            self._mon1.f.a.r_data.eq(lfo[0] >> 2),
            self._mon1.f.b.r_data.eq(lfo[1] >> 2),
            self._mon2.f.lfo.r_data.eq(lfo[2] >> 2),
            self._mon2.f.stage0.r_data.eq(mod.envelopes.stage[0]),
            self._mon2.f.stage1.r_data.eq(mod.envelopes.stage[1]),
            self._mon2.f.gates.r_data.eq(mod.gates),
            self._mon2.f.lfo2_phase.r_data.eq(mod.lfos.phase[2][24:]),
            self._mon3.f.env0.r_data.eq(mod.envelopes.progress[0]),
            self._mon3.f.env1.r_data.eq(mod.envelopes.progress[1]),
            self._mon3.f.lfo0.r_data.eq(mod.lfos.phase[0][24:]),
            self._mon3.f.lfo1.r_data.eq(mod.lfos.phase[1][24:]),
        ]
        for i, scan in enumerate(self._scan):
            m.d.comb += [scan.f.pos.r_data.eq(mod.matrix.pos_fraction[i]),
                         scan.f.shift.r_data.eq(mod.matrix.shift[i][2:18])]

        stats = self._stats.f
        clocks_max = Signal(16)
        samples = Signal(16)
        m.d.comb += [stats.clocks_max.r_data.eq(clocks_max), stats.samples.r_data.eq(samples)]
        if_new_max = engine.clocks_stb & (engine.clocks > clocks_max)
        # (a read starts the next interval: the bus has captured the value already)
        with m.If(stats.clocks_max.r_stb):
            m.d.sync += clocks_max.eq(0)
        with m.Elif(if_new_max):
            m.d.sync += clocks_max.eq(engine.clocks)
        with m.If(engine.clocks_stb):
            m.d.sync += samples.eq(samples + 1)

        for ch in range(N_OUTPUTS):
            m.d.comb += self.trace.adc[ch].eq(latched[ch])
        for i in range(2):
            m.d.comb += [self.trace.phase[i].eq(engine.phase[i]),
                         self.trace.env_level[i].eq(mod.envelopes.level[i])]
            m.d.comb += self.trace.pos[i].eq(mod.matrix.pos[i])
        for i in range(3):
            m.d.comb += [self.trace.lfo_phase[i].eq(mod.lfos.phase[i]),
                         self.trace.lfo_held[i].eq(mod.lfos.held[i])]
        m.d.comb += self.trace.lfsr.eq(mod.lfos.lfsr)
        return m
