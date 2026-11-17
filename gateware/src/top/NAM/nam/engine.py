"""The NAM engine: a multiply-accumulate datapath driven by a program.

Everything here is clocked by the module's `sync` domain, which the SoC renames
to `fast` (120 MHz); the memories the CPU fills (weights, aux, program, the
ring and stream tables) have their write ports in `host_domain` instead, and
the stream buffers their bus-side ports in `bus_domain`, where the PSRAM
master reads and writes them directly.
`model/program.py` documents the program the sequencer executes and generates
it; `model/fixed.py` holds the arithmetic.

    sequencer ─ops─► tables ─► memories ─► 8 × MULT18X18D ─► accumulators Z0 Z1 LIN
                                                                       │
                  post unit ◄──────────────────────────────────────────┘
                  LeakyReLU, shift, round, saturate ─► ring / z FIFO / newest FIFO
                                                       / H / x, y, out

Activations are 18 bits, weights 18 bits (a column of 8 per row of the weight
memory), accumulators 40 bits. A MAC op issues every clock the sequencer has
one ready; its product lands in the accumulator eleven clocks later. POST
commands go into a short queue and the sequencer carries on; the post unit
starts one when its bank's last product has landed (a POST of H also waits
for its pipeline to empty), takes one accumulator per clock and writes each
result eight clocks later. The sequencer stalls a MAC into a bank that a queued
or running POST still has to read, a MAC that needs a z or newest value the
FIFO doesn't have yet, and a MAC segment with `wait` until the post unit is
idle (for x and y).

Everything is built for 120 MHz on a busy ECP5 (README, "Fitting"): block RAMs
are read through their output registers (`nam/bram.py`), long selections and
read-modify-writes are split over two stages, and the sequencer issues from
two segment slots (one issuing, the other loading) whose stall conditions and
"last op of the segment" are registers, updated alongside what they depend on,
so the issue decision is a few levels of logic.

History rings in block RAM are addressed `base + (frame << stride) + channel`,
the frame counting back from each ring's write pointer, which the advance loop
steps at the start of every sample. Rings in PSRAM are read from stream
buffers: each (ring, tap) is a read stream with a region of two bursts in the
read buffer, and each ring has a write stream with a region in the write
buffer. A program's streams share one geometry (`wpf_log2`, `burst_log2`,
powers of two), so a region is found from the stream's number, and a ring's
streams move through their regions together: one position per ring, which the
advance loop steps by a frame per sample. When it leaves a burst, the ring's
transfers are queued: for each read stream, a fetch of the burst two ahead,
and a flush of its write stream's finished burst, which the host side
(`nam/streams.py`) performs on the PSRAM bus, moving each burst between the
PSRAM and the stream buffer at `req.buf` and pulsing `xfer_done` when it has
finished (in order). Each stream keeps its PSRAM position in a small table; PSRAM rings
are all `2**ring_log2` words, aligned, so a position wraps with a mask. A
transfer still outstanding `late_after` samples after it was queued sets
`late`. For the data to be there in time, a tap's delay must be at least three
bursts of frames.
"""

from amaranth import *
from amaranth.lib import data, stream, wiring
from amaranth.lib.fifo import SyncFIFO, SyncFIFOBuffered
from amaranth.lib.memory import Memory
from amaranth.lib.wiring import In, Out
from amaranth.utils import ceil_log2

from model import program as P
from model.fixed import LEAKY_TERMS

from .bram import BlockRam
from .fifo import QuickFifo

ACC = 40
ACT = 18
W = 18
PROD = 36
HACC = 32       # the eight running sums of z (24 bits) over the layers

# A ring: where its block-RAM frames are, or which streams carry it. `rpos0` only
# initialises its position when the entry is written.
RingEntry = data.StructLayout({
    "base": 14, "frames": 12, "stride": 2, "psram": 1, "stream0": 5, "nread": 4, "wnum": 3,
    "rpos0": 5})
RingDyn = data.StructLayout({"wptr": 12, "rpos": 5})
# A transfer: `words` 32-bit words between PSRAM word `addr` and stream buffer word `buf`
# (the read buffer for a fetch, the write buffer for a flush).
Req = data.StructLayout({"write": 1, "addr": 22, "words": 6, "buf": 10})
POS_BITS = P.POS_BITS

# One MAC op as it travels down the pipeline.
OpLayout = data.StructLayout({
    "src": 3, "ring": 5, "tap": 4, "delay": 12, "ch": 3, "row": 11, "bank": 2,
    "clear": 1, "lo": 1, "aux": 1})
PostCmd = data.StructLayout({
    "bank": 2, "count": 4, "shift": 6, "leaky": 1, "dest": 3, "ring": 5, "newest": 1,
    "clearacc": 1, "done": 1})


def pack(layout, values):
    v = 0
    for name, f in layout:
        v |= (int(values[name]) & ((1 << f.width) - 1)) << f.offset
    return v


def encode_ring(r: P.Ring):
    return pack(RingEntry, {"base": r.base, "frames": r.frames, "stride": r.stride,
                            "psram": int(r.psram), "stream0": r.stream0, "nread": len(r.streams),
                            "wnum": r.wnum, "rpos0": r.rpos0})


