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
stale memory), so they are first checked to really hold the frames, independently of either. Their
band-limited levels are checked against the model's own making of them, where they were finished.
The parameters are derived here from the rules in `cpu/src/modulation.rs`, `patch.rs` and
`presets.rs`, not read from the firmware, so a mistake in its arithmetic shows too. `--patch` names
what the simulation's encoder events did to the default patch: see PATCHES, and PRESETS for the factory
bank's, which take these keys (with `keygap=600000`), for the first of them:

    enc=140000000:HLPRRRRRRRRPP

The harness records the inputs each sample used and the state a model can't work out for itself
when it was offered (`trace.raw`), so the check starts from the state at a chosen moment: the first
rising gate after the edits have landed. The CVs' smoothing is replayed from the very start.
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
from model.modulation import Modulation  # noqa: E402
from model.patchfile import (CLEAN, FM, PD, RAW, RING, STEPS, a_layer, configure, default_patch, env_words, lfo_words,  # noqa: E402
                             parse, slot_word)
from model.wavescan import CLAMP, MIRROR, WRAP, Layer, both, mip_rows, pack_frames  # noqa: E402

DUMP_BASE = 0x800000

TRACE = np.dtype([
    ("adc", "<u2", 4), ("phase", "<u4", 2), ("lfo_phase", "<u4", 3), ("env_level", "<u4", 2),
    ("max_level", "<u2", 2), ("lfo_held", "<i4", 3), ("lfsr", "<u4"), ("pos", "<i4", 2)])

