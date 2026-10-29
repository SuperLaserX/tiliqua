"""Pack a ROM set into one image file (the "H3K1" format of emu/src/roms.rs).

usage: python pack_roms.py <firmware dir> <v153|h3500> <out> [--lzma]

The firmware embeds the image of its variant LZMA-compressed (`top.py` makes
it with `compressed()`; emu/src/lzma.rs decodes it at boot): the H3500 set
packs to 832 KB, compressed about 135 KB, which fits in a flash slot.

The H3500 set is the OS 2.17 kernel with every program ROM there is (780
programs): the four chips of H3000-Upgrade_ROM2-5, with ROM3 replaced by its
newer revision from the H3500 DFX set (215031-A, "ROM3-22"). ROM2 and ROM5
are 128 KB chips dumped as 256 KB (the same data twice); they are packed at
their real size (the emulator repeats a small chip across its socket, as the
hardware does).

The image's last chip slot carries the set's program list (numbers and
names, from `H3000-Firmware/programs-<kind>.txt`, made with the PC runner's
`programs` command), which the front panel browses.
"""

import lzma
import os
import struct
import sys

MAGIC = b"H3K1"
# (firmware kind, [(file, bytes to take or None for all)])
CHIPS = {
    "v153": (0, [("H3000_153_BigROM.BIN", None), ("H3000_153_SmallROM.BIN", None)]),
    "h3500": (1, [
        ("H3000-Upgrade_ROM1.BIN", None),                    # kernel, OS 2.17 (= DFX OPSYS_2.17_ROM1.U53)
        ("H3000-Upgrade_ROM2.BIN", 0x20000),                 # = DFX 215033-A_A500_ROM4.U251
        ("H3500_DFX/215031-A_5D00_ROM3-22.U253", None),     # newer than H3000-Upgrade_ROM3.BIN
        ("H3000-Upgrade_ROM4.BIN", None),                    # = DFX H3500_1.0_ROM2.U252
        ("H3000-Upgrade_ROM5.BIN", 0x20000),                 # not in the DFX set
    ]),
}
N_CHIPS = 6
# The program list goes in the last chip slot: per program a 2-byte LE
# number and the name, space padded to 16 bytes.
LIST_SLOT = N_CHIPS - 1
NAME_BYTES = 16


def program_list(fw_dir, kind):
    out = b""
    for line in open(os.path.join(fw_dir, "programs-%s.txt" % kind), encoding="latin-1"):
        num, name = line.rstrip("\n").split("\t")
        out += struct.pack("<H", int(num)) + name.encode("latin-1")[:NAME_BYTES].ljust(NAME_BYTES)
    return out


def pack(fw_dir, kind):
    fw, files = CHIPS[kind]
    chips = []
    for name, size in files:
        data = open(os.path.join(fw_dir, name), "rb").read()
        if size is not None:
            # The dump repeats the chip: keep one copy.
            assert data[size:] == data[:len(data) - size], name
            data = data[:size]
        chips.append(data)
    chips += [b""] * (LIST_SLOT - len(chips))
    chips.append(program_list(fw_dir, kind))
    header = MAGIC + struct.pack("<B3x", fw) + struct.pack("<%dI" % N_CHIPS, *(len(c) for c in chips))
    assert len(header) == 32
    return header + b"".join(chips)


def compressed(fw_dir, kind):
    """The packed image as an ".lzma" stream (lc + lp <= 3 for the decoder)."""
    filters = [{"id": lzma.FILTER_LZMA1, "preset": 9 | lzma.PRESET_EXTREME,
                "lc": 3, "lp": 0, "pb": 0, "dict_size": 1 << 20}]
    return lzma.compress(pack(fw_dir, kind), format=lzma.FORMAT_ALONE, filters=filters)


def main():
    fw_dir, kind, out = sys.argv[1:4]
    img = compressed(fw_dir, kind) if "--lzma" in sys.argv[4:] else pack(fw_dir, kind)
    with open(out, "wb") as f:
        f.write(img)
    print("wrote %s (%d bytes)" % (out, len(img)))


if __name__ == "__main__":
    main()
