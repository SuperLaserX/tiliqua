"""The bfr engine: a time-multiplexed, microcoded reverb DSP (SPEC.md, version 0).

One frame per audio sample:

    IDLE -> PRO (write IN, LFO, NOISE, ONE, FADE registers)
         -> RUN (issue one instruction per clock)
         -> DRAIN (wait for the pipeline)
         -> EPI (read OUT0..3, advance pointers, LFOs, noise, fades) -> IDLE

Instruction pipeline (stage: work). Block-RAM outputs are slow (about 6 ns
clock-to-out), so stages that start at one do little else.

     0  fetch
     1  decode; read registers A/B (B: the modulation register of an
        interpolated read), coefficient, read and write tap entries
     2  tap addresses
     3  accumulator -> |value| and fixed-point store value; c x w: partials;
        modulation (fixed point): clamp, whole/fraction
     4  accumulator: leading zeros; c x w: sum
     5  accumulator: shift and round to f32; delay-memory read address;
        interpolation weight normalised; c x w: round
     6  operands A and B; stores (register file, delay memory)
     7  mantissa partial products
     8  48-bit product
     9  align into accumulator LSBs, saturate
    10  accumulate

Hazards this pipeline implies (the model's isa.LAT_*): an accumulator written
in stage 10 can be read (stage 3) 8 instructions later; a register stored in
stage 6 can be read (stage 1, transparent read) 5 later; accumulation is
forwarded.

Delay memory: the block-RAM space is inside; the PSRAM space is the `pmem`
port (address in stage 5, data in stage 6, writes in stage 6). It carries both
the PSRAM address and the tap's stream-buffer address (buf | (addr & bmask)
from the tap entry), so it can be served by the stream engine's buffers
(bfr/stream.py) or, in simulation, by a plain memory.
"""

from amaranth import *
from amaranth.lib import data, wiring
from amaranth.lib.memory import Memory
from amaranth.lib.wiring import In, Out

from model import engine as model_engine
from model import fp, isa

from .fpu import (Decoded, IntToF32A, assign, decode, fix_to_out,
                  int_to_f32_a, int_to_f32_b, msb)

ACC_W = 57
OFF_W = 22                      # delay-memory word address (4M words)
BUF_W = isa.BUF_BITS            # stream-buffer word address
WB_BITS = (2 * isa.STREAM_BURST - 1).bit_length()     # write-buffer region: 2N words
PIPE = 11                       # stages 0..10
N_PRO_STEPS = 4 + 4 * isa.N_LFO + 2 + 2 * isa.N_FADE    # IN, LFO parts, NOISE, ONE, FADE
PRO_LAT = 6                     # prologue pipeline: step -> register write
EPI_LAT = 3                     # epilogue: OUT register read -> output latch

Instr = data.StructLayout({name: width for name, width in isa.FIELDS})
RTap = data.StructLayout({"offset": OFF_W, "space": 1, "mod": 1, "depth": 12, "mreg": 6,
                          "buf": BUF_W, "bmask": BUF_W})
WTap = data.StructLayout({"offset": OFF_W, "space": 1, "buf": BUF_W})


class WritePort(wiring.Signature):
    def __init__(self, addr_width, data_width):
        super().__init__({"addr": Out(addr_width), "data": Out(data_width), "en": Out(1)})


class DelayPort(wiring.Signature):
    """One delay-memory space: read address in one cycle, data the next; writes.
    `*_buf` are the stream-buffer addresses of the same accesses."""

    def __init__(self):
        super().__init__({
            "rd_addr": Out(OFF_W), "rd_buf": Out(BUF_W), "rd_en": Out(1), "rd_data": In(32),
            "wr_addr": Out(OFF_W), "wr_buf": Out(BUF_W), "wr_data": Out(32), "wr_en": Out(1),
        })


def encode_rtap(t):
    assert 0 <= t.offset < 1 << OFF_W and t.depth < 1 << 12 and t.mreg < 64
    assert 0 <= t.buf < 1 << BUF_W and 0 <= t.bmask < 1 << BUF_W
    return (t.offset | t.space << OFF_W | int(t.kind == isa.TAP_MOD) << (OFF_W + 1)
            | t.depth << (OFF_W + 2) | t.mreg << (OFF_W + 14) | t.buf << (OFF_W + 20)
            | t.bmask << (OFF_W + 20 + BUF_W))


def encode_wtap(t):
    assert 0 <= t.offset < 1 << OFF_W and 0 <= t.buf < 1 << BUF_W
    assert t.space != isa.SPACE_PSRAM or t.bmask == (1 << WB_BITS) - 1
    return t.offset | t.space << OFF_W | t.buf << (OFF_W + 1)


