"""The H3000 DSP board: three lockstep TMS32010s on a shared I/O bus.

This reproduces the board reverse engineered from the H3000/H3500 microcode
and the H3000 service manual. ../model/board.py is the golden reference this
gateware is checked against, and documents the port map in detail:

    OUT PA7   delay-memory address register
    OUT PA4   delay-memory write at the address register
    IN  PA4   delay-memory read at the address register (then address += 1)
    IN  PA7   ADC sample: left while BIO is low, right while BIO is high
    OUT PA5/6 left / right DAC (double buffered, variable-rate clocks)
    IN  PA5/6 host parameter latch: address word / data word
    IN  PA0   status: parity, DAC FSYN STAT, FIRQ request, flags
    OUT PA0   status port: frequency synthesizers, flags, FIRQ to the host
    PA1..PA3  mailboxes between the DSPs and the host
    BIO       low for the first half of each 104-instruction-cycle frame

All DSPs share one CLKIN enable (``pcen``), so they stay in lockstep. One
frame runs per audio sample; the cores are frozen between frames and while
the delay memory is not ready (``mem`` stall). The host gets one bus slot
per frame (``HOST_SLOT``) for the requests queued on ``bus_req``.
"""

from amaranth import *
from amaranth.lib import data, fifo, stream, wiring
from amaranth.lib.memory import Memory
from amaranth.lib.wiring import In, Out

from .ika32010 import IKA32010

FRAME_CYCLES = 104
BIO_LOW_CYCLES = 52
N_DSP = 3
# Instruction cycle of each frame given to the host (no DSP program uses it).
HOST_SLOT = 58
# Frequency synthesizer value for the input sample rate.
FSYN_UNITY = 0xCC0

PLOAD_LAYOUT = data.StructLayout({
    "dsp":  unsigned(2),
    "addr": unsigned(12),
    "data": unsigned(16),
})

PARAM_LAYOUT = data.StructLayout({
    "addr": unsigned(16),
    "data": unsigned(16),
})
# A ``param`` entry with this address bit set is not a latch write but the
# host's FIRQ acknowledge, queued behind the writes made before it: it clears
# the FIRQ request the DSPs see in the status word. (The 6809 writes latch
# addresses below 0x4000.)
PARAM_FIRQ_ACK = 0x8000

STEREO = data.ArrayLayout(signed(16), 2)

BUS_REQ_LAYOUT = data.StructLayout({
    "data": unsigned(16),
    "port": unsigned(3),
    "read": unsigned(1),
})


class DelayMemSignature(wiring.Signature):

    """Board (master) -> delay memory controller.

    ``rd_en``/``wr_en`` are asserted during the last clock of a DSP
    instruction cycle that reads/writes PA4. The board stalls all DSPs while
    ``rd_en & ~rd_valid`` or ``wr_en & ~wr_ready``. ``commit`` marks the clock
    on which the access completes (a write must be performed on this clock).
    ``addr`` only changes on a ``commit`` clock or when PA7 is written.
    """

    def __init__(self):
        super().__init__({
            "addr":     Out(16),
            "rd_en":    Out(1),
            "rd_data":  In(16),
            "rd_valid": In(1),
            "wr_en":    Out(1),
            "wr_data":  Out(16),
            "wr_ready": In(1),
            "commit":   Out(1),
        })


