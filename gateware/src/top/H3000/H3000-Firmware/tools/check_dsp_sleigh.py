#!/usr/bin/env python3
"""Cross-check the Ghidra TMS32010 SLEIGH module against tools/tms32010_dis.py.

Input: instruction dumps written by ghidra/scripts/H3000DspDump.java ("<addr>\\t<instruction>"),
one file per imported DSP program, named after the image (ucode_<key>_<rom>_<off>.txt).
Every instruction Ghidra decoded is re-decoded with the Python disassembler and the
normalized text (mnemonic, registers, numeric operands as values) is compared.

Usage: check_dsp_sleigh.py <dump dir> <images dir>
"""
import os
import re
import sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import tms32010_dis as dis  # noqa: E402

NUM = re.compile(r"#?(-?0x[0-9a-fA-F]+|L[0-9A-F]{3}\b|-?\d+)")


def normalize(text):
    text = text.strip()
    mnem, _, ops = text.partition(" ")

    def val(m):
        t = m.group(1)
        if t.startswith("L"):
            return str(int(t[1:], 16))
        return str(int(t, 16) if "0x" in t.lower() else int(t))

    ops = NUM.sub(val, ops.replace(" ", ""))
    return mnem.upper(), ops.upper()


def main():
    dump_dir, img_dir = sys.argv[1], sys.argv[2]
    # program name -> image file (names.txt from tools/dsp_listings.py); default: same name
    by_name = {}
    names_txt = os.path.join(img_dir, "names.txt")
    if os.path.exists(names_txt):
        for line in open(names_txt):
            parts = line.split()
            if len(parts) == 2:
                by_name[parts[1]] = parts[0]
    total = bad = 0
    for fn in sorted(os.listdir(dump_dir)):
        if not fn.endswith(".txt"):
            continue
        img = os.path.join(img_dir, by_name.get(fn[:-4], fn[:-4] + ".bin"))
        words = dis.words_from(open(img, "rb").read())
        org = words[0] & 0xFFF
        words = words[1:]
        st = dis.State()
        mism = []
        lines = [ln.rstrip("\n").split("\t") for ln in open(os.path.join(dump_dir, fn))]
        for addr_s, gtext in lines:
            addr = int(addr_s, 16)
            i = addr - org
            # Ghidra follows DP/ARP along flow; replay them linearly up to this point
            n, ptext, _, _ = dis.decode(words, i, st)
            total += 1
            if normalize(gtext) != normalize(ptext):
                mism.append((addr, gtext, ptext))
        bad += len(mism)
        status = "ok" if not mism else "%d mismatches" % len(mism)
        print("%-32s %5d instructions  %s" % (fn[:-4], len(lines), status))
        for addr, g, p in mism[:8]:
            print("    %03X  ghidra: %-28s python: %s" % (addr, g, p))
    print("total %d instructions compared, %d mismatches" % (total, bad))
    return 1 if bad else 0


if __name__ == "__main__":
    sys.exit(main())
