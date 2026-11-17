"""Writes `cpu/src/tone_tables.rs`: the tone stack's coefficients for every setting the Tone
screen has (whole dB), as `model/tone.py` makes them, so the firmware writes exactly what the
model and the gateware were tested with.

    python src/top/NAM/tools/tone_tables.py          (from gateware/)
"""

import os
import sys

HERE = os.path.dirname(os.path.realpath(__file__))
sys.path.insert(0, os.path.join(HERE, ".."))

from model import tone  # noqa: E402

OUT = os.path.join(HERE, "..", "cpu", "src", "tone_tables.rs")


def table(name, lo, hi, make, what):
    rows = "\n".join(f"    [{', '.join(str(v) for v in make(db))}], // {db:+d} dB" for db in range(lo, hi + 1))
    return (f"/// {what}, from {lo} to {hi} dB a dB at a time.\n"
            f"pub const {name}: [[i32; 5]; {hi - lo + 1}] = [\n{rows}\n];\n")


def main():
    parts = [
        "//! The tone stack's coefficients: [b0, b1, b2, -a1, -a2] in Q3.23, a section's five words as the\n"
        "//! gateware takes them (`nam/tone.py`). Written by `tools/tone_tables.py` from `model/tone.py`:\n"
        "//! don't edit.\n",
        f"pub const COEF_FRAC: u32 = {tone.COEF_FRAC};\n",
        f"pub const BASS_MIN: i32 = {tone.BASS_DB[0]};\npub const MIDDLE_MIN: i32 = {tone.MIDDLE_DB[0]};\n"
        f"pub const TREBLE_MIN: i32 = {tone.TREBLE_DB[0]};\n",
        table("BASS", *tone.BASS_DB, tone.bass, "The bass: a low shelf at 150 Hz, Q 0.707"),
        table("MIDDLE", *tone.MIDDLE_DB, tone.middle, "The middle: a peak at 425 Hz, Q 1.5 cutting and 0.7 boosting"),
        table("TREBLE", *tone.TREBLE_DB, tone.treble, "The treble: a high shelf at 1800 Hz, Q 0.707"),
        f"/// The DC blocker: a first-order high pass at {tone.DC_HZ} Hz.\n"
        f"pub const DC_BLOCKER: [i32; 5] = [{', '.join(str(v) for v in tone.dc_blocker())}];\n",
        f"/// A section that passes the signal (EQ off).\npub const IDENTITY: [i32; 5] = "
        f"[{', '.join(str(v) for v in tone.IDENTITY)}];\n",
    ]
    with open(OUT, "w", encoding="utf-8", newline="\n") as f:
        f.write("\n".join(parts))
    print(f"wrote {os.path.normpath(OUT)}")


if __name__ == "__main__":
    main()
