"""Builds NAM and ships a bitstream that meets timing, unattended:

    python src/top/NAM/tools/ship.py [--seeds 1-24] [--jobs N] [--all]

from `gateware/` (it sets the toolchain's environment itself). Every step goes to
`build/nam-ship.log`, the outcome to `build/nam-ship.json`; nothing needs watching.

1. `top.py build`: the register crate, the firmware, synthesis, and the default seed's
   place-and-route. The archive there before is kept as `build/nam-r5/nam-before-ship.tar.gz`.
2. Seeds, from the moment synthesis has written its netlist (alongside step 1's own
   place-and-route), `--jobs` at a time, each judged as it ends with `tools/seeds.py`'s checks:
   every clock at its target, and the PSRAM PHY's DATAVALID route. The first that passes wins
   and the rest are stopped (with `--all`, every seed runs and the one with the most margin on the
   engine's clock wins).
3. When step 1 has finished: the winner packed as `top.bit`, then `top.py build --skip-build`
   for the archive, with that bitstream and the firmware as it is then. The archive is also
   copied to `build/nam-r5/nam-shipped.tar.gz`.

Exits 0 with an archive made, 1 if no seed passes (the log has each seed's figures).
"""

import argparse
import json
import os
import shutil
import subprocess
import sys
import time
from datetime import datetime
from pathlib import Path

HERE = Path(__file__).resolve().parent
sys.path.insert(0, str(HERE))
import seeds  # noqa: E402

BUILD = seeds.BUILD
LOG = Path("build") / "nam-ship.log"
OUTCOME = Path("build") / "nam-ship.json"
GATEWARE = HERE.parents[3]
# Relative, from gateware/: the build tool names the build (its folder, the archive, the screen's
# name) after the third part of this path, so an absolute one builds "myTiliqua" elsewhere.
TOP = "src/top/NAM/top.py"


def log(msg):
    line = f"{datetime.now():%Y-%m-%d %H:%M:%S}  {msg}"
    print(line, flush=True)
    with open(LOG, "a", encoding="utf-8") as f:
        f.write(line + "\n")


def toolchain_env():
    env = dict(os.environ)
    env.update(PYTHONUTF8="1", YOSYS="yowasp-yosys", NEXTPNR_ECP5="yowasp-nextpnr-ecp5", ECPPACK="yowasp-ecppack",
               AMARANTH_USE_YOSYS="builtin")
    # (Claude's shell sets this, and then cmd.exe won't run build_top.bat from its own folder)
    env.pop("NoDefaultCurrentDirectoryInExePath", None)
    scripts = str(Path(sys.executable).parent)
    env["PATH"] = scripts + os.pathsep + env.get("PATH", "")
    return env


def seed_args(seed, heavy=False):
    args = ["yowasp-nextpnr-ecp5", "--quiet", "--timing-allow-fail", "--25k",
            "--package", "CABGA256", "--speed", "6",
            "--json", "top.json", "--lpf", "top.lpf",
            "--log", f"top-s{seed}.tim", "--textcfg", f"top-s{seed}.config",
            "--sdf", f"top-s{seed}.sdf", "--seed", str(seed)]
    if heavy:
        args += ["--placer-heap-timingweight", "25", "--placer-heap-critexp", "3"]
    return args


def describe(seed, fmax, dv):
    clocks = " ".join(f"{name}={fmax.get(clock, 0):.1f}" for name, clock in
                      (("sync", seeds.SYNC), ("engine", seeds.FAST), ("dvi", seeds.DVI), ("dvi5x", seeds.DVI5X)))
    return f"seed {seed}: {clocks} MHz, DATAVALID {dv:.2f} ns"


