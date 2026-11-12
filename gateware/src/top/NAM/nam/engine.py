"""The NAM engine: a multiply-accumulate datapath driven by a program.

Everything here is clocked by the module's `sync` domain, which the SoC renames
to `fast` (120 MHz); the memories the CPU fills (weights, aux, program, the
ring and stream tables) have their write ports in `host_domain` instead.
`model/program.py` documents the program the sequencer executes and generates
it; `model/fixed.py` holds the arithmetic.

    sequencer ─ops─► tables ─► memories ─► 8 × MULT18X18D ─► accumulators Z0 Z1 LIN
                                                                       │
                  post unit ◄──────────────────────────────────────────┘
                  LeakyReLU, shift, round, saturate ─► ring / z FIFO / H / x, y, out

Activations are 18 bits, weights 18 bits (a column of 8 per row of the weight
memory), accumulators 40 bits. A MAC op issues every clock the sequencer has
one ready; its product lands in the accumulator nine clocks later. The post
unit takes one accumulator per clock and writes its result nine clocks later.
The sequencer keeps the two apart: a POST starts once the bank's last product
has landed and the post unit has read out the previous command (a POST of H
also waits for its writes); a MAC into a bank waits while the post unit is
reading it; a MAC segment with `wait` waits until the post unit has finished
everything before it (so this layer's newest history, or x, or y, is written).

History rings in block RAM are addressed `base + (frame << stride) + channel`,
the frame counting back from each ring's write pointer, which the advance loop
steps at the start of every sample. Rings in PSRAM are read from stream
buffers: each (ring, tap) is a stream with a region of two bursts in the read
buffer and a position the same loop steps by one frame per sample; when it
leaves a burst, a fetch of the burst two ahead is queued, which the host side
(`nam/streams.py`) performs on the PSRAM bus through `req` and `rdata`. Write
streams go the other way: a full burst is copied into `wdata` and a write
request follows. A transfer still outstanding `late_after` samples after it
was queued sets `late`. For the data to be there in time, a tap's delay must
be at least three bursts of frames.
"""

from amaranth import *
from amaranth.lib import data, stream, wiring
from amaranth.lib.fifo import SyncFIFO, SyncFIFOBuffered
from amaranth.lib.memory import Memory
from amaranth.lib.wiring import In, Out
from amaranth.utils import exact_log2

from model import program as P
from model.fixed import LEAKY_TERMS

ACC = 40
ACT = 18
W = 18
PROD = 36

RingEntry = data.StructLayout({
    "base": 14, "frames": 12, "stride": 2, "psram": 1, "stream0": 6, "wstream": 6})
StreamEntry = data.StructLayout({
    "write": 1, "sbase": 10, "swords": 8, "wpf": 3, "burst": 6, "pbase": 22, "pend": 22,
    "pos0": 22, "rpos0": 8})
StreamDyn = data.StructLayout({"rpos": 8, "pos": 22})
Req = data.StructLayout({"write": 1, "addr": 22, "words": 6})

# One MAC op as it travels down the pipeline.
OpLayout = data.StructLayout({
    "src": 3, "ring": 5, "tap": 4, "delay": 12, "ch": 3, "row": 11, "bank": 2,
    "clear": 1, "lo": 1, "aux": 1})
PostCmd = data.StructLayout({
    "bank": 2, "count": 4, "shift": 6, "leaky": 1, "dest": 3, "ring": 5, "written": 1,
    "clearacc": 1, "done": 1})


def pack(layout, values):
    v = 0
    for name, f in layout:
        v |= (int(values[name]) & ((1 << f.width) - 1)) << f.offset
    return v


def encode_ring(r: P.Ring):
    return pack(RingEntry, {"base": r.base, "frames": r.frames, "stride": r.stride,
                            "psram": int(r.psram), "stream0": r.streams[0] if r.streams else 0,
                            "wstream": r.wstream})


def encode_stream(s: P.Stream):
    """The table entry; the stream starts at the PSRAM frame `-delay` (mod the ring)."""
    start = (-s.delay) % s.psram_frames if s.psram_frames else 0
    return pack(StreamEntry, {
        "write": int(s.write), "sbase": s.sbase, "swords": s.region_words, "wpf": s.wpf,
        "burst": s.burst_words, "pbase": s.psram_base,
        "pend": s.psram_base + s.psram_frames * s.wpf,
        "pos0": s.psram_base + start * s.wpf, "rpos0": 0})


