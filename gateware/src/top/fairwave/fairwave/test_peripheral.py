"""The whole audio path through its registers, as the firmware drives it: inputs, modulation,
oscillators, mixer and outputs, against the models, through a PSRAM with latency."""

from amaranth.sim import Simulator

from model import modulation as mod
from model import wavescan as osc
from model.modulation import FULL, LOOP_FREE, ONE, Modulation
from model.wavescan import WRAP, Layer

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
        edge=(0, 0), script=None):
    """Writes the registers while the DAC is stalled, then runs `n` samples and checks all four
    outputs against the models."""
    dut = WaveScanPeripheral()
    psram = PsramModel()
    psram.mem = mem
    sim = Simulator(dut)
    sim.add_clock(1 / 60e6)
    sim.add_testbench(psram.bench(dut.bus), background=True)

    m = Modulation()
    layers = [Layer(frame_log2=FRAME_LOG2, frames=frames[i], edge=edge[i]) for i in range(2)]
    # The sample stalled at the output was computed from the reset state: silent, at C4.
    m.step([0, 0, 0, 0])
    for i in range(2):
        layers[i].phase = m.inc[i]
    extra = {"model": m}

    async def bench(ctx):
        csr = Csr(dut)
        ctx.set(dut.i.valid, 1)
        for i in range(2):
            await csr.write(ctx, f"l{i}_table", table_reg(frames[i]))
            await csr.write(ctx, f"l{i}_ctrl", edge[i])
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
            l1, l2 = osc.sample(layers[0], mem), osc.sample(layers[1], mem)
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
        assert extra[f"scan{i}"] & 0xFFFF == (m.pos[i] >> 10) & 0xFFFF
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
