"""The 6809's time per kernel function, from a runner `profile` file.

usage: python kernelprof.py <profile file> [lines] [h3500|v153]

Record the profile with the runner, e.g.
    h3000-host ../H3000-Firmware h3500 "factory; wait 6; profile on; wait 3; profile p.txt"
(add `dsp on` first for the DSP board model). Kernel addresses are named
from H3000-Firmware/export/<set>/KERNEL.asm; code in ROM banks and RAM is
summed per 256 bytes.
"""
import bisect
import collections
import os
import re
import sys

FW = os.path.join(os.path.dirname(os.path.abspath(__file__)), "..", "H3000-Firmware") + "/"
kind = sys.argv[3] if len(sys.argv) > 3 else "h3500"
ASM = FW + ("export/H3500/KERNEL.asm" if kind == "h3500" else "export/H3000_v153/KERNEL.asm")
funcs = []
name = None
for l in open(ASM, encoding="utf-8", errors="replace"):
    m = re.match(r"; ---- function (\S+)", l)
    if m:
        name = m.group(1)
        continue
    m = re.match(r"\s+([0-9a-f]{4})\s", l)
    if m and name:
        funcs.append((int(m.group(1), 16), name))
        name = None
funcs.sort()
starts = [f[0] for f in funcs]
rows = [l.split() for l in open(sys.argv[1])]
rows = [(int(b, 16), int(p, 16), int(n), int(c)) for b, p, n, c in rows]
C = sum(r[3] for r in rows); N = sum(r[2] for r in rows)
print("%.0f instructions per emulated second, %.2f cycles each" % (N / (C / 1146600), C / N))
agg = collections.Counter(); agn = collections.Counter()
for b, p, n, c in rows:
    if b == 0xFF and p >= 0x8400:
        i = bisect.bisect_right(starts, p) - 1
        k = "%04x %s" % funcs[i] if i >= 0 else "?"
    elif b == 0xFF:
        k = "RAM %04x" % (p & 0xFFF0)
    else:
        k = "bank %02x %04x" % (b, p & 0xFF00)
    agg[k] += c; agn[k] += n
for k, c in agg.most_common(int(sys.argv[2]) if len(sys.argv) > 2 else 30):
    print("%5.1f%%  %7d instr  %s" % (100 * c / C, agn[k], k))
