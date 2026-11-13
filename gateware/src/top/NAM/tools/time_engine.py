"""Times the engine alone at 120 MHz: its own critical paths, without the SoC around it.

    python src/top/NAM/tools/time_engine.py [out dir] [--seed N]       (from gateware/)

The engine (its stream buffers' bus side on a 60 MHz clock, the rest on one at 120)
sits in a harness: its inputs come
from a shift register filled from one pin, and its outputs are captured and
shifted out of another, so nothing is optimised away and no path starts or ends
at a pin. yosys `synth_ecp5`, then nextpnr on an empty ECP5-25 with a 120 MHz
constraint; prints the result and the worst paths. An empty chip is the easy
case: a path that fails here fails in the SoC.
"""

import json
import os
import subprocess
import sys

HERE = os.path.dirname(os.path.realpath(__file__))
sys.path.insert(0, os.path.abspath(os.path.join(HERE, "..", "..", "..")))
sys.path.insert(0, os.path.join(HERE, ".."))

from amaranth import *  # noqa: E402
from amaranth.back import rtlil  # noqa: E402
from amaranth.lib import wiring  # noqa: E402

from nam.engine import Engine  # noqa: E402

MHZ = int(os.environ.get("NAM_TIME_MHZ", "120"))


class Harness(Elaboratable):
    def __init__(self):
        self.din = Signal()
        self.dout = Signal()
        self.load = Signal()

    def elaborate(self, platform):
        m = Module()
        # The stream buffers' bus side on its own clock (the SoC's 60 MHz `sync`).
        m.domains.bus = ClockDomain()
        m.submodules.eng = eng = Engine(hw_mult=True, pring_base=0x200000, bus_domain="bus")
        ins, outs = [], []
        for path, member, value in eng.signature.flatten(eng):
            (ins if member.flow == wiring.In else outs).append(Value.cast(value))
        win = sum(len(v) for v in ins)
        wout = sum(len(v) for v in outs)
        sr_in = Signal(win)
        m.d.sync += sr_in.eq(Cat(self.din, sr_in[:-1]))
        at = 0
        for v in ins:
            m.d.comb += v.eq(sr_in[at:at + len(v)])
            at += len(v)
        sr_out = Signal(wout)
        flat = Cat(*outs)
        m.d.sync += sr_out.eq(Mux(self.load, flat, sr_out >> 1))
        m.d.comb += self.dout.eq(sr_out[0])
        return m


def main():
    args = [a for a in sys.argv[1:] if not a.startswith("--")]
    seed = sys.argv[sys.argv.index("--seed") + 1] if "--seed" in sys.argv else "1"
    if seed in args:
        args.remove(seed)
    out = args[0] if args else os.path.join("build", "nam-engine-time")
    os.makedirs(out, exist_ok=True)
    h = Harness()
    with open(os.path.join(out, "top.il"), "w") as f:
        f.write(rtlil.convert(h, name="top", ports=[h.din, h.dout, h.load]))
    with open(os.path.join(out, "top.ys"), "w") as f:
        f.write("read_rtlil top.il\nsynth_ecp5 -top top\nwrite_json top.json\ntee -o stat.txt stat\n")
    with open(os.path.join(out, "top.lpf"), "w") as f:
        f.write(f'FREQUENCY PORT "clk" {MHZ} MHZ;\nFREQUENCY PORT "bus_clk" 60 MHZ;\n')
    yosys = os.environ.get("YOSYS", "yowasp-yosys")
    subprocess.check_call([yosys, "-q", "-l", "synth.log", "top.ys"], cwd=out)
    nextpnr = os.environ.get("NEXTPNR_ECP5", "yowasp-nextpnr-ecp5")
    subprocess.run([nextpnr, "--quiet", "--timing-allow-fail", "--25k", "--package", "CABGA256",
                    "--speed", "6", "--json", "top.json", "--lpf", "top.lpf", "--lpf-allow-unconstrained", "--log", "top.tim",
                    "--report", "report.json", "--seed", seed], cwd=out, check=True)
    rep = json.load(open(os.path.join(out, "report.json")))
    for clk, v in rep.get("fmax", {}).items():
        print(f"{clk}: {v['achieved']:.1f} MHz (wanted {v['constraint']:.1f})")
    for cp in rep.get("critical_paths", []):
        total = sum(s.get("delay", 0) for s in cp["path"])
        print(f"--- {cp.get('from')} -> {cp.get('to')}: {total:.2f} ns")
        t = 0.0
        for s in cp["path"]:
            t += s.get("delay", 0)
            if s.get("type") == "routing":
                continue
            cell = (s.get("to") or s.get("from") or {}).get("cell", "")
            print(f"  {t:6.2f} {s.get('delay', 0):5.2f} {s.get('type', ''):9s} {cell[-100:]}")


if __name__ == "__main__":
    main()
