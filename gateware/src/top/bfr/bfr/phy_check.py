"""The PSRAM PHY's routes that nextpnr's timing doesn't cover, per placement.

    python -m bfr.phy_check ../../../build/bfr-r5/top-s*.sdf

The PSRAM PHY (`vendor/dqs_phy.py`) is built from the ECP5's DQS hard
macros. A placement whose route from the DQSBUFM's DATAVALID output (read
data has arrived, into the PSRAM controller's state machine) was 3.23 ns
passed every clock with margin and still didn't start: the CPU's first
fetch from the PSRAM failed, so no firmware ran (no "Hello" on the serial
port, a black screen, the CODEC's hardware bypass still audible). The
other 19 of that netlist's 20 placements had 1.59 to 2.59 ns, and the one
tried on hardware (2.27 ns) ran. nextpnr has no clock-to-output for that
pin, so its route is all it can report; keep it short.

For each SDF: the longest route out of each of the PHY's hard cells into
the fabric, and FAIL if DATAVALID's is longer than `LIMIT_NS`.
"""

import re
import sys
from collections import defaultdict

HARD = ("DQSBUFM", "IDDRX2", "ODDRX2", "TSHX2", "DDRDLL", "DELAYG", "ECLKSYNC", "CLKDIV")
# The longest DATAVALID route a placement that ran has had.
LIMIT_NS = 2.3


def routes(path):
    """{cell type.pin: longest route in ns} out of the hard cells."""
    text = open(path, encoding="utf-8").read()
    kinds = {m.group(2).strip().replace("\\", ""): m.group(1)
             for m in re.finditer(r'\(CELLTYPE "([^"]+)"\)\s+\(INSTANCE ([^)]*)\)', text)}
    worst = defaultdict(float)
    for m in re.finditer(r"\(INTERCONNECT (\S+) (\S+) \(([0-9.]+):([0-9.]+):([0-9.]+)\)", text):
        src, dst = m.group(1).replace("\\", ""), m.group(2).replace("\\", "")
        inst, pin = src.rsplit("/", 1)
        k, dk = kinds.get(inst, ""), kinds.get(dst.rsplit("/", 1)[0], "")
        if any(h in k for h in HARD) and not any(h in dk for h in HARD):
            key = f"{k}.{re.sub(r'[0-9]+$', '', pin)}"
            worst[key] = max(worst[key], float(m.group(5)) / 1000)
    return worst


def main(paths):
    bad = 0
    for path in paths:
        w = routes(path)
        dv = w.get("DQSBUFM.DATAVALID", 0.0)
        ok = dv <= LIMIT_NS
        bad += not ok
        shown = "  ".join(f"{k} {v:.2f}" for k, v in sorted(w.items()) if v > 0)
        print(f"{'ok  ' if ok else 'FAIL'} {path}: {shown}")
    return bad


if __name__ == "__main__":
    sys.exit(1 if main(sys.argv[1:]) else 0)
