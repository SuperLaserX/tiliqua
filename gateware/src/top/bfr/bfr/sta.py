"""Setup-path report for the core from a nextpnr SDF (single clock, max delays).

    python -m bfr.sta ../../../build/bfr-core/top.sdf [period_ns] [n] [match]

`match` keeps only endpoints whose name contains it (e.g. `bfr.` for the
engine's paths in a whole-SoC build, whose other clocks this doesn't model).

nextpnr reports only the worst path; this lists the worst endpoints with
their start points, grouped by signal name, to show everything that fails.
Adapted from H3000/sim/sta.py; the core has one clock, and an out-of-context
build leaves it unrouted, so every launch and setup pin is in the domain.
"""

import re
import sys
from collections import defaultdict, deque


def vmax(s):
    return int(s.strip("()").split(":")[2])


def load(path):
    text = open(path, encoding="utf-8").read()
    edges, launch, setup = defaultdict(list), {}, {}
    for m in re.finditer(r"\(INTERCONNECT (\S+) (\S+) (\([0-9:]+\))", text):
        edges[m.group(1).replace("\\", "")].append((m.group(2).replace("\\", ""), vmax(m.group(3))))
    head = re.compile(r"\(CELLTYPE \"([^\"]+)\"\)\s+\(INSTANCE ([^)]*)\)(.*)", re.S)
    for chunk in text.split("\n  (CELL\n")[1:]:
        m = head.search(chunk)
        if not m or m.group(1) == "top":
            continue
        inst, body = m.group(2).strip().replace("\\", ""), m.group(3)
        for a, b, d in re.findall(r"\(IOPATH (\S+) (\S+) (\([0-9:]+\))", body):
            if a.startswith("CLK"):
                launch[inst + "/" + b] = max(launch.get(inst + "/" + b, 0), vmax(d))
            else:
                edges[inst + "/" + a].append((inst + "/" + b, vmax(d)))
        for pin, _clk, d in re.findall(r"\(SETUPHOLD \(posedge (\S+)\) \(posedge (\S+)\) (\([0-9:]+\))", body):
            setup[inst + "/" + pin] = max(setup.get(inst + "/" + pin, 0), vmax(d))
    return edges, launch, setup


def analyse(edges, launch, setup, period_ps):
    arrival, pred, indeg = dict(launch), {}, defaultdict(int)
    seen, q = set(launch), deque(launch)
    while q:
        u = q.popleft()
        for v, _ in edges.get(u, ()):
            indeg[v] += 1
            if v not in seen:
                seen.add(v)
                q.append(v)
    q = deque(p for p in launch if indeg[p] == 0)
    while q:
        u = q.popleft()
        for v, d in edges.get(u, ()):
            if arrival.get(u, 0) + d > arrival.get(v, -1):
                arrival[v], pred[v] = arrival[u] + d, u
            indeg[v] -= 1
            if indeg[v] == 0:
                q.append(v)
    res = []
    for p, s in setup.items():
        if p in arrival:
            path = [p]
            while path[-1] in pred:
                path.append(pred[path[-1]])
            res.append((period_ps - s - arrival[p], p, path[-1]))
    res.sort()
    return res


def group(pin):
    """A readable signal name for a cell pin: the net prefix before nextpnr's suffixes."""
    name = pin.split("/")[0]
    name = re.split(r"_TRELLIS_FF|_LUT4|_CCU2C|_PFUMX|_L6MUX|\$CCU2|_DP16KD|_MULT18X18D", name)[0]
    return re.sub(r"\[\d+\]", "[]", name)


def main():
    path = sys.argv[1]
    period = float(sys.argv[2]) * 1000 if len(sys.argv) > 2 else 16667.0
    n = int(sys.argv[3]) if len(sys.argv) > 3 else 30
    res = analyse(*load(path), period)
    if len(sys.argv) > 4:
        res = [r for r in res if sys.argv[4] in r[1]]
    failing = [r for r in res if r[0] < 0]
    print(f"{len(res)} endpoints, {len(failing)} failing at {period / 1000:.3f} ns")
    by = defaultdict(lambda: [0, 0.0, None])
    for slack, end, start in failing:
        g = (group(start), group(end))
        by[g][0] += 1
        if by[g][2] is None or slack < by[g][1]:
            by[g][1], by[g][2] = slack, (start, end)
    for (s, e), (count, worst, _) in sorted(by.items(), key=lambda kv: kv[1][1])[:n]:
        print(f"{worst / 1000:8.2f} ns  {count:5}x  {s}  ->  {e}")


if __name__ == "__main__":
    main()
