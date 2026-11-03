"""Everything before the oscillators, once per sample: `model/modulation.py` in gateware,
bit for bit.

    ModEngine     the inputs (CV smoothing, gate triggers), then in turn:
      Envelopes   two DAHDSRs, which can loop
      Lfos        three
      ModMatrix   twelve slots onto nine destinations, then each destination's arithmetic:
                  increment (table and shift), position, tilt, level through the VCAs

Each takes its turn through its own multiplier, and has its parameters in its own small
memory, written by the parameter port and read once a sample. So a sample costs at most about
206 clocks of the 1250 at 48 kHz, whatever the patch (`test_mod.py` holds it to that).

A parameter written during a run takes effect from whichever read comes after it: that can
only make one sample see part of an edit, and every word is whole. The firmware writes words
from one place, the control tick.
"""

from amaranth import *
from amaranth.lib import data, wiring
from amaranth.lib.memory import Memory
from amaranth.lib.wiring import In, Out

from model.modulation import (AMOUNT_SHIFT, ATTACK, BALANCE, CV_FLOOR, CV_FRAC, CV_SHIFT, DECAY, DELAY, FS, FULL,
                              GATE_HIGH, GATE_LOW, HOLD, IDLE, LAYER_DESTS, LEVEL, LOOP_FREE, LOOP_OFF, N_DESTS,
                              N_SLOTS, ONE, PITCH, PITCH_MAX, PITCH_MIN, POS, RELEASE, SAW_DOWN, SAW_UP, SHIFT, SINE,
                              SQUARE, SUSTAIN, TRI, UNITY_LEVEL, W_CTRL, W_CURVES, W_SUSTAIN, exp_rom)


def parameter_port(addr_width):
    return {"wr_en": In(1), "wr_addr": In(addr_width), "wr_data": In(32)}


def multiplier(m):
    """Operands registered, product registered: a product is ready two clocks after its
    operands are set."""
    a = Signal(signed(18))
    b = Signal(signed(18))
    prod = Signal(signed(36))
    m.d.sync += prod.eq(a * b)
    return a, b, prod


def clamp(x, lo, hi):
    return Mux(x < lo, lo, Mux(x > hi, hi, x))


