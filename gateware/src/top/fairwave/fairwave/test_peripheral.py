"""The whole audio path through its registers, as the firmware drives it: inputs, modulation,
oscillators, mixer and outputs, against the models, through a PSRAM with latency."""

from amaranth.sim import Simulator

from model import modulation as mod
from model import wavescan as osc
from model.modulation import FULL, LOOP_FREE, ONE, Modulation
from model.wavescan import MIRROR, WRAP, Layer

from .peripheral import WaveScanPeripheral
from .psram_model import PsramModel
from .test_fill import Csr
from .test_mod import env_writes, lfo_writes, rate, slot
from .test_osc import morph_table

A_TABLE = 4
FRAME_LOG2 = 8
ROUTING_DEFAULT = mod.OUT_L1 | mod.OUT_L2 << 4 | mod.OUT_ENV1 << 8 | mod.OUT_ENV2 << 12


def s16(x):
    return ((x + 0x8000) & 0xFFFF) - 0x8000


def table_mem():
    return osc.pack_frames(morph_table(A_TABLE, 1 << FRAME_LOG2))


def table_reg(frames=A_TABLE, frame_log2=FRAME_LOG2, base=0):
    return Layer(table_base=base, frame_log2=frame_log2, frames=frames).table_reg()


def run(writes, mem, n, adc_of=lambda s: [0, 0, 0, 0], routing=ROUTING_DEFAULT, frames=(A_TABLE, A_TABLE),
        edge=(0, 0), script=None, max_level=(0, 0), styles=(0, 0), grain=(0, 0)):
    """Writes the registers while the DAC is stalled, then runs `n` samples and checks all four
    outputs against the models."""
    dut = WaveScanPeripheral()
    psram = PsramModel()
    psram.mem = mem
    sim = Simulator(dut)
    sim.add_clock(1 / 60e6)
    sim.add_testbench(psram.bench(dut.bus), background=True)

    m = Modulation()
    layers = [Layer(frame_log2=FRAME_LOG2, frames=frames[i], edge=edge[i], max_level=max_level[i],
                    stepped=styles[i] & 1, raw=styles[i] >> 1) for i in range(2)]
    # The sample stalled at the output was computed from the reset state: silent, at C4.
    m.step([0, 0, 0, 0])
    for i in range(2):
        layers[i].phase = m.inc[i]
    extra = {"model": m}

    async def bench(ctx):
        csr = Csr(dut)
        ctx.set(dut.i.valid, 1)
        # (the first sample comes from the reset state: nothing written may land part way through it)
        while not ctx.get(dut.o.valid):
            await ctx.tick()
        for i in range(2):
            await csr.write(ctx, f"l{i}_table", layers[i].table_reg())
            await csr.write(ctx, f"l{i}_ctrl", layers[i].ctrl_reg(grain[i]))
            m.ctrl(i, layers[i].ctrl_reg(grain[i]))
            m.frames_m1[i] = frames[i] - 1
        await csr.write(ctx, "routing", routing)
        m.routing(routing)
        for addr, data in writes:
            await csr.write(ctx, "param_addr", addr)
            await csr.write(ctx, "param_data", data & 0xFFFFFFFF)
            m.write(addr, data & 0xFFFFFFFF)
        while not ctx.get(dut.o.valid):
            await ctx.tick()
        for s in range(n):
            adc = adc_of(s)
            for ch in range(4):
                ctx.set(dut.i.payload[ch].as_value(), adc[ch])
            for _ in range(3):
                await ctx.tick()
            ctx.set(dut.o.ready, 1)
            await ctx.tick()
            ctx.set(dut.o.ready, 0)
            await ctx.tick()
            while not ctx.get(dut.o.valid):
                await ctx.tick()
            m.step(adc)
            m.apply(layers)
            l1, l2 = osc.both(layers, mem, m.cross())
            want = m.mix(l1, l2)
            got = [s16(ctx.get(dut.o.payload[ch].as_value())) for ch in range(4)]
            assert got == want, f"sample {s}: got {got}, models {want}"
            for layer in layers:
                layer.phase = (layer.phase + layer.inc) & 0xFFFFFFFF
        if script:
            await script(ctx, csr, extra)

    sim.add_testbench(bench)
    sim.run()
    return extra


