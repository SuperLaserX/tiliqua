"""The modulation stages against the model, sample for sample."""

import random

import pytest
from amaranth.sim import Simulator

from model import modulation as model
from model.modulation import FULL, LOOP_FREE, LOOP_GATED, LOOP_OFF, ONE, Modulation

from .mod import ModEngine


def rate(samples):
    return (-(-(1 << 32) // samples)) & 0xFFFFFFFF


def run(writes, adc_of, n, routing=0, frames=(1, 1), on_sample=None):
    """Drives the gateware and the model with the same writes and inputs, and compares every
    source and result after each of `n` samples. Returns the longest run in clocks."""
    dut = ModEngine()
    m = Modulation()
    m.routing(routing)
    m.frames_m1 = [frames[0] - 1, frames[1] - 1]
    sim = Simulator(dut)
    sim.add_clock(1 / 60e6)
    longest = [0]

    async def write(ctx, addr, data):
        ctx.set(dut.wr_en, 1)
        ctx.set(dut.wr_addr, addr)
        ctx.set(dut.wr_data, data & 0xFFFFFFFF)
        await ctx.tick()
        ctx.set(dut.wr_en, 0)
        m.write(addr, data & 0xFFFFFFFF)

    async def bench(ctx):
        ctx.set(dut.patched, (routing >> 20) & 3)
        for i in range(2):
            ctx.set(dut.vca[i], (routing >> (16 + 2 * i)) & 3)
            ctx.set(dut.frames_m1[i], frames[i] - 1)
        for addr, data in writes:
            await write(ctx, addr, data)
        for s in range(n):
            if on_sample:
                for addr, data in on_sample(s):
                    await write(ctx, addr, data)
            adc = adc_of(s)
            for i in range(4):
                ctx.set(dut.adc[i], adc[i])
            m.step(adc)
            ctx.set(dut.start, 1)
            clocks = 0
            await ctx.tick()
            ctx.set(dut.start, 0)
            while not ctx.get(dut.done):
                await ctx.tick()
                clocks += 1
            await ctx.tick()
            longest[0] = max(longest[0], clocks)

            env, lfo, mat = dut.envelopes, dut.lfos, dut.matrix
            for e in range(2):
                assert ctx.get(env.level[e]) == m.envs[e].level, f"sample {s}: env {e} level"
                assert ctx.get(env.stage[e]) == m.envs[e].stage, f"sample {s}: env {e} stage"
                assert ctx.get(env.out[e]) == m.envs[e].out, f"sample {s}: env {e} out"
            for k in range(3):
                assert ctx.get(lfo.phase[k]) == m.lfos[k].phase, f"sample {s}: lfo {k} phase"
                assert ctx.get(lfo.out[k]) == m.lfos[k].out, f"sample {s}: lfo {k} out"
            for i in range(2):
                assert ctx.get(mat.inc[i]) == m.inc[i], f"sample {s}: inc {i}"
                assert ctx.get(mat.pos[i]) == m.pos[i], f"sample {s}: pos {i}"
                assert ctx.get(mat.shift[i]) == m.shift[i], f"sample {s}: shift {i}"
                assert ctx.get(mat.level[i]) == m.level[i], f"sample {s}: level {i}"
            assert ctx.get(mat.balance) == m.balance, f"sample {s}: balance"
            assert ctx.get(dut.gates) == m.gates, f"sample {s}: gates"
            for i in range(2):
                assert ctx.get(mat.sources[1 + i]) == m.sources[1 + i], f"sample {s}: cv {i}"

    sim.add_testbench(bench)
    sim.run()
    return longest[0]


def env_writes(e=0, delay=5, attack=9, hold=3, decay=11, sustain=ONE // 2, release=13, mask=1, loop=LOOP_OFF,
               curves=(0, 0, 0)):
    at = e * 8
    return [
        (at + 0, mask | loop << 2),
        (at + model.DELAY, rate(delay)),
        (at + model.ATTACK, rate(attack)),
        (at + model.HOLD, rate(hold)),
        (at + model.DECAY, rate(decay)),
        (at + model.SUSTAIN, sustain),
        (at + model.RELEASE, rate(release)),
        (at + 7, sum((c & 0x3FF) << (10 * i) for i, c in enumerate(curves))),
    ]


def lfo_writes(k=0, r=1 << 26, offset=0, kind=model.SINE, uni=0, sync=0, amp=FULL):
    return [(0x10 + k * 4, r), (0x11 + k * 4, offset | kind << 16 | uni << 19 | sync << 20), (0x12 + k * 4, amp)]


def slot(i, src, dest, amount):
    return (0x20 + i, (amount & 0x3FFFF) | src << 18 | dest << 21)


def gate_at(ch, *spans):
    def adc(s):
        out = [0, 0, 0, 0]
        if any(a <= s < b for a, b in spans):
            out[2 + ch] = 20000
        return out
    return adc


def test_an_envelope_through_its_stages():
    run(env_writes(), gate_at(0, (3, 60)), 120)


def test_both_envelopes_on_their_own_gates():
    writes = env_writes(0) + env_writes(1, mask=2, attack=20, curves=(100, -100, 50))

    def adc(s):
        return [0, 0, 20000 if 2 <= s < 40 else 0, 20000 if 10 <= s < 70 else 0]
    run(writes, adc, 110)


@pytest.mark.parametrize("curves", [(256, 256, 256), (-256, -256, -256), (77, -13, 200)])
def test_curves_match(curves):
    run(env_writes(curves=curves, attack=30, decay=30, release=30), gate_at(0, (1, 80)), 130)


def test_a_retrigger_and_a_short_gate():
    run(env_writes(attack=40, release=40), gate_at(0, (1, 20), (30, 34), (40, 100)), 150)


def test_gated_loop():
    run(env_writes(loop=LOOP_GATED, delay=2, attack=4, hold=2, decay=4, release=4), gate_at(0, (3, 90)), 130)


def test_free_loop_with_a_restart():
    run(env_writes(loop=LOOP_FREE, delay=2, attack=4, hold=2, decay=4, release=4), gate_at(0, (41, 44)), 90)


def test_every_time_at_its_shortest():
    run(env_writes(delay=1, attack=1, hold=1, decay=1, release=1, loop=LOOP_FREE), gate_at(0), 40)
    run(env_writes(delay=1, attack=1, hold=1, decay=1, release=1), gate_at(0, (2, 20)), 40)


def test_an_edit_during_a_stage_follows_at_once():
    def edit(s):
        if s == 40:
            return [(model.SUSTAIN, ONE // 8)]
        if s == 60:
            return [(0, 1 | LOOP_FREE << 2)]
        return []
    run(env_writes(attack=4, decay=4), gate_at(0, (1, 50)), 90, on_sample=edit)


@pytest.mark.parametrize("kind", [model.SINE, model.TRI, model.SAW_UP, model.SAW_DOWN, model.SQUARE, model.RANDOM])
def test_every_lfo_shape(kind):
    run(lfo_writes(kind=kind, r=(1 << 32) // 37), lambda s: [0, 0, 0, 0], 60)


def test_lfo_options_and_all_three_at_once():
    writes = (lfo_writes(0, kind=model.TRI, r=(1 << 32) // 19, offset=0x1234, uni=1, amp=FULL // 3)
              + lfo_writes(1, kind=model.RANDOM, r=(1 << 32) // 7, sync=1)
              + lfo_writes(2, kind=model.SINE, r=(1 << 32) // 23, sync=2, uni=1))

    def adc(s):
        return [0, 0, 20000 if 11 <= s < 13 else 0, 20000 if 30 <= s < 32 else 0]
    run(writes, adc, 70)


def test_the_cvs_through_smoothing_and_the_empty_jack_rule():
    def adc(s):
        return [4000 if s > 10 else 300, -4000 if s > 20 else 500, 0, 0]
    run([], adc, 80)
    run([], adc, 40, routing=3 << 20)


def test_gate_hysteresis_matches():
    values = [0, 2000, 6000, 5000, 3000, 2999, 3000, 5999, 6000, 7000, 100, 32767, -32768]
    run([], lambda s: [0, 0, values[s % len(values)], values[(s * 3) % len(values)]], 40)


def test_slots_reach_every_destination():
    writes = [
        slot(0, model.CV1, model.PITCH, 33554),
        slot(1, model.CV2, model.POS, 6711),
        slot(2, model.LFO1, model.SHIFT, 6711),
        slot(3, model.ENV1, model.LEVEL, 6711),
        slot(4, model.CV1, 4 + model.PITCH, -20000),
        slot(5, model.ENV1, 4 + model.POS, 3000),
        slot(6, model.LFO1, 4 + model.SHIFT, -6711),
        slot(7, model.LFO1, 4 + model.LEVEL, 6711),
        slot(8, model.LFO1, model.BALANCE, 6711),
        slot(11, model.LFO1, model.POS, 100),
        (0x30 + model.BALANCE, ONE // 2),
        (0x30 + model.LEVEL, ONE // 2),
        (0x34 + model.LEVEL, ONE // 2),
    ] + env_writes(attack=8, decay=8) + lfo_writes(r=(1 << 32) // 31)
    run(writes, lambda s: [8000, 8000, 20000 if s > 4 else 0, 0], 50, routing=3 << 20, frames=(31, 16))


def test_pitch_across_its_range():
    def edit(s):
        return [(0x30, -(13 << 16) + s * (1 << 15) + s * 77)]
    run([], lambda s: [0, 0, 0, 0], 44, on_sample=edit)


def test_the_largest_amounts_stay_in_the_accumulator():
    writes = [slot(i, model.CV1, model.PITCH, (1 << 17) - 1) for i in range(12)]
    run(writes, lambda s: [32767, 0, 0, 0], 40, routing=3 << 20)
    writes = [slot(i, model.CV1, model.POS, -(1 << 17)) for i in range(12)]
    run(writes, lambda s: [32767, 0, 0, 0], 40, routing=3 << 20, frames=(1024, 3))


def test_vca_routing():
    writes = (env_writes(0, attack=6, decay=6) + env_writes(1, mask=2, attack=9, decay=3)
              + [(0x30 + model.LEVEL, ONE), (0x34 + model.LEVEL, ONE * 3 // 4)])

    def adc(s):
        return [0, 0, 20000 if s > 2 else 0, 20000 if s > 6 else 0]
    for vca1, vca2 in ((1, 0), (0, 2), (3, 0), (3, 3), (2, 1)):
        run(writes, adc, 34, routing=vca1 << 16 | vca2 << 18)


def test_table_shapes_scale_position_and_tilt():
    writes = [(0x31, ONE // 3), (0x32, ONE // 2), (0x35, ONE), (0x36, -ONE)]
    for frames in ((1, 1), (2, 3), (64, 16), (1024, 1000)):
        run(writes, lambda s: [0, 0, 0, 0], 3, frames=frames)


def test_a_run_fits_its_budget():
    # The longest possible: everything curved and slotted, tilted, the VCAs in, pitch far
    # from the middle octave.
    writes = (env_writes(0, attack=200, curves=(100, 100, 100)) + env_writes(1, mask=1, attack=200)
              + lfo_writes(0) + lfo_writes(1) + lfo_writes(2)
              + [slot(i, model.CV1, model.POS, 100) for i in range(12)]
              + [(0x30, -(11 << 16)), (0x34, -(11 << 16))])
    longest = run(writes, lambda s: [8000, 0, 20000, 0], 16, routing=3 << 16 | 3 << 18)
    assert longest < 250, f"{longest} clocks a sample"


def test_random_patches():
    rnd = random.Random(2026)
    for trial in range(4):
        writes = []
        for e in range(2):
            writes += env_writes(
                e, delay=rnd.randint(1, 6), attack=rnd.randint(1, 12), hold=rnd.randint(1, 4),
                decay=rnd.randint(1, 12), sustain=rnd.randint(0, ONE), release=rnd.randint(1, 12),
                mask=rnd.randint(0, 3), loop=rnd.randint(0, 2),
                curves=tuple(rnd.randint(-256, 256) for _ in range(3)))
        for k in range(3):
            writes += lfo_writes(k, r=rnd.getrandbits(28), offset=rnd.getrandbits(16), kind=rnd.randint(0, 5),
                                 uni=rnd.randint(0, 1), sync=rnd.randint(0, 3), amp=rnd.randint(0, FULL))
        for i in range(12):
            writes.append(slot(i, rnd.randint(0, 7), rnd.randint(0, 8), rnd.randint(-(1 << 17), (1 << 17) - 1)))
        for d in range(9):
            writes.append((0x30 + d, rnd.randint(-(1 << 20), 1 << 20)))
        pattern = [rnd.choice((0, 20000)) for _ in range(16)]

        def adc(s):
            return [(s * 700) % 16000 - 8000, 3000 - s * 50, pattern[s // 3 % 16], pattern[s // 5 % 16]]
        run(writes, adc, 60, routing=rnd.getrandbits(22) & ~0xFFFF, frames=(rnd.randint(1, 64), rnd.randint(1, 64)))