def encode_pos(s: P.Stream):
    """A stream's entry in the position table (at `s.pos_index`)."""
    return s.pos0()


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
            # Only the ports in use are connected: tying the C, shift-in (cascade) or
            # unused clock pins to ground leaves nextpnr an arc of the ground net it
            # can't route.
            for i in range(18):
                ports[f"i_A{i}"] = self.a[i]
                ports[f"i_B{i}"] = self.b[i]
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
                i_CLK0=ClockSignal(), i_CE0=C(1), i_RST0=ResetSignal(),
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
                 segments=256, n_rings=P.N_RINGS, host_domain="sync", bus_domain="sync", pring_base=0,
                 hw_mult=False):
        """`pring_base`: the PSRAM word address of the rings' area (a multiple of
        2**POS_BITS); stream positions are offsets into it."""
        assert columns == 8
        assert pring_base % (1 << POS_BITS) == 0 and pring_base >> POS_BITS < 1 << (22 - POS_BITS)
        self.columns = columns
        self.wmem_rows, self.aux_words, self.hist_words = wmem_rows, aux_words, hist_words
        self.sbuf_r_words, self.sbuf_w_words = sbuf_r_words, sbuf_w_words
        self.segments, self.n_rings = segments, n_rings
        self.n_pos = P.N_READ_STREAMS + P.N_WRITE_STREAMS
        self.pring_base = pring_base
        self.host_domain = host_domain
        self.bus_domain = bus_domain
        self.hw_mult = hw_mult
        super().__init__({
            # A sample.
            "start": In(1),
            "adc": In(signed(16)),
            "out": Out(signed(16)),
            "done": Out(1),
            "busy": Out(1),
            # Tables and memories, written by the host (while the engine is idle).
            "wmem_w": In(data.StructLayout({"addr": ceil_log2(wmem_rows), "data": columns * W, "en": 1})),
            "aux_w": In(data.StructLayout({"addr": ceil_log2(aux_words), "data": W, "en": 1})),
            "prog_w": In(data.StructLayout({"addr": ceil_log2(2 * segments), "data": P.WORD, "en": 1})),
            "ring_w": In(data.StructLayout({"addr": ceil_log2(n_rings), "data": RingEntry.size, "en": 1})),
            "pos_w": In(data.StructLayout({"addr": ceil_log2(self.n_pos), "data": POS_BITS, "en": 1})),
            "n_rings_used": In(range(n_rings + 1)),
            "n_segments": In(range(segments + 1)),
            "late_after": In(4),
            # The streams' geometry, for the whole program (powers of two): 32-bit
            # words per frame, per burst, and per PSRAM ring.
            "wpf_log2": In(2),
            "burst_log2": In(3),
            "ring_log2": In(5),
            "clear": In(1),         # zero the history pool, the write buffer and the pointers
            "prefill": In(1),       # fetch every read stream's two bursts
            # PSRAM transfers (to nam/streams.py).
            "req": Out(stream.Signature(Req)),
            "xfer_done": In(1),
            # The stream buffers' bus side (in `bus_domain`): fetched words into the read
            # buffer, flushed words out of the write buffer (one clock after the address).
            "sbr_w": In(data.StructLayout({"addr": ceil_log2(sbuf_r_words), "data": 32, "en": 1})),
            "sbw_addr": In(ceil_log2(sbuf_w_words)),
            "sbw_data": Out(32),
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
        # The memories the engine reads at its own pace are `BlockRam`s: a read takes two
        # clocks and comes out of the block RAM's output register (a block RAM's data
        # without it is 5.8 ns after the clock). The history pool and the weight memory
        # are one per block RAM depth (1024 x 18, 512 x 144), so the depth is selected
        # after those registers.
        HP, WP = 1024, 512
        hw = self.hw_mult
        hists = [BlockRam(ACT, min(HP, self.hist_words - k * HP), hw=hw)
                 for k in range(-(-self.hist_words // HP))]
        wmems = [BlockRam(NC * W, min(WP, self.wmem_rows - k * WP), w_domain=hd, hw=hw)
                 for k in range(-(-self.wmem_rows // WP))]
        for k, mem in enumerate(hists):
            m.submodules[f"hist{k}"] = mem
        for k, mem in enumerate(wmems):
            m.submodules[f"wmem{k}"] = mem
        m.submodules.sbuf_r = sbuf_r = BlockRam(32, self.sbuf_r_words, w_domain=self.bus_domain, hw=hw)
        m.submodules.sbuf_w = sbuf_w = Memory(shape=unsigned(32), depth=self.sbuf_w_words, init=[])
        m.submodules.aux = aux = BlockRam(W, self.aux_words, w_domain=hd, hw=hw)
        m.submodules.prog = prog = BlockRam(P.WORD, 2 * self.segments, w_domain=hd, hw=hw)
        m.submodules.rings = rings = Memory(shape=RingEntry, depth=self.n_rings, init=[])
        m.submodules.rdyn = rdyn = Memory(shape=RingDyn, depth=self.n_rings, init=[])
        m.submodules.spos = spos = Memory(shape=unsigned(POS_BITS), depth=self.n_pos, init=[])

        # One write port in front of all the history's (the post unit's, the clear's),
        # registered once per block RAM: they are spread over the chip. (Nothing reads
        # a frame the clock after it is written: this sample's go by the newest FIFO.)
        hist_we8 = Signal(len(hists))   # the post unit's write, decoded per RAM a stage early
        sbw_we8 = Signal(2)             # the same for the stream buffer's two halves
        # (the write ports are driven below the post unit, which sets these)
        m.d.comb += [sbuf_r.w_addr.eq(self.sbr_w.addr), sbuf_r.w_data.eq(self.sbr_w.data),
                     sbuf_r.w_en.eq(self.sbr_w.en)]
        sbw_rp = sbuf_w.read_port(domain=self.bus_domain, transparent_for=())
        m.d.comb += [sbw_rp.addr.eq(self.sbw_addr), self.sbw_data.eq(sbw_rp.data)]
        sbw_wp = sbuf_w.write_port(granularity=16)
        for k, mem in enumerate(wmems):
            m.d.comb += [mem.w_addr.eq(self.wmem_w.addr[:9]), mem.w_data.eq(self.wmem_w.data),
                         mem.w_en.eq(self.wmem_w.en & (self.wmem_w.addr[9:] == k))]
        # The ring table (written by the host) is read by the op pipeline, the post
        # unit, the advance loop and the transfers, each port for the few fields it
        # uses; the rings' positions (written here) by the first three. Stream
        # positions are used by the transfers alone.
        ring_wp = rings.write_port(domain=hd)
        ring_rd_op = rings.read_port(domain="comb")
        ring_rd_post = rings.read_port(domain="comb")
        ring_rd_adv = rings.read_port(domain="comb")
        ring_rd_xfer = rings.read_port(domain="comb")
        rdyn_rd_op = rdyn.read_port(domain="comb")
        rdyn_rd_post = rdyn.read_port(domain="comb")
        rdyn_rd_adv = rdyn.read_port(domain="comb")
        rdyn_wp = rdyn.write_port()
        spos_rd = spos.read_port(domain="comb")
        spos_wp = spos.write_port()

        m.d.comb += [
            aux.w_addr.eq(self.aux_w.addr), aux.w_data.eq(self.aux_w.data), aux.w_en.eq(self.aux_w.en),
            prog.w_addr.eq(self.prog_w.addr), prog.w_data.eq(self.prog_w.data), prog.w_en.eq(self.prog_w.en),
            ring_wp.addr.eq(self.ring_w.addr), ring_wp.data.eq(self.ring_w.data), ring_wp.en.eq(self.ring_w.en),
        ]
        # A ring write also sets the ring's position, and a position write the stream's
        # (taken into this domain plainly: the host only writes tables while the
        # engine is idle).
        ring_init = Signal(data.StructLayout({"addr": ceil_log2(self.n_rings), "en": 1, "rpos0": 5}))
        pos_init = Signal(data.StructLayout({"addr": ceil_log2(self.n_pos), "en": 1, "pos": POS_BITS}))
        m.d.sync += [
            ring_init.addr.eq(self.ring_w.addr), ring_init.en.eq(self.ring_w.en),
            ring_init.rpos0.eq(RingEntry(self.ring_w.data).rpos0),
            pos_init.addr.eq(self.pos_w.addr), pos_init.en.eq(self.pos_w.en), pos_init.pos.eq(self.pos_w.data),
        ]

        # The streams' geometry, as masks and sizes (and the quasi-static inputs used as
        # they are, as registers: a path from a port is a path from anywhere).
        burst_log2 = Signal.like(self.burst_log2)
        n_rings_used = Signal.like(self.n_rings_used)
        late_after = Signal.like(self.late_after)
        m.d.sync += [burst_log2.eq(self.burst_log2), n_rings_used.eq(self.n_rings_used),
                     late_after.eq(self.late_after)]
        wpf = Signal(4)
        burst = Signal(6)
        burst_mask = Signal(5)
        region_mask = Signal(5)
        ring_mask = Signal(POS_BITS)
        m.d.sync += [
            wpf.eq(C(1, 4) << self.wpf_log2), burst.eq(C(1, 6) << self.burst_log2),
            burst_mask.eq((C(1, 6) << self.burst_log2) - 1),
            region_mask.eq((C(1, 7) << (self.burst_log2 + 1)) - 1),
            ring_mask.eq((C(1, POS_BITS + 1) << self.ring_log2) - 1),
        ]

        def region(num, offset):
            """A stream's region start plus an offset into it: `num` shifted by the
            region's size, or'd with the offset (regions are aligned to their size)."""
            out = Signal(16)
            with m.Switch(burst_log2):
                for k in range(5):
                    with m.Case(k):
                        m.d.comb += out.eq(Cat(offset[:k + 1], num))
            return out

        # ---- state -----------------------------------------------------------------------
        x_reg = Signal(signed(ACT))
        y_reg = Signal(signed(ACT))
        adc_reg = Signal(signed(16))
        sample_no = Signal(8)
        const_act = C(1 << P.CONST_SHIFT, signed(ACT))
        banks = [[Signal(signed(ACC), name=f"acc{b}_{c}") for c in range(NC)] for b in range(3)]
        hacc = [Signal(signed(HACC), name=f"h{c}") for c in range(NC)]
        inflight = [Signal(5, name=f"inflight{b}") for b in range(3)]
        # (their read enables come from the issue decision: see nam/fifo.py)
        m.submodules.zq = zq = QuickFifo(24)
        m.submodules.nq = nq = QuickFifo(ACT)
        running = Signal()
        advancing = Signal()
        # `running & ~advancing` as a register kept in step (set as the advance loop
        # ends, cleared with `running`): the loads read it, and the sample state
        # machine sits a long way from the slots.
        loads_ok = Signal()
        clearing = Signal()
        prefilling = Signal()
        m.d.comb += self.busy.eq(running | advancing | clearing | prefilling)

        # Post unit handshake (the unit is below).
        post_idle = Signal()            # nothing queued, no command, nothing in its pipeline
        post_holds = Signal(3)          # banks a queued or running command still has to read
        # (buffered: its head is a register)
        m.submodules.postq = postq = SyncFIFOBuffered(width=PostCmd.size, depth=4)
        post_done_evt = Signal()

        # ==================================================================================
        # Sequencer: fetch segments into a queue, execute them from two slots
        # ==================================================================================
        # The issuing slot (`act`) issues while the other loads from the queue, so the
        # issue decision never waits on a load: a segment's end only flips `act`. Each
        # slot works out its own "can issue" from its own registers; `act` picks one.
        m.submodules.segq = segq = SyncFIFOBuffered(width=2 * P.WORD, depth=8)   # (its head a register)
        pc = Signal(range(self.segments + 1))
        fetch_half = Signal()
        fetch_done = Signal()
        fetch_lo = Signal(P.WORD)
        issue_fetch = Signal()
        word_v = Signal()
        word_half = Signal()
        # (the last segment's number as a register: the compare runs beside the fetch
        # decision, not after it)
        last_seg = Signal.like(pc)
        m.d.sync += last_seg.eq(self.n_segments - 1)
        m.d.comb += issue_fetch.eq(running & ~fetch_done & (segq.w_level < 5))
        m.d.comb += prog.r_addr.eq(Cat(fetch_half, pc))
        with m.If(issue_fetch):
            m.d.sync += fetch_half.eq(~fetch_half)
            with m.If(fetch_half):
                m.d.sync += pc.eq(pc + 1)
                with m.If(pc == last_seg):
                    m.d.sync += fetch_done.eq(1)
        # The program memory's word comes two clocks after its address.
        word2_v = Signal()
        word2_half = Signal()
        prog_q = prog.r_data
        m.d.sync += [word_v.eq(issue_fetch), word_half.eq(fetch_half),
                     word2_v.eq(word_v), word2_half.eq(word_half)]
        with m.If(word2_v & ~word2_half):
            m.d.sync += fetch_lo.eq(prog_q)
        m.d.comb += [segq.w_data.eq(Cat(fetch_lo, prog_q)), segq.w_en.eq(word2_v & word2_half)]

        # What stalls an op, kept in registers (set below) so the decision is short:
        busy_q = Signal(3)          # banks a queued or running POST has yet to read (a clock late
                                    # to clear, never late to set: a POST queued now counts)
        idle_q = Signal()           # the post unit was idle and nothing was queued
        landing_q = Signal(3)       # banks with ops still on their way in
        zq_ne = Signal()            # the z FIFO holds a value
        nq_ne = Signal()            # the newest FIFO holds a value

        act = Signal()              # the issuing slot
        rf = {name: segq.r_data[lsb:lsb + width] for name, (lsb, width) in P.SEG_FIELDS.items()}

        class Slot:
            pass

        slots = []
        for k in range(2):
            s = Slot()
            s.seg = Signal(2 * P.WORD, name=f"seg{k}")
            s.v = Signal(name=f"seg{k}_v")
            s.f = f = {name: s.seg[lsb:lsb + width] for name, (lsb, width) in P.SEG_FIELDS.items()}
            s.tap = Signal(4, name=f"tap{k}")
            s.ch = Signal(3, name=f"ch{k}")
            s.phase = Signal(name=f"phase{k}")
            s.row = Signal(11, name=f"row{k}")
            s.delay = Signal(12, name=f"delay{k}")
            s.first = Signal(name=f"first{k}")
            # Decoded as the segment loads, and as its z values run out: a z segment, its
            # trailing bias op, a newest segment; and whether the op at the current position
            # is the segment's last.
            s.zq = Signal(name=f"zq_op{k}")
            s.zb = Signal(name=f"zq_bias{k}")
            s.nq = Signal(name=f"nq_op{k}")
            s.last = Signal(name=f"last_op{k}")
            # (taps and count less one and two, set as the slot loads; minus two wraps
            # to a value the counters never reach when there is no such position)
            s.taps_m1 = taps_m1 = Signal(4, name=f"taps_m1_{k}")
            s.taps_m2 = taps_m2 = Signal(4, name=f"taps_m2_{k}")
            s.count_m1 = count_m1 = Signal(3, name=f"count_m1_{k}")
            s.count_m2 = count_m2 = Signal(4, name=f"count_m2_{k}")
            s.count_one = count_one = Signal(name=f"count_one_{k}")
            src, bank = f["src"], f["bank"]

            # Can this slot's next op issue (if it is the issuing one)? Only a segment's
            # first op can stall: `ok`, a register (below the loads), says whether it may
            # go. The ops after it follow a clock apart, which nothing can hold up: a
            # bank is posted only after the segment into it has ended, and the post unit
            # writes a command's z and newest values a clock apart, as fast as they are
            # read or faster.
            s.ok = Signal(name=f"ok{k}")
            s.rz = Signal(name=f"reads_z{k}")      # the op pops the z FIFO (a low part)
            s.osrc = Signal(3, name=f"op_src{k}")  # the op's source (XC: x, then the constant)
            s.ci = Signal(name=f"can_issue{k}")
            m.d.comb += s.ci.eq(s.v & ~f["kind"] & (~s.first | s.ok))
            s.ce = Signal(name=f"issue{k}")
            m.d.comb += s.ce.eq(s.ci & (act == k))
            s.post_ready = s.v & f["kind"]

            # Whether the op after this one is the last (worked out alongside).
            last_after = Signal(name=f"last_after{k}")
            at_count = s.ch == count_m1
            with m.Switch(src):
                with m.Case(P.SRC_RING, P.SRC_NEWEST):
                    m.d.comb += last_after.eq(Mux(at_count, (s.tap == taps_m2) & count_one,
                                                  (s.tap == taps_m1) & (s.ch == count_m2)))
                with m.Case(P.SRC_XC):
                    m.d.comb += last_after.eq(1)
                with m.Case(P.SRC_ZQ):
                    # (with the bias: the bias op, after the last z's low part; without: the
                    # last z's low part, after its high part)
                    m.d.comb += last_after.eq(Mux(f["taps"][0], s.phase & at_count & ~s.zb,
                                                  ~s.phase & at_count))

            # The op this slot would issue.
            s.op = Signal(OpLayout, name=f"op{k}")
            m.d.comb += [
                s.op.src.eq(s.osrc),
                s.op.ring.eq(f["ring"]), s.op.tap.eq(s.tap + f["tap0"]), s.op.delay.eq(s.delay),
                s.op.ch.eq(s.ch), s.op.row.eq(s.row), s.op.bank.eq(bank),
                s.op.clear.eq(s.first & f["clear"]), s.op.lo.eq(s.zq & s.phase & ~s.zb),
                s.op.aux.eq(f["aux"]),
            ]

            # Its counters step as it issues.
            with m.If(s.ce):
                m.d.sync += [s.first.eq(0), s.last.eq(last_after)]
                # The high part of a z value reads the row without advancing; the low part advances.
                with m.If(~(s.zq & ~s.phase & ~s.zb)):
                    m.d.sync += s.row.eq(s.row + 1)
                with m.Switch(src):
                    with m.Case(P.SRC_RING, P.SRC_NEWEST):
                        with m.If(at_count):
                            m.d.sync += [s.ch.eq(0), s.tap.eq(s.tap + 1), s.delay.eq(s.delay - f["dil"])]
                        with m.Else():
                            m.d.sync += s.ch.eq(s.ch + 1)
                    with m.Case(P.SRC_XC):
                        m.d.sync += [s.phase.eq(1), s.osrc.eq(P.SRC_CONST)]
                    with m.Case(P.SRC_ZQ):
                        with m.If(~s.zb):
                            # (the next op pops if it is a low part; none does once the
                            # bias op is reached)
                            m.d.sync += [s.phase.eq(~s.phase), s.rz.eq(~s.phase)]
                            with m.If(s.phase):
                                with m.If(at_count):
                                    m.d.sync += [s.ch.eq(0), s.tap.eq(1), s.zb.eq(1), s.osrc.eq(P.SRC_CONST)]
                                with m.Else():
                                    m.d.sync += s.ch.eq(s.ch + 1)
            slots.append(s)
        # The FIFOs' reads: every op of a newest segment, the low part of each z.
        m.d.comb += [nq.r_en.eq((slots[0].ce & slots[0].nq) | (slots[1].ce & slots[1].nq)),
                     zq.r_en.eq((slots[0].ce & slots[0].rz) | (slots[1].ce & slots[1].rz))]

        op = Signal(OpLayout)
        op_v = Signal()
        m.d.comb += [op.eq(Mux(act, slots[1].op, slots[0].op)), op_v.eq(Mux(act, slots[1].ci, slots[0].ci))]

        # A POST goes into the queue; the sequencer moves on.
        # (no slot holds a segment while advancing: they're emptied at the start and loads
        # wait for the advance loop, so neither this nor the issue decision checks it)
        post_go = Mux(act, slots[1].post_ready, slots[0].post_ready) & postq.w_rdy
        post_cmd = Signal(PostCmd)
        pf = {name: Mux(act, slots[1].f[name], slots[0].f[name]) for name in P.POST_FIELDS}
        m.d.comb += [
            post_cmd.bank.eq(pf["pbank"]), post_cmd.count.eq(pf["pcount"]), post_cmd.shift.eq(pf["shift"]),
            post_cmd.leaky.eq(pf["leaky"]), post_cmd.dest.eq(pf["dest"]), post_cmd.ring.eq(pf["pring"]),
            post_cmd.newest.eq(pf["newest"]), post_cmd.clearacc.eq(pf["clearacc"]),
            post_cmd.done.eq(pf["done"]),
            postq.w_data.eq(post_cmd), postq.w_en.eq(post_go),
        ]

        # A segment's end (its last op issued, or its POST queued) empties its slot and
        # hands over to the other.
        ending = Signal()
        m.d.comb += ending.eq(Mux(act, slots[1].ce & slots[1].last, slots[0].ce & slots[0].last) | post_go)
        with m.If(ending):
            m.d.sync += act.eq(~act)
            for k, s in enumerate(slots):
                with m.If(act == k):
                    m.d.sync += s.v.eq(0)

        # An empty slot loads from the queue, from registers only: the issuing slot when it
        # is empty, else the other.
        s0, s1 = slots
        load0 = Signal()
        load1 = Signal()
        m.d.comb += [
            load0.eq(segq.r_rdy & loads_ok & ~s0.v & ((act == 0) | s1.v)),
            load1.eq(segq.r_rdy & loads_ok & ~s1.v & ((act == 1) | s0.v) & ~load0),
            segq.r_en.eq(load0 | load1),
        ]
        # An empty slot takes the queue's head every clock, its fields and what is worked
        # out from them (so their enables come from the `v` register, not from the load
        # decision, which only pops the queue and marks the slot full); the head taken as
        # the slot fills is the one popped.
        for s, ld in ((s0, load0), (s1, load1)):
            with m.If(ld):
                m.d.sync += s.v.eq(1)
            with m.If(~s.v):
                m.d.sync += [s.taps_m1.eq(rf["taps"] - 1), s.taps_m2.eq(rf["taps"] - 2),
                             s.count_m1.eq(rf["count"] - 1), s.count_m2.eq(rf["count"] - 2),
                             s.count_one.eq(rf["count"] == 1)]
                m.d.sync += [s.seg.eq(segq.r_data), s.tap.eq(0), s.ch.eq(0), s.phase.eq(0),
                             s.row.eq(rf["wrow"]), s.delay.eq(rf["delay0"]), s.first.eq(1),
                             s.zq.eq(~rf["kind"] & (rf["src"] == P.SRC_ZQ)), s.zb.eq(0), s.rz.eq(0),
                             s.nq.eq(~rf["kind"] & (rf["src"] == P.SRC_NEWEST)),
                             s.osrc.eq(Mux(rf["src"] == P.SRC_XC, P.SRC_X, rf["src"]))]
                # The first op is the last: a single op, or a ring/newest segment of one.
                with m.Switch(rf["src"]):
                    with m.Case(P.SRC_RING, P.SRC_NEWEST):
                        m.d.sync += s.last.eq((rf["taps"] == 1) & (rf["count"] == 1))
                    with m.Case(P.SRC_XC, P.SRC_ZQ):
                        m.d.sync += s.last.eq(0)
                    with m.Default():
                        m.d.sync += s.last.eq(1)

        # Whether a slot's first op may issue next clock, from this clock's registers
        # (the segment's fields from the queue's head while the slot loads): its bank not
        # held by a POST, the post unit idle if it waits for that, its FIFO holding a
        # value. A stall that lifts this clock is seen a clock later; one that falls this
        # clock can only come from a POST queued now, the two terms with `post_go`. (The
        # FIFO flags can't fall: only this segment reads its FIFO, and hasn't started. A
        # clearing op's bank has nothing landing in it: a POST of the bank comes between
        # its last accumulation and the clear, and holds it until everything has landed;
        # `model/program.py` checks programs for that.)
        # (Worked out twice, for the slot's own fields and for the head's, the load
        # choosing last; the POST queued this clock can only be the other slot's, read
        # from its registers: whether the queue has room is left out, which only holds
        # this slot while the other, the issuing one, is held too.)
        def may_go(bank, wait, reads_z, reads_newest, other):
            posting = (act == other) & slots[other].v & slots[other].f["kind"]
            return (~(busy_q.bit_select(bank, 1) | (posting & (slots[other].f["pbank"] == bank)))
                    & ~(wait & (~idle_q | posting))
                    & ~(reads_z & ~zq_ne) & ~(reads_newest & ~nq_ne))

        for k, (s, ld) in enumerate(((s0, load0), (s1, load1))):
            m.d.sync += s.ok.eq(Mux(
                ld, may_go(rf["bank"], rf["wait"], rf["src"] == P.SRC_ZQ, rf["src"] == P.SRC_NEWEST, 1 - k),
                may_go(s.f["bank"], s.f["wait"], s.zq, s.nq, 1 - k)))

        # ==================================================================================
        # Sample control: start -> advance loop -> run -> done; clear; prefill
        # ==================================================================================
        clk_count = Signal(16)
        adv_i = Signal(range(self.n_rings + 1))
        adv_more = Signal()             # adv_i < n_rings_used, kept as adv_i is set
        adv_first = n_rings_used != 0
        adv_next = (adv_i + 1) < n_rings_used
        # Pending transfers, one entry per ring and burst: ring, slot, due, prefill.
        m.submodules.pendq = pendq = SyncFIFOBuffered(width=5 + 1 + 8 + 1, depth=16)
        pre_slot = Signal()
        clr_i = Signal(range(max(self.hist_words, self.sbuf_w_words) + 1))
        # The clear's write enables, decoded for the next index as the index is set:
        # registers kept beside it, so each RAM's port register is one LUT from registers.
        clr_next = Signal.like(clr_i)
        m.d.comb += clr_next.eq(clr_i + 1)
        clr_we8 = Signal(len(hists))
        clr_sbw = Signal()
        clr_dec = [clr_we8.eq(Cat(*[(clr_next < self.hist_words) & (clr_next[10:] == k)
                                    for k in range(len(hists))])),
                   clr_sbw.eq(clr_next < self.sbuf_w_words)]
        ra = ring_rd_adv.data
        da = rdyn_rd_adv.data
        ra_q = Signal(RingEntry)
        da_q = Signal(RingDyn)
        adv_j = Signal(range(self.n_rings + 1))
        adv_v = Signal()
        adv_v2 = Signal()
        m.d.comb += [ring_rd_adv.addr.eq(adv_i), rdyn_rd_adv.addr.eq(adv_i)]

        with m.FSM():
            with m.State("IDLE"):
                m.d.sync += clk_count.eq(0)
                with m.If(self.clear):
                    m.d.sync += [clearing.eq(1), clr_i.eq(0), self.late.eq(0), sample_no.eq(0),
                                 clr_we8.eq(int(self.hist_words > 0)), clr_sbw.eq(int(self.sbuf_w_words > 0))]
                    m.next = "CLEAR"
                with m.Elif(self.prefill):
                    m.d.sync += [prefilling.eq(1), adv_i.eq(0), adv_more.eq(adv_first), pre_slot.eq(1)]
                    m.next = "PREFILL"
                with m.Elif(self.start):
                    m.d.sync += [adc_reg.eq(self.adc), sample_no.eq(sample_no + 1),
                                 adv_i.eq(0), adv_more.eq(adv_first), advancing.eq(1),
                                 running.eq(1), pc.eq(0), fetch_half.eq(0), fetch_done.eq(0),
                                 slots[0].v.eq(0), slots[1].v.eq(0), act.eq(0)]
                    m.next = "ADVANCE"
            with m.State("CLEAR"):
                # (the write ports take clr_i and the enables decoded for it: see below)
                m.d.sync += [clr_i.eq(clr_next)] + clr_dec
                with m.If(clr_i == max(self.hist_words, self.sbuf_w_words) - 1):
                    m.d.sync += clearing.eq(0)
                    m.next = "IDLE"
            with m.State("PREFILL"):
                # Every PSRAM ring's read streams: slot 1, then slot 0 (the ring's entry
                # read here, used from a register in PREFILL2).
                with m.If(~adv_more):
                    m.d.sync += prefilling.eq(0)
                    m.next = "IDLE"
                with m.Else():
                    m.d.sync += ra_q.eq(ra)
                    m.next = "PREFILL2"
            with m.State("PREFILL2"):
                with m.If(~ra_q.psram):
                    m.d.sync += [adv_i.eq(adv_i + 1), adv_more.eq(adv_next)]
                    m.next = "PREFILL"
                with m.Elif(pendq.w_rdy):
                    m.d.comb += [pendq.w_data.eq(Cat(adv_i[:5], pre_slot, sample_no, C(1, 1))),
                                 pendq.w_en.eq(1)]
                    m.d.sync += pre_slot.eq(~pre_slot)
                    with m.If(~pre_slot):
                        m.d.sync += [adv_i.eq(adv_i + 1), adv_more.eq(adv_next)]
                        m.next = "PREFILL"
            with m.State("ADVANCE"):
                # Step every ring's write pointer, and every PSRAM ring's position in
                # its streams' regions; leaving a burst queues the ring's transfers. Three
                # stages, a ring a clock: its entry is read here, the next one is worked
                # out and then written (below), from registers.
                m.d.sync += clk_count.eq(clk_count + 1)
                with m.If(adv_more):
                    m.d.sync += [ra_q.eq(ra), da_q.eq(da), adv_j.eq(adv_i), adv_v.eq(1),
                                 adv_i.eq(adv_i + 1), adv_more.eq(adv_next)]
                with m.Else():
                    m.d.sync += adv_v.eq(0)
                    with m.If(~adv_v & ~adv_v2):
                        m.d.sync += [advancing.eq(0), loads_ok.eq(1)]
                        m.next = "RUN"
            with m.State("RUN"):
                m.d.sync += clk_count.eq(clk_count + 1)
                with m.If(post_done_evt):
                    m.d.sync += [running.eq(0), loads_ok.eq(0), self.clocks.eq(clk_count)]
                    m.d.comb += [self.done.eq(1), self.clocks_stb.eq(1)]
                    m.next = "IDLE"
        # The advance loop's second stage works out a ring's next position (and whether
        # it leaves a burst: slot 0 when entering slot 1, slot 1 when wrapping), the third
        # writes it and queues the transfers.
        nxt_w = Signal(12)
        nxt_r = Signal(5)
        m.d.comb += [nxt_w.eq(da_q.wptr + 1), nxt_r.eq((da_q.rpos + wpf) & region_mask)]
        adv_k = Signal.like(adv_j)
        nw_q = Signal(12)
        nr_q = Signal(5)
        cross_q = Signal()
        slot_q = Signal()
        m.d.sync += [adv_v2.eq(adv_v), adv_k.eq(adv_j),
                     nw_q.eq(Mux(nxt_w == ra_q.frames, 0, nxt_w)),
                     nr_q.eq(Mux(ra_q.psram, nxt_r, da_q.rpos)),
                     cross_q.eq(ra_q.psram & ((nxt_r & burst_mask) == 0)), slot_q.eq(nxt_r == 0)]
        with m.If(adv_v2):
            m.d.comb += [rdyn_wp.addr.eq(adv_k), rdyn_wp.en.eq(1),
                         rdyn_wp.data.wptr.eq(nw_q), rdyn_wp.data.rpos.eq(nr_q)]
            with m.If(cross_q):
                m.d.comb += [pendq.w_data.eq(Cat(adv_k[:5], slot_q, sample_no, C(0, 1))),
                             pendq.w_en.eq(1)]
                with m.If(~pendq.w_rdy):
                    m.d.sync += self.late.eq(1)
        with m.If(ring_init.en):
            m.d.comb += [rdyn_wp.addr.eq(ring_init.addr), rdyn_wp.en.eq(1),
                         rdyn_wp.data.wptr.eq(0), rdyn_wp.data.rpos.eq(ring_init.rpos0)]

        # ==================================================================================
        # Transfers: a pending (ring, slot) -> each read stream's fetch, then the write
        # stream's flush, as requests; each request's due sample waits for its done
        # ==================================================================================
        m.submodules.doneq = doneq = SyncFIFOBuffered(width=8, depth=16)
        xf_ring = Signal(5)
        xf_slot = Signal()
        xf_due = Signal(8)
        xf_pre = Signal()
        xf_t = Signal(4)
        xf_pi = Signal(range(self.n_pos))       # the stream's entry in the position table
        # The ring's entry, read as the pending transfer is taken (the queue's head is a
        # register) and kept in a register for the states that use it.
        xr = Signal(RingEntry)
        m.d.comb += [ring_rd_xfer.addr.eq(Mux(pendq.r_en, pendq.r_data[:5], xf_ring)),
                     spos_rd.addr.eq(xf_pi)]
        m.d.sync += xr.eq(ring_rd_xfer.data)
        # The stream's position is read into a register (POS) before it's used.
        pos = Signal(POS_BITS)
        xf_wr = Signal()
        pos_next = Signal(POS_BITS)
        m.d.comb += pos_next.eq((pos & ~ring_mask) | ((pos + burst) & ring_mask))
        # How late the pending transfer is, as registers (a subtraction, then the
        # comparison): checked once the request goes out, two clocks after LOOK.
        age = Signal(8)
        overdue = Signal()
        m.d.sync += [age.eq(sample_no - xf_due), overdue.eq(age > late_after)]
        # The slot's start in the stream's region: slot 1 is a burst in.
        slot_off = Signal(5)
        m.d.comb += slot_off.eq(Mux(xf_slot, burst, 0))
        slot_buf = region(xf_pi[:5], slot_off)
        # (the write's address and data don't depend on whether it happens)
        pos_step = Signal()
        m.d.comb += [spos_wp.addr.eq(Mux(pos_init.en, pos_init.addr, xf_pi)),
                     spos_wp.data.eq(Mux(pos_init.en, pos_init.pos, pos_next)),
                     spos_wp.en.eq(pos_init.en | pos_step)]
        # Room for a request, as a register: only this machine queues requests and dones,
        # so room seen a clock ago is still there.
        room = Signal()
        # The request as registers (the master's queue is a long way off): offered the
        # clock after the decision, which `room` still covers.
        req_v = Signal()
        req_p = Signal(Req)
        m.d.comb += [self.req.valid.eq(req_v), self.req.payload.eq(req_p), doneq.w_data.eq(xf_due)]
        m.d.sync += req_v.eq(0)
        req_go = [req_v.eq(1), req_p.addr.eq(Cat(pos, C(self.pring_base >> POS_BITS, 22 - POS_BITS))),
                  req_p.words.eq(burst), req_p.buf.eq(slot_buf)]

        with m.FSM():
            with m.State("IDLE"):
                with m.If(pendq.r_rdy & ~advancing):
                    m.d.comb += pendq.r_en.eq(1)
                    m.d.sync += [xf_ring.eq(pendq.r_data[:5]), xf_slot.eq(pendq.r_data[5]),
                                 xf_due.eq(pendq.r_data[6:14]), xf_pre.eq(pendq.r_data[14]), xf_t.eq(0)]
                    m.next = "LOOK"
            with m.State("LOOK"):
                with m.If(xf_t < xr.nread):
                    m.d.sync += [xf_pi.eq(xr.stream0 + xf_t), xf_wr.eq(0)]
                    m.next = "POS"
                with m.Elif(~xf_pre):
                    m.d.sync += [xf_pi.eq(P.N_READ_STREAMS + xr.wnum), xf_wr.eq(1)]
                    m.next = "POS"
                with m.Else():
                    m.next = "IDLE"
            with m.State("POS"):
                m.d.sync += [pos.eq(spos_rd.data), room.eq(doneq.w_rdy & self.req.ready)]
                with m.If(xf_wr):
                    m.next = "FLUSH"
                with m.Else():
                    m.next = "FETCH"
            with m.State("FETCH"):
                with m.If(overdue):
                    m.d.sync += self.late.eq(1)
                with m.If(room):
                    m.d.comb += [doneq.w_en.eq(1), pos_step.eq(1)]
                    m.d.sync += req_go + [req_p.write.eq(0), xf_t.eq(xf_t + 1)]
                    m.next = "LOOK"
                with m.Else():
                    m.d.sync += room.eq(doneq.w_rdy & self.req.ready)
            with m.State("FLUSH"):
                with m.If(overdue):
                    m.d.sync += self.late.eq(1)
                with m.If(room):
                    m.d.comb += [doneq.w_en.eq(1), pos_step.eq(1)]
                    m.d.sync += req_go + [req_p.write.eq(1)]
                    m.next = "IDLE"
                with m.Else():
                    m.d.sync += room.eq(doneq.w_rdy & self.req.ready)

        # Transfers finish in order; one that finishes late_after samples after it was due sets late.
        # (the done's lateness too: the subtraction, then the comparison, a clock each)
        done_v = Signal()
        done_age = Signal(8)
        m.d.sync += [done_v.eq(self.xfer_done), done_age.eq(sample_no - doneq.r_data)]
        with m.If(self.xfer_done):
            m.d.comb += doneq.r_en.eq(1)
        with m.If(done_v & (done_age > late_after)):
            m.d.sync += self.late.eq(1)

        # ==================================================================================
        # The MAC pipeline: issue, s1 tables, s2 frame, s3 address, s4 read, s5 the memories'
        # output registers, s6 the ring value (and the weights' outputs), s7 operands,
        # s8-s10 multiply, s11 accumulate
        # ==================================================================================
        s1 = Signal(OpLayout)
        s1_v = Signal()
        s1_ring = Signal(RingEntry)
        s1_dyn = Signal(RingDyn)
        m.d.comb += [ring_rd_op.addr.eq(op.ring), rdyn_rd_op.addr.eq(op.ring)]
        m.d.sync += [s1.eq(op), s1_v.eq(op_v), s1_ring.eq(ring_rd_op.data), s1_dyn.eq(rdyn_rd_op.data)]

        s2 = Signal(OpLayout)
        s2_v = Signal()
        s2_ring = Signal(RingEntry)
        s2_idx = Signal(12)
        s2_sid = Signal(5)
        s2_word = Signal(5)
        d = Signal(signed(13))
        m.d.comb += d.eq(s1_dyn.wptr - s1.delay)
        m.d.sync += [s2.eq(s1), s2_v.eq(s1_v), s2_ring.eq(s1_ring),
                     s2_idx.eq(Mux(d < 0, d + s1_ring.frames, d)),
                     # A PSRAM tap: its stream, and the word of this sample's frame
                     # holding the channel (a frame starts on a multiple of wpf).
                     s2_sid.eq(s1_ring.stream0 + s1.tap), s2_word.eq(s1_dyn.rpos | s1.ch[1:])]

        s3 = Signal(OpLayout)
        s3_v = Signal()
        s3_haddr = Signal(ceil_log2(self.hist_words))
        s3_saddr = Signal(ceil_log2(self.sbuf_r_words))
        s3_psram = Signal()
        s3_half = Signal()
        saddr = region(s2_sid, s2_word)
        m.d.sync += [
            s3.eq(s2), s3_v.eq(s2_v), s3_psram.eq(s2_ring.psram), s3_half.eq(s2.ch[0]),
            s3_haddr.eq(s2_ring.base + (s2_idx << s2_ring.stride) + s2.ch),
            s3_saddr.eq(saddr),
        ]

        s4 = Signal(OpLayout)
        s4_v = Signal()
        s4_psram = Signal()
        s4_half = Signal()
        s4_hsel = Signal(range(len(hists)))
        s4_wsel = Signal(range(len(wmems)))
        for mem in hists:
            m.d.comb += mem.r_addr.eq(s3_haddr[:10])
        # (the weights and aux words a stage later, to land with the ring value's stage)
        for mem in wmems:
            m.d.comb += mem.r_addr.eq(s4.row[:9])
        m.d.comb += [sbuf_r.r_addr.eq(s3_saddr), aux.r_addr.eq(s4.row)]
        m.d.sync += [s4.eq(s3), s4_v.eq(s3_v), s4_psram.eq(s3_psram), s4_half.eq(s3_half),
                     s4_hsel.eq(s3_haddr[10:]), s4_wsel.eq(s3.row[9:])]

        # s5: every memory's output, as it came out.
        s5 = Signal(OpLayout)
        s5_v = Signal()
        s5_psram = Signal()
        s5_half = Signal()
        s5_hsel = Signal.like(s4_hsel)
        s5_wsel = Signal.like(s4_wsel)
        # (the memories' output registers)
        hq = [mem.r_data for mem in hists]
        wq = [mem.r_data for mem in wmems]
        sbq = sbuf_r.r_data
        aq = aux.r_data
        m.d.sync += [s5.eq(s4), s5_v.eq(s4_v), s5_psram.eq(s4_psram), s5_half.eq(s4_half),
                     s5_hsel.eq(s4_hsel), s5_wsel.eq(s4_wsel)]

        # z and newest values are taken from their FIFO's head when issued, and ride along.
        # (both heads captured as the op issues, the choice between them a stage later
        # from s1's fields: the op's source is decided late, and far from the FIFOs)
        nq_head = Signal(signed(ACT))
        zq_head = Signal(24)
        m.d.sync += [nq_head.eq(nq.r_data), zq_head.eq(zq.r_data)]
        zq_hi = Signal(signed(ACT))
        zq_lo = Signal(signed(ACT))
        m.d.comb += [zq_hi.eq(zq_head[6:24].as_signed()), zq_lo.eq(zq_head[0:6])]
        fifo_pipe = [Signal(signed(ACT), name=f"fifop{i}") for i in range(6)]
        m.d.sync += fifo_pipe[1].eq(Mux(s1.src == P.SRC_NEWEST, nq_head, Mux(s1.lo, zq_lo, zq_hi)))
        for i in range(2, 6):
            m.d.sync += fifo_pipe[i].eq(fifo_pipe[i - 1])

        # s6: the ring value, from whichever block RAM (or read buffer half) holds it.
        s6 = Signal(OpLayout)
        s6_v = Signal()
        s6_wsel = Signal.like(s5_wsel)
        ring_val = Signal(signed(ACT))
        rv6 = Signal(signed(ACT))
        with m.If(s5_psram):
            m.d.comb += ring_val.eq(Mux(s5_half, sbq[16:32], sbq[0:16]).as_signed())
        with m.Else():
            m.d.comb += ring_val.eq(Array(hq)[s5_hsel].as_signed())
        m.d.sync += [s6.eq(s5), s6_v.eq(s5_v), s6_wsel.eq(s5_wsel), rv6.eq(ring_val)]

        # s7: the operands.
        s7 = Signal(OpLayout)
        s7_v = Signal()
        act = Signal(signed(ACT))
        wcols = Signal(NC * W)
        auxw = Signal(W)
        with m.Switch(s6.src):
            with m.Case(P.SRC_RING):
                m.d.sync += act.eq(rv6)
            with m.Case(P.SRC_X):
                m.d.sync += act.eq(x_reg)
            with m.Case(P.SRC_CONST):
                m.d.sync += act.eq(const_act)
            with m.Case(P.SRC_ZQ, P.SRC_NEWEST):
                m.d.sync += act.eq(fifo_pipe[5])
            with m.Case(P.SRC_Y):
                m.d.sync += act.eq(y_reg)
            with m.Case(P.SRC_ADC):
                m.d.sync += act.eq(adc_reg)
        m.d.sync += [s7.eq(s6), s7_v.eq(s6_v), wcols.eq(Array(wq)[s6_wsel]), auxw.eq(aq)]

        mults = []
        for c in range(NC):
            mult = Mult18(hw=self.hw_mult)
            m.submodules[f"mult{c}"] = mult
            wc = wcols[c * W:(c + 1) * W].as_signed()
            m.d.comb += [mult.a.eq(act),
                         mult.b.eq(Mux(s7.aux, auxw.as_signed(), Mux(s7.lo, wc >> 6, wc)))]
            mults.append(mult)
        stages = [(s7, s7_v)]
        for i in range(3):
            sv = Signal(OpLayout, name=f"s{8 + i}")
            vv = Signal(name=f"s{8 + i}_v")
            m.d.sync += [sv.eq(stages[-1][0]), vv.eq(stages[-1][1])]
            stages.append((sv, vv))
        # The product lands at s_land; the stage before it resets a bank for a clearing op.
        s_pre, s_pre_v = stages[-2]
        s_land, s_land_v = stages[-1]
        for b in range(3):
            # Reset over enable maps onto the flip-flops' LSR and CE: one adder per
            # accumulator and no clear logic in front of it.
            with m.If(s_pre_v & s_pre.clear & (s_pre.bank == b)):
                for c in range(NC):
                    m.d.sync += banks[b][c].eq(0)
            with m.Elif(s_land_v & (s_land.bank == b)):
                for c in range(NC):
                    m.d.sync += banks[b][c].eq(banks[b][c] + mults[c].p)
            # The count takes an issued op a clock later (inc_q), off the issue decision's
            # path; landing_q, whether anything is on its way in, counts it at once.
            inc = op_v & (op.bank == b)
            inc_q = Signal(name=f"inc_q{b}")
            dec = s_land_v & (s_land.bank == b)
            m.d.sync += [inc_q.eq(inc), inflight[b].eq(inflight[b] + inc_q - dec)]
            m.d.sync += landing_q[b].eq(
                ~(((inflight[b] == 0) & ~inc_q) | ((inflight[b] == 1) & dec & ~inc_q)) | inc)
        m.d.comb += [zq_ne.eq(zq.ne), nq_ne.eq(nq.ne)]

        # ==================================================================================
        # The post unit: queue, p0 the item's lane of each bank, p1 its value, p2-p5 leaky,
        # p6-p7 shift, p7b round and the fit test's pieces, p8 saturate and write, p9 the
        # H sums' write-back
        # ==================================================================================
        cmd = Signal(PostCmd)
        cmd_v = Signal()
        armed = Signal(2)               # the command's table lookups are registered
        pi = Signal(4)
        items = Signal(5)
        p_ring = Signal(RingEntry)
        p_dyn = Signal(RingDyn)
        queued = [Signal(2, name=f"queued{b}") for b in range(3)]
        head = PostCmd(postq.r_data)
        head_bank = head.bank
        # From registers: whether the head's bank still has products on their way in,
        # and whether the post pipeline is empty.
        items_zero = Signal(reset=1)
        bank_landed = ~Cat(landing_q, C(0, 1)).bit_select(head_bank, 1)
        h_ready = (head_bank != P.BANK_H) | items_zero
        pop = postq.r_rdy & ~cmd_v & bank_landed & h_ready
        m.d.comb += postq.r_en.eq(pop)
        m.d.comb += [ring_rd_post.addr.eq(cmd.ring), rdyn_rd_post.addr.eq(cmd.ring)]
        m.d.sync += [p_ring.eq(ring_rd_post.data), p_dyn.eq(rdyn_rd_post.data)]
        # This sample's frame of a PSRAM ring, in its write stream's region.
        p_word = Signal(5)
        m.d.comb += p_word.eq(p_dyn.rpos | pi[1:])
        p_saddr = region(p_ring.wnum, p_word)
        # (the queue's level counts a command still on its way to the head)
        m.d.comb += post_idle.eq(~cmd_v & (postq.w_level == 0) & items_zero)
        m.d.sync += idle_q.eq(post_idle & ~post_go)
        for b in range(3):
            m.d.sync += busy_q[b].eq(post_holds[b] | (post_go & (post_cmd.bank == b)))
        for b in range(3):
            m.d.comb += post_holds[b].eq((cmd_v & (cmd.bank == b)) | (queued[b] != 0))
            m.d.sync += queued[b].eq(queued[b] + (post_go & (post_cmd.bank == b)) - (pop & (head_bank == b)))
        # The command is an H post, as a register (it selects the H sums' read).
        hpost = Signal()
        last_pi = Signal(4)             # the command's count less one
        at_last = pi == last_pi
        with m.If(pop):
            m.d.sync += [cmd.eq(head), cmd_v.eq(1), pi.eq(0), armed.eq(0), hpost.eq(head.bank == P.BANK_H),
                         last_pi.eq(head.count - 1)]
        with m.If(cmd_v & (armed != 2)):
            m.d.sync += armed.eq(armed + 1)
        item_go = cmd_v & (armed == 2)

        # The eight H sums share one adder and one read: an H post reads its item here
        # (nothing is accumulating then: it starts only once the post pipeline is
        # empty), otherwise the read serves the item at p8 (assigned below, with p8).
        # (While an H post runs nothing is accumulating: it starts once p1-p9 are empty.)
        h_read = hpost
        h_idx = Signal(3)
        h_cur = Signal(signed(HACC))
        m.d.comb += h_cur.eq(Array(hacc)[h_idx])
        PItem = data.StructLayout({"i": 4, "last": 1, "dest": 3, "leaky": 1, "shift": 6,
                                   "done": 1, "newest": 1, "haddr": ceil_log2(self.hist_words),
                                   "saddr": ceil_log2(self.sbuf_w_words), "half": 1, "bits": 2})
        # p0: the item's lane of each bank (and of H), as the item goes; p1: the bank's.
        p0 = Signal(PItem)
        p0_v = Signal()
        p0_h = Signal()
        p0_bank = Signal(2)
        cand = [Signal(signed(ACC), name=f"cand{b}") for b in range(3)]
        cand_h = Signal(signed(HACC))
        p1 = Signal(PItem)
        p1_v = Signal()
        p1_val = Signal(signed(ACC))
        with m.If(item_go):
            m.d.sync += pi.eq(pi + 1)
            with m.If(at_last):
                m.d.sync += [cmd_v.eq(0), hpost.eq(0)]
        m.d.sync += [p0_v.eq(item_go), p0_h.eq(hpost), p0_bank.eq(cmd.bank), cand_h.eq(h_cur)]
        m.d.sync += [cand[b].eq(Array(banks[b])[pi[:3]]) for b in range(3)]
        m.d.sync += [
            p0.i.eq(pi), p0.last.eq(at_last), p0.dest.eq(cmd.dest),
            p0.leaky.eq(cmd.leaky), p0.shift.eq(cmd.shift), p0.done.eq(cmd.done), p0.newest.eq(cmd.newest),
            p0.haddr.eq(p_ring.base + (p_dyn.wptr << p_ring.stride) + pi),
            p0.saddr.eq(p_saddr),
            p0.half.eq(pi[0]),
            # 0: 16 bits, 1: 18, 2: 24
            p0.bits.eq(Mux(cmd.dest == P.DST_OUT, 0,
                           Mux(cmd.dest == P.DST_RING, Mux(p_ring.psram, 0, 1),
                               Mux((cmd.dest == P.DST_ZQ) | (cmd.dest == P.DST_H), 2, 1)))),
        ]
        m.d.sync += [p1_v.eq(p0_v), p1.eq(p0), p1_val.eq(Mux(p0_h, cand_h, Array(cand)[p0_bank]))]

        def stage(prev, prev_v, name):
            s = Signal(PItem, name=name)
            v = Signal(name=name + "_v")
            m.d.sync += [s.eq(prev), v.eq(prev_v)]
            return s, v

        # LeakyReLU's negative side, 10486 / 2**20 as five truncated shifts:
        # (v >> 7) + (v >> 9) + (v >> 12) - (v >> 17) - (v >> 19), each adder only as
        # wide as its operands.
        assert tuple(LEAKY_TERMS) == ((7, 1), (9, 1), (12, 1), (17, -1), (19, -1)), LEAKY_TERMS
        la = Signal(signed(ACC - 7 + 1))
        lb = Signal(signed(ACC - 12 + 1))
        lc = Signal(signed(ACC - 19))
        v2, v3, v4, v5 = (Signal(signed(ACC), name=n) for n in ("v2", "v3", "v4", "v5"))
        p2, p2_v = stage(p1, p1_v, "p2")
        m.d.sync += [la.eq((p1_val >> 7) + (p1_val >> 9)), lb.eq((p1_val >> 12) - (p1_val >> 17)),
                     lc.eq(p1_val >> 19), v2.eq(p1_val)]
        p3, p3_v = stage(p2, p2_v, "p3")
        lab = Signal(signed(ACC - 7 + 2))
        lc3 = Signal.like(lc)
        m.d.sync += [lab.eq(la + lb), lc3.eq(lc), v3.eq(v2)]
        p4, p4_v = stage(p3, p3_v, "p4")
        neg = Signal(signed(ACC - 7 + 3))
        m.d.sync += [neg.eq(lab - lc3), v4.eq(v3)]
        p5, p5_v = stage(p4, p4_v, "p5")
        m.d.sync += v5.eq(Mux(p4.leaky & (v4 < 0), neg, v4))

        # Round half up and shift: (v + 2**(s-1)) >> s == ((2v >> s) + 1) >> 1 for every
        # s >= 0, so the barrel shifter takes 2v and the rounding becomes an increment
        # after it, in a narrow adder. A result fits B bits exactly when 2v >> s lies in
        # [-2**B - 1, 2**B - 2]; outside it, it saturates (-2**B - 1 lands on the minimum
        # either way, so the test is "bits B up all equal, and not 2**B - 1").
        p6, p6_v = stage(p5, p5_v, "p6")
        w6 = Signal(signed(ACC + 1))
        m.d.sync += w6.eq(Cat(C(0, 1), v5).as_signed() >> p5.shift[:3])
        p7, p7_v = stage(p6, p6_v, "p7")
        w7 = Signal(signed(ACC + 1))
        m.d.sync += w7.eq(w6 >> Cat(C(0, 3), p6.shift[3:]))
        # The fit test in two stages: its pieces (the bit groups all equal, the low bits
        # all set) as registers at p7b, the test itself from them. In one stage the
        # pieces chained into one another, seven LUTs deep.
        p7b, p7b_v = stage(p7, p7_v, "p7b")
        r7b = Signal(signed(24))
        neg7b = Signal()
        top0, top1, m18_0, m18_1, m16_0, m16_1, lo16 = (
            Signal(name=n) for n in ("top0", "top1", "m18_0", "m18_1", "m16_0", "m16_1", "lo16"))
        m.d.sync += [top0.eq(w7[24:] == 0), top1.eq(w7[24:].all()),
                     m18_0.eq(w7[18:24] == 0), m18_1.eq(w7[18:24].all()),
                     m16_0.eq(w7[16:18] == 0), m16_1.eq(w7[16:18].all()), lo16.eq(w7[:16].all()),
                     r7b.eq((w7[:25].as_signed() + 1) >> 1), neg7b.eq(w7[ACC])]
        p8, p8_v = stage(p7b, p7b_v, "p8")
        r8 = Signal(signed(24))
        sat8 = Signal()
        hi0 = {0: top0 & m18_0 & m16_0, 1: top0 & m18_0, 2: top0}
        hi1 = {0: top1 & m18_1 & m16_1, 1: top1 & m18_1, 2: top1}
        lo1 = {0: lo16, 1: lo16 & m16_1, 2: lo16 & m16_1 & m18_1}
        sat7b = Signal()
        with m.Switch(p7b.bits):
            for code in (0, 1, 2):
                with m.Case(code):
                    m.d.comb += sat7b.eq(~(hi0[code] | hi1[code]) | (hi0[code] & lo1[code]))
        m.d.sync += [r8.eq(r7b), sat8.eq(sat7b)]

        # The saturation limit as a register beside sat8 (from the width and the sign
        # at p7b), so the result is one LUT a bit from registers: it goes a chip's width
        # to the RAMs and FIFOs, and the placer may put that crossing in any stage.
        # (sat7b is 0 for a width code without a case, so the limit is never stale)
        lim8 = Signal(signed(24))
        with m.Switch(p7b.bits):
            for code, bits in ((0, 16), (1, 18), (2, 24)):
                lim = (1 << (bits - 1)) - 1
                with m.Case(code):
                    m.d.sync += lim8.eq(Mux(neg7b, -lim - 1, lim))
        res = Signal(signed(24))
        m.d.comb += res.eq(Mux(sat8, lim8, r8))
        # (a register: the sample state machine is a long way from the post unit)
        m.d.sync += post_done_evt.eq(p8_v & p8.done & p8.last)

        # H: one adder for the eight sums, in two stages: an item's sum is read at p8
        # and written back with its z added at p9 (the item after it is another lane).
        # An H post's read clears its item (the flip-flops' reset, over the accumulate,
        # which can't coincide with it: such a post starts when p1-p9 are empty).
        p9_v = Signal()
        p9_acc = Signal()
        p9_i = Signal(3)
        p9_res = Signal(signed(24))
        p9_h = Signal(signed(HACC))
        m.d.comb += h_idx.eq(Mux(h_read, pi[:3], p8.i[:3]))
        m.d.sync += [p9_v.eq(p8_v), p9_acc.eq(p8_v & ((p8.dest == P.DST_ZQ) | (p8.dest == P.DST_H))),
                     p9_i.eq(p8.i[:3]), p9_res.eq(res), p9_h.eq(h_cur)]
        # (the clear the clock after the read, from registers: nothing accumulates during
        # an H post, and the next command's reads come later still)
        h_clr = Signal()
        h_clr_i = Signal(3)
        m.d.sync += [h_clr.eq(item_go & cmd.clearacc), h_clr_i.eq(pi[:3])]
        for c in range(NC):
            with m.If(h_clr & (h_clr_i == c)):
                m.d.sync += hacc[c].eq(0)
            with m.Elif(p9_acc & (p9_i == c)):
                m.d.sync += hacc[c].eq(p9_h + p9_res)
        # The FIFOs' write enables are registers, decoded a stage early: the post unit
        # sits by the block RAMs, the FIFOs by the sequencer, 4 ns of wire apart.
        # The writes' enables, decoded from p7 into registers at p7b and copied once
        # more at p8: the post unit sits a chip's width from the FIFOs and RAMs (4 ns
        # of wire), so the hop that crosses carries no logic.
        nq_w7b = Signal()
        zq_w7b = Signal()
        hist_we7b = Signal(len(hists))
        sbw_we7b = Signal(2)
        # (the history and stream-buffer writes' conditions, and the RAM select as a
        # one-hot, are registers at p7 from p6's fields: no stage deeper than two LUTs,
        # wherever the placer puts the chip crossing; a three-LUT decode got it inside)
        hist_w7 = Signal()
        sbw_w7 = Signal()
        hist_sel7 = Signal(len(hists))
        m.d.sync += [hist_w7.eq(p6_v & (p6.dest == P.DST_RING) & (p6.bits == 1)),
                     sbw_w7.eq(p6_v & (p6.dest == P.DST_RING) & (p6.bits != 1)),
                     hist_sel7.eq(Cat(*[p6.haddr[10:] == k for k in range(len(hists))]))]
        m.d.sync += [nq_w7b.eq(p7_v & (p7.dest == P.DST_RING) & p7.newest),
                     zq_w7b.eq(p7_v & (p7.dest == P.DST_ZQ)),
                     hist_we7b.eq(Cat(*[hist_w7 & hist_sel7[k] for k in range(len(hists))])),
                     sbw_we7b.eq(Cat(sbw_w7 & ~p7.half, sbw_w7 & p7.half))]
        nq_w8 = Signal()
        zq_w8 = Signal()
        m.d.sync += [nq_w8.eq(nq_w7b), zq_w8.eq(zq_w7b), hist_we8.eq(hist_we7b), sbw_we8.eq(sbw_we7b)]
        m.d.comb += [nq.w_data.eq(res[:ACT]), nq.w_en.eq(nq_w8), zq.w_data.eq(res), zq.w_en.eq(zq_w8)]
        # The history and stream-buffer write ports: the clear's write or the post unit's,
        # chosen by `clearing` (a register; no post write comes while clearing), with the
        # enables decoded a stage early into registers on both sides, so each port
        # register is one LUT from registers (sharing the port's signals put the post
        # unit's p8 cone in the select, five LUTs and a chip's width of wire from the RAMs).
        # (hist_we8 and sbw_we8 come from the decode at p7 above)
        for k, mem in enumerate(hists):
            m.d.sync += [mem.w_addr.eq(Mux(clearing, clr_i, p8.haddr)[:10]),
                         mem.w_data.eq(Mux(clearing, 0, res[:ACT])),
                         mem.w_en.eq(Mux(clearing, clr_we8[k], hist_we8[k]))]
        # The stream buffer's port through registers of the engine's own, like the
        # history RAMs': the buffer sits by the PSRAM master, a chip's width from the
        # post unit, and the result is saturated in the same clock. The write lands a
        # clock later; the earliest read of it, a flush, comes with the next sample.
        sbw_a9 = Signal.like(sbw_wp.addr)
        sbw_d9 = Signal(32)
        sbw_en9 = Signal(2)
        m.d.sync += [sbw_a9.eq(Mux(clearing, clr_i, p8.saddr)),
                     sbw_d9.eq(Mux(clearing, 0, Cat(res[:16], res[:16]))),
                     sbw_en9.eq(Mux(clearing, Cat(clr_sbw, clr_sbw), sbw_we8))]
        m.d.comb += [sbw_wp.addr.eq(sbw_a9), sbw_wp.data.eq(sbw_d9), sbw_wp.en.eq(sbw_en9)]
        with m.If(p8_v):
            with m.Switch(p8.dest):
                with m.Case(P.DST_X):
                    m.d.sync += x_reg.eq(res[:ACT])
                with m.Case(P.DST_Y):
                    m.d.sync += y_reg.eq(res[:ACT])
                with m.Case(P.DST_OUT):
                    m.d.sync += self.out.eq(res[:16])
        items_next = Signal.like(items)
        m.d.comb += items_next.eq(items + item_go - p9_v)
        m.d.sync += [items.eq(items_next), items_zero.eq(items_next == 0)]

        # For the tests: every write the post unit makes, and every op's operands.
        self.dbg_write = Signal(data.StructLayout({"v": 1, "dest": 3, "haddr": 14, "saddr": 10,
                                                   "half": 1, "val": signed(24)}))
        m.d.comb += [
            self.dbg_write.v.eq(p8_v), self.dbg_write.dest.eq(p8.dest), self.dbg_write.haddr.eq(p8.haddr),
            self.dbg_write.saddr.eq(p8.saddr), self.dbg_write.half.eq(p8.half), self.dbg_write.val.eq(res),
        ]
        self.dbg_op = Signal(data.StructLayout({"v": 1, "src": 3, "row": 11, "bank": 2, "clear": 1,
                                                "act": signed(18), "w0": signed(18)}))
        m.d.comb += [
            self.dbg_op.v.eq(s7_v), self.dbg_op.src.eq(s7.src), self.dbg_op.row.eq(s7.row),
            self.dbg_op.bank.eq(s7.bank), self.dbg_op.clear.eq(s7.clear), self.dbg_op.act.eq(act),
            self.dbg_op.w0.eq(mults[0].b),
        ]
        return m