class Mult18(wiring.Component):
    """18 x 18 signed multiplier, three register stages (the DSP's input,
    pipeline and output registers). On hardware a MULT18X18D is instantiated
    with those registers; elsewhere it is behavioural with the same latency."""

    a: In(signed(ACT))
    b: In(signed(W))
    p: Out(signed(PROD))

    def __init__(self, hw=False):
        self.hw = hw
        super().__init__()

    def elaborate(self, platform):
        m = Module()
        if self.hw:
            p = Signal(PROD)
            ports = {}
            for i in range(18):
                ports[f"i_A{i}"] = self.a[i]
                ports[f"i_B{i}"] = self.b[i]
                ports[f"i_C{i}"] = C(0)
                ports[f"i_SRIA{i}"] = C(0)
                ports[f"i_SRIB{i}"] = C(0)
            for i in range(36):
                ports[f"o_P{i}"] = p[i]
            m.submodules.dsp = Instance(
                "MULT18X18D",
                p_REG_INPUTA_CLK="CLK0", p_REG_INPUTB_CLK="CLK0", p_REG_INPUTC_CLK="NONE",
                p_REG_PIPELINE_CLK="CLK0", p_REG_OUTPUT_CLK="CLK0",
                p_REG_INPUTA_CE="CE0", p_REG_INPUTB_CE="CE0", p_REG_PIPELINE_CE="CE0",
                p_REG_OUTPUT_CE="CE0",
                p_REG_INPUTA_RST="RST0", p_REG_INPUTB_RST="RST0", p_REG_PIPELINE_RST="RST0",
                p_REG_OUTPUT_RST="RST0",
                p_CLK0_DIV="DISABLED", p_CLK1_DIV="DISABLED", p_CLK2_DIV="DISABLED",
                p_CLK3_DIV="DISABLED", p_GSR="DISABLED", p_RESETMODE="SYNC",
                p_SOURCEB_MODE="B_SHIFT", p_MULT_BYPASS="DISABLED", p_CAS_MATCH_REG="FALSE",
                i_CLK0=ClockSignal(), i_CLK1=C(0), i_CLK2=C(0), i_CLK3=C(0),
                i_CE0=C(1), i_CE1=C(0), i_CE2=C(0), i_CE3=C(0),
                i_RST0=ResetSignal(), i_RST1=C(0), i_RST2=C(0), i_RST3=C(0),
                i_SIGNEDA=C(1), i_SIGNEDB=C(1), i_SOURCEA=C(0), i_SOURCEB=C(0),
                **ports)
            m.d.comb += self.p.eq(p)
        else:
            a1 = Signal.like(self.a)
            b1 = Signal.like(self.b)
            p2 = Signal.like(self.p)
            m.d.sync += [a1.eq(self.a), b1.eq(self.b), p2.eq(a1 * b1), self.p.eq(p2)]
        return m


