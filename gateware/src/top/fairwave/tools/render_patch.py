"""Plays a patch file through the models, the same arithmetic the gateware has bit for bit, and writes
what comes out as a WAV to listen to on a computer: for trying a sound without flashing anything.

    python src/top/fairwave/tools/render_patch.py "library/FAIRWAVE/ROLLING/Psy Snap.fwp" -o snap.wav

Outputs `out0` and `out1` are left and right, in DAC counts, so 5 V is 20000 of 32768. `--play` picks
what the inputs do: `riff` sends notes down CV 1 and gates to gate 1, `free` holds one note with no gates
(for a sound that runs by itself), `long` is slow held notes, and `hold` one note with its gate up throughout. A built-in table needs `--built-in`, a folder
of them as `FAIRWAVE_TABLES_OUT=... cargo test dump_the_built_in_tables` writes.
"""

import argparse
import struct
import sys
from pathlib import Path

HERE = Path(__file__).resolve().parent
sys.path.insert(0, str(HERE.parent))

import numpy as np  # noqa: E402

from model.modulation import Modulation  # noqa: E402
from model.patchfile import CLEAN, configure, layers_for, parse, read_wav  # noqa: E402
from model.wavescan import advance, both, pack_frames, pack_table  # noqa: E402

FS = 48000
LIBRARY = HERE.parent / "library" / "FAIRWAVE"
VOLT = 4000     # DAC counts
HIGH = 5 * VOLT

# Semitones from 0 V, a step each.
RIFF = [0, 0, 12, 0, 3, 0, 7, -2, 0, 0, 12, 0, 5, 3, -2, -5]


def inputs(play, n, bpm=125):
    """(cv1, gate1) for each of `n` samples."""
    cv, gate = np.zeros(n, int), np.zeros(n, int)
    if play == "riff":
        step = int(FS * 60 / bpm / 2)
        for i in range(0, n, step):
            note = RIFF[(i // step) % len(RIFF)]
            cv[i:i + step] = note * VOLT // 12
            gate[i:i + step * 5 // 8] = HIGH
    elif play == "long":
        step = FS * 2
        for k, i in enumerate(range(0, n, step)):
            cv[i:i + step] = [0, 3, 7, 12][k % 4] * VOLT // 12
            gate[i:i + step * 7 // 8] = HIGH
    elif play == "hold":
        gate[:] = HIGH
    elif play == "free":
        step = FS * 2
        for k, i in enumerate(range(0, n, step)):
            cv[i:i + step] = [0, 3][k % 2] * VOLT // 12
    else:
        raise SystemExit(f"--play {play}?")
    return cv, gate


def find_table(name, patch_dir, built_in):
    for base in (patch_dir, LIBRARY):
        p = base / name
        if p.is_file():
            return read_wav(p.read_bytes())
    if built_in:
        p = Path(built_in) / f"{name}.raw"
        if p.is_file():
            samples = np.fromfile(p, dtype="<i2").tolist()
            length = int((Path(built_in) / f"{name}.len").read_text())
            return [samples[i:i + length] for i in range(0, len(samples), length)]
    raise SystemExit(f"no table {name!r} (a built-in table needs --built-in)")


def render(path, seconds, play, built_in=None, default_tables=("MORPH 2048", "PULSE 256")):
    f = parse(Path(path).read_bytes())
    assert f.skipped == 0, f"{path}: line {f.first_skipped} isn't understood"
    patch = f.patch
    mem = {}
    tables = []
    frames_of = {}
    next_base = 0x8000
    for i in range(2):
        name = f.tables[i] or default_tables[i]
        wanted = (name, f.frame_log2[i])
        if wanted not in frames_of:
            frames = find_table(name, Path(path).parent, built_in)
            if f.frame_log2[i]:
                samples = [s for frame in frames for s in frame]
                length = 1 << f.frame_log2[i]
                frames = [samples[k:k + length] for k in range(0, len(samples) - length + 1, length)]
            frames_of[wanted] = (next_base, frames)
            # (only a CLEAN read looks at a table's levels, and they take a long table a long time)
            clean = any(p["read"] == CLEAN and (f.tables[k] or default_tables[k], f.frame_log2[k]) == wanted
                        for k, p in enumerate(patch["layers"]))
            mem |= (pack_table if clean else pack_frames)(frames, base_word=next_base << 6)
            next_base += len(frames) * len(frames[0]) * 4 // 256 + 1
        tables.append(frames_of[wanted])
    layers = layers_for(patch, tables)
    m = Modulation()
    configure(m, patch, layers)
    m.patched = 1

    n = int(seconds * FS)
    cv, gate = inputs(play, n)
    out = np.zeros((n, 4), dtype=np.int32)
    cross = None
    for i in range(n):
        m.step([int(cv[i]), 0, int(gate[i]), 0])
        m.apply(layers)
        cross = m.cross()
        l1, l2 = both(layers, mem, cross)
        out[i] = m.mix(l1, l2)
        for layer in layers:
            advance(layer)
    return out, f


def write_wav(path, left, right):
    data = np.stack([left, right], axis=1).clip(-32768, 32767).astype("<i2").tobytes()
    fmt = struct.pack("<HHIIHH", 1, 2, FS, FS * 4, 4, 16)
    body = b"fmt " + struct.pack("<I", len(fmt)) + fmt + b"data" + struct.pack("<I", len(data)) + data
    Path(path).write_bytes(b"RIFF" + struct.pack("<I", 4 + len(body)) + b"WAVE" + body)


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("patch")
    parser.add_argument("-o", "--out", required=True)
    parser.add_argument("--seconds", type=float, default=8)
    parser.add_argument("--play", default="riff", choices=["riff", "free", "long", "hold"])
    parser.add_argument("--built-in", help="a folder of the built-in tables")
    args = parser.parse_args()
    out, f = render(args.patch, args.seconds, args.play, args.built_in)
    write_wav(args.out, out[:, 0], out[:, 1])
    print(f"{f.name or args.patch}: peak {np.abs(out[:, :2]).max()} counts of 32768 -> {args.out}")


if __name__ == "__main__":
    sys.exit(main())
