"""The engine's program: what the sequencer executes, and how a profile becomes one.

The engine (`nam/engine.py`) is an interpreter of *segments*. A MAC segment
streams activations against consecutive rows of the weight memory into an
accumulator bank; a POST segment takes accumulators through the post unit
(LeakyReLU, shift, round, saturate) to a history ring, the z FIFO or a scalar
register. `build` turns `fixed.QWeights` into the program, the ring table, the
stream tables and the memory images; `Interpreter` runs that program sample by
sample with the hardware's arithmetic, so the program can be checked against
`fixed.run_fixed` and the gateware against the interpreter.

Segment encoding, two 36-bit words (the fields' positions are what `nam/engine.py`
decodes; `Seg` is the layout):

    MAC   kind=0  src ring delay0 dil taps count wrow bank clear wait aux
    POST  kind=1  bank count shift leaky dest ring written clearacc done

MAC sources: RING (history ring `ring`, taps at delays delay0, delay0-dil, ...,
`count` channels each), X (the input register), CONST (2**16), ZQ (the z FIFO:
each value is two ops, the high 18 bits then the low 6 bits against the same
row's weight shifted right by 6; `taps`=1 adds a trailing CONST op for the
bias), Y, ADC (the sample from the codec), XC (X then CONST), NEWEST (the
newest FIFO: the frame the last POST with `newest` wrote, as it was written).
Rows start at `wrow` and advance by one per op; with `aux` they index the
auxiliary memory and every column gets the same weight.

POST destinations: RING (this sample's frame of `ring`, channel i; 18 bits in
block RAM, 16 in PSRAM; with `newest` also into the newest FIFO), ZQ (24 bits,
pushed to the z FIFO and added to H), H (added to H only), X, Y, OUT (16 bits).

Banks: Z0, Z1, LIN for MAC; those and H for POST.
"""

from dataclasses import dataclass, field

import numpy as np

from .a2 import HEAD_KERNEL
from .fixed import LEAKY_NUM, LEAKY_SHIFT, QWeights, leaky, output_gain_q, qexp, round_half_up, shift_round_sat

# Sources and destinations.
SRC_RING, SRC_X, SRC_CONST, SRC_ZQ, SRC_Y, SRC_ADC, SRC_XC, SRC_NEWEST = range(8)
DST_RING, DST_ZQ, DST_H, DST_X, DST_Y, DST_OUT = range(6)
BANK_Z0, BANK_Z1, BANK_LIN, BANK_H = range(4)
CONST_SHIFT = 16
SEG_WORDS = 2
WORD = 36
# Where the fields sit (lsb, width) in the 72-bit segment.
SEG_FIELDS = {
    "kind": (0, 1),
    # MAC
    "src": (1, 3), "ring": (4, 5), "delay0": (9, 12), "dil": (21, 8), "taps": (29, 4),
    "count": (33, 4), "wrow": (37, 11), "bank": (48, 2), "clear": (50, 1), "wait": (51, 1),
    "aux": (52, 1), "tap0": (53, 4),
    # POST (kind=1) reuses the low bits
    "pbank": (1, 2), "pcount": (3, 4), "shift": (7, 6), "leaky": (13, 1), "dest": (14, 3),
    "pring": (17, 5), "newest": (22, 1), "clearacc": (23, 1), "done": (24, 1),
}
N_RINGS = 32
N_READ_STREAMS = 32         # read streams are numbered 0..31 ...
N_WRITE_STREAMS = 8         # ... write streams 0..7 in their own space
N_STREAMS = N_READ_STREAMS + N_WRITE_STREAMS
POS_BITS = 18               # a stream's PSRAM position: a word offset in the rings' 1 MB
REGION_MAX = 32             # words in a stream's buffer region (two bursts)
HIST_WORDS = 10240          # block-RAM history pool, 18-bit words
WMEM_ROWS = 1536
AUX_WORDS = 1024
SBUF_R_WORDS = 1024         # read-stream buffer, 32-bit words
SBUF_W_WORDS = 256          # write-stream buffer
COLUMNS = 8

# Aux memory map (18-bit words).
AUX_GAIN_IN = 0
AUX_GAIN_OUT = 1
AUX_HEAD_B = 2
AUX_HEAD_W = 16             # 16 taps x C


