"""A patch as a text file, read as the firmware reads it (`cpu/src/patchfile.rs`), and all a patch tells
the gateware, worked out from the rules in `cpu/src/modulation.rs` and `patch.rs`.

It is written separately from the firmware on purpose: `tools/check_library.py` and `tools/check_sim.py`
hold each to the other, so a slip in either shows.
"""

import math
import re
from dataclasses import dataclass, field

from . import modulation as mod
from .modulation import FULL, ONE
from .wavescan import CLAMP, DEPTH_FULL, MIRROR, WRAP, Layer

FS = 48000
RATIO = [65536, 71468, 77936, 84990, 92682, 101070, 110218, 120194]
TIME_MAX = 121
RATE_MAX = 107
N_SLOTS = 12

MAGIC = "FAIRWAVE PATCH"
NAME_CHARS = 16
ABOUT_CHARS = 34
TABLE_CHARS = 64
FINE_MAX = 50

# Reading styles.
CLEAN, PLAIN, STEPS, RAW = 0, 1, 2, 3
# Cross modulation's modes, as the routing register's bits.
RING, FM, PD = 0b001, 0b010, 0b110

SOURCES = ["---", "CV 1", "CV 2", "ENV 1", "ENV 2", "LFO 1", "LFO 2", "LFO 3"]
DESTS = ["PITCH 1", "POS 1", "SHIFT 1", "LEVEL 1", "PITCH 2", "POS 2", "SHIFT 2", "LEVEL 2", "BALANCE", "X DEPTH"]
OUTS = ["OFF", "MIX", "OSC 1", "OSC 2", "ENV 1", "ENV 2", "LFO 1", "LFO 2", "LFO 3"]
SHAPES = ["SINE", "TRI", "SAW UP", "SAW DN", "SQUARE", "RANDOM"]
EDGES = ["CLAMP", "WRAP", "MIRROR"]
READS = ["CLEAN", "PLAIN", "STEPS", "RAW"]
LOOPS = ["OFF", "GATED", "FREE"]
MODES = ["OFF", "RING", "AM", "FM", "PD"]


