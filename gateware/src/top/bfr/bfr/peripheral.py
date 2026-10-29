"""SoC peripheral: the bfr engine (core + PSRAM stream engine) behind CSRs.

The CPU configures the engine, writes its tables, sets LFO rates and fade
targets, starts crossfades and reads statistics. Audio from the CODEC starts
one frame per sample; the frame's outputs go back to the CODEC.

Table writes (program, coefficients, tap entries, registers, stream table,
LFO phases) go through one staging register: the CPU writes `wdata0..2`,
then `wcmd` (table and address). The write is applied between frames, while
the core is idle (the register file and LFO phases can only be written then,
and a coefficient or tap changes at a sample boundary). `status.wpend` is set
until then; the CPU waits for it before the next `wcmd`.

IN2/3 also have gate detectors (for triggers such as the spring's kick): a
rising edge latches a bit the CPU reads, so a trigger of a single sample is
caught however seldom it looks.

The input followers: the audio inputs' mix (IN0 + IN1) / 2 is split at the
sample rate into bass (two one-pole lowpasses, about 240 Hz) and treble
(two one-pole highpasses, about 1.9 kHz; 12 dB per octave each, shift-only
filters: no multipliers), and `follow` holds the peaks of the level, bass
and treble since its last read. The CPU turns them into envelopes that
modulate parameters as the control voltages do.

The configuration registers are write-only: the CPU keeps its own copies.
Readable, each of their bytes is another input to the CSR bridge's read
multiplexer, which was 1,400 LUTs with them (it is the statistics now).
"""

from amaranth import *
from amaranth.lib import data, stream, wiring
from amaranth.lib.wiring import In, Out, connect, flipped
from amaranth_soc import csr

from tiliqua.dsp import ASQ

from model import isa

from .core import OFF_W, Core, RTap, WTap
from .stream import STab, StreamEngine, bus_signature, stream_table

# The gate threshold at reset (the CODEC's full scale is 8.192 V).
GATE_VOLTS = 1.0

# wcmd tables
T_PROG, T_COEF, T_RTAP, T_WTAP, T_REG, T_STAB, T_LFO = range(7)

# The followers' crossovers (each filter's shift is the nearest for the
# sample rate: 239 and 1,910 Hz at 48 kHz) and fraction bits.
BASS_HZ, TREBLE_HZ = 200, 2500
FOLLOW_FRAC = 4


def follower_shifts(fs):
    """The one-pole shifts k (y += (x - y) / 2^k) for the bass and treble
    crossovers at `fs`: the cutoff is about fs / (2 pi 2^k)."""
    import math
    return tuple(max(1, round(math.log2(fs / (2 * math.pi * f)))) for f in (BASS_HZ, TREBLE_HZ))


def _pow2(n, lo):
    p = lo
    while p < n:
        p *= 2
    return p