class H3000DspBoard(wiring.Component):

    def __init__(self, pmem_words=2048, param_fifo_depth=32, read_step=1,
                 param_timeout_frames=8, bus_fifo_depth=16):
        self.pmem_words = pmem_words
        self.bus_fifo_depth = bus_fifo_depth
        self.param_fifo_depth = param_fifo_depth
        self.read_step = read_step
        self.param_timeout_frames = param_timeout_frames
        # Simulation taps (not ports; removed by synthesis when unused).
        self.dbg_ncen = Signal()
        self.dbg_pos = Signal(range(FRAME_CYCLES))
        self.dbg_aout = [Signal(12, name=f"dbg_aout{n}") for n in range(N_DSP)]
        self.dbg_we_n = [Signal(name=f"dbg_we_n{n}") for n in range(N_DSP)]
        self.dbg_den_n = [Signal(name=f"dbg_den_n{n}") for n in range(N_DSP)]
        self.dbg_dout = [Signal(16, name=f"dbg_dout{n}") for n in range(N_DSP)]
        self.dbg_din = [Signal(16, name=f"dbg_din{n}") for n in range(N_DSP)]
        super().__init__({
            # Hold all DSPs in reset while 0. Program RAM may only be
            # loaded while in reset.
            "run":       In(1),
            "pload":     In(stream.Signature(PLOAD_LAYOUT)),
            "param":     In(stream.Signature(PARAM_LAYOUT)),
            # Host accesses to bus ports, one per frame in HOST_SLOT; reads
            # land in bus_result and bump bus_reads.
            "bus_req":    In(stream.Signature(BUS_REQ_LAYOUT)),
            "bus_result": Out(16),
            "bus_reads":  Out(8),
            "bus_level":  Out(range(bus_fifo_depth + 1)),
            # DAC clock select (the 6809's FREQ SELECT latches): 0 input
            # rate, 1 right synthesizer for both, 2 (and 3) left / right
            # synthesizers.
            "clock_mode": In(2),
            # To the host: FIRQ (until firq_clear) and the status flags (Q0
            # interrupts the host). firq_clear clears the host's FIRQ line
            # at once; the request the DSPs see clears with the
            # PARAM_FIRQ_ACK entry on ``param`` that has to follow it.
            "firq":       Out(1),
            "firq_clear": In(1),
            "flags":      Out(8),
            # One stereo input sample starts each frame, one output sample
            # is produced at the end of each frame.
            "adc":       In(stream.Signature(STEREO)),
            "dac":       Out(stream.Signature(STEREO)),
            "mem":       Out(DelayMemSignature()),
            # Diagnostics
            "frames":        Out(32),
            "stall_clocks":  Out(32),
            "frame_clocks":  Out(16),  # clocks taken by the last frame
            "param_level":   Out(range(param_fifo_depth + 1)),
            "out5":          Out(16),  # last value written to PA5 / PA6
            "out6":          Out(16),
            "fsyn_period":   Out(data.ArrayLayout(unsigned(13), 2)),
        })

    def elaborate(self, platform):
        m = Module()

        dsps = []
        for n in range(N_DSP):
            dsp = IKA32010()
            m.submodules[f"dsp{n}"] = dsp
            dsps.append(dsp)

        rs_n = Signal()
        m.d.sync += rs_n.eq(self.run)

        # Instruction-cycle phase (mirrors the cores' internal counters) and
        # frame position (instruction cycles since frame start).
        pcen   = Signal()
        phase  = Signal(2)
        ncen   = Signal()
        pos    = Signal(range(FRAME_CYCLES))
        active = Signal()
        stall  = Signal()

        m.d.comb += ncen.eq(pcen & (phase == 3))
        with m.If(pcen):
            m.d.sync += phase.eq(Mux(rs_n, phase + 1, 0))

        # In reset the cores run freely so their counters are cleared; when
        # running, they only advance during a frame and never when stalled.
        m.d.comb += pcen.eq(Mux(rs_n, active & ~stall, 1))

        bio_n = Signal()
        m.d.comb += bio_n.eq(pos >= BIO_LOW_CYCLES)
        for dsp in dsps:
            m.d.comb += [
                dsp.pcen.eq(pcen),
                dsp.rs_n.eq(rs_n),
                dsp.bio_n.eq(bio_n),
            ]

        # Per-DSP bus decode. I/O cycles put the port number on A0-A2 with
        # A3-A11 zero; any other write strobe is a TBLW to program memory.
        is_io  = [Signal(name=f"is_io{n}") for n in range(N_DSP)]
        out_io = [Signal(name=f"out_io{n}") for n in range(N_DSP)]
        in_io  = [Signal(name=f"in_io{n}") for n in range(N_DSP)]
        tblw   = [Signal(name=f"tblw{n}") for n in range(N_DSP)]
        port   = [Signal(3, name=f"port{n}") for n in range(N_DSP)]
        for n, dsp in enumerate(dsps):
            m.d.comb += [
                is_io[n].eq(dsp.aout[3:] == 0),
                port[n].eq(dsp.aout[:3]),
                out_io[n].eq(~dsp.we_n & is_io[n]),
                in_io[n].eq(~dsp.den_n),
                tblw[n].eq(~dsp.we_n & ~is_io[n]),
            ]

        # -- program memories ------------------------------------------------

        m.d.comb += self.pload.ready.eq(~rs_n)
        pmem_data = []
        for n, dsp in enumerate(dsps):
            mem = Memory(shape=unsigned(16), depth=self.pmem_words, init=[])
            m.submodules[f"pmem{n}"] = mem
            rd = mem.read_port()
            wr = mem.write_port()
            # Upper address bits are not decoded: the RAM is mirrored.
            m.d.comb += rd.addr.eq(dsp.aout)
            with m.If(~rs_n):
                m.d.comb += [
                    wr.addr.eq(self.pload.payload.addr),
                    wr.data.eq(self.pload.payload.data),
                    wr.en.eq(self.pload.valid & (self.pload.payload.dsp == n)),
                ]
            with m.Else():
                m.d.comb += [
                    wr.addr.eq(dsp.aout),
                    wr.data.eq(dsp.dout),
                    wr.en.eq(ncen & tblw[n]),
                ]
            pmem_data.append(rd.data)

        # -- shared bus state ------------------------------------------------

        latch = Array(Signal(16, name=f"latch{p}") for p in range(8))
        adc_l = Signal(16)
        adc_r = Signal(16)

        # host parameter latch
        m.submodules.param_fifo = param_fifo = fifo.SyncFIFOBuffered(
            width=PARAM_LAYOUT.size, depth=self.param_fifo_depth)
        wiring.connect(m, wiring.flipped(self.param), param_fifo.w_stream)
        m.d.comb += self.param_level.eq(param_fifo.level)
        host = Signal(PARAM_LAYOUT)
        host_seen = Signal(N_DSP)
        host_age = Signal(range(self.param_timeout_frames + 1))

        # Status flags (see model/board.py for the layout).
        flags = Signal(8)
        fsyn_stat = Signal(2)  # [0] left, [1] right
        firq_req = Signal()    # FIRQ as the DSPs see it (status bit 1)
        status = Signal(16)
        m.d.comb += [
            status.eq(Cat(flags[0], firq_req, fsyn_stat[1], fsyn_stat[0], flags[2:8],
                          C(0, 5), ~pos[0])),
            self.flags.eq(flags),
        ]

        def read_port(p, name):
            rdata = Signal(16, name=name)
            with m.Switch(p):
                with m.Case(0):
                    m.d.comb += rdata.eq(status)
                with m.Case(4):
                    m.d.comb += rdata.eq(self.mem.rd_data)
                with m.Case(5):
                    m.d.comb += rdata.eq(host.addr)
                with m.Case(6):
                    m.d.comb += rdata.eq(host.data)
                with m.Case(7):
                    m.d.comb += rdata.eq(Mux(bio_n, adc_r, adc_l))
                with m.Default():
                    m.d.comb += rdata.eq(latch[p])
            return rdata

        # IN data, per DSP
        mem_rd = Signal()
        for n, dsp in enumerate(dsps):
            rdata = read_port(port[n], f"rdata{n}")
            m.d.comb += dsp.din.eq(Mux(in_io[n], rdata, pmem_data[n]))

        # The host's bus slot.
        m.submodules.bus_fifo = bus_fifo = fifo.SyncFIFOBuffered(
            width=BUS_REQ_LAYOUT.size, depth=self.bus_fifo_depth)
        wiring.connect(m, wiring.flipped(self.bus_req), bus_fifo.w_stream)
        m.d.comb += self.bus_level.eq(bus_fifo.level)
        bus_req = Signal(BUS_REQ_LAYOUT)
        # host_turn is decoded from registers only (the last clock of the
        # slot's instruction cycle); the access happens when it completes
        # (host_slot). Keeping the stall out of the data path keeps the DSP
        # clock enable timing short.
        host_turn = Signal()
        host_slot = Signal()
        bus_pop = Signal()  # the request is retired on the following clock
        m.d.comb += [
            bus_req.eq(bus_fifo.r_stream.payload),
            host_turn.eq(rs_n & (phase == 3) & (pos == HOST_SLOT) & bus_fifo.r_stream.valid),
            host_slot.eq(host_turn & ncen),
            bus_fifo.r_stream.ready.eq(bus_pop),
        ]
        m.d.sync += bus_pop.eq(host_slot)
        host_rdata = read_port(bus_req.port, "host_rdata")
        with m.If(host_slot & bus_req.read):
            m.d.sync += [
                self.bus_result.eq(Mux(bus_req.port == 4, 0, host_rdata)),
                self.bus_reads.eq(self.bus_reads + 1),
            ]

        # Strobes for this instruction cycle (valid in its last clock).
        last = Signal()
        m.d.comb += last.eq(phase == 3)

        any_out = Signal()
        out_port = Signal(3)
        out_data = Signal(16)
        # Host writes (never port 4: the delay memory is not reachable).
        with m.If(host_turn & ~bus_req.read & (bus_req.port != 4)):
            m.d.comb += [
                any_out.eq(1),
                out_port.eq(bus_req.port),
                out_data.eq(bus_req.data),
            ]
        for n in reversed(range(N_DSP)):  # lowest DSP number wins a conflict
            with m.If(out_io[n]):
                m.d.comb += [
                    any_out.eq(1),
                    out_port.eq(port[n]),
                    out_data.eq(dsps[n].dout),
                ]
        m.d.comb += mem_rd.eq(Cat(in_io[n] & (port[n] == 4) for n in range(N_DSP)).any())

        mem_wr = Signal()
        m.d.comb += [
            mem_wr.eq(Cat(out_io[n] & (port[n] == 4) for n in range(N_DSP)).any()),
            self.mem.rd_en.eq(last & mem_rd),
            self.mem.wr_en.eq(last & mem_wr),
            self.mem.wr_data.eq(out_data),
            self.mem.commit.eq(ncen & (mem_rd | mem_wr)),
            stall.eq(last & rs_n & ((mem_rd & ~self.mem.rd_valid) |
                                    (mem_wr & ~self.mem.wr_ready))),
        ]

        addr = Signal(16)
        m.d.comb += self.mem.addr.eq(addr)
        with m.If(ncen):
            with m.If(any_out):
                m.d.sync += latch[out_port].eq(out_data)
                with m.If(out_port == 7):
                    m.d.sync += addr.eq(out_data)
            with m.If(mem_rd & ~(any_out & (out_port == 7))):
                m.d.sync += addr.eq(addr + self.read_step)
            for n in range(N_DSP):
                with m.If(in_io[n] & (port[n] == 5)):
                    m.d.sync += host_seen[n].eq(1)

        m.d.comb += [
            self.out5.eq(latch[5]),
            self.out6.eq(latch[6]),
            self.dbg_ncen.eq(ncen),
            self.dbg_pos.eq(pos),
        ]
        for n, dsp in enumerate(dsps):
            m.d.comb += [
                self.dbg_aout[n].eq(dsp.aout),
                self.dbg_we_n[n].eq(dsp.we_n),
                self.dbg_den_n[n].eq(dsp.den_n),
                self.dbg_dout[n].eq(dsp.dout),
                self.dbg_din[n].eq(dsp.din),
            ]

        # -- frame sequencing ------------------------------------------------

        frame_end = Signal()
        m.d.comb += frame_end.eq(ncen & (pos == FRAME_CYCLES - 1))
        with m.If(ncen):
            m.d.sync += pos.eq(Mux(pos == FRAME_CYCLES - 1, 0, pos + 1))

        frame_clk = Signal(16)
        with m.If(active):
            m.d.sync += frame_clk.eq(frame_clk + 1)
            with m.If(stall):
                m.d.sync += self.stall_clocks.eq(self.stall_clocks + 1)

        # Start a frame when an input sample is available.
        m.d.comb += self.adc.ready.eq(rs_n & ~active)
        with m.If(self.adc.valid & self.adc.ready):
            m.d.sync += [
                active.eq(1),
                adc_l.eq(self.adc.payload[0]),
                adc_r.eq(self.adc.payload[1]),
                frame_clk.eq(0),
            ]

        with m.If(frame_end):
            m.d.sync += [
                active.eq(0),
                self.frames.eq(self.frames + 1),
                self.frame_clocks.eq(frame_clk),
            ]

        # -- status port writes, synthesizers and DACs ----------------------

        # OUT PA0 is decoded by data bits 15..13.
        st_write = Signal()
        m.d.comb += st_write.eq(any_out & (out_port == 0))
        fsyn_write = Signal(2)
        fsyn_value = Signal(13)
        m.d.comb += [
            fsyn_write.eq(Mux(st_write & (out_data[13:16] == 0b001),
                              Mux(out_data[12], 0b10, 0b01), 0)),
            fsyn_value.eq(4096 - out_data[:12]),
        ]
        with m.If(ncen & st_write):
            with m.If(out_data[13:16] == 0b100):
                m.d.sync += flags.bit_select(out_data[10:13], 1).eq(out_data[0])
            with m.If(out_data[13:16] == 0b110):
                m.d.sync += [self.firq.eq(1), firq_req.eq(1)]
        with m.If(self.firq_clear):
            m.d.sync += self.firq.eq(0)

        # Two frequency synthesizers: a tick every (4096 - value) / 8
        # instruction cycles. A new value takes effect at the next tick.
        fsyn_pending = [Signal(13, init=4096 - FSYN_UNITY, name=f"fsyn_pending{s}") for s in range(2)]
        fsyn_period = [Signal(13, init=4096 - FSYN_UNITY, name=f"fsyn_period{s}") for s in range(2)]
        fsyn_phase = [Signal(13, name=f"fsyn_phase{s}") for s in range(2)]
        fsyn_tick = Signal(2)
        for s in range(2):
            pending_next = Signal(13, name=f"fsyn_pending_next{s}")
            phase_next = Signal(14, name=f"fsyn_phase_next{s}")
            m.d.comb += [
                pending_next.eq(Mux(fsyn_write[s], fsyn_value, fsyn_pending[s])),
                phase_next.eq(fsyn_phase[s] + 8),
                fsyn_tick[s].eq(phase_next >= fsyn_period[s]),
                self.fsyn_period[s].eq(fsyn_period[s]),
            ]
            with m.If(ncen):
                m.d.sync += fsyn_pending[s].eq(pending_next)
                with m.If(fsyn_tick[s]):
                    m.d.sync += [
                        fsyn_phase[s].eq(phase_next - fsyn_period[s]),
                        fsyn_period[s].eq(pending_next),
                    ]
                with m.Else():
                    m.d.sync += fsyn_phase[s].eq(phase_next)

        # Output sample clock per DAC, by the clock select.
        frame_tick = Signal()
        dac_clock = Signal(2)  # [0] left, [1] right
        m.d.comb += frame_tick.eq(pos == FRAME_CYCLES - 1)
        with m.Switch(self.clock_mode):
            with m.Case(1):
                m.d.comb += dac_clock.eq(Cat(fsyn_tick[1], fsyn_tick[1]))
            with m.Case(2, 3):
                m.d.comb += dac_clock.eq(fsyn_tick)
            with m.Default():
                m.d.comb += dac_clock.eq(Cat(frame_tick, frame_tick))

        # Each clock moves the DAC latch into the converter and asks for the
        # next word (FSYN STAT); a DAC write clears the request. The output
        # sample of a frame is the converter's average over the frame.
        for ch, dac_port in ((0, 5), (1, 6)):
            converter = Signal(signed(16), name=f"converter{ch}")
            frame_sum = Signal(signed(24), name=f"frame_sum{ch}")
            total = Signal(signed(24), name=f"frame_total{ch}")
            average = Signal(signed(27), name=f"frame_average{ch}")
            m.d.comb += [
                total.eq(frame_sum + converter),
                # ~ total / 104 (exactly as model.board.frame_average)
                average.eq((total >> 7) * 315),
            ]
            with m.If(ncen):
                m.d.sync += frame_sum.eq(Mux(frame_tick, 0, total))
                with m.If(any_out & (out_port == dac_port)):
                    m.d.sync += fsyn_stat[ch].eq(0)
                with m.If(dac_clock[ch]):
                    m.d.sync += [
                        converter.eq(latch[dac_port]),
                        fsyn_stat[ch].eq(1),
                    ]
                with m.If(frame_tick):
                    m.d.sync += self.dac.payload[ch].eq(average[8:24])

        with m.If(self.dac.ready):
            m.d.sync += self.dac.valid.eq(0)
        with m.If(frame_end):
            m.d.sync += self.dac.valid.eq(1)

        # Host parameter latch: present each entry until every DSP has read
        # PA5 once (or a timeout passes, for DSPs that never read it), then
        # move on at a frame boundary. The next entry is taken on the clock
        # after the frame ends (no DSP runs then), which keeps the FIFO off
        # the DSP clock enable's timing path. A FIRQ acknowledge entry only
        # clears the DSPs' FIRQ request (the latch keeps its value): DSP
        # programs raise FIRQ and then read the latch until it clears, while
        # the 6809 sends their parameters before acknowledging.
        param_next = Signal()
        m.d.sync += param_next.eq(0)
        with m.If(frame_end):
            with m.If(param_fifo.r_stream.valid &
                      (host_seen.all() | (host_age == self.param_timeout_frames))):
                m.d.sync += param_next.eq(1)
            with m.Elif(host_age != self.param_timeout_frames):
                m.d.sync += host_age.eq(host_age + 1)
        m.d.comb += param_fifo.r_stream.ready.eq(param_next)
        param_entry = Signal(PARAM_LAYOUT)
        m.d.comb += param_entry.eq(param_fifo.r_stream.payload)
        with m.If(param_next):
            with m.If((param_entry.addr & PARAM_FIRQ_ACK).any()):
                m.d.sync += firq_req.eq(0)
            with m.Else():
                m.d.sync += [
                    host.eq(param_entry),
                    host_seen.eq(0),
                    host_age.eq(0),
                ]

        with m.If(~rs_n):
            m.d.sync += [
                active.eq(0),
                pos.eq(0),
                addr.eq(0),
                host.eq(0),
                host_seen.eq(0),
                host_age.eq(0),
            ]

        return m


