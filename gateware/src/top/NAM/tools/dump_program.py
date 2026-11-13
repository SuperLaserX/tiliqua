"""Writes the engine's tables for a profile, for the firmware's tests.

    python src/top/NAM/tools/dump_program.py [profile.nam] [out dir]      (from gateware/)

For each A2 network in the file (Lite, Full) a `.bin` with everything the
firmware has to produce from the same file, bit for bit: the program's
segments, the ring table entries and stream positions as encoded for the
gateware, the stream geometry, the weight memory rows and the aux memory.
`cpu/src/program.rs`'s tests read them. Little-endian throughout.

    "NAMG" u32 version=2
    u32 channels, n_segments, n_rings, n_streams, n_rows, n_aux, psram_base_words, burst_frames
    u32 wpf_log2, burst_log2, ring_log2
    segments: n_segments x (u32 lo, u32 mid, u32 hi)      the 72-bit segment
    rings:    n_rings x u64                               the 46-bit entry
    streams:  n_streams x (u32 index, u32 position)       position-table entries
    rows:     n_rows x 8 x i32
    aux:      n_aux x i32
"""

import os
import struct
import sys

HERE = os.path.dirname(os.path.realpath(__file__))
sys.path.insert(0, os.path.join(HERE, ".."))

from model import a2, fixed, program  # noqa: E402
from nam.engine import encode_pos, encode_ring  # noqa: E402

PSRAM_LAYERS = (5, 6, 12, 13, 21, 22)
PSRAM_RINGS_BASE = 0x800000      # bytes; NamSoc.PSRAM_RINGS_BASE
BURST_FRAMES = 4


def dump(w, path):
    fmt = fixed.Formats(z_split=6, psram_layers=PSRAM_LAYERS, psram_bits=16, psram_frac=11)
    q = fixed.quantise(w, fmt)
    prog = program.build(q, psram_layers=PSRAM_LAYERS, burst_frames=BURST_FRAMES,
                         psram_base=PSRAM_RINGS_BASE // 4)
    rows = prog.meta["rows"]
    out = bytearray(b"NAMG" + struct.pack("<I", 2))
    out += struct.pack("<8I", w.channels, len(prog.segments), len(prog.rings), len(prog.streams),
                       rows, program.AUX_WORDS, PSRAM_RINGS_BASE // 4, BURST_FRAMES)
    out += struct.pack("<3I", prog.meta["wpf_log2"], prog.meta["burst_log2"], prog.meta["ring_log2"])
    for s in prog.segments:
        out += struct.pack("<3I", s & 0xFFFFFFFF, (s >> 32) & 0xFFFFFFFF, s >> 64)
    for r in prog.rings:
        out += struct.pack("<Q", encode_ring(r))
    for s in prog.streams:
        out += struct.pack("<2I", s.pos_index, encode_pos(s))
    for r in range(rows):
        out += struct.pack("<8i", *[int(v) for v in prog.wmem[r]])
    out += struct.pack(f"<{program.AUX_WORDS}i", *[int(v) for v in prog.aux])
    with open(path, "wb") as f:
        f.write(out)
    print(f"{path}: {w.channels} channels, {len(prog.segments)} segments, {rows} rows, "
          f"{len(prog.streams)} streams, {len(out)} bytes; lin_frac {q.lin_frac}, head_frac {q.head_frac}, "
          f"y_frac {q.y_frac}")


if __name__ == "__main__":
    nam_path = sys.argv[1] if len(sys.argv) > 1 else os.path.join(
        HERE, "..", "NeuralAmpModelerCore", "example_models", "A2.nam")
    out_dir = sys.argv[2] if len(sys.argv) > 2 else os.path.join(HERE, "..", "cpu", "golden")
    os.makedirs(out_dir, exist_ok=True)
    for w in a2.load_nam(nam_path):
        dump(w, os.path.join(out_dir, f"a2_{w.channels}.bin"))
