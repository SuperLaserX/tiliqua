"""The engine against the program interpreter, in Amaranth's simulator.

    python src/top/NAM/tests/test_engine.py            (from gateware/)

A small network in the A2 shape (8 channels, four layers of short kernels and
dilations, two of them with their history in PSRAM, bursts of one frame) so a
few hundred samples exercise every tap, both ring kinds, the z FIFO, the head
and the gains. A Python model of the PSRAM serves the engine's transfers. Each
sample's output must equal the interpreter's, and the interpreter is checked
against the fixed-point model in `test_program.py`.
"""

import os
import sys

import numpy as np
from amaranth.sim import Simulator

HERE = os.path.dirname(os.path.realpath(__file__))
sys.path.insert(0, os.path.join(HERE, ".."))

from model import a2, fixed, program  # noqa: E402
from nam.engine import Engine, encode_pos, encode_ring  # noqa: E402


def small_network(rng, channels=8, kernels=(3, 3, 4, 3), dilations=(1, 2, 3, 7)):
    """Random weights in A2's dataclasses, scaled like a real profile's."""
    c = channels
    layers = []
    for k, d in zip(kernels, dilations):
        layers.append(a2.Layer(
            kernel=k, dilation=d,
            conv_w=rng.normal(0, 0.3, (k, c, c)),
            conv_b=rng.normal(0, 0.2, c),
            mixin=rng.normal(0, 0.5, c),
            l1x1_w=rng.normal(0, 0.3, (c, c)),
            l1x1_b=rng.normal(0, 0.2, c)))
    return a2.A2Weights(
        channels=c, rechannel=rng.normal(0, 0.5, c), layers=layers,
        head_w=rng.normal(0, 0.2, (a2.HEAD_KERNEL, c)), head_b=0.1, head_scale=0.05)


def pack_row(row):
    v = 0
    for col, w in enumerate(row):
        v |= (int(w) & 0x3FFFF) << (18 * col)
    return v


A2_PSRAM_LAYERS = (5, 6, 12, 13, 21, 22)