class Envelopes(wiring.Component):
    """Two DAHDSRs. An envelope's words, addressed by stage where they have one: control
    (gate mask, loop mode); the delay, attack, hold and decay rates; sustain; the release
    rate; the three curves (10 bits each)."""

    def __init__(self):
        super().__init__({
            "start": In(1),
            "done": Out(1),
            "gates": In(2),
            "rising": In(2),
            "level": Out(data.ArrayLayout(unsigned(17), 2)),
            "out": Out(data.ArrayLayout(signed(18), 2)),
            "stage": Out(data.ArrayLayout(unsigned(3), 2)),
            # How far through its stage each is: the top of `t`, for the screen.
            "progress": Out(data.ArrayLayout(unsigned(8), 2)),
            **parameter_port(4),
        })

    def elaborate(self, platform):
        m = Module()
        m.submodules.mem = mem = Memory(shape=unsigned(32), depth=16, init=[])
        rd = mem.read_port()
        wr = mem.write_port()
        m.d.comb += [wr.en.eq(self.wr_en), wr.addr.eq(self.wr_addr), wr.data.eq(self.wr_data)]

        e = Signal(1)
        word = Signal(3)
        m.d.comb += rd.addr.eq(Cat(word, e))

        stages = [Signal(3, name=f"stage{i}") for i in range(2)]
        ts = [Signal(32, name=f"t{i}") for i in range(2)]
        starts = [Signal(17, name=f"start{i}") for i in range(2)]
        levels = [Signal(17, name=f"level{i}") for i in range(2)]
        outs = [Signal(signed(18), name=f"out{i}") for i in range(2)]
        stage = Array(stages)[e]
        t = Array(ts)[e]
        start = Array(starts)[e]
        level = Array(levels)[e]
        for i in range(2):
            m.d.comb += [self.stage[i].eq(stages[i]), self.level[i].eq(levels[i]), self.out[i].eq(outs[i]),
                         self.progress[i].eq(ts[i][24:])]

        a, b, prod = multiplier(m)

        gate_now = Signal()
        loop_now = Signal(2)
        carried = Signal()
        target = Signal(17)
        c = Signal(signed(18))
        x = Signal(17)
        second = Signal()

        mask = rd.data[:2]
        loop = rd.data[2:4]
        gate = (self.gates & mask).any()
        fire = (self.rising & mask).any()

        rate = rd.data
        total = Signal(33)
        m.d.comb += total.eq(t + Cat(rate, rate == 0))

        def enter(s):
            m.d.sync += [stage.eq(s), t.eq(0), start.eq(level)]

        x_next = Signal(signed(19))
        m.d.comb += x_next.eq(x - (prod >> 16))

        with m.FSM():

            with m.State("IDLE"):
                # (`e` is 0 here, and the control word is on its way)
                m.d.comb += word.eq(W_CTRL)
                with m.If(self.start):
                    m.next = "CTRL"

            with m.State("READ_CTRL"):
                m.d.comb += word.eq(W_CTRL)
                m.next = "CTRL"

            with m.State("CTRL"):
                m.d.sync += [gate_now.eq(gate), loop_now.eq(loop)]
                with m.If(fire):
                    enter(DELAY)
                with m.Elif((loop != LOOP_FREE) & ~gate & (stage != IDLE) & (stage != RELEASE)):
                    enter(RELEASE)
                with m.Elif((loop == LOOP_FREE) & (stage == IDLE)):
                    enter(DELAY)
                m.next = "READ_STAGE"

            with m.State("READ_STAGE"):
                m.d.comb += word.eq(stage)
                m.next = "ADVANCE"

            with m.State("ADVANCE"):
                m.d.comb += word.eq(W_SUSTAIN)
                with m.Switch(stage):
                    with m.Case(IDLE):
                        m.d.sync += level.eq(0)
                        m.next = "VOLTS"
                    with m.Case(SUSTAIN):
                        m.d.sync += level.eq(rd.data)
                        m.next = "VOLTS"
                    with m.Case(DELAY, HOLD):
                        m.d.sync += t.eq(total)
                        m.next = "VOLTS"
                        with m.If(total[32]):
                            m.next = "NEXT_STAGE"
                    with m.Default():
                        m.d.sync += [t.eq(total), carried.eq(total[32])]
                        m.next = "TARGET"

            with m.State("TARGET"):
                with m.Switch(stage):
                    with m.Case(ATTACK):
                        m.d.sync += target.eq(ONE)
                    with m.Case(DECAY):
                        m.d.sync += target.eq(rd.data)
                    with m.Default():
                        m.d.sync += target.eq(0)
                m.d.comb += word.eq(W_CURVES)
                m.next = "CURVE"

            with m.State("CURVE"):
                with m.Switch(stage):
                    with m.Case(ATTACK):
                        m.d.sync += c.eq(rd.data[0:10].as_signed() << 8)
                    with m.Case(DECAY):
                        m.d.sync += c.eq(rd.data[10:20].as_signed() << 8)
                    with m.Default():
                        m.d.sync += c.eq(rd.data[20:30].as_signed() << 8)
                with m.If(carried):
                    m.d.sync += level.eq(target)
                    m.next = "NEXT_STAGE"
                with m.Else():
                    m.d.sync += [x.eq(t[16:]), second.eq(0)]
                    m.next = "BOW"

            # shape(), model/modulation.py: u - c * u * (1 - u), twice.
            with m.State("BOW"):
                m.d.sync += [a.eq(x), b.eq(ONE - x)]
                m.next = "BOW_WAIT"

            with m.State("BOW_WAIT"):
                m.next = "BEND"

            with m.State("BEND"):
                m.d.sync += [a.eq(c), b.eq(prod >> 16)]
                m.next = "BEND_WAIT"

            with m.State("BEND_WAIT"):
                m.next = "BENT"

            with m.State("BENT"):
                with m.If(second):
                    m.d.sync += [a.eq(target - start), b.eq(x_next)]
                    m.next = "LEVEL_WAIT"
                with m.Else():
                    m.d.sync += [x.eq(x_next), second.eq(1)]
                    m.next = "BOW"

            with m.State("LEVEL_WAIT"):
                m.next = "LEVEL"

            with m.State("LEVEL"):
                m.d.sync += level.eq(start + (prod >> 16))
                m.next = "VOLTS"

            with m.State("NEXT_STAGE"):
                m.d.sync += [t.eq(0), start.eq(level)]
                with m.Switch(stage):
                    with m.Case(DELAY):
                        m.d.sync += stage.eq(ATTACK)
                    with m.Case(ATTACK):
                        m.d.sync += stage.eq(HOLD)
                    with m.Case(HOLD):
                        m.d.sync += stage.eq(DECAY)
                    with m.Case(DECAY):
                        m.d.sync += stage.eq(Mux(loop_now == LOOP_OFF, SUSTAIN, RELEASE))
                    with m.Default():
                        again = (loop_now == LOOP_FREE) | ((loop_now != LOOP_OFF) & gate_now)
                        m.d.sync += stage.eq(Mux(again, DELAY, IDLE))
                m.next = "VOLTS"

            with m.State("VOLTS"):
                m.d.sync += [a.eq(level), b.eq(FULL)]
                m.next = "VOLTS_WAIT"

            with m.State("VOLTS_WAIT"):
                m.next = "OUT"

            with m.State("OUT"):
                m.d.sync += Array(outs)[e].eq(prod >> 16)
                with m.If(e):
                    m.d.sync += e.eq(0)
                    m.d.comb += self.done.eq(1)
                    m.next = "IDLE"
                with m.Else():
                    m.d.sync += e.eq(1)
                    m.next = "READ_CTRL"

        return m


