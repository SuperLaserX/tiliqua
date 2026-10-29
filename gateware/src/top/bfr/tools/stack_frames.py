"""The firmware's largest stack frames, from its disassembly.

    llvm-objdump -d --no-show-raw-insn fw/target/riscv32im-unknown-none-elf/release/tiliqua-fw > fw.dis
    python tools/stack_frames.py fw.dis [N]

The CPU's 32 KB of block RAM holds data and the stack, and nothing guards
the stack's end: twice an overflow hung the firmware. A function's frame is
its prologue's `addi sp, sp, -N`, plus `lui`/`sub` for a frame over 2 KB.
Measure after changing optimisation settings or adding large locals.
"""

import re
import sys


def frames(path):
    fn, out, n, lui = None, {}, 0, {}
    for line in open(path, encoding="utf-8", errors="replace"):
        m = re.match(r"^[0-9a-f]+ <(.*)>:$", line)
        if m:
            fn, n, lui = m.group(1), 0, {}
            out[fn] = 0
            continue
        if fn is None:
            continue
        n += 1
        if n > 40:                                  # (prologues only)
            continue
        m = re.search(r"addi\tsp, sp, -0x([0-9a-f]+)", line)
        if m:
            out[fn] += int(m.group(1), 16)
        m = re.search(r"lui\t(\w+), 0x([0-9a-f]+)", line)
        if m:
            lui[m.group(1)] = int(m.group(2), 16) << 12
        m = re.search(r"addi\t(\w+), (\w+), (-?0x[0-9a-f]+|-?\d+)$", line.strip())
        if m and m.group(1) == m.group(2) and m.group(1) in lui and m.group(1) != "sp":
            lui[m.group(1)] += int(m.group(3), 16) if "0x" in m.group(3) else int(m.group(3))
        m = re.search(r"sub\tsp, sp, (\w+)", line)
        if m and m.group(1) in lui:
            out[fn] += lui[m.group(1)]
    return out


if __name__ == "__main__":
    f = frames(sys.argv[1])
    for name, size in sorted(f.items(), key=lambda kv: -kv[1])[:int(sys.argv[2]) if len(sys.argv) > 2 else 16]:
        print(f"{size:6}  {name[:120]}")
