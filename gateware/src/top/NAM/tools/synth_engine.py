"""Synthesises the NAM peripheral alone for the ECP5, to see what it costs.

    python src/top/NAM/tools/synth_engine.py [out dir]        (from gateware/)

Writes the peripheral's RTLIL, runs `synth_ecp5 -noflatten` on it and prints
the cell counts per module and how each memory was mapped (block RAM or LUT
RAM). Minutes, against the hour a whole-SoC build takes.
"""

import os
import re
import subprocess
import sys

HERE = os.path.dirname(os.path.realpath(__file__))
sys.path.insert(0, os.path.abspath(os.path.join(HERE, "..", "..", "..")))
sys.path.insert(0, os.path.join(HERE, ".."))

from amaranth.back import rtlil  # noqa: E402

from nam.peripheral import NamPeripheral  # noqa: E402


def main():
    out = sys.argv[1] if len(sys.argv) > 1 else os.path.join("build", "nam-engine-synth")
    os.makedirs(out, exist_ok=True)
    p = NamPeripheral(hw_mult=True, pring_base=0x800000 // 4)
    text = rtlil.convert(p, name="nam", ports=None, platform=None)
    il = os.path.join(out, "nam.il")
    with open(il, "w") as f:
        f.write(text)
    script = os.path.join(out, "synth.ys")
    with open(script, "w") as f:
        f.write(f"read_rtlil {os.path.basename(il)}\n"
                "synth_ecp5 -noflatten -top nam\n"
                "tee -o stat.txt stat\n")
    log = os.path.join(out, "synth.log")
    with open(log, "w") as f:
        subprocess.check_call([os.environ.get("YOSYS", "yowasp-yosys"), "-q", "-l", "synth.log",
                               os.path.basename(script)], cwd=out, stdout=f, stderr=subprocess.STDOUT)
    with open(os.path.join(out, "synth.log")) as f:
        lines = f.read().splitlines()
    for line in lines:
        m = re.search(r"mapping memory (\S+) via (\S+)", line)
        if m:
            print(f"  {m.group(2):24s} {m.group(1)}")
    with open(os.path.join(out, "stat.txt")) as f:
        stat = f.read()
    # Per module: LUT4 / CCU2C / DP16KD / DPR16X4 / MULT18X18D / TRELLIS_FF.
    module = None
    rows = {}
    for line in stat.splitlines():
        m = re.match(r"=== (\S+) ===", line.strip())
        if m:
            module = m.group(1)
            rows[module] = {}
            continue
        m = re.match(r"\s+(\d+)\s+(\S+)$", line)
        if m and module:
            rows[module][m.group(2)] = int(m.group(1))
        m = re.match(r"\s+(\S+)\s+(\d+)$", line)
        if m and module:
            rows[module][m.group(1)] = int(m.group(2))
    keys = ["LUT4", "CCU2C", "TRELLIS_FF", "TRELLIS_DPR16X4", "DP16KD", "MULT18X18D", "PFUMX", "L6MUX21"]
    print(f"{'module':60s} " + " ".join(f"{k[-8:]:>8s}" for k in keys))
    for mod, r in rows.items():
        print(f"{mod[-60:]:60s} " + " ".join(f"{r.get(k, 0):8d}" for k in keys))


if __name__ == "__main__":
    main()
