"""PSRAM-backed H3000 delay memory with a block-RAM line cache.

The H3000 delay RAM is 64K x 16 bits, too large for ECP5-25 block RAM, so it
lives in PSRAM. Delay lines advance one word per sample, so each tap is a
sequential stream and a small line cache hides the PSRAM latency well.

Organisation (defaults): 4K words, 2-way set associative, 16-word lines
(one 8-beat burst of 32-bit PSRAM words), write-back, write-allocate, one
LRU bit per set.

    delay address [15:0] = | tag | set | word-in-line (3) | half (1) |

On a hit, a lookup completes within the spare clocks of a DSP instruction
cycle. On a miss the board stalls the DSP clock enable while the victim line
is written back (if dirty) and the new line is filled.
"""

from amaranth import *
from amaranth.lib import data, wiring
from amaranth.lib.memory import Memory
from amaranth.lib.wiring import In, Out
from amaranth.utils import exact_log2
from amaranth_soc import wishbone

from .board import DelayMemSignature

LINE_W32 = 8   # 32-bit PSRAM words per line
LINE_W16 = 16  # delay words per line


class DelayCache(wiring.Component):

    def __init__(self, *, bus_signature, base_word, words=4096):
        """
        bus_signature : wishbone.Signature of the PSRAM master port
                        (32-bit data, 8-bit granularity, cti/bte features).
        base_word     : PSRAM address (in 32-bit words, as seen on the bus)
                        of the 128 KiB delay memory region.
        words         : cache capacity in 16-bit delay words.
        """
        self.base_word = base_word
        self.sets = words // (LINE_W16 * 2)
        self.set_bits = exact_log2(self.sets)
        self.tag_bits = 16 - 4 - self.set_bits
        assert self.tag_bits > 0
        super().__init__({
            "bus":        In(DelayMemSignature()),
            "wb":         Out(bus_signature),
            "misses":     Out(32),
            "writebacks": Out(32),
        })

    def elaborate(self, platform):
        m = Module()

        way_layout = data.StructLayout({
            "valid": unsigned(1),
            "dirty": unsigned(1),
            "tag":   unsigned(self.tag_bits),
        })
        tag_layout = data.StructLayout({
            "lru": unsigned(1),   # way to evict next
            "way": data.ArrayLayout(way_layout, 2),
        })

        # Tags: one entry per set holding both ways.
        m.submodules.tags = tags = Memory(shape=tag_layout, depth=self.sets, init=[])
        tag_rd = tags.read_port()
        tag_wr = tags.write_port()

        # Data: one entry per (set, word-in-line), both ways side by side,
        # writable per 16-bit half: lanes = {way1 hi, way1 lo, way0 hi, way0 lo}.
        m.submodules.lines = lines = Memory(shape=unsigned(64), depth=self.sets * LINE_W32, init=[])
        dat_rd = lines.read_port()
        dat_wr = lines.write_port(granularity=16)

        def set_of(a):
            return a[4:4 + self.set_bits]

        def tag_of(a):
            return a[4 + self.set_bits:]

        # -- lookup --------------------------------------------------------

        fsm_idle = Signal()
        ram_written = Signal()
        m.d.comb += ram_written.eq(tag_wr.en | dat_wr.en.any())

        q_addr = Signal(16)
        q_ok   = Signal()
        m.d.sync += [
            q_addr.eq(self.bus.addr),
            q_ok.eq(fsm_idle & ~ram_written),
        ]

        # In idle the read ports follow the bus address; the miss FSM takes
        # them over otherwise.
        fsm_tag_addr = Signal(self.set_bits)
        fsm_dat_addr = Signal(self.set_bits + 3)
        with m.If(fsm_idle):
            m.d.comb += [
                tag_rd.addr.eq(set_of(self.bus.addr)),
                dat_rd.addr.eq(Cat(self.bus.addr[1:4], set_of(self.bus.addr))),
            ]
        with m.Else():
            m.d.comb += [
                tag_rd.addr.eq(fsm_tag_addr),
                dat_rd.addr.eq(fsm_dat_addr),
            ]

        entry = Signal(tag_layout)
        m.d.comb += entry.eq(tag_rd.data)
        hit_way = Signal(2)
        for w in range(2):
            m.d.comb += hit_way[w].eq(entry.way[w].valid & (entry.way[w].tag == tag_of(q_addr)))
        looked_up = Signal()
        hit = Signal()
        way = Signal()  # which way hit
        m.d.comb += [
            looked_up.eq(q_ok & (q_addr == self.bus.addr)),
            hit.eq(looked_up & hit_way.any()),
            way.eq(hit_way[1]),
        ]

        # The handshake is registered: the board turns it into the DSP
        # clock enable, which fans out widely, so it must not wait for the
        # tag RAM and comparators in the same clock. The address is stable
        # from the start of a DSP instruction cycle and the handshake is only
        # used in its last clock, so a hit loses no time (a miss one clock).
        # The way that hit is registered with it, so the read data does not
        # wait for the tag comparison either.
        hit_r = Signal()
        way_r = Signal()
        m.d.sync += [
            hit_r.eq(hit),
            way_r.eq(way),
        ]
        word32 = Signal(32)
        m.d.comb += [
            word32.eq(Mux(way_r, dat_rd.data[32:], dat_rd.data[:32])),
            self.bus.rd_data.eq(Mux(q_addr[0], word32[16:], word32[:16])),
            self.bus.rd_valid.eq(hit_r),
            self.bus.wr_ready.eq(hit_r),
        ]

        # On completed accesses: write the data (writes), mark dirty and
        # update LRU so the other way is evicted next.
        new_entry = Signal(tag_layout)
        m.d.comb += new_entry.eq(entry)
        with m.If(fsm_idle & self.bus.commit & hit):
            m.d.comb += [
                new_entry.lru.eq(~way),
                tag_wr.addr.eq(set_of(q_addr)),
                tag_wr.data.eq(new_entry),
                tag_wr.en.eq(1),
            ]
            with m.If(self.bus.wr_en):
                m.d.comb += [
                    new_entry.way[way].dirty.eq(1),
                    dat_wr.addr.eq(Cat(q_addr[1:4], set_of(q_addr))),
                    dat_wr.data.eq(Cat(self.bus.wr_data, self.bus.wr_data,
                                       self.bus.wr_data, self.bus.wr_data)),
                    dat_wr.en.eq(1 << Cat(q_addr[0], way)),
                ]

        # -- miss handling -------------------------------------------------

        need = Signal()
        m.d.comb += need.eq((self.bus.rd_en | self.bus.wr_en) & looked_up & ~hit_way.any())

        m_set    = Signal(self.set_bits)
        m_tag    = Signal(self.tag_bits)
        m_way    = Signal()
        m_entry  = Signal(tag_layout)
        m_vline  = Signal(16 - 4)   # line number of the victim
        idx      = Signal(range(LINE_W32 + 1))
        buf      = Array(Signal(32, name=f"wbbuf{i}") for i in range(LINE_W32))

        last_beat = Signal()
        m.d.comb += last_beat.eq(idx == LINE_W32 - 1)

        with m.FSM():
            with m.State("IDLE"):
                m.d.comb += fsm_idle.eq(1)
                with m.If(need):
                    victim = Mux(~entry.way[0].valid, 0,
                                 Mux(~entry.way[1].valid, 1, entry.lru))
                    m.d.sync += [
                        m_set.eq(set_of(q_addr)),
                        m_tag.eq(tag_of(q_addr)),
                        m_way.eq(victim),
                        m_entry.eq(entry),
                        m_vline.eq(Cat(set_of(q_addr), entry.way[victim].tag)),
                        idx.eq(0),
                        self.misses.eq(self.misses + 1),
                    ]
                    with m.If(entry.way[victim].valid & entry.way[victim].dirty):
                        m.d.sync += self.writebacks.eq(self.writebacks + 1)
                        m.next = "WB_READ"
                    with m.Else():
                        m.next = "FILL"

            # Copy the victim line out of block RAM (one cycle read latency).
            with m.State("WB_READ"):
                m.d.comb += fsm_dat_addr.eq(Cat(idx[:3], m_set))
                with m.If(idx != 0):
                    m.d.sync += buf[idx - 1].eq(Mux(m_way, dat_rd.data[32:], dat_rd.data[:32]))
                m.d.sync += idx.eq(idx + 1)
                with m.If(idx == LINE_W32):
                    m.d.sync += idx.eq(0)
                    m.next = "WB_BUS"

            with m.State("WB_BUS"):
                m.d.comb += [
                    self.wb.cyc.eq(1),
                    self.wb.stb.eq(1),
                    self.wb.we.eq(1),
                    self.wb.sel.eq(0b1111),
                    self.wb.adr.eq(self.base_word + Cat(idx[:3], m_vline)),
                    self.wb.dat_w.eq(buf[idx[:3]]),
                    self.wb.cti.eq(Mux(last_beat, wishbone.CycleType.END_OF_BURST,
                                       wishbone.CycleType.INCR_BURST)),
                    self.wb.bte.eq(wishbone.BurstTypeExt.LINEAR),
                ]
                with m.If(self.wb.ack):
                    m.d.sync += idx.eq(idx + 1)
                    with m.If(last_beat):
                        m.d.sync += idx.eq(0)
                        m.next = "FILL"

            with m.State("FILL"):
                m.d.comb += [
                    self.wb.cyc.eq(1),
                    self.wb.stb.eq(1),
                    self.wb.we.eq(0),
                    self.wb.sel.eq(0b1111),
                    self.wb.adr.eq(self.base_word + Cat(idx[:3], m_set, m_tag)),
                    self.wb.cti.eq(Mux(last_beat, wishbone.CycleType.END_OF_BURST,
                                       wishbone.CycleType.INCR_BURST)),
                    self.wb.bte.eq(wishbone.BurstTypeExt.LINEAR),
                ]
                with m.If(self.wb.ack):
                    m.d.comb += [
                        dat_wr.addr.eq(Cat(idx[:3], m_set)),
                        dat_wr.data.eq(Cat(self.wb.dat_r, self.wb.dat_r)),
                        dat_wr.en.eq(Mux(m_way, 0b1100, 0b0011)),
                    ]
                    m.d.sync += idx.eq(idx + 1)
                    with m.If(last_beat):
                        m.next = "TAG"

            with m.State("TAG"):
                new = Signal(tag_layout)
                m.d.comb += [
                    new.eq(m_entry),
                    new.way[m_way].valid.eq(1),
                    new.way[m_way].dirty.eq(0),
                    new.way[m_way].tag.eq(m_tag),
                    tag_wr.addr.eq(m_set),
                    tag_wr.data.eq(new),
                    tag_wr.en.eq(1),
                ]
                m.next = "IDLE"

        return m