def vca_and_loops(p):
    """Through the screens: envelope 1 closes both VCAs and loops while its gate is high, envelope
    2 runs free, LFO 1 restarts on gate 1 and tilts layer 2 by 2.5%. Then the patch is saved to
    patch 1, layer 1's level is turned down on the Mixer screen, and patch 1 is loaded again,
    so what plays after that is the patch as saved. (Without the spaces; with `keygap=600000`
    these take about 4.2 s to play.)

        enc=<after boot>:HRRRP P RRRRRRPRP RRPRRRP RRRRRP RP RRRRRRPRRP RRRRRRRP RP RRRRRPRP
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


# The tables made at boot, by number (`fw/src/tables.rs`).
MORPH, PULSE, VOWELS, FM_BELL, HARMONICS, CRUSH, SWARM = 0, 1, 2, 3, 8, 9, 10
V_OCT = [slot_word(mod.CV1, mod.PITCH, 100), slot_word(mod.CV1, 4 + mod.PITCH, 100)]
HEAR_OSC2 = {"outs": [mod.OUT_MIX, mod.OUT_MIX, mod.OUT_ENV1, mod.OUT_ENV2], "balance": 1000}


def preset(**kw):
    def apply(p):
        p["slots"] = list(V_OCT)
        p.update(kw)
        if "depth" in kw:
            del p["depth_word"]
    return apply


# The factory bank, derived here from what `cpu/src/presets.rs` says each should be, in its own terms.
PRESETS = [
    preset(layers=[a_layer(table=VOWELS, edge=WRAP), a_layer(table=VOWELS, edge=MIRROR, semitones=-12)],
           lfo=[lfo_words(40, mod.TRI, sync=1), lfo_words(72, mod.TRI), lfo_words(37, mod.SQUARE)],
           slots=V_OCT + [slot_word(mod.LFO1, mod.POS, 150), slot_word(mod.LFO1, 4 + mod.POS, 150)],
           outs=[mod.OUT_MIX, mod.OUT_L2, mod.OUT_ENV1, mod.OUT_ENV2]),
    preset(layers=[a_layer(table=MORPH, position=0, semitones=19), a_layer(table=MORPH, position=0)],
           cross=FM, depth=400, vca=[1, 2],
           env=[env_words(1, attack=0, decay=62, sustain=0, release=62, curves=(0, 100, 100), loop=mod.LOOP_FREE),
                env_words(1, attack=0, decay=86, sustain=0, release=86, curves=(0, 100, 100), loop=mod.LOOP_FREE)],
           **HEAR_OSC2),
    preset(layers=[a_layer(table=MORPH, position=0, semitones=7), a_layer(table=HARMONICS)],
           cross=RING, depth=1000,
           lfo=[lfo_words(46, mod.SINE, sync=1), lfo_words(72, mod.TRI), lfo_words(37, mod.SQUARE)],
           slots=V_OCT + [slot_word(mod.LFO1, 4 + mod.POS, 50)],
           **HEAR_OSC2),
    preset(layers=[a_layer(table=PULSE, semitones=-24), a_layer(table=FM_BELL)],
           cross=RING, depth=500, am=True,
           lfo=[lfo_words(53, mod.SINE), lfo_words(72, mod.TRI, sync=2), lfo_words(37, mod.SQUARE)],
           slots=V_OCT + [slot_word(mod.LFO2, mod.CROSS, 50, am=True), slot_word(mod.CV2, 4 + mod.POS, 100)],
           **HEAR_OSC2),
    preset(layers=[a_layer(table=MORPH, position=333), a_layer(table=MORPH, position=0)],
           cross=PD, depth=80,
           lfo=[lfo_words(32, mod.SINE, unipolar=1, sync=1), lfo_words(72, mod.TRI), lfo_words(37, mod.SQUARE)],
           slots=V_OCT + [slot_word(mod.LFO1, mod.CROSS, 40)],
           **HEAR_OSC2),
    preset(layers=[a_layer(table=VOWELS, level=0, grain=1, semitones=-12), a_layer(table=FM_BELL, level=0, grain=2)],
           lfo=[lfo_words(64, mod.SINE, unipolar=1, phase=270), lfo_words(68, mod.SINE, unipolar=1, phase=270),
                lfo_words(29, mod.TRI)],
           slots=V_OCT + [slot_word(mod.LFO1, mod.LEVEL, 100), slot_word(mod.LFO2, 4 + mod.LEVEL, 100),
                          slot_word(mod.LFO3, mod.POS, 40), slot_word(mod.LFO3, 4 + mod.POS, -30),
                          slot_word(mod.CV2, mod.POS, 50), slot_word(mod.CV2, 4 + mod.POS, 50)],
           outs=[mod.OUT_MIX, mod.OUT_MIX, mod.OUT_ENV1, mod.OUT_ENV2]),
    preset(layers=[a_layer(table=SWARM, edge=MIRROR), a_layer(table=SWARM, edge=MIRROR, semitones=7)],
           lfo=[lfo_words(53, mod.SINE), lfo_words(72, mod.TRI), lfo_words(37, mod.SINE)],
           slots=V_OCT + [slot_word(mod.LFO3, mod.SHIFT, 50), slot_word(mod.LFO3, 4 + mod.SHIFT, -50)]),
    preset(layers=[a_layer(table=CRUSH, read=RAW, position=0), a_layer(table=PULSE, read=STEPS, semitones=-12, position=0)],
           env=[env_words(1, attack=44, decay=44, sustain=0, release=28, curves=(0, 0, 0), loop=mod.LOOP_FREE),
                env_words(2)],
           slots=V_OCT + [slot_word(mod.ENV1, mod.POS, 100), slot_word(mod.ENV1, 4 + mod.POS, 100)]),
]

PATCHES = {"default": lambda p: None, "vca_and_loops": vca_and_loops} | {
    f"preset{i + 1}": apply for i, apply in enumerate(PRESETS)}


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
    parser.add_argument("--patch-file", help="what plays is this patch file, loaded from the drive through the Browser")
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

    patch = default_patch()
    PATCHES[args.patch](patch)
    wanted = [None, None]
    if args.patch_file:
        f = parse(Path(args.patch_file).read_bytes())
        assert f.skipped == 0, f"line {f.first_skipped} of {args.patch_file}"
        patch = f.patch
        # As the firmware names a table: built in by its own name, else its file's first letters.
        wanted = [Path(t).stem.upper() if t else None for t in f.tables]
        print(f"{f.name}: tables {f.tables}")

    ok = True
    mem = {}
    layers = []
    for i, spec in enumerate(patch["layers"]):
        chosen = tables[spec["table"]]
        if i == 0 and args.osc1:
            chosen = next(t for t in tables if t[0] == args.osc1)
        if wanted[i]:
            chosen = [t for t in tables if t[0].replace(" ", "") == wanted[i].replace(" ", "")][-1]
        name, frames, length, offset = chosen
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

        # The levels, if the firmware finished them: the model makes them too, and they must agree.
        logged = re.search(rf"levels: table \d+ at {hex(offset)}\b", uart)
        if logged:
            made = psram[start + frames * length:start + 2 * frames * length]
            want = np.array(mip_rows(rows), dtype=np.int16).reshape(-1)
            differ = int(np.count_nonzero(made != want))
            print(f"{name}: levels finished, {differ} of {len(want)} samples differ from the model's")
            if differ:
                print(f"  FAIL: first at {int(np.nonzero(made != want)[0][0])}")
                ok = False
            mem |= pack_frames([made[f * length:(f + 1) * length].tolist() for f in range(frames)],
                               base_word=offset // 4 + frames * length // 2)
        else:
            print(f"{name}: its levels weren't finished in this run")
        layers.append(Layer(table_base=offset // 256, frame_log2=int(math.log2(length)), frames=frames,
                            edge=spec["edge"], stepped=int(spec["read"] >= STEPS), raw=int(spec["read"] == RAW)))

    m = Modulation()
    configure(m, patch, layers)

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
        lfo.held = int(trace["lfo_held"][n0 - 1][k])
    m.lfsr = int(trace["lfsr"][n0 - 1])
    for i in range(2):
        m.pos[i] = int(trace["pos"][n0 - 1][i])
    phases = trace["phase"]

    # A free envelope with no rising gate yet has an unknown state: its output is checked once
    # it has restarted (gate 2's first rise from here).
    gate2 = adc[:, 3] >= mod.GATE_HIGH
    rises2 = np.nonzero(gate2[1:] & ~gate2[:-1])[0] + 1
    rises2 = rises2[rises2 >= n0]
    known_from = {0: n0, 1: int(rises2[0]) if len(rises2) else n0}
    if patch["env"][1][0] >> 2 & 3 != mod.LOOP_FREE or patch["env"][1][0] & 1:
        known_from[1] = n0

    fails = [0, 0, 0, 0]
    first = [None] * 4
    levels_seen = [set(), set()]
    switches = []
    for layer, phase in zip(layers, phases[n0]):
        layer.phase = int(phase)
    for i in range(n0, n):
        if i == known_from[1] and i != n0:
            # (a free envelope's level until now was unknown here; it restarts from it)
            m.envs[1].level = int(trace["env_level"][i - 1][1])
        for k, layer in enumerate(layers):
            layer.max_level = int(trace["max_level"][i][k])
        m.step(adc[i].tolist())
        m.apply(layers)
        for k, layer in enumerate(layers):
            levels_seen[k].add(layer.max_level)
        l1, l2 = both(layers, mem, m.cross())
        want = m.mix(l1, l2)
        # A table's levels come on when the firmware writes its register, and the trace gives the value
        # as this sample was offered. If that write landed while the sample was being worked out, it
        # was worked out with the old value: at that one sample either is right, and no other.
        before = trace["max_level"][i - 1]
        if (before != trace["max_level"][i]).any():
            if list(audio[i]) != want:
                for k, layer in enumerate(layers):
                    layer.max_level = int(before[k])
                l1, l2 = both(layers, mem, m.cross())
                want = m.mix(l1, l2)
                for k, layer in enumerate(layers):
                    layer.max_level = int(trace["max_level"][i][k])
                switches.append((i, "before the write"))
            else:
                switches.append((i, "after the write"))
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
    print(f"levels available through the run: osc 1 {sorted(levels_seen[0])}, osc 2 {sorted(levels_seen[1])}")
    for at, when in switches:
        print(f"levels came on at sample {at}, worked out {when}")
    for c in range(4):
        name = ["out 0", "out 1", "out 2", "out 3"][c]
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
