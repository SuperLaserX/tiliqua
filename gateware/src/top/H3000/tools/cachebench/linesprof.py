"""Per source line instruction counts of the cachebench run.

usage: python linesprof.py <cachebench ELF> <roms-*.lzma> [warm_ms] [window_ms] [lines]
           [cachesim.py options]
"""
import collections
import lzma
import re
import subprocess
import sys

import cachesim


def line_map(elf):
    """Instruction address -> (function, file:line), from objdump -l."""
    out = subprocess.run(["rust-objdump", "-d", "-l", "--no-show-raw-insn", elf],
                         capture_output=True, text=True).stdout
    m = {}
    func = loc = "?"
    for l in out.splitlines():
        if re.match(r"^[0-9a-f]+ <", l):
            func = l.split("<", 1)[1].rstrip(">:")
            loc = "?"
        elif l.startswith(";") and ":" in l:
            loc = l[1:].strip()
            loc = re.sub(r".*[\/](src[\/])", r"\1", loc)
        else:
            mm = re.match(r"^\s*([0-9a-f]+):\s*(.*)", l)
            if mm:
                m[int(mm.group(1), 16)] = (func, loc, mm.group(2))
    return m


def main():
    args = [a for a in sys.argv[1:] if not a.startswith("--")]
    elf, rom = args[0], args[1]
    warm = int(args[2]) if len(args) > 2 else 6000
    window = int(args[3]) if len(args) > 3 else 50
    image = lzma.decompress(open(rom, "rb").read(), format=lzma.FORMAT_ALONE)
    blocks, sizes, _ = cachesim.record(elf, image, warm, window)
    per_addr = collections.Counter()
    for a, s in zip(blocks, sizes):
        for i in range(0, s, 4):
            per_addr[a + i] += 1
    lm = line_map(elf)
    total = sum(per_addr.values())
    by_line = collections.Counter()
    for a, n in per_addr.items():
        f, loc, _ = lm.get(a, ("?", "?", ""))
        by_line[loc] += n
    print("total %d instructions in %d ms (%.1fM/s)" % (total, window, total / window / 1e3))
    for loc, n in by_line.most_common(int(args[4]) if len(args) > 4 else 60):
        print("%6.2f%%  %s" % (100 * n / total, loc))
    with open("addrprof.txt", "w") as f:
        for a in sorted(per_addr):
            fn, loc, ins = lm.get(a, ("?", "?", ""))
            f.write("%08x %8d  %-40s %s\n" % (a, per_addr[a], ins, loc))


if __name__ == "__main__":
    main()
