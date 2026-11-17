"""The tone stack and DC blocker in gateware: `model/tone.py`'s cascade of four direct-form
biquad sections, bit-exact, on the engine's output in the `sync` domain.

A sample takes about 110 clocks of the 1,250 there are. One 18 x 18 multiplier makes each of a
section's five products of a 27-bit coefficient and a 32-bit signal as four partial products,
which a 61-bit accumulator adds at their weights:

    c v = c_hi v_hi 2^23 + c_hi v_lo 2^9 + c_lo v_hi 2^14 + c_lo v_lo
    (c_hi = c >> 9, c_lo its low 9 bits; v_hi = v >> 14, v_lo its low 14)

Coefficients live in two banks of LUT RAM: the CPU writes the one not playing, a word at a time,
then asks for a swap, which happens at the next sample's start (`swap_pending` until then), so a
sample never sees half a setting. The signals' histories (two per node: the input and each
section's output) are another small LUT RAM.
"""

from amaranth import *
from amaranth.lib import data, wiring
from amaranth.lib.memory import Memory
from amaranth.lib.wiring import In, Out

from model import tone as model

COEF_BITS = 27
COEF_FRAC = 23
STATE_BITS = 32
STATE_FRAC = 27
IN_SHIFT = STATE_FRAC - 15
SECTIONS = 4
TAPS = 5
ACC_BITS = 61
# Each partial product's weight, in the order they are made: hi x hi, hi x lo, lo x hi, lo x lo.
SHIFTS = (23, 9, 14, 0)


def _sat(m, value, bits, name):
    """`value` saturated to a signed `bits`."""
    out = Signal(signed(bits), name=name)
    hi = (1 << (bits - 1)) - 1
    lo = -(1 << (bits - 1))
    with m.If(value > hi):
        m.d.comb += out.eq(hi)
    with m.Elif(value < lo):
        m.d.comb += out.eq(lo)
    with m.Else():
        m.d.comb += out.eq(value)
    return out