def encode(**f):
    v = 0
    for name, val in f.items():
        lsb, width = SEG_FIELDS[name]
        assert 0 <= val < (1 << width), (name, val)
        v |= val << lsb
    return v


def decode(v, kind_fields):
    return {name: (v >> SEG_FIELDS[name][0]) & ((1 << SEG_FIELDS[name][1]) - 1) for name in kind_fields}


MAC_FIELDS = ("src", "ring", "delay0", "dil", "taps", "count", "wrow", "bank", "clear", "wait", "aux", "tap0")
POST_FIELDS = ("pbank", "pcount", "shift", "leaky", "dest", "pring", "newest", "clearacc", "done")


def mac(src, wrow, bank, count=1, taps=1, delay0=0, dil=0, ring=0, clear=False, wait=False, aux=False,
        tap0=0):
    """`tap0`: the ring's tap index of the first tap (a PSRAM ring's streams are per tap)."""
    return encode(kind=0, src=src, ring=ring, delay0=delay0, dil=dil, taps=taps, count=count,
                  wrow=wrow, bank=bank, clear=int(clear), wait=int(wait), aux=int(aux), tap0=tap0)


def post(bank, count, shift, dest, ring=0, leaky=False, newest=False, clearacc=False, done=False):
    assert 0 <= shift < 64, shift
    return encode(kind=1, pbank=bank, pcount=count, shift=shift, leaky=int(leaky), dest=dest,
                  pring=ring, newest=int(newest), clearacc=int(clearacc), done=int(done))


@dataclass
class Ring:
    frames: int             # samples kept (the longest delay + 1)
    channels: int
    psram: bool = False
    base: int = 0           # block RAM: first word of the ring
    stride: int = 0         # log2 words per frame
    streams: list = field(default_factory=list)   # PSRAM: read streams (in `Program.streams`), oldest tap first
    wstream: int = 0        # PSRAM: write stream (in `Program.streams`)
    frac: int = 0           # how the stored values are scaled (for the record)
    bits: int = 18
    # PSRAM, set by `allocate`: the read streams are numbered stream0.. stream0+nread-1,
    # the write stream wnum; all of them move through their buffer regions together,
    # starting at word rpos0 (rings start at different points, spreading transfers).
    stream0: int = 0
    wnum: int = 0
    rpos0: int = 0

    @property
    def words_per_frame(self):
        return 1 << self.stride


@dataclass
class Stream:
    """A PSRAM stream: `delay` frames behind the write (0 for the write stream).

    Every stream of a program has the same burst, so the same region size (two
    bursts): a read stream's region in SBUF_R is `num * region_words`, a write
    stream's in SBUF_W likewise, and the engine works that out from the number."""
    ring: int
    write: bool
    delay: int
    wpf: int                # 32-bit words per frame (two 16-bit channels each), a power of two
    burst_frames: int       # a power of two
    num: int = 0            # read streams 0..N_READ_STREAMS-1, write streams 0..N_WRITE_STREAMS-1
    psram_base: int = 0     # ring start, 32-bit word address in the PSRAM
    psram_frames: int = 0   # ring length in frames (every PSRAM ring is the same power-of-two size)
    offset: int = 0         # frames into its burst the ring's streams start, spreading transfers

    @property
    def burst_words(self):
        return self.wpf * self.burst_frames

    @property
    def region_words(self):
        return 2 * self.burst_words

    @property
    def sbase(self):
        return self.num * self.region_words

    @property
    def pos_index(self):
        """Its entry in the engine's position table."""
        return N_READ_STREAMS + self.num if self.write else self.num

    def pos0(self):
        """Its PSRAM position for the first sample, as the table holds it (a word offset
        into the rings' area). The prefill fetches a read stream's slot 1 then slot 0
        from frame `-delay - burst + offset`; a write stream's first flush is of slot 1
        to the frames before 0."""
        b = self.burst_frames
        start = ((0 if self.write else -self.delay) - b + self.offset) % self.psram_frames
        return (self.psram_base + start * self.wpf) & ((1 << POS_BITS) - 1)


