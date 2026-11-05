"""A FAT32 image shaped like a real drive Windows has been given a folder: an MBR, a volume that claims far more than the image
holds, real clusters, directories that run over several of them, and short names made the way Windows makes them.

    make_drive_image.py out.img <folder> <sectors per cluster> <volume GB> [--scatter]

`folder` goes on as `FAIRWAVE/`. `--scatter` leaves a gap after every cluster of every file, so that nothing is contiguous.
"""
import hashlib
import os
import struct
import sys
from pathlib import Path

SECTOR = 512
PART_START = 2048
RESERVED = 8192
FATS = 2
ROOT = 2
ALLOWED = set("ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!#$%&'()-@^_`{}~")


class Image:
    def __init__(self, spc, volume_gb, scatter):
        self.spc = spc
        self.scatter = scatter
        self.volume_sectors = int(volume_gb * (1 << 30)) // SECTOR - PART_START
        clusters = (self.volume_sectors - RESERVED) // spc
        self.fat_sectors = (clusters + 2) * 4 // SECTOR + 1
        self.clusters = (self.volume_sectors - RESERVED - FATS * self.fat_sectors) // spc
        assert self.clusters >= 65525, "too small for FAT32"
        self.fat = {0: 0x0FFFFFF8, 1: 0x0FFFFFFF}
        self.next = ROOT
        self.data = {}
        self.cluster_bytes = spc * SECTOR

    def alloc(self, n):
        out = []
        for _ in range(max(n, 1)):
            out.append(self.next)
            self.next += 2 if self.scatter else 1
        assert self.next < self.clusters + 2, "volume full"
        for a, b in zip(out, out[1:]):
            self.fat[a] = b
        self.fat[out[-1]] = 0x0FFFFFFF
        return out

    def store(self, clusters, bytes_):
        for k, c in enumerate(clusters):
            piece = bytes_[k * self.cluster_bytes:(k + 1) * self.cluster_bytes]
            if piece:
                self.data[c] = piece


def fits_plain(name):
    base, dot, ext = name.rpartition(".")
    if not dot:
        base, ext = name, ""
    return 0 < len(base) <= 8 and len(ext) <= 3 and name == name.upper() and all(c in ALLOWED for c in base + ext)


def short_of(name, taken):
    """As Windows does: six letters and ~1 to ~4, and then two letters, four of a hash and ~1."""
    upper = name.upper()
    base, dot, ext = upper.rpartition(".")
    if not dot:
        base, ext = upper, ""
    clean = lambda s: "".join(c if c in ALLOWED else "_" for c in s if c not in " .")
    base, ext = clean(base), clean(ext)[:3]
    if fits_plain(name):
        s = (base.ljust(8) + ext.ljust(3)).encode()
        assert s not in taken, name
        return s
    for n in range(1, 5):
        tail = f"~{n}"
        s = (base[:8 - len(tail)] + tail).ljust(8) + ext.ljust(3)
        if s.encode() not in taken:
            return s.encode()
    h = int(hashlib.md5(name.encode("utf-16-le", "replace")).hexdigest(), 16)
    for n in range(1, 100):
        tail = f"{(h + n * 7919) & 0xFFFF:04X}~{n}"[:7] if n > 9 else f"{h & 0xFFFF:04X}~{n}"
        s = (base[:8 - len(tail)] + tail).ljust(8) + ext.ljust(3)
        if s.encode() not in taken:
            return s.encode()
    raise ValueError(name)


def entries_for(name, short, attr, first, size):
    out = b""
    if not fits_plain(name):
        sum_ = 0
        for c in short:
            sum_ = ((sum_ >> 1) | (sum_ << 7)) + c & 0xFF
        units = list(struct.unpack(f"<{len(name.encode('utf-16-le')) // 2}H", name.encode("utf-16-le")))
        parts = (len(units) + 12) // 13
        for p in range(parts, 0, -1):
            piece = units[(p - 1) * 13:p * 13]
            if len(piece) < 13:
                piece = piece + [0] + [0xFFFF] * (12 - len(piece))
            e = bytearray(32)
            e[0] = p | (0x40 if p == parts else 0)
            e[11] = 0x0F
            e[13] = sum_
            for k, s in enumerate((1, 3, 5, 7, 9, 14, 16, 18, 20, 22, 24, 28, 30)):
                e[s:s + 2] = struct.pack("<H", piece[k])
            out += bytes(e)
    e = bytearray(32)
    e[:11] = short
    e[11] = attr
    e[20:22] = struct.pack("<H", first >> 16)
    e[26:28] = struct.pack("<H", first & 0xFFFF)
    e[28:32] = struct.pack("<I", size)
    return out + bytes(e)


