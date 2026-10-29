"""Synthesise the engine core on its own, for resource and timing numbers.

Run from src/top/bfr:

    python -m bfr.synth [--algorithm plate] [--ebr-words 512] [--stream] [--out ../../../build/bfr-core]

--stream adds the PSRAM stream engine (buffers sized for the program); its
wishbone bus becomes top-level ports.

Yosys (synth_ecp5) and nextpnr-ecp5 run out of context (no pins, no global
clock routing) for the LFE5U-25F, speed grade 6, at 60 MHz, as in the SoC
builds. The core's ports stay unconnected, so this measures the core alone;
in the SoC its share of routing is harder.
"""

import argparse
import importlib
import json
import os
import shutil
import subprocess
import sys

from amaranth import Value
from amaranth.back import rtlil

from model.compiler import compile_algorithm

from .core import Core
from .sim import StreamTop


def tool(name):
    exe = shutil.which(f"yowasp-{name}") or os.path.join(os.path.dirname(sys.executable), f"yowasp-{name}")
    return exe


def main(argv=None):
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("--algorithm", default="plate")
    ap.add_argument("--fs", type=int, default=48000)
    ap.add_argument("--ebr-words", type=int, default=512, help="block-RAM delay pool (words)")
    ap.add_argument("--seed", type=int, default=1)
    ap.add_argument("--stream", action="store_true", help="with the PSRAM stream engine")
    ap.add_argument("--out", default=os.path.join("..", "..", "..", "build", "bfr-core"))
    args = ap.parse_args(argv)

    mod = importlib.import_module(f"algorithms.{args.algorithm}")
    prog = compile_algorithm(mod.build, args.fs, args.algorithm)
    os.makedirs(args.out, exist_ok=True)
    if args.stream:
        top = StreamTop(prog)
        top.core.ebr_words = args.ebr_words
        ports = [Value.cast(v) for path, _, v in top.core.signature.flatten(top.core) if path[0] != "pmem"]
        ports += [Value.cast(v) for path, _, v in top.stream.signature.flatten(top.stream)
                  if path[0] not in ("core", "ptr")]
        il = rtlil.convert(top, name="top", ports=ports)
    else:
        il = rtlil.convert(Core(prog=prog, ebr_words=args.ebr_words), name="top")
    with open(os.path.join(args.out, "top.il"), "w") as f:
        f.write(il)
    with open(os.path.join(args.out, "top.ys"), "w") as f:
        f.write("read_rtlil top.il\nproc ; splitnets\nsynth_ecp5 -top top\nwrite_json top.json\n")
    subprocess.run([tool("yosys"), "-q", "-l", "top.rpt", "top.ys"], cwd=args.out, check=True)
    subprocess.run([tool("nextpnr-ecp5"), "--quiet", "--timing-allow-fail", "--out-of-context",
                    "--25k", "--package", "CABGA256", "--speed", "6", "--freq", "60",
                    "--seed", str(args.seed), "--json", "top.json", "--report", "report.json",
                    "--sdf", "top.sdf", "--log", "top.tim"], cwd=args.out, check=True)
    with open(os.path.join(args.out, "report.json")) as f:
        report = json.load(f)
    util = report["utilization"]
    print("utilisation:")
    for cell in ("TRELLIS_COMB", "TRELLIS_FF", "TRELLIS_RAMW", "DP16KD", "MULT18X18D", "CCU2C"):
        if cell in util:
            print(f"  {cell:<13} {util[cell]['used']:>6} / {util[cell]['available']}")
    for clk, v in report["fmax"].items():
        print(f"fmax {clk}: {v['achieved']:.1f} MHz (constraint {v['constraint']:.1f})")


if __name__ == "__main__":
    main()
