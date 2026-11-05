"""Reads Korg's Sample Builder and modwave files, which are protobufs in a small container.

A `.korgmultisample` says, for each of its WAVs: where to start, where the loop starts, where to end, whether
it is a one-shot, its top key, its root key and its tuning in cents. `.mwperf` is a modwave Performance
(`performance_blocks` below says what can be told of one).
"""

import struct
import sys
from dataclasses import dataclass
from pathlib import Path


def varint(b, i):
    v = s = 0
    while True:
        c = b[i]
        i += 1
        v |= (c & 0x7F) << s
        s += 7
        if not c & 0x80:
            return v, i


def fields(b):
    """A protobuf message as a list of (number, wire type, value), or None if it doesn't parse as one."""
    out, i = [], 0
    try:
        while i < len(b):
            key, i = varint(b, i)
            n, w = key >> 3, key & 7
            if n == 0:
                return None
            if w == 0:
                v, i = varint(b, i)
            elif w == 1:
                v = b[i:i + 8]
                i += 8
            elif w == 2:
                ln, i = varint(b, i)
                if i + ln > len(b):
                    return None
                v = b[i:i + ln]
                i += ln
            elif w == 5:
                v = b[i:i + 4]
                i += 4
            else:
                return None
            out.append((n, w, v))
    except IndexError:
        return None
    return out if i == len(b) else None


def chunks(b):
    """The container: `Korg`, then length-prefixed protobufs (a header, some file info, and the content)."""
    if b[:4] != b"Korg":
        raise ValueError("not a Korg file")
    out, i = [], 4
    while i + 4 <= len(b):
        if b[i:i + 4] == b"Korg":
            i += 4
            continue
        ln = int.from_bytes(b[i:i + 4], "little")
        out.append(b[i + 4:i + 4 + ln])
        i += 4 + ln
    return out


def first(fs, n, default=None):
    return next((v for k, w, v in fs if k == n), default)


@dataclass
class Zone:
    path: str
    start: int
    loop_start: int
    end: int
    one_shot: bool
    top_key: int
    root_key: int
    tune_cents: float


@dataclass
class MultiSample:
    name: str
    author: str
    category: str
    zones: list


def read_multisample(path):
    content = chunks(Path(path).read_bytes())[-1]
    fs = fields(content)
    zones = []
    for n, w, v in fs:
        if n != 5:
            continue
        z = fields(v)
        s = fields(first(z, 1, b""))
        tune = first(z, 6)
        name = first(s, 1, b"")
        start = first(s, 2, 0)
        end = first(s, 4, 0)
        zones.append(Zone(
            path=name.decode("utf-8", "replace"),
            start=start,
            loop_start=first(s, 3, start),
            end=end,
            one_shot=first(s, 9, 0) == 1,
            top_key=first(z, 3, 127),
            root_key=first(z, 4, 60),
            # (the file holds tenths of a cent: the instrument's own copy of a set says -18 where its file says -180)
            tune_cents=struct.unpack("<f", tune)[0] / 10 if tune else 0.0,
        ))
    text = lambda n: first(fs, n, b"").decode("utf-8", "replace")  # noqa: E731
    return MultiSample(text(1), text(2), text(3), zones)


def text_in(v):
    try:
        s = v.decode("utf-8")
    except UnicodeDecodeError:
        return None
    return s if len(s) >= 3 and all(31 < ord(c) < 127 for c in s) else None


def performance_blocks(path):
    """A modwave Performance's named blocks, each with the numbers found in it, in order: floats as they are and
    whole numbers as `field:value`. What most of those numbers mean isn't known here, since the schema isn't
    published: this is enough to compare presets with one another, not to translate one."""
    out = {}

    def walk(v, name, depth):
        fs = fields(v)
        if fs is None:
            return
        for n, w, val in fs:
            if n == 1 and w == 2 and (t := text_in(val)):
                name = t
                break
        for n, w, val in fs:
            if w == 5:
                out.setdefault(name, []).append(round(struct.unpack("<f", val)[0], 4))
            elif w == 0 and depth > 0:
                out.setdefault(name, []).append(f"{n}:{val}")
            elif w == 2 and not text_in(val):
                walk(val, name, depth + 1)

    for c in chunks(chunks(Path(path).read_bytes())[-1]):
        walk(c, "top", 0)
    return out


def main():
    for path in sys.argv[1:]:
        if path.endswith(".mwperf"):
            for name, values in performance_blocks(path).items():
                print(f"{name}: {values[:24]}")
            continue
        m = read_multisample(path)
        print(f"{m.name} ({m.category}, {m.author}): {len(m.zones)} zones")
        for z in m.zones:
            print(f"   {z.path}: start {z.start} loop {z.loop_start} end {z.end} one-shot {z.one_shot} "
                  f"top {z.top_key} root {z.root_key} tune {z.tune_cents:+.0f}")


if __name__ == "__main__":
    main()
