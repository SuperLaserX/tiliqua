"""SoC peripheral wrapping the H3000 DSP board.

The softcore (running the 6809 emulation) uses it to hold/release the DSPs,
load their program memories, push parameter writes into the host latch FIFO,
access the DSP bus ports in the host's bus slot (the 6809's $8000 window),
select the DAC clocks, take the DSPs' interrupts and read diagnostics, and
reads the MIDI input for the emulated MIDI port. Audio streams to/from the
CODEC pass straight through to the DSP board; the delay memory is cached in
front of PSRAM.
"""

from amaranth import *
from amaranth.lib import data, fifo, stream, wiring
from amaranth.lib.wiring import In, Out, connect, flipped
from amaranth_soc import csr

from tiliqua.dsp import ASQ

from .board import H3000DspBoard
from .cache import DelayCache


class H3000Peripheral(wiring.Component):

    class Control(csr.Register, access="rw"):
        """run: release the DSPs from reset. bypass: route inputs straight to
        outputs. mute: silence the outputs. clock_mode: DAC clock select (0
        input rate, 1 right synthesizer for both, 2 left / right)."""
        run:        csr.Field(csr.action.RW, unsigned(1))
        bypass:     csr.Field(csr.action.RW, unsigned(1))
        mute:       csr.Field(csr.action.RW, unsigned(1))
        clock_mode: csr.Field(csr.action.RW, unsigned(2))

    class BusReq(csr.Register, access="w"):
        """Queue one host access to a DSP bus port (one per frame)."""
        data: csr.Field(csr.action.W, unsigned(16))
        port: csr.Field(csr.action.W, unsigned(3))
        read: csr.Field(csr.action.W, unsigned(1))

    class BusStatus(csr.Register, access="r"):
        """Result of the last host read, reads completed (wraps) and queued
        requests."""
        result: csr.Field(csr.action.R, unsigned(16))
        reads:  csr.Field(csr.action.R, unsigned(8))
        level:  csr.Field(csr.action.R, unsigned(8))

    class Irq(csr.Register, access="r"):
        """FIRQ from the DSPs (until cleared) and the status flags Q7..Q0."""
        firq:  csr.Field(csr.action.R, unsigned(1))
        rsvd:  csr.Field(csr.action.ResR0W0, unsigned(7))
        flags: csr.Field(csr.action.R, unsigned(8))

    class FirqClear(csr.Register, access="w"):
        """Clear the FIRQ line at once. Follow it with a ``param`` write of
        address ``PARAM_FIRQ_ACK``, which clears the FIRQ request the DSPs
        see once the parameter writes queued before it have been taken."""
        clear: csr.Field(csr.action.W, unsigned(1))

    class PLoad(csr.Register, access="w"):
        """Write one program word (only while the DSPs are held in reset)."""
        data: csr.Field(csr.action.W, unsigned(16))
        addr: csr.Field(csr.action.W, unsigned(12))
        dsp:  csr.Field(csr.action.W, unsigned(2))

    class Param(csr.Register, access="w"):
        """Queue one (address, data) write for the DSP host latch, or a FIRQ
        acknowledge (address ``PARAM_FIRQ_ACK``, see ``FirqClear``)."""
        data: csr.Field(csr.action.W, unsigned(16))
        addr: csr.Field(csr.action.W, unsigned(16))

    class ParamLevel(csr.Register, access="r"):
        level: csr.Field(csr.action.R, unsigned(8))

    class Frames(csr.Register, access="r"):
        count: csr.Field(csr.action.R, unsigned(32))

    class StallClocks(csr.Register, access="r"):
        count: csr.Field(csr.action.R, unsigned(32))

    class FrameClocks(csr.Register, access="r"):
        """Clocks used by the last frame and the maximum since cleared."""
        last: csr.Field(csr.action.R, unsigned(16))
        max:  csr.Field(csr.action.R, unsigned(16))

    class ClearMax(csr.Register, access="w"):
        clear: csr.Field(csr.action.W, unsigned(1))

    class Misses(csr.Register, access="r"):
        count: csr.Field(csr.action.R, unsigned(32))

    class Writebacks(csr.Register, access="r"):
        count: csr.Field(csr.action.R, unsigned(32))

    class MidiRx(csr.Register, access="r"):
        """The next received MIDI byte, if valid; reading takes it."""
        byte:  csr.Field(csr.action.R, unsigned(8))
        valid: csr.Field(csr.action.R, unsigned(1))

    class Outputs(csr.Register, access="r"):
        """Last values the DSPs wrote to PA5 / PA6."""
        out5: csr.Field(csr.action.R, unsigned(16))
        out6: csr.Field(csr.action.R, unsigned(16))

    def __init__(self, *, psram_signature, delay_base_word, cache_words=4096):
        self.psram_signature = psram_signature
        self.delay_base_word = delay_base_word
        self.cache_words = cache_words

        regs = csr.Builder(addr_width=6, data_width=8)
        self._control     = regs.add("control",      self.Control(),     offset=0x00)
        self._bus_req     = regs.add("bus_req",      self.BusReq(),      offset=0x04)
        self._pload       = regs.add("pload",        self.PLoad(),       offset=0x08)
        self._param       = regs.add("param",        self.Param(),       offset=0x0C)
        self._param_level = regs.add("param_level",  self.ParamLevel(),  offset=0x10)
        self._frames      = regs.add("frames",       self.Frames(),      offset=0x14)
        self._stalls      = regs.add("stall_clocks", self.StallClocks(), offset=0x18)
        self._frame_clks  = regs.add("frame_clocks", self.FrameClocks(), offset=0x1C)
        self._clear_max   = regs.add("clear_max",    self.ClearMax(),    offset=0x20)
        self._misses      = regs.add("misses",       self.Misses(),      offset=0x24)
        self._writebacks  = regs.add("writebacks",   self.Writebacks(),  offset=0x28)
        self._outputs     = regs.add("outputs",      self.Outputs(),     offset=0x2C)
        self._bus_status  = regs.add("bus_status",   self.BusStatus(),   offset=0x30)
        self._irq         = regs.add("irq",          self.Irq(),         offset=0x34)
        self._firq_clear  = regs.add("firq_clear",   self.FirqClear(),   offset=0x38)
        self._midi_rx     = regs.add("midi_rx",      self.MidiRx(),      offset=0x3C)
        self._bridge = csr.Bridge(regs.as_memory_map())

        super().__init__({
            "csr_bus": In(csr.Signature(addr_width=regs.addr_width, data_width=regs.data_width)),
            "psram":   Out(psram_signature),
            # CODEC streams (4 channels): inputs 0/1 feed the H3000 left/right
            # inputs; outputs 0/1 and 2/3 both carry left/right. Inputs 2/3
            # (jacks 3 and 4) are not used here: the firmware reads them as
            # control voltages through the pmod's own sample_i2/sample_i3
            # CSRs (calibrated, sampled as it polls) and its jack-detect
            # register, and sends them to the emulated H3000 as MIDI
            # controllers (emu/src/cv.rs).
            "i":       In(stream.Signature(data.ArrayLayout(ASQ, 4))),
            "o":       Out(stream.Signature(data.ArrayLayout(ASQ, 4))),
            # Raw MIDI input bytes (the 6809 firmware parses MIDI itself).
            "midi":    In(stream.Signature(unsigned(8))),
        })
        self.csr_bus.memory_map = self._bridge.bus.memory_map

    def elaborate(self, platform):
        m = Module()
        m.submodules.bridge = self._bridge
        connect(m, flipped(self.csr_bus), self._bridge.bus)

        m.submodules.board = board = H3000DspBoard()
        m.submodules.cache = cache = DelayCache(
            bus_signature=self.psram_signature, base_word=self.delay_base_word,
            words=self.cache_words)
        connect(m, board.mem, cache.bus)
        connect(m, cache.wb, flipped(self.psram))

        ctrl = self._control.f
        m.d.comb += [
            board.run.eq(ctrl.run.data),
            board.pload.valid.eq(self._pload.f.data.w_stb),
            board.pload.payload.data.eq(self._pload.f.data.w_data),
            board.pload.payload.addr.eq(self._pload.f.addr.w_data),
            board.pload.payload.dsp.eq(self._pload.f.dsp.w_data),
            board.param.valid.eq(self._param.f.data.w_stb),
            board.param.payload.data.eq(self._param.f.data.w_data),
            board.param.payload.addr.eq(self._param.f.addr.w_data),
            self._param_level.f.level.r_data.eq(board.param_level),
            self._frames.f.count.r_data.eq(board.frames),
            self._stalls.f.count.r_data.eq(board.stall_clocks),
            self._frame_clks.f.last.r_data.eq(board.frame_clocks),
            self._misses.f.count.r_data.eq(cache.misses),
            self._writebacks.f.count.r_data.eq(cache.writebacks),
            self._outputs.f.out5.r_data.eq(board.out5),
            self._outputs.f.out6.r_data.eq(board.out6),
            board.clock_mode.eq(ctrl.clock_mode.data),
            board.bus_req.valid.eq(self._bus_req.f.data.w_stb),
            board.bus_req.payload.data.eq(self._bus_req.f.data.w_data),
            board.bus_req.payload.port.eq(self._bus_req.f.port.w_data),
            board.bus_req.payload.read.eq(self._bus_req.f.read.w_data),
            self._bus_status.f.result.r_data.eq(board.bus_result),
            self._bus_status.f.reads.r_data.eq(board.bus_reads),
            self._bus_status.f.level.r_data.eq(board.bus_level),
            self._irq.f.firq.r_data.eq(board.firq),
            self._irq.f.flags.r_data.eq(board.flags),
            board.firq_clear.eq(self._firq_clear.f.clear.w_stb & self._firq_clear.f.clear.w_data),
        ]

        # MIDI input: the register shows the head of the receive FIFO and a
        # read takes it (the value read is captured when the read starts).
        m.d.comb += [
            self._midi_rx.f.byte.r_data.eq(self.midi.payload),
            self._midi_rx.f.valid.r_data.eq(self.midi.valid),
            self.midi.ready.eq(self._midi_rx.f.valid.r_stb),
        ]

        # Worst-case frame time (clocks), to check the PSRAM stall budget.
        max_clocks = Signal(16)
        m.d.comb += self._frame_clks.f.max.r_data.eq(max_clocks)
        with m.If(board.dac.valid & (board.frame_clocks > max_clocks)):
            m.d.sync += max_clocks.eq(board.frame_clocks)
        with m.If(self._clear_max.f.clear.w_stb):
            m.d.sync += max_clocks.eq(0)

        # -- audio ---------------------------------------------------------

        # CODEC -> DSP board: one stereo sample starts each frame. A few
        # samples of slack absorb frames that overrun on PSRAM stalls.
        m.submodules.adc_fifo = adc_fifo = fifo.SyncFIFOBuffered(width=32, depth=8)
        m.d.comb += [
            self.i.ready.eq(1),  # never back-pressure the CODEC
            adc_fifo.w_stream.valid.eq(self.i.valid),
            adc_fifo.w_stream.payload.eq(Cat(self.i.payload[0].as_value(),
                                             self.i.payload[1].as_value())),
            board.adc.valid.eq(adc_fifo.r_stream.valid),
            board.adc.payload.eq(adc_fifo.r_stream.payload),
            adc_fifo.r_stream.ready.eq(board.adc.ready),
        ]

        # DSP board -> CODEC. While the DSPs are stopped or bypassed, the
        # output follows the input stream directly instead.
        m.submodules.dac_fifo = dac_fifo = fifo.SyncFIFOBuffered(width=32, depth=8)
        processing = Signal()
        dry = Signal(32)
        m.d.comb += [
            processing.eq(ctrl.run.data & ~ctrl.bypass.data),
            dry.eq(Cat(self.i.payload[0].as_value(), self.i.payload[1].as_value())),
            board.dac.ready.eq(1),
            dac_fifo.w_stream.valid.eq(Mux(processing, board.dac.valid, self.i.valid)),
        ]
        with m.If(ctrl.mute.data):
            m.d.comb += dac_fifo.w_stream.payload.eq(0)
        with m.Elif(processing):
            m.d.comb += dac_fifo.w_stream.payload.eq(board.dac.payload)
        with m.Else():
            m.d.comb += dac_fifo.w_stream.payload.eq(dry)

        sample = dac_fifo.r_stream.payload
        m.d.comb += [
            self.o.valid.eq(dac_fifo.r_stream.valid),
            dac_fifo.r_stream.ready.eq(self.o.ready),
            self.o.payload[0].as_value().eq(sample[:16]),
            self.o.payload[1].as_value().eq(sample[16:]),
            self.o.payload[2].as_value().eq(sample[:16]),
            self.o.payload[3].as_value().eq(sample[16:]),
        ]

        return m