class Lfos(wiring.Component):
    """Three. An LFO's words: the rate; offset (16), shape (3), unipolar (1), sync mask (2);
    the amplitude as a source."""

    N = 3

    def __init__(self):
        super().__init__({
            "start": In(1),
            "done": Out(1),
            "rising": In(2),
            "out": Out(data.ArrayLayout(signed(18), self.N)),
            "phase": Out(data.ArrayLayout(unsigned(32), self.N)),
            **parameter_port(4),
        })

    def elaborate(self, platform):
        m = Module()
        m.submodules.mem = mem = Memory(shape=unsigned(32), depth=16, init=[])
        rd = mem.read_port()
        wr = mem.write_port()
        m.d.comb += [wr.en.eq(self.wr_en), wr.addr.eq(self.wr_addr), wr.data.eq(self.wr_data)]

        i = Signal(range(self.N))
        word = Signal(2)
        m.d.comb += rd.addr.eq(Cat(word, i))

        phases = [Signal(32, name=f"phase{k}") for k in range(self.N)]
        helds = [Signal(signed(17), name=f"held{k}") for k in range(self.N)]
        outs = [Signal(signed(18), name=f"out{k}") for k in range(self.N)]
        phase = Array(phases)[i]
        held = Array(helds)[i]
        for k in range(self.N):
            m.d.comb += [self.phase[k].eq(phases[k]), self.out[k].eq(outs[k])]

        a, b, prod = multiplier(m)

        # PRBS23, a step per LFO.
        lfsr = Signal(23, init=1)

        ctrl = Signal(22)
        offset = ctrl[:16]
        kind = ctrl[16:19]
        uni = ctrl[19]
        sync = ctrl[20:22]
        amp = Signal(17)
        y = Signal(signed(18))

        total = Signal(33)
        m.d.comb += total.eq(phase + rd.data)
        fire = (self.rising & sync).any()

        x = Signal(16)
        m.d.comb += x.eq(phase[16:] + offset)
        s = x.as_signed()
        s_abs = Mux(x[15], -s, s)

        shaped = Signal(signed(18))
        x2 = Cat(C(0, 1), x)
        x4 = Cat(C(0, 2), x)
        with m.Switch(kind):
            with m.Case(TRI):
                with m.If(x < 0x4000):
                    m.d.comb += shaped.eq(x4)
                with m.Elif(x < 0xC000):
                    m.d.comb += shaped.eq(2 * ONE - x4)
                with m.Else():
                    m.d.comb += shaped.eq(x4 - 4 * ONE)
            with m.Case(SAW_UP):
                m.d.comb += shaped.eq(x2 - ONE)
            with m.Case(SAW_DOWN):
                m.d.comb += shaped.eq(ONE - x2)
            with m.Case(SQUARE):
                m.d.comb += shaped.eq(Mux(x[15], -ONE, ONE))
            with m.Default():
                m.d.comb += shaped.eq(held)

        with m.FSM():

            with m.State("IDLE"):
                m.d.comb += word.eq(1)
                with m.If(self.start):
                    m.next = "CTRL"

            with m.State("READ_CTRL"):
                m.d.comb += word.eq(1)
                m.next = "CTRL"

            with m.State("CTRL"):
                m.d.sync += ctrl.eq(rd.data)
                m.d.comb += word.eq(0)
                m.next = "RATE"

            with m.State("RATE"):
                m.d.sync += lfsr.eq(Cat(lfsr[22] ^ lfsr[17], lfsr[:22]))
                m.d.sync += phase.eq(Mux(fire, 0, total))
                with m.If(fire | total[32]):
                    m.d.sync += held.eq(lfsr[:17])
                m.d.comb += word.eq(2)
                m.next = "AMP"

            with m.State("AMP"):
                m.d.sync += amp.eq(rd.data)
                m.next = "SHAPE"

            with m.State("SHAPE"):
                with m.If(kind == SINE):
                    m.d.sync += [a.eq(s), b.eq(0x8000 - s_abs)]
                    m.next = "SINE_WAIT"
                with m.Else():
                    m.d.sync += y.eq(shaped)
                    m.next = "POLARITY"

            with m.State("SINE_WAIT"):
                m.next = "SINE"

            with m.State("SINE"):
                m.d.sync += y.eq(prod >> 12)
                m.next = "POLARITY"

            with m.State("POLARITY"):
                m.d.sync += [a.eq(Mux(uni, (y + ONE) >> 1, y)), b.eq(amp)]
                m.next = "SCALE_WAIT"

            with m.State("SCALE_WAIT"):
                m.next = "OUT"

            with m.State("OUT"):
                m.d.sync += Array(outs)[i].eq(prod >> 16)
                with m.If(i == self.N - 1):
                    m.d.sync += i.eq(0)
                    m.d.comb += self.done.eq(1)
                    m.next = "IDLE"
                with m.Else():
                    m.d.sync += i.eq(i + 1)
                    m.next = "READ_CTRL"

        return m


