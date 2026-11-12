"""The program interpreter against the fixed-point model.

    python src/top/NAM/tests/test_program.py          (from gateware/)

Both widths of A2.nam, with the D = 101 and D = 239 layers in PSRAM, on a
short burst of the core's example audio followed by silence: every tap of
every layer is exercised once the receptive field has passed."""

import os
import sys
import time

import numpy as np

HERE = os.path.dirname(os.path.realpath(__file__))
sys.path.insert(0, os.path.join(HERE, ".."))

from model import a2, fixed, program  # noqa: E402

CORE = os.path.join(HERE, "..", "NeuralAmpModelerCore")
PSRAM_LAYERS = (5, 6, 12, 13, 21, 22)


def example_audio(n):
    import wave
    w = wave.open(os.path.join(CORE, "example_audio", "input.wav"))
    raw = np.frombuffer(w.readframes(n), dtype=np.uint8).reshape(n, 3).astype(np.int32)
    v = raw[:, 0] | raw[:, 1] << 8 | raw[:, 2] << 16
    v = np.where(v >= 1 << 23, v - (1 << 24), v)
    return v / float(1 << 23)


def check(w, n=1400, verbose=True):
    fmt = fixed.Formats(z_split=6, psram_layers=PSRAM_LAYERS, psram_bits=16, psram_frac=11)
    q = fixed.quantise(w, fmt)
    prog = program.build(q, psram_layers=PSRAM_LAYERS)
    x = example_audio(48000)[24000:24000 + n]
    x16 = np.clip(np.round(x * 32768), -32768, 32767).astype(np.int64)
    ref = fixed.run_fixed(q, x16, prewarm=False)
    t0 = time.time()
    got = program.Interpreter(prog).run(x16)
    dt = time.time() - t0
    same = np.array_equal(ref, got)
    if verbose:
        m = prog.meta
        print(f"channels {w.channels}: {len(prog.segments)} segments, {m['rows']} weight rows, "
              f"{m['hist_used']} history words, {m['n_streams']} streams, "
              f"buffers {m['sbuf_r']}/{m['sbuf_w']}, PSRAM {m['psram_words'] * 4} bytes; "
              f"{n} samples in {dt:.1f} s; out peak {np.abs(ref).max()}; "
              f"{'MATCH' if same else 'MISMATCH'}")
        if not same:
            bad = np.nonzero(ref != got)[0]
            print("  first differences at", bad[:10], ref[bad[:5]], got[bad[:5]])
    return same


def test_program_matches_fixed():
    for w in a2.load_nam(os.path.join(CORE, "example_models", "A2.nam")):
        assert check(w, n=1300, verbose=False)


if __name__ == "__main__":
    ok = True
    for w in a2.load_nam(os.path.join(CORE, "example_models", "A2.nam")):
        ok &= check(w)
    sys.exit(0 if ok else 1)