class ToneStack(wiring.Component):
    """
    start, x : a new input sample (pulse), held in `x` that clock
    done, y  : the output (pulse); `y` holds until the next
    busy     : computing
    coef     : a coefficient write: section * 5 + tap (b0, b1, b2, -a1, -a2), Q3.23, into the
               bank not playing
    swap     : (pulse) the bank written plays from the next sample
    swap_pending : a swap asked for and not yet made
    """

    def __init__(self):
        super().__init__({
            "start": In(1),
            "x": In(signed(16)),
            "done": Out(1),
            "y": Out(signed(16)),
            "busy": Out(1),
            "coef": In(data.StructLayout({"index": 5, "value": signed(COEF_BITS), "en": 1})),
            "swap": In(1),
            "swap_pending": Out(1),
        })

    def elaborate(self, platform):
        m = Module()

        # Both banks start flat with the DC blocker, so the sound passes before the firmware
        # writes a setting (and with firmware that never does).
        flat = [v for section in model.stack(on=False) for v in section]
        init = (flat + [0] * (32 - len(flat))) * 2
        # (in LUT RAM: the block RAM it would take holds the scope's capture ring)
        m.submodules.coefs = coefs = Memory(shape=signed(COEF_BITS), depth=64, init=init,
                                            attrs={"ram_style": "distributed"})
        m.submodules.hist = hist = Memory(shape=signed(STATE_BITS), depth=16, init=[])
        cw = coefs.write_port()
        cr = coefs.read_port(domain="comb")
        hw = hist.write_port()
        hr = hist.read_port(domain="comb")

        bank = Signal()
        m.d.comb += [cw.addr.eq(Cat(self.coef.index, ~bank)), cw.data.eq(self.coef.value),
                     cw.en.eq(self.coef.en)]
        with m.If(self.swap):
            m.d.sync += self.swap_pending.eq(1)

        k = Signal(range(SECTIONS + 1))         # the section
        mop = Signal(range(TAPS * 4 + 1))       # its micro-op: tap * 4 + part
        cur = Signal(signed(STATE_BITS))        # the section's input
        acc = Signal(signed(ACC_BITS))
        tap = Signal(range(TAPS))
        part = Signal(2)
        m.d.comb += [tap.eq(mop >> 2), part.eq(mop[:2])]

        # Stage A: the coefficient and the signal for this micro-op, registered.
        base = Signal(5)
        m.d.comb += [base.eq(k * TAPS), cr.addr.eq(Cat((base + tap)[:5], bank))]
        issue = Signal()
        c_q = Signal(signed(COEF_BITS))
        v_q = Signal(signed(STATE_BITS))
        part_a = Signal(2)
        valid_a = Signal()
        hist_addr = Signal(4)
        # (taps 1, 2: this node's history; 3, 4: the next node's; tap 0 is `cur`)
        m.d.comb += hist_addr.eq(Mux(tap >= 3, (k + 1) * 2 + (tap - 3), k * 2 + (tap - 1)))
        finish_addr = Signal(4)
        finishing = Signal()
        m.d.comb += hr.addr.eq(Mux(finishing, finish_addr, hist_addr))
        m.d.sync += [valid_a.eq(issue), part_a.eq(part), c_q.eq(cr.data),
                     v_q.eq(Mux(tap == 0, cur, hr.data))]

        # Stage B: the partial product.
        c_hi = c_q[9:].as_signed()
        c_lo = Cat(c_q[:9], C(0, 9)).as_signed()
        v_hi = v_q[14:].as_signed()
        v_lo = Cat(v_q[:14], C(0, 4)).as_signed()
        a = Signal(signed(18))
        b = Signal(signed(18))
        m.d.comb += [a.eq(Mux(part_a[1], c_lo, c_hi)), b.eq(Mux(part_a[0], v_lo, v_hi))]
        prod = Signal(signed(36))
        part_b = Signal(2)
        valid_b = Signal()
        m.d.sync += [prod.eq(a * b), part_b.eq(part_a), valid_b.eq(valid_a)]

        # Stage C: added at its weight.
        weighted = Signal(signed(ACC_BITS))
        with m.Switch(part_b):
            for p, s in enumerate(SHIFTS):
                with m.Case(p):
                    m.d.comb += weighted.eq(prod << s)
        clear_acc = Signal()
        with m.If(clear_acc):
            m.d.sync += acc.eq(0)
        with m.Elif(valid_b):
            m.d.sync += acc.eq(acc + weighted)

        # The section's output: rounded to the signal's format and saturated.
        rounded = Signal(signed(ACC_BITS - COEF_FRAC + 1))
        m.d.comb += rounded.eq((acc + (1 << (COEF_FRAC - 1))) >> COEF_FRAC)
        y_sec = _sat(m, rounded, STATE_BITS, "y_sec")
        out_r = Signal(signed(STATE_BITS - IN_SHIFT + 1))
        m.d.comb += out_r.eq((cur + (1 << (IN_SHIFT - 1))) >> IN_SHIFT)
        y16 = _sat(m, out_r, 16, "y16")

        drain = Signal(2)
        m.d.sync += self.done.eq(0)
        with m.FSM():
            with m.State("IDLE"):
                with m.If(self.start):
                    m.d.sync += [cur.eq(self.x << IN_SHIFT), k.eq(0), mop.eq(0), self.busy.eq(1)]
                    m.d.comb += clear_acc.eq(1)
                    with m.If(self.swap_pending & ~self.swap):
                        m.d.sync += [bank.eq(~bank), self.swap_pending.eq(0)]
                    m.next = "ISSUE"
            with m.State("ISSUE"):
                m.d.comb += issue.eq(1)
                m.d.sync += mop.eq(mop + 1)
                with m.If(mop == TAPS * 4 - 1):
                    m.d.sync += drain.eq(0)
                    m.next = "DRAIN"
            with m.State("DRAIN"):
                # (two stages after the last issue, then the accumulator has it)
                m.d.sync += drain.eq(drain + 1)
                with m.If(drain == 2):
                    m.next = "SHIFT"
            with m.State("SHIFT"):
                # This node's history moves on: z^-2 takes z^-1...
                m.d.comb += [finishing.eq(1), finish_addr.eq(k * 2), hw.addr.eq(k * 2 + 1),
                             hw.data.eq(hr.data), hw.en.eq(1)]
                m.next = "PUSH"
            with m.State("PUSH"):
                # ...and z^-1 takes the input; the output is the next section's input.
                m.d.comb += [hw.addr.eq(k * 2), hw.data.eq(cur), hw.en.eq(1), clear_acc.eq(1)]
                m.d.sync += [cur.eq(y_sec), k.eq(k + 1), mop.eq(0)]
                with m.If(k == SECTIONS - 1):
                    m.next = "LAST_SHIFT"
                with m.Else():
                    m.next = "ISSUE"
            with m.State("LAST_SHIFT"):
                m.d.comb += [finishing.eq(1), finish_addr.eq(SECTIONS * 2), hw.addr.eq(SECTIONS * 2 + 1),
                             hw.data.eq(hr.data), hw.en.eq(1)]
                m.next = "LAST_PUSH"
            with m.State("LAST_PUSH"):
                m.d.comb += [hw.addr.eq(SECTIONS * 2), hw.data.eq(cur), hw.en.eq(1)]
                m.d.sync += [self.y.eq(y16), self.done.eq(1), self.busy.eq(0)]
                m.next = "IDLE"
        return m
