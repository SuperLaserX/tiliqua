"""Pulls the protobuf schemas out of the modwave's own program, into `tools/modwave_schema.json`.

    python src/top/fairwave/tools/modwave_schema.py D:/midi/modwave/dwX

`dwX` holds a serialized FileDescriptorProto for each of its `.proto` files, as any C++ protobuf program does. So
what its patch files mean doesn't have to be guessed: field numbers, names and types, and enum values, are all
there, as the instrument's programmers wrote them. `tools/modwave.py` reads files with this.
"""

import json
import re
import sys
from pathlib import Path

HERE = Path(__file__).resolve().parent
OUT = HERE / "modwave_schema.json"
TYPES = {1: "double", 2: "float", 3: "int64", 4: "uint64", 5: "int32", 6: "fixed64", 7: "fixed32", 8: "bool", 9: "string", 10: "group",
         11: "message", 12: "bytes", 13: "uint32", 14: "enum", 15: "sfixed32", 16: "sfixed64", 17: "sint32", 18: "sint64"}
FILE_FIELDS = set(range(1, 13))


def varint(buf, i):
    v = s = 0
    while True:
        c = buf[i]
        i += 1
        v |= (c & 0x7F) << s
        s += 7
        if not c & 0x80:
            return v, i
        if s > 70:
            raise ValueError("a varint that doesn't end")


def fields(buf, allowed=None):
    """(number, wire type, value), as far as it reads as a message."""
    out, i = [], 0
    while i < len(buf):
        try:
            key, after = varint(buf, i)
            n, w = key >> 3, key & 7
            if n == 0 or (allowed and n not in allowed):
                break
            if w == 0:
                v, after = varint(buf, after)
            elif w == 1:
                v, after = buf[after:after + 8], after + 8
            elif w == 2:
                ln, after = varint(buf, after)
                if after + ln > len(buf):
                    break
                v, after = buf[after:after + ln], after + ln
            elif w == 5:
                v, after = buf[after:after + 4], after + 4
            else:
                break
        except (IndexError, ValueError):
            break
        out.append((n, w, v))
        i = after
    return out


def enum_of(raw, into, scope):
    name, values = "", {}
    for n, _, v in fields(raw):
        if n == 1:
            name = v.decode()
        elif n == 2:
            value_name, number = "", 0
            for a, _, c in fields(v):
                if a == 1:
                    value_name = c.decode()
                elif a == 2:
                    number = c - (1 << 64) if c >= 1 << 63 else c
            values[str(number)] = value_name
    into["enums"][f"{scope}.{name}"] = values


def field_of(raw):
    f = {}
    for n, _, v in fields(raw):
        if n == 1:
            f["name"] = v.decode()
        elif n == 3:
            f["number"] = v
        elif n == 4:
            f["repeated"] = v == 3
        elif n == 5:
            f["type"] = TYPES.get(v, v)
        elif n == 6:
            f["type_name"] = v.decode().lstrip(".")
    return f


def message_of(raw, into, scope):
    fs = fields(raw)
    name = next(v.decode() for n, _, v in fs if n == 1)
    full = f"{scope}.{name}"
    found = {}
    for n, _, v in fs:
        if n == 2:
            f = field_of(v)
            found[str(f["number"])] = f
        elif n == 3:
            message_of(v, into, full)
        elif n == 4:
            enum_of(v, into, full)
    into["messages"][full] = found


def main():
    data = Path(sys.argv[1]).read_bytes()
    into = {"messages": {}, "enums": {}}
    files = 0
    for m in re.finditer(rb"\x0a[\x05-\x7f]([A-Za-z0-9_/.\-]{1,126}\.proto)", data):
        if m.group(0)[1] != len(m.group(1)):
            continue
        fs = fields(data[m.start():m.start() + 2_000_000], FILE_FIELDS)
        package = next((v.decode() for n, _, v in fs if n == 2), "")
        if not package.startswith("KorgProtocolMessage"):
            continue
        try:
            for n, _, v in fs:
                if n == 4:
                    message_of(v, into, package)
                elif n == 5:
                    enum_of(v, into, package)
        except (UnicodeDecodeError, StopIteration):
            continue
        files += 1
    OUT.write_text(json.dumps(into, indent=0, sort_keys=True), encoding="utf-8")
    print(f"{files} descriptors: {len(into['messages'])} messages, {len(into['enums'])} enums -> {OUT}")


if __name__ == "__main__":
    sys.exit(main())