def add_folder(img, path, first, parent):
    """Everything under `path` into the directory at cluster chain `first`, files before folders' contents as a copy goes."""
    body = b""
    if parent is not None:
        for name, c in ((b".          ", first[0]), (b"..         ", parent)):
            e = bytearray(32)
            e[:11] = name
            e[11] = 0x10
            e[20:22] = struct.pack("<H", c >> 16)
            e[26:28] = struct.pack("<H", c & 0xFFFF)
            body += bytes(e)
    taken = set()
    subs = []
    for child in sorted(path.iterdir(), key=lambda p: p.name.lower()):
        short = short_of(child.name, taken)
        taken.add(short)
        if child.is_dir():
            n = child_dir_clusters(img, child)
            chain = img.alloc(n)
            subs.append((child, chain))
            body += entries_for(child.name, short, 0x10, chain[0], 0)
        else:
            size = child.stat().st_size
            chain = img.alloc((size + img.cluster_bytes - 1) // img.cluster_bytes)
            img.store(chain, child.read_bytes())
            body += entries_for(child.name, short, 0x20, chain[0], size)
    assert len(body) <= len(first) * img.cluster_bytes, path
    img.store(first, body)
    for child, chain in subs:
        add_folder(img, child, chain, first[0] if parent is not None else 0)


def child_dir_clusters(img, path):
    """Enough for its entries, counted as `add_folder` will write them."""
    bytes_ = 64
    for child in path.iterdir():
        bytes_ += 32 * (1 + (0 if fits_plain(child.name) else (len(child.name.encode("utf-16-le")) // 2 + 12) // 13))
    return bytes_ // img.cluster_bytes + 1


def write(img, out):
    data_start = RESERVED + FATS * img.fat_sectors
    at = lambda sector: (PART_START + sector) * SECTOR
    with open(out, "wb") as f:
        mbr = bytearray(SECTOR)
        mbr[446 + 4] = 0x0C
        mbr[446 + 8:446 + 12] = struct.pack("<I", PART_START)
        mbr[446 + 12:446 + 16] = struct.pack("<I", img.volume_sectors)
        mbr[510:512] = b"\x55\xAA"
        f.write(mbr)
        b = bytearray(SECTOR)
        b[0:3] = b"\xEB\x58\x90"
        b[3:11] = b"MSDOS5.0"
        b[11:13] = struct.pack("<H", SECTOR)
        b[13] = img.spc
        b[14:16] = struct.pack("<H", RESERVED)
        b[16] = FATS
        b[21] = 0xF8
        b[24:26] = struct.pack("<H", 63)
        b[26:28] = struct.pack("<H", 255)
        b[28:32] = struct.pack("<I", PART_START)
        b[32:36] = struct.pack("<I", img.volume_sectors)
        b[36:40] = struct.pack("<I", img.fat_sectors)
        b[44:48] = struct.pack("<I", ROOT)
        b[48:50] = struct.pack("<H", 1)
        b[50:52] = struct.pack("<H", 6)
        b[64] = 0x80
        b[66] = 0x29
        b[67:71] = struct.pack("<I", 0x12345678)
        b[71:82] = b"FAIRWAVE   "
        b[82:90] = b"FAT32   "
        b[510:512] = b"\x55\xAA"
        for s in (0, 6):
            f.seek(at(s))
            f.write(b)
        info = bytearray(SECTOR)
        info[0:4] = struct.pack("<I", 0x41615252)
        info[484:488] = struct.pack("<I", 0x61417272)
        info[488:496] = b"\xFF" * 8
        info[508:512] = struct.pack("<I", 0xAA550000)
        f.seek(at(1))
        f.write(info)
        fat = bytearray((max(img.fat) + 1) * 4)
        for c, v in img.fat.items():
            fat[c * 4:c * 4 + 4] = struct.pack("<I", v)
        for k in range(FATS):
            f.seek(at(RESERVED + k * img.fat_sectors))
            f.write(fat)
        for c, piece in sorted(img.data.items()):
            f.seek(at(data_start + (c - ROOT) * img.spc))
            f.write(piece)
        f.truncate(at(data_start + (img.next - ROOT) * img.spc))
    print(f"{out}: {img.spc} sectors a cluster, {img.clusters} clusters, FAT {img.fat_sectors} sectors, last used cluster {img.next}, "
          f"{os.path.getsize(out) >> 20} MB, volume blocks {PART_START + img.volume_sectors}")


def main():
    out, folder, spc, gb = sys.argv[1], Path(sys.argv[2]), int(sys.argv[3]), float(sys.argv[4])
    img = Image(spc, gb, "--scatter" in sys.argv)
    root = img.alloc(1)
    home = img.alloc(child_dir_clusters(img, folder))
    img.store(root, entries_for("FAIRWAVE", b"FAIRWAVE   ", 0x10, home[0], 0))
    add_folder(img, folder, home, ROOT)
    write(img, out)


if __name__ == "__main__":
    main()
