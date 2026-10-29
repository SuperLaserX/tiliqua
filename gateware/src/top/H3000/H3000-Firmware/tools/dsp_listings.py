#!/usr/bin/env python3
"""Write a TMS32010 disassembly listing for every DSP microcode record in the ROMs.

Output: dsp/asm/<set>/<key>_<algorithm>_dsp<n>.asm plus dsp/asm/<set>/INDEX.md

Each microcode record payload is: one word holding the load address (always $0800),
then the program words, which the 6809 copies into the selected DSP's program RAM
(bank latch $81/$82/$83 maps DSP 1/2/3 program memory into the $0000 window).
"""
import io
import os
import re
import sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import romfs  # noqa: E402
import tms32010_dis  # noqa: E402

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))


def slug(s):
    return re.sub(r"[^A-Za-z0-9]+", "_", s).strip("_") or "unnamed"


def main():
    for set_name in sorted(romfs.SETS):
        names = {}
        records = []
        for rom, boff, off, key, length, extra, payload in romfs.iter_set(set_name):
            hi, lo = key >> 8, key & 0xFF
            if lo == 0x00 and hi < 0xC8 and payload:
                names.setdefault(hi, romfs.text(payload[2:18]))
            if romfs.is_microcode(key, payload):
                records.append((rom, boff + off, key, payload))
        out_dir = os.path.join(ROOT, "dsp", "asm", set_name)
        os.makedirs(out_dir, exist_ok=True)
        seen = {}
        index = ["# TMS32010 microcode - %s" % set_name, "",
                 "| key | algorithm | DSP | words | ROM offset | listing |", "|---|---|---|---|---|---|"]
        for rom, where, key, payload in records:
            if (key, payload) in seen:
                continue
            hi, lo = key >> 8, key & 0xFF
            algo = names.get(hi, "program %02X" % hi)
            dsp = lo - 0x10 + 1
            fname = "%04X_%s_dsp%d.asm" % (key, slug(algo), dsp)
            if fname in seen.values():
                fname = fname.replace(".asm", "_%s_%05X.asm" % (rom.split(".")[0].split("_")[-1], where))
            seen[(key, payload)] = fname
            words = tms32010_dis.words_from(payload)
            org = words[0] & 0xFFF
            buf = io.StringIO()
            buf.write("; Eventide %s DSP microcode\n" % set_name)
            buf.write("; key %04X  algorithm %02X (%s)  DSP %d\n" % (key, hi, algo, dsp))
            buf.write("; source %s offset %05X, %d program words loaded at %03X\n" % (
                rom, where, len(words) - 1, org))
            buf.write(";\n")
            tms32010_dis.disassemble(words[1:], org, out=buf)
            with open(os.path.join(out_dir, fname), "w", newline="\n") as fh:
                fh.write(buf.getvalue())
            index.append("| %04X | %s | %d | %d | %s +%05X | [%s](%s) |" % (
                key, algo, dsp, len(words) - 1, rom, where, fname, fname))
        with open(os.path.join(out_dir, "INDEX.md"), "w", newline="\n") as fh:
            fh.write("\n".join(index) + "\n")
        # image file -> readable program name, used by ghidra/scripts/H3000ImportDsp.java
        img_dir = os.path.join(ROOT, "dsp", "images", set_name)
        if os.path.isdir(img_dir):
            with open(os.path.join(img_dir, "names.txt"), "w", newline="\n") as fh:
                for rom, where, key, payload in records:
                    fname = seen.get((key, payload))
                    img = "ucode_%04X_%s_%05X.bin" % (key, rom.split(".")[0].split("_")[-1], where)
                    if fname and os.path.exists(os.path.join(img_dir, img)):
                        fh.write("%s %s\n" % (img, fname[:-4]))
        print("%s: %d listings -> %s" % (set_name, len(seen), out_dir))
    return 0


if __name__ == "__main__":
    sys.exit(main())
