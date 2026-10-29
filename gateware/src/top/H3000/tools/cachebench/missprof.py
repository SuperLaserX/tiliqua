"""I$ misses per function / source line of the cachebench run (16K 4-way).

usage: python missprof.py <cachebench ELF> <roms-*.lzma> [warm_ms] [window_ms] [cachesim.py options]
"""
import collections
import lzma
import sys

import cachesim
import linesprof


def main():
    args = [a for a in sys.argv[1:] if not a.startswith("--")]
    elf, rom = args[0], args[1]
    warm = int(args[2]) if len(args) > 2 else 6000
    window = int(args[3]) if len(args) > 3 else 100
    image = lzma.decompress(open(rom, "rb").read(), format=lzma.FORMAT_ALONE)
    blocks, sizes, _ = cachesim.record(elf, image, warm, window)
    sets, ways = 64, 4
    state = [[] for _ in range(sets)]
    misses = collections.Counter()
    for addr, size in zip(blocks, sizes):
        for ln in range(addr >> 6, (addr + size - 1 >> 6) + 1):
            s = state[ln % sets]
            if ln in s:
                if s[0] != ln:
                    s.remove(ln)
                    s.insert(0, ln)
                continue
            s.insert(0, ln)
            if len(s) > ways:
                s.pop()
            misses[ln] += 1
    lm = linesprof.line_map(elf)
    by_fn = collections.Counter()
    by_loc = collections.Counter()
    for ln, n in misses.items():
        f, loc, _ = lm.get(ln << 6, lm.get((ln << 6) + 4, ("?", "?", "")))
        by_fn[f[:60]] += n
        by_loc[loc] += n
    tot = sum(misses.values())
    print("misses %.0fk/s" % (tot * 1000 / window / 1e3))
    for f, n in by_fn.most_common(12):
        print("%5.1f%%  %s" % (100 * n / tot, f))
    for f, n in by_loc.most_common(25):
        print("%5.1f%%  %s" % (100 * n / tot, f))


if __name__ == "__main__":
    main()
