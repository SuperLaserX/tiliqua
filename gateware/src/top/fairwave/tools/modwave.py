"""Reads a Korg modwave's files: `.mwprog`, `.mwperf`, `.mwwavetable`, `.mwbundle` and `.mwbackup`.

A file is a Korg container, a header naming how many of what follow and then each with its length, and an item is
usually another container, holding a protobuf (`Program`, `Performance`) and its `ObjectInfo`. A wavetable is the
exception: its data is frames of 2048 32-bit floats, with no structure of its own. Fields are read by the schema in
`modwave_schema.json`, which `modwave_schema.py` took from the instrument's own program.
"""

import json
import struct
import sys
import uuid
from dataclasses import dataclass, field
from pathlib import Path

import numpy as np

HERE = Path(__file__).resolve().parent
SCHEMA = json.loads((HERE / "modwave_schema.json").read_text(encoding="utf-8"))
NS = "KorgProtocolMessage."
FRAME_SAMPLES = 2048


def varint(buf, i):
    v = s = 0
    while True:
        c = buf[i]
        i += 1
        v |= (c & 0x7F) << s
        s += 7
        if not c & 0x80:
            return v, i


def wire_fields(buf):
    out, i = [], 0
    while i < len(buf):
        key, i = varint(buf, i)
        n, w = key >> 3, key & 7
        if w == 0:
            v, i = varint(buf, i)
        elif w == 1:
            v, i = buf[i:i + 8], i + 8
        elif w == 2:
            ln, i = varint(buf, i)
            v, i = buf[i:i + ln], i + ln
        elif w == 5:
            v, i = buf[i:i + 4], i + 4
        else:
            raise ValueError(f"wire type {w}")
        out.append((n, w, v))
    return out


def scalar(kind, w, v):
    if kind == "float":
        return struct.unpack("<f", v)[0]
    if kind == "double":
        return struct.unpack("<d", v)[0]
    if kind in ("sint32", "sint64"):
        return (v >> 1) ^ -(v & 1)
    if kind in ("int32", "int64"):
        return v - (1 << 64) if v >= 1 << 63 else v
    if kind == "bool":
        return bool(v)
    if kind == "string":
        return v.decode("utf-8", "replace")
    if kind == "bytes":
        return v
    if kind in ("fixed32", "sfixed32"):
        return struct.unpack("<I" if kind == "fixed32" else "<i", v)[0]
    if kind in ("fixed64", "sfixed64"):
        return struct.unpack("<Q" if kind == "fixed64" else "<q", v)[0]
    return v


def decode(buf, message):
    """A message as a dict of field names. Unknown fields go under their number, as a newer file might have them."""
    fields = SCHEMA["messages"][message]
    out = {}
    for n, w, v in wire_fields(buf):
        f = fields.get(str(n))
        if f is None:
            out.setdefault(f"#{n}", []).append(v)
            continue
        if f["type"] == "message":
            value = decode(v, f["type_name"])
        elif f["type"] == "enum":
            value = SCHEMA["enums"].get(f["type_name"], {}).get(str(v), v)
        else:
            value = scalar(f["type"], w, v)
        if f.get("repeated"):
            out.setdefault(f["name"], []).append(value)
        else:
            out[f["name"]] = value
    return out


def read_container(b):
    """([(type name, item bytes)], in file order, from a `Korg` block."""
    if b[:4] != b"Korg":
        raise ValueError("not a Korg container")
    ln = int.from_bytes(b[4:8], "little")
    i = 8 + ln
    items = []
    for n, _, v in wire_fields(b[8:8 + ln]):
        if n != 2:
            continue
        inner = wire_fields(v)
        name = next(c.decode() for a, _, c in inner if a == 1)
        count = next((c for a, _, c in inner if a == 3), 1)
        for _ in range(count):
            size = int.from_bytes(b[i:i + 4], "little")
            items.append((name, b[i + 4:i + 4 + size]))
            i += 4 + size
    return items


def object_of(item):
    """An item's parts by type, if it's a container. A `Program` and its `ObjectInfo`, say."""
    return {name: data for name, data in read_container(item)} if item[:4] == b"Korg" else {}


