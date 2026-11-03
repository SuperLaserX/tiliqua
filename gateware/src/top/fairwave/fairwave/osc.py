"""The WaveScan oscillator engine: `model/wavescan.py` in gateware, bit for bit.

Once per output sample it computes every layer in turn, through one multiplier:

    SCAN      frame(phi) = pos + shift * phi
    EDGE      clamp, wrap or mirror it: two frames and a blend (REM: the wrap's and
              mirror's remainder, one bit a clock)
    READ      one or two PSRAM words per frame, single reads
    LERP      between the two samples around the phase, in each frame
    BLEND     between the frames
    LEVEL     the layer's level, saturated

and then offers the samples on `o`. `go` starts each sample: the peripheral holds it low
while the modulation stages work out the next sample's parameters. (Unconnected it is high,
and the engine runs at `o`'s pace.) A sample takes about 30 clocks of arithmetic per layer
plus the reads: at most 4 words a layer, and the second frame is skipped when the blend is 0.
`clocks` counts from one sample being accepted to the next offer: a sample's whole time,
modulation included, against the 1250 clocks it has at 48 kHz.

The engine reads PSRAM through the arbiter's priority port (`fairwave/psram.py`):
`pending` keeps the bus across one layer's reads, so they run back to back, and is
released between layers. A layer at level 0 reads nothing.

Parameters come in as `layers`, and each is used once in a sample's computation, so a
change between samples takes effect on the next. A change to `table_base`, `frame_log2`
and `frames` together has to arrive at once: the peripheral keeps them in one register.
"""

from amaranth import *
from amaranth.lib import data, stream, wiring
from amaranth.lib.wiring import In, Out
from amaranth_soc import wishbone

from tiliqua.dsp import ASQ

from .fill import bus_signature

CLAMP, WRAP, MIRROR = 0, 1, 2

# Bits of the frame coordinate's integer part, signed: pos + shift * phi can reach
# past either end of a table by the whole of shift's range.
F_INT_BITS = 13


class LayerParams(data.Struct):
    table_base: unsigned(16)    # in units of 256 bytes
    frame_log2: unsigned(2)     # the frame's log2 length, less 8
    frames_m1:  unsigned(10)    # frames, less 1
    inc:        unsigned(32)    # phase increment
    pos:        unsigned(26)    # Q10.16 frames
    shift:      signed(18)      # Q11.6 frames per cycle
    level:      unsigned(17)    # U1.16
    edge:       unsigned(2)     # CLAMP, WRAP or MIRROR