def playing(pos=ONE // 2, level=ONE):
    """Both layers sounding, half way through their tables."""
    return [(0x30 + mod.POS, pos), (0x30 + mod.LEVEL, level), (0x34 + mod.POS, pos), (0x34 + mod.LEVEL, level)]


def test_silent_until_configured():
    run([], {}, 4, routing=mod.OUT_L1 | mod.OUT_L2 << 4)


def test_both_layers_play_through_the_registers():
    run(playing(), table_mem(), 16)


def test_a_slot_moves_pitch_from_the_input():
    mem = table_mem()
    writes = playing() + [slot(0, mod.CV1, mod.PITCH, 33554)]
    run(writes, mem, 16, adc_of=lambda s: [4000, 0, 0, 0], routing=ROUTING_DEFAULT | 3 << 20)


def test_gates_shape_the_audio_and_the_envelope_outputs():
    writes = (playing() + env_writes(0, delay=1, attack=4, hold=1, decay=4, release=4)
              + env_writes(1, delay=1, attack=2, hold=1, decay=2, release=6, mask=2))

    def adc(s):
        return [0, 0, 20000 if 2 <= s < 16 else 0, 20000 if 8 <= s < 12 else 0]
    run(writes, table_mem(), 28, adc_of=adc, routing=ROUTING_DEFAULT | 1 << 16 | 2 << 18)


def test_a_looping_envelope_as_an_lfo_on_position_with_no_gate():
    writes = (playing() + env_writes(0, loop=LOOP_FREE, delay=1, attack=3, hold=1, decay=2, release=3)
              + [slot(0, mod.ENV1, mod.POS, 13422)])
    run(writes, table_mem(), 24)


def test_an_lfo_on_an_output_and_on_tilt():
    writes = (playing() + lfo_writes(0, kind=mod.TRI, r=(1 << 32) // 17)
              + [slot(0, mod.LFO1, mod.SHIFT, 13422)])
    run(writes, table_mem(), 20, routing=mod.OUT_MIX | mod.OUT_L2 << 4 | mod.OUT_LFO1 << 8 | mod.OUT_OFF << 12,
        edge=(WRAP, WRAP))


def test_balance_crossfades_the_mix():
    writes = playing() + [(0x30 + mod.BALANCE, ONE // 4)] + lfo_writes(1, kind=mod.SINE, r=(1 << 32) // 11) + [
        slot(0, mod.LFO2, mod.BALANCE, 3000)]
    run(writes, table_mem(), 20, routing=mod.OUT_MIX | mod.OUT_MIX << 4 | mod.OUT_L1 << 8 | mod.OUT_L2 << 12)


def test_every_output_selection_reaches_an_output():
    writes = (playing() + env_writes(0, delay=1, attack=2, decay=2) + env_writes(1, delay=1, attack=3, mask=1)
              + lfo_writes(0, r=1 << 28) + lfo_writes(1, kind=mod.TRI, r=1 << 28)
              + lfo_writes(2, kind=mod.SQUARE, r=1 << 28))
    for sels in ((mod.OUT_OFF, mod.OUT_MIX, mod.OUT_L1, mod.OUT_L2),
                 (mod.OUT_ENV1, mod.OUT_ENV2, mod.OUT_LFO1, mod.OUT_LFO2),
                 (mod.OUT_LFO3, 9, 15, mod.OUT_ENV1)):
        routing = sum(s << (4 * i) for i, s in enumerate(sels))
        run(writes, table_mem(), 8, adc_of=lambda s: [0, 0, 20000 if s > 1 else 0, 0], routing=routing)


def test_tables_of_different_shapes_scale_position_and_tilt():
    frames = (4, 2)
    writes = playing() + [(0x30 + mod.SHIFT, ONE // 2), (0x34 + mod.SHIFT, -ONE)]
    run(writes, table_mem(), 12, frames=frames, edge=(WRAP, WRAP))


def test_stats_report_a_whole_sample_and_clear_on_read():
    async def script(ctx, csr, extra):
        extra["first"] = await csr.read(ctx, "stats")
        extra["second"] = await csr.read(ctx, "stats")

    extra = run(playing(), table_mem(), 8, script=script)
    longest = extra["first"] & 0xFFFF
    assert 100 < longest < 500, longest
    assert extra["first"] >> 16 >= 8, "should have counted the samples"
    assert (extra["second"] & 0xFFFF) < longest, "the read should have cleared it"


def test_the_monitors_show_the_modulation():
    writes = (playing() + env_writes(0, delay=1, attack=1, hold=48, decay=1)
              + lfo_writes(0, kind=mod.SQUARE, r=1 << 20, amp=FULL // 2))

    async def script(ctx, csr, extra):
        extra["mon0"] = await csr.read(ctx, "mon0")
        extra["mon1"] = await csr.read(ctx, "mon1")
        extra["mon2"] = await csr.read(ctx, "mon2")
        extra["mon3"] = await csr.read(ctx, "mon3")

    extra = run(writes, table_mem(), 8, adc_of=lambda s: [0, 0, 20000, 0], script=script)
    assert extra["mon0"] & 0xFFFF == 20000, "envelope 1 at its top: 5 V in DAC counts"
    assert extra["mon1"] & 0xFFFF == 10000
    assert (extra["mon2"] >> 16) & 7 == mod.HOLD
    assert (extra["mon2"] >> 22) & 3 == 1, "gate 1 high"
    # Hold is 48 samples, so a few samples in it is a few 48ths of the way through.
    assert 0 < extra["mon3"] & 0xFF < 128, "envelope 1's progress through its stage"


def test_the_monitors_show_where_each_layer_is_reading():
    writes = [(0x30 + mod.POS, ONE // 2), (0x30 + mod.SHIFT, ONE // 4), (0x30 + mod.LEVEL, ONE),
              (0x34 + mod.POS, ONE // 4), (0x34 + mod.SHIFT, -(ONE // 8)), (0x34 + mod.LEVEL, ONE)]

    async def script(ctx, csr, extra):
        extra["scan0"] = await csr.read(ctx, "scan0")
        extra["scan1"] = await csr.read(ctx, "scan1")

    extra = run(writes, table_mem(), 8, script=script)
    m = extra["model"]
    assert m.pos[0] != 0 and m.shift[1] < 0, "the test means something"
    for i in range(2):
        assert extra[f"scan{i}"] & 0xFFFF == (m.pos_fraction[i] >> 2) & 0xFFFF
        assert extra[f"scan{i}"] >> 16 == (m.shift[i] >> 2) & 0xFFFF


def test_the_table_register_changes_a_tables_shape_at_once():
    # Two tables of different shapes: after the write, the next samples are the new
    # table's, never a mix of old base and new length.
    a = osc.pack_frames(morph_table(2, 2048, seed=3))
    base_b = (2 * 2048 * 2) // 256
    b = osc.pack_frames(morph_table(8, 256, seed=4), base_word=base_b << 6)
    mem = a | b
    dut = WaveScanPeripheral()
    psram = PsramModel()
    psram.mem = mem
    sim = Simulator(dut)
    sim.add_clock(1 / 60e6)
    sim.add_testbench(psram.bench(dut.bus), background=True)
    samples = []

    async def bench(ctx):
        csr = Csr(dut)
        ctx.set(dut.o.ready, 1)
        await csr.write(ctx, "l0_table", table_reg(2, 11))
        await csr.write(ctx, "routing", mod.OUT_L1)
        await csr.write(ctx, "param_addr", 0x30 + mod.LEVEL)
        await csr.write(ctx, "param_data", ONE)
        await csr.write(ctx, "l0_table", table_reg(8, 8, base_b))
        await csr.write(ctx, "param_addr", 0x30 + mod.POS)
        await csr.write(ctx, "param_data", ONE * 3 // 7)
        for _ in range(8):
            while True:
                await ctx.tick()
                if ctx.get(dut.o.valid):
                    break
            samples.append(ctx.get(dut.o.payload[0].as_value()))

    sim.add_testbench(bench)
    sim.run()
    frame = morph_table(8, 256, seed=4)[3]
    lo, hi = min(frame), max(frame)
    late = [s16(s) for s in samples[2:]]
    scale = mod.UNITY_LEVEL / 65536
    assert all(lo * scale - 1 <= s <= hi * scale + 1 for s in late), f"{late} not within frame 3's [{lo}, {hi}]"


def test_the_monitor_tells_a_position_past_the_ends_as_it_is():
    writes = [(0x30 + mod.POS, -ONE // 2), (0x30 + mod.LEVEL, ONE), (0x34 + mod.POS, 5 * ONE), (0x34 + mod.LEVEL, ONE)]

    async def script(ctx, csr, extra):
        extra["scan0"] = await csr.read(ctx, "scan0")
        extra["scan1"] = await csr.read(ctx, "scan1")

    extra = run(writes, table_mem(), 8, edge=(WRAP, MIRROR), script=script)
    assert s16(extra["scan0"] & 0xFFFF) == -1 << 11, "half a table back, in Q4.12"
    assert s16(extra["scan1"] & 0xFFFF) == 5 << 12


def test_an_lfo_takes_position_round_the_table_past_its_ends():
    # The bug this replaces: the matrix stopped position at 0 and 100%, so wrap and mirror did what
    # clamp does. Here it goes well past both, and the audio has to follow the model through it.
    writes = (playing() + lfo_writes(0, kind=mod.TRI, r=(1 << 32) // 40)
              + [slot(0, mod.LFO1, mod.POS, 53687), slot(1, mod.LFO1, 4 + mod.POS, 53687)])
    extra = {}

    async def script(ctx, csr, e):
        extra["model"] = e["model"]
    run(writes, table_mem(), 48, edge=(WRAP, MIRROR), script=script)
    assert extra["model"].acc[mod.POS] != 0


def test_position_past_the_ends_reads_other_frames_than_clamp():
    # Over 100%, where clamp sits on the last frame, wrap comes round to the first.
    frames = morph_table(A_TABLE, 1 << FRAME_LOG2)
    mem = osc.pack_frames(frames)
    writes = [(0x30 + mod.POS, ONE * 3 // 2), (0x30 + mod.LEVEL, ONE), (0x34 + mod.POS, ONE * 3 // 2),
              (0x34 + mod.LEVEL, ONE)]
    out = {}

    async def script(ctx, csr, e):
        out.update(e)
    run(writes, mem, 8, edge=(WRAP, 0), script=script)
    m = out["model"]
    assert m.pos[0] == m.pos[1] and m.pos[0] >> 16 == 4, "past the last of four frames"
    assert osc.frame_coords(Layer(frames=A_TABLE, edge=WRAP, pos=m.pos[0]))[0] == 0
    assert osc.frame_coords(Layer(frames=A_TABLE, edge=0, pos=m.pos[0]))[0] == A_TABLE - 1


def levels_table():
    return osc.pack_table(morph_table(A_TABLE, 1 << FRAME_LOG2))


def test_levels_through_the_registers():
    # Pitch high enough for the upper levels, and a CV moving it through them.
    writes = playing() + [(0x30 + mod.PITCH, 3 * ONE), (0x34 + mod.PITCH, 5 * ONE),
                          slot(0, mod.CV1, mod.PITCH, 33554)]
    run(writes, levels_table(), 24, adc_of=lambda s: [s * 2000 - 20000, 0, 0, 0],
        routing=ROUTING_DEFAULT | 3 << 20, max_level=(5, 3))


def test_reading_styles_through_the_registers():
    writes = playing(pos=ONE * 3 // 8) + [(0x30 + mod.PITCH, 2 * ONE), (0x34 + mod.PITCH, 2 * ONE)]
    run(writes, table_mem(), 12, styles=(1, 3))


def cross_writes(depth):
    return playing() + [(0x34 + mod.PITCH, 7 * ONE // 12), (0x30 + mod.CROSS, depth)]


def test_every_mode_of_cross_modulation_through_the_registers():
    for word in (0b0001, 0b0010, 0b0110, 0b1001, 0b1010, 0b1110):
        run(cross_writes(osc.DEPTH_FULL // 3), table_mem(), 12, routing=ROUTING_DEFAULT | word << 22)


def test_an_envelope_on_the_cross_depth_shapes_it_at_audio_rate():
    writes = (cross_writes(0) + env_writes(0, delay=1, attack=6, hold=1, decay=6, release=6)
              + [slot(0, mod.ENV1, mod.CROSS, 21990)])
    run(writes, table_mem(), 24, adc_of=lambda s: [0, 0, 20000 if 1 <= s < 18 else 0, 0],
        routing=ROUTING_DEFAULT | 0b0010 << 22)


def test_cross_modulation_reaches_the_mix():
    writes = cross_writes(osc.DEPTH_FULL) + [(0x30 + mod.BALANCE, ONE)]
    routing = mod.OUT_MIX | mod.OUT_L1 << 4 | mod.OUT_L2 << 8 | mod.OUT_OFF << 12 | 0b0001 << 22
    run(writes, table_mem(), 12, routing=routing)


def test_a_grain_restarts_a_layer_through_the_registers():
    writes = (playing() + lfo_writes(0, kind=mod.TRI, r=(1 << 32) // 6, uni=1)
              + lfo_writes(1, kind=mod.SQUARE, r=(1 << 32) // 4)
              + [(0x30 + mod.LEVEL, 0), slot(0, mod.LFO1, mod.LEVEL, 13422), slot(1, mod.LFO2, 4 + mod.POS, 3000)])
    extra = run(writes, table_mem(), 30, grain=(1, 2), edge=(WRAP, WRAP))
    assert extra["model"].grain == [1, 2]


def test_grains_under_cross_modulation():
    writes = cross_writes(osc.DEPTH_FULL // 2) + lfo_writes(0, r=(1 << 32) // 5)
    run(writes, table_mem(), 24, grain=(0, 1), routing=ROUTING_DEFAULT | 0b0110 << 22)