@dataclass
class Program:
    segments: list
    rings: list
    streams: list
    wmem: np.ndarray        # [rows][8] int
    aux: np.ndarray         # [AUX_WORDS] int
    hist_words: int
    meta: dict = field(default_factory=dict)

    def words(self):
        """The program memory image: two 36-bit words per segment."""
        out = []
        for s in self.segments:
            out += [s & ((1 << WORD) - 1), s >> WORD]
        return out


def log2_exact(v, what):
    k = v.bit_length() - 1
    if v <= 0 or (1 << k) != v:
        raise ValueError(f"{what} must be a power of two, is {v}")
    return k


def allocate(rings, streams, hist_words=HIST_WORDS, sbuf_r=SBUF_R_WORDS, sbuf_w=SBUF_W_WORDS,
             psram_base=0):
    """Places block-RAM rings in the history pool, numbers the streams (so their buffer
    regions follow) and places PSRAM rings from `psram_base` (a 32-bit word address,
    a multiple of 2**POS_BITS): every PSRAM ring gets the same power-of-two size,
    aligned to it, so the engine wraps a position with a mask. Returns the words used
    and the stream geometry the engine is configured with. Raises if anything doesn't fit."""
    word = 0
    for r in rings:
        if r.psram:
            continue
        r.base = word
        word += r.frames << r.stride
    if word > hist_words:
        raise ValueError(f"history needs {word} words of block RAM, {hist_words} there")
    geo = dict(wpf_log2=0, burst_log2=0, ring_log2=0)
    if not streams:
        return word, 0, 0, 0, geo
    if psram_base % (1 << POS_BITS):
        raise ValueError(f"the PSRAM rings' area must start on a {1 << POS_BITS}-word boundary")
    wpf, bf = streams[0].wpf, streams[0].burst_frames
    assert all(s.wpf == wpf and s.burst_frames == bf for s in streams)
    region = 2 * wpf * bf
    if region > REGION_MAX:
        raise ValueError(f"a stream region of {region} words is more than {REGION_MAX}")
    nr = nw = 0
    for s in streams:
        if s.write:
            s.num, nw = nw, nw + 1
        else:
            s.num, nr = nr, nr + 1
    if nr > N_READ_STREAMS or nw > N_WRITE_STREAMS or nr * region > sbuf_r or nw * region > sbuf_w:
        raise ValueError(f"{nr} read and {nw} write streams don't fit the stream buffers")
    psram_rings = [r for r in rings if r.psram]
    frames = max(-(-r.frames // bf) * bf for r in psram_rings)
    ring_words = 1 << (frames * wpf - 1).bit_length()
    if len(psram_rings) * ring_words > (1 << POS_BITS):
        raise ValueError(f"PSRAM rings need {len(psram_rings) * ring_words} words, {1 << POS_BITS} there")
    for k, r in enumerate(psram_rings):
        ws = streams[r.wstream]
        reads = [streams[i] for i in r.streams]
        assert [s.num for s in reads] == list(range(reads[0].num, reads[0].num + len(reads)))
        r.stream0, r.wnum = reads[0].num, ws.num
        offset = k % bf
        r.rpos0 = region - (1 + offset) * wpf
        for s in [ws] + reads:
            s.psram_base, s.psram_frames, s.offset = psram_base + k * ring_words, ring_words // wpf, offset
    geo = dict(wpf_log2=log2_exact(wpf, "words per frame"), burst_log2=log2_exact(wpf * bf, "a burst"),
               ring_log2=log2_exact(ring_words, "a PSRAM ring"))
    return word, nr * region, nw * region, len(psram_rings) * ring_words, geo


def build(q: QWeights, psram_layers=(), burst_frames=4, gain_in_db=0.0, gain_out_db=0.0,
          hist_words=HIST_WORDS, psram_base=0):
    """The program for `q`. `psram_layers`: indices of layers whose history streams
    from PSRAM (`q` must have been quantised with the same `psram_layers`)."""
    c = q.channels
    fmt = q.fmt
    stride = (c - 1).bit_length()                 # 3 -> 4 words, 8 -> 8
    wpf = max(1, (1 << stride) // 2)              # 16-bit pairs per 32-bit word
    rings, streams, segs = [], [], []
    wmem = np.zeros((WMEM_ROWS, COLUMNS), dtype=np.int64)
    aux = np.zeros(AUX_WORDS, dtype=np.int64)
    row = 0

    def rows(n):
        nonlocal row
        r = row
        row += n
        if row > WMEM_ROWS:
            raise ValueError("weights don't fit the weight memory")
        return r

    # Rings: one per layer (its input history), then hsum.
    for i, l in enumerate(q.layers):
        frames = (l.kernel - 1) * l.dilation + 1
        ring = Ring(frames=frames, channels=c, psram=i in psram_layers, stride=stride,
                    frac=l.hist_in_frac, bits=l.hist_in_bits)
        if ring.psram:
            assert l.hist_in_bits == 16, "PSRAM rings hold 16-bit words"
            ring.wstream = len(streams)
            streams.append(Stream(ring=i, write=True, delay=0, wpf=wpf, burst_frames=burst_frames))
            for k in range(l.kernel - 1):
                ring.streams.append(len(streams))
                streams.append(Stream(ring=i, write=False, delay=(l.kernel - 1 - k) * l.dilation,
                                      wpf=wpf, burst_frames=burst_frames))
        rings.append(ring)
    HS = len(rings)
    rings.append(Ring(frames=HEAD_KERNEL, channels=c, stride=stride, frac=fmt.hsum_frac))
    assert len(rings) <= N_RINGS and len(streams) <= N_STREAMS

    # Weights for every layer, in layer order.
    conv_rows, mix_rows, l1x1_rows = [], [], []
    for l in q.layers:
        k_ = l.kernel
        rc = rows(k_ * c)
        for k in range(k_):
            for j in range(c):
                wmem[rc + k * c + j, :c] = l.conv_w[k][:, j]
        conv_rows.append(rc)
        rm = rows(2)
        wmem[rm, :c] = l.mixin
        wmem[rm + 1, :c] = l.conv_b
        mix_rows.append(rm)
        # One row per z value: the low part reads the same row, shifted in the datapath.
        rl = rows(c + 1)
        for b in range(c):
            wmem[rl + b, :c] = l.l1x1_w[:, b]
        wmem[rl + c, :c] = l.l1x1_b
        l1x1_rows.append(rl)
    r0 = rows(1)
    wmem[r0, :c] = q.rechannel
    for k in range(HEAD_KERNEL):
        for b in range(c):
            aux[AUX_HEAD_W + k * c + b] = q.head_w[k][b]
    aux[AUX_HEAD_B] = q.head_b
    gin = 10 ** (gain_in_db / 20.0)
    gin_frac = qexp(max(gin, 1.0 / 64))
    aux[AUX_GAIN_IN] = int(round_half_up(gin * 2.0 ** gin_frac))
    gq, gshift = output_gain_q(q, gain_out_db)
    aux[AUX_GAIN_OUT] = gq

    def zbank(i):
        return BANK_Z0 if i % 2 == 0 else BANK_Z1

    def conv_old(i, part):
        """Layer i's taps on earlier frames, in two parts so each can hide a post
        unit latency: part 0 is the older taps with the bank's clear, part 1 the rest."""
        l = q.layers[i]
        k_, d = l.kernel, l.dilation
        old = k_ - 1
        split = (old + 1) // 2
        first, n = (0, split) if part == 0 else (split, old - split)
        if n == 0:
            return
        segs.append(mac(SRC_RING, conv_rows[i] + first * c, zbank(i), count=c, taps=n,
                        delay0=(k_ - 1 - first) * d, dil=d, ring=i, clear=(part == 0), tap0=first))

    def conv_newest(i):
        """The newest tap, this sample's frame as the post unit writes it, then mixin and bias."""
        l = q.layers[i]
        segs.append(mac(SRC_NEWEST, conv_rows[i] + (l.kernel - 1) * c, zbank(i), count=c))
        segs.append(mac(SRC_XC, mix_rows[i], zbank(i)))

    # The program is software-pipelined: while the post unit turns layer i's
    # accumulators into z values and then its 1x1 mix into layer i+1's history,
    # layer i+1's taps on earlier frames keep the multipliers busy.
    last = len(q.layers) - 1
    segs.append(mac(SRC_ADC, AUX_GAIN_IN, BANK_Z1, clear=True, aux=True))       # x = adc * gain
    segs.append(post(BANK_Z1, 1, gin_frac, DST_X))
    conv_old(0, 0)
    conv_old(0, 1)
    segs.append(mac(SRC_X, r0, BANK_LIN, clear=True, wait=True))                # LIN = rechannel * x
    segs.append(post(BANK_LIN, c, q.hist_shifts[0], DST_RING, ring=0, newest=True))
    for i, l in enumerate(q.layers):
        conv_newest(i)
        if i < last:
            segs.append(post(zbank(i), c, l.z_shift, DST_ZQ, leaky=True))
            conv_old(i + 1, 0)
            segs.append(mac(SRC_ZQ, l1x1_rows[i], BANK_LIN, count=c, taps=1))
            segs.append(post(BANK_LIN, c, q.hist_shifts[i + 1], DST_RING, ring=i + 1, newest=True))
            conv_old(i + 1, 1)
        else:
            # The last layer's 1x1 feeds nothing: only hsum needs its z.
            segs.append(post(zbank(i), c, l.z_shift, DST_H, leaky=True))
    # The head: its taps on earlier frames of hsum run while the last z values land
    # in H; then hsum goes to its ring and the newest tap.
    hb = zbank(last + 1)
    segs.append(mac(SRC_RING, AUX_HEAD_W, hb, count=c, taps=HEAD_KERNEL - 1,
                    delay0=HEAD_KERNEL - 1, dil=1, ring=HS, clear=True, aux=True))
    segs.append(post(BANK_H, c, q.hsum_shift, DST_RING, ring=HS, newest=True, clearacc=True))
    segs.append(mac(SRC_NEWEST, AUX_HEAD_W + (HEAD_KERNEL - 1) * c, hb, count=c, aux=True))
    segs.append(mac(SRC_CONST, AUX_HEAD_B, hb, aux=True))
    segs.append(post(hb, 1, q.y_shift, DST_Y))
    # out = y * head_scale * gain_out
    ob = zbank(last)
    segs.append(mac(SRC_Y, AUX_GAIN_OUT, ob, clear=True, aux=True, wait=True))
    segs.append(post(ob, 1, gshift, DST_OUT, done=True))

    hist_used, sbr, sbw, pwords, geo = allocate(rings, streams, hist_words=hist_words, psram_base=psram_base)
    return Program(segs, rings, streams, wmem, aux, hist_words,
                   meta=dict(channels=c, rows=row, hist_used=hist_used, sbuf_r=sbr, sbuf_w=sbw,
                             psram_words=pwords, n_streams=len(streams), **geo))


def sat(v, bits):
    lim = (1 << (bits - 1)) - 1
    return int(min(max(v, -lim - 1), lim))


class Interpreter:
    """Runs a `Program` as the engine does, one op at a time (no timing).

    Memories start at zero; `sample(adc)` returns the 16-bit output."""

    def __init__(self, prog: Program, trace=None):
        self.p = prog
        self.hist = np.zeros(prog.hist_words, dtype=np.int64)
        # PSRAM rings, as frames: [frame][channel] of 16-bit values.
        self.pring = {i: np.zeros((r.frames, 1 << r.stride), dtype=np.int64)
                      for i, r in enumerate(prog.rings) if r.psram}
        self.wptr = [0] * len(prog.rings)
        self.acc = {BANK_Z0: [0] * COLUMNS, BANK_Z1: [0] * COLUMNS,
                    BANK_LIN: [0] * COLUMNS, BANK_H: [0] * COLUMNS}
        self.x = self.y = self.out = self.adc = 0
        # Banks posted since they last accumulated (nothing is in flight at the start).
        self.posted = {b: True for b in self.acc}
        self.zq = []
        self.newest = []
        self.trace = trace
        self.ops = [] if trace is not None else None     # (activation, weight 0, bank, clear)

    def _read_ring(self, ri, delay, ch):
        r = self.p.rings[ri]
        idx = (self.wptr[ri] - delay) % r.frames
        if r.psram:
            return int(self.pring[ri][idx][ch])
        return int(self.hist[r.base + (idx << r.stride) + ch])

    def _write_ring(self, ri, ch, v):
        r = self.p.rings[ri]
        if r.psram:
            self.pring[ri][self.wptr[ri]][ch] = v
        else:
            self.hist[r.base + (self.wptr[ri] << r.stride) + ch] = v

    def _mac(self, f):
        src = f["src"]
        p = self.p
        row = f["wrow"]
        acc = self.acc[f["bank"]]
        first = [bool(f["clear"])]
        # The engine lets a clearing op issue once no POST holds its bank, and checks
        # nothing else: a product still landing after the clear would be lost. So a POST
        # of the bank must come between its last accumulation and a clear (it holds the
        # bank until everything has landed).
        assert not f["clear"] or self.posted[f["bank"]], \
            f"clearing MAC into bank {f['bank']} whose last accumulation was not posted"
        self.posted[f["bank"]] = False

        def op(a, lo=False, advance=True):
            w = p.aux[row[0]] if f["aux"] else p.wmem[row[0]]
            if lo:
                # The low part of a z value: the same row, the weight shifted in the datapath.
                w = w >> 6
            if advance:
                row[0] += 1
            w = np.broadcast_to(w, (COLUMNS,))
            if self.ops is not None:
                self.ops.append((int(a), int(w[0]), f["bank"], int(first[0])))
            for col in range(COLUMNS):
                acc[col] = (0 if first[0] else acc[col]) + int(a) * int(w[col])
            first[0] = False

        row = [row]
        if src == SRC_RING:
            delay = f["delay0"]
            for _ in range(f["taps"]):
                for ch in range(f["count"]):
                    op(self._read_ring(f["ring"], delay, ch))
                delay -= f["dil"]
        elif src == SRC_X:
            op(self.x)
        elif src == SRC_CONST:
            op(1 << CONST_SHIFT)
        elif src == SRC_XC:
            op(self.x)
            op(1 << CONST_SHIFT)
        elif src == SRC_Y:
            op(self.y)
        elif src == SRC_ADC:
            op(self.adc)
        elif src == SRC_NEWEST:
            for _ in range(f["count"]):
                op(self.newest.pop(0))
        elif src == SRC_ZQ:
            for _ in range(f["count"]):
                z = self.zq.pop(0)
                op(z >> 6, advance=False)
                op(z & 63, lo=True)
            if f["taps"]:
                op(1 << CONST_SHIFT)
        else:
            raise ValueError(src)

    def _post(self, f):
        bank = f["pbank"]
        dest = f["dest"]
        ri = f["pring"]
        self.posted[bank] = True
        for i in range(f["pcount"]):
            v = self.acc[bank][i]
            if f["leaky"]:
                v = int(leaky(np.int64(v)))
            v = int(shift_round_sat(np.int64(v), f["shift"], 48))
            if dest == DST_RING:
                v = sat(v, self.p.rings[ri].bits)
                self._write_ring(ri, i, v)
                if f["newest"]:
                    self.newest.append(v)
            elif dest == DST_ZQ:
                v = sat(v, 24)
                self.zq.append(v)
                self.acc[BANK_H][i] += v
            elif dest == DST_H:
                self.acc[BANK_H][i] += sat(v, 24)
            elif dest == DST_X:
                self.x = sat(v, 18)
            elif dest == DST_Y:
                self.y = sat(v, 18)
            elif dest == DST_OUT:
                self.out = sat(v, 16)
            if f["clearacc"]:
                self.acc[bank][i] = 0
            if self.trace is not None:
                # As the engine's post unit would write it.
                r = self.p.rings[ri]
                if dest == DST_RING and not r.psram:
                    self.trace.append(("hist", r.base + (self.wptr[ri] << r.stride) + i, v))
                elif dest == DST_RING:
                    self.trace.append(("pring", ri, i, v))
                else:
                    self.trace.append((("ring", "zq", "h", "x", "y", "out")[dest], v))

    def sample(self, adc):
        self.adc = int(adc)
        for i in range(len(self.p.rings)):
            self.wptr[i] = (self.wptr[i] + 1) % self.p.rings[i].frames
        for s in self.p.segments:
            if s & 1:
                self._post(decode(s, POST_FIELDS))
            else:
                self._mac(decode(s, MAC_FIELDS))
        assert not self.zq, "z FIFO not drained"
        assert not self.newest, "newest FIFO not drained"
        return self.out

    def run(self, adc_samples):
        return np.array([self.sample(a) for a in adc_samples], dtype=np.int64)