class WaveScanEngine(wiring.Component):

    def __init__(self, n_layers=2, addr_width=23):
        self.n_layers = n_layers
        self.addr_width = addr_width
        super().__init__({
            "layers": In(data.ArrayLayout(LayerParams, n_layers)),
            "o": Out(stream.Signature(data.ArrayLayout(ASQ, n_layers))),
            "bus": Out(bus_signature(addr_width)),
            "pending": Out(1),
            "go": In(1, init=1),
            "phase": Out(data.ArrayLayout(unsigned(32), n_layers)),
            # A sample's computation, in clocks (up to the offer on `o`).
            "clocks": Out(16),
            "clocks_stb": Out(1),
        })

    def elaborate(self, platform):
        m = Module()

        n = self.n_layers
        layer = Signal(range(n))
        phases = [Signal(32, name=f"phase{i}") for i in range(n)]
        for i in range(n):
            m.d.comb += self.phase[i].eq(phases[i])
        results = [Signal(signed(16), name=f"result{i}") for i in range(n)]

        cur = Array(self.layers[i] for i in range(n))[layer]
        phase = Array(phases)[layer]

        k = cur.frame_log2                      # 0 to 3: 256 to 2048 samples

        # Where the phase is in the frame: the index, and the 16 bits below it.
        index = Signal(11)
        fi = Signal(16)
        with m.Switch(k):
            for i in range(4):
                bits = 8 + i
                with m.Case(i):
                    m.d.comb += [
                        index.eq(phase[32 - bits:]),
                        fi.eq(phase[16 - bits:32 - bits]),
                    ]
        word = index[1:]                        # the word in the frame
        odd = index[0]
        # The word after it, wrapping round the frame.
        word_next = Signal(10)
        with m.Switch(k):
            for i in range(4):
                with m.Case(i):
                    m.d.comb += word_next.eq((word + 1) & ((1 << (7 + i)) - 1))

        # The one multiplier: operands registered, product registered. A product is
        # ready two clocks after its operands are set.
        a = Signal(signed(18))
        b = Signal(signed(18))
        prod = Signal(signed(36))
        m.d.sync += prod.eq(a * b)

        # The frame coordinate.
        coord = Signal(signed(F_INT_BITS + 16))
        coord_int = coord[16:].as_signed()
        coord_frac = coord[:16]

        # The chosen frames and blend.
        f0 = Signal(10)
        f1 = Signal(10)
        ff = Signal(16)

        # The remainder of the coordinate's magnitude, one bit a clock.
        rem_in = Signal(F_INT_BITS)             # shifts left, the next bit on top
        rem_d = Signal(11)                      # the divisor
        rem = Signal(11)
        rem_n = Signal(range(F_INT_BITS + 1))
        rem_step = Cat(rem_in[-1], rem)         # one bit more than the remainder
        rem_sub = rem_step - rem_d

        frames = Signal(11)
        period = Signal(12)
        m.d.comb += [frames.eq(cur.frames_m1 + 1), period.eq(cur.frames_m1 << 1)]

        # Which frame is being read, and the samples around the phase.
        second = Signal()
        which_word = Signal(10)
        x0 = Signal(signed(16))
        x1 = Signal(signed(16))
        top = Signal(signed(16))

        # The frame and word of the next read, as an offset into the table.
        frame_sel = Mux(second, f1, f0)
        offset = Signal(20)
        with m.Switch(k):
            for i in range(4):
                with m.Case(i):
                    # (a frame is 2**(7 + i) words, so the word sits below it)
                    m.d.comb += offset.eq(Cat(which_word[:7 + i], frame_sel))
        adr = Signal(self.addr_width)

        bus = self.bus
        hold = Signal()
        m.d.comb += [
            self.pending.eq(hold),
            bus.adr.eq(adr),
            bus.sel.eq(0b1111),
            bus.we.eq(0),
            bus.cti.eq(wishbone.CycleType.CLASSIC),
            bus.bte.eq(wishbone.BurstTypeExt.LINEAR),
        ]

        lerp_diff = x1 - x0
        lerp_out = (x0 + (prod >> 16))[:16].as_signed()
        blend_out = (top + (prod >> 16))[:16].as_signed()
        level_out = prod >> 16
        saturated = Signal(signed(16))
        with m.If(level_out > 32767):
            m.d.comb += saturated.eq(32767)
        with m.Elif(level_out < -32768):
            m.d.comb += saturated.eq(-32768)
        with m.Else():
            m.d.comb += saturated.eq(level_out)

        count = Signal(16)
        m.d.sync += count.eq(count + 1)
        m.d.sync += self.clocks_stb.eq(0)

        def next_layer():
            if n == 1:
                m.next = "EMIT"
                return
            with m.If(layer == n - 1):
                m.next = "EMIT"
            with m.Else():
                m.d.sync += layer.eq(layer + 1)
                m.next = "START"

        with m.FSM() as fsm:

            with m.State("WAIT"):
                with m.If(self.go):
                    m.next = "START"

            with m.State("START"):
                with m.If(cur.level == 0):
                    m.d.sync += results[0].eq(0) if n == 1 else Array(results)[layer].eq(0)
                    next_layer()
                with m.Else():
                    m.d.sync += [a.eq(cur.shift), b.eq(Cat(phase[15:], C(0, 1)))]
                    m.next = "SCAN_WAIT"

            with m.State("SCAN_WAIT"):
                m.next = "SCAN"

            with m.State("SCAN"):
                # (shift Q11.6 x phi Q0.17 is Q.23)
                m.d.sync += coord.eq(cur.pos + (prod >> 7))
                m.next = "EDGE"

            with m.State("EDGE"):
                magnitude = Mux(coord_int < 0, ~coord_int, coord_int)
                with m.If(cur.edge == CLAMP):
                    with m.If(coord < 0):
                        m.d.sync += [f0.eq(0), f1.eq(0), ff.eq(0)]
                    with m.Elif(coord_int >= cur.frames_m1):
                        m.d.sync += [f0.eq(cur.frames_m1), f1.eq(cur.frames_m1), ff.eq(0)]
                    with m.Else():
                        m.d.sync += [f0.eq(coord_int), f1.eq(coord_int + 1), ff.eq(coord_frac)]
                    m.next = "READ_SETUP"
                with m.Elif((cur.edge == MIRROR) & (cur.frames_m1 == 0)):
                    m.d.sync += [f0.eq(0), f1.eq(0), ff.eq(0)]
                    m.next = "READ_SETUP"
                with m.Else():
                    m.d.sync += [
                        rem_in.eq(magnitude),
                        rem.eq(0),
                        rem_n.eq(F_INT_BITS),
                        rem_d.eq(Mux(cur.edge == WRAP, frames, period)),
                    ]
                    m.next = "REM"

            with m.State("REM"):
                m.d.sync += [rem_in.eq(rem_in << 1), rem_n.eq(rem_n - 1)]
                with m.If(rem_step >= rem_d):
                    m.d.sync += rem.eq(rem_sub)
                with m.Else():
                    m.d.sync += rem.eq(rem_step)
                with m.If(rem_n == 1):
                    m.next = "REM_DONE"

            with m.State("REM_DONE"):
                mod = Mux(coord_int < 0, rem_d - 1 - rem, rem)
                with m.If(cur.edge == WRAP):
                    m.d.sync += [
                        f0.eq(mod),
                        f1.eq(Mux(mod == cur.frames_m1, 0, mod + 1)),
                        ff.eq(coord_frac),
                    ]
                with m.Elif(mod < cur.frames_m1):
                    m.d.sync += [f0.eq(mod), f1.eq(mod + 1), ff.eq(coord_frac)]
                with m.Else():
                    m.d.sync += [
                        f0.eq(period - mod - 1),
                        f1.eq(period - mod),
                        ff.eq(~coord_frac),
                    ]
                m.next = "READ_SETUP"

            with m.State("READ_SETUP"):
                m.d.sync += [second.eq(0), which_word.eq(word), hold.eq(1)]
                m.next = "ADDR"

            with m.State("ADDR"):
                m.d.sync += adr.eq(Cat(C(0, 6), cur.table_base) + offset)
                m.next = "READ"

            with m.State("READ"):
                m.d.comb += [bus.cyc.eq(1), bus.stb.eq(1)]
                with m.If(bus.ack):
                    with m.If(odd):
                        # The first sample is this word's upper half; the second is
                        # the next word's lower half.
                        m.d.sync += [x0.eq(bus.dat_r[16:]), which_word.eq(word_next)]
                        m.next = "ADDR_NEXT"
                    with m.Else():
                        m.d.sync += [x0.eq(bus.dat_r[:16]), x1.eq(bus.dat_r[16:])]
                        m.next = "LERP"

            with m.State("ADDR_NEXT"):
                m.d.sync += adr.eq(Cat(C(0, 6), cur.table_base) + offset)
                m.next = "READ_NEXT"

            with m.State("READ_NEXT"):
                m.d.comb += [bus.cyc.eq(1), bus.stb.eq(1)]
                with m.If(bus.ack):
                    m.d.sync += x1.eq(bus.dat_r[:16])
                    m.next = "LERP"

            with m.State("LERP"):
                m.d.sync += [a.eq(lerp_diff), b.eq(Cat(fi, C(0, 1)))]
                # (no more reads for this layer: let other masters in)
                with m.If(second | (ff == 0) | (f0 == f1)):
                    m.d.sync += hold.eq(0)
                m.next = "LERP_WAIT"

            with m.State("LERP_WAIT"):
                m.next = "LERP_DONE"

            with m.State("LERP_DONE"):
                with m.If(second):
                    # The two frames' values: blend them.
                    m.d.sync += [a.eq(lerp_out - top), b.eq(Cat(ff, C(0, 1)))]
                    m.next = "BLEND_WAIT"
                with m.Elif((ff == 0) | (f0 == f1)):
                    m.d.sync += top.eq(lerp_out)
                    m.next = "BLEND_DONE_DIRECT"
                with m.Else():
                    m.d.sync += [top.eq(lerp_out), second.eq(1), which_word.eq(word)]
                    m.next = "ADDR"

            with m.State("BLEND_WAIT"):
                m.next = "BLEND_WAIT2"

            with m.State("BLEND_WAIT2"):
                m.next = "BLEND_DONE"

            with m.State("BLEND_DONE"):
                m.d.sync += top.eq(blend_out)
                m.next = "BLEND_DONE_DIRECT"

            with m.State("BLEND_DONE_DIRECT"):
                m.d.sync += [a.eq(top), b.eq(cur.level)]
                m.next = "LEVEL_WAIT"

            with m.State("LEVEL_WAIT"):
                m.next = "LEVEL_WAIT2"

            with m.State("LEVEL_WAIT2"):
                m.next = "LEVEL"

            with m.State("LEVEL"):
                m.d.sync += Array(results)[layer].eq(saturated)
                next_layer()

            with m.State("EMIT"):
                m.d.comb += self.o.valid.eq(1)
                for i in range(n):
                    m.d.comb += self.o.payload[i].as_value().eq(results[i])
                with m.If(self.o.ready):
                    for i in range(n):
                        m.d.sync += phases[i].eq(phases[i] + self.layers[i].inc)
                    m.d.sync += layer.eq(0)
                    m.next = "WAIT"

        # A sample's time: up to the offer (not the wait for the DAC).
        emit_start = Signal()
        was_emit = Signal()
        m.d.comb += emit_start.eq(fsm.ongoing("EMIT") & ~was_emit)
        m.d.sync += was_emit.eq(fsm.ongoing("EMIT"))
        with m.If(emit_start):
            m.d.sync += [self.clocks.eq(count), self.clocks_stb.eq(1)]
        with m.If(fsm.ongoing("EMIT") & self.o.ready):
            m.d.sync += count.eq(0)

        return m
