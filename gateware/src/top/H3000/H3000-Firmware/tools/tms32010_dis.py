#!/usr/bin/env python3
"""Standalone TMS32010 (TMS320C1x) disassembler.

Mirrors the Ghidra SLEIGH module in ghidra/TMS320C1x so the two can be
cross-checked. Words are big-endian 16-bit, program addresses are word
addresses.

Usage:
  tms32010_dis.py FILE [--offset HEX] [--words N] [--org HEX] [--header]

  --header   treat the first word as the load address (H3000 image format)
"""
import argparse
import sys


def _ind(lo):
    mm = (lo >> 4) & 3
    s = ("*", "*-", "*+", "*+-")[mm]
    return s


def _next_arp(lo):
    if lo & 0x80 and not (lo & 0x08):
        return ",AR%d" % (lo & 1)
    return ""


def _mem(lo, dp):
    if lo & 0x80:
        return _ind(lo)
    return "0x%02X" % ((dp << 7) | (lo & 0x7F))


def _shift_txt(shift, lo):
    narp = _next_arp(lo)
    if shift or narp:
        return ",%d%s" % (shift, narp)
    return ""


SIMPLE = {
    0x7F80: "NOP", 0x7F81: "DINT", 0x7F82: "EINT", 0x7F88: "ABS", 0x7F89: "ZAC",
    0x7F8A: "ROVM", 0x7F8B: "SOVM", 0x7F8C: "CALA", 0x7F8D: "RET", 0x7F8E: "PAC",
    0x7F8F: "APAC", 0x7F90: "SPAC", 0x7F9C: "PUSH", 0x7F9D: "POP",
}

BRANCH = {
    0xF400: "BANZ", 0xF500: "BV", 0xF600: "BIOZ", 0xF800: "CALL", 0xF900: "B",
    0xFA00: "BLZ", 0xFB00: "BLEZ", 0xFC00: "BGZ", 0xFD00: "BGEZ", 0xFE00: "BNZ", 0xFF00: "BZ",
}

MEM8 = {
    0x60: "ADDH", 0x61: "ADDS", 0x62: "SUBH", 0x63: "SUBS", 0x64: "SUBC", 0x65: "ZALH",
    0x66: "ZALS", 0x67: "TBLR", 0x68: "MAR", 0x69: "DMOV", 0x6A: "LT", 0x6B: "LTD",
    0x6C: "LTA", 0x6D: "MPY", 0x6F: "LDP", 0x78: "XOR", 0x79: "AND", 0x7A: "OR",
    0x7B: "LST", 0x7C: "SST", 0x7D: "TBLW",
}


class State:
    """Statically tracked DP/ARP, like the SLEIGH context variables."""

    def __init__(self):
        self.dp = 0
        self.arp = 0


