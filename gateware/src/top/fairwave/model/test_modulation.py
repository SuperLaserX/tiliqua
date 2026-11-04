"""The modulation model against what it should mean, in plain arithmetic: so that
`fairwave/test_mod.py` (the gateware against the model) means something."""

import math

import pytest

from . import modulation as mod
from .modulation import (ATTACK, DECAY, DELAY, ENV1, FULL, HOLD, IDLE, LFO1, LOOP_FREE, LOOP_GATED, LOOP_OFF, ONE,
                         RELEASE, SUSTAIN, VOLT, Modulation, shape)
from .wavescan import Layer


def rate(samples):
    """The rate for a segment of `samples` samples (0 is one sample)."""
    return (-(-(1 << 32) // samples)) & 0xFFFFFFFF


def env_words(delay=48, attack=48, hold=48, decay=48, sustain=ONE // 2, release=48, mask=1, loop=LOOP_OFF,
              curves=(0, 0, 0)):
    w = [0] * 8
    w[0] = mask | loop << 2
    w[DELAY], w[ATTACK], w[HOLD] = rate(delay), rate(attack), rate(hold)
    w[DECAY], w[RELEASE] = rate(decay), rate(release)
    w[SUSTAIN] = sustain
    w[7] = sum((c & 0x3FF) << (10 * i) for i, c in enumerate(curves))
    return w


def run_env(words, gate, n):
    """Levels and stages over `n` samples; `gate(i)` is the gate's state at sample `i`."""
    m = Modulation()
    for i, w in enumerate(words):
        m.write(i, w)
    levels, stages = [], []
    for i in range(n):
        m.step([0, 0, 20000 if gate(i) else 0, 0])
        levels.append(m.envs[0].level)
        stages.append(m.envs[0].stage)
    return levels, stages


def test_every_segment_lasts_exactly_its_samples():
    words = env_words(delay=100, attack=200, hold=50, decay=300, sustain=ONE // 4, release=400)
    levels, stages = run_env(words, lambda i: 10 <= i < 2000, 2600)
    assert levels[:110] == [0] * 110, "nothing until the delay has passed"
    assert levels[10 + 100 + 200 - 1] == ONE, "the top exactly at the end of the attack"
    assert levels[10 + 100 + 200 - 2] < ONE
    assert all(x == ONE for x in levels[310 - 1:310 + 50])
    assert levels[310 + 50 + 300 - 1] == ONE // 4, "sustain exactly at the end of the decay"
    assert levels[360 + 300 - 2] > ONE // 4
    assert all(x == ONE // 4 for x in levels[660:2000])
    assert levels[2000 + 400 - 1] == 0, "silent exactly at the end of the release"
    assert levels[2000 + 400 - 2] > 0
    assert stages[2500] == IDLE


def test_a_long_segment_is_as_close_as_its_rate_allows():
    # Rates are 32 bits: past 2**16 samples they round a segment short by up to T^2 / 2^32
    # samples (0.04% at the longest, 33 seconds).
    for samples in (65537, 100000, 1572864):
        words = env_words(delay=1, attack=samples, hold=1, decay=1, release=1)
        m = Modulation()
        for i, w in enumerate(words):
            m.write(i, w)
        count = 0
        gate = [0, 0, 20000, 0]
        m.step(gate)
        while m.envs[0].level < ONE:
            m.step(gate)
            count += 1
        assert abs(count - samples) <= samples ** 2 / 2 ** 32 + 1, f"{samples}: {count}"


def test_a_straight_attack_is_straight():
    levels, _ = run_env(env_words(delay=1, attack=1000), lambda i: True, 900)
    for i in range(1, 900):
        assert abs(levels[i] - i * ONE / 1000) < 2, i


@pytest.mark.parametrize("c", [-256, -128, 0, 128, 256])
def test_a_curve_keeps_its_ends_and_rises(c):
    last = shape(0, c << 8)
    assert last == 0
    for u in range(1, 65536, 97):
        y = shape(u, c << 8)
        assert 0 <= y <= ONE
        assert y >= last, f"c {c} at {u}"
        last = y
    assert shape(65535, c << 8) >= 65535 - 8


def test_the_extreme_curves_are_powers():
    for u in range(0, 65536, 1009):
        t = u / 65536
        assert abs(shape(u, ONE) / 65536 - t ** 4) < 1e-3, u
        assert abs(shape(u, -ONE) / 65536 - (1 - (1 - t) ** 4)) < 1e-3, u


def test_a_negative_curve_starts_fast_and_decays_like_a_capacitor():
    words = env_words(delay=1, attack=1, hold=1, decay=1000, sustain=0, curves=(0, -256, 0))
    levels, _ = run_env(words, lambda i: True, 300)
    # A quarter of the way through a fast-start decay, most of it has gone.
    assert levels[250] < ONE * 0.4


def test_release_runs_from_wherever_the_gate_fell():
    # In the middle of the attack: down from there, not from the top.
    words = env_words(delay=1, attack=1000, release=100)
    levels, stages = run_env(words, lambda i: i < 500, 700)
    at = levels[499]
    assert ONE * 0.45 < at < ONE * 0.55
    assert stages[500] == RELEASE
    assert levels[500] < at
    assert levels[500 + 99] == 0


def test_a_retrigger_rises_from_where_it_is():
    words = env_words(delay=1, attack=100, hold=1, decay=1, sustain=ONE // 2, release=1000)
    levels, _ = run_env(words, lambda i: i < 300 or i >= 400, 600)
    assert levels[399] > ONE * 0.4, "still releasing"
    assert levels[401] >= levels[399], "no drop to zero on the retrigger"


def test_gated_loop_repeats_while_the_gate_is_high_then_releases():
    words = env_words(delay=10, attack=10, hold=10, decay=10, sustain=ONE // 2, release=10, loop=LOOP_GATED)
    levels, stages = run_env(words, lambda i: i < 500, 700)
    period = 50     # no sustain: delay, attack, hold, decay, release
    assert SUSTAIN not in stages
    assert levels[10:10 + period] == levels[10 + period:10 + 2 * period], "the same cycle again"
    assert max(levels[:500]) == ONE
    assert stages[550] == IDLE, "stops once the gate has fallen"
    assert levels[600] == 0


def test_free_loop_runs_with_no_gate_and_restarts_on_one():
    words = env_words(delay=10, attack=10, hold=10, decay=10, sustain=ONE // 2, release=10, loop=LOOP_FREE)
    levels, stages = run_env(words, lambda i: False, 200)
    assert max(levels) == ONE, "runs by itself"
    assert levels[50:100] == levels[100:150]
    # A gate restarts the cycle, but its fall doesn't release it.
    levels, stages = run_env(words, lambda i: 77 <= i < 80, 300)
    assert stages[77] == DELAY
    assert stages[80] == DELAY, "the gate's fall is ignored"
    assert levels[77 + 50:77 + 100] == levels[77 + 100:77 + 150]


def test_a_loop_with_every_time_zero_still_steps_every_stage():
    words = env_words(delay=1, attack=1, hold=1, decay=1, sustain=ONE // 2, release=1, loop=LOOP_FREE)
    levels, _ = run_env(words, lambda i: False, 30)
    assert max(levels) == ONE and min(levels[1:]) == 0


def test_turning_a_loop_off_with_no_gate_stops_it():
    words = env_words(delay=10, attack=10, hold=10, decay=10, release=10, loop=LOOP_FREE)
    m = Modulation()
    for i, w in enumerate(words):
        m.write(i, w)
    for _ in range(23):
        m.step([0, 0, 0, 0])
    assert m.envs[0].stage != IDLE
    m.write(0, 1 | LOOP_OFF << 2)
    for _ in range(100):
        m.step([0, 0, 0, 0])
    assert m.envs[0].stage == IDLE and m.envs[0].level == 0


def test_an_envelope_is_5_volts_at_its_top():
    levels, _ = run_env(env_words(delay=1, attack=1, hold=48), lambda i: True, 10)
    m = Modulation()
    for i, w in enumerate(env_words(delay=1, attack=1, hold=48)):
        m.write(i, w)
    for _ in range(4):
        m.step([0, 0, 20000, 0])
    assert m.sources[ENV1] == FULL == 5 * VOLT


def test_the_gates_have_hysteresis():
    m = Modulation()
    seen = []
    for v in [0, 2000, 6000, 6000, 4000, 3500, 2999, 4000, 5999, 6000]:
        gates, rising = m.inputs([0, 0, v, 0])
        seen.append((gates & 1, rising & 1))
    assert seen == [(0, 0), (0, 0), (1, 1), (1, 0), (1, 0), (1, 0), (0, 0), (0, 0), (0, 0), (1, 1)]


def lfo_cycle(kind, n=4800, offset=0, uni=0, amp=FULL, sync=0):
    m = Modulation()
    r = (1 << 32) // n
    m.write(0x10, r)
    m.write(0x11, offset | kind << 16 | uni << 19 | sync << 20)
    m.write(0x12, amp)
    out = []
    for _ in range(n):
        m.step([0, 0, 0, 0])
        out.append(m.sources[LFO1])
    return out


def test_sine_is_close_to_a_sine():
    out = lfo_cycle(mod.SINE)
    for i, v in enumerate(out):
        want = math.sin(2 * math.pi * (i + 1) / 4800) * FULL
        assert abs(v - want) < 0.06 * FULL, i
    assert FULL - max(out) < 40 and FULL + min(out) < 40


def test_triangle_and_saws_and_square():
    tri = lfo_cycle(mod.TRI)
    assert FULL - max(tri) < 200 and FULL + min(tri) < 200
    assert abs(tri[1199] - FULL) < 200, "the top at a quarter of the cycle"
    up = lfo_cycle(mod.SAW_UP)
    assert up[0] < -FULL * 0.99 and up[-2] > FULL * 0.99
    down = lfo_cycle(mod.SAW_DOWN)
    assert down[0] > FULL * 0.99 and down[-2] < -FULL * 0.99
    square = lfo_cycle(mod.SQUARE)
    assert set(square) == {FULL, -FULL}
    assert abs(sum(1 for v in square if v > 0) - 2400) <= 1


def test_unipolar_runs_from_nothing_to_full():
    out = lfo_cycle(mod.TRI, uni=1)
    assert 0 <= min(out) < 200 and FULL - max(out) < 200


def test_level_scales_and_phase_offsets():
    half = lfo_cycle(mod.SQUARE, amp=FULL // 2)
    assert set(half) == {FULL // 2, -FULL // 2}
    plain = lfo_cycle(mod.TRI)
    shifted = lfo_cycle(mod.TRI, offset=0x4000)
    assert abs(shifted[0] - FULL) < 200, "a quarter cycle on: starts at the top"
    assert all(abs(shifted[i] - plain[(i + 1200) % 4800]) < 100 for i in range(0, 4800, 37))


def test_sync_resets_the_phase_on_a_rising_gate():
    m = Modulation()
    m.write(0x10, 1 << 24)
    m.write(0x11, mod.SAW_UP << 16 | 2 << 20)   # sync to gate 2
    m.write(0x12, FULL)
    for _ in range(50):
        m.step([0, 0, 0, 0])
    assert m.lfos[0].phase == 50 << 24
    m.step([0, 0, 20000, 0])
    assert m.lfos[0].phase == 51 << 24, "the other gate does nothing"
    m.step([0, 0, 0, 20000])
    assert m.lfos[0].phase == 0
    m.step([0, 0, 0, 20000])
    assert m.lfos[0].phase == 1 << 24, "only the edge"


def test_random_holds_between_wraps():
    m = Modulation()
    m.write(0x10, (1 << 32) // 100)
    m.write(0x11, mod.RANDOM << 16)
    m.write(0x12, FULL)
    seen = []
    for _ in range(1000):
        m.step([0, 0, 0, 0])
        seen.append(m.sources[LFO1])
    runs = [a for a, b in zip(seen, seen[1:]) if a != b]
    assert 8 <= len(runs) <= 11, "one new value a cycle"
    assert len(set(runs)) == len(runs)
    assert max(seen) > 0 > min(seen)
    assert all(-FULL <= v <= FULL for v in seen)


def slot(src, dest, amount):
    return (amount & 0x3FFFF) | src << 18 | dest << 21


# What 100% is, per destination (`cpu/src/params.rs`): a volt an octave, and 5 V the whole range.
PITCH_100 = round(1.0 * ONE / VOLT * (1 << 14))
RANGE_100 = round(ONE / FULL * (1 << 14))


def cents(a, b):
    return 1200 * math.log2(a / b)


def test_a_volt_is_an_octave_through_the_matrix():
    m = Modulation()
    m.routing(3 << 20)
    m.write(0x20, slot(mod.CV1, mod.PITCH, PITCH_100))
    for _ in range(600):
        m.step([0, 0, 0, 0])
    c4 = m.inc[0]
    assert abs(cents(c4 * 48000 / 2 ** 32, mod.C4_HZ)) < 0.01
    for volts in (1, 2, 3, -1, -2, 4):
        for _ in range(600):
            m.step([volts * 4000, 0, 0, 0])
        err = cents(m.inc[0], c4) - volts * 1200
        assert abs(err) < 0.02, f"{volts} V: {err} cents"


def test_pitch_interpolates_between_table_points_to_a_thousandth_of_a_cent():
    m = Modulation()
    for p in range(-(4 << 16), 4 << 16, 1237):
        m.write(0x30, p)
        m.acc = list(m.base)
        m.finish()
        want = mod.C4_HZ / 48000 * 2 ** 32 * 2 ** (p / 65536)
        if p > -(1 << 16):    # (below that, shifting right loses a few low bits)
            assert abs(cents(m.inc[0], want)) < 0.002, p


def test_pitch_stops_short_of_nyquist_and_at_the_bottom():
    m = Modulation()
    m.write(0x30, 20 << 16)
    m.acc = list(m.base)
    m.finish()
    assert 0 < m.inc[0] < (1 << 31)
    assert m.inc[0] > (1 << 31) * 0.95
    m.write(0x30, -20 << 16)
    m.acc = list(m.base)
    m.finish()
    assert m.inc[0] == mod.exp_rom()[0] >> 12


def test_position_and_tilt_are_relative_to_the_table():
    m = Modulation()
    m.frames_m1 = [30, 15]
    m.write(0x31, ONE // 2)
    m.write(0x35, ONE)
    m.write(0x32, ONE)
    m.write(0x36, -ONE)
    m.acc = list(m.base)
    m.finish()
    assert m.pos == [15 << 16, 15 << 16]
    assert m.shift == [30 << 6, -(15 << 6)], "a tilt of 1.0 crosses the table in a cycle"


def test_a_one_frame_table_has_nowhere_to_go():
    m = Modulation()
    m.frames_m1 = [0, 0]
    m.write(0x31, ONE)
    m.write(0x32, ONE)
    m.acc = list(m.base)
    m.finish()
    assert (m.pos[0], m.shift[0]) == (0, 0)


def test_tilt_and_position_clamp_at_the_register_limits():
    m = Modulation()
    m.frames_m1 = [1023, 1023]
    m.write(0x31, 1 << 24)
    m.write(0x32, 1 << 24)
    m.write(0x35, -(1 << 24))
    m.write(0x36, -(1 << 24))
    m.acc = list(m.base)
    m.finish()
    assert m.pos == [(((1 << 17) - 1) * 1023) << 2, -(1 << 17) * 1023 << 2], "8 tables each way"
    assert m.shift[0] == (((1 << 17) - 1) * 1023) >> 10 < 1 << 17
    assert m.shift[1] == (-(1 << 17) * 1023) >> 10


def test_position_goes_past_the_table_for_the_edge_rule_to_deal_with():
    m = Modulation()
    m.frames_m1 = [4, 4]
    m.write(0x31, ONE + ONE // 2)
    m.write(0x35, -ONE // 4)
    m.acc = list(m.base)
    m.finish()
    assert m.pos == [6 << 16, -(1 << 16)], "150% and -25% of a table's four spans"
    assert m.pos_fraction == [(ONE + ONE // 2) >> 2, (-ONE // 4) >> 2]


def test_an_lfo_can_take_position_past_the_ends():
    m = Modulation()
    m.frames_m1 = [4, 4]
    m.write(0x31, ONE // 2)
    m.write(0x20, mod.LFO1 << 18 | mod.POS << 21 | 13422 * 2)       # 200%, of a source at 5 V
    m.lfos[0].words = [1 << 28, mod.SQUARE << 16, FULL]
    m.step([0, 0, 0, 0])
    assert m.pos[0] >> 16 == 10, "50% + 200% of four spans"


def test_cross_depth_is_a_destination_and_stays_in_18_bits():
    m = Modulation()
    m.write(0x30 + mod.CROSS, 50000)
    m.write(0x20, mod.LFO1 << 18 | mod.CROSS << 21 | 8192)          # half a source
    m.lfos[0].words = [1 << 28, mod.SQUARE << 16, FULL]
    m.step([0, 0, 0, 0])
    assert m.depth == 50000 + FULL // 2
    m.write(0x30 + mod.CROSS, 1 << 20)
    m.step([0, 0, 0, 0])
    assert m.depth == (1 << 17) - 1
    m.write(0x30 + mod.CROSS, -(1 << 20))
    m.step([0, 0, 0, 0])
    assert m.depth == 0


def test_the_routing_word_says_how_one_layer_modulates_the_other():
    m = Modulation()
    m.write(0x30 + mod.CROSS, 1234)
    m.step([0, 0, 0, 0])
    m.routing(0b1010 << 22)
    c = m.cross()
    assert (c.ring, c.pm, c.lock, c.modulator, c.depth) == (0, 1, 0, 1, 1234)
    m.routing(0b0101 << 22)
    c = m.cross()
    assert (c.ring, c.pm, c.lock, c.modulator) == (1, 0, 1, 0)


def grain_model():
    m = Modulation()
    m.frames_m1 = [15, 15]
    m.ctrl(0, 2 << 4)                       # osc 1 restarts on LFO 2
    m.lfos[1].words = [(1 << 32) // 8, 0, FULL]
    m.write(0x31, ONE // 4)
    return m


def test_a_grain_restarts_the_layer_and_holds_its_position():
    m = grain_model()
    layers = [Layer(frames=16, phase=0x12345678), Layer(frames=16, phase=0x12345678)]
    restarts = []
    for s in range(32):
        # What the position is moving to, mid-grain: only a new grain may take it up.
        m.write(0x31, ONE // 4 + s * 100)
        m.step([0, 0, 0, 0])
        m.apply(layers)
        if m.restart[0]:
            restarts.append(s)
            assert layers[0].phase == 0, "from the top of the cycle"
            assert m.pos[0] == ((ONE // 4 + s * 100) >> 2) * 15 << 2
        else:
            assert layers[0].phase != 0
        assert not m.restart[1], "the other is left alone"
        layers[0].phase = (layers[0].phase + 1 << 20) & 0xFFFFFFFF
    assert restarts == [7, 15, 23, 31], "once a cycle of the LFO"


def test_with_no_grain_position_follows_every_sample():
    m = Modulation()
    m.frames_m1 = [15, 15]
    for s in range(4):
        m.write(0x31, s * 1000)
        m.step([0, 0, 0, 0])
        assert m.pos[0] == ((s * 1000) >> 2) * 15 << 2
        assert not m.restart[0]


def test_a_rising_gate_syncing_the_lfo_starts_a_grain():
    m = grain_model()
    m.lfos[1].words = [1 << 8, 1 << 21, FULL]       # slow, restarted by gate 2
    m.step([0, 0, 0, 0])
    assert not m.restart[0]
    m.step([0, 0, 0, 9000])
    assert m.restart[0]
    m.step([0, 0, 0, 9000])
    assert not m.restart[0]


def test_level_is_unity_at_100_percent_and_stays_in_range():
    m = Modulation()
    m.write(0x33, ONE)
    m.write(0x37, 1 << 24)
    m.acc = list(m.base)
    m.finish()
    assert m.level == [mod.UNITY_LEVEL, mod.UNITY_LEVEL], "more is held at 100%"
    m.write(0x33, -5)
    m.acc = list(m.base)
    m.finish()
    assert m.level[0] == 0


def run_vca(mask1, mask2, level1=ONE, level2=ONE):
    m = Modulation()
    m.routing(mask1 << 16 | mask2 << 18)
    m.write(0x33, ONE)
    m.write(0x37, ONE)
    m.envs[0].level, m.envs[1].level = level1, level2
    m.acc = list(m.base)
    m.finish()
    return m.level


def test_an_unrouted_vca_stays_open():
    assert run_vca(0, 0, 0, 0) == [mod.UNITY_LEVEL, mod.UNITY_LEVEL]


def test_a_routed_vca_follows_its_envelope_and_two_multiply():
    half = mod.UNITY_LEVEL // 2
    assert run_vca(1, 0, ONE // 2) == [half, mod.UNITY_LEVEL]
    assert run_vca(2, 0, ONE // 2) == [mod.UNITY_LEVEL, half]
    assert run_vca(3, 0, ONE // 2) == [half, half]
    assert run_vca(1, 1, ONE // 2, ONE // 2) == [mod.UNITY_LEVEL // 4, mod.UNITY_LEVEL]
    assert run_vca(3, 0, 0) == [0, 0], "closed"


def test_slots_add_and_can_share_a_destination():
    m = Modulation()
    m.routing(3 << 20)
    m.write(0x31, 0x4000)
    m.write(0x20, slot(mod.CV1, mod.POS, RANGE_100))
    m.write(0x21, slot(mod.CV2, mod.POS, -RANGE_100))
    m.frames_m1 = [100, 100]
    for _ in range(600):
        m.step([2000, 1000, 0, 0])      # 0.5 V and 0.25 V
    want = 0.25 + (0.5 - 0.25) / 5
    assert abs(m.pos[0] / 100 / 65536 - want) < 0.001


def test_an_empty_slot_does_nothing():
    m = Modulation()
    m.write(0x20, slot(mod.NONE, mod.POS, RANGE_100))
    m.routing(3 << 20)
    m.frames_m1 = [100, 100]
    for _ in range(4):
        m.step([20000, 20000, 0, 0])
    assert m.pos == [0, 0]


def test_an_empty_jack_is_exactly_zero_until_a_real_signal_appears():
    m = Modulation()
    for _ in range(600):
        m.step([400, 0, 0, 0])          # 100 mV: an offset, not a signal
    assert m.sources[mod.CV1] == 0
    m.routing(1 << 20)                  # the switch says it is patched
    m.step([400, 0, 0, 0])
    assert m.sources[mod.CV1] != 0
    m.routing(0)
    for _ in range(600):
        m.step([800, 0, 0, 0])          # 200 mV: real, whatever the switch says
    assert abs(m.sources[mod.CV1] - 800 * 4) < 8


def test_a_steady_cv_settles_within_a_tenth_of_a_cent():
    m = Modulation()
    m.routing(3 << 20)
    for x in (4000, -4000, 4003, 12345, -12345, 7):
        for _ in range(1000):
            m.step([x, 0, 0, 0])
        assert abs(m.sources[mod.CV1] - x * 4) <= 1, x


def test_the_cv_follows_fast_changes():
    m = Modulation()
    m.routing(3 << 20)
    for _ in range(100):
        m.step([4000, 0, 0, 0])
    assert m.sources[mod.CV1] > 3000 * 4, "about a millisecond"


def test_mix_crossfades_and_outputs_pick():
    m = Modulation()
    m.routing(mod.OUT_MIX | mod.OUT_L1 << 4 | mod.OUT_L2 << 8 | mod.OUT_OFF << 12)
    m.write(0x38, 0)
    m.acc = list(m.base)
    m.finish()
    assert m.mix(1000, -1000) == [1000, 1000, -1000, 0]
    m.write(0x38, ONE)
    m.acc = list(m.base)
    m.finish()
    assert m.mix(1000, -1000)[0] == -1000
    m.write(0x38, ONE // 2)
    m.acc = list(m.base)
    m.finish()
    assert m.mix(1000, 3000)[0] == 2000
    assert m.mix(32767, 32767)[0] == 32767, "never past full scale"


def test_outputs_carry_envelopes_and_lfos_at_5_volts():
    m = Modulation()
    m.routing(mod.OUT_ENV1 | mod.OUT_ENV2 << 4 | mod.OUT_LFO1 << 8 | mod.OUT_LFO3 << 12)
    m.sources[ENV1] = FULL
    m.sources[mod.ENV2] = FULL // 2
    m.sources[LFO1] = -FULL
    m.sources[mod.LFO3] = FULL // 4
    assert m.mix(0, 0) == [20000, 10000, -20000, 5000], "4 DAC counts to the mV"


def test_an_output_with_a_nonsense_selection_is_silent():
    m = Modulation()
    m.routing(0xF | 9 << 4)
    assert m.mix(100, 100)[:2] == [0, 0]


def test_hold_stays_at_the_top():
    words = env_words(delay=1, attack=1, hold=200, decay=1000)
    levels, stages = run_env(words, lambda i: True, 100)
    assert HOLD in stages and DECAY not in stages[:100]
    assert levels[50] == ONE


def test_attack_is_not_shortened_by_a_retrigger_during_delay():
    words = env_words(delay=100, attack=100)
    levels, stages = run_env(words, lambda i: i < 50 or i >= 51, 400)
    assert stages[51] == DELAY
    assert levels[51 + 99] == 0
    assert levels[51 + 100 + 99] == ONE
    assert stages[51 + 98] == DELAY
    assert stages[51 + 99] == ATTACK
