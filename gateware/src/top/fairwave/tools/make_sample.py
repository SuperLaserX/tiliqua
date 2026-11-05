"""Makes a table for `READ = SAMPLE` from a recording of your own, and prints the lines a patch needs for it.

    python src/top/fairwave/tools/make_sample.py whatthe.wav library/FAIRWAVE/SAMPLES/MYHOOVER.WAV --c 48
    python src/top/fairwave/tools/make_sample.py pad.wav PAD.WAV --loop 44100 176399 --hz 261.6 --c 60

Any WAV will do: 8 to 32 bits, mono or stereo (mixed down), any sample rate. Without `--loop` it plays once.
`--loop START END` loops those samples, counted from the file's start, `END` being the last one kept. Its pitch is
measured unless `--hz` says what it is, and `--c` is what 0 V should be, as a MIDI note: 60 is C4, 48 C3, 36 C2.
Give a table an 8.3 name, as the path a patch keeps is short: `MYHOOVER.WAV`, not `my hoover take 3.wav`.
"""

import argparse
import sys
from pathlib import Path

HERE = Path(__file__).resolve().parent
sys.path.insert(0, str(HERE))

from samples import frame_percent, hz_of, percent_text, pitch_of, read_audio, to_table, tune_of, write_table  # noqa: E402


def main():
    parser = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    parser.add_argument("recording")
    parser.add_argument("table")
    parser.add_argument("--loop", nargs=2, type=int, metavar=("START", "END"))
    parser.add_argument("--hz", type=float, help="the recording's pitch, if measuring it gets it wrong")
    parser.add_argument("--c", type=int, default=60, help="the note 0 V plays, as a MIDI note")
    args = parser.parse_args()

    x, rate = read_audio(args.recording)
    end = len(x) - 1
    loop_start = end
    if args.loop:
        loop_start, end = args.loop
        if not 0 <= loop_start < end < len(x):
            raise SystemExit(f"{args.recording} has {len(x)} samples: --loop {loop_start} {end} doesn't fit")
    table, _ = to_table(x, rate, 0, loop_start, end, not args.loop)

    hz = args.hz
    if hz is None:
        hz, sure = pitch_of(x, rate)
        if hz is None or sure < 0.5:
            raise SystemExit("couldn't tell its pitch: say with --hz")
        print(f"measured {hz:.1f} Hz (how sure: {sure:.2f}). If that's wrong, say with --hz.")
    semitones, cents = tune_of(table, hz, hz_of(args.c))
    if not -48 <= semitones <= 48:
        raise SystemExit(f"that's {semitones} semitones from its own speed, and `TUNE` goes 48: choose a --c nearer {hz:.0f} Hz")
    write_table(args.table, table)

    print(f"{Path(args.table).name}: {table.frames} frames of {table.frame_len}, {len(table.samples) * 2 // 1024} KB")
    print("\nIn the patch, for either oscillator:")
    print(f"TABLE = {Path(args.table).name}\nREAD = SAMPLE\nTUNE = {semitones}\nFINE = {cents}\nPOS = 0%")
    if table.loop_frame is None:
        print("EDGE = CLAMP")
    else:
        print(f"EDGE = WRAP\nLOOP = {percent_text(frame_percent(table.loop_frame, table.frames))}")
    print("GRAIN = SYNC 1\n\nAnd so that a gate starts it:\n[LFO 1]\nRATE = 0.01 HZ\nSYNC = GATE 1")


if __name__ == "__main__":
    sys.exit(main())
