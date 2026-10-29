"""Minimal static timing analysis on a nextpnr SDF (max delays).

usage: python sta.py top.sdf [clock_net_substring] [period_ns] [n]
       SHOW=<endpoint pin substring> python sta.py top.sdf ...   (print its path)
       SKIP= / ENDSKIP=<substrings,...>: leave out start / end pins

Reports the worst setup paths of one clock domain, separately for
(a) paths starting outside the IKA32010 cores and (b) paths starting inside
a core and ending outside it (core-internal paths are multi-cycle by design
and are not analysed). nextpnr only reports the single worst path per
clock, which in this design is always inside a core; this shows what is
underneath. Get the SDF by adding `--sdf top.sdf` to the nextpnr command,
then e.g. `python sta.py top.sdf '$gbuf$clk/' 16.667 40`.
"""
import re
import sys
from collections import defaultdict, deque

sdf_path = sys.argv[1]
clock_sub = sys.argv[2] if len(sys.argv) > 2 else "$gbuf$clk"
period = float(sys.argv[3]) * 1000 if len(sys.argv) > 3 else 16667.0
N = int(sys.argv[4]) if len(sys.argv) > 4 else 25

text = open(sdf_path, encoding="utf-8").read()


def unesc(s):
    return s.replace("\\", "")


def vmax(s):
    # "(a:b:c)" -> c
    return int(s.strip("()").split(":")[2])


edges = defaultdict(list)      # pin -> [(pin, delay)]
launch = {}                     # pin -> clk-to-out delay (cell output pins)
launch_clkpin = {}              # output pin -> clock input pin of its cell
setup = {}                      # pin -> setup time
setup_clkpin = {}               # endpoint pin -> clock pin of its cell
clock_src = {}                  # cell clock pin -> driving pin

inter_re = re.compile(r"\(INTERCONNECT (\S+) (\S+) (\([0-9:]+\))")
for m in inter_re.finditer(text):
    a, b, d = unesc(m.group(1)), unesc(m.group(2)), vmax(m.group(3))
    edges[a].append((b, d))
    clock_src[b] = a

head_re = re.compile(r"\(CELLTYPE \"([^\"]+)\"\)\s+\(INSTANCE ([^)]*)\)(.*)", re.S)


def cells():
    for chunk in text.split("\n  (CELL\n")[1:]:
        m = head_re.search(chunk)
        if m:
            yield m
iopath_re = re.compile(r"\(IOPATH (\S+) (\S+) (\([0-9:]+\))")
setup_re = re.compile(r"\(SETUPHOLD \(posedge (\S+)\) \(posedge (\S+)\) (\([0-9:]+\))")
ncells = 0
for m in cells():
    ctype, inst, body = m.group(1), unesc(m.group(2).strip()), m.group(3)
    if ctype == "top":
        continue
    ncells += 1
    for a, b, d in iopath_re.findall(body):
        pa, pb = inst + "/" + a, inst + "/" + b
        if a.startswith("CLK"):
            launch[pb] = max(launch.get(pb, 0), vmax(d))
            launch_clkpin[pb] = pa
        else:
            edges[pa].append((pb, vmax(d)))
    for pin, clk, d in setup_re.findall(body):
        p = inst + "/" + pin
        setup[p] = max(setup.get(p, 0), vmax(d))
        setup_clkpin[p] = inst + "/" + clk

print("cells", ncells, "launch pins", len(launch), "setup pins", len(setup))


def domain_of(clkpin):
    src = clock_src.get(clkpin, "")
    return clock_sub in src


def in_core(pin):
    return re.match(r"h3000\.board\.dsp\d\.core\.", pin) is not None


def analyse(start_filter, end_filter, label):
    # Longest-path propagation from the selected launch pins (DAG).
    arrival = {}
    pred = {}
    indeg = defaultdict(int)
    starts = [p for p in launch if domain_of(launch_clkpin[p]) and start_filter(p)]
    # Restrict to the reachable subgraph.
    seen = set(starts)
    q = deque(starts)
    while q:
        u = q.popleft()
        for v, _ in edges.get(u, ()):
            indeg[v] += 1
            if v not in seen:
                seen.add(v)
                q.append(v)
    for p in starts:
        arrival[p] = launch[p]
    q = deque(p for p in starts if indeg[p] == 0)
    done = 0
    while q:
        u = q.popleft()
        done += 1
        au = arrival.get(u, 0)
        for v, d in edges.get(u, ()):
            if au + d > arrival.get(v, -1):
                arrival[v] = au + d
                pred[v] = u
            indeg[v] -= 1
            if indeg[v] == 0:
                q.append(v)
    res = []
    for p, s in setup.items():
        if p in arrival and domain_of(setup_clkpin[p]) and end_filter(p):
            slack = period - s - arrival[p]
            res.append((slack, p))
    res.sort()
    print("\n== %s: %d endpoints, %d failing (period %.2f ns)" % (
        label, len(res), sum(1 for s, _ in res if s < 0), period / 1000))
    shown = set()
    for slack, p in res[:N]:
        # walk back to the startpoint
        path = [p]
        u = p
        while u in pred:
            u = pred[u]
            path.append(u)
        start = path[-1]
        key = (start.split("/")[0], p.split("/")[0])
        print("%8.2f ns  %s  <-  %s" % (slack / 1000, p, start))
    return res


import os
SHOW = os.environ.get("SHOW")  # substring of an endpoint pin: print its path
SKIP = os.environ.get("SKIP", "")  # comma-separated start pin substrings to leave out
ENDSKIP = os.environ.get("ENDSKIP", "")  # the same for endpoints


def keep_start(p):
    return not any(s and s in p for s in SKIP.split(","))


def keep_end(p):
    return not any(s and s in p for s in ENDSKIP.split(","))


def show(label, sf, ef):
    arrival, pred = {}, {}
    starts = [p for p in launch if domain_of(launch_clkpin[p]) and sf(p) and keep_start(p)]
    indeg = defaultdict(int)
    seen = set(starts)
    q = deque(starts)
    while q:
        u = q.popleft()
        for v, _ in edges.get(u, ()):
            indeg[v] += 1
            if v not in seen:
                seen.add(v)
                q.append(v)
    for p in starts:
        arrival[p] = launch[p]
    q = deque(p for p in starts if indeg[p] == 0)
    while q:
        u = q.popleft()
        for v, d in edges.get(u, ()):
            if arrival.get(u, 0) + d > arrival.get(v, -1):
                arrival[v] = arrival.get(u, 0) + d
                pred[v] = u
            indeg[v] -= 1
            if indeg[v] == 0:
                q.append(v)
    for p in sorted((p for p in setup if SHOW in p and p in arrival), key=lambda p: -arrival[p])[:1]:
        path = [p]
        while path[-1] in pred:
            path.append(pred[path[-1]])
        print("\n-- %s: path to %s (arrival %.2f ns)" % (label, p, arrival[p] / 1000))
        for u in reversed(path):
            print("   %8.2f  %s" % (arrival[u] / 1000, u))


if SHOW:
    show("outside", lambda p: not in_core(p), lambda p: True)
    show("core", lambda p: in_core(p), lambda p: not in_core(p))
else:
    a = analyse(lambda p: not in_core(p) and keep_start(p), keep_end, "from outside the cores")
    b = analyse(lambda p: in_core(p), lambda p: not in_core(p) and keep_end(p), "from the cores to outside")