def program_images(prog, prog_depth):
    """Memory images of a compiled program: (instructions, coefficients, read taps,
    write taps, registers)."""
    instrs = [i.encode() for i in prog.instrs] + [0] * (prog_depth - len(prog.instrs))
    coefs = list(prog.coefs) + [0] * (isa.N_COEF - len(prog.coefs))
    rtaps, wtaps = [0] * isa.N_TAP, [0] * isa.N_TAP
    for i, t in enumerate(prog.taps):
        if t.kind == isa.TAP_WRITE:
            wtaps[i] = encode_wtap(t)
        else:
            rtaps[i] = encode_rtap(t)
    regs = [0] * isa.N_REG
    for r, bits in prog.reg_init.items():
        regs[r] = bits
    regs[isa.REG_ONE] = fp.float_to_bits(1.0)
    for g in range(isa.N_FADE):
        regs[isa.REG_FADE + 2 * g] = fp.float_to_bits(1.0)
    return instrs, coefs, rtaps, wtaps, regs


class Core(wiring.Component):

    def __init__(self, *, prog=None, io_bits=24, prog_depth=1024, ebr_words=4096):
        assert ebr_words & (ebr_words - 1) == 0     # zero_ebr's address wraps
        self.io_bits, self.prog_depth, self.ebr_words = io_bits, prog_depth, ebr_words
        self.prog = prog
        super().__init__({
            "start": In(1),
            "inputs": In(data.ArrayLayout(signed(io_bits), isa.N_IN)),
            "outputs": Out(data.ArrayLayout(signed(io_bits), isa.N_OUT)),
            "done": Out(1),
            "busy": Out(1),
            "n_instr": In(range(prog_depth + 1)),
            "psram_mask": In(OFF_W),
            "ebr_mask": In(OFF_W),
            "lfo_inc": In(data.ArrayLayout(32, isa.N_LFO)),
            "fade_target": In(data.ArrayLayout(25, isa.N_FADE)),
            "fade_rate": In(data.ArrayLayout(25, isa.N_FADE)),
            "fade_pos": Out(data.ArrayLayout(25, isa.N_FADE)),
            "prog_w": In(WritePort(10, isa.INSTR_BITS)),
            "coef_w": In(WritePort(8, 32)),
            "rtap_w": In(WritePort(8, RTap.size)),
            "wtap_w": In(WritePort(8, WTap.size)),
            "reg_w": In(WritePort(7, 32)),
            "lfo_w": In(WritePort(2, 32)),     # LFO phase (while idle)
            # Zero the block-RAM delay space, a word a clock, while high (with
            # the core stopped: the stream engine's clear, so a newly loaded
            # program starts from silence in both spaces).
            "zero_ebr": In(1),
            "pmem": Out(DelayPort()),
            "ptr": Out(OFF_W),          # delay-memory pointer (advances after each frame)
            "frame_cycles": Out(16),    # clocks the last frame took
        })

    def elaborate(self, platform):
        m = Module()
        W = self.io_bits
        prog = self.prog
        if prog is not None:
            instrs, coefs, rtaps, wtaps, regs = program_images(prog, self.prog_depth)
            lfo_phase0 = list(prog.lfo_phase)
        else:
            instrs, coefs = [0] * self.prog_depth, [0] * isa.N_COEF
            rtaps = wtaps = [0] * isa.N_TAP
            regs = program_images(isa.Program("", 48000, [], [], [], {}, [0] * 4, [0] * 4,
                                              {0: 16, 1: 16}, []), 1)[4]
            lfo_phase0 = [0] * isa.N_LFO

        # -- memories ----------------------------------------------------------
        m.submodules.prog_mem = prog_mem = Memory(shape=isa.INSTR_BITS, depth=self.prog_depth, init=instrs)
        m.submodules.coef_mem = coef_mem = Memory(shape=32, depth=isa.N_COEF, init=coefs)
        m.submodules.rtap_mem = rtap_mem = Memory(shape=RTap.size, depth=isa.N_TAP, init=rtaps)
        m.submodules.wtap_mem = wtap_mem = Memory(shape=WTap.size, depth=isa.N_TAP, init=wtaps)
        m.submodules.sin_rom = sin_rom = Memory(shape=23, depth=257, init=model_engine.SIN_QUARTER)
        m.submodules.ebr_mem = ebr_mem = Memory(shape=32, depth=self.ebr_words, init=[])
        m.submodules.reg_a = reg_a = Memory(shape=32, depth=isa.N_REG, init=regs)
        m.submodules.reg_b = reg_b = Memory(shape=32, depth=isa.N_REG, init=regs)

        prog_rp, prog_wp = prog_mem.read_port(), prog_mem.write_port()
        coef_rp, coef_wp = coef_mem.read_port(), coef_mem.write_port()
        rtap_rp, rtap_wp = rtap_mem.read_port(), rtap_mem.write_port()
        wtap_rp, wtap_wp = wtap_mem.read_port(), wtap_mem.write_port()
        sin_rp0, sin_rp1 = sin_rom.read_port(), sin_rom.read_port()
        ebr_rp, ebr_wp = ebr_mem.read_port(), ebr_mem.write_port()
        rega_wp, regb_wp = reg_a.write_port(), reg_b.write_port()
        rega_rp = reg_a.read_port(transparent_for=(rega_wp,))
        regb_rp = reg_b.read_port(transparent_for=(regb_wp,))

        for wp, port in ((prog_wp, self.prog_w), (coef_wp, self.coef_w),
                         (rtap_wp, self.rtap_w), (wtap_wp, self.wtap_w)):
            m.d.comb += [wp.addr.eq(port.addr), wp.data.eq(port.data), wp.en.eq(port.en)]

        # Register file write: prologue, stores, or the CPU (when idle), to both copies.
        reg_waddr, reg_wdata, reg_wen = Signal(7), Signal(32), Signal()
        for wp in (rega_wp, regb_wp):
            m.d.comb += [wp.addr.eq(reg_waddr), wp.data.eq(reg_wdata), wp.en.eq(reg_wen)]

        # -- state ------------------------------------------------------------
        ptr = self.ptr
        lfo_ph = [Signal(32, init=lfo_phase0[k], name=f"lfo_ph{k}") for k in range(isa.N_LFO)]
        noise = Signal(32, init=model_engine.NOISE_SEED)
        fade_p = [Signal(25, name=f"fade_p{g}") for g in range(isa.N_FADE)]
        # The accumulators: a small LUT RAM, two copies written together (one
        # for each read: stage 3 for stores and A = accumulator, stage 10 for
        # the accumulation). Flip-flops behind two 8-way multiplexers were
        # about 800 LUTs. Read-after-write is the same: written at a clock
        # edge, read (asynchronously) after it.
        m.submodules.acc_a = acc_a = Memory(shape=signed(ACC_W), depth=isa.N_ACC, init=[])
        m.submodules.acc_b = acc_b = Memory(shape=signed(ACC_W), depth=isa.N_ACC, init=[])
        acc_ra, acc_rb = acc_a.read_port(domain="comb"), acc_b.read_port(domain="comb")
        acc_wps = (acc_a.write_port(), acc_b.write_port())
        in_lat = Signal(data.ArrayLayout(signed(W), isa.N_IN))
        for g in range(isa.N_FADE):
            m.d.comb += self.fade_pos[g].eq(fade_p[g])

        pc = Signal(10)
        issue = Signal()                # an instruction enters stage 0 this cycle
        pro_step = Signal(range(N_PRO_STEPS + PRO_LAT + 1))
        pro_issue = Signal()
        count = Signal(range(PIPE + 8))
        epi_rd = Signal()               # OUT register read issued this cycle
        frame_count = Signal(16)
        m.d.sync += frame_count.eq(frame_count + 1)

        with m.FSM():
            with m.State("IDLE"):
                m.d.comb += reg_wen.eq(self.reg_w.en)
                m.d.comb += [reg_waddr.eq(self.reg_w.addr), reg_wdata.eq(self.reg_w.data)]
                with m.If(self.lfo_w.en):
                    with m.Switch(self.lfo_w.addr):
                        for k in range(isa.N_LFO):
                            with m.Case(k):
                                m.d.sync += lfo_ph[k].eq(self.lfo_w.data)
                with m.If(self.start):
                    m.d.sync += [in_lat.eq(self.inputs), pro_step.eq(0), frame_count.eq(1)]
                    m.next = "PRO"
            with m.State("PRO"):
                m.d.comb += self.busy.eq(1)
                m.d.comb += pro_issue.eq(pro_step < N_PRO_STEPS)
                m.d.sync += pro_step.eq(pro_step + 1)
                with m.If(pro_step == N_PRO_STEPS + PRO_LAT - 1):
                    m.d.sync += pc.eq(0)
                    with m.If(self.n_instr == 0):
                        m.d.sync += count.eq(0)
                        m.next = "DRAIN"
                    with m.Else():
                        m.next = "RUN"
            with m.State("RUN"):
                m.d.comb += [self.busy.eq(1), issue.eq(1)]
                m.d.sync += pc.eq(pc + 1)
                with m.If(pc == self.n_instr - 1):
                    m.d.sync += count.eq(0)
                    m.next = "DRAIN"
            with m.State("DRAIN"):
                m.d.comb += self.busy.eq(1)
                m.d.sync += count.eq(count + 1)
                with m.If(count == PIPE - 1):
                    m.d.sync += count.eq(0)
                    m.next = "EPI"
            with m.State("EPI"):
                m.d.comb += self.busy.eq(1)
                m.d.sync += count.eq(count + 1)
                m.d.comb += epi_rd.eq(count < isa.N_OUT)
                with m.If(count == isa.N_OUT + EPI_LAT):
                    # Advance to the next sample.
                    m.d.sync += [ptr.eq(ptr + 1), self.done.eq(1),
                                 self.frame_cycles.eq(frame_count + 1)]
                    for k in range(isa.N_LFO):
                        m.d.sync += lfo_ph[k].eq(lfo_ph[k] + self.lfo_inc[k])
                    x1 = noise ^ (noise << 13)[:32]
                    x2 = x1 ^ (x1 >> 17)
                    m.d.sync += noise.eq(x2 ^ (x2 << 5)[:32])
                    for g in range(isa.N_FADE):
                        # min(p + r, tgt) going up, max(p - r, tgt) going down
                        # (model.engine.fade_step): p + (tgt - p) clamped to
                        # +-r, four carry chains rather than seven.
                        p, tgt, r = fade_p[g], self.fade_target[g], self.fade_rate[g]
                        d = tgt - p
                        m.d.sync += p.eq(p + Mux(d > r, r, Mux(d < -r, -r, d)))
                    m.next = "IDLE"
        with m.If(self.done):
            m.d.sync += self.done.eq(0)

        # -- prologue: special registers ---------------------------------------
        # P0 choose the value (or sine table addresses), P1 latch table data,
        # P2 sign and difference, P3 interpolate, P4 magnitude and top bit,
        # P5 pack to f32 and write.
        Common = {"valid": 1, "sine": 1, "frac": 16, "x": signed(26), "e0": signed(7), "reg": 7}
        p1 = Signal(data.StructLayout({**Common, "neg0": 1, "neg1": 1}))
        p2 = Signal(data.StructLayout({**Common, "neg0": 1, "neg1": 1, "q0": 23, "q1": 23}))
        p3 = Signal(data.StructLayout({**Common, "a": signed(24), "diff": signed(25)}))
        p4 = Signal(data.StructLayout({"valid": 1, "x": signed(26), "e0": signed(7), "reg": 7}))
        p5 = Signal(data.StructLayout({"valid": 1, "reg": 7, "a": IntToF32A}))

        def quarter(j):
            """Quarter-wave table address and sign for full-table index j (0..1023)."""
            q, r = j[8:10], j[:8]
            return Mux(q[0], 256 - r, r), q[1]

        steps = [("in", k) for k in range(isa.N_IN)]
        steps += [("lfo", k, part) for k in range(isa.N_LFO) for part in range(4)]
        steps += [("noise",), ("one",)]
        steps += [("fade", g, side) for g in range(isa.N_FADE) for side in (0, 1)]
        assert len(steps) == N_PRO_STEPS
        # The step chooses its source (an input, an LFO's phase, a fade) and
        # the arithmetic below is done once for all steps: one step runs a
        # clock, and a copy per step was about 500 LUTs.
        K_IN, K_SIN, K_TRI, K_SAW, K_NOISE, K_ONE, K_FADE = range(7)
        kind, reg = Signal(3), Signal(7)
        src_in, src_ph, src_fade = Signal(signed(W)), Signal(32), Signal(25)
        cos, side = Signal(), Signal()
        with m.Switch(pro_step):
            for s, step in enumerate(steps):
                with m.Case(s):
                    if step[0] == "in":
                        m.d.comb += [kind.eq(K_IN), src_in.eq(in_lat[step[1]]),
                                     reg.eq(isa.REG_IN + step[1])]
                    elif step[0] == "lfo":
                        k, part = step[1], step[2]
                        m.d.comb += [kind.eq((K_SIN, K_SIN, K_TRI, K_SAW)[part]),
                                     src_ph.eq(lfo_ph[k]), cos.eq(part == 1),
                                     reg.eq(isa.REG_LFO + 4 * k + part)]
                    elif step[0] == "noise":
                        m.d.comb += [kind.eq(K_NOISE), reg.eq(isa.REG_NOISE)]
                    elif step[0] == "one":
                        m.d.comb += [kind.eq(K_ONE), reg.eq(isa.REG_ONE)]
                    else:
                        g, s_side = step[1], step[2]
                        m.d.comb += [kind.eq(K_FADE), src_fade.eq(fade_p[g]), side.eq(s_side),
                                     reg.eq(isa.REG_FADE + 2 * g + s_side)]
        # sine (cosine: a quarter turn on): table addresses for the
        # interpolation's two points, and the fraction between them
        phs = Mux(cos, (src_ph + (1 << 30))[:32], src_ph)
        i = phs[22:32]
        a0, n0 = quarter(i)
        a1, n1 = quarter((i + 1)[:10])
        m.d.comb += [sin_rp0.addr.eq(a0), sin_rp1.addr.eq(a1)]
        u = (src_ph + (1 << 30))[:32]
        d = Mux(u >= (1 << 31), u - (1 << 31), (1 << 31) - u)
        m.d.sync += [p1.reg.eq(reg), p1.sine.eq(kind == K_SIN), p1.neg0.eq(n0), p1.neg1.eq(n1),
                     p1.frac.eq(phs[6:22])]
        with m.Switch(kind):
            with m.Case(K_IN):
                m.d.sync += [p1.x.eq(src_in), p1.e0.eq(-(W - 1))]
            with m.Case(K_SIN):
                m.d.sync += p1.e0.eq(-23)
            with m.Case(K_TRI):
                m.d.sync += [p1.x.eq((1 << 23) - (d >> 7)), p1.e0.eq(-23)]
            with m.Case(K_SAW):
                m.d.sync += [p1.x.eq(src_ph[8:32].as_signed()), p1.e0.eq(-23)]
            with m.Case(K_NOISE):
                m.d.sync += [p1.x.eq(noise[8:32].as_signed()), p1.e0.eq(-23)]
            with m.Case(K_ONE):
                m.d.sync += [p1.x.eq(1), p1.e0.eq(0)]
            with m.Case(K_FADE):
                m.d.sync += [p1.x.eq(Mux(side, src_fade, (1 << 24) - src_fade)), p1.e0.eq(-24)]
        m.d.sync += p1.valid.eq(pro_issue)

        def common(dst, src):
            return [getattr(dst, f).eq(getattr(src, f)) for f in Common]
        m.d.sync += common(p2, p1) + [p2.neg0.eq(p1.neg0), p2.neg1.eq(p1.neg1),
                                      p2.q0.eq(sin_rp0.data), p2.q1.eq(sin_rp1.data)]
        a = Mux(p2.neg0, -p2.q0, p2.q0)
        b = Mux(p2.neg1, -p2.q1, p2.q1)
        m.d.sync += common(p3, p2) + [p3.a.eq(a), p3.diff.eq(b - a)]
        interp = p3.a + ((p3.diff * p3.frac) >> 16)
        m.d.sync += [p4.valid.eq(p3.valid), p4.x.eq(Mux(p3.sine, interp, p3.x)),
                     p4.e0.eq(p3.e0), p4.reg.eq(p3.reg)]
        m.d.sync += [p5.valid.eq(p4.valid), p5.reg.eq(p4.reg)] + assign(p5.a, int_to_f32_a(p4.x, p4.e0))
        with m.If(p5.valid):
            m.d.comb += [reg_wen.eq(1), reg_waddr.eq(p5.reg), reg_wdata.eq(int_to_f32_b(p5.a))]

        # -- stage 0/1: fetch, decode ------------------------------------------
        s1v = Signal()
        m.d.comb += prog_rp.addr.eq(pc)
        m.d.sync += s1v.eq(issue)
        ins1 = Signal(Instr)
        m.d.comb += ins1.eq(prog_rp.data)
        m.d.comb += [
            rega_rp.addr.eq(Mux(epi_rd, isa.REG_OUT + count[:2], ins1.aidx[:7])),
            regb_rp.addr.eq(Mux(ins1.bsel >= isa.B_CFADE,
                                isa.REG_FADE + (ins1.bsel - isa.B_CFADE)[:2], ins1.bidx[:7])),
            coef_rp.addr.eq(ins1.bidx),
            rtap_rp.addr.eq(ins1.aidx),
            wtap_rp.addr.eq(ins1.sidx),
        ]
        s2v, ins2 = Signal(), Signal(Instr)
        m.d.sync += [s2v.eq(s1v), ins2.eq(ins1)]

        # -- stage 2: tap addresses, modulation -> fixed point --------------------
        rt2 = Signal(RTap)
        wt2 = Signal(WTap)
        m.d.comb += [rt2.eq(rtap_rp.data), wt2.eq(wtap_rp.data)]
        masks = Array([self.psram_mask, self.ebr_mask])

        Mid = {"ra": 32, "rb": 32, "cf": 32, "rt": RTap, "addr0": OFF_W, "waddr": OFF_W, "wspace": 1,
               "wbuf": BUF_W, "mod_n": signed(14), "mod_f": 16}
        s3v, ins3 = Signal(), Signal(Instr)
        s3 = Signal(data.StructLayout(Mid))
        m.d.sync += [
            s3v.eq(s2v), ins3.eq(ins2),
            s3.ra.eq(rega_rp.data), s3.rb.eq(regb_rp.data), s3.cf.eq(coef_rp.data), s3.rt.eq(rt2),
            s3.addr0.eq(ptr + rt2.offset),
            s3.waddr.eq((ptr + wt2.offset) & masks[wt2.space]), s3.wspace.eq(wt2.space),
            s3.wbuf.eq(wt2.buf | (ptr[:WB_BITS] + wt2.offset[:WB_BITS])[:WB_BITS]),
        ]

        def mid(dst, src, skip=()):
            return [getattr(dst, f).eq(getattr(src, f)) for f in Mid if f not in skip]

        # The modulation register (fixed point, samples * 2^16), clamped to
        # +-depth: here rather than in stage 2, where both come straight from
        # block RAMs (each about 6 ns to its output), the core's slowest path.
        mv = s3.rb.as_signed()
        lim = Cat(C(0, 16), s3.rt.depth)                 # depth << 16
        mq = Mux(mv > lim, lim, Mux(mv < -lim, -lim, mv))

        # -- stage 3: |accumulator|, fixed-point store value; c x w partials ------
        acc_sel = Mux(ins3.asel == isa.A_ACC, ins3.aidx[:3], ins3.sacc)
        m.d.comb += acc_ra.addr.eq(acc_sel)
        acc_v = acc_ra.data
        fix33 = acc_v[fp.MOD_SHIFT:]                     # floor(acc / 2^24), 33 bits signed
        fix = Mux(fix33[32] == fix33[31], fix33[:32], Mux(fix33[32], 1 << 31, (1 << 31) - 1))
        cf3, wv3 = decode(s3.cf), decode(s3.rb)
        cm, wm = cf3["mant"], wv3["mant"]

        s4v, ins4 = Signal(), Signal(Instr)
        s4 = Signal(data.StructLayout({
            **Mid, "fix": 32, "acc_neg": 1, "acc_mag": ACC_W - 1,
            "cw_ll": 34, "cw_lh": 24, "cw_hl": 24, "cw_hh": 14, "cw_sign": 1, "cw_exp": signed(11),
            "cw_zero": 1}))
        m.d.sync += [s4v.eq(s3v), ins4.eq(ins3)] + mid(s4, s3, skip=("mod_n", "mod_f")) + [
            s4.mod_n.eq(mq >> 16), s4.mod_f.eq(mq[:16]),
            s4.fix.eq(fix),
            s4.acc_neg.eq(acc_v < 0),
            s4.acc_mag.eq(Mux(acc_v < 0, -acc_v, acc_v)[:ACC_W - 1]),
            s4.cw_ll.eq(cm[:17] * wm[:17]), s4.cw_lh.eq(cm[:17] * wm[17:]),
            s4.cw_hl.eq(cm[17:] * wm[:17]), s4.cw_hh.eq(cm[17:] * wm[17:]),
            s4.cw_sign.eq(cf3["sign"] ^ wv3["sign"]), s4.cw_exp.eq(cf3["exp"] + wv3["exp"]),
            s4.cw_zero.eq(cf3["zero"] | wv3["zero"]),
        ]

        # -- stage 4: leading zeros; c x w sum -------------------------------------
        acc_any, acc_k = msb(s4.acc_mag)

        s5v, ins5 = Signal(), Signal(Instr)
        s5 = Signal(data.StructLayout({
            **Mid, "fix": 32, "acc_neg": 1, "acc_mag": ACC_W - 1, "acc_k": 6, "acc_zero": 1,
            "cw_p": 48, "cw_sign": 1, "cw_exp": signed(11), "cw_zero": 1}))
        m.d.sync += [s5v.eq(s4v), ins5.eq(ins4)] + mid(s5, s4) + [
            s5.fix.eq(s4.fix),
            s5.acc_neg.eq(s4.acc_neg), s5.acc_mag.eq(s4.acc_mag), s5.acc_k.eq(acc_k),
            s5.acc_zero.eq(~acc_any),
            # the low and high partials don't overlap: one add
            s5.cw_p.eq(Cat(s4.cw_ll, s4.cw_hh) + ((s4.cw_lh + s4.cw_hl) << 17)),
            s5.cw_sign.eq(s4.cw_sign), s5.cw_exp.eq(s4.cw_exp), s5.cw_zero.eq(s4.cw_zero),
        ]

        # -- stage 5: read address; accumulator -> f32; weights; c x w round ------
        bsel5 = ins5.bsel
        is_interp = (bsel5 == isa.B_INTERP0) | (bsel5 == isa.B_INTERP1)
        interp1 = bsel5 == isa.B_INTERP1
        rd_addr = Mux(is_interp, s5.addr0 - s5.mod_n - interp1, s5.addr0)
        rd_addr = (rd_addr & masks[s5.rt.space])[:OFF_W]
        # The buffer address only needs the low bits (a shorter carry chain).
        rd_low = Mux(is_interp, s5.addr0[:BUF_W] - s5.mod_n[:BUF_W] - interp1, s5.addr0[:BUF_W])
        mem_rd = s5v & (ins5.op != isa.OP_NOP) & (ins5.asel == isa.A_MEM)
        m.d.comb += [
            ebr_rp.addr.eq(rd_addr),
            self.pmem.rd_addr.eq(rd_addr),
            self.pmem.rd_buf.eq(s5.rt.buf | (rd_low[:BUF_W] & s5.rt.bmask)),
            self.pmem.rd_en.eq(mem_rd & (s5.rt.space == isa.SPACE_PSRAM)),
        ]
        # accumulator -> f32 (round the magnitude to 24 bits, ties away from zero)
        k = s5.acc_k
        big = k > 23
        t = (s5.acc_mag >> (k - 24)[:5])[:25]
        r_big = (t + 1)[1:26]
        ovf = big & r_big[24]
        r_small = (s5.acc_mag << (23 - k)[:5])[:24]
        mant = Mux(big, Mux(ovf, C(1 << 23, 24), r_big[:24]), r_small)
        e_acc = k - 48 + ovf                              # unbiased
        nf_bits = Mux(s5.acc_zero, 0, Cat(mant[:23], (e_acc + 127)[:8], s5.acc_neg))
        # interpolation weight: (65536 - f) or f, times 2^-16, normalised
        wi = Mux(bsel5 == isa.B_INTERP1, s5.mod_f, 65536 - s5.mod_f)[:17]
        wi_any, wi_k = msb(wi)
        # coefficient x weight, rounded to 24 bits (fp.scale)
        cw_top = s5.cw_p[47]
        cw_t = Mux(cw_top, s5.cw_p[23:48], s5.cw_p[22:47])    # mantissa + guard bit
        cw_r = (cw_t + 1)[1:26]
        cw_ovf = cw_r[24]
        cw_e = s5.cw_exp + cw_top + cw_ovf
        cw_sat = ~s5.cw_zero & (cw_e > 128)

        s6v, ins6 = Signal(), Signal(Instr)
        s6 = Signal(data.StructLayout({
            "ra": 32, "rb": 32, "cf": 32, "space": 1, "waddr": OFF_W, "wspace": 1, "wbuf": BUF_W,
            "nf": 32, "fix": 32, "cw": Decoded, "wi": Decoded}))
        m.d.sync += [
            s6v.eq(s5v), ins6.eq(ins5),
            s6.ra.eq(s5.ra), s6.rb.eq(s5.rb), s6.cf.eq(s5.cf), s6.space.eq(s5.rt.space),
            s6.waddr.eq(s5.waddr), s6.wspace.eq(s5.wspace), s6.wbuf.eq(s5.wbuf),
            s6.nf.eq(nf_bits), s6.fix.eq(s5.fix),
            s6.wi.sign.eq(0), s6.wi.zero.eq(~wi_any), s6.wi.exp.eq(wi_k - 16),
            s6.wi.mant.eq((wi << (23 - wi_k)[:5])[:24]),
            s6.cw.sign.eq(s5.cw_sign),
            s6.cw.mant.eq(Mux(cw_sat, (1 << 24) - 1, Mux(cw_ovf, C(1 << 23, 24), cw_r[:24]))),
            s6.cw.exp.eq(Mux(cw_e > 128, 128, cw_e)),
            s6.cw.zero.eq(s5.cw_zero | (cw_e < -126)),
        ]

        # -- stage 6: operands, stores -------------------------------------------
        mem_data = Mux(s6.space == isa.SPACE_EBR, ebr_rp.data, self.pmem.rd_data)
        A = Signal(Decoded)
        B = Signal(Decoded)
        with m.Switch(ins6.asel):
            with m.Case(isa.A_MEM):
                m.d.comb += assign(A, decode(mem_data))
            with m.Case(isa.A_REG):
                m.d.comb += assign(A, decode(s6.ra))
            with m.Default():
                m.d.comb += assign(A, decode(s6.nf))
        with m.Switch(ins6.bsel):
            with m.Case(isa.B_COEF):
                m.d.comb += assign(B, decode(s6.cf))
            with m.Case(isa.B_REG):
                m.d.comb += assign(B, decode(s6.rb))
            with m.Case(isa.B_INTERP0, isa.B_INTERP1):
                m.d.comb += B.eq(s6.wi)
            with m.Default():
                m.d.comb += B.eq(s6.cw)

        readonly = Signal()
        m.d.comb += readonly.eq(Cat(*[ins6.sidx[:7] == r for r in sorted(isa.REG_READONLY)]).any())
        with m.If(s6v & ins6.st):
            with m.If(ins6.ssel != isa.S_MEM):
                with m.If(~readonly):
                    m.d.comb += [reg_wen.eq(1), reg_waddr.eq(ins6.sidx[:7]),
                                 reg_wdata.eq(Mux(ins6.ssel == isa.S_FIX, s6.fix, s6.nf))]
            with m.Else():
                m.d.comb += [
                    ebr_wp.addr.eq(s6.waddr), ebr_wp.data.eq(s6.nf),
                    ebr_wp.en.eq(s6.wspace == isa.SPACE_EBR),
                    self.pmem.wr_addr.eq(s6.waddr), self.pmem.wr_buf.eq(s6.wbuf),
                    self.pmem.wr_data.eq(s6.nf),
                    self.pmem.wr_en.eq(s6.wspace == isa.SPACE_PSRAM),
                ]
        zaddr = Signal(range(self.ebr_words))
        with m.If(self.zero_ebr):
            m.d.comb += [ebr_wp.addr.eq(zaddr), ebr_wp.data.eq(0), ebr_wp.en.eq(1)]
            m.d.sync += zaddr.eq(zaddr + 1)

        # -- stages 7..10: multiply, align, accumulate ---------------------------
        s7 = Signal(data.StructLayout({"valid": 1, "op": 3, "d": 3, "ma": 24, "mb": 24,
                                       "s": signed(11), "sign": 1, "zero": 1}))
        m.d.sync += [
            s7.valid.eq(s6v), s7.op.eq(ins6.op), s7.d.eq(ins6.d), s7.ma.eq(A.mant), s7.mb.eq(B.mant),
            s7.s.eq(A.exp + B.exp + 2), s7.sign.eq(A.sign ^ B.sign), s7.zero.eq(A.zero | B.zero),
        ]
        s8 = Signal(data.StructLayout({"valid": 1, "op": 3, "d": 3, "ll": 34, "lh": 24, "hl": 24,
                                       "hh": 14, "s": signed(11), "sign": 1, "zero": 1}))
        m.d.sync += [
            s8.valid.eq(s7.valid), s8.op.eq(s7.op), s8.d.eq(s7.d), s8.s.eq(s7.s),
            s8.sign.eq(s7.sign), s8.zero.eq(s7.zero),
            s8.ll.eq(s7.ma[:17] * s7.mb[:17]), s8.lh.eq(s7.ma[:17] * s7.mb[17:]),
            s8.hl.eq(s7.ma[17:] * s7.mb[:17]), s8.hh.eq(s7.ma[17:] * s7.mb[17:]),
        ]
        s9 = Signal(data.StructLayout({"valid": 1, "op": 3, "d": 3, "p": 48, "s": signed(11),
                                       "sign": 1, "zero": 1}))
        m.d.sync += [
            s9.valid.eq(s8.valid), s9.op.eq(s8.op), s9.d.eq(s8.d), s9.s.eq(s8.s),
            s9.sign.eq(s8.sign), s9.zero.eq(s8.zero),
            s9.p.eq(Cat(s8.ll, s8.hh) + ((s8.lh + s8.hl) << 17)),
        ]
        rsh = Mux(s9.s < -53, 63, 10 - s9.s)[:6]
        shifted = (Cat(C(0, 10), s9.p) >> rsh)[:58]
        over = (s9.s > 10) | shifted[56] | shifted[57]          # beyond ACC_MAX = 2^56 - 1
        mag = Mux(s9.zero, 0, Mux(over, fp.ACC_MAX, shifted[:56]))
        s10 = Signal(data.StructLayout({"valid": 1, "op": 3, "d": 3, "mag": ACC_W - 1, "sign": 1}))
        m.d.sync += [s10.valid.eq(s9.valid), s10.op.eq(s9.op), s10.d.eq(s9.d), s10.mag.eq(mag),
                     s10.sign.eq(s9.sign)]
        q = Mux(s10.sign, -s10.mag, s10.mag)
        m.d.comb += acc_rb.addr.eq(s10.d)
        acc_d = acc_rb.data
        total = Signal(signed(ACC_W + 1))
        m.d.comb += total.eq(acc_d + q)
        pos_ovf = ~total[ACC_W] & total[ACC_W - 1]
        neg_ovf = total[ACC_W] & (~total[ACC_W - 1] | (total[:ACC_W - 1] == 0))
        sat = Mux(pos_ovf, fp.ACC_MAX, Mux(neg_ovf, -fp.ACC_MAX, total))
        for wp in acc_wps:
            m.d.comb += [
                wp.addr.eq(s10.d),
                wp.data.eq(Mux(s10.op == isa.OP_MUL, q, sat)),
                wp.en.eq(s10.valid & ((s10.op == isa.OP_MUL) | (s10.op == isa.OP_MAC))),
            ]

        # -- epilogue: OUT registers -> CODEC ------------------------------------
        e1 = Signal(data.StructLayout({"valid": 1, "k": 2}))
        # (the OUT registers are fixed point, value x 2^24: a shift, not a
        # float conversion)
        e2 = Signal(data.StructLayout({"valid": 1, "k": 2, "bits": 32}))
        e3 = Signal(data.StructLayout({"valid": 1, "k": 2, "v": signed(W)}))
        m.d.sync += [e1.valid.eq(epi_rd), e1.k.eq(count[:2]),
                     e2.valid.eq(e1.valid), e2.k.eq(e1.k), e2.bits.eq(rega_rp.data),
                     e3.valid.eq(e2.valid), e3.k.eq(e2.k), e3.v.eq(fix_to_out(e2.bits, W))]
        with m.If(e3.valid):
            m.d.sync += self.outputs[e3.k].eq(e3.v)

        return m
