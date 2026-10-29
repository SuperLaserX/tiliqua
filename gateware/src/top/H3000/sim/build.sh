#!/usr/bin/env bash
# Build the CXXRTL simulation of the H3000 DSP board.
#
#   sim/build.sh [build dir]
#
# SIMTOP_ARGS=--cache puts the PSRAM delay cache (with a mock PSRAM) under
# the board instead of a full-size block-RAM delay memory.
#
# Needs a Python with amaranth + yowasp-yosys + ziglang (e.g. the project venv);
# set PYTHON to override. Produces <build dir>/tb_board(.exe).
set -euo pipefail

HERE="$(cd "$(dirname "$0")" && pwd)"
OUT="${1:-$HERE/build}"
PYTHON="${PYTHON:-python}"
IKA="$HERE/../IKA32010/src"
mkdir -p "$OUT"
if command -v cygpath >/dev/null; then  # Windows tools need Windows paths
    IKA="$(cygpath -m "$IKA")"
fi

"$PYTHON" "$HERE/simtop.py" "$OUT/simtop.il" ${SIMTOP_ARGS:-}

YOSYS=("$PYTHON" -c "import sys, yowasp_yosys; sys.argv[0]='yosys'; sys.exit(yowasp_yosys._run_yosys_argv())")
(cd "$OUT" && "${YOSYS[@]}" -q -p "read_rtlil simtop.il; \
    read_verilog -sv -I$IKA $IKA/IKA32010.sv; \
    hierarchy -top top; proc; flatten; opt_clean; \
    write_cxxrtl -O6 -g1 simtop.cc")

RT="$("$PYTHON" -c "import os, yowasp_yosys; print(os.path.join(os.path.dirname(yowasp_yosys.__file__), 'share', 'include', 'backends', 'cxxrtl', 'runtime'))")"
cp "$HERE/tb_board.cpp" "$OUT/"
(cd "$OUT" && "$PYTHON" -m ziglang c++ -std=c++17 -O2 -w -I"$RT" -I. tb_board.cpp -o tb_board.exe)
echo "built $OUT/tb_board.exe"