class BfrPeripheral(wiring.Component):

    class Control(csr.Register, access="w"):
        """run: start a frame for each CODEC sample. mute: silence the outputs.
        While not running, OUT0/1 follow IN0/1 and OUT2/3 (the wet outputs)
        are silent: IN2/3 carry control voltages."""
        run:  csr.Field(csr.action.W, unsigned(1))
        mute: csr.Field(csr.action.W, unsigned(1))

    class Status(csr.Register, access="r"):
        """busy: a frame is running. clearing: the delay memory is being cleared.
        late: a PSRAM burst missed its deadline (since the last clear). wpend: a
        table write is waiting for the core to be idle."""
        busy:     csr.Field(csr.action.R, unsigned(1))
        clearing: csr.Field(csr.action.R, unsigned(1))
        late:     csr.Field(csr.action.R, unsigned(1))
        wpend:    csr.Field(csr.action.R, unsigned(1))

    class Config(csr.Register, access="w"):
        n_instr:   csr.Field(csr.action.W, unsigned(11))
        n_streams: csr.Field(csr.action.W, unsigned(9))

    class Mask(csr.Register, access="w"):
        mask: csr.Field(csr.action.W, unsigned(OFF_W))

    class RingBase(csr.Register, access="w"):
        """Word address of the PSRAM delay ring (aligned to its size)."""
        base: csr.Field(csr.action.W, unsigned(23))

    class Clear(csr.Register, access="w"):
        """Zero the PSRAM delay ring, the stream buffers and the block-RAM
        delay space (statistics too)."""
        clear: csr.Field(csr.action.W, unsigned(1))

    class Word(csr.Register, access="w"):
        data: csr.Field(csr.action.W, unsigned(32))

    class WCmd(csr.Register, access="w"):
        """Write wdata0..2 to entry `addr` of `table` (see T_*)."""
        addr:  csr.Field(csr.action.W, unsigned(10))
        table: csr.Field(csr.action.W, unsigned(3))

    class Fade(csr.Register, access="w"):
        value: csr.Field(csr.action.W, unsigned(25))

    class FadePos(csr.Register, access="r"):
        pos: csr.Field(csr.action.R, unsigned(25))

    class Count(csr.Register, access="r"):
        count: csr.Field(csr.action.R, unsigned(32))

    class FrameClocks(csr.Register, access="r"):
        """Clocks of the last frame and the most since `clear_max`."""
        last: csr.Field(csr.action.R, unsigned(16))
        max:  csr.Field(csr.action.R, unsigned(16))

    class StreamStats(csr.Register, access="r"):
        """Since the last clear: most samples from a PSRAM request to its
        completion, most samples the scanner was behind (both saturating), and
        how often the scanner gave up a backlog and jumped to the present."""
        max_lag:  csr.Field(csr.action.R, unsigned(8))
        scan_lag: csr.Field(csr.action.R, unsigned(8))
        resyncs:  csr.Field(csr.action.R, unsigned(16))

    class ClearMax(csr.Register, access="w"):
        clear: csr.Field(csr.action.W, unsigned(1))

    class GateLevel(csr.Register, access="w"):
        """IN2/3 gate threshold, signed, in CODEC sample units (1 V at reset):
        an input rising above it after falling below half of it is an edge."""
        high: csr.Field(csr.action.W, unsigned(16))

    class GateEdges(csr.Register, access="r"):
        """Rising edges on IN2 (bit 0) and IN3 (bit 1) since the last read,
        which clears them."""
        edges: csr.Field(csr.action.R, unsigned(2))

    class WetPeak(csr.Register, access="r"):
        """The largest |OUT2| or |OUT3| (the reverb alone) since the last
        read, which clears it: the UI's level meter."""
        peak: csr.Field(csr.action.R, unsigned(16))

    class Follow(csr.Register, access="r"):
        """The inputs' largest level ((IN0 + IN1) / 2), bass and treble since
        the last read, which clears them: |x| / 32 each (1023 at full scale)."""
        level: csr.Field(csr.action.R, unsigned(10))
        bass: csr.Field(csr.action.R, unsigned(10))
        treble: csr.Field(csr.action.R, unsigned(10))

    def __init__(self, prog, *, prog_depth=1024, rbuf_words=None, wbuf_words=None,
                 ebr_words=None, diagnostics=True):
        """`prog` is the program the bitstream starts with; the sizes default
        to its needs (`compiler.compile_set` gives a set's). Without
        `diagnostics`, `bursts` and `stream_stats` read 0 (their counters go)."""
        self.prog = prog
        io_bits = Shape.cast(ASQ).width         # the CODEC streams' samples, as integers
        st = prog.streams
        ebr_words = ebr_words or max(16, prog.mem_words[isa.SPACE_EBR])
        self.core = Core(prog=prog, io_bits=io_bits, prog_depth=prog_depth,
                         ebr_words=ebr_words)
        self.stream = StreamEngine(
            burst=st["burst"],
            rbuf_words=rbuf_words or _pow2(st["rbuf_words"], 512),
            wbuf_words=wbuf_words or _pow2(st["wbuf_words"], 512),
            zero_words=ebr_words,
            stab_init=stream_table(prog),
            stats=diagnostics)

        regs = csr.Builder(addr_width=7, data_width=8)
        self._control    = regs.add("control",      self.Control(),     offset=0x00)
        self._status     = regs.add("status",       self.Status(),      offset=0x04)
        self._config     = regs.add("config",       self.Config(),      offset=0x08)
        self._psram_mask = regs.add("psram_mask",   self.Mask(),        offset=0x0C)
        self._ebr_mask   = regs.add("ebr_mask",     self.Mask(),        offset=0x10)
        self._ring_base  = regs.add("ring_base",    self.RingBase(),    offset=0x14)
        self._clear      = regs.add("clear",        self.Clear(),       offset=0x18)
        self._wdata      = [regs.add(f"wdata{i}", self.Word(), offset=0x1C + 4 * i)
                            for i in range(3)]
        self._wcmd       = regs.add("wcmd",         self.WCmd(),        offset=0x28)
        self._lfo_inc    = [regs.add(f"lfo_inc{k}", self.Word(), offset=0x2C + 4 * k)
                            for k in range(isa.N_LFO)]
        self._fade_tgt   = [regs.add(f"fade_target{g}", self.Fade(), offset=0x3C + 4 * g)
                            for g in range(isa.N_FADE)]
        self._fade_rate  = [regs.add(f"fade_rate{g}", self.Fade(), offset=0x44 + 4 * g)
                            for g in range(isa.N_FADE)]
        self._fade_pos   = [regs.add(f"fade_pos{g}", self.FadePos(), offset=0x4C + 4 * g)
                            for g in range(isa.N_FADE)]
        self._frames     = regs.add("frames",       self.Count(),       offset=0x54)
        self._frame_clks = regs.add("frame_clocks", self.FrameClocks(), offset=0x58)
        self._overruns   = regs.add("overruns",     self.Count(),       offset=0x5C)
        self._bursts     = regs.add("bursts",       self.Count(),       offset=0x60)
        self._sstats     = regs.add("stream_stats", self.StreamStats(), offset=0x64)
        self._clear_max  = regs.add("clear_max",    self.ClearMax(),    offset=0x68)
        self._gate_level = regs.add("gate_level",   self.GateLevel(),   offset=0x6C)
        self._gate_edges = regs.add("gate_edges",   self.GateEdges(),   offset=0x70)
        self._wet_peak   = regs.add("wet_peak",     self.WetPeak(),     offset=0x74)
        self._follow     = regs.add("follow",       self.Follow(),      offset=0x78)
        self._bridge = csr.Bridge(regs.as_memory_map())

        super().__init__({
            "csr_bus": In(csr.Signature(addr_width=regs.addr_width, data_width=regs.data_width)),
            "psram":   Out(bus_signature(23)),
            # The stream engine has more bursts queued (for the PSRAM arbiter).
            "psram_pending": Out(1),
            # CODEC streams, 4 channels each way.
            "i":       In(stream.Signature(data.ArrayLayout(ASQ, isa.N_IN))),
            "o":       Out(stream.Signature(data.ArrayLayout(ASQ, isa.N_OUT))),
        })
        self.csr_bus.memory_map = self._bridge.bus.memory_map

    def elaborate(self, platform):
        m = Module()
        m.submodules.bridge = self._bridge
        connect(m, flipped(self.csr_bus), self._bridge.bus)
        m.submodules.core = core = self.core
        m.submodules.stream = eng = self.stream
        connect(m, core.pmem, eng.core)
        connect(m, eng.bus, flipped(self.psram))

        def held(field, name):
            """A write-only field's value since its last write."""
            value = Signal(len(field.w_data), name=name)
            with m.If(field.w_stb):
                m.d.sync += value.eq(field.w_data)
            return value

        ctrl = self._control.f
        psram_mask = held(self._psram_mask.f.mask, "psram_mask")
        m.d.comb += [
            core.n_instr.eq(held(self._config.f.n_instr, "n_instr")),
            core.psram_mask.eq(psram_mask),
            core.ebr_mask.eq(held(self._ebr_mask.f.mask, "ebr_mask")),
            eng.ptr.eq(core.ptr),
            eng.ring_mask.eq(psram_mask),
            eng.ring_base.eq(held(self._ring_base.f.base, "ring_base")),
            eng.n_streams.eq(held(self._config.f.n_streams, "n_streams")),
            eng.clear.eq(self._clear.f.clear.w_stb & self._clear.f.clear.w_data),
            core.zero_ebr.eq(eng.clearing),
        ]
        for k in range(isa.N_LFO):
            m.d.comb += core.lfo_inc[k].eq(held(self._lfo_inc[k].f.data, f"lfo_inc{k}"))
        for g in range(isa.N_FADE):
            m.d.comb += [
                core.fade_target[g].eq(held(self._fade_tgt[g].f.value, f"fade_target{g}")),
                core.fade_rate[g].eq(held(self._fade_rate[g].f.value, f"fade_rate{g}")),
                self._fade_pos[g].f.pos.r_data.eq(core.fade_pos[g]),
            ]

        # -- table writes, applied while the core is idle -----------------------
        pend = Signal()
        w_table = Signal(3)
        w_addr = Signal(10)
        w_data = Signal(96)
        cmd = self._wcmd.f
        wdata = [held(w.f.data, f"wdata{i}") for i, w in enumerate(self._wdata)]
        with m.If(cmd.addr.w_stb):
            m.d.sync += [pend.eq(1), w_table.eq(cmd.table.w_data), w_addr.eq(cmd.addr.w_data),
                         w_data.eq(Cat(*wdata))]
        apply = pend & ~core.busy
        with m.If(apply):
            m.d.sync += pend.eq(0)
        ports = {T_PROG: core.prog_w, T_COEF: core.coef_w, T_RTAP: core.rtap_w,
                 T_WTAP: core.wtap_w, T_REG: core.reg_w, T_STAB: eng.stab_w, T_LFO: core.lfo_w}
        for table, port in ports.items():
            m.d.comb += [port.addr.eq(w_addr), port.data.eq(w_data),
                         port.en.eq(apply & (w_table == table))]

        status = self._status.f
        m.d.comb += [
            status.busy.r_data.eq(core.busy),
            status.clearing.r_data.eq(eng.clearing),
            status.late.r_data.eq(eng.late),
            status.wpend.r_data.eq(pend | cmd.addr.w_stb),
            self._bursts.f.count.r_data.eq(eng.bursts),
            self._sstats.f.max_lag.r_data.eq(eng.max_lag),
            self._sstats.f.scan_lag.r_data.eq(eng.scan_lag),
            self._sstats.f.resyncs.r_data.eq(eng.resyncs),
            self.psram_pending.eq(eng.pending),
        ]

        # -- audio ----------------------------------------------------------------
        # A CODEC sample starts a frame if the core is idle (otherwise it is an
        # overrun: the frame budget was exceeded). The frame's outputs, or while
        # not running the inputs, go to the CODEC through a small FIFO.
        frames, overruns = Signal(32), Signal(32)
        max_clocks = Signal(16)
        m.d.comb += [
            self.i.ready.eq(1),
            core.inputs.as_value().eq(self.i.payload.as_value()),
            self._frames.f.count.r_data.eq(frames),
            self._overruns.f.count.r_data.eq(overruns),
            self._frame_clks.f.last.r_data.eq(core.frame_cycles),
            self._frame_clks.f.max.r_data.eq(max_clocks),
        ]
        running = held(ctrl.run, "run")
        with m.If(self.i.valid & running):
            with m.If(core.busy):
                m.d.sync += overruns.eq(overruns + 1)
            with m.Else():
                m.d.comb += core.start.eq(1)
        with m.If(core.done):
            m.d.sync += frames.eq(frames + 1)
            with m.If(core.frame_cycles > max_clocks):
                m.d.sync += max_clocks.eq(core.frame_cycles)
        with m.If(self._clear_max.f.clear.w_stb):
            m.d.sync += max_clocks.eq(0)

        # -- gates on IN2/3, at the sample rate ---------------------------------
        high = Signal(signed(16), init=int(round(GATE_VOLTS * 2 ** 15 / 8.192)))
        with m.If(self._gate_level.f.high.w_stb):
            m.d.sync += high.eq(self._gate_level.f.high.w_data)
        armed, edges = Signal(2), Signal(2)
        with m.If(self._gate_edges.f.edges.r_stb):
            m.d.sync += edges.eq(0)
        with m.If(self.i.valid):
            for c in range(2):
                x = self.i.payload[2 + c].as_value()
                with m.If(x < (high >> 1)):
                    m.d.sync += armed[c].eq(1)
                with m.Elif(armed[c] & (x > high)):
                    m.d.sync += [armed[c].eq(0), edges[c].eq(1)]
        m.d.comb += self._gate_edges.f.edges.r_data.eq(edges)

        # -- the reverb's peak level ---------------------------------------------
        peak = Signal(16)
        with m.If(self._wet_peak.f.peak.r_stb):
            m.d.sync += peak.eq(0)
        mags = [Signal(16, name=f"wet_mag{k}") for k in (2, 3)]
        for mag, k in zip(mags, (2, 3)):
            x = core.outputs[k]
            m.d.comb += mag.eq(Mux(x < 0, -x, x))           # |-32768| wraps: 32768 still
        loudest = Mux(mags[0] > mags[1], mags[0], mags[1])
        with m.If(core.done & (loudest > peak)):
            m.d.sync += peak.eq(loudest)
        m.d.comb += self._wet_peak.f.peak.r_data.eq(peak)

        # -- input followers: level, bass, treble, at the sample rate ------------
        kb, kt = follower_shifts(self.prog.fs)
        F = FOLLOW_FRAC
        mix = Signal(signed(16))
        m.d.comb += mix.eq((self.i.payload[0].as_value() + self.i.payload[1].as_value()) >> 1)
        x = Signal(signed(16 + F))
        m.d.comb += x.eq(mix << F)

        def onepole(src, k, name):
            """y += (src - y) / 2^k: a lowpass; y stays in src's range."""
            y = Signal(signed(len(src)), name=name)
            with m.If(self.i.valid):
                m.d.sync += y.eq(y + ((src - y) >> k))
            return y

        def less(a, b, name):
            d = Signal(signed(max(len(a), len(b)) + 1), name=name)
            m.d.comb += d.eq(a - b)
            return d

        bass = onepole(onepole(x, kb, "bass1"), kb, "bass2")
        hp1 = less(x, onepole(x, kt, "treble1"), "treble_hp1")
        treble = less(hp1, onepole(hp1, kt, "treble2"), "treble_hp2")

        def mag10(v, frac, name):
            """|v| / 32 (v with `frac` fraction bits), 0..1023."""
            a = Signal(len(v), name=name)
            m.d.comb += a.eq(Mux(v < 0, ~v, v))             # (|v| - 1 for v < 0)
            over = a[frac + 15:]
            mag = a[frac + 5:frac + 15]
            return Mux(over.any(), 1023, mag) if len(over) else mag

        fl = self._follow.f
        held_peaks = [Signal(10, name=f"follow_{n}") for n in ("level", "bass", "treble")]
        fmags = [mag10(mix, 0, "level_mag"), mag10(bass, F, "bass_mag"),
                mag10(treble, F, "treble_mag")]
        with m.If(fl.level.r_stb):
            m.d.sync += [p.eq(0) for p in held_peaks]
        with m.If(self.i.valid):
            for p, v in zip(held_peaks, fmags):
                with m.If(v > p):
                    m.d.sync += p.eq(v)
        m.d.comb += [fl.level.r_data.eq(held_peaks[0]), fl.bass.r_data.eq(held_peaks[1]),
                     fl.treble.r_data.eq(held_peaks[2])]

        # One sample's buffer: the CODEC side takes it long before the next
        # (it has a FIFO of its own), so a new sample replaces an untaken one.
        width = self.o.payload.as_value().shape().width
        out_v, out_d = Signal(), Signal(width)
        w_en, w_data = Signal(), Signal(width)
        bypass = Signal.like(self.o.payload)            # IN0/1 through, OUT2/3 silent
        m.d.comb += [bypass[k].eq(self.i.payload[k]) for k in range(2)]
        with m.If(running):
            m.d.comb += [w_en.eq(core.done), w_data.eq(core.outputs.as_value())]
        with m.Else():
            m.d.comb += [w_en.eq(self.i.valid), w_data.eq(bypass.as_value())]
        with m.If(self.o.ready):
            m.d.sync += out_v.eq(0)
        with m.If(w_en):
            m.d.sync += [out_v.eq(1), out_d.eq(w_data)]
        m.d.comb += [
            self.o.valid.eq(out_v),
            self.o.payload.as_value().eq(Mux(held(ctrl.mute, "mute"), 0, out_d)),
        ]
        return m
