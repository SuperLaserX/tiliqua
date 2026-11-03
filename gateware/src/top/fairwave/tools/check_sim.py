"""Checks a whole-SoC simulation (fairwave/socsim.py) against the models, bit for bit.

    FAIRWAVE_SIM_ARGS="cycles=150000000 dump=0x800000,0x40000 pulse=2,0,5000,4800,2400,72000 ..." \
        python src/top/fairwave/top.py sim --name FAIRWAVE-SIM --modeline 720x720p60proto1
    python src/top/fairwave/tools/check_sim.py build/fairwave-sim/out [--patch NAME]

(`--name` gives the simulation's firmware, which differs a little from the hardware's,
its own build directory, so it can't end up in the archive you flash.)

The firmware has built its tables and written the patch, and the gateware has played them
through the DAC stream, all four outputs. Here the tables are read back from the simulated
PSRAM, and the models play the same patch from the same inputs: any difference is a bug
somewhere along that path.

Reading the tables back would hide a missing cache flush (model and engine would agree on
stale memory), so they are first checked to really hold the frames, independently of either.
The parameters are derived here from the rules in `cpu/src/modulation.rs` and `patch.rs`, not
read from the firmware, so a mistake in its arithmetic shows too. `--patch` names what the
simulation's encoder events did to the default patch: see PATCHES.

The harness records the inputs each sample used and the phases and levels when it was offered
(`trace.raw`), so the check starts from the state at a chosen moment: the first rising gate
after the edits have landed. The CVs' smoothing is replayed from the very start.
"""

import argparse
import math
import re
import sys
from pathlib import Path

HERE = Path(__file__).resolve().parent
sys.path.insert(0, str(HERE.parent))

import numpy as np  # noqa: E402

from model import modulation as mod  # noqa: E402
from model.modulation import FULL, ONE, Modulation  # noqa: E402
from model.wavescan import Layer, pack_frames, sample  # noqa: E402

FS = 48000
DUMP_BASE = 0x800000
RATIO = [65536, 71468, 77936, 84990, 92682, 101070, 110218, 120194]

TRACE = np.dtype([
    ("adc", "<u2", 4), ("phase", "<u4", 2), ("lfo_phase", "<u4", 3), ("env_level", "<u4", 2)])