def time_samples(index):
    if index == 0:
        return 1
    i = index - 1
    return ((FS // 1000) * RATIO[i % 8] << (i // 8)) >> 16


def segment_rate(samples):
    return ((1 << 32) + samples - 1) // samples & 0xFFFFFFFF


def rate_word(index):
    base = (1 << 48) // 100 // FS
    return (base * RATIO[index % 8] << (index // 8)) >> 32


def rate_millihertz(index):
    return (10 * RATIO[index % 8] << (index // 8)) >> 16


def curve_bits(curve):
    return int(-curve * 256 / 100) & 0x3FF


def env_words(gate, delay=0, attack=28, hold=0, decay=62, sustain=70, release=67, curves=(0, 50, 50), loop=0):
    rate = lambda i: segment_rate(time_samples(i))  # noqa: E731
    return [gate | loop << 2, rate(delay), rate(attack), rate(hold), rate(decay), sustain * ONE // 100,
            rate(release), sum(curve_bits(c) << (10 * i) for i, c in enumerate(curves))]


def lfo_words(rate, shape, unipolar=0, phase=0, level=100, sync=0):
    return [rate_word(rate), phase * 65536 // 360 | shape << 16 | unipolar << 19 | sync << 20, FULL * level // 100]


def slot_word_half_percents(src, dest, amount, am=False):
    """`amount` in half-percents, which is what a slot keeps."""
    if dest in (mod.PITCH, 4 + mod.PITCH):
        scale = 67108864
    elif dest == mod.CROSS:
        scale = 21990233 // 2 if am else 21990233
    else:
        scale = 13421773
    n = abs(amount) * scale + 100000
    word = n // 200000
    word = -word if amount < 0 else word
    return (word & 0x3FFFF) | src << 18 | dest << 21


def slot_word(src, dest, percent, am=False):
    return slot_word_half_percents(src, dest, round(percent * 2), am)


def a_layer(**kw):
    """A layer of the default patch: half way through, no tilt, full level."""
    return {"table": 0, "semitones": 0, "fine": 0, "position": 500, "shift": 0, "edge": CLAMP, "level": 100,
            "read": CLEAN, "grain": 0} | kw


# What the default patch's envelopes and LFOs are, in the settings a file can change.
def default_settings():
    return {
        "layers": [a_layer(table=0), a_layer(table=1)],
        "envs": [dict(gate=1 << i, delay=0, attack=28, hold=0, decay=62, sustain=70, release=67, curves=[0, 50, 50],
                      loop=mod.LOOP_OFF, vca=0) for i in range(2)],
        "lfos": [dict(rate=[53, 72, 37][i], shape=[mod.SINE, mod.TRI, mod.SQUARE][i], unipolar=0, phase=0, level=100,
                      sync=0) for i in range(3)],
        "slots": [(mod.CV1, mod.PITCH, 200), (mod.CV1, 4 + mod.PITCH, 200),
                  (mod.CV2, mod.POS, 200), (mod.CV2, 4 + mod.POS, 200)],
        "outs": [mod.OUT_L1, mod.OUT_L2, mod.OUT_ENV1, mod.OUT_ENV2],
        "balance": 500,
        "mode": "OFF",
        "modulator": 0,
        "depth": 500,
    }


def default_patch():
    return patch_of(default_settings())


def patch_of(s):
    """A patch's settings as what the gateware is told: the words `configure` writes."""
    am = s["mode"] == "AM"
    cross = {"OFF": 0, "RING": RING, "AM": RING, "FM": FM, "PD": PD}[s["mode"]] | s["modulator"] << 3
    depth_word = s["depth"] * DEPTH_FULL // 1000
    return {
        "layers": s["layers"],
        "env": [env_words(e["gate"], e["delay"], e["attack"], e["hold"], e["decay"], e["sustain"], e["release"],
                          e["curves"], e["loop"]) for e in s["envs"]],
        "lfo": [lfo_words(k["rate"], k["shape"], k["unipolar"], k["phase"], k["level"], k["sync"]) for k in s["lfos"]],
        "slots": [slot_word_half_percents(*slot, am=am) for slot in s["slots"]],
        "outs": s["outs"],
        "vca": [e["vca"] for e in s["envs"]],
        "balance": s["balance"],
        "cross": cross,
        "depth_word": depth_word // 2 if am else depth_word,
    }


def configure(m, patch, layers):
    """Writes a patch into a `Modulation`, as the firmware does the gateware, and `layers`' styles."""
    for i, w in enumerate(patch["env"][0] + patch["env"][1]):
        m.write(i, w)
    for k, words in enumerate(patch["lfo"]):
        for w, value in enumerate(words):
            m.write(0x10 + k * 4 + w, value)
    for i, word in enumerate(patch["slots"]):
        m.write(0x20 + i, word)
    for i, spec in enumerate(patch["layers"]):
        at = i * mod.LAYER_DESTS
        m.write(0x30 + at + mod.PITCH, (spec["semitones"] * 100 + spec.get("fine", 0)) * ONE // 1200)
        m.write(0x30 + at + mod.POS, spec["position"] * ONE // 1000)
        m.write(0x30 + at + mod.SHIFT, spec["shift"] * ONE // 1000)
        m.write(0x30 + at + mod.LEVEL, spec["level"] * ONE // 100)
        m.ctrl(i, layers[i].ctrl_reg(spec["grain"]))
    m.write(0x30 + mod.BALANCE, patch["balance"] * ONE // 1000)
    depth = patch["depth_word"] if "depth_word" in patch else patch["depth"] * DEPTH_FULL // 1000
    m.write(0x30 + mod.CROSS, depth)
    m.routing(sum(s << (4 * i) for i, s in enumerate(patch["outs"])) | patch["vca"][0] << 16 | patch["vca"][1] << 18
              | patch["cross"] << 22)
    m.frames_m1 = [layers[0].frames - 1, layers[1].frames - 1]


# ---- The file ----


def same(a, b):
    return a.replace(" ", "").upper() == b.replace(" ", "").upper()


def number(text):
    """`-12.5 MS` as thousandths, and what follows the number. None if it doesn't start with one."""
    m = re.fullmatch(r"([-+]?)(\d*)(?:\.(\d*))?(.*)", text.strip(), re.S)
    if not m:
        return None
    sign, whole, fraction, rest = m.groups()
    fraction = fraction or ""
    if not whole and not fraction:
        return None
    value = min(int(whole or "0") * 1000, 1 << 50) + int(fraction[:3].ljust(3, "0"))
    return (-value if sign == "-" else value), rest.strip()


def nearest(n, d):
    """To the nearest, halves away from zero."""
    return -((-n + d // 2) // d) if n < 0 else (n + d // 2) // d


def with_unit(text, unit):
    got = number(text)
    if got is None or not (got[1] == "" or same(got[1], unit)):
        return None
    return got[0]


def clamp(x, lo, hi):
    return max(lo, min(hi, x))


def time_index(text):
    got = number(text)
    if got is None:
        return None
    v, rest = got
    if rest == "" or same(rest, "MS"):
        micros = v
    elif same(rest, "S"):
        micros = v * 1000
    else:
        return None
    wanted = max(micros, 0) * FS
    # (the lowest of any two as near: `min` keeps the first)
    return min(range(TIME_MAX + 1), key=lambda i: abs(time_samples(i) * 1000000 - wanted))


def rate_index(text):
    millihertz = with_unit(text, "HZ")
    if millihertz is None:
        return None
    return min(range(RATE_MAX + 1), key=lambda i: abs(rate_millihertz(i) - millihertz))


def named(text, names):
    return next((i for i, n in enumerate(names) if same(text, n)), None)


def numbered(text, name, count):
    return next((n - 1 for n in range(1, count + 1) if same(text, f"{name}{n}")), None)


def gates(text, none):
    if same(text, none) or same(text, "OFF"):
        return 0
    if same(text, "GATE 1"):
        return 1
    if same(text, "GATE 2"):
        return 2
    if same(text, "EITHER") or same(text, "BOTH"):
        return 3
    return None


class _Skip(Exception):
    """A line that isn't understood."""


def need(x):
    if x is None:
        raise _Skip
    return x


@dataclass
class PatchFile:
    name: str = ""
    about: str = ""
    settings: dict = field(default_factory=default_settings)
    tables: list = field(default_factory=lambda: ["", ""])
    frame_log2: list = field(default_factory=lambda: [0, 0])
    skipped: int = 0
    first_skipped: int = 0

    @property
    def patch(self):
        return patch_of(self.settings)


def _osc(f, i, key, value):
    layer = f.settings["layers"][i]
    if same(key, "TABLE"):
        f.tables[i] = value[:TABLE_CHARS]
    elif same(key, "FRAME"):
        got = need(number(value))
        f.frame_log2[i] = need(next((k for k in range(8, 12) if (1000 << k) == got[0]), None))
    elif same(key, "READ"):
        layer["read"] = need(named(value, READS))
    elif same(key, "TUNE"):
        layer["semitones"] = clamp(nearest(need(with_unit(value, "ST")), 1000), -48, 48)
    elif same(key, "FINE"):
        layer["fine"] = clamp(nearest(need(with_unit(value, "CT")), 1000), -FINE_MAX, FINE_MAX)
    elif same(key, "POS"):
        layer["position"] = clamp(nearest(need(with_unit(value, "%")), 100), 0, 1000)
    elif same(key, "SHIFT"):
        layer["shift"] = clamp(nearest(need(with_unit(value, "%")), 100), -2000, 2000)
    elif same(key, "EDGE"):
        layer["edge"] = need(named(value, EDGES))
    elif same(key, "GRAIN"):
        layer["grain"] = 0 if same(value, "OFF") else need(numbered(value, "LFO", 3)) + 1
    elif same(key, "LEVEL"):
        layer["level"] = clamp(nearest(need(with_unit(value, "%")), 1000), 0, 100)
    else:
        raise _Skip


def _env(f, i, key, value):
    e = f.settings["envs"][i]
    for row, name in (("DELAY", "delay"), ("ATTACK", "attack"), ("HOLD", "hold"), ("DECAY", "decay"), ("RELEASE", "release")):
        if same(key, row):
            e[name] = need(time_index(value))
            return
    for c, row in enumerate(("A CURVE", "D CURVE", "R CURVE")):
        if same(key, row):
            e["curves"][c] = clamp(nearest(need(with_unit(value, "%")), 1000), -100, 100)
            return
    if same(key, "SUSTAIN"):
        e["sustain"] = clamp(nearest(need(with_unit(value, "%")), 1000), 0, 100)
    elif same(key, "LOOP"):
        e["loop"] = need(named(value, LOOPS))
    elif same(key, "GATE"):
        e["gate"] = need(gates(value, "NONE"))
    elif same(key, "VCA"):
        if same(value, "-") or same(value, "OFF") or same(value, "NONE"):
            e["vca"] = 0
        else:
            e["vca"] = need(named(value, ["", "OSC 1", "OSC 2", "BOTH"]))
    else:
        raise _Skip


def _lfo(f, i, key, value):
    k = f.settings["lfos"][i]
    if same(key, "RATE"):
        k["rate"] = need(rate_index(value))
    elif same(key, "SHAPE"):
        k["shape"] = need(named(value, SHAPES))
    elif same(key, "PHASE"):
        k["phase"] = nearest(need(with_unit(value, "DEG")), 1000) % 360
    elif same(key, "LEVEL"):
        k["level"] = clamp(nearest(need(with_unit(value, "%")), 1000), 0, 100)
    elif same(key, "POLAR"):
        k["unipolar"] = need(named(value, ["BI", "UNI"]))
    elif same(key, "SYNC"):
        k["sync"] = need(gates(value, "FREE"))
    else:
        raise _Skip


def _route(f, key, value):
    if ">" not in key:
        raise _Skip
    source, dest = key.split(">", 1)
    source, dest = need(named(source.strip(), SOURCES)), need(named(dest.strip(), DESTS))
    limit = 390 if dest in (mod.PITCH, 4 + mod.PITCH) else 800
    amount = clamp(nearest(need(with_unit(value, "%")), 500), -limit, limit)
    if len(f.settings["slots"]) == N_SLOTS:
        raise _Skip
    f.settings["slots"].append((source, dest, amount))


def _mixer(f, key, value):
    out = numbered_from_zero(key)
    if out is not None:
        f.settings["outs"][out] = need(named(value, OUTS))
    elif same(key, "BALANCE"):
        f.settings["balance"] = clamp(nearest(need(with_unit(value, "%")), 100), 0, 1000)
    elif same(key, "LEVEL 1"):
        f.settings["layers"][0]["level"] = clamp(nearest(need(with_unit(value, "%")), 1000), 0, 100)
    elif same(key, "LEVEL 2"):
        f.settings["layers"][1]["level"] = clamp(nearest(need(with_unit(value, "%")), 1000), 0, 100)
    else:
        raise _Skip


def numbered_from_zero(key):
    return next((n for n in range(4) if same(key, f"OUT{n}")), None)


def _cross(f, key, value):
    if same(key, "MODE"):
        f.settings["mode"] = MODES[need(named(value, MODES))]
    elif same(key, "FROM"):
        f.settings["modulator"] = need(numbered(value, "OSC", 2))
    elif same(key, "DEPTH"):
        f.settings["depth"] = clamp(nearest(need(with_unit(value, "%")), 100), 0, 1000)
    else:
        raise _Skip


def _section(text):
    for name, kind, count in (("OSC", "osc", 2), ("ENV", "env", 2), ("LFO", "lfo", 3)):
        i = numbered(text, name, count)
        if i is not None:
            return kind, i
    if same(text, "ROUTING"):
        return "routing", 0
    if same(text, "MIXER"):
        return "mixer", 0
    if same(text, "CROSS MOD") or same(text, "CROSS"):
        return "cross", 0
    return None, 0


def parse(data):
    """`data`: the file's bytes. Raises ValueError if it isn't a patch file."""
    f = PatchFile()
    section, index = "top", 0
    began = False
    for n, raw in enumerate(data.split(b"\n")):
        try:
            try:
                line = raw.decode("utf-8")
            except UnicodeDecodeError:
                raise _Skip from None
            line = line.removeprefix("﻿").split("#")[0].strip()
            if not line:
                continue
            if not began:
                if not same(line[:len(MAGIC)], MAGIC):
                    raise _Skip
                began = True
                continue
            if line.startswith("[") and line.endswith("]"):
                section, index = _section(line[1:-1].strip())
                if section == "routing":
                    f.settings["slots"] = []
                if section is None:
                    raise _Skip
                continue
            if "=" not in line:
                raise _Skip
            key, value = (x.strip() for x in line.split("=", 1))
            if section == "top":
                if same(key, "NAME"):
                    f.name = value[:NAME_CHARS]
                elif same(key, "ABOUT"):
                    f.about = value[:ABOUT_CHARS]
                else:
                    raise _Skip
            elif section == "osc":
                _osc(f, index, key, value)
            elif section == "env":
                _env(f, index, key, value)
            elif section == "lfo":
                _lfo(f, index, key, value)
            elif section == "routing":
                _route(f, key, value)
            elif section == "mixer":
                _mixer(f, key, value)
            elif section == "cross":
                _cross(f, key, value)
            else:
                raise _Skip
        except _Skip:
            if not began:
                raise ValueError("not a patch file") from None
            f.skipped += 1
            if f.first_skipped == 0:
                f.first_skipped = n + 1
    if not began:
        raise ValueError("not a patch file")
    return f


# ---- Tables ----


def read_wav(data):
    """A table file's frames, as lists of samples: the 16-bit mono files `tools/make_library.py` writes,
    with the frame length they state."""
    if data[:4] != b"RIFF" or data[8:12] != b"WAVE":
        raise ValueError("not a WAV")
    at = 12
    length = None
    samples = None
    while at + 8 <= len(data):
        kind, size = data[at:at + 4], int.from_bytes(data[at + 4:at + 8], "little")
        body = data[at + 8:at + 8 + size]
        if kind == b"fmt ":
            tag, channels = int.from_bytes(body[:2], "little"), int.from_bytes(body[2:4], "little")
            bits = int.from_bytes(body[14:16], "little")
            if (tag, channels, bits) != (1, 1, 16):
                raise ValueError(f"not 16-bit mono PCM: {tag, channels, bits}")
        elif kind == b"clm ":
            m = re.match(rb"<!>(\d+)", body)
            if m:
                length = int(m[1])
        elif kind == b"data":
            samples = [int.from_bytes(body[i:i + 2], "little", signed=True) for i in range(0, len(body) & ~1, 2)]
        at += 8 + size + (size & 1)
    if samples is None or length is None:
        raise ValueError("no samples, or no frame length")
    return [samples[i:i + length] for i in range(0, len(samples) - length + 1, length)]


def layers_for(patch, tables):
    """`tables`: each layer's (base in 256-byte units, frames). The `Layer`s to play them, with all their
    band-limited levels ready where the style reads them."""
    out = []
    for spec, (base, frames) in zip(patch["layers"], tables):
        log2 = int(math.log2(len(frames[0])))
        out.append(Layer(table_base=base, frame_log2=log2, frames=len(frames), edge=spec["edge"],
                         stepped=int(spec["read"] >= STEPS), raw=int(spec["read"] == RAW),
                         max_level=log2 - 3 if spec["read"] == CLEAN else 0))
    return out


__all__ = ["CLAMP", "MIRROR", "WRAP"]