class DelayMemBRAM(wiring.Component):

    """Delay memory in block RAM (``words`` must be a power of two).

    Addresses wrap modulo ``words``. Used for simulation and as a reduced-size
    fallback; the full 64K-word memory lives in PSRAM (see cache.py).
    """

    def __init__(self, words=65536):
        self.words = words
        super().__init__({
            "bus": In(DelayMemSignature()),
        })

    def elaborate(self, platform):
        m = Module()
        bits = (self.words - 1).bit_length()
        m.submodules.mem = mem = Memory(shape=unsigned(16), depth=self.words, init=[])
        rd = mem.read_port()
        wr = mem.write_port()

        prev_addr = Signal(bits)
        prev_wr = Signal()
        m.d.sync += [
            prev_addr.eq(self.bus.addr[:bits]),
            prev_wr.eq(wr.en),
        ]
        m.d.comb += [
            rd.addr.eq(self.bus.addr[:bits]),
            self.bus.rd_data.eq(rd.data),
            # Data is valid once the address has been stable for a clock and
            # no write landed on the clock the read was issued.
            self.bus.rd_valid.eq((prev_addr == self.bus.addr[:bits]) & ~prev_wr),
            self.bus.wr_ready.eq(1),
            wr.addr.eq(self.bus.addr[:bits]),
            wr.data.eq(self.bus.wr_data),
            wr.en.eq(self.bus.commit & self.bus.wr_en),
        ]
        return m