def main():
    p = argparse.ArgumentParser()
    p.add_argument("--seeds", default="1-24")
    p.add_argument("--jobs", type=int, default=max(1, (os.cpu_count() or 2) // 2))
    p.add_argument("--all", action="store_true", help="run every seed and take the best")
    p.add_argument("--heavy", action="store_true")
    args = p.parse_args()
    os.chdir(GATEWARE)
    env = toolchain_env()
    started = time.time()
    log(f"ship: seeds {args.seeds}, {args.jobs} at a time{' (all)' if args.all else ''}")

    # 1. The build, in the background; the netlist's time tells when synthesis is done.
    BUILD.mkdir(parents=True, exist_ok=True)
    # (the newest: the build is about to write over it)
    before_archives = [a for a in BUILD.glob("nam-*.tar.gz")
                       if a.name not in ("nam-before-ship.tar.gz", "nam-shipped.tar.gz")]
    if before_archives:
        old = max(before_archives, key=lambda a: a.stat().st_mtime)
        shutil.copy(old, BUILD / "nam-before-ship.tar.gz")
        log(f"kept the archive there before as nam-before-ship.tar.gz ({old.name})")
    netlist = BUILD / "top.json"
    before = netlist.stat().st_mtime if netlist.exists() else 0.0
    build_log = open(Path("build") / "nam-build.log", "w", encoding="utf-8")
    build = subprocess.Popen([sys.executable, TOP, "build"], stdout=build_log, stderr=subprocess.STDOUT, env=env)
    log("build: started (register crate, firmware, synthesis, default place-and-route)")
    while True:
        if build.poll() is not None and build.returncode != 0:
            log(f"build: failed (exit {build.returncode}); see build/nam-build.log")
            return 1
        if netlist.exists() and netlist.stat().st_mtime > before:
            # (written in one go at synthesis's end; give the writer a moment to close it)
            size = netlist.stat().st_size
            time.sleep(5)
            if netlist.stat().st_size == size:
                break
        time.sleep(10)
    log(f"build: synthesis done ({netlist.stat().st_size // 1024} KB netlist) after {(time.time() - started) / 60:.0f} min")

    # 2. Seeds.
    todo = list(seeds.parse_seeds(args.seeds))
    running = {}
    results = []
    winner = None
    while (todo or running) and winner is None:
        while todo and len(running) < args.jobs:
            s = todo.pop(0)
            running[s] = subprocess.Popen(seed_args(s, args.heavy), cwd=BUILD, stdout=subprocess.DEVNULL,
                                          stderr=subprocess.DEVNULL, env=env)
            log(f"seed {s}: started")
        time.sleep(10)
        for s, proc in list(running.items()):
            if proc.poll() is None:
                continue
            del running[s]
            if proc.returncode != 0:
                log(f"seed {s}: nextpnr failed (exit {proc.returncode})")
                continue
            seed, fmax, dv = seeds.report(s)
            timing, phy = seeds.passes(fmax, dv)
            ok = timing and phy
            results.append({"seed": s, "fmax": fmax, "datavalid": dv, "passes": ok})
            log(describe(s, fmax, dv) + ("  PASSES" if ok else "  (fails)"))
            if ok and not args.all:
                winner = s
                break
    for s, proc in running.items():
        proc.terminate()
        log(f"seed {s}: stopped")
    if args.all:
        good = [r for r in results if r["passes"]]
        if good:
            winner = max(good, key=lambda r: r["fmax"].get(seeds.FAST, 0))["seed"]
    if winner is None:
        log("no seed passed; nothing shipped (the archive from step 1 has the default seed's bitstream, "
            "which may not meet timing)")
        OUTCOME.write_text(json.dumps({"shipped": None, "seeds": results}, indent=1), encoding="utf-8")
        build.wait()
        return 1

    # 3. Ship it, once the build has finished (it writes its own archive at the end).
    log(f"seed {winner} wins; waiting for the build to finish")
    if build.wait() != 0:
        log(f"build: failed (exit {build.returncode}) after synthesis; see build/nam-build.log")
        return 1
    build_log.close()
    seeds.ship(winner)
    pack_log = open(Path("build") / "nam-pack.log", "w", encoding="utf-8")
    packed = subprocess.run([sys.executable, TOP, "build", "--skip-build"], stdout=pack_log,
                            stderr=subprocess.STDOUT, env=env)
    if packed.returncode != 0:
        log(f"pack: failed (exit {packed.returncode}); top.bit is seed {winner}'s, see build/nam-pack.log")
        return 1
    archives = sorted(BUILD.glob("nam-*.tar.gz"), key=lambda p: p.stat().st_mtime)
    archives = [a for a in archives if a.name not in ("nam-before-ship.tar.gz", "nam-shipped.tar.gz")]
    shipped = archives[-1]
    shutil.copy(shipped, BUILD / "nam-shipped.tar.gz")
    best = next(r for r in results if r["seed"] == winner)
    OUTCOME.write_text(json.dumps({"shipped": str(shipped), "seed": winner, "fmax": best["fmax"],
                                   "datavalid": best["datavalid"], "seeds": results,
                                   "minutes": round((time.time() - started) / 60)}, indent=1), encoding="utf-8")
    log(f"shipped: {shipped} (seed {winner}), also as nam-shipped.tar.gz, after "
        f"{(time.time() - started) / 60:.0f} min")
    return 0


if __name__ == "__main__":
    sys.exit(main())
