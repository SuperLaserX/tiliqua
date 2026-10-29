"""Cache behaviour of the 6809 emulator on the Tiliqua's VexiiRiscv.

usage: python cachesim.py <cachebench ELF> <roms-*.lzma> [warm_ms] [window_ms] [--profile]
           [--program=N] [--firq-polls=N]

Runs the cachebench program (the emulator as RISC-V code, laid out as the
firmware is) under Unicorn: a factory reset and program 100 (or program N,
loaded 3 s after the reset; give it some 10 s of warm-up) idling for
`warm_ms`, then records instruction fetches and data accesses for
`window_ms` of emulated time and replays them through cache models. Without
DSPs there is a FIRQ every N interrupt polls (default 1400: 30 a second).
Prints,
per emulated second, the instructions executed and the misses of each
model, split by backing memory (PSRAM or block RAM).

The firmware's status line gives the emulator's capacity on hardware; with
the instruction count that calibrates the cost of a PSRAM miss.
"""

import lzma
import struct
import sys
from array import array

from unicorn import Uc, UC_ARCH_RISCV, UC_MODE_RISCV32, UC_HOOK_INTR, UC_HOOK_BLOCK, \
    UC_HOOK_MEM_READ, UC_HOOK_MEM_WRITE, UC_MEM_WRITE
from unicorn.riscv_const import UC_RISCV_REG_PC, UC_RISCV_REG_A7

BLOCKRAM = (0x0, 0x8000)
PSRAM = (0x2000_0000, 0x100_0000)
IMAGE = 0x2080_0000
E_HZ = 1_146_600


def load_elf(uc, path):
    d = open(path, "rb").read()
    entry, phoff = struct.unpack_from("<II", d, 0x18)
    phentsize, phnum = struct.unpack_from("<HH", d, 0x2A)
    for i in range(phnum):
        p_type, off, vaddr, paddr, filesz, memsz = struct.unpack_from("<6I", d, phoff + i * phentsize)
        if p_type == 1 and filesz:
            uc.mem_write(vaddr, d[off:off + filesz])
    return entry


def option(name, default):
    for a in sys.argv:
        if a.startswith("--%s=" % name):
            return int(a.split("=", 1)[1])
    return default


def record(elf, image, warm_ms, window_ms):
    uc = Uc(UC_ARCH_RISCV, UC_MODE_RISCV32)
    uc.mem_map(*BLOCKRAM)
    uc.mem_map(*PSRAM)
    entry = load_elf(uc, elf)
    uc.mem_write(IMAGE, image)
    uc.mem_write(IMAGE - 20, struct.pack("<IIIII", option("firq-polls", 1400), option("program", 0),
                                         window_ms, warm_ms, len(image)))
    marks = []

    def on_intr(uc, intno, _):
        a7 = uc.reg_read(UC_RISCV_REG_A7)
        pc = uc.reg_read(UC_RISCV_REG_PC)
        marks.append(a7)
        uc.reg_write(UC_RISCV_REG_PC, pc + 4)
        uc.emu_stop()

    uc.hook_add(UC_HOOK_INTR, on_intr)
    uc.emu_start(entry, 0xFFFF_FFFF)
    assert marks == [1], marks
    # Instruction fetches as (block address, bytes); data accesses as
    # address | write << 31 (addresses are below 2**30).
    blocks = array("I")
    sizes = array("H")
    data = array("I")

    def on_block(uc, addr, size, _):
        blocks.append(addr)
        sizes.append(size)

    def on_mem(uc, access, addr, size, value, _):
        data.append(addr | ((access == UC_MEM_WRITE) << 31))

    uc.hook_add(UC_HOOK_BLOCK, on_block)
    uc.hook_add(UC_HOOK_MEM_READ | UC_HOOK_MEM_WRITE, on_mem)
    # Blocks translated during the warm-up carry no hooks.
    uc.ctl_flush_tb()
    uc.emu_start(uc.reg_read(UC_RISCV_REG_PC), 0xFFFF_FFFF)
    assert marks == [1, 2], marks
    print("LCD: " + bytes(uc.mem_read(IMAGE - 0x100, 40)).decode("latin-1"))
    return blocks, sizes, data


def in_psram(addr):
    return addr >= PSRAM[0]