class ModMatrix(wiring.Component):
    """Base values plus slots, and what each destination becomes.

    Two parameter ports: `slots` (a slot: amount 18, source 3, destination 4) and `base`
    (a destination's base value, 26 bits signed)."""

    def __init__(self, fs=FS):
        self.fs = fs
        super().__init__({
            "start": In(1),
            "done": Out(1),
            "sources": In(data.ArrayLayout(signed(18), 8)),
            "frames_m1": In(data.ArrayLayout(unsigned(10), 2)),
            "env_level": In(data.ArrayLayout(unsigned(17), 2)),
            "vca": In(data.ArrayLayout(unsigned(2), 2)),
            "inc": Out(data.ArrayLayout(unsigned(32), 2)),
            "pos": Out(data.ArrayLayout(unsigned(26), 2)),
            "shift": Out(data.ArrayLayout(signed(18), 2)),
            "level": Out(data.ArrayLayout(unsigned(17), 2)),
            "balance": Out(17),
            "slot_en": In(1),
            "base_en": In(1),
            "wr_addr": In(4),
            "wr_data": In(32),
        })

    def elaborate(self, platform):
        m = Module()

        m.submodules.slots = slots = Memory(shape=unsigned(25), depth=16, init=[])
        m.submodules.base = base = Memory(shape=signed(26), depth=16, init=[])
        m.submodules.acc = acc = Memory(shape=signed(26), depth=16, init=[])
        m.submodules.rom = rom = Memory(shape=unsigned(26), depth=257, init=exp_rom(self.fs))
        slot_rd, slot_wr = slots.read_port(), slots.write_port()
        base_rd, base_wr = base.read_port(), base.write_port()
        acc_rd, acc_wr = acc.read_port(), acc.write_port()
        rom_rd = rom.read_port()
        m.d.comb += [
            slot_wr.en.eq(self.slot_en), slot_wr.addr.eq(self.wr_addr), slot_wr.data.eq(self.wr_data),
            base_wr.en.eq(self.base_en), base_wr.addr.eq(self.wr_addr), base_wr.data.eq(self.wr_data),
        ]

        a, b, prod = multiplier(m)

        n = Signal(4)                   # a destination, or a slot
        dest = Signal(4)
        layer = Signal(1)
        m.d.comb += [base_rd.addr.eq(n), slot_rd.addr.eq(n)]

        amount = slot_rd.data[:18].as_signed()
        src = slot_rd.data[18:21]
        slot_dest = slot_rd.data[21:25]

        p = Signal(signed(22))
        r0 = Signal(26)
        v = Signal(32)
        octave = Signal(signed(6))
        q = Signal(17)
        env = Signal(1)
        results = {
            "inc": [Signal(32, name=f"inc{i}") for i in range(2)],
            "pos": [Signal(26, name=f"pos{i}") for i in range(2)],
            "shift": [Signal(signed(18), name=f"shift{i}") for i in range(2)],
            "level": [Signal(17, name=f"level{i}") for i in range(2)],
        }
        balance = Signal(17)
        for i in range(2):
            m.d.comb += [
                self.inc[i].eq(results["inc"][i]),
                self.pos[i].eq(results["pos"][i]),
                self.shift[i].eq(results["shift"][i]),
                self.level[i].eq(results["level"][i]),
            ]
        m.d.comb += self.balance.eq(balance)

        at = Mux(layer, LAYER_DESTS, 0)
        frames_m1 = Array(self.frames_m1[i] for i in range(2))[layer]
        env_level = Array(self.env_level[i] for i in range(2))[env]
        env_routed = Array(self.vca[i] for i in range(2))[env].bit_select(layer, 1)
        fraction = clamp(acc_rd.data, 0, ONE)

        sources = Array(self.sources[i] for i in range(8))

        with m.FSM():

            with m.State("IDLE"):
                with m.If(self.start):
                    m.d.sync += n.eq(0)
                    m.next = "BASE"

            # The accumulators start from the base values.
            with m.State("BASE"):
                m.next = "BASE_COPY"

            with m.State("BASE_COPY"):
                m.d.comb += [acc_wr.en.eq(1), acc_wr.addr.eq(n), acc_wr.data.eq(base_rd.data)]
                with m.If(n == N_DESTS - 1):
                    m.d.sync += n.eq(0)
                    m.next = "SLOT"
                with m.Else():
                    m.d.sync += n.eq(n + 1)
                    m.next = "BASE"

            with m.State("SLOT"):
                m.next = "SLOT_READ"

            with m.State("SLOT_READ"):
                m.d.sync += [a.eq(sources[src]), b.eq(amount), dest.eq(slot_dest)]
                m.next = "SLOT_WAIT"

            with m.State("SLOT_WAIT"):
                m.d.comb += acc_rd.addr.eq(dest)
                m.next = "SLOT_ADD"

            with m.State("SLOT_ADD"):
                m.d.comb += [acc_wr.en.eq(1), acc_wr.addr.eq(dest),
                             acc_wr.data.eq(acc_rd.data + (prod >> AMOUNT_SHIFT))]
                with m.If(n == N_SLOTS - 1):
                    m.d.sync += layer.eq(0)
                    m.next = "PITCH_READ"
                with m.Else():
                    m.d.sync += n.eq(n + 1)
                    m.next = "SLOT"

            # The layer's pitch: an increment from the octave's table, and the octave.
            with m.State("PITCH_READ"):
                m.d.comb += acc_rd.addr.eq(at + PITCH)
                m.next = "PITCH"

            with m.State("PITCH"):
                m.d.sync += p.eq(clamp(acc_rd.data, PITCH_MIN, PITCH_MAX))
                m.next = "ROM0"

            with m.State("ROM0"):
                m.d.comb += rom_rd.addr.eq(p[8:16])
                m.next = "ROM1"

            with m.State("ROM1"):
                m.d.sync += r0.eq(rom_rd.data)
                m.d.comb += rom_rd.addr.eq(p[8:16] + 1)
                m.next = "ROM2"

            with m.State("ROM2"):
                # (a step of the table is under 2**17 at 48 kHz)
                m.d.sync += [a.eq(rom_rd.data - r0), b.eq(p[:8])]
                m.next = "ROM_WAIT"

            with m.State("ROM_WAIT"):
                m.next = "ROM_LERP"

            with m.State("ROM_LERP"):
                m.d.sync += [v.eq(r0 + (prod >> 8)), octave.eq(p[16:].as_signed())]
                m.next = "OCTAVE"

            with m.State("OCTAVE"):
                with m.If(octave == 0):
                    m.d.sync += Array(results["inc"])[layer].eq(v)
                    m.next = "POS_READ"
                with m.Elif(octave < 0):
                    m.d.sync += [v.eq(v >> 1), octave.eq(octave + 1)]
                with m.Else():
                    m.d.sync += [v.eq(v << 1), octave.eq(octave - 1)]

            with m.State("POS_READ"):
                m.d.comb += acc_rd.addr.eq(at + POS)
                m.next = "POS"

            with m.State("POS"):
                m.d.sync += [a.eq(fraction), b.eq(frames_m1)]
                m.next = "POS_WAIT"

            with m.State("POS_WAIT"):
                m.d.comb += acc_rd.addr.eq(at + SHIFT)
                m.next = "POS_DONE"

            with m.State("POS_DONE"):
                m.d.sync += Array(results["pos"])[layer].eq(prod)
                m.d.sync += [a.eq(clamp(acc_rd.data, -(1 << 17), (1 << 17) - 1)), b.eq(frames_m1)]
                m.next = "SHIFT_WAIT"

            with m.State("SHIFT_WAIT"):
                m.d.comb += acc_rd.addr.eq(at + LEVEL)
                m.next = "SHIFT_DONE"

            with m.State("SHIFT_DONE"):
                m.d.sync += Array(results["shift"])[layer].eq(prod >> 10)
                m.d.sync += [q.eq(fraction), env.eq(0)]
                m.next = "VCA"

            # Each envelope routed to this layer's VCA multiplies its level.
            with m.State("VCA"):
                with m.If(env_routed):
                    m.d.sync += [a.eq(q), b.eq(env_level)]
                    m.next = "VCA_WAIT"
                with m.Elif(env):
                    m.d.sync += [a.eq(q), b.eq(UNITY_LEVEL)]
                    m.next = "UNITY_WAIT"
                with m.Else():
                    m.d.sync += env.eq(1)

            with m.State("VCA_WAIT"):
                m.next = "VCA_DONE"

            with m.State("VCA_DONE"):
                m.d.sync += q.eq(prod >> 16)
                with m.If(env):
                    m.next = "UNITY"
                with m.Else():
                    m.d.sync += env.eq(1)
                    m.next = "VCA"

            with m.State("UNITY"):
                m.d.sync += [a.eq(q), b.eq(UNITY_LEVEL)]
                m.next = "UNITY_WAIT"

            with m.State("UNITY_WAIT"):
                m.next = "UNITY_DONE"

            with m.State("UNITY_DONE"):
                m.d.sync += Array(results["level"])[layer].eq(prod >> 16)
                with m.If(layer):
                    m.next = "BALANCE_READ"
                with m.Else():
                    m.d.sync += layer.eq(1)
                    m.next = "PITCH_READ"

            with m.State("BALANCE_READ"):
                m.d.comb += acc_rd.addr.eq(BALANCE)
                m.next = "BALANCE"

            with m.State("BALANCE"):
                m.d.sync += balance.eq(fraction)
                m.d.comb += self.done.eq(1)
                m.next = "IDLE"

        return m


