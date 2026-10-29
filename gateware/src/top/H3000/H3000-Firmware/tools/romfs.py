#!/usr/bin/env python3
"""Walk the record chains ("ROM file system") of Eventide H3000/H3500 ROM banks.

Every 16 KB bank holds a chain of records:

    +0  key     2 bytes   (module id, sub id); AA55 = bank header, FFFF = end of chain
    +2  length  2 bytes   total record length including this 8-byte header
    +4  extra   4 bytes   F9 00 00 00 on the bank header, FA 00 00 00 on the end marker,
                          otherwise 00 00 00 00 (preset records use the first byte)
    +8  payload length-8 bytes

The kernel finds records by key (API_FC02 / $88BB in v1.53). Observed key families:
    mm00        algorithm module parameter/preset table (payload starts "mm 01 NAME...")
    mm01, mm02  6809 code for module mm (module-relative, entered at payload start)
    mm06        tables
    mm10-mm1F   TMS32010 microcode; sub 10/11/12 = DSP 1/2/3 (payload: load address word, code words)
    C8xx-CBxx   factory presets (payload starts with the algorithm key, then the name)

Usage:
    romfs.py [--set NAME]          list every record
    romfs.py --extract DIR         also write every unique TMS32010 microcode record to DIR
"""
import argparse
import os
import struct
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
BANK = 0x4000

SETS = {
    "h3000_v153": ["H3000_153_BigROM.BIN", "H3000_153_SmallROM.BIN"],
    "h3500": ["H3000-Upgrade_ROM1.BIN", "H3000-Upgrade_ROM2.BIN", "H3000-Upgrade_ROM3.BIN",
              "H3000-Upgrade_ROM4.BIN", "H3000-Upgrade_ROM5.BIN"],
}


def walk_bank(bank):
    """Yield (offset, key, length, extra, payload) for each record in one bank."""
    off = 0
    while off + 8 <= len(bank):
        key, length = struct.unpack(">HH", bank[off:off + 4])
        extra = bank[off + 4:off + 8]
        if off == 0 and key != 0xAA55:
            return
        if length < 8:
            yield off, key, length, extra, b""
            return
        payload = bank[off + 8:off + length]
        yield off, key, length, extra, payload
        if key == 0xFFFF:
            return
        off += length


def text(raw):
    """Printable ASCII up to the first NUL."""
    raw = raw.split(bytes([0]))[0]
    return "".join(chr(c) if 0x20 <= c < 0x7F else "." for c in raw).rstrip()


def is_microcode(key, payload):
    """TMS32010 image: sub id 10-1F of a non-preset module, payload starting with the $0800 load word."""
    return (key >> 8) < 0xC8 and 0x10 <= (key & 0xFF) <= 0x1F and payload[:2] == bytes([0x08, 0x00])


def describe(key, payload):
    hi, lo = key >> 8, key & 0xFF
    if key == 0xAA55:
        return "bank header"
    if key == 0xFFFF:
        return "end of chain"
    if 0xC8 <= hi <= 0xCF:
        return "preset %03X  algorithm %02X%02X  %r" % (key - 0xC800, payload[0], payload[1], text(payload[2:18]))
    if lo == 0x00:
        return "module %02X table  %r" % (hi, text(payload[2:18]))
    if lo in (0x01, 0x02, 0x03):
        return "module %02X 6809 code" % hi
    if is_microcode(key, payload):
        org = struct.unpack(">H", payload[:2])[0] if len(payload) >= 2 else 0
        return "DSP program %02X for DSP %d (load %03X, %d words)" % (
            hi, lo - 0x10 + 1, org & 0xFFF, (len(payload) - 2) // 2)
    return "module %02X sub %02X" % (hi, lo)


def iter_set(set_name):
    for rom in SETS[set_name]:
        data = open(os.path.join(ROOT, rom), "rb").read()
        for boff in range(0, len(data), BANK):
            bank = data[boff:boff + BANK]
            for off, key, length, extra, payload in walk_bank(bank):
                yield rom, boff, off, key, length, extra, payload


def main():
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("--extract", help="directory for TMS32010 microcode records")
    ap.add_argument("--set", choices=sorted(SETS), help="only this firmware set")
    a = ap.parse_args()
    for set_name in sorted(SETS):
        if a.set and set_name != a.set:
            continue
        seen = set()
        print("==", set_name)
        for rom, boff, off, key, length, extra, payload in iter_set(set_name):
            if key in (0xAA55, 0xFFFF):
                continue
            sig = (key, payload)
            dup = sig in seen
            seen.add(sig)
            print("  %-24s bank %05X +%04X  key %04X len %04X  %s%s" % (
                rom, boff, off, key, length, describe(key, payload), "  (duplicate)" if dup else ""))
            if a.extract and is_microcode(key, payload) and not dup:
                d = os.path.join(a.extract, set_name)
                os.makedirs(d, exist_ok=True)
                tag = rom.split(".")[0].split("_")[-1]
                fn = os.path.join(d, "ucode_%04X_%s_%05X.bin" % (key, tag, boff + off))
                open(fn, "wb").write(payload)
    return 0


if __name__ == "__main__":
    sys.exit(main())
