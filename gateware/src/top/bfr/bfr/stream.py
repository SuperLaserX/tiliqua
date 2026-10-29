"""PSRAM stream engine: serves the core's PSRAM delay-memory port from block RAM.

The core reads and writes the PSRAM space every clock and can't wait, so it
never touches the PSRAM. Each PSRAM tap is a stream with a region in one of
two block-RAM buffers, a power of two in size, holding the word for PSRAM
address a at buf | (a & bmask):

- a read tap's region holds the window it may read this sample
  (offset - depth - 1 .. offset + depth for a modulated tap) plus two bursts:
  the next one, already fetched, and the one after, being fetched;
- a write tap's region holds two bursts: the one being written and the one
  being flushed.

The core addresses the buffers itself (the tap entries carry buf and bmask),
with the timing of the block-RAM space: address in stage 5, data in stage 6.

Every N samples (N = burst) each stream moves one aligned burst. A scanner
walks the stream table once per sample; for sample f it requests

- read stream with lead L (offset + depth): if (f + L) % N == 0, fetch the
  burst starting at f + L + N;
- write stream at offset W: if (f + W) % N == 0, flush the burst that ended
  at f + W - 1 (written during the last N samples).

Requests are served in order, one burst at a time, and each has N samples to
complete: a fetched burst is first read N samples after its request, and a
flushed burst's region slots are overwritten N samples after. A request that
completes later sets `late`. Because a flush is queued 2N samples after its
first word was written at the latest, and a fetch N samples before its first
word is read, a read at least 2N + 1 samples behind its line's write sees the
written data (`engine.check` enforces this).

After a stream's offset changes, or it is enabled, its region holds the right
words once the scanner has fetched its window and two bursts: the program's
warm-up (`compiler._streams`), which the CPU waits before fading to it.

If the scanner falls more than `resync` samples behind (the bus was
starved), it jumps to the present instead of working through the backlog:
the skipped bursts are lost either way, and a backlog would keep every
later request late too. Each jump sets `late` and counts in `resyncs`.

`pending` is high while the engine has work queued or under way, so the
PSRAM arbiter can let it finish a sample's bursts back to back. Not during
a clear: its bursts take turns with the other masters (it holding the bus
for the whole clear starved the framebuffer, `bfr/video.py`).

`clear` zeroes the delay ring in the PSRAM and both buffers (at power-up the
PSRAM holds noise, and the model's memory starts at zero). `clearing` stays
high for at least `zero_words` clocks, so the core can zero its block-RAM
delay space alongside.
"""

from amaranth import *
from amaranth.lib import data, wiring
from amaranth.lib.fifo import SyncFIFOBuffered
from amaranth.lib.memory import Memory
from amaranth.lib.wiring import In, Out
from amaranth.utils import exact_log2
from amaranth_soc import wishbone

from model import isa

from .core import BUF_W, OFF_W, DelayPort, WritePort

STab = data.StructLayout({"lead": OFF_W, "buf": BUF_W, "bmask": BUF_W, "write": 1, "en": 1})
Req = data.StructLayout({"write": 1, "padr": OFF_W, "buf": BUF_W, "f": 8})
LAG_W = 8


def stream_lead(t, offset=None):
    """The scanner's lead for tap `t`: its highest address relative to ptr."""
    off = t.offset if offset is None else offset
    return (off + (t.depth if t.kind == isa.TAP_MOD else 0)) % (1 << OFF_W)


def encode_stab(t, offset=None, enable=True):
    """Stream-table entry for PSRAM tap `t` (with its offset replaced by `offset`)."""
    return (stream_lead(t, offset) | t.buf << OFF_W | t.bmask << (OFF_W + BUF_W)
            | int(t.kind == isa.TAP_WRITE) << (OFF_W + 2 * BUF_W)
            | int(enable) << (OFF_W + 2 * BUF_W + 1))


def stream_table(prog, enabled=None):
    """Stream-table image of a program; `enabled(tap index)` selects running streams."""
    return [encode_stab(prog.taps[i], enable=enabled is None or enabled(i))
            for i in prog.streams["taps"]]


def bus_signature(addr_width=23):
    return wishbone.Signature(addr_width=addr_width, data_width=32, granularity=8,
                              features={"cti", "bte"})