class ModEngine(wiring.Component):
    """The inputs, and each stage in turn. `start` a run with `adc` (the four input channels,
    held through it); `done` pulses when `inc`, `pos`, `shift` and `level` hold the next
    sample's parameters."""

    def __init__(self, fs=FS):
        self.envelopes = Envelopes()
        self.lfos = Lfos()
        self.matrix = ModMatrix(fs)
        super().__init__({
            "start": In(1),
            "done": Out(1),
            "adc": In(data.ArrayLayout(signed(16), 4)),
            "patched": In(2),
            "gates": Out(2),
            "frames_m1": In(data.ArrayLayout(unsigned(10), 2)),
            "vca": In(data.ArrayLayout(unsigned(2), 2)),
            "wr_en": In(1),
            "wr_addr": In(8),
            "wr_data": In(32),
        })

    def elaborate(self, platform):
        m = Module()
        env, lfo, mat = self.envelopes, self.lfos, self.matrix
        m.submodules.envelopes = env
        m.submodules.lfos = lfo
        m.submodules.matrix = mat

        # The parameter port: 0x00 envelopes, 0x10 LFOs, 0x20 slots, 0x30 base values.
        at = self.wr_addr[4:]
        index = self.wr_addr[:4]
        for port in (env, lfo):
            m.d.comb += [port.wr_addr.eq(index), port.wr_data.eq(self.wr_data)]
        m.d.comb += [
            mat.wr_addr.eq(index), mat.wr_data.eq(self.wr_data),
            env.wr_en.eq(self.wr_en & (at == 0)),
            lfo.wr_en.eq(self.wr_en & (at == 1)),
            mat.slot_en.eq(self.wr_en & (at == 2)),
            mat.base_en.eq(self.wr_en & (at == 3)),
        ]

        # The inputs.
        cv_state = [Signal(signed(26), name=f"cv{i}") for i in range(2)]
        cv = [Signal(signed(18), name=f"cv{i}_out") for i in range(2)]
        for i in range(2):
            reading = cv_state[i][CV_FRAC - 2:].as_signed()
            quiet = ~self.patched[i] & (reading > -CV_FLOOR) & (reading < CV_FLOOR)
            m.d.comb += cv[i].eq(Mux(quiet, 0, reading))

        gates = Signal(2)
        rising = Signal(2)
        gates_next = Signal(2)
        for i in range(2):
            x = self.adc[2 + i]
            m.d.comb += gates_next[i].eq(Mux(x >= GATE_HIGH, 1, Mux(x < GATE_LOW, 0, gates[i])))

        m.d.comb += [
            self.gates.eq(gates),
            env.gates.eq(gates),
            env.rising.eq(rising),
            lfo.rising.eq(rising),
        ]
        for i in range(2):
            m.d.comb += [mat.frames_m1[i].eq(self.frames_m1[i]), mat.vca[i].eq(self.vca[i]),
                         mat.env_level[i].eq(env.level[i])]
        sources = [C(0, signed(18)), cv[0], cv[1], env.out[0], env.out[1], lfo.out[0], lfo.out[1], lfo.out[2]]
        for i, s in enumerate(sources):
            m.d.comb += mat.sources[i].eq(s)

        with m.FSM():
            with m.State("IDLE"):
                with m.If(self.start):
                    for i in range(2):
                        # (the target's low bits round the reading: the shift stops short)
                        target = Cat(C(1 << (CV_FRAC - 3), CV_FRAC), self.adc[i]).as_signed()
                        m.d.sync += cv_state[i].eq(cv_state[i] + ((target - cv_state[i]) >> CV_SHIFT))
                    m.d.sync += [gates.eq(gates_next), rising.eq(gates_next & ~gates)]
                    m.next = "ENVELOPES"

            with m.State("ENVELOPES"):
                m.d.comb += env.start.eq(1)
                m.next = "ENVELOPES_WAIT"

            with m.State("ENVELOPES_WAIT"):
                with m.If(env.done):
                    m.d.comb += lfo.start.eq(1)
                    m.next = "LFOS_WAIT"

            with m.State("LFOS_WAIT"):
                with m.If(lfo.done):
                    m.d.comb += mat.start.eq(1)
                    m.next = "MATRIX_WAIT"

            with m.State("MATRIX_WAIT"):
                with m.If(mat.done):
                    m.d.comb += self.done.eq(1)
                    m.next = "IDLE"

        return m
