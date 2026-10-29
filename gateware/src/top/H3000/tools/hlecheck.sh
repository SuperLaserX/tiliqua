#!/bin/bash
# The natively run kernel code (emu/src/hle.rs) against the interpreter:
# runs the same sessions (program loads, knob turns, MIDI; with and without
# the DSP board model, both ROM sets) with H3K_NOHLE=1 and H3K_HLE_EXACT=1.
# Everything the runner records (parameter writes with their cycle counts,
# the LCD, the board state) must be identical.
#
# usage: tools/hlecheck.sh   (build the runner first: cargo build --release
#        --features std --target x86_64-pc-windows-msvc in emu/)
set -e
H3K=$(cd "$(dirname "$0")/.." && pwd)
OUT=$(mktemp -d)
cd "$H3K/emu"
RUN=target/x86_64-pc-windows-msvc/release/h3000-host.exe
SESSION="factory; wait 3; key 8; wait 0.3; key 20; wait 0.3; key 20; wait 0.3; key 2; wait 0.3; key 3; wait 3;
knob 5; wait 1; midi 90 3c 64; wait 0.5; midi 80 3c 00; wait 0.5; key 8; wait 0.3; key 13; wait 0.3;
key 12; wait 0.3; key 17; wait 0.3; key 3; wait 3; knob -3; wait 1; lcd"
status=0
for dsp in "dsp on; " ""; do
  for set in h3500 v153; do
    for mode in NOHLE HLE_EXACT; do
      W=$(cygpath -m "$OUT" 2>/dev/null || echo "$OUT")
      env "H3K_$mode=1" $RUN ../H3000-Firmware $set "$dsp$SESSION; dump $W/dump_$mode.txt; stats" \
        | grep -Ev "^emulated|^> dump" > "$OUT/out_$mode.txt" 2>&1
    done
    if cmp -s "$OUT/dump_NOHLE.txt" "$OUT/dump_HLE_EXACT.txt" && cmp -s "$OUT/out_NOHLE.txt" "$OUT/out_HLE_EXACT.txt"; then
      echo "${dsp:-no dsp; }$set: identical"
    else
      echo "${dsp:-no dsp; }$set: DIFFERENT (see $OUT)"
      status=1
    fi
  done
done
exit $status
