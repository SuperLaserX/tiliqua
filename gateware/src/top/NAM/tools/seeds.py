"""Tries place-and-route seeds on the last synthesis, and packs the best one.

    python src/top/NAM/tools/seeds.py [--seeds 1-8] [--jobs N] [--heavy] [--ship SEED]

Run from `gateware/`, after `top.py build` has made `build/nam-r5/top.json`.
FairWave's `tools/seeds.py`, with the engine's 120 MHz clock among the targets.

Near this SoC's utilisation whether a build meets timing depends on the
placement: the stock path from the PSRAM controller into the CPU's cache on the
system clock (top/bfr/README.md, top/fairwave/README.md), and here the engine's
clock as well. `--heavy` weights the placer towards timing.

A seed must also pass the PSRAM PHY route check (below, from FairWave's
`phy_check.py`): nextpnr doesn't time the route out of the PHY's DATAVALID, and
a placement that met every clock with a 3.23 ns route there didn't start.

`--ship SEED` packs that seed's result as `top.bit`, ready for
`top.py build --skip-build` to put in an archive with the current firmware.
"""

import argparse
import concurrent.futures
import os
import re
import shutil
import subprocess
import sys
from collections import defaultdict
from pathlib import Path

BUILD = Path("build") / "nam-r5"

SYNC, FAST, DVI, DVI5X = "$glbnet$clk", "$glbnet$fast_clk", "dvi_clk", "dvi5x_clk"
TARGETS = {SYNC: 60.0, FAST: 120.0, DVI: 74.25, DVI5X: 371.33}

# The PSRAM PHY's hard cells, and the longest DATAVALID route a placement that ran has had.
HARD = ("DQSBUFM", "IDDRX2", "ODDRX2", "TSHX2", "DDRDLL", "DELAYG", "ECLKSYNC", "CLKDIV")
LIMIT_NS = 2.3


def routes(path):
    """{cell type.pin: longest route in ns} out of the PHY's hard cells into the fabric."""
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


def run_seed(seed, heavy):
    args = ["yowasp-nextpnr-ecp5", "--quiet", "--timing-allow-fail", "--25k",
            "--package", "CABGA256", "--speed", "6",
            "--json", "top.json", "--lpf", "top.lpf",
            "--log", f"top-s{seed}.tim", "--textcfg", f"top-s{seed}.config",
            "--sdf", f"top-s{seed}.sdf", "--seed", str(seed)]
    if heavy:
        args += ["--placer-heap-timingweight", "25", "--placer-heap-critexp", "3"]
    done = subprocess.run(args, cwd=BUILD, capture_output=True)
    if done.returncode != 0:
        return seed, {}, 99.0
    return report(seed)


def report(seed):
    log = (BUILD / f"top-s{seed}.tim").read_text(errors="replace")
    # The last figure for each clock is the post-route one.
    fmax = {}
    for name, mhz in re.findall(r"Max frequency for clock\s+'([^']+)':\s+([\d.]+) MHz", log):
        for clock in TARGETS:
            if name == clock or (clock.startswith("dvi") and clock in name):
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
          "python src/top/NAM/top.py build --skip-build")


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

    print(f"{'seed':>4} {'sync':>7} {'fast':>7} {'dvi':>7} {'dvi5x':>7} {'DATAVALID':>9}", flush=True)
    good = []
    with concurrent.futures.ThreadPoolExecutor(max_workers=args.jobs) as pool:
        jobs = [pool.submit(run_seed, s, args.heavy) for s in parse_seeds(args.seeds)]
        for job in concurrent.futures.as_completed(jobs):
            seed, fmax, dv = job.result()
            timing, phy = passes(fmax, dv)
            verdict = "ok" if timing and phy else ("PHY" if timing else ("route" if not fmax else "slow"))
            print(f"{seed:>4} {fmax.get(SYNC, 0):>7.2f} {fmax.get(FAST, 0):>7.2f} {fmax.get(DVI, 0):>7.2f} "
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
