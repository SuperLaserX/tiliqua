"""Tries place-and-route seeds on the last synthesis, and ships the best one.

    python src/top/fairwave/tools/seeds.py [--seeds 1-8] [--jobs N] [--heavy] [--ship SEED]

Run from `gateware/`, after `top.py build` has made `build/fairwave-r5/top.json`.

Near this SoC's utilisation the slowest path is the stock one from the PSRAM controller's
state through its acknowledge into the CPU's cache: the controller is at the PSRAM's pins
on one edge of the chip and the CPU on the other, so whether it meets 60 MHz depends
on the placement. (top/bfr/README.md has the history: same path, same remedy.)

`--heavy` weights the placer towards timing, which BFR found helps this path.

A seed must also pass `fairwave/phy_check.py`: nextpnr doesn't check the route out of the
PSRAM PHY's DATAVALID, and a placement that meets every clock can still not start.

`--ship SEED` packs that seed's result as `top.bit`, ready for `top.py build --skip-build`
to put in an archive with the current firmware.
"""

import argparse
import concurrent.futures
import os
import re
import shutil
import subprocess
import sys
from pathlib import Path

BUILD = Path("build") / "fairwave-r5"
HERE = Path(__file__).resolve().parent
sys.path.insert(0, str(HERE.parent))

from fairwave.phy_check import LIMIT_NS, routes  # noqa: E402

SYNC, DVI, DVI5X = "$glbnet$clk", "dvi_clk", "dvi5x_clk"
# (the sync domain's target, and the pixel clocks of the fastest dynamic mode)
TARGETS = {SYNC: 60.0, DVI: 74.25, DVI5X: 371.33}


def run_seed(seed, heavy):
    args = ["yowasp-nextpnr-ecp5", "--quiet", "--timing-allow-fail", "--25k",
            "--package", "CABGA256", "--speed", "6",
            "--json", "top.json", "--lpf", "top.lpf",
            "--log", f"top-s{seed}.tim", "--textcfg", f"top-s{seed}.config",
            "--sdf", f"top-s{seed}.sdf", "--seed", str(seed)]
    if heavy:
        args += ["--placer-heap-timingweight", "25", "--placer-heap-critexp", "3"]
    subprocess.run(args, cwd=BUILD, check=True, capture_output=True)
    return report(seed)


def report(seed):
    log = (BUILD / f"top-s{seed}.tim").read_text(errors="replace")
    # The last figure for each clock is the post-route one.
    fmax = {}
    for name, mhz in re.findall(r"Max frequency for clock\s+'([^']+)':\s+([\d.]+) MHz", log):
        for clock in TARGETS:
            if clock in name:
                fmax[clock] = float(mhz)
    worst = routes(str(BUILD / f"top-s{seed}.sdf"))
    return seed, fmax, worst.get("DQSBUFM.DATAVALID", 0.0)


def passes(fmax, datavalid):
    return (all(fmax.get(c, 0) >= t for c, t in TARGETS.items()), datavalid <= LIMIT_NS)


def parse_seeds(text):
    a, _, b = text.partition("-")
    return range(int(a), int(b or a) + 1)


def ship(seed):
    shutil.copy(BUILD / f"top-s{seed}.config", BUILD / "top.config")
    subprocess.run(["yowasp-ecppack", "--freq", "38.8", "--compress", "--bootaddr", "0x0",
                    "--input", "top.config", "--bit", "top.bit", "--svf", "top.svf"],
                   cwd=BUILD, check=True)
    print(f"seed {seed} packed to {BUILD / 'top.bit'}; now: "
          "python src/top/fairwave/top.py build --skip-build")


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--seeds", default="1-8")
    parser.add_argument("--jobs", type=int, default=max(1, (os.cpu_count() or 2) - 1))
    parser.add_argument("--heavy", action="store_true")
    parser.add_argument("--ship", type=int)
    args = parser.parse_args()

    if args.ship is not None:
        seed, fmax, dv = report(args.ship)
        timing, phy = passes(fmax, dv)
        if not (timing and phy):
            sys.exit(f"seed {seed} doesn't pass: {fmax}, DATAVALID {dv:.2f} ns")
        ship(args.ship)
        return

    print(f"{'seed':>4} {'sync':>7} {'dvi':>7} {'dvi5x':>7} {'DATAVALID':>9}", flush=True)
    good = []
    with concurrent.futures.ThreadPoolExecutor(max_workers=args.jobs) as pool:
        jobs = [pool.submit(run_seed, s, args.heavy) for s in parse_seeds(args.seeds)]
        for job in concurrent.futures.as_completed(jobs):
            seed, fmax, dv = job.result()
            timing, phy = passes(fmax, dv)
            verdict = "ok" if timing and phy else ("PHY" if timing else "slow")
            print(f"{seed:>4} {fmax.get(SYNC, 0):>7.2f} {fmax.get(DVI, 0):>7.2f} "
                  f"{fmax.get(DVI5X, 0):>7.2f} {dv:>8.2f}  {verdict}", flush=True)
            if timing and phy:
                good.append((min(fmax[c] / t for c, t in TARGETS.items()), seed))
    if good:
        best = max(good)[1]
        print(f"{len(good)} good; most margin: seed {best}. Ship with --ship {best}")
    else:
        print("no seed passes")


if __name__ == "__main__":
    main()