def icache(blocks, sizes, sets, ways, line=64, fast=()):
    """LRU set-associative instruction cache: misses (PSRAM, fast memory).
    `fast`: address ranges served from block RAM."""
    shift = line.bit_length() - 1
    state = [[] for _ in range(sets)]
    slow = quick = 0
    for addr, size in zip(blocks, sizes):
        for ln in range(addr >> shift, (addr + size - 1 >> shift) + 1):
            s = state[ln % sets]
            if ln in s:
                if s[0] != ln:
                    s.remove(ln)
                    s.insert(0, ln)
                continue
            s.insert(0, ln)
            if len(s) > ways:
                s.pop()
            a = ln << shift
            if any(lo <= a < hi for lo, hi in fast) or not in_psram(a):
                quick += 1
            else:
                slow += 1
    return slow, quick


def dcache(data, sets, ways, line=64):
    """LRU write-back, write-allocate data cache: (PSRAM misses, PSRAM
    write-backs, block RAM misses)."""
    shift = line.bit_length() - 1
    state = [[] for _ in range(sets)]
    dirty = set()
    slow = wb = quick = 0
    for x in data:
        write = x >> 31
        ln = (x & 0x7FFF_FFFF) >> shift
        s = state[ln % sets]
        if ln in s:
            if s[0] != ln:
                s.remove(ln)
                s.insert(0, ln)
        else:
            s.insert(0, ln)
            if in_psram(ln << shift):
                slow += 1
            else:
                quick += 1
            if len(s) > ways:
                v = s.pop()
                if v in dirty:
                    dirty.discard(v)
                    if in_psram(v << shift):
                        wb += 1
        if write:
            dirty.add(ln)
    return slow, wb, quick


def main():
    elf, rom = sys.argv[1], sys.argv[2]
    args = [a for a in sys.argv[1:] if not a.startswith("--")]
    warm_ms = int(args[2]) if len(args) > 2 else 6000
    window_ms = int(args[3]) if len(args) > 3 else 200
    image = lzma.decompress(open(rom, "rb").read(), format=lzma.FORMAT_ALONE)
    blocks, sizes, data = record(elf, image, warm_ms, window_ms)
    per_s = 1000 / window_ms
    instrs = sum(sizes) // 4
    print("per emulated second: %.1fM instructions, %.1fM data accesses" % (
        instrs * per_s / 1e6, len(data) * per_s / 1e6))
    for name, sets, ways in (("I$ 8K 2-way (now)", 64, 2), ("I$ 16K 2-way", 128, 2),
                             ("I$ 16K 4-way", 64, 4), ("I$ 32K 4-way", 128, 4)):
        slow, quick = icache(blocks, sizes, sets, ways)
        print("  %-20s %8.0fk PSRAM misses" % (name, slow * per_s / 1e3))
    if "--profile" in sys.argv:
        profile(elf, blocks, sizes)
    for name, sets, ways in (("D$ 4K 1-way (now)", 64, 1), ("D$ 8K 2-way", 64, 2),
                             ("D$ 16K 4-way", 64, 4)):
        slow, wb, quick = dcache(data, sets, ways)
        print("  %-20s %8.0fk PSRAM misses, %6.0fk write-backs, %6.0fk block RAM misses" % (
            name, slow * per_s / 1e3, wb * per_s / 1e3, quick * per_s / 1e3))



def profile(elf, blocks, sizes, top=25):
    """Instructions executed per function (from `cargo nm` output)."""
    import bisect
    import subprocess
    out = subprocess.run(["cargo", "nm", "--release", "--", "-C", "--print-size", "--defined-only"],
                         capture_output=True, text=True).stdout
    syms = []
    for l in out.splitlines():
        f = l.split(None, 3)
        if len(f) == 4 and f[2] in "tT":
            syms.append((int(f[0], 16), int(f[1], 16), f[3]))
    syms.sort()
    starts = [s[0] for s in syms]
    count = {}
    for addr, size in zip(blocks, sizes):
        i = bisect.bisect_right(starts, addr) - 1
        name = syms[i][2] if i >= 0 and addr < syms[i][0] + syms[i][1] else "?"
        count[name] = count.get(name, 0) + size // 4
    total = sum(count.values())
    for name, n in sorted(count.items(), key=lambda kv: -kv[1])[:top]:
        print("  %5.1f%%  %s" % (100 * n / total, name[:90]))


if __name__ == "__main__":
    main()