class StreamEngine(wiring.Component):
    """
    Parameters: `burst` words per burst (the program's), buffer sizes in words,
    `max_streams` table entries, `clear_burst` words per burst while clearing,
    `stab_init` an initial stream table (`stream_table`).

    `ptr` is the core's delay pointer; the ring is `ring_mask + 1` words at
    word `ring_base` of the bus (aligned to the ring size). Statistics since the
    last clear: `bursts`, `max_lag` (samples from a request to its completion,
    saturating), `late` (a request missed its deadline), `scan_lag` (most
    samples the scanner was behind, saturating) and `resyncs`.
    """

    def __init__(self, *, burst=isa.STREAM_BURST, rbuf_words=isa.RBUF_WORDS,
                 wbuf_words=isa.WBUF_WORDS, max_streams=isa.N_TAP, addr_width=23,
                 clear_burst=64, fifo_depth=16, resync=32, zero_words=0, stab_init=None,
                 stats=True):
        assert burst >= 2 and burst & (burst - 1) == 0
        assert clear_burst % burst == 0 and clear_burst & (clear_burst - 1) == 0
        assert rbuf_words <= 1 << BUF_W and wbuf_words <= 1 << BUF_W
        self.burst, self.clear_burst = burst, clear_burst
        self.rbuf_words, self.wbuf_words = rbuf_words, wbuf_words
        self.max_streams, self.fifo_depth = max_streams, fifo_depth
        assert 0 < resync < 1 << (OFF_W - 1)
        self.resync = resync
        self.stab_init = list(stab_init or [])
        # The statistics (bursts, max_lag, scan_lag, resyncs) are diagnostics:
        # without them they read 0, and their counters go. `late` stays.
        self.stats = stats
        # A clear lasts at least this many clocks (the buffers' size, or more
        # for others zeroing alongside: the core's block-RAM delay space).
        self.zero_words = max(rbuf_words, wbuf_words, zero_words)
        assert self.zero_words <= 1 << (BUF_W + 1)
        super().__init__({
            "core": In(DelayPort()),
            "ptr": In(OFF_W),
            "ring_mask": In(OFF_W),
            "ring_base": In(addr_width),
            "n_streams": In(range(max_streams + 1)),
            "stab_w": In(WritePort(exact_log2(max_streams), STab.size)),
            "clear": In(1),
            "clearing": Out(1),
            "late": Out(1),
            "max_lag": Out(LAG_W),
            "bursts": Out(32),
            "scan_lag": Out(LAG_W),
            "resyncs": Out(16),
            "pending": Out(1),
            "bus": Out(bus_signature(addr_width)),
        })

    def elaborate(self, platform):
        m = Module()
        N, L = self.burst, exact_log2(self.burst)
        CB, LC = self.clear_burst, exact_log2(self.clear_burst)
        bus = self.bus

        # -- buffers -------------------------------------------------------------
        m.submodules.rbuf = rbuf = Memory(shape=32, depth=self.rbuf_words, init=[])
        m.submodules.wbuf = wbuf = Memory(shape=32, depth=self.wbuf_words, init=[])
        rbuf_rp, rbuf_wp = rbuf.read_port(), rbuf.write_port()
        wbuf_rp, wbuf_wp = wbuf.read_port(), wbuf.write_port()
        rb_bits, wb_bits = exact_log2(self.rbuf_words), exact_log2(self.wbuf_words)

        # The core's side: reads in stage 5 -> 6, writes in stage 6.
        m.d.comb += [
            rbuf_rp.addr.eq(self.core.rd_buf[:rb_bits]),
            self.core.rd_data.eq(rbuf_rp.data),
            wbuf_wp.addr.eq(self.core.wr_buf[:wb_bits]),
            wbuf_wp.data.eq(self.core.wr_data),
            wbuf_wp.en.eq(self.core.wr_en),
        ]

        # -- stream table and scanner ---------------------------------------------
        m.submodules.stab = stab = Memory(shape=STab.size, depth=self.max_streams,
                                          init=self.stab_init)
        stab_rp, stab_wp = stab.read_port(), stab.write_port()
        m.d.comb += [stab_wp.addr.eq(self.stab_w.addr), stab_wp.data.eq(self.stab_w.data),
                     stab_wp.en.eq(self.stab_w.en)]

        m.submodules.fifo = fifo = SyncFIFOBuffered(width=Req.size, depth=self.fifo_depth)

        clear_req = Signal()
        scan_f = Signal(OFF_W)          # next sample to scan
        f = Signal(OFF_W)               # sample being scanned
        f_fetch = Signal(OFF_W)         # f + N
        f_flush = Signal(OFF_W)         # f - N
        idx = Signal(range(self.max_streams + 1))
        active = Signal()
        a_v = Signal()                  # the table entry for idx - 1 is on the read port
        b_v, b_e = Signal(), Signal(STab)

        m.d.comb += stab_rp.addr.eq(idx)
        # Room for this entry and the ones still in flight.
        room = fifo.w_level < self.fifo_depth - 2
        advance = active & (idx < self.n_streams) & room
        m.d.sync += a_v.eq(advance)
        with m.If(advance):
            m.d.sync += idx.eq(idx + 1)
        m.d.sync += [b_v.eq(a_v), b_e.eq(stab_rp.data)]

        total = (Mux(b_e.write, f_flush, f_fetch) + b_e.lead)[:OFF_W]
        padr = total & self.ring_mask
        req_in = Signal(Req)
        m.d.comb += [
            req_in.write.eq(b_e.write), req_in.padr.eq(padr),
            req_in.buf.eq(b_e.buf | (padr[:BUF_W] & b_e.bmask)), req_in.f.eq(f[:LAG_W]),
            fifo.w_data.eq(req_in),
            fifo.w_en.eq(b_v & b_e.en & (total[:L] == 0)),
        ]

        dist = Signal(OFF_W)            # ptr - scan_f: samples still to scan, less one
        m.d.comb += dist.eq(self.ptr - scan_f)
        behind = dist[OFF_W - 1] == 0                     # scan_f <= ptr (mod 2^22)
        if self.stats:
            with m.If(behind & (dist > self.scan_lag)):
                m.d.sync += self.scan_lag.eq(Mux(dist[LAG_W:].any(), (1 << LAG_W) - 1, dist))
        with m.If(clear_req):
            m.d.sync += [active.eq(0), idx.eq(self.max_streams)]
        with m.Elif(~active & behind & (dist >= self.resync)):
            m.d.sync += [scan_f.eq(self.ptr), self.late.eq(1)]
            if self.stats:
                m.d.sync += self.resyncs.eq(self.resyncs + 1)
        with m.Elif(~active & behind):
            m.d.sync += [active.eq(1), idx.eq(0), f.eq(scan_f),
                         f_fetch.eq(scan_f + N), f_flush.eq(scan_f - N)]
        with m.Elif(active & (idx == self.n_streams) & ~a_v & ~b_v):
            m.d.sync += [active.eq(0), scan_f.eq(scan_f + 1)]

        # -- bursts ----------------------------------------------------------------
        req = Signal(Req)
        adr = Signal.like(bus.adr)
        beat = Signal(range(CB + 1))
        wdata = Array(Signal(32, name=f"wdata{i}") for i in range(N))
        cadr = Signal(OFF_W + 1)        # clear: next ring word
        zcnt = Signal(BUF_W + 1)        # clear: next buffer word
        zeroing = Signal()
        lag = Signal(LAG_W)

        m.d.comb += [bus.sel.eq(0b1111), bus.bte.eq(wishbone.BurstTypeExt.LINEAR)]
        m.d.comb += [rbuf_wp.addr.eq(req.buf | beat[:L]), rbuf_wp.data.eq(bus.dat_r),
                     wbuf_rp.addr.eq(req.buf | beat[:L])]
        with m.If(self.clear & ~clear_req):
            m.d.sync += clear_req.eq(1)
        # Busy from the request on, so a status read right after it can't miss it.
        m.d.comb += self.clearing.eq(clear_req | self.clear)

        with m.FSM() as fsm:
            with m.State("IDLE"):
                with m.If(clear_req):
                    m.d.sync += [cadr.eq(0), zcnt.eq(0), zeroing.eq(1)]
                    m.next = "CLEAR_ADDR"
                with m.Elif(fifo.r_rdy):
                    m.d.comb += fifo.r_en.eq(1)
                    m.d.sync += [req.eq(fifo.r_data), beat.eq(0)]
                    m.next = "PREP"
            with m.State("PREP"):
                m.d.sync += adr.eq(self.ring_base + req.padr)
                with m.If(req.write):
                    m.next = "COPY"
                with m.Else():
                    m.next = "READ"
            # Write: copy the burst out of the write buffer (one cycle latency).
            with m.State("COPY"):
                m.d.sync += beat.eq(beat + 1)
                with m.If(beat > 0):
                    m.d.sync += wdata[(beat - 1)[:L]].eq(wbuf_rp.data)
                with m.If(beat == N):
                    m.d.sync += beat.eq(0)
                    m.next = "WRITE"
            with m.State("WRITE"):
                last = beat == N - 1
                m.d.comb += [
                    bus.cyc.eq(1), bus.stb.eq(1), bus.we.eq(1),
                    bus.adr.eq(adr | beat[:L]), bus.dat_w.eq(wdata[beat[:L]]),
                    bus.cti.eq(Mux(last, wishbone.CycleType.END_OF_BURST,
                                   wishbone.CycleType.INCR_BURST)),
                ]
                with m.If(bus.ack):
                    m.d.sync += beat.eq(beat + 1)
                    with m.If(last):
                        m.next = "DONE"
            with m.State("READ"):
                last = beat == N - 1
                m.d.comb += [
                    bus.cyc.eq(1), bus.stb.eq(1), bus.we.eq(0),
                    bus.adr.eq(adr | beat[:L]),
                    bus.cti.eq(Mux(last, wishbone.CycleType.END_OF_BURST,
                                   wishbone.CycleType.INCR_BURST)),
                ]
                with m.If(bus.ack):
                    m.d.comb += rbuf_wp.en.eq(1)
                    m.d.sync += beat.eq(beat + 1)
                    with m.If(last):
                        m.next = "DONE"
            with m.State("DONE"):
                m.d.comb += lag.eq(self.ptr[:LAG_W] - req.f)
                if self.stats:
                    m.d.sync += self.bursts.eq(self.bursts + 1)
                    with m.If(lag > self.max_lag):
                        m.d.sync += self.max_lag.eq(lag)
                with m.If(lag >= N):
                    m.d.sync += self.late.eq(1)
                m.next = "IDLE"

            # Clear: zero the ring in long aligned bursts, and both buffers.
            with m.State("CLEAR_ADDR"):
                m.d.sync += [adr.eq(self.ring_base + cadr), beat.eq(0)]
                m.next = "CLEAR"
            with m.State("CLEAR"):
                last = beat == CB - 1
                m.d.comb += [
                    bus.cyc.eq(1), bus.stb.eq(1), bus.we.eq(1),
                    bus.adr.eq(adr | beat[:LC]), bus.dat_w.eq(0),
                    bus.cti.eq(Mux(last, wishbone.CycleType.END_OF_BURST,
                                   wishbone.CycleType.INCR_BURST)),
                ]
                with m.If(bus.ack):
                    m.d.sync += beat.eq(beat + 1)
                    with m.If(last):
                        m.d.sync += cadr.eq(cadr + CB)
                        with m.If(cadr + CB > self.ring_mask):
                            m.next = "CLEAR_DRAIN"
                        with m.Else():
                            m.next = "CLEAR_ADDR"
            with m.State("CLEAR_DRAIN"):
                # Drop the requests queued before the clear.
                m.d.comb += fifo.r_en.eq(fifo.r_rdy)
                with m.If(~fifo.r_rdy & ~zeroing & ~a_v & ~b_v):
                    m.d.sync += [clear_req.eq(0), scan_f.eq(self.ptr), self.late.eq(0)]
                    if self.stats:
                        m.d.sync += [self.max_lag.eq(0), self.bursts.eq(0), self.scan_lag.eq(0),
                                     self.resyncs.eq(0)]
                    m.next = "IDLE"

        # Queued or under way (between its bursts the engine drops cyc); a
        # clear's bursts take turns.
        clearing = fsm.ongoing("CLEAR_ADDR") | fsm.ongoing("CLEAR") | fsm.ongoing("CLEAR_DRAIN")
        m.d.comb += self.pending.eq((fifo.r_rdy | ~fsm.ongoing("IDLE")) & ~clearing)

        # Buffer zeroing runs alongside the ring clear.
        with m.If(zeroing):
            m.d.comb += [rbuf_wp.addr.eq(zcnt), rbuf_wp.data.eq(0), rbuf_wp.en.eq(1),
                         wbuf_wp.addr.eq(zcnt), wbuf_wp.data.eq(0), wbuf_wp.en.eq(1)]
            m.d.sync += zcnt.eq(zcnt + 1)
            with m.If(zcnt == self.zero_words - 1):
                m.d.sync += zeroing.eq(0)

        return m
