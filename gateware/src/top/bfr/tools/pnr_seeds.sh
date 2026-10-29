#!/bin/sh
# Place and route the elaborated SoC with several nextpnr seeds in parallel,
# then report each one's clocks and the PSRAM PHY check (bfr/phy_check.py).
#
#     sh src/top/bfr/tools/pnr_seeds.sh [FIRST LAST [EXTRA NEXTPNR OPTIONS...]]
#
# Run from gateware/ after `top.py build` has written build/bfr-r5 (yosys
# runs here if top.json is missing). Seeds FIRST..LAST (default 1..10) write
# top-sN.{tim,sdf,config}; ship one with every clock passing, 0 failing
# endpoints in bfr.sta and "ok" from the PHY check, by copying its config to
# top.config and running ecppack (README, Building on Windows).
S=${VENV_SCRIPTS:-/c/Users/SlaserX/.venvs/tiliqua-win/Scripts}
FIRST=${1:-1}; LAST=${2:-10}
[ $# -ge 2 ] && shift 2
BUILD=build/bfr-r5
cd "$BUILD" || exit 1
if [ ! -f top.json ]; then
  "$S/yowasp-yosys.exe" -q -l top.rpt top.ys || { echo "yosys failed"; exit 1; }
  echo "yosys done"
fi
n=$FIRST
while [ $n -le $LAST ]; do
  "$S/yowasp-nextpnr-ecp5.exe" --quiet --timing-allow-fail --seed $n --log top-s$n.tim \
    --25k --package CABGA256 --speed 6 --json top.json --lpf top.lpf \
    --textcfg top-s$n.config --sdf top-s$n.sdf "$@" > /dev/null 2>&1 &
  n=$((n + 1))
done
wait
n=$FIRST
while [ $n -le $LAST ]; do
  printf "seed %s: " $n
  grep "Max frequency for clock" top-s$n.tim | tail -4 | sed 's/Info: Max frequency for clock//' | tr -s ' ' | tr '\n' ' '
  echo
  n=$((n + 1))
done
cd ../../src/top/bfr || exit 1
n=$FIRST
while [ $n -le $LAST ]; do
  "$S/python.exe" -m bfr.phy_check ../../../$BUILD/top-s$n.sdf
  n=$((n + 1))
done
