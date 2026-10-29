#!/usr/bin/env python3
"""Split the Eventide H3000 / H3500 ROM dumps into kernel images and 16 KB banks.

Hardware model (6809 host CPU):
  $0000-$3FFF  banked ROM window (one 16 KB bank, selected via the bank latch at $8052)
  $6000-$7FFF  RAM
  $8000-$83FF  I/O
  $8400-$FFFF  kernel ROM (first 32 KB of the kernel EPROM; $8000-$83FF of it is hidden by I/O)

Every 16 KB bank starts with a header:
  +0  AA 55          signature
  +2  00 08 F9 00    constant
  +6  00 00
  +8  module id      (65-7B algorithm/code modules, C8-CB preset banks, F8/FE kernel extras)
  +9  type/sub-id
  +A  16-bit word    (format/size field, see docs)
  +C  ...

Outputs (relative to the repo root):
  modules/<set>/kernel.bin            32 KB kernel image, maps to $8000
  modules/<set>/bank_<src>_<off>.bin  each unique, non-blank 16 KB bank, maps to $0000
  modules/manifest.json               description of every bank
"""
import hashlib
import json
import os
import re
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
BANK = 0x4000

SETS = {
    "h3000_v153": {
        "kernel": ("H3000_153_BigROM.BIN", 0x0000),
        "roms": ["H3000_153_BigROM.BIN", "H3000_153_SmallROM.BIN"],
    },
    "h3500": {
        "kernel": ("H3000-Upgrade_ROM1.BIN", 0x0000),
        "roms": ["H3000-Upgrade_ROM1.BIN", "H3000-Upgrade_ROM2.BIN", "H3000-Upgrade_ROM3.BIN",
                 "H3000-Upgrade_ROM4.BIN", "H3000-Upgrade_ROM5.BIN"],
    },
}

ROM_TAGS = {
    "H3000_153_BigROM.BIN": "big",
    "H3000_153_SmallROM.BIN": "small",
    "H3000-Upgrade_ROM1.BIN": "r1",
    "H3000-Upgrade_ROM2.BIN": "r2",
    "H3000-Upgrade_ROM3.BIN": "r3",
    "H3000-Upgrade_ROM4.BIN": "r4",
    "H3000-Upgrade_ROM5.BIN": "r5",
}


def microcode_starts(bank):
    """Offsets of TMS32010 images: a 0x0800 load-address word followed by init opcodes."""
    init_ops = {0x7F8B, 0x7F81, 0x6E00, 0x6880, 0x6881, 0x7F8A}
    hits = []
    for i in range(0x10, len(bank) - 10, 2):
        if bank[i] == 0x08 and bank[i + 1] == 0x00:
            words = [(bank[i + 2 + 2 * k] << 8) | bank[i + 3 + 2 * k] for k in range(4)]
            if sum(1 for w in words if w in init_ops) >= 3:
                hits.append(i)
    return hits


def describe(bank):
    if bank[:2] != b"\xaa\x55":
        return None
    mod_id, sub = bank[8], bank[9]
    word_a = (bank[10] << 8) | bank[11]
    name = None
    m = re.match(rb"[\x20-\x7e]{3,16}", bank[0x12:0x22])
    if m:
        name = m.group().decode().rstrip()
    first_op = bank[0x10:0x14].hex()
    if sub in (0x01, 0x02) and mod_id < 0xC8:
        kind = "6809 code module"
    elif sub == 0x10:
        kind = "TMS32010 microcode bank"
    elif sub == 0x06:
        kind = "table bank"
    elif mod_id >= 0xC8 and mod_id <= 0xCF:
        kind = "preset bank"
    elif sub == 0x00:
        kind = "algorithm / preset module"
    else:
        kind = "other"
    return {
        "module_id": "%02X" % mod_id,
        "sub": "%02X" % sub,
        "word_0A": "%04X" % word_a,
        "byte_0C": "%02X" % bank[12],
        "kind": kind,
        "name": name,
        "first_bytes": first_op,
    }


def main():
    out_root = os.path.join(ROOT, "modules")
    manifest = {}
    for set_name, cfg in SETS.items():
        out_dir = os.path.join(out_root, set_name)
        os.makedirs(out_dir, exist_ok=True)
        kfile, koff = cfg["kernel"]
        kdata = open(os.path.join(ROOT, kfile), "rb").read()[koff:koff + 0x8000]
        open(os.path.join(out_dir, "kernel.bin"), "wb").write(kdata)
        entries = []
        seen = {}
        for rom in cfg["roms"]:
            data = open(os.path.join(ROOT, rom), "rb").read()
            for off in range(0, len(data), BANK):
                if rom == kfile and off < 0x8000:
                    continue  # kernel itself
                bank = data[off:off + BANK]
                if bank.count(0xFF) >= BANK - 2:
                    continue  # blank (allow a checksum-fix byte)
                digest = hashlib.sha1(bank).hexdigest()
                tag = "%s_%05x" % (ROM_TAGS[rom], off)
                if digest in seen:
                    entries.append({"source": rom, "offset": "%05X" % off, "duplicate_of": seen[digest]})
                    continue
                seen[digest] = tag
                fname = "bank_%s.bin" % tag
                open(os.path.join(out_dir, fname), "wb").write(bank)
                end = len(bank)
                while end > 0 and bank[end - 1] == 0xFF:
                    end -= 1
                info = describe(bank) or {"kind": "no header"}
                info.update({
                    "tag": tag,
                    "file": "%s/%s" % (set_name, fname),
                    "source": rom,
                    "offset": "%05X" % off,
                    "used_bytes": "%04X" % end,
                    "sha1": digest,
                    "microcode_images": ["%04X" % h for h in microcode_starts(bank)],
                })
                entries.append(info)
        manifest[set_name] = {"kernel": "%s/kernel.bin" % set_name, "kernel_source": kfile, "banks": entries}
    with open(os.path.join(out_root, "manifest.json"), "w") as fh:
        json.dump(manifest, fh, indent=1)
    for set_name, m in manifest.items():
        print("==", set_name)
        for e in m["banks"]:
            if "duplicate_of" in e:
                print("   %-6s %s dup of %s" % (e["source"][-8:-4], e["offset"], e["duplicate_of"]))
            else:
                print("   %-10s id=%s sub=%s w=%s %-26s %-16s ucode=%d" % (
                    e["tag"], e.get("module_id"), e.get("sub"), e.get("word_0A"), e["kind"],
                    e.get("name") or "", len(e["microcode_images"])))
    return 0


if __name__ == "__main__":
    sys.exit(main())