def uuid_text(raw):
    return str(uuid.UUID(bytes=raw)) if isinstance(raw, bytes) and len(raw) == 16 else (raw.hex() if isinstance(raw, bytes) else str(raw))


@dataclass
class WaveTable:
    uuid: str
    name: str
    frames: np.ndarray      # frames x 2048, floats
    categories: list = field(default_factory=list)
    author: str = ""


@dataclass
class Library:
    """Everything in some set of files, by kind."""
    programs: dict = field(default_factory=dict)        # name -> (Program, ObjectInfo)
    performances: dict = field(default_factory=dict)
    wavetables: dict = field(default_factory=dict)      # uuid -> WaveTable
    source: dict = field(default_factory=dict)          # program or performance name -> the file it came from


def wavetable_of(parts):
    info = decode(parts["ObjectInfo"], NS + "ObjectInfo")
    raw = np.frombuffer(parts["WaveTable"], dtype="<f4")
    frames = raw[:len(raw) // FRAME_SAMPLES * FRAME_SAMPLES].reshape(-1, FRAME_SAMPLES)
    return WaveTable(uuid_text(info.get("uuid", b"")), info.get("name", ""), frames,
                     info.get("instrument_main_category", []) + info.get("instrument_sub_category", []), info.get("author", ""))


def load_file(path, library=None):
    """Whatever a file holds, into `library`. Bundles and backups hold many of each, in containers."""
    library = library if library is not None else Library()
    path = Path(path)
    data = path.read_bytes()
    items = read_container(data)
    # (the instrument's own database has one object to a file, with nothing around it)
    if any(name in ("WaveTable", "Program", "Performance") for name, _ in items):
        items = [("", data)]
    for _, item in items:
        if item[:4] != b"Korg":
            continue
        parts = object_of(item)
        if "WaveTable" in parts:
            t = wavetable_of(parts)
            library.wavetables[t.uuid] = t
        elif "Program" in parts:
            p = decode(parts["Program"], NS + "Program")
            info = decode(parts["ObjectInfo"], NS + "ObjectInfo")
            library.programs[info.get("name") or p.get("name", path.stem)] = (p, info)
            library.source[info.get("name") or p.get("name", path.stem)] = path
        elif "Performance" in parts:
            p = decode(parts["Performance"], NS + "Performance")
            info = decode(parts["ObjectInfo"], NS + "ObjectInfo")
            library.performances[info.get("name") or p.get("name", path.stem)] = (p, info)
            library.source[info.get("name") or p.get("name", path.stem)] = path
    return library


def models_of(program):
    """A Program's voice models: normally one, a `DwxModel`."""
    return [decode(patch["data"], NS + "DwxModel") for patch in program.get("patch", []) if "data" in patch]


def layers_of(performance):
    """A Performance's programs, in layer order: (track name, Program)."""
    out = []
    for track in performance.get("track", []):
        inst = track.get("instrument_track")
        if inst and "Program" in inst:
            out.append((track.get("name", ""), inst["Program"]))
    return out


def plain(x, depth=0):
    """A decoded message for reading: bytes as hex and empty parts left out."""
    if isinstance(x, dict):
        out = {k: plain(v, depth + 1) for k, v in x.items()}
        return {k: v for k, v in out.items() if v not in ({}, [], None)}
    if isinstance(x, list):
        return [plain(v, depth + 1) for v in x]
    if isinstance(x, bytes):
        return uuid_text(x) if len(x) == 16 else x.hex()
    return x


def main():
    for path in sys.argv[1:]:
        lib = load_file(path)
        print(f"{path}: {len(lib.programs)} programs, {len(lib.performances)} performances, {len(lib.wavetables)} wavetables")
        for name in list(lib.programs)[:40]:
            print("  program", name)
        for name in list(lib.performances)[:40]:
            print("  performance", name)
        for t in list(lib.wavetables.values())[:40]:
            print(f"  wavetable {t.name}: {t.frames.shape[0]} frames, {t.categories}, {t.uuid}")


if __name__ == "__main__":
    sys.exit(main())
