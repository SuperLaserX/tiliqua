"""Holds the firmware's reading of the sound library to the model's, word for word.

    FAIRWAVE_WORDS_OUT=words.txt cargo test every_library_patch       (in cpu/)
    python src/top/fairwave/tools/check_library.py words.txt

The firmware's parser (`cpu/src/patchfile.rs`) and the model's (`model/patchfile.py`) are written apart. So
for every patch in `library/FAIRWAVE`, what each would tell the gateware has to agree, along with the
tables it names. Each also has to name tables that are there, and `read_wav` has to read those.
"""

import sys
from pathlib import Path

HERE = Path(__file__).resolve().parent
sys.path.insert(0, str(HERE.parent))

from model import modulation as mod  # noqa: E402
from model.patchfile import RAW, STEPS, parse, read_wav  # noqa: E402

LIBRARY = HERE.parent / "library" / "FAIRWAVE"
BUILT_IN = {"MORPH 2048", "PULSE 256", "VOWELS", "FM BELL", "CZ RESO", "HARD SYNC", "WAVEFOLD", "PLUCK", "HARMONICS",
            "CRUSH 256", "SWARM"}
ONE = 1 << 16


def words_of(f):
    """What the firmware's dump lists, in its order."""
    p = f.patch
    ctrl = [s["edge"] | int(s["read"] >= STEPS) << 2 | int(s["read"] == RAW) << 3 | s["grain"] << 4 for s in p["layers"]]
    env = [w for e in p["env"] for w in e]
    lfo = [w for k in p["lfo"] for w in k]
    slots = p["slots"] + [0] * (12 - len(p["slots"]))
    base = [0] * mod.N_DESTS
    for i, s in enumerate(p["layers"]):
        at = i * mod.LAYER_DESTS
        base[at + mod.PITCH] = ((s["semitones"] * 100 + s["fine"]) * ONE // 1200) & 0xFFFFFFFF
        base[at + mod.POS] = s["position"] * ONE // 1000
        base[at + mod.SHIFT] = (s["shift"] * ONE // 1000) & 0xFFFFFFFF
        base[at + mod.LEVEL] = s["level"] * 10 * ONE // 1000
    base[mod.BALANCE] = p["balance"] * ONE // 1000
    base[mod.CROSS] = p["depth_word"]
    routing = (sum(s << (4 * i) for i, s in enumerate(p["outs"])) | p["vca"][0] << 16 | p["vca"][1] << 18
               | p["cross"] << 22)
    return ctrl + env + lfo + slots + base + [routing]


def main():
    lines = Path(sys.argv[1]).read_text(encoding="utf-8").splitlines()
    assert lines, "the dump is empty: was FAIRWAVE_WORDS_OUT set?"
    files = {str(p.relative_to(LIBRARY)).replace("\\", "/"): p for p in LIBRARY.rglob("*.fwp")}
    bad = 0
    seen = set()
    for line in lines:
        path, name, about, t0, t1, f0, f1, words = line.split("\t")
        seen.add(path)
        f = parse(files[path].read_bytes())
        ours = (f.name, f.about, f.tables[0], f.tables[1], f.frame_log2[0], f.frame_log2[1])
        theirs = (name, about, t0, t1, int(f0), int(f1))
        if ours != theirs:
            print(f"{path}: {ours} vs the firmware's {theirs}")
            bad += 1
        got = [int(w, 16) for w in words.split()]
        want = words_of(f)
        if got != want:
            at = next(i for i, (a, b) in enumerate(zip(got, want)) if a != b)
            print(f"{path}: word {at} is {got[at]:#x} in the firmware and {want[at]:#x} here")
            bad += 1
        if f.skipped:
            print(f"{path}: line {f.first_skipped} isn't understood")
            bad += 1
        for table in f.tables:
            if not table or table in BUILT_IN:
                continue
            frames = read_wav((LIBRARY / table).read_bytes())
            if len(frames) != 64 or len(frames[0]) != 1024:
                print(f"{path}: {table} is {len(frames)} x {len(frames[0])}")
                bad += 1
    missing = set(files) - seen
    if missing:
        print(f"not in the dump: {sorted(missing)}")
        bad += 1
    print(f"{len(seen)} patches: firmware and model agree on every word" if not bad else f"FAILED: {bad}")
    return 1 if bad else 0


if __name__ == "__main__":
    sys.exit(main())