def run(n_samples=60, seed=3, verbose=True, full=False):
    rng = np.random.default_rng(seed)
    if full:
        # The real A2-Full program, for its clocks per sample (a few samples: the
        # long delays aren't exercised, the schedule is).
        core = os.path.join(HERE, "..", "NeuralAmpModelerCore")
        w = a2.load_nam(os.path.join(core, "example_models", "A2.nam"))[-1]
        psram_layers = A2_PSRAM_LAYERS
        burst = 4
    else:
        w = small_network(rng)
        psram_layers = (2, 3)
        burst = 1
    fmt = fixed.Formats(z_split=6, psram_layers=psram_layers, psram_bits=16, psram_frac=11)
    q = fixed.quantise(w, fmt)
    prog = program.build(q, psram_layers=psram_layers, burst_frames=burst, gain_in_db=6.0, gain_out_db=-3.0)
    itrace = []
    interp = program.Interpreter(prog, trace=itrace)
    adc = np.clip(rng.normal(0, 0.15, n_samples) * 32768, -32768, 32767).astype(np.int64)
    expect = [interp.sample(int(a)) for a in adc]
    htrace = []
    ops = []

    if full:
        eng = Engine(host_domain="sync")
    else:
        eng = Engine(hist_words=1024, sbuf_r_words=256, sbuf_w_words=64, segments=64, host_domain="sync")
    psram = {}
    results = []
    clocks = []
    served = {"reads": 0, "writes": 0}

    async def psram_model(ctx):
        """The PSRAM master's part: each request, in order, moves its burst between the
        PSRAM and the stream buffer at `buf` (a word a clock), then pulses xfer_done."""
        ctx.set(eng.req.ready, 1)
        while True:
            clk, rst, rv, rw, ra, rn, rb = await ctx.tick().sample(
                eng.req.valid, eng.req.payload.write, eng.req.payload.addr, eng.req.payload.words,
                eng.req.payload.buf)
            if not rv:
                continue
            ctx.set(eng.req.ready, 0)
            if rw:
                ctx.set(eng.sbw_addr, rb)
                for i in range(rn):
                    await ctx.tick()
                    psram[ra + i] = ctx.get(eng.sbw_data)
                    ctx.set(eng.sbw_addr, rb + i + 1)
                served["writes"] += 1
            else:
                for i in range(rn):
                    ctx.set(eng.sbr_w.addr, rb + i)
                    ctx.set(eng.sbr_w.data, psram.get(ra + i, 0))
                    ctx.set(eng.sbr_w.en, 1)
                    await ctx.tick()
                ctx.set(eng.sbr_w.en, 0)
                served["reads"] += 1
            ctx.set(eng.xfer_done, 1)
            await ctx.tick()
            ctx.set(eng.xfer_done, 0)
            ctx.set(eng.req.ready, 1)

    async def main(ctx):
        async def write(port, addr, value):
            ctx.set(port.addr, addr)
            ctx.set(port.data, value)
            ctx.set(port.en, 1)
            await ctx.tick()
            ctx.set(port.en, 0)

        for r in range(prog.meta["rows"]):
            await write(eng.wmem_w, r, pack_row(prog.wmem[r]))
        for i, v in enumerate(prog.aux[:program.AUX_HEAD_W + 16 * 8]):
            await write(eng.aux_w, i, int(v) & 0x3FFFF)
        for i, v in enumerate(prog.words()):
            await write(eng.prog_w, i, v)
        for i, r in enumerate(prog.rings):
            await write(eng.ring_w, i, encode_ring(r))
        for s in prog.streams:
            await write(eng.pos_w, s.pos_index, encode_pos(s))
        ctx.set(eng.n_rings_used, len(prog.rings))
        for name in ("wpf_log2", "burst_log2", "ring_log2"):
            ctx.set(getattr(eng, name), prog.meta[name])
        ctx.set(eng.n_segments, len(prog.segments))
        ctx.set(eng.late_after, 3)
        await ctx.tick().repeat(4)

        async def pulse(sig):
            ctx.set(sig, 1)
            await ctx.tick()
            ctx.set(sig, 0)
            while ctx.get(eng.busy):
                await ctx.tick()

        await pulse(eng.clear)
        await pulse(eng.prefill)
        n_read_streams = sum(1 for s in prog.streams if not s.write)
        for _ in range(4000):
            if served["reads"] >= 2 * n_read_streams:
                break
            await ctx.tick()
        assert served["reads"] == 2 * n_read_streams, served

        for a in adc:
            ctx.set(eng.adc, int(a))
            ctx.set(eng.start, 1)
            await ctx.tick()
            ctx.set(eng.start, 0)
            for _ in range(20000):
                if ctx.get(eng.done):
                    break
                await ctx.tick()
            else:
                raise AssertionError("no done")
            await ctx.tick()
            results.append(ctx.get(eng.out))
            clocks.append(ctx.get(eng.clocks))
        await ctx.tick().repeat(50)
        results.append(("late", ctx.get(eng.late)))

    async def tracer(ctx):
        dw, do = eng.dbg_write, eng.dbg_op
        names = ("ring", "zq", "h", "x", "y", "out")
        while True:
            clk, rst, v, dest, haddr, saddr, half, val, ov, src, row, bank, clear, act, w0 = \
                await ctx.tick().sample(dw.v, dw.dest, dw.haddr, dw.saddr, dw.half, dw.val,
                                        do.v, do.src, do.row, do.bank, do.clear, do.act, do.w0)
            if ov:
                ops.append((src, row, bank, clear, act, w0))
            if not v:
                continue
            if dest == program.DST_RING:
                if saddr or half or True:
                    # Which kind of ring this was isn't in the record: the interpreter's
                    # trace tells, by position.
                    htrace.append(("ring", haddr, saddr, half, val))
            else:
                htrace.append((names[dest], val))

    sim = Simulator(eng)
    sim.add_clock(1e-8)
    sim.add_testbench(main)
    sim.add_testbench(psram_model, background=True)
    sim.add_testbench(tracer, background=True)
    sim.run()

    # The first op (activation, weight of column 0, bank, clear) that differs.
    for n, (io, ho) in enumerate(zip(interp.ops, ops)):
        hv = (ho[4], ho[5], ho[2], ho[3])
        if io != hv:
            print(f"first differing op #{n}: interpreter {io}, engine {hv} (src {ho[0]} row {ho[1]})")
            print("  interpreter before:", interp.ops[max(0, n - 6):n])
            print("  engine before     :", [(o[4], o[5], o[2], o[3]) for o in ops[max(0, n - 6):n]])
            break
    else:
        print(f"{min(len(interp.ops), len(ops))} ops agree ({len(interp.ops)} vs {len(ops)})")
    # The first write that differs from the interpreter's.
    for n, (ie, he) in enumerate(zip(itrace, htrace)):
        if ie[0] == "hist":
            ok = he[0] == "ring" and he[1] == ie[1] and he[4] == ie[2]
        elif ie[0] == "pring":
            ok = he[0] == "ring" and he[4] == ie[3]
        else:
            ok = he[0] == ie[0] and he[1] == ie[1]
        if not ok:
            print(f"first differing write #{n}: interpreter {ie}, engine {he}")
            print("  before it:", itrace[max(0, n - 4):n])
            print("  engine   :", htrace[max(0, n - 4):n])
            print("  first ops:", ops[:12])
            break
    else:
        print(f"{min(len(itrace), len(htrace))} writes agree ({len(itrace)} vs {len(htrace)})")

    late = results.pop()[1]
    got = np.array(results)
    exp = np.array(expect)
    same = np.array_equal(got, exp)
    if verbose:
        print(f"{len(prog.segments)} segments, {prog.meta['rows']} rows, {len(prog.streams)} streams; "
              f"{n_samples} samples, clocks/sample {min(clocks)}..{max(clocks)}, "
              f"transfers {served}, late={late}: {'MATCH' if same else 'MISMATCH'}")
        if not same:
            bad = np.nonzero(got != exp)[0]
            print("  first differences at", bad[:10])
            print("  expected", exp[bad[:8]])
            print("  got     ", got[bad[:8]])
    return same and not late


def test_engine_matches_interpreter():
    assert run(n_samples=60, verbose=False)


if __name__ == "__main__":
    if "--full" in sys.argv:
        sys.exit(0 if run(n_samples=5, full=True) else 1)
    sys.exit(0 if run() else 1)