def time_samples(index):
    if index == 0:
        return 1
    i = index - 1
    return ((FS // 1000) * RATIO[i % 8] << (i // 8)) >> 16


def segment_rate(samples):
    return ((1 << 32) + samples - 1) // samples & 0xFFFFFFFF


def rate_word(index):
    base = (1 << 48) // 100 // FS
    return (base * RATIO[index % 8] << (index // 8)) >> 32


def curve_bits(curve):
    return int(-curve * 256 / 100) & 0x3FF


def env_words(gate, delay=0, attack=28, hold=0, decay=62, sustain=70, release=67, curves=(0, 50, 50), loop=0):
    rate = lambda i: segment_rate(time_samples(i))  # noqa: E731
    return [gate | loop << 2, rate(delay), rate(attack), rate(hold), rate(decay), sustain * ONE // 100,
            rate(release), sum(curve_bits(c) << (10 * i) for i, c in enumerate(curves))]


def lfo_words(rate, shape, unipolar=0, phase=0, level=100, sync=0):
    return [rate_word(rate), phase * 65536 // 360 | shape << 16 | unipolar << 19 | sync << 20, FULL * level // 100]


def slot_word(src, dest, percent):
    scale = 67108864 if dest in (mod.PITCH, 4 + mod.PITCH) else 13421773
    half = -50000 if percent < 0 else 50000
    amount = int((percent * scale + half) / 100000)
    return (amount & 0x3FFFF) | src << 18 | dest << 21


def default_patch():
    return {
        "env": [env_words(1), env_words(2)],
        "lfo": [lfo_words(53, mod.SINE), lfo_words(72, mod.TRI), lfo_words(37, mod.SQUARE)],
        "slots": [slot_word(mod.CV1, mod.PITCH, 100), slot_word(mod.CV1, 4 + mod.PITCH, 100),
                  slot_word(mod.CV2, mod.POS, 100), slot_word(mod.CV2, 4 + mod.POS, 100)],
        "outs": [mod.OUT_L1, mod.OUT_L2, mod.OUT_ENV1, mod.OUT_ENV2],
        "vca": [0, 0],
        "balance": 500,
    }


def vca_and_loops(p):
    """Through the screens: envelope 1 closes both VCAs and loops while its gate is high, envelope
    2 runs free, LFO 1 restarts on gate 1 and tilts layer 2 by 2.5%. Then the patch is saved to
    patch 1, layer 1's level is turned down on the Mixer screen, and patch 1 is loaded again,
    so what plays after that is the patch as saved. (Without the spaces; with `keygap=600000`
    these take about 4.2 s to play.)

        enc=<after boot>:HRRP P RRRRRRPRP RRPRRRP RRRRRP RP RRRRRRPRRP RRRRRRRP RP RRRRRPRP
                         HRP RRRRRRRRRRRRPRRRRRP RPRRRRRRP RPRRRRRP
                         HRRRP PP
                         HLLP RRRRRPLLLLLLLLLLLLLLLLLLLLP
                         HRRP PP

    A second run can then start from what the first one saved, with no keys at all:
    `dump=0x800000,0x700000` on the first, the last 64 KB of its window of PSRAM (from offset
    0x6F0000 of `psram.bin`) in a file, and `load=<that file>,0xEF0000` on the second.
    """
    p["vca"][0] = 3
    p["env"][0] = env_words(1, loop=mod.LOOP_GATED)
    p["env"][1] = env_words(2, loop=mod.LOOP_FREE)
    p["lfo"][0] = lfo_words(53, mod.SINE, sync=1)
    p["slots"].append(slot_word(mod.LFO1, 4 + mod.SHIFT, 2.5))


PATCHES = {"default": lambda p: None, "vca_and_loops": vca_and_loops}


def parse_tables(uart):
    """(name, frames, samples per frame, offset) as the firmware logged them."""
    pattern = r"table (.+?): (\d+) frames of (\d+) samples at (0x[0-9a-f]+)"
    return [(m[0], int(m[1]), int(m[2]), int(m[3], 16)) for m in re.findall(pattern, uart)]


def s16(a):
    return (a.astype(int) + 0x8000) % 0x10000 - 0x8000


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("out")
    parser.add_argument("--patch", default="default", choices=PATCHES)
    parser.add_argument("--osc1", help="oscillator 1 plays this table, one loaded from the drive")
    parser.add_argument("--settled", type=int, default=0,
                        help="start no earlier than this sample: when the encoder's edits are done")
    args = parser.parse_args()

    out = Path(args.out)
    uart = (out / "uart.txt").read_text(errors="replace")
    audio = np.fromfile(out / "audio.raw", dtype="<i2").reshape(-1, 4).astype(int)
    trace = np.fromfile(out / "trace.raw", dtype=TRACE)
    psram = np.fromfile(out / "psram.bin", dtype="<i2")
    tables = parse_tables(uart)
    n = min(len(audio), len(trace))
    print(f"{n} audio frames; tables: {tables}")
    assert len(tables) >= 2, "the firmware should have logged two tables"

    ok = True
    mem = {}
    layers = []
    chosen = tables[:2]
    if args.osc1:
        chosen[0] = next(t for t in tables if t[0] == args.osc1)
    for name, frames, length, offset in chosen:
        start = (offset - DUMP_BASE) // 2
        body = psram[start:start + frames * length]
        # Every frame must really have reached PSRAM: a dirty cache leaves zeros.
        peaks = [int(np.abs(body[f * length:(f + 1) * length].astype(int)).max()) for f in range(frames)]
        print(f"{name}: frame peaks {min(peaks)} to {max(peaks)}")
        if min(peaks) < 14000:
            print(f"  FAIL: a frame of {name} didn't reach PSRAM (peak {min(peaks)})")
            ok = False
        rows = [body[f * length:(f + 1) * length].tolist() for f in range(frames)]
        mem |= pack_frames(rows, base_word=offset // 4)
        layers.append(Layer(table_base=offset // 256, frame_log2=int(math.log2(length)), frames=frames))

    patch = default_patch()
    PATCHES[args.patch](patch)

    m = Modulation()
    for i, w in enumerate(patch["env"][0] + patch["env"][1]):
        m.write(i, w)
    for k, words in enumerate(patch["lfo"]):
        for w, value in enumerate(words):
            m.write(0x10 + k * 4 + w, value)
    for i, word in enumerate(patch["slots"]):
        m.write(0x20 + i, word)
    # The default layers: half way through, no tilt, full level, a table each.
    for at in (0, 4):
        m.write(0x30 + at + mod.POS, 500 * ONE // 1000)
        m.write(0x30 + at + mod.LEVEL, ONE)
    m.write(0x30 + mod.BALANCE, patch["balance"] * ONE // 1000)
    m.routing(sum(s << (4 * i) for i, s in enumerate(patch["outs"])) | patch["vca"][0] << 16 | patch["vca"][1] << 18)
    m.frames_m1 = [layers[0].frames - 1, layers[1].frames - 1]

    adc = s16(trace["adc"])

    # From the first rising gate after the edits: every envelope's state is then known from
    # its level (a rising gate restarts it), and an LFO's from its phase.
    gate = adc[:, 2] >= mod.GATE_HIGH
    rises = np.nonzero(gate[1:] & ~gate[:-1])[0] + 1
    rises = rises[rises > args.settled]
    if len(rises) == 0:
        print("FAIL: no rising gate to start from")
        return 1
    n0 = int(rises[0])
    print(f"starting at sample {n0}, the first rising gate after sample {args.settled}")

    # The CVs' state and the gates, replayed from the start.
    for i in range(n0):
        m.inputs(adc[i].tolist())
    for e, env in enumerate(m.envs):
        env.level = int(trace["env_level"][n0 - 1][e])
        env.start = env.level
        if patch["env"][e][0] >> 2 & 3 == mod.LOOP_FREE and not (patch["env"][e][0] & 1):
            print(f"envelope {e + 1} runs free of gate 1: compared only after its own first rise")
    for k, lfo in enumerate(m.lfos):
        lfo.phase = int(trace["lfo_phase"][n0 - 1][k])
    phases = trace["phase"]

    # A free envelope with no rising gate yet has an unknown state: its output is checked once
    # it has restarted (gate 2's first rise from here).
    gate2 = adc[:, 3] >= mod.GATE_HIGH
    rises2 = np.nonzero(gate2[1:] & ~gate2[:-1])[0] + 1
    rises2 = rises2[rises2 >= n0]
    known_from = {0: n0, 1: int(rises2[0]) if len(rises2) else n0}
    if patch["env"][1][0] >> 2 & 3 != mod.LOOP_FREE:
        known_from[1] = n0

    fails = [0, 0, 0, 0]
    first = [None] * 4
    for layer, phase in zip(layers, phases[n0]):
        layer.phase = int(phase)
    for i in range(n0, n):
        if i == known_from[1]:
            # (a free envelope's level until now was unknown here; it restarts from it)
            m.envs[1].level = int(trace["env_level"][i - 1][1])
        m.step(adc[i].tolist())
        m.apply(layers)
        l1, l2 = sample(layers[0], mem), sample(layers[1], mem)
        want = m.mix(l1, l2)
        for c in range(4):
            sel = patch["outs"][c]
            if sel == mod.OUT_ENV2 and i < known_from[1]:
                continue
            if want[c] != audio[i][c]:
                fails[c] += 1
                if first[c] is None:
                    first[c] = (i, int(audio[i][c]), want[c])
        for layer in layers:
            layer.phase = (layer.phase + layer.inc) & 0xFFFFFFFF
    for c in range(4):
        name = ["out 1", "out 2", "env out 1", "env out 2"][c]
        if fails[c]:
            print(f"{name}: FAIL, {fails[c]} samples differ; first at {first[c][0]}: "
                  f"audio {first[c][1]}, models {first[c][2]}")
            ok = False
        else:
            lo, hi = int(audio[n0:n, c].min()), int(audio[n0:n, c].max())
            print(f"{name}: {n - n0} samples match the models exactly (from {lo} to {hi} counts)")

    print("PASS" if ok else "FAILED")
    return 0 if ok else 1


if __name__ == "__main__":
    sys.exit(main())
