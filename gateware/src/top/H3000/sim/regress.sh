#!/usr/bin/env bash
# Compare the CXXRTL board simulation against the Python reference model for
# every DSP program combination of both firmware sets.
#
#   sim/regress.sh <tb_board.exe> [warm_frames] [log_frames]
set -uo pipefail
HERE="$(cd "$(dirname "$0")" && pwd)"
TB="$1"
WARM="${2:-9000}"
LOG="${3:-24}"
IMG="$HERE/../H3000-Firmware/dsp/images"
PY="${PY:-py -3.13}"
cd "$HERE/.."
fail=0
run() {
    $PY sim/compare.py "$TB" "$IMG/$1" $2 $3 $4 "$WARM" "$LOG" | grep -v "^hw:" || fail=1
}
for k in "0110 0111 0112" "0410 0411 0012" "0410 0411 0212" "0410 0411 0312" \
         "0410 0411 0412" "0810 0811 0812" "1410 1411 1412" "1E10 1E11 1E12" "2810 2811 2812"; do
    run h3000_v153 $k
done
for k in "0110 0111 0112" "0410 0411 0012" "0410 0411 0412" "1410 1411 1412" "1E10 1E11 1E12" \
         "2810 2811 2812" "6F10 6F11 6F12" "7010 7011 7012" "7210 7211 7212" "7310 7311 7312" \
         "7410 7411 7412" "7510 7511 7512" "7610 7611 7612" "7710 7711 7712" "7810 7811 7812" \
         "7A10 7A11 7A12" "7A13 7A14 7A15"; do
    run h3500 $k
done
exit $fail