class Engine(wiring.Component):

    def __init__(self, *, columns=P.COLUMNS, wmem_rows=P.WMEM_ROWS, aux_words=P.AUX_WORDS,
                 hist_words=P.HIST_WORDS, sbuf_r_words=P.SBUF_R_WORDS, sbuf_w_words=P.SBUF_W_WORDS,
                 segments=256, n_rings=P.N_RINGS, n_streams=P.N_STREAMS, host_domain="sync",
                 hw_mult=False):
        assert columns == 8
        self.columns = columns
        self.wmem_rows, self.aux_words, self.hist_words = wmem_rows, aux_words, hist_words
        self.sbuf_r_words, self.sbuf_w_words = sbuf_r_words, sbuf_w_words
        self.segments, self.n_rings, self.n_streams = segments, n_rings, n_streams
        self.host_domain = host_domain
        self.hw_mult = hw_mult
        super().__init__({
            # A sample.
            "start": In(1),
            "adc": In(signed(16)),
            "out": Out(signed(16)),
            "done": Out(1),
            "busy": Out(1),
            # Tables and memories, written by the host (while the engine is idle).
            "wmem_w": In(data.StructLayout({"addr": exact_log2(wmem_rows), "data": columns * W, "en": 1})),
            "aux_w": In(data.StructLayout({"addr": exact_log2(aux_words), "data": W, "en": 1})),
            "prog_w": In(data.StructLayout({"addr": exact_log2(2 * segments), "data": P.WORD, "en": 1})),
            "ring_w": In(data.StructLayout({"addr": exact_log2(n_rings), "data": RingEntry.size, "en": 1})),
            "stream_w": In(data.StructLayout({"addr": exact_log2(n_streams), "data": StreamEntry.size, "en": 1})),
            "n_rings_used": In(range(n_rings + 1)),
            "n_streams_used": In(range(n_streams + 1)),
            "n_segments": In(range(segments + 1)),
            "late_after": In(4),
            "clear": In(1),         # zero the history pool and the write pointers
            "prefill": In(1),       # fetch every read stream's two bursts
            # PSRAM transfers (to nam/streams.py).
            "req": Out(stream.Signature(Req)),
            "rdata": In(stream.Signature(32)),
            "wdata": Out(stream.Signature(32)),
            # Status.
            "late": Out(1),
            "clocks": Out(16),
            "clocks_stb": Out(1),
        })

    def elaborate(self, platform):
        m = Module()
        hd = self.host_domain
        NC = self.columns

        # ---- memories ------------------------------------------------------------------
        m.submodules.hist = hist = Memory(shape=unsigned(ACT), depth=self.hist_words, init=[])
        m.submodules.sbuf_r = sbuf_r = Memory(shape=unsigned(32), depth=self.sbuf_r_words, init=[])
        m.submodules.sbuf_w = sbuf_w = Memory(shape=unsigned(32), depth=self.sbuf_w_words, init=[])
        m.submodules.wmem = wmem = Memory(shape=unsigned(NC * W), depth=self.wmem_rows, init=[])
        m.submodules.aux = aux = Memory(shape=unsigned(W), depth=self.aux_words, init=[])
        m.submodules.prog = prog = Memory(shape=unsigned(P.WORD), depth=2 * self.segments, init=[])
        m.submodules.rings = rings = Memory(shape=RingEntry, depth=self.n_rings, init=[])
        m.submodules.wptrs = wptrs = Memory(shape=unsigned(12), depth=self.n_rings, init=[])
        m.submodules.streams = streams = Memory(shape=StreamEntry, depth=self.n_streams, init=[])
        m.submodules.sdyn = sdyn = Memory(shape=StreamDyn, depth=self.n_streams, init=[])

        hist_rp = hist.read_port(transparent_for=())
        hist_wp = hist.write_port()
        sbr_rp = sbuf_r.read_port(transparent_for=())
        sbr_wp = sbuf_r.write_port()
        sbw_rp = sbuf_w.read_port(transparent_for=())
        sbw_wp = sbuf_w.write_port(granularity=16)
        wmem_rp = wmem.read_port(transparent_for=())
        wmem_wp = wmem.write_port(domain=hd)
        aux_rp = aux.read_port(transparent_for=())
        aux_wp = aux.write_port(domain=hd)
        prog_rp = prog.read_port(transparent_for=())
        prog_wp = prog.write_port(domain=hd)
        ring_wp = rings.write_port(domain=hd)
        ring_rd_op = rings.read_port(domain="comb")
        ring_rd_post = rings.read_port(domain="comb")
        ring_rd_adv = rings.read_port(domain="comb")
        wptr_rd_op = wptrs.read_port(domain="comb")
        wptr_rd_post = wptrs.read_port(domain="comb")
        wptr_rd_adv = wptrs.read_port(domain="comb")
        wptr_wp = wptrs.write_port()
        stream_wp = streams.write_port(domain=hd)
        str_rd_op = streams.read_port(domain="comb")
        str_rd_post = streams.read_port(domain="comb")
        str_rd_adv = streams.read_port(domain="comb")
        str_rd_xfer = streams.read_port(domain="comb")
        sdyn_rd_op = sdyn.read_port(domain="comb")
        sdyn_rd_post = sdyn.read_port(domain="comb")
        sdyn_rd_adv = sdyn.read_port(domain="comb")
        sdyn_rd_xfer = sdyn.read_port(domain="comb")
        sdyn_wp = sdyn.write_port()

        m.d.comb += [
            wmem_wp.addr.eq(self.wmem_w.addr), wmem_wp.data.eq(self.wmem_w.data), wmem_wp.en.eq(self.wmem_w.en),
            aux_wp.addr.eq(self.aux_w.addr), aux_wp.data.eq(self.aux_w.data), aux_wp.en.eq(self.aux_w.en),
            prog_wp.addr.eq(self.prog_w.addr), prog_wp.data.eq(self.prog_w.data), prog_wp.en.eq(self.prog_w.en),
            ring_wp.addr.eq(self.ring_w.addr), ring_wp.data.eq(self.ring_w.data), ring_wp.en.eq(self.ring_w.en),
            stream_wp.addr.eq(self.stream_w.addr), stream_wp.data.eq(self.stream_w.data),
            stream_wp.en.eq(self.stream_w.en),
        ]
        # A table write also resets the entry's pointers (taken into this domain
        # plainly: the host only writes tables while the engine is idle).
        ring_init = Signal(data.StructLayout({"addr": exact_log2(self.n_rings), "en": 1}))
        stream_init = Signal(data.StructLayout({"addr": exact_log2(self.n_streams), "en": 1,
                                                "rpos0": 8, "pos0": 22}))
        sw_view = StreamEntry(self.stream_w.data)
        m.d.sync += [
            ring_init.addr.eq(self.ring_w.addr), ring_init.en.eq(self.ring_w.en),
            stream_init.addr.eq(self.stream_w.addr), stream_init.en.eq(self.stream_w.en),
            stream_init.rpos0.eq(sw_view.rpos0), stream_init.pos0.eq(sw_view.pos0),
        ]

        # ---- state -----------------------------------------------------------------------
        x_reg = Signal(signed(ACT))
        y_reg = Signal(signed(ACT))
        adc_reg = Signal(signed(16))
        sample_no = Signal(8)
        const_act = C(1 << P.CONST_SHIFT, signed(ACT))
        banks = [[Signal(signed(ACC), name=f"acc{b}_{c}") for c in range(NC)] for b in range(3)]
        hacc = [Signal(signed(32), name=f"h{c}") for c in range(NC)]
        inflight = [Signal(5, name=f"inflight{b}") for b in range(3)]
        m.submodules.zq = zq = SyncFIFO(width=24, depth=16)
        running = Signal()
        advancing = Signal()
        clearing = Signal()
        prefilling = Signal()
        m.d.comb += self.busy.eq(running | advancing | clearing | prefilling)

        # Post unit handshake (the unit is below).
        post_idle = Signal()            # no command, nothing in its pipeline
        post_cmd_v = Signal()           # a command is being read out
        post_reading = Signal(3)
        post_cmd = Signal(PostCmd)
        post_go = Signal()
        post_done_evt = Signal()

        # ==================================================================================
        # Sequencer: fetch segments into a queue, execute them
        # ==================================================================================
        m.submodules.segq = segq = SyncFIFOBuffered(width=2 * P.WORD, depth=4)
        pc = Signal(range(self.segments + 1))
        fetch_half = Signal()
        fetch_done = Signal()
        fetch_lo = Signal(P.WORD)
        issue_fetch = Signal()
        word_v = Signal()
        word_half = Signal()
        m.d.comb += issue_fetch.eq(running & ~fetch_done & (segq.w_level < 2))
        m.d.comb += prog_rp.addr.eq(Cat(fetch_half, pc))
        with m.If(issue_fetch):
            m.d.sync += fetch_half.eq(~fetch_half)
            with m.If(fetch_half):
                m.d.sync += pc.eq(pc + 1)
                with m.If(pc + 1 == self.n_segments):
                    m.d.sync += fetch_done.eq(1)
        m.d.sync += [word_v.eq(issue_fetch), word_half.eq(fetch_half)]
        with m.If(word_v & ~word_half):
            m.d.sync += fetch_lo.eq(prog_rp.data)
        m.d.comb += [segq.w_data.eq(Cat(fetch_lo, prog_rp.data)), segq.w_en.eq(word_v & word_half)]

        seg = Signal(2 * P.WORD)
        seg_v = Signal()
        f = {name: seg[lsb:lsb + width] for name, (lsb, width) in P.SEG_FIELDS.items()}
        is_post = f["kind"]
        src = f["src"]
        bank = f["bank"]
        tap = Signal(4)
        ch = Signal(3)
        phase = Signal()
        row = Signal(11)
        delay = Signal(12)
        first = Signal()
        taps_m1 = Signal(4)
        count_m1 = Signal(3)
        m.d.comb += [taps_m1.eq(f["taps"] - 1), count_m1.eq(f["count"] - 1)]

        op = Signal(OpLayout)
        op_v = Signal()
        zq_op = src == P.SRC_ZQ
        zq_bias = zq_op & (tap == 1)                    # the trailing CONST op
        bank_busy = post_reading.bit_select(bank, 1)
        need_wait = first & f["wait"] & ~post_idle
        zq_stall = zq_op & ~zq_bias & ~zq.r_rdy
        can_issue = seg_v & ~is_post & ~bank_busy & ~need_wait & ~zq_stall & ~advancing
        m.d.comb += op_v.eq(can_issue)

        last_op = Signal()
        with m.Switch(src):
            with m.Case(P.SRC_RING):
                m.d.comb += last_op.eq((tap == taps_m1) & (ch == count_m1))
            with m.Case(P.SRC_XC):
                m.d.comb += last_op.eq(phase)
            with m.Case(P.SRC_ZQ):
                m.d.comb += last_op.eq(Mux(f["taps"][0], zq_bias, (ch == count_m1) & phase))
            with m.Default():
                m.d.comb += last_op.eq(1)

        m.d.comb += [
            op.src.eq(Mux(((src == P.SRC_XC) & phase) | zq_bias, P.SRC_CONST, src)),
            op.ring.eq(f["ring"]), op.tap.eq(tap), op.delay.eq(delay), op.ch.eq(ch),
            op.row.eq(row), op.bank.eq(bank), op.clear.eq(first & f["clear"]),
            op.lo.eq(zq_op & phase & ~zq_bias), op.aux.eq(f["aux"]),
        ]
        with m.If(op_v):
            m.d.sync += first.eq(0)
            # The high part of a z value reads the row without advancing; the low part advances.
            with m.If(~(zq_op & ~phase & ~zq_bias)):
                m.d.sync += row.eq(row + 1)
            with m.Switch(src):
                with m.Case(P.SRC_RING):
                    with m.If(ch == count_m1):
                        m.d.sync += [ch.eq(0), tap.eq(tap + 1), delay.eq(delay - f["dil"])]
                    with m.Else():
                        m.d.sync += ch.eq(ch + 1)
                with m.Case(P.SRC_XC):
                    m.d.sync += phase.eq(1)
                with m.Case(P.SRC_ZQ):
                    with m.If(~zq_bias):
                        m.d.sync += phase.eq(~phase)
                        with m.If(phase):
                            m.d.comb += zq.r_en.eq(1)
                            with m.If(ch == count_m1):
                                m.d.sync += [ch.eq(0), tap.eq(1)]
                            with m.Else():
                                m.d.sync += ch.eq(ch + 1)
            with m.If(last_op):
                m.d.sync += seg_v.eq(0)

        load = segq.r_rdy & ~seg_v & running & ~advancing
        with m.If(load):
            m.d.comb += segq.r_en.eq(1)
            nxt = segq.r_data
            nf = {name: nxt[lsb:lsb + width] for name, (lsb, width) in P.SEG_FIELDS.items()}
            m.d.sync += [seg.eq(nxt), seg_v.eq(1), tap.eq(0), ch.eq(0), phase.eq(0),
                         row.eq(nf["wrow"]), delay.eq(nf["delay0"]), first.eq(1)]

        pbank = f["pbank"]
        bank_landed = Array(inflight + [C(0, 5)])[pbank] == 0
        h_ready = (pbank != P.BANK_H) | post_idle
        m.d.comb += post_go.eq(seg_v & is_post & ~post_cmd_v & bank_landed & h_ready & ~advancing)
        m.d.comb += [
            post_cmd.bank.eq(pbank), post_cmd.count.eq(f["pcount"]), post_cmd.shift.eq(f["shift"]),
            post_cmd.leaky.eq(f["leaky"]), post_cmd.dest.eq(f["dest"]), post_cmd.ring.eq(f["pring"]),
            post_cmd.written.eq(f["written"]), post_cmd.clearacc.eq(f["clearacc"]),
            post_cmd.done.eq(f["done"]),
        ]
        with m.If(post_go):
            m.d.sync += seg_v.eq(0)

        # ==================================================================================
        # Sample control: start -> advance loop -> run -> done; clear; prefill
        # ==================================================================================
        clk_count = Signal(16)
        adv_i = Signal(range(max(self.n_rings, self.n_streams) + 1))
        m.submodules.pendq = pendq = SyncFIFOBuffered(width=6 + 1 + 8, depth=32)   # stream, slot, due
        pre_i = Signal(range(self.n_streams + 1))
        pre_slot = Signal()
        clr_i = Signal(range(self.hist_words + 1))

        with m.FSM():
            with m.State("IDLE"):
                with m.If(self.clear):
                    m.d.sync += [clearing.eq(1), clr_i.eq(0), self.late.eq(0), sample_no.eq(0)]
                    m.next = "CLEAR"
                with m.Elif(self.prefill):
                    m.d.sync += [prefilling.eq(1), pre_i.eq(0), pre_slot.eq(0)]
                    m.next = "PREFILL"
                with m.Elif(self.start):
                    m.d.sync += [adc_reg.eq(self.adc), sample_no.eq(sample_no + 1),
                                 adv_i.eq(0), advancing.eq(1), clk_count.eq(0),
                                 running.eq(1), pc.eq(0), fetch_half.eq(0), fetch_done.eq(0),
                                 seg_v.eq(0)]
                    m.next = "ADVANCE"
            with m.State("CLEAR"):
                m.d.comb += [hist_wp.addr.eq(clr_i), hist_wp.data.eq(0), hist_wp.en.eq(1)]
                m.d.sync += clr_i.eq(clr_i + 1)
                with m.If(clr_i == self.hist_words - 1):
                    m.d.sync += clearing.eq(0)
                    m.next = "IDLE"
            with m.State("PREFILL"):
                # Two fetches for every read stream, in order.
                with m.If(pre_i == self.n_streams_used):
                    m.d.sync += prefilling.eq(0)
                    m.next = "IDLE"
                with m.Else():
                    m.d.comb += str_rd_adv.addr.eq(pre_i)
                    with m.If(str_rd_adv.data.write):
                        m.d.sync += pre_i.eq(pre_i + 1)
                    with m.Elif(pendq.w_rdy):
                        m.d.comb += [pendq.w_data.eq(Cat(pre_i[:6], pre_slot, sample_no)), pendq.w_en.eq(1)]
                        m.d.sync += pre_slot.eq(~pre_slot)
                        with m.If(pre_slot):
                            m.d.sync += pre_i.eq(pre_i + 1)
            with m.State("ADVANCE"):
                # Step every ring's write pointer and every stream's frame position.
                m.d.sync += clk_count.eq(clk_count + 1)
                m.d.comb += [ring_rd_adv.addr.eq(adv_i), wptr_rd_adv.addr.eq(adv_i),
                             str_rd_adv.addr.eq(adv_i), sdyn_rd_adv.addr.eq(adv_i)]
                with m.If(adv_i < self.n_rings_used):
                    nxt_w = Signal(12)
                    m.d.comb += nxt_w.eq(wptr_rd_adv.data + 1)
                    m.d.comb += [wptr_wp.addr.eq(adv_i), wptr_wp.en.eq(1),
                                 wptr_wp.data.eq(Mux(nxt_w == ring_rd_adv.data.frames, 0, nxt_w))]
                with m.If(adv_i < self.n_streams_used):
                    se = str_rd_adv.data
                    sd = sdyn_rd_adv.data
                    nxt_r = Signal(9)
                    half = Signal(8)
                    m.d.comb += [nxt_r.eq(sd.rpos + se.wpf), half.eq(se.swords >> 1)]
                    wrapped = nxt_r == se.swords
                    m.d.comb += [sdyn_wp.addr.eq(adv_i), sdyn_wp.en.eq(1),
                                 sdyn_wp.data.rpos.eq(Mux(wrapped, 0, nxt_r)), sdyn_wp.data.pos.eq(sd.pos)]
                    # Left a burst: slot 0 when entering slot 1, slot 1 when wrapping.
                    with m.If(wrapped | (nxt_r == half)):
                        m.d.comb += [pendq.w_data.eq(Cat(adv_i[:6], wrapped, sample_no)), pendq.w_en.eq(1)]
                        with m.If(~pendq.w_rdy):
                            m.d.sync += self.late.eq(1)
                m.d.sync += adv_i.eq(adv_i + 1)
                with m.If((adv_i + 1 >= self.n_rings_used) & (adv_i + 1 >= self.n_streams_used)):
                    m.d.sync += advancing.eq(0)
                    m.next = "RUN"
            with m.State("RUN"):
                m.d.sync += clk_count.eq(clk_count + 1)
                with m.If(post_done_evt):
                    m.d.sync += [running.eq(0), self.clocks.eq(clk_count)]
                    m.d.comb += [self.done.eq(1), self.clocks_stb.eq(1)]
                    m.next = "IDLE"

        # ==================================================================================
        # Transfers: pending (stream, slot) -> req and wdata; rdata -> the read buffer
        # ==================================================================================
        m.submodules.rdq = rdq = SyncFIFOBuffered(width=10 + 6 + 8, depth=8)   # dest, words, due
        xf_stream = Signal(6)
        xf_slot = Signal()
        xf_due = Signal(8)
        xf_cnt = Signal(6)
        xf_addr = Signal(exact_log2(self.sbuf_w_words))
        m.d.comb += [str_rd_xfer.addr.eq(xf_stream), sdyn_rd_xfer.addr.eq(xf_stream)]
        xe = str_rd_xfer.data
        xd = sdyn_rd_xfer.data
        slot_base = Signal(10)
        pos_next = Signal(22)
        pos_adv = Signal(23)
        m.d.comb += [
            slot_base.eq(xe.sbase + Mux(xf_slot, xe.burst, 0)),
            pos_adv.eq(xd.pos + xe.burst),
            pos_next.eq(Mux(pos_adv >= xe.pend, xe.pbase, pos_adv)),
        ]
        age = Signal(8)
        m.d.comb += age.eq(sample_no - xf_due)
        sdyn_pos_w = Signal()
        with m.If(sdyn_pos_w):
            m.d.comb += [sdyn_wp.addr.eq(xf_stream), sdyn_wp.en.eq(1),
                         sdyn_wp.data.rpos.eq(xd.rpos), sdyn_wp.data.pos.eq(pos_next)]
        with m.If(stream_init.en):
            m.d.comb += [sdyn_wp.addr.eq(stream_init.addr), sdyn_wp.en.eq(1),
                         sdyn_wp.data.rpos.eq(stream_init.rpos0), sdyn_wp.data.pos.eq(stream_init.pos0)]
        with m.If(ring_init.en):
            m.d.comb += [wptr_wp.addr.eq(ring_init.addr), wptr_wp.en.eq(1), wptr_wp.data.eq(0)]

        with m.FSM():
            with m.State("IDLE"):
                with m.If(pendq.r_rdy & ~advancing):
                    m.d.comb += pendq.r_en.eq(1)
                    m.d.sync += [xf_stream.eq(pendq.r_data[:6]), xf_slot.eq(pendq.r_data[6]),
                                 xf_due.eq(pendq.r_data[7:]), xf_cnt.eq(0)]
                    m.next = "LOOK"
            with m.State("LOOK"):
                with m.If(age > self.late_after):
                    m.d.sync += self.late.eq(1)
                with m.If(xe.write):
                    m.d.sync += xf_addr.eq(slot_base)
                    m.next = "COPY"
                with m.Elif(rdq.w_rdy & self.req.ready):
                    m.d.comb += [
                        self.req.valid.eq(1), self.req.payload.write.eq(0),
                        self.req.payload.addr.eq(xd.pos), self.req.payload.words.eq(xe.burst),
                        rdq.w_data.eq(Cat(slot_base, xe.burst, xf_due)), rdq.w_en.eq(1),
                        sdyn_pos_w.eq(1),
                    ]
                    m.next = "IDLE"
            with m.State("COPY"):
                # The slot's words into the write FIFO: a read, then the word.
                m.d.comb += sbw_rp.addr.eq(xf_addr)
                m.next = "COPY2"
            with m.State("COPY2"):
                m.d.comb += [sbw_rp.addr.eq(xf_addr), self.wdata.valid.eq(1),
                             self.wdata.payload.eq(sbw_rp.data)]
                with m.If(self.wdata.ready):
                    m.d.sync += [xf_addr.eq(xf_addr + 1), xf_cnt.eq(xf_cnt + 1)]
                    with m.If(xf_cnt + 1 == xe.burst):
                        m.next = "WREQ"
                    with m.Else():
                        m.next = "COPY"
            with m.State("WREQ"):
                m.d.comb += [self.req.valid.eq(1), self.req.payload.write.eq(1),
                             self.req.payload.addr.eq(xd.pos), self.req.payload.words.eq(xe.burst)]
                with m.If(self.req.ready):
                    m.d.comb += sdyn_pos_w.eq(1)
                    m.next = "IDLE"

        rd_dest = Signal(10)
        rd_cnt = Signal(6)
        rd_due = Signal(8)
        rd_active = Signal()
        with m.If(~rd_active & rdq.r_rdy):
            m.d.comb += rdq.r_en.eq(1)
            m.d.sync += [rd_dest.eq(rdq.r_data[:10]), rd_cnt.eq(rdq.r_data[10:16]),
                         rd_due.eq(rdq.r_data[16:]), rd_active.eq(1)]
        m.d.comb += self.rdata.ready.eq(rd_active)
        with m.If(rd_active & self.rdata.valid):
            m.d.comb += [sbr_wp.addr.eq(rd_dest), sbr_wp.data.eq(self.rdata.payload), sbr_wp.en.eq(1)]
            m.d.sync += [rd_dest.eq(rd_dest + 1), rd_cnt.eq(rd_cnt - 1)]
            with m.If(rd_cnt == 1):
                m.d.sync += rd_active.eq(0)
                with m.If((sample_no - rd_due) > self.late_after):
                    m.d.sync += self.late.eq(1)

        # ==================================================================================
        # The MAC pipeline: issue, s1 tables, s2 frame, s3 address, s4 read, s5 operands,
        # s6-s8 multiply, s9 accumulate
        # ==================================================================================
        s1 = Signal(OpLayout)
        s1_v = Signal()
        s1_ring = Signal(RingEntry)
        s1_wptr = Signal(12)
        m.d.comb += [ring_rd_op.addr.eq(op.ring), wptr_rd_op.addr.eq(op.ring)]
        m.d.sync += [s1.eq(op), s1_v.eq(op_v), s1_ring.eq(ring_rd_op.data), s1_wptr.eq(wptr_rd_op.data)]

        s2 = Signal(OpLayout)
        s2_v = Signal()
        s2_ring = Signal(RingEntry)
        s2_idx = Signal(12)
        d = Signal(signed(13))
        m.d.comb += d.eq(s1_wptr - s1.delay)
        m.d.sync += [s2.eq(s1), s2_v.eq(s1_v), s2_ring.eq(s1_ring),
                     s2_idx.eq(Mux(d < 0, d + s1_ring.frames, d))]

        s3 = Signal(OpLayout)
        s3_v = Signal()
        s3_haddr = Signal(exact_log2(self.hist_words))
        s3_saddr = Signal(exact_log2(self.sbuf_r_words))
        s3_psram = Signal()
        s3_half = Signal()
        stream_id = Signal(6)
        m.d.comb += [stream_id.eq(s2_ring.stream0 + s2.tap), str_rd_op.addr.eq(stream_id),
                     sdyn_rd_op.addr.eq(stream_id)]
        m.d.sync += [
            s3.eq(s2), s3_v.eq(s2_v), s3_psram.eq(s2_ring.psram), s3_half.eq(s2.ch[0]),
            s3_haddr.eq(s2_ring.base + (s2_idx << s2_ring.stride) + s2.ch),
            s3_saddr.eq(str_rd_op.data.sbase + sdyn_rd_op.data.rpos + s2.ch[1:]),
        ]

        s4 = Signal(OpLayout)
        s4_v = Signal()
        s4_psram = Signal()
        s4_half = Signal()
        m.d.comb += [hist_rp.addr.eq(s3_haddr), sbr_rp.addr.eq(s3_saddr),
                     wmem_rp.addr.eq(s3.row), aux_rp.addr.eq(s3.row)]
        m.d.sync += [s4.eq(s3), s4_v.eq(s3_v), s4_psram.eq(s3_psram), s4_half.eq(s3_half)]

        # z values are taken from the FIFO's head when issued, and ride along.
        zq_hi = Signal(signed(ACT))
        zq_lo = Signal(signed(ACT))
        m.d.comb += [zq_hi.eq(zq.r_data[6:24].as_signed()), zq_lo.eq(zq.r_data[0:6])]
        zq_pipe = [Signal(signed(ACT), name=f"zqp{i}") for i in range(4)]
        m.d.sync += zq_pipe[0].eq(Mux(op.lo, zq_lo, zq_hi))
        for i in range(1, 4):
            m.d.sync += zq_pipe[i].eq(zq_pipe[i - 1])

        s5 = Signal(OpLayout)
        s5_v = Signal()
        act = Signal(signed(ACT))
        wcols = Signal(NC * W)
        auxw = Signal(W)
        ring_val = Signal(signed(ACT))
        with m.If(s4_psram):
            m.d.comb += ring_val.eq(Mux(s4_half, sbr_rp.data[16:32], sbr_rp.data[0:16]).as_signed())
        with m.Else():
            m.d.comb += ring_val.eq(hist_rp.data.as_signed())
        with m.Switch(s4.src):
            with m.Case(P.SRC_RING):
                m.d.sync += act.eq(ring_val)
            with m.Case(P.SRC_X):
                m.d.sync += act.eq(x_reg)
            with m.Case(P.SRC_CONST):
                m.d.sync += act.eq(const_act)
            with m.Case(P.SRC_ZQ):
                m.d.sync += act.eq(zq_pipe[3])
            with m.Case(P.SRC_Y):
                m.d.sync += act.eq(y_reg)
            with m.Case(P.SRC_ADC):
                m.d.sync += act.eq(adc_reg)
        m.d.sync += [s5.eq(s4), s5_v.eq(s4_v), wcols.eq(wmem_rp.data), auxw.eq(aux_rp.data)]

        mults = []
        for c in range(NC):
            mult = Mult18(hw=self.hw_mult)
            m.submodules[f"mult{c}"] = mult
            wc = wcols[c * W:(c + 1) * W].as_signed()
            m.d.comb += [mult.a.eq(act),
                         mult.b.eq(Mux(s5.aux, auxw.as_signed(), Mux(s5.lo, wc >> 6, wc)))]
            mults.append(mult)
        stages = [(s5, s5_v)]
        for i in range(3):
            sv = Signal(OpLayout, name=f"s{6 + i}")
            vv = Signal(name=f"s{6 + i}_v")
            m.d.sync += [sv.eq(stages[-1][0]), vv.eq(stages[-1][1])]
            stages.append((sv, vv))
        s8, s8_v = stages[-1]
        for b in range(3):
            with m.If(s8_v & (s8.bank == b)):
                for c in range(NC):
                    m.d.sync += banks[b][c].eq(Mux(s8.clear, 0, banks[b][c]) + mults[c].p)
            inc = op_v & (op.bank == b)
            dec = s8_v & (s8.bank == b)
            m.d.sync += inflight[b].eq(inflight[b] + inc - dec)

        # ==================================================================================
        # The post unit: p0 select, p1 value, p2-p5 leaky, p6 round, p7-p8 shift, p9 write
        # ==================================================================================
        cmd = Signal(PostCmd)
        cmd_v = Signal()
        armed = Signal(2)               # the command's table lookups are registered
        pi = Signal(4)
        items = Signal(5)
        rnd = Signal(ACC)
        p_ring = Signal(RingEntry)
        p_wptr = Signal(12)
        p_stream = Signal(StreamEntry)
        p_sdyn = Signal(StreamDyn)
        m.d.comb += [ring_rd_post.addr.eq(cmd.ring), wptr_rd_post.addr.eq(cmd.ring),
                     str_rd_post.addr.eq(p_ring.wstream), sdyn_rd_post.addr.eq(p_ring.wstream)]
        m.d.sync += [p_ring.eq(ring_rd_post.data), p_wptr.eq(wptr_rd_post.data),
                     p_stream.eq(str_rd_post.data), p_sdyn.eq(sdyn_rd_post.data)]
        m.d.comb += [post_idle.eq(~cmd_v & (items == 0)), post_cmd_v.eq(cmd_v)]
        with m.If(post_go):
            m.d.sync += [cmd.eq(post_cmd), cmd_v.eq(1), pi.eq(0), armed.eq(0),
                         rnd.eq(Mux(post_cmd.shift == 0, 0, C(1, ACC) << (post_cmd.shift - 1)))]
        for b in range(3):
            m.d.comb += post_reading[b].eq(cmd_v & (cmd.bank == b))
        with m.If(cmd_v & (armed != 2)):
            m.d.sync += armed.eq(armed + 1)
        item_go = cmd_v & (armed == 2)

        colsel = []
        for c in range(NC):
            v = Signal(signed(ACC), name=f"bankmux{c}")
            with m.Switch(cmd.bank):
                with m.Case(0):
                    m.d.comb += v.eq(banks[0][c])
                with m.Case(1):
                    m.d.comb += v.eq(banks[1][c])
                with m.Case(2):
                    m.d.comb += v.eq(banks[2][c])
                with m.Default():
                    m.d.comb += v.eq(hacc[c])
            colsel.append(v)
        PItem = data.StructLayout({"i": 4, "last": 1, "dest": 3, "leaky": 1, "shift": 6,
                                   "done": 1, "haddr": exact_log2(self.hist_words),
                                   "saddr": exact_log2(self.sbuf_w_words), "half": 1, "bits": 2})
        p1 = Signal(PItem)
        p1_v = Signal()
        p1_val = Signal(signed(ACC))
        with m.If(item_go):
            m.d.sync += pi.eq(pi + 1)
            with m.If(pi + 1 == cmd.count):
                m.d.sync += cmd_v.eq(0)
            with m.If(cmd.clearacc):
                for c in range(NC):
                    with m.If(pi == c):
                        m.d.sync += hacc[c].eq(0)
        m.d.sync += [
            p1_v.eq(item_go), p1_val.eq(Array(colsel)[pi]),
            p1.i.eq(pi), p1.last.eq(pi + 1 == cmd.count), p1.dest.eq(cmd.dest),
            p1.leaky.eq(cmd.leaky), p1.shift.eq(cmd.shift), p1.done.eq(cmd.done),
            p1.haddr.eq(p_ring.base + (p_wptr << p_ring.stride) + pi),
            p1.saddr.eq(p_stream.sbase + p_sdyn.rpos + pi[1:]),
            p1.half.eq(pi[0]),
            # 0: 16 bits, 1: 18, 2: 24
            p1.bits.eq(Mux(cmd.dest == P.DST_OUT, 0,
                           Mux(cmd.dest == P.DST_RING, Mux(p_ring.psram, 0, 1),
                               Mux((cmd.dest == P.DST_ZQ) | (cmd.dest == P.DST_H), 2, 1)))),
        ]

        def stage(prev, prev_v, name):
            s = Signal(PItem, name=name)
            v = Signal(name=name + "_v")
            m.d.sync += [s.eq(prev), v.eq(prev_v)]
            return s, v

        terms = [(p1_val >> s) if sign > 0 else -(p1_val >> s) for s, sign in LEAKY_TERMS]
        la, lb, lc = (Signal(signed(ACC), name=n) for n in ("la", "lb", "lc"))
        v2, v3, v4, v5 = (Signal(signed(ACC), name=n) for n in ("v2", "v3", "v4", "v5"))
        p2, p2_v = stage(p1, p1_v, "p2")
        m.d.sync += [la.eq(terms[0] + terms[1]), lb.eq(terms[2] + terms[3]), lc.eq(terms[4]), v2.eq(p1_val)]
        p3, p3_v = stage(p2, p2_v, "p3")
        lab = Signal(signed(ACC))
        lc3 = Signal(signed(ACC))
        m.d.sync += [lab.eq(la + lb), lc3.eq(lc), v3.eq(v2)]
        p4, p4_v = stage(p3, p3_v, "p4")
        neg = Signal(signed(ACC))
        m.d.sync += [neg.eq(lab + lc3), v4.eq(v3)]
        p5, p5_v = stage(p4, p4_v, "p5")
        m.d.sync += v5.eq(Mux(p4.leaky & (v4 < 0), neg, v4))
        p6, p6_v = stage(p5, p5_v, "p6")
        v6 = Signal(signed(ACC + 1))
        m.d.sync += v6.eq(v5 + rnd)
        p7, p7_v = stage(p6, p6_v, "p7")
        v7 = Signal(signed(ACC + 1))
        m.d.sync += v7.eq(v6 >> p6.shift[:3])
        p8, p8_v = stage(p7, p7_v, "p8")
        v8 = Signal(signed(ACC + 1))
        m.d.sync += v8.eq(v7 >> Cat(C(0, 3), p7.shift[3:]))

        res = Signal(signed(24))
        for code, bits in ((0, 16), (1, 18), (2, 24)):
            lim = (1 << (bits - 1)) - 1
            with m.If(p8.bits == code):
                m.d.comb += res.eq(Mux(v8 > lim, lim, Mux(v8 < -lim - 1, -lim - 1, v8)))
        m.d.comb += post_done_evt.eq(p8_v & p8.done & p8.last)
        with m.If(p8_v):
            with m.Switch(p8.dest):
                with m.Case(P.DST_RING):
                    with m.If(p8.bits == 1):
                        m.d.comb += [hist_wp.addr.eq(p8.haddr), hist_wp.data.eq(res[:ACT]), hist_wp.en.eq(1)]
                    with m.Else():
                        m.d.comb += [sbw_wp.addr.eq(p8.saddr), sbw_wp.data.eq(Cat(res[:16], res[:16])),
                                     sbw_wp.en.eq(Mux(p8.half, 0b10, 0b01))]
                with m.Case(P.DST_ZQ):
                    m.d.comb += [zq.w_data.eq(res), zq.w_en.eq(1)]
                    for c in range(NC):
                        with m.If(p8.i == c):
                            m.d.sync += hacc[c].eq(hacc[c] + res)
                with m.Case(P.DST_H):
                    for c in range(NC):
                        with m.If(p8.i == c):
                            m.d.sync += hacc[c].eq(hacc[c] + res)
                with m.Case(P.DST_X):
                    m.d.sync += x_reg.eq(res[:ACT])
                with m.Case(P.DST_Y):
                    m.d.sync += y_reg.eq(res[:ACT])
                with m.Case(P.DST_OUT):
                    m.d.sync += self.out.eq(res[:16])
        m.d.sync += items.eq(items + item_go - p8_v)

        return m