def decode(words, i, st):
    """Decode instruction at index i. Returns (length, text, branch_target, kind)."""
    w = words[i]
    hi, lo = w >> 8, w & 0xFF
    if w in SIMPLE:
        m = SIMPLE[w]
        kind = {"RET": "ret", "CALA": "calla"}.get(m)
        return 1, m, None, kind
    if w in BRANCH:
        if i + 1 >= len(words):
            return 1, ".word 0x%04X" % w, None, None
        t = words[i + 1] & 0xFFF
        m = BRANCH[w]
        kind = "jmp" if m == "B" else ("call" if m == "CALL" else "cjmp")
        return 2, "%-5s 0x%03X" % (m, t), t, kind
    op4 = w >> 12
    if (w >> 13) == 4:  # MPYK
        k = w & 0x1FFF
        if k & 0x1000:
            k -= 0x2000
        return 1, "MPYK  %d" % k, None, None
    txt = None
    if op4 in (0, 1, 2):
        m = ("ADD", "SUB", "LAC")[op4]
        txt = "%-5s %s%s" % (m, _mem(lo, st.dp), _shift_txt((w >> 8) & 0xF, lo))
    elif (w >> 9) == 0x18:
        txt = "SAR   AR%d,%s%s" % ((w >> 8) & 1, _mem(lo, st.dp), _next_arp(lo))
    elif (w >> 9) == 0x1C:
        txt = "LAR   AR%d,%s%s" % ((w >> 8) & 1, _mem(lo, st.dp), _next_arp(lo))
    elif (w >> 11) == 0x08:
        txt = "IN    %s,PA%d%s" % (_mem(lo, st.dp), (w >> 8) & 7, _next_arp(lo))
    elif (w >> 11) == 0x09:
        txt = "OUT   %s,PA%d%s" % (_mem(lo, st.dp), (w >> 8) & 7, _next_arp(lo))
    elif (w >> 11) == 0x0A:
        txt = "SACL  %s%s" % (_mem(lo, st.dp), _next_arp(lo))
    elif (w >> 11) == 0x0B:
        txt = "SACH  %s%s" % (_mem(lo, st.dp), _shift_txt((w >> 8) & 7, lo))
    elif hi == 0x68 and (lo & 0xFE) == 0x80:
        st.arp = lo & 1
        return 1, "LARP  %d" % (lo & 1), None, None
    elif hi == 0x6E and (lo & 0xFE) == 0:
        st.dp = lo & 1
        return 1, "LDPK  %d" % (lo & 1), None, None
    elif (w >> 9) == 0x38:
        return 1, "LARK  AR%d,0x%02X" % ((w >> 8) & 1, lo), None, None
    elif hi == 0x7E:
        return 1, "LACK  0x%02X" % lo, None, None
    elif hi == 0x7C:  # SST direct always page 1
        a = _ind(lo) if lo & 0x80 else "0x%02X" % (0x80 | (lo & 0x7F))
        txt = "SST   %s%s" % (a, _next_arp(lo))
    elif hi == 0x7B:  # LST: next-ARP field ignored
        txt = "LST   %s" % _mem(lo, st.dp)
        return 1, txt, None, None
    elif hi in MEM8:
        txt = "%-5s %s%s" % (MEM8[hi], _mem(lo, st.dp), _next_arp(lo))
    if txt is None:
        return 1, ".word 0x%04X" % w, None, "bad"
    if lo & 0x80 and not (lo & 0x08):
        st.arp = lo & 1
    return 1, txt, None, None


def disassemble(words, org, out=sys.stdout, header_comment=None):
    st = State()
    # collect branch targets for labels
    targets = set()
    i = 0
    tmp = State()
    while i < len(words):
        n, _, t, _ = decode(words, i, tmp)
        if t is not None:
            targets.add(t)
        i += n
    if header_comment:
        out.write("; %s\n" % header_comment)
    i = 0
    while i < len(words):
        addr = org + i
        n, txt, t, kind = decode(words, i, st)
        if addr in targets:
            out.write("L%03X:\n" % addr)
        raw = " ".join("%04X" % words[i + k] for k in range(n))
        if t is not None:
            txt = txt.replace("0x%03X" % t, "L%03X" % t)
        out.write("  %03X  %-10s  %s\n" % (addr, raw, txt))
        if kind in ("ret", "jmp"):
            out.write("\n")
        i += n


def words_from(data):
    if len(data) & 1:
        data = data + b"\xff"
    return [(data[k] << 8) | data[k + 1] for k in range(0, len(data), 2)]


def main():
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("file")
    ap.add_argument("--offset", default="0")
    ap.add_argument("--words", type=int, default=None)
    ap.add_argument("--org", default=None)
    ap.add_argument("--header", action="store_true")
    a = ap.parse_args()
    data = open(a.file, "rb").read()[int(a.offset, 16):]
    words = words_from(data)
    org = 0
    if a.header:
        org = words[0]
        words = words[1:]
    if a.org is not None:
        org = int(a.org, 16)
    if a.words:
        words = words[:a.words]
    disassemble(words, org)


if __name__ == "__main__":
    main()
