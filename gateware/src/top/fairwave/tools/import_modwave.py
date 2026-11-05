"""Makes FairWave patches from modwave Performances and Programs.

    python src/top/fairwave/tools/import_modwave.py --auto D:/midi/modwave

reads every bundle, backup and loose file under a folder into `library/FAIRWAVE/MODWAVE`, a folder of patches for each
pack, with their tables in `MODWAVE/T`. `SKIPPED.TXT` says which sounds couldn't be made and why. Factory samples come from
the banks `modwave_device.py fetch` copied off the instrument, from `factory` under that folder or from `--factory`. For just
some of it:

    python src/top/fairwave/tools/import_modwave.py --tables D:/midi/modwave/backup1.mwbackup \\
        --pack BASS "src/top/fairwave/ExampleTables/BassPack/Separate Presets"

A modwave layer has more than FairWave has, so this is a translation and not a copy:

- Tuning, wavetables and their positions, Wavetable Modifiers, A/B blend, levels and the sub come across as they are.
- The amp envelope is `ENV 1`, and whichever other envelope matters most is `ENV 2`. The three LFOs that matter most are
  `LFO 1` to `LFO 3`. The mod wheel is `CV 2`. FM, AM and Ring morphs on oscillator 2 are the cross modulation.
- FairWave has no filter, and can't morph or blend live. Those are worked out here into the table, frame by frame. If they
  don't move, they are baked in, and `POS` is still the wavetable's position. If they do, each frame of a new table is one
  moment along that movement, and `POS` moves along it: a filter envelope is then `ENV 2 > POS`, as in `TABLES`.
- Effects, velocity, the motion sequencer, Kaoss Physics, and modulation between modulators have nowhere to go. Each patch's
  comments say what it lost. Knobs (Mod Knobs) are taken where the patch left them.

Filters and morphs follow the manual's descriptions, not the instrument's code, so they are close and not exact.
"""

import argparse
import hashlib
import math
import re
import sys
from collections import Counter
from dataclasses import dataclass, field
from functools import cached_property
from pathlib import Path

import numpy as np
from scipy.signal import resample_poly

HERE = Path(__file__).resolve().parent
sys.path.insert(0, str(HERE))

import modwave as mw  # noqa: E402
from korg import read_multisample  # noqa: E402
from modwave_bank import read_banks  # noqa: E402
from samples import (FRAME_LENGTHS, MAX_FRAMES, MAX_LOOPED_FRAMES, frame_len_for, frame_percent, percent_text, read_audio, stretch,  # noqa: E402
                     to_table, wav_bytes)

BAKED_LENGTH = 1024
PATH_FRAMES = 48
FOLDER_ENTRIES = 250
PEAK = 30000.0
# Samples a recording can have and any two still fit: 7 MB of pool, less 1.1 MB of built-in tables and the patch window, at
# 4 bytes a sample with its band-limited levels. That's about 16 seconds at 48 kHz.
MAX_RECORDING = 760_000
CHANNELS = {"CHANNEL_SELECT_LEFT": 1, "CHANNEL_SELECT_RIGHT": 2}
MIN_MOVE = {"cutoff": 2.0, "morph": 2.0, "blend": 2.0, "position": 0.5}
# How much a change in each means to the ear: a whole filter sweep is about 4 octaves.
WEIGHT = {"cutoff": 1 / 48, "morph": 1 / 100, "blend": 1 / 100, "position": 1 / 100, "pitch": 1 / 600, "level": 1 / 100}

MORPH_NONE, MORPH_SYNC, MORPH_WSYNC, MORPH_STRETCH, MORPH_FLIP, MORPH_MIRROR, MORPH_NARROW, MORPH_WNARROW = 0, 1, 2, 3, 4, 5, 6, 7
MORPH_FM, MORPH_AM, MORPH_RING, MORPH_MIRROR2, MORPH_NARROW2, MORPH_WNARROW2 = 11, 12, 13, 14, 15, 16
CROSS_MORPHS = {MORPH_FM: "FM", MORPH_AM: "AM", MORPH_RING: "RING"}
OSC_A, OSC_AB, OSC_SAMPLE = 0, 1, 2
SUB_SQUARE, SUB_TRIANGLE = 0, 1
LFO_SHAPES = {0: "TRI", 1: "SAW DN", 2: "SAW UP", 3: "SQUARE", 4: "SINE", 5: "SINE", 6: "TRI", 7: "SAW DN", 8: "SAW UP", 9: "TRI", 10: "TRI",
              11: "SAW DN", 12: "SAW DN", 13: "RANDOM", 14: "RANDOM", 15: "RANDOM", 16: "RANDOM", 17: "RANDOM", 18: "RANDOM"}
# A note's length in quarter notes, by `NoteLength`.
NOTE_QUARTERS = {0: 4, 1: 2, 2: 4 / 3, 3: 1, 4: 2 / 3, 5: 0.5, 6: 1 / 3, 7: 0.25, 8: 1 / 6, 9: 0.125, 10: 0.375, 11: 0.75, 13: 1.5, 14: 3, 15: 8 / 3,
                 16: 6, 17: 8, 18: 16, 19: 1 / 12, 21: 0.1875, 22: 12, 23: 16 / 3, 24: 32 / 3, 25: 0.09375}


C4_HZ = 261.62558
# How slowly a table's frames can come round: `TUNE = -48` and `FINE = -50`, in frames a second.
SLOWEST_FRAMES = C4_HZ * 2 ** (-48.5 / 12)


def hz_of(note):
    return 440 * 2 ** ((note - 69) / 12)


# ---- Parameters and what moves them ----


@dataclass
class Move:
    """A modulation that goes on moving while a note plays: `source` a modulator's key, or "wheel"."""
    source: str
    amount: float


@dataclass
class Sources:
    """What's at rest and what moves, for one program."""
    macros: dict
    voice: list
    common: list
    program: list
    lost: Counter = field(default_factory=Counter)

    def at_rest(self, kind):
        """A source's value with nobody touching anything, or None if it moves by itself."""
        if kind == 0 or 1 <= kind <= 119 or 128 <= kind <= 246 or 258 <= kind <= 260 or 271 <= kind <= 276 or 300 <= kind <= 315 or 500 <= kind <= 507:
            return 0.0
        if kind in (261, 262, 277):
            return 1.0
        if kind == 267:
            return 0.75
        if kind == 268:
            return 0.6
        if kind == 269:
            return 0.5
        if kind in (263, 264, 265, 266, 270):
            return 0.0
        if 400 <= kind <= 499 or 600 <= kind <= 699:
            return self.macros.get(kind, 0.0)
        return None

    def key_of(self, kind):
        """A moving source's modulator, as a key, and the modulator: or None."""
        if kind == 40000:
            return "amp", {"adsr": True}
        for base, name, items in ((20000, "v", self.voice), (30000, "c", self.common), (10000, "p", self.program)):
            if base <= kind < base + 5000 and kind - base < len(items):
                return f"{name}{kind - base}", items[kind - base]
        return None


def number_of(value):
    if isinstance(value, dict):
        return value.get("float_value", value.get("int_value", 0.0))
    return value or 0.0


def resolve_one(m, sources, base, moves):
    """One modulation: added to `base` if it stands still, or to `moves`."""
    amount = number_of(m.get("intensity"))
    scale = m.get("intensity_mod_source")
    if scale:
        at = sources.at_rest(scale.get("type", 0))
        if at is None:
            # Scaled by something that moves, and modulators don't multiply here: its middle will do.
            at = 0.5
        if at == 0 and 1 <= scale.get("type", 0) <= 119:
            sources.lost["the mod wheel's scaling of a modulation"] += 1
        amount *= at
    if amount == 0:
        return base
    kind = m.get("source", {}).get("type", 0)
    if kind == 1:
        moves.append(Move("wheel", amount))
        return base
    at = sources.at_rest(kind)
    if at is not None:
        if 271 <= kind <= 276 or 300 <= kind <= 315 or 2 <= kind <= 119:
            sources.lost["controllers, random and Kaoss Physics"] += 1
        return base + amount * at
    found = sources.key_of(kind)
    if found is None:
        sources.lost["the motion sequencer" if 15000 <= kind < 20000 else "performance modulators"] += 1
        return base
    key, modulator = found
    if "key_track" in modulator:
        moves.append(Move(key, amount))
    elif "modulation_processor" in modulator or "number_generator" in modulator or "step_sequencer" in modulator:
        sources.lost["modulation processors"] += 1
    else:
        moves.append(Move(key, amount))
    return base


def resolve(p, sources, default=0.0):
    """(where a parameter rests, what moves it)."""
    if not isinstance(p, dict):
        return (p if p is not None else default), []
    # (A parameter that's there with no value is 0, as protobuf reads it, and not the default.)
    base = p.get("value", 0.0)
    moves = []
    for m in (p.get("modulation_list") or {}).get("modulation", []):
        base = resolve_one(m, sources, base, moves)
    return base, moves


def built_in(b, sources, base, moves):
    """A `BuiltInModulation`: a routing with its own place on the panel, its amount perhaps moved by velocity."""
    if not b or "modulation" not in b:
        return base
    m = dict(b["modulation"])
    extra = 0.0
    for i in (b.get("intensity_modulation") or {}).get("modulation", []):
        at = sources.at_rest(i.get("source", {}).get("type", 0))
        extra += number_of(i.get("intensity")) * (at if at is not None else 0.0)
    m["intensity"] = {"float_value": number_of(m.get("intensity")) + extra}
    return resolve_one(m, sources, base, moves)


# ---- Tables ----


def harmonics_of(length):
    return np.arange(1, length // 2 + 1, dtype=float)


def gain_by_harmonic(frames, gain):
    x = np.fft.rfft(frames, axis=-1)
    x[..., 1:] *= gain(harmonics_of(frames.shape[-1]))
    return np.fft.irfft(x, frames.shape[-1], axis=-1)


def clip_of(frames, gain):
    return np.clip(frames * gain, -1, 1)


def steps_of(frames, bits):
    n = 2 ** bits
    return np.round((frames + 1) / 2 * (n - 1)) / (n - 1) * 2 - 1


def only_where(keep):
    return lambda n: np.where(keep(n), 1.0, 0.0)


ODD_ONLY = only_where(lambda n: n % 2 == 1)
EVEN_ONLY = only_where(lambda n: (n % 2 == 0) | (n == 1))
SKIP_3 = only_where(lambda n: n % 3 != 0)
ORGAN = {1, 2, 3, 4, 5, 6, 8}


def modified(frames, mode):
    """A table as a Wavetable Modifier makes it: the manual says what each does, and in places how much."""
    if mode in (None, 0, "LOAD_MODE_NORMAL"):
        return frames
    name = str(mode).replace("LOAD_MODE_", "")
    if name == "KNOCK_OUT_EVEN_HARMONICS":
        return gain_by_harmonic(frames, ODD_ONLY)
    if name == "KNOCK_OUT_ODD_HARMONICS":
        return gain_by_harmonic(frames, EVEN_ONLY)
    if name == "KNOCK_OUT_EVERY_3RD_HARMONIC":
        return gain_by_harmonic(frames, SKIP_3)
    if name == "CLIP_AND_KNOCK_OUT_EVEN":
        return gain_by_harmonic(clip_of(frames, 3.0), ODD_ONLY)
    if name == "CLIP_AND_KNOCK_OUT_ODD":
        return gain_by_harmonic(clip_of(frames, 3.0), EVEN_ONLY)
    if name == "CLIP_AND_KNOCK_OUT_EVERY_3RD":
        return gain_by_harmonic(clip_of(frames, 3.0), SKIP_3)
    if name == "KEEP_LOW_20_HARMONICS":
        return gain_by_harmonic(frames, only_where(lambda n: n <= 20))
    if name == "KEEP_LOW_12_HARMONICS":
        return gain_by_harmonic(frames, only_where(lambda n: n <= 12))
    if name == "ORGANIZE":
        return gain_by_harmonic(frames, lambda n: np.where(np.isin(n, list(ORGAN)), 1.0, 0.1))
    if name == "VINTAGE_EIGHT_BIT":
        return steps_of(frames, 8)
    if name == "VINTAGE_TWELVE_BIT":
        return steps_of(frames, 12)
    if name == "TWO_BIT":
        return steps_of(frames, 2)
    if name == "THREE_BIT":
        return steps_of(frames, 3)
    if name == "FOUR_BIT":
        return steps_of(frames, 4)
    if name == "SOFT_CLIP":
        return np.tanh(frames * 1.6) / np.tanh(1.6)
    if name == "HARD_CLIP":
        return clip_of(frames, 3.0)
    if name == "INFINITE_CLIP":
        return clip_of(frames, 1000.0)
    if name == "TILT_UP":
        return gain_by_harmonic(frames, lambda n: (n / 12) ** 0.5)
    if name == "TILT_UP_PLUS":
        return gain_by_harmonic(frames, lambda n: (n / 12) ** 1.0)
    if name == "TILT_DOWN":
        return gain_by_harmonic(frames, lambda n: (n / 12) ** -0.5)
    if name == "TILT_DOWN_PLUS":
        return gain_by_harmonic(frames, lambda n: (n / 8) ** -1.0)
    if name == "LOW_BOOST":
        return gain_by_harmonic(frames, lambda n: np.where(n <= 5, 2.0, 1.0))
    if name == "LOW_CUT":
        return gain_by_harmonic(frames, lambda n: np.where(n <= 3, 0.5, 1.0))
    if name == "LOW_CUT_PLUS":
        return gain_by_harmonic(frames, lambda n: np.where(n <= 5, 0.2, 1.0))
    if name == "MUTED":
        return gain_by_harmonic(frames, lambda n: np.where(n > 1, 0.08, 1.0))
    if name == "FADE_OUT":
        n = len(frames)
        return frames * np.linspace(1, 0, n)[:, None] if n > 1 else frames
    if name == "REVERSE":
        return frames[::-1]
    gain = {"PLUS_3_DB": 1.4125, "PLUS_6_DB": 1.9953, "MINUS_3_DB": 0.7079, "MINUS_6_DB": 0.5012}.get(name)
    return frames * gain if gain else frames


def at_position(frames, percent, width_percent):
    """The cycle at a position, as the manual's "ribbon": neighbouring waves crossfade over `width` of the way between them."""
    n = len(frames)
    if n == 1:
        return frames[0]
    a = min(max(percent, 0.0), 100.0) / 100
    w = min(max(width_percent, 0.0), 100.0) / 100
    x = a * (n - w)
    i = min(int(x), n - 1)
    f = x - i
    if w <= 0 or f < 1 - w or i == n - 1:
        return frames[i]
    mix = (f - (1 - w)) / w
    return frames[i] * (1 - mix) + frames[i + 1] * mix


def stretched(t, amount):
    """Morph `Stretch`: the first part of a cycle takes more or less of it, unaltered at 50."""
    k = min(max(amount / 100, 0.02), 0.98)
    return np.where(t < k, t * 0.5 / k, 0.5 + (t - k) * 0.5 / (1 - k))


def morphed(cycle, kind, amount, max_sync_cents=4800.0):
    """A cycle under a Morph Type. Read at four times the rate, and band-limited on the way back."""
    if kind in (MORPH_NONE, MORPH_FM, MORPH_AM, MORPH_RING) or (kind == MORPH_STRETCH and abs(amount - 50) < 0.01):
        return cycle
    n = len(cycle)
    over = n * 4
    x = np.fft.rfft(cycle)
    fine = np.fft.irfft(x, over) * 4
    t = np.arange(over) / over

    def read(phase):
        at = phase % 1 * over
        i = at.astype(int)
        f = at - i
        return fine[i % over] * (1 - f) + fine[(i + 1) % over] * f

    if kind in (MORPH_SYNC, MORPH_WSYNC):
        ratio = 2 ** (amount / 100 * max_sync_cents / 1200)
        y = read(t * ratio)
        if kind == MORPH_WSYNC:
            y = y * (1 - (amount / 100) * np.cos(np.pi * t) ** 2)
    elif kind == MORPH_STRETCH:
        y = read(stretched(t, amount))
    elif kind == MORPH_FLIP:
        y = read(t) * np.where(t < 1 - amount / 100, 1.0, -1.0)
    elif kind in (MORPH_MIRROR, MORPH_MIRROR2):
        s = stretched(t, amount)
        if kind == MORPH_MIRROR2:
            s = stretched(s, amount)
        y = read(np.where(s < 0.5, 2 * s, 2 * (1 - s)))
    else:
        width = max(1 - amount / 100, 0.02)
        s = t / width
        if kind in (MORPH_NARROW2, MORPH_WNARROW2):
            s = np.where(s < 1, stretched(np.minimum(s, 0.9999), amount), 1)
        y = np.where(t < width, read(s), 0.0)
        if kind in (MORPH_WNARROW, MORPH_WNARROW2):
            y = y * np.where(t < width, np.sin(np.pi * np.minimum(t / width, 1.0)) ** 0.5, 0.0)
    return np.fft.irfft(np.fft.rfft(y)[:n // 2 + 1] / 4, n)


# ---- Filters ----


FILTER_KINDS = {
    "two_pole_low_pass_filter": ("2", "LP"), "four_pole_low_pass_filter": ("4", "LP"),
    "two_pole_resonant_low_pass_filter": ("2", "LP"), "two_pole_resonant_high_pass_filter": ("2", "HP"),
    "two_pole_resonant_band_pass_filter": ("2", "BP"), "two_pole_resonant_band_reject_filter": ("2", "BR"),
    "four_pole_resonant_low_pass_filter": ("4", "LP"), "four_pole_resonant_high_pass_filter": ("4", "HP"),
    "four_pole_resonant_band_pass_filter": ("4", "BP"), "four_pole_resonant_band_reject_filter": ("4", "BR"),
    "polysix_filter": ("P", "LP"), "ms20_low_pass_filter": ("M", "LP"), "ms20_high_pass_filter": ("M", "HP"),
    "two_pole_multi_filter": ("2", "MULTI"), "tpt_two_pole_multi_filter": ("2", "MULTI"), "tpt_two_pole_multi_filter_nonlinear": ("2", "MULTI"),
    "mpoly_low_pass_filter": ("P", "LP"), "mini_low_pass_filter": ("P", "LP"), "pro_low_pass_filter": ("P", "LP"),
    "korg35_low_pass_filter": ("M", "LP"), "korg35_high_pass_filter": ("M", "HP"), "odyssey_rev_3_filter": ("2", "LP"),
    "four_pole_ladder_high_pass_filter": ("4", "HP"), "four_pole_ladder_band_pass_filter": ("4", "BP"), "tpt_svf": ("2", "LP"),
    "tpt_two_pole_resonant_low_pass_filter": ("2", "LP"), "tpt_two_pole_resonant_high_pass_filter": ("2", "HP"),
    "tpt_two_pole_resonant_band_pass_filter": ("2", "BP"), "tpt_two_pole_resonant_band_reject_filter": ("2", "BR"),
    "tpt_four_pole_resonant_low_pass_filter": ("4", "LP"), "tpt_four_pole_resonant_high_pass_filter": ("4", "HP"),
    "tpt_four_pole_resonant_band_pass_filter": ("4", "BP"), "tpt_four_pole_resonant_band_reject_filter": ("4", "BR"),
}
MODE_MIX = {  # lp, hp, bp, dry
    "LOW_PASS": (1, 0, 0, 0), "HIGH_PASS": (0, 1, 0, 0), "BAND_PASS": (0, 0, 1, 0), "BAND_REJECT": (1, 1, 0, 0), "LP_PLUS_BP": (1, 0, 1, 0),
    "LP_MINUS_BP": (1, 0, -1, 0), "LP_MINUS_HP": (1, -1, 0, 0), "BP_PLUS_HP": (0, 1, 1, 0), "BP_MINUS_HP": (0, -1, 1, 0), "DRY_PLUS_LP": (1, 0, 0, 1),
    "DRY_MINUS_LP": (-1, 0, 0, 1), "DRY_PLUS_BP": (0, 0, 1, 1), "DRY_MINUS_BP": (0, 0, -1, 1), "DRY_PLUS_LP_MINUS_HP": (1, -1, 0, 1),
    "DRY_PLUS_LP_MINUS_BP": (1, 0, -1, 1), "DRY_PLUS_BP_MINUS_LP": (-1, 0, 1, 1), "DRY_PLUS_BP_MINUS_HP": (0, -1, 1, 1),
    "DRY_PLUS_HP_MINUS_LP": (-1, 1, 0, 1), "DRY_PLUS_HP_MINUS_BP": (0, 1, -1, 1), "LP_PLUS_HP_PLUS_BP": (1, 1, 1, 0), "ALL_ON": (1, 1, 1, 1),
}


def filter_spec(model):
    """The layer's filter: (poles, mode, its own message), or None if it's off."""
    f = model.get("filter", {})
    if not f.get("enable", False):
        return None
    for name, message in f.items():
        if name in FILTER_KINDS:
            return (*FILTER_KINDS[name], message)
    return None


def filter_common(message):
    for key in ("common",):
        if key in message:
            return message[key]
    for key, inner in (("multi_mode_filter_common", "common"), ("four_pole_filter_common", "common"), ("two_pole_filter_common", "common")):
        if key in message:
            return message[key].get(inner, {})
    return {}


def response(poles, mode, message, cutoff_note, reso, harmonic_hz):
    """A filter's complex gain at each harmonic. From what each kind is, not what the instrument does exactly."""
    s = 1j * harmonic_hz / hz_of(cutoff_note)
    r = min(max(reso, 0.0), 100.0) / 100
    if poles in ("2", "M"):
        q = 0.5 + (r ** 2) * (30 if poles == "M" else 14)
        d = 1 + s / q + s * s
        parts = {"LP": 1 / d, "HP": s * s / d, "BP": (s / q) / d, "BR": (1 + s * s) / d}
        if mode == "MULTI":
            controls = message.get("mode_control", [{}, {}])
            mix = 0.0
            xfade = message.get("mode_crossfade_percent")
            xfade = (xfade.get("value", 0.0) if isinstance(xfade, dict) else 0.0) / 100
            lp, hp, bp = parts["LP"], parts["HP"], parts["BP"]
            total = np.zeros_like(s)
            for control, weight in zip(controls, (1 - xfade, xfade)):
                name = control.get("mode", "LOW_PASS")
                if name == "MANUAL":
                    a = [control.get(k, {}).get("value", 0.0) / 100 for k in ("manual_lp_percent", "manual_hp_percent", "manual_bp_percent", "manual_dry_percent")]
                else:
                    a = MODE_MIX.get(name, (1, 0, 0, 0))
                total = total + weight * (a[0] * lp + a[1] * hp + a[2] * bp + a[3])
            mix = total
            return mix
        return parts[mode]
    k = r * (3.9 if poles == "P" else 3.6)
    g = 1 / (1 + s)
    h = s / (1 + s)
    loop = g ** 4
    if mode == "LP":
        return loop / (1 + k * loop) * (1 + 0.35 * k)
    if mode == "HP":
        return h ** 4 / (1 + k * loop)
    if mode == "BP":
        return 4 * g ** 2 * h ** 2 / (1 + k * loop)
    return 1 - 4 * g ** 2 * h ** 2 / (1 + k * loop)


def filtered(cycle, spec, cutoff_note, reso, cycle_hz):
    if spec is None:
        return cycle
    poles, mode, message = spec
    x = np.fft.rfft(cycle)
    x[1:] *= response(poles, mode, message, cutoff_note, reso, harmonics_of(len(cycle)) * cycle_hz)
    x[0] = 0
    y = np.fft.irfft(x, len(cycle))
    if poles == "M":
        # The MS-20's resonance overdrives: as loud as it gets, it folds over rather than growing on.
        d = 1 + 2 * (min(max(reso, 0.0), 100.0) / 100) ** 2
        y = np.tanh(y * d) / np.tanh(d) if np.abs(y).max() > 0 else y
    return y


# ---- A patch ----


@dataclass
class Osc:
    layer: int
    index: int
    level: float
    semitones: int
    cents: float
    kind: int
    model: dict
    message: dict
    sources: Sources
    level_moves: list
    pitch_moves: list
    position: tuple
    blend: tuple
    morph: tuple
    width: float
    filter_spec: tuple
    cutoff: tuple
    resonance: float
    filter_gain: float
    key_track: float
    sub: tuple = None       # (waveform, its share of the frame, this oscillator's share, cycles of this oscillator to one of it)


def keytrack_of(model, sources, message):
    """The filter's key track as a fraction: 1 is a cutoff that follows the note. The manual: +60 is one octave an octave."""
    common = filter_common(message)
    moves = []
    built_in(common.get("frequency_key_track_modulation"), sources, 0.0, moves)
    return sum(m.amount for m in moves) / 60


def read_layer(prog, track_common, macros, layer, base_semitones):
    """(oscillators worth hearing, envelope and LFO messages, what the patch lost) for one Program."""
    out = []
    models = mw.models_of(prog)
    if not models or (track_common and not track_common.get("enable_track", {}).get("value", False)) or track_common.get("mute", {}).get("value"):
        return out, None, Counter()
    model = models[0]
    common = model.get("common", {})
    program_macros = {600 + i: m.get("value_signed_percent", {}).get("value", 0.0) / 100
                      for i, m in enumerate((prog.get("macro_modifiers") or {}).get("assignable", []))}
    sources = Sources({**macros, **program_macros}, common.get("voice_modulator", []), common.get("common_modulator", []), prog.get("modulator", []))
    spec = filter_spec(model)
    f_common = filter_common(spec[2]) if spec else {}
    out_level, out_moves = resolve(f_common.get("output_level_percent"), sources, 100.0) if spec else (100.0, [])
    if spec and out_level <= 1 and not out_moves:
        return out, None, sources.lost
    trim, _ = resolve(f_common.get("input_trim_percent"), sources, 100.0) if spec else (100.0, [])
    amp_level, amp_moves = resolve(model.get("amp", {}).get("level_percent"), sources, 100.0)
    built_in(model.get("amp", {}).get("level_lfo_modulation"), sources, 0.0, amp_moves)
    if amp_level <= 1 and not amp_moves:
        return out, None, sources.lost
    cutoff_base, cutoff_moves = resolve(f_common.get("frequency_semitones"), sources, 136.0) if spec else (136.0, [])
    if spec:
        cutoff_base = built_in(f_common.get("frequency_lfo_modulation"), sources, cutoff_base, cutoff_moves)
        cutoff_base = built_in(f_common.get("frequency_eg_modulation"), sources, cutoff_base, cutoff_moves)
    cutoff_moves = [m for m in cutoff_moves if "key_track" not in (sources.key_of(int(m.source[1:]) + {"v": 20000, "c": 30000, "p": 10000}.get(m.source[0], 0))[1] if m.source[0] in "vcp" else {})]
    resonance, _ = resolve(f_common.get("resonance_percent"), sources, 0.0)
    key = keytrack_of(model, sources, spec[2]) if spec else 1.0

    voice_pitch = model.get("pitch", {})
    voice_moves = []
    resolve_pitch(voice_pitch, sources, voice_moves)
    gain = out_level / 100 * trim / 100 * amp_level / 100

    for index, name in ((0, "oscillator1"), (1, "oscillator2")):
        osc = model.get(name, {})
        level, level_moves = resolve(osc.get("level_percent"), sources, 0.0)
        kind = osc.get("oscillator_type", {}).get("value", OSC_A) if isinstance(osc.get("oscillator_type"), dict) else OSC_A
        morph_kind = osc.get("morph_type", {}).get("value", 0) if isinstance(osc.get("morph_type"), dict) else 0
        audible = level > 1 or any(abs(m.amount) > 1 for m in level_moves)
        if not audible and morph_kind not in CROSS_MORPHS and not (index == 0 and second_uses_first(model)):
            continue
        pitch = osc.get("pitch", {})
        semis, cents, pitch_moves = pitch_of(pitch, sources)
        v_semis, v_cents, _ = pitch_of(voice_pitch, sources)
        wave = osc.get("wave_table_osc", {})
        position = resolve(wave.get("position_percent"), sources, 0.0)
        blend = resolve(wave.get("a_b_blend_percent"), sources, 0.0)
        morph_amount = resolve(osc.get("morph_amount_percent"), sources, 0.0)
        width = resolve(wave.get("position_interpolation_width_percent"), sources, 100.0)[0]
        out.append(Osc(layer, index, level / 100 * gain, base_semitones + semis + v_semis, cents + v_cents, kind, model, osc, sources, level_moves + amp_moves,
                       pitch_moves + voice_moves, position, blend, (morph_kind, *morph_amount), width, spec, (cutoff_base, cutoff_moves), resonance, gain, key))
    attach_sub(model, out, sources, gain)
    return out, model, sources.lost


def attach_sub(model, oscs, sources, gain):
    """The sub goes in oscillator 1's table, whose pitch it follows, unless that's a modulator for FM and the like."""
    sub = model.get("sub_oscillator", {})
    level, _ = resolve(sub.get("level_percent"), sources, 0.0)
    if level <= 1:
        return
    waveform = sub.get("waveform", {}).get("value", SUB_SQUARE) if isinstance(sub.get("waveform"), dict) else SUB_SQUARE
    if waveform not in (SUB_SQUARE, SUB_TRIANGLE):
        sources.lost["the noise generator"] += 1
        return
    first = next((o for o in oscs if o.index == 0 and o.kind != OSC_SAMPLE), None)
    if first is None or second_uses_first(model):
        sources.lost["the sub oscillator"] += 1
        return
    octave = sub.get("octave", {}).get("value", 0) if isinstance(sub.get("octave"), dict) else 0
    cycles = 2 ** max(0, min(2, -octave))
    main = first.level / gain * 100 if gain else 0.0
    top = max(main, level)
    first.sub = (waveform, level / top, main / top, cycles)
    first.level = top / 100 * gain


def second_uses_first(model):
    osc2 = model.get("oscillator2", {})
    kind = osc2.get("morph_type", {}).get("value", 0) if isinstance(osc2.get("morph_type"), dict) else 0
    return kind in CROSS_MORPHS


def pitch_of(p, sources):
    """(semitones, cents, what moves it, in cents)."""
    semis = 12 * (p.get("transpose_octaves", {}).get("value", 0) if isinstance(p.get("transpose_octaves"), dict) else 0)
    semis += p.get("transpose_semitones", {}).get("value", 0) if isinstance(p.get("transpose_semitones"), dict) else 0
    cents, moves = resolve(p.get("tune_cents"), sources, 0.0)
    built_in(p.get("tune_lfo_modulation"), sources, 0.0, moves)
    built_in(p.get("tune_eg_modulation"), sources, 0.0, moves)
    return semis, cents, moves


def resolve_pitch(p, sources, moves):
    _, _, found = pitch_of(p, sources)
    moves.extend(found)


def sign_name(x):
    return ("" if x >= 0 else "-") + f"{abs(x):g}"


def modulator_kind(sources, key):
    """"env", "lfo", "track", or "wheel", for a moving source's key."""
    if key in ("wheel", "amp"):
        return "wheel" if key == "wheel" else "env"
    m = modulator_of(sources, key)
    if m is None:
        return None
    if "lfo" in m:
        return "lfo"
    if "adsr" in m or "analog_adsr" in m or "eg" in m:
        return "env"
    if "key_track" in m:
        return "track"
    return None


def modulator_of(sources, key):
    if key in ("wheel", "amp"):
        return None
    items = {"v": sources.voice, "c": sources.common, "p": sources.program}[key[0]]
    i = int(key[1:])
    return items[i] if i < len(items) else None


# ---- What a table holds ----


@dataclass
class Baked:
    frames: np.ndarray
    peak: float
    plain: str = ""


class FileMultisample:
    """A Sample Builder file and the WAVs beside it. It answers as `modwave_bank.Multisample` does."""

    def __init__(self, path):
        self.path = Path(path)

    @cached_property
    def contents(self):
        return read_multisample(self.path)

    @property
    def name(self):
        return self.contents.name or self.path.stem

    @property
    def zones(self):
        return self.contents.zones

    def audio(self, zone, channel=0):
        return read_audio(self.path.parent / zone.path)


def within_memory(x, rate, start, loop_start, end, one_shot):
    """A recording as `to_table` can take it, and as table memory has room for. One that plays once is cut short: by then it's
    mostly its tail. A loop can't be, without a jump where it comes round, so it loses its top octave and keeps all its length."""
    if end - start + 1 <= MAX_RECORDING:
        return x, rate, start, loop_start, end
    if one_shot or loop_start >= end:
        end = start + MAX_RECORDING - 1
        x = x[:end + 1].copy()
        n = int(min(rate, MAX_RECORDING))
        x[-n:] *= np.linspace(1.0, 0.0, n)
        return x, rate, start, loop_start, end
    ratio = math.ceil((end - start + 1) / MAX_RECORDING)
    y = resample_poly(x[:end + 1], 1, ratio)
    return y, rate / ratio, start // ratio, loop_start // ratio, min(end // ratio, len(y) - 1)


def for_its_speed(x, rate, start, loop_start, end, one_shot, speed):
    """A recording with frames enough for how slowly it plays, or None if it has them already. `TUNE` only goes so low, so a
    sample a long way under its root key needs its frames closer together: it's sampled more finely, or if it's so long that
    it would run out of frames, cut to what plays before they do. A loop keeps its join: `to_table` draws it in if it clicks."""
    looped = not (one_shot or loop_start >= end)
    n = end - start + 1
    limit = (MAX_LOOPED_FRAMES if looped else MAX_FRAMES) - 2
    natural = frame_len_for(n + 256 if looped else n, looped)
    # (a little to spare, as lining a loop up to its frames can change its speed by one part in fifty)
    least = SLOWEST_FRAMES * 1.03 / speed
    if rate / natural >= least:
        return None
    frames = math.ceil(least * n / rate)
    if frames > limit:
        n = int(limit / least * rate)
        frames = limit
        end = start + n - 1
        if looped:
            loop_start = min(loop_start, start + n * 3 // 4)
        else:
            x = x[:end + 1].copy()
            fade = min(n, int(rate))
            x[-fade:] *= np.linspace(1.0, 0.0, fade)
    length = max(L for L in FRAME_LENGTHS if L <= natural and (frames * L <= MAX_RECORDING or L == FRAME_LENGTHS[0]))
    ratio = round(frames * length / n * 4096) / 4096
    y = stretch(x[:end + 1], ratio)
    return y, rate * ratio, round(start * ratio), round(loop_start * ratio), min(round(end * ratio), len(y) - 1)


class Tables:
    """Wavetables, and what's been made from them, kept once each however many patches share it."""

    def __init__(self, out, library, multisamples=None):
        self.out = Path(out)
        self.library = library
        self.written = {}
        self.waves = {}
        self.multisamples = multisamples or {}
        self.recordings = {}

    def recording(self, source, zone, start, channel, speed=1.0):
        """A zone as a table to play at this speed, or None if it can't be read. Many patches share a few recordings, and
        making the table is the slow part: most of them are the same at any speed."""
        key = (id(zone), start, channel, round(speed, 5))
        if key not in self.recordings:
            try:
                x, rate = source.audio(zone, channel)
            except (OSError, ValueError):
                self.recordings[key] = None
                return None
            end = min(zone.end or len(x) - 1, len(x) - 1)
            first = start if start < end else zone.start
            fitted = within_memory(x, rate, first, zone.loop_start, end, zone.one_shot)
            slowed = for_its_speed(*fitted, zone.one_shot, speed)
            any_speed = (id(zone), start, channel, None)
            if slowed is not None:
                self.recordings[key] = to_table(*slowed, zone.one_shot)[0]
            else:
                if any_speed not in self.recordings:
                    self.recordings[any_speed] = to_table(*fitted, zone.one_shot)[0]
                self.recordings[key] = self.recordings[any_speed]
        return self.recordings[key]

    def wave(self, raw_uuid, load_mode):
        """A wavetable as its Modifier leaves it, or None if I haven't got it."""
        key = (raw_uuid, load_mode)
        if key not in self.waves:
            t = self.library.wavetables.get(mw.uuid_text(raw_uuid)) if raw_uuid else None
            self.waves[key] = modified(t.frames.astype(float), load_mode) if t is not None else None
        return self.waves[key]

    def write(self, frames, sample=False):
        """A table, by what's in it. Its name is its contents' hash, so two patches with the same table share one file."""
        # (a morph can leave a cycle off centre, and a recording can have been made off centre: the instrument's outputs
        # wouldn't pass that and FairWave's would)
        frames = frames - frames.mean() if sample else frames - frames.mean(axis=1, keepdims=True)
        peak = float(np.abs(frames).max())
        peak = peak if peak > 0 else 1.0
        samples = np.clip(np.round(frames / peak * PEAK), -32768, 32767).astype(np.int16)
        digest = hashlib.sha1(samples.tobytes()).hexdigest()
        rel = f"MODWAVE/T/{digest[:2].upper()}/{digest[2:10].upper()}.WAV"
        if rel not in self.written:
            path = self.out.parent / rel
            path.parent.mkdir(parents=True, exist_ok=True)
            path.write_bytes(wav_bytes(samples.reshape(-1), frames.shape[1]))
            self.written[rel] = len(samples.tobytes())
        return rel, peak


def downsample(frames, length):
    if frames.shape[-1] == length:
        return frames
    x = np.fft.rfft(frames, axis=-1)[..., :length // 2 + 1]
    x[..., -1] = 0
    return np.fft.irfft(x, length, axis=-1) * (length / frames.shape[-1])


def sub_cycle(waveform, length):
    """A band-limited square or triangle, of a whole frame's length."""
    n = harmonics_of(length)
    x = np.zeros(length // 2 + 1, complex)
    odd = n % 2 == 1
    if waveform == SUB_TRIANGLE:
        x[1:][odd] = -1j * (8 / np.pi ** 2) * (-1.0) ** ((n[odd] - 1) / 2) / n[odd] ** 2
    else:
        x[1:][odd] = -1j * (4 / np.pi) / n[odd]
    return np.fft.irfft(x * length / 2, length)


def with_sub(cycle, sub):
    """An oscillator and its sub in one frame. A sub an octave or two down makes the frame two or four cycles long,
    which `plan_osc` tunes down to suit: nothing else in a table's frame has to be one cycle."""
    if sub is None:
        return cycle
    waveform, sub_share, main_share, cycles = sub
    length = len(cycle)
    if cycles > 1:
        x = np.fft.rfft(cycle)[:length // (2 * cycles) + 1]
        x[-1] = 0
        one = np.fft.irfft(x, length // cycles) / cycles
        cycle = np.tile(one, cycles)
    return cycle * main_share + sub_cycle(waveform, length) * sub_share


def cycle_of(tables, osc, position, blend, morph_amount):
    """One moment of an oscillator, before its filter."""
    wave = osc.message.get("wave_table_osc", {})
    a = tables.wave(wave.get("wave_table_a_uuid"), wave.get("wave_table_a_load_mode"))
    if a is None:
        return None
    cycle = at_position(a, position, osc.width)
    if osc.kind == OSC_AB:
        b = tables.wave(wave.get("wave_table_b_uuid"), wave.get("wave_table_b_load_mode"))
        if b is not None:
            offset, _ = resolve(wave.get("b_position_offset_percent"), osc.sources, 0.0)
            mix = min(max(blend, 0.0), 100.0) / 100
            cycle = cycle * (1 - mix) + at_position(b, position + offset, osc.width) * mix
    sync_cents, _ = resolve(wave.get("max_sync_interval_cents"), osc.sources, 4800.0)
    return morphed(cycle, osc.morph[0], morph_amount, sync_cents)


@dataclass
class Plan:
    """How one FairWave oscillator plays one modwave oscillator."""
    table: str
    tune: int
    fine: int
    position: float         # 0 to 100
    read: str
    slots: list             # (source key, destination, percent)
    peak: float
    note: str = ""
    extra: str = ""
    fixed_pitch: bool = False


def moves_of(osc):
    """What moves each thing that has to be baked, for one oscillator."""
    kind, _, morph_moves = osc.morph
    return {
        "cutoff": [m for m in osc.cutoff[1]] if osc.filter_spec else [],
        "morph": morph_moves if kind not in CROSS_MORPHS and kind != MORPH_NONE else [],
        "blend": osc.blend[1] if osc.kind == OSC_AB else [],
    }


def source_scores(osc, include_position=True):
    """How much each moving source does to this oscillator's sound, in FairWave's terms."""
    scores = Counter()
    if osc.kind == OSC_SAMPLE:
        return scores
    for dest, moves in moves_of(osc).items():
        for m in moves:
            scores[m.source] += abs(m.amount) * WEIGHT[dest]
    if include_position:
        for m in osc.position[1]:
            scores[m.source] += abs(m.amount) * WEIGHT["position"]
    return scores


def sample_set(osc):
    """A sample oscillator's first velocity zone: every sound in the collection has just one."""
    zones = osc.message.get("pcm_osc", {}).get("multi_sample_set", {}).get("velocity_zone", [])
    return zones[0] if zones else {}


def sample_uuid(osc):
    return mw.uuid_text(sample_set(osc).get("multisample_reference", {}).get("uuid", b"")) if sample_set(osc) else ""


def has_its_samples(osc, tables):
    if osc.kind != OSC_SAMPLE:
        return True
    source = tables.multisamples.get(sample_uuid(osc))
    return source is not None and bool(source.zones)


def where_a_filter_sits(osc):
    """A cutoff for most of a note, for a recording that can't move one: an envelope at its sustain, or half way if it has
    none. A patch's cutoff is often very low, for an envelope to open, and without this a recording would be all rumble."""
    cutoff = osc.cutoff[0]
    for m in osc.cutoff[1]:
        message = {"adsr": osc.model.get("amp_eg")} if m.source == "amp" else modulator_of(osc.sources, m.source) or {}
        adsr = message.get("adsr") or message.get("analog_adsr")
        if adsr:
            sustain = resolve(adsr.get("sustain_level_percent"), osc.sources, 0.0)[0] / 100
            cutoff += m.amount * (sustain if sustain > 0 else 0.5)
    return cutoff


def filtered_recording(x, loop_at, gain_of):
    """A filter over a recording. An FFT of all of it would take its end as leading back to its start, and low-pass that into
    a click at the loop. So a loop is filtered as the cycle it is, what's before it runs on as far as the loop starts, and
    the one fades into the other just ahead of the loop, leaving a loop that really does come round."""
    def through(y):
        return np.fft.irfft(np.fft.rfft(y) * gain_of(len(y)), len(y))

    room = np.zeros(8192)
    if loop_at is None:
        return through(np.concatenate([x, room]))[:len(x)]
    steady = through(x[loop_at:])
    if loop_at == 0:
        return steady
    lead = through(np.concatenate([x, room]))[:loop_at]
    n = min(loop_at, len(steady), 4096)
    fade = np.linspace(0.0, 1.0, n)
    lead[-n:] = lead[-n:] * (1 - fade) + steady[-n:] * fade
    return np.concatenate([lead, steady])


def plan_sample(osc, tables, zero_note, clock):
    """A multisample's zone for the note 0 V plays, as `READ = SAMPLE`. The set's root key and tuning say what speed it
    plays at for that key, which is what the instrument does with them. A filter that doesn't move is baked in. One that
    does can't be: a recording has no axis to spare, so it's baked where it sits for most of a note."""
    source = tables.multisamples[sample_uuid(osc)]
    key = zero_note + osc.semitones
    zones = sorted(source.zones, key=lambda z: z.top_key)
    if not zones:
        return None
    zone = next((z for z in zones if z.top_key >= key), zones[-1])
    chosen = sample_set(osc)
    start = zone.sample.start_of(chosen.get("sample_start_offset", 0)) if hasattr(zone, "sample") else zone.start
    fixed_pitch = getattr(zone, "fixed_pitch", False)
    speed = 2 ** ((0 if fixed_pitch else (key - zone.root_key) / 12) + (zone.tune_cents + osc.cents) / 1200)
    table = tables.recording(source, zone, start, CHANNELS.get(chosen.get("multisample_reference", {}).get("channel_select"), 0), speed)
    if table is None:
        return None
    frames = table.samples.astype(float) / 32768
    if osc.filter_spec is not None:
        cutoff = where_a_filter_sits(osc) + osc.key_track * (zero_note - 60)

        def gain_of(n):
            return response(*osc.filter_spec, cutoff, osc.resonance, np.maximum(np.fft.rfftfreq(n, 1 / table.rate) * speed, 1.0))

        loop_at = None if table.loop_frame is None else table.loop_frame * table.frame_len
        frames = filtered_recording(frames, loop_at, gain_of)
    written, peak = tables.write(frames.reshape(-1, table.frame_len), sample=True)
    cents = 1200 * math.log2(table.rate * speed / table.frame_len / C4_HZ)
    cents = max(min(cents, 4850), -4850)
    whole = round(cents / 100)
    lines = "EDGE = CLAMP\n" if table.loop_frame is None else f"EDGE = WRAP\nLOOP = {percent_text(frame_percent(table.loop_frame, table.frames))}\n"
    plan = Plan(written, whole, round(cents - whole * 100), 0.0, "SAMPLE", [], peak, f"the sample {ascii_text(source.name)}", fixed_pitch=fixed_pitch)
    plan.extra = lines + f"GRAIN = SYNC {clock}\n"
    return plan


def plan_osc(osc, tables, zero_note, assign, clock=3):
    """A FairWave table and routing for one oscillator. `assign` turns a modulator's key into a FairWave source, or None."""
    if osc.kind == OSC_SAMPLE:
        return plan_sample(osc, tables, zero_note, clock)
    semitones_total = osc.semitones
    note = zero_note + semitones_total
    cycles = osc.sub[3] if osc.sub else 1
    cycle_hz = hz_of(note + osc.cents / 100) / cycles
    moving = {d: [m for m in moves if assign(m.source) and modulator_kind(osc.sources, m.source) != "track" and abs(m.amount) >= MIN_MOVE[d]]
              for d, moves in moves_of(osc).items()}
    cents = semitones_total * 100 + osc.cents + (zero_note - 60) * 100 - 1200 * math.log2(cycles)
    whole = round(cents / 100)
    fine = round(cents - whole * 100)
    morph_kind, morph_base, _ = osc.morph
    slots = []
    if not any(moving.values()):
        # Nothing to bake moves: it stays a wavetable, played by its own position.
        return plan_position(osc, tables, zero_note, cycle_hz, whole, fine, slots, assign)

    scores = Counter()
    for d, moves in moving.items():
        for m in moves:
            scores[assign(m.source)] += abs(m.amount) * WEIGHT[d]
    for m in osc.position[1]:
        if assign(m.source):
            scores[assign(m.source)] += abs(m.amount) * WEIGHT["position"]
    main = scores.most_common(1)[0][0]
    bipolar = main.startswith("LFO")
    moves_low, moves_high = (-1.0, 1.0) if bipolar else (0.0, 1.0)

    def total(moves):
        return sum(m.amount for m in moves if assign(m.source) == main)

    totals = {"cutoff": total(moving["cutoff"]), "morph": total(osc.morph[2]), "blend": total(osc.blend[1]), "position": total(osc.position[1])}
    leading = max(totals, key=lambda d: abs(totals[d]) * WEIGHT[d])
    others = {"cutoff": moving["cutoff"], "morph": osc.morph[2], "blend": osc.blend[1], "position": osc.position[1]}[leading]
    # Baked, the cutoff follows the note exactly: so a key track of less than that is a slot of its own, and the path
    # has to go on past where the modulators take it, for what the keyboard's three octaves either way ask of it.
    t_low, t_high = moves_low, moves_high
    per_octave = 12 * (osc.key_track - 1) if leading == "cutoff" and osc.filter_spec else 0.0
    if totals[leading] and abs(per_octave) > 1:
        reach = min(abs(3 * per_octave), 48) / abs(totals[leading])
        t_low -= reach
        t_high += reach

    frames = []
    for t in np.linspace(t_low, t_high, PATH_FRAMES):
        moved = min(max(t, moves_low), moves_high)
        position = osc.position[0] + moved * totals["position"]
        blend = osc.blend[0] + moved * totals["blend"]
        morph = morph_base + moved * totals["morph"]
        cutoff = osc.cutoff[0] + t * totals["cutoff"] + osc.key_track * (zero_note - 60)
        cycle = cycle_of(tables, osc, position, blend, morph)
        if cycle is None:
            return None
        frames.append(filtered(with_sub(cycle, osc.sub), osc.filter_spec, cutoff, osc.resonance, cycle_hz))
    frames = np.array(frames)
    table, peak = tables.write(downsample(frames, BAKED_LENGTH) if cycles == 1 else frames)
    width = t_high - t_low
    base_position = 100 * (0 - t_low) / width
    slots.append((main, "POS", 100 * (moves_high - moves_low) / width / (2 if bipolar else 1)))

    # What else moves the same things moves along the same path, as near as it can.
    span = totals[leading] * width
    if span:
        for m in others:
            source = assign(m.source)
            if source and source != main and abs(m.amount / span) > 0.01:
                slots.append((source, "POS", 100 * m.amount / span))
        if abs(per_octave) > 1:
            slots.append(("CV 1", "POS", 100 * 5 * per_octave / span))
    return Plan(table, whole, fine, base_position, "CLEAN", slots, peak, f"along {leading}")


def plan_position(osc, tables, zero_note, cycle_hz, whole, fine, slots, assign):
    """The wavetable itself, with what doesn't move baked in. Its position is then a real position."""
    morph_kind, morph_base, _ = osc.morph
    wave = osc.message.get("wave_table_osc", {})
    a = tables.wave(wave.get("wave_table_a_uuid"), wave.get("wave_table_a_load_mode"))
    if a is None:
        return None
    n = len(a)
    if osc.kind == OSC_AB:
        b = tables.wave(wave.get("wave_table_b_uuid"), wave.get("wave_table_b_load_mode"))
        n = max(n, len(b) if b is not None else 1)
    cutoff = osc.cutoff[0] + osc.key_track * (zero_note - 60)
    frames = []
    positions = np.linspace(0, 100, n)
    for p in positions:
        cycle = cycle_of(tables, osc, p, osc.blend[0], morph_base)
        if cycle is None:
            return None
        frames.append(filtered(with_sub(cycle, osc.sub), osc.filter_spec, cutoff, osc.resonance, cycle_hz))
    frames = np.array(frames)
    if not osc.sub and (osc.filter_spec is not None or morph_kind != MORPH_NONE or osc.kind == OSC_AB or wave.get("wave_table_a_load_mode")):
        frames = downsample(frames, BAKED_LENGTH)
    table, peak = tables.write(frames)
    for m in osc.position[1]:
        source = assign(m.source)
        if source and abs(m.amount) >= MIN_MOVE["position"]:
            slots.append((source, "POS", m.amount))
    read = "STEPS" if osc.width < 15 else "CLEAN"
    return Plan(table, whole, fine, osc.position[0], read, slots, peak, "position")


# ---- Envelopes and LFOs ----


def time_text(seconds):
    return f"{max(seconds, 0) * 1000:.3f} MS" if seconds < 1 else f"{seconds:.3f} S"


def as_set(p, lost, default=0.0):
    """A time or a rate as its knob is set. What modulates one isn't in seconds or hertz, it's on the instrument's own
    curve, with intensities up to 17,080: and that curve isn't known here, so it's left out."""
    if not isinstance(p, dict):
        return p if p is not None else default
    if any(number_of(m.get("intensity")) for m in (p.get("modulation_list") or {}).get("modulation", [])):
        lost["what changes its envelope and LFO speeds"] += 1
    return p.get("value", 0.0)


def env_text(n, a, sources, gate, vca, lost):
    """A modwave ADSR as a FairWave envelope. A curve of 10 is exponential, as 100 is here."""
    get = lambda k, d=0.0: resolve(a.get(k), sources, d)[0]  # noqa: E731
    lines = [f"[ENV {n}]", f"GATE = {gate}"]
    delay = as_set(a.get("delay_time_secs"), lost)
    if delay > 0:
        lines.append(f"DELAY = {time_text(delay)}")
    lines.append(f"ATTACK = {time_text(as_set(a.get('attack_time_secs'), lost))}")
    hold = as_set(a.get("hold_time_secs"), lost)
    if hold > 0:
        lines.append(f"HOLD = {time_text(hold)}")
    lines.append(f"DECAY = {time_text(as_set(a.get('decay_time_secs'), lost))}")
    lines.append(f"SUSTAIN = {min(max(get('sustain_level_percent'), 0), 100):.0f}%")
    lines.append(f"RELEASE = {time_text(as_set(a.get('release_time_secs'), lost))}")
    for key, row in (("attack_curve", "A CURVE"), ("decay_curve", "D CURVE"), ("release_curve", "R CURVE")):
        lines.append(f"{row} = {min(max(get(key) * 10, 0), 100):.0f}")
    if resolve(a.get("loop"), sources, False)[0]:
        lines.append("LOOP = GATED")
    if vca:
        lines.append(f"VCA = {vca}")
    return "\n".join(lines) + "\n"


def lfo_hz(lfo, tempo, lost):
    sync = lfo.get("midi_sync", {})
    if isinstance(sync.get("midi_sync_on"), dict) and sync["midi_sync_on"].get("value"):
        duration = sync.get("duration", {}).get("value", 3)
        times = sync.get("times", {}).get("value", 1) or 1
        quarters = NOTE_QUARTERS.get(duration, 1) * times
        return tempo / 60 / quarters
    return as_set(lfo.get("frequency_hz"), lost, 1.0)


def lfo_text(n, lfo, sources, tempo, lost, level=100):
    wave = lfo.get("waveform", {}).get("value", 0) if isinstance(lfo.get("waveform"), dict) else 0
    hz = min(max(lfo_hz(lfo, tempo, lost), 0.01), 105)
    trigger = (lfo.get("trigger") or {}).get("trigger_at_note_on", {})
    synced = trigger.get("value", False) if isinstance(trigger, dict) else False
    lines = [f"[LFO {n}]", f"RATE = {hz:.3f} HZ", f"SHAPE = {LFO_SHAPES.get(wave, 'TRI')}"]
    phase = resolve(lfo.get("start_phase_degrees"), sources, 0.0)[0]
    if phase:
        lines.append(f"PHASE = {phase % 360:.0f}")
    if level != 100:
        lines.append(f"LEVEL = {level}%")
    if synced:
        lines.append("SYNC = GATE 1")
    return "\n".join(lines) + "\n"


# ---- A whole patch ----


SAFE = re.compile(r"[^A-Za-z0-9 _\-+().']")


def file_name(name, taken):
    stem = SAFE.sub("", name).strip() or "Patch"
    stem = stem[:23].strip()
    candidate = stem
    n = 2
    while candidate.lower() in taken:
        candidate = f"{stem[:20]} {n}"
        n += 1
    taken.add(candidate.lower())
    return candidate


def ascii_text(s):
    return s.encode("ascii", "replace").decode().replace("?", "")


def effect_is_on(effect):
    """An effect's own message starts with its `EffectCommon`, whose field 1 is `enable`: its type doesn't matter."""
    try:
        common = next(v for n, w, v in mw.wire_fields(effect.get("data", b"")) if n == 1 and w == 2)
        enable = next(v for n, w, v in mw.wire_fields(common) if n == 1 and w == 2)
        return any(n == 1 and v for n, w, v in mw.wire_fields(enable))
    except (StopIteration, ValueError, IndexError):
        return False


def effect_names(prog):
    return [e.get("name", "") for e in (prog.get("effect_rack") or {}).get("effect", []) if effect_is_on(e)]


def is_bass(info):
    return "bass" in " ".join(info.get("instrument_main_category", [])).lower()


def translate(name, info, programs, macros, tempo, tables, comment_source):
    """A FairWave patch's text from a modwave sound: `programs` a list of (Program, TrackCommon, octave shift)."""
    oscs = []
    lost = Counter()
    silent_layers = 0
    for layer, (prog, common, shift) in enumerate(programs):
        base = 12 * shift + (prog.get("octave", {}).get("value", 0) if isinstance(prog.get("octave"), dict) else 0) * 12
        base += prog.get("transpose_semitones", {}).get("value", 0) if isinstance(prog.get("transpose_semitones"), dict) else 0
        found, model, why = read_layer(prog, common, macros, layer, base)
        lost.update(why)
        if not found:
            silent_layers += 1
        oscs += found
    if not oscs:
        return None, "nothing audible"

    # What gets to be heard: wavetables first, the loudest of them. (Oscillator 1 has to stay if 2 uses it as a modulator.)
    usable = [o for o in oscs if has_its_samples(o, tables)]
    if len(usable) < len(oscs):
        lost["samples that aren't here: see modwave_device.py"] += 1
    if not usable:
        return None, "needs the modwave's own samples"
    chosen = pick_two(usable)
    loudest = max(chosen, key=lambda o: o.level)
    # A bass sits with its loudest oscillator at C2, as the library's others do, on whichever key plays that. Anything
    # else plays as its keys do: 0 V is middle C, which is C4 with no `TUNE` anywhere in FairWave.
    zero_note = min(max(36 - loudest.semitones, 24), 84) if is_bass(info) else 60
    effects = sorted({e for prog, _, _ in programs for e in effect_names(prog)})
    for o in usable:
        if o not in chosen:
            lost[f"layer {'AB'[o.layer]} oscillator {o.index + 1}"] += 1

    sources = chosen[0].sources
    # Envelopes: the amp's own is ENV 1. Which other envelope is ENV 2 goes by what it does; the rest are treated as it.
    scores = Counter()
    for o in chosen:
        for key, value in source_scores(o).items():
            scores[key] += value
        for m in o.pitch_moves:
            scores[m.source] += abs(m.amount) * WEIGHT["pitch"]
        for m in o.level_moves:
            scores[m.source] += abs(m.amount) * WEIGHT["level"]
        if o.morph[0] in CROSS_MORPHS:
            for m in o.morph[2]:
                scores[m.source] += abs(m.amount) * WEIGHT["morph"]
    envs = [k for k, _ in scores.most_common() if modulator_kind(sources, k) == "env" and k != "amp"]
    # (a sample takes an LFO to restart it)
    has_sample = any(o.kind == OSC_SAMPLE for o in chosen)
    lfos = [k for k, _ in scores.most_common() if modulator_kind(sources, k) == "lfo"][:2 if has_sample else 3]
    env2 = envs[0] if envs else None
    for k, _ in scores.most_common():
        if modulator_kind(sources, k) == "lfo" and k not in lfos:
            lost["an LFO past the three here"] += 1

    def assign(key):
        if key == "wheel":
            return "CV 2"
        if key == "amp":
            return "ENV 1"
        kind = modulator_kind(sources, key)
        if kind == "env":
            return "ENV 2" if env2 else None
        if kind == "lfo" and key in lfos:
            return f"LFO {lfos.index(key) + 1}"
        return None

    plans = []
    for o in chosen:
        plan = plan_osc(o, tables, zero_note, assign)
        if plan is None:
            return None, "a wavetable I don't have"
        plans.append(plan)

    voice = programs[chosen[0].layer][0].get("voice_assignment_settings") or {}
    unison = (voice.get("num_unison_voices", {}).get("value", 1), voice.get("unison_detune_cents", {}).get("value", 0.0))
    return write_patch(name, info, chosen, plans, assign, env2, lfos, sources, tempo, lost, comment_source, silent_layers, zero_note, effects, unison), None


def pick_two(oscs):
    """At most two oscillators: one that modulates another has to stay with it, if that one's among the loud ones."""
    by_loud = sorted(oscs, key=lambda o: -o.level)
    for o in oscs:
        if o.index == 1 and o.morph[0] in CROSS_MORPHS and o.level >= by_loud[0].level / 2:
            partner = next((p for p in oscs if p.layer == o.layer and p.index == 0), None)
            if partner:
                return [partner, o]
    return sorted(by_loud[:2], key=lambda o: (o.layer, o.index))


def limit_of(dest):
    return 195.0 if dest.startswith("PITCH") else 400.0


def clamp_cents(x):
    return int(max(-50, min(50, round(x))))


def pct(x):
    """To the half percent a slot steps by."""
    return f"{round(x * 2) / 2:g}%"


def note_name(n):
    return "C C# D D# E F F# G G# A A# B".split()[n % 12] + str(n // 12 - 1)


def write_patch(name, info, chosen, plans, assign, env2, lfos, sources, tempo, lost, comment_source, silent_layers, zero_note, effects, unison):
    title = ascii_text(name).upper().strip()[:16].strip() or "MODWAVE"
    category = next((c for c in info.get("instrument_main_category", []) if c and c != "None"), "")
    about = ascii_text(f"{category.upper() or 'MODWAVE'} FROM MODWAVE. GATE 1, CV 1")[:34]
    notes = [f"From the modwave's {ascii_text(name)}" + (f" by {ascii_text(info['author'])}" if info.get("author") else "") + f": {comment_source}.",
             f"0 V plays what its {note_name(zero_note)} key plays."]
    sections = []
    slots = [("CV 1", f"PITCH {n}", 100.0) for n in range(1, len(chosen) + 1)]

    balance_sum = sum(o.level * p.peak for o, p in zip(chosen, plans)) or 1.0
    for n, (o, p) in enumerate(zip(chosen, plans), start=1):
        sections.append(f"[OSC {n}]\nTABLE = {p.table}\nREAD = {p.read}\nTUNE = {p.tune}\n" + (f"FINE = {p.fine}\n" if p.fine else "")
                        + f"POS = {min(max(p.position, 0), 100):.1f}%\n" + p.extra)
        for source, dest, amount in p.slots:
            slots.append((source, f"POS {n}", amount))
        for m in o.pitch_moves:
            source = assign(m.source)
            if source:
                slots.append((source, f"PITCH {n}", m.amount / 60))
        what = "its wavetable" if p.note == "position" else p.note if p.read == "SAMPLE" else "a table made " + p.note
        notes.append(f"Oscillator {n} is {'AB'[o.layer]}'s {o.index + 1}, {what}.")
        if p.fixed_pitch:
            notes.append(f"On a modwave oscillator {n} plays at one pitch on every key. It does at 0 V here, and CV 1 tunes it.")
    voices, detune = unison
    if len(chosen) == 1:
        # One oscillator, playing in unison: the second is its other half. If not, it's silent.
        if voices > 1 and detune > 0:
            half = detune / 2
            sections[0] = sections[0].replace(f"TUNE = {plans[0].tune}\n", f"TUNE = {plans[0].tune}\nFINE = {clamp_cents(plans[0].fine - half)}\n", 1) if not plans[0].fine else sections[0]
            sections.append(f"[OSC 2]\nTABLE = {plans[0].table}\nREAD = {plans[0].read}\nTUNE = {plans[0].tune}\nFINE = {clamp_cents(plans[0].fine + half)}\n"
                            f"POS = {min(max(plans[0].position, 0), 100):.1f}%\n")
            slots.append(("CV 1", "PITCH 2", 100.0))
            for source, dest, amount in plans[0].slots:
                slots.append((source, "POS 2", amount))
            notes.append(f"Oscillator 2 is the other half of its {voices} unison voices.")
        else:
            sections.append(f"[OSC 2]\nTABLE = {plans[0].table}\nTUNE = {plans[0].tune}\nPOS = {plans[0].position:.1f}%\nLEVEL = 0%\n")
    elif voices > 1:
        lost[f"{voices} unison voices"] += 1

    amp = chosen[0].model.get("amp_eg", {})
    sections.append(env_text(1, amp, sources, "GATE 1", "BOTH", lost))
    if any(o.kind == OSC_SAMPLE for o in chosen):
        sections.append("[LFO 3]\nRATE = 0.01 HZ\nSHAPE = SAW UP\nSYNC = GATE 1\n")

    # Cross modulation, for what oscillator 2 does with oscillator 1.
    second = chosen[-1]
    cross = None
    if len(chosen) == 2 and second.index == 1 and second.morph[0] in CROSS_MORPHS and chosen[0].index == 0 and chosen[0].layer == second.layer:
        cross = CROSS_MORPHS[second.morph[0]]
        sections.append(f"[CROSS MOD]\nMODE = {cross}\nFROM = OSC 1\nDEPTH = {min(max(second.morph[1], 0), 100):.1f}%\n")
        for m in second.morph[2]:
            source = assign(m.source)
            if source:
                slots.append((source, "X DEPTH", m.amount))

    for o, n in zip(chosen, (1, 2)):
        for m in o.level_moves:
            source = assign(m.source)
            if source and source != "ENV 1":
                slots.append((source, f"LEVEL {n}", m.amount))

    # Twelve slots: the keyboard's first, then by how much each does. Two modulators that became one source are one slot.
    head = [s for s in slots if s[:2] in (("CV 1", "PITCH 1"), ("CV 1", "PITCH 2"))]
    merged = Counter()
    for a, b, c in slots:
        if (a, b, c) not in head:
            merged[(a, b)] += c
    rest = sorted(((a, b, c) for (a, b), c in merged.items()), key=lambda s: -abs(s[2]))
    room = 12 - len(head)
    if len(rest) > room:
        lost["some modulation routings"] += 1
        rest = rest[:room]
    if not any(s[0] == "CV 2" for s in rest):
        for n in range(1, len(chosen) + 1):
            if len(rest) < room:
                rest.append(("CV 2", f"POS {n}", 25.0))
    kept = [(a, b, max(min(c, limit_of(b)), -limit_of(b))) for a, b, c in head + rest if abs(round(c * 2) / 2) > 0]
    lines = [f"{a} > {b} = {pct(c)}" for a, b, c in kept]
    # An envelope or LFO no routing uses in the end is left out, and FairWave's are kept for what's left.
    if env2 and any(a == "ENV 2" for a, _, _ in kept):
        message = modulator_of(sources, env2)
        sections.append(env_text(2, message.get("adsr") or message.get("analog_adsr") or {}, sources, "GATE 1", None, lost))
    for i, key in enumerate(lfos):
        if any(a == f"LFO {i + 1}" for a, _, _ in kept):
            sections.append(lfo_text(i + 1, modulator_of(sources, key)["lfo"], sources, tempo, lost))
    sections.append("[ROUTING]\n" + "\n".join(lines) + "\n")

    weight1 = chosen[0].level * plans[0].peak
    weight2 = (chosen[1].level * plans[1].peak) if len(chosen) > 1 else 0.0
    total = weight1 + weight2 or 1.0
    balance = 100 * weight2 / total
    if len(chosen) > 1 and cross and chosen[0].level <= 0.01:
        balance = 100.0
    sections.append(f"[MIXER]\nOUT 0 = MIX\nOUT 1 = MIX\nBALANCE = {balance:.1f}%\n")

    if lost:
        notes.append("Not carried over: " + ", ".join(sorted(lost)) + ".")
    if effects:
        notes.append("Its effects, which FairWave hasn't got: " + ", ".join(effects) + ".")
    head = f"FAIRWAVE PATCH 1\nNAME  = {title}\nABOUT = {about}\n\n" + "".join(f"# {ascii_text(line)}\n" for line in notes)
    return head + "\n".join(sections)


# ---- Files ----


def sounds_in(path):
    """Each sound in a file: (name, info, programs, macros, tempo)."""
    lib = mw.Library()
    mw.load_file(path, lib)
    for name, (perf, info) in lib.performances.items():
        macros = {400 + i: (m.get("value_signed_percent", {}).get("value", 0.0)) / 100 for i, m in enumerate(perf.get("assignable_macro_modifier", []))}
        tempo = perf.get("tempo", {}).get("value", 120.0) if isinstance(perf.get("tempo"), dict) else 120.0
        programs = []
        for t in perf.get("track", []):
            inst = t.get("instrument_track")
            if inst and "Program" in inst:
                shift = inst.get("octave_shift", {}).get("value", 0) if isinstance(inst.get("octave_shift"), dict) else 0
                programs.append((inst["Program"], inst.get("common", {}), shift))
        yield name, info, programs, macros, tempo or 120.0
    for name, (prog, info) in lib.programs.items():
        yield name, info, [(prog, {}, 0)], {}, 120.0


def pack_name(text, taken):
    """A short name for a folder of patches, from a bundle's or folder's: a path has to fit in 39 characters."""
    text = re.sub(r"(?i)korg modwave\s*-?\s*|\(by [^)]*\)|for modwave|bundle|\.mw\w+$", "", text)
    text = re.sub(r"(?i)^id[- ]?", "", text)
    base = re.sub(r"[^A-Za-z0-9]", "", text).upper()[:8] or "PACK"
    name, n = base, 2
    while name in taken:
        name = f"{base[:7]}{n}"
        n += 1
    taken.add(name)
    return name


def is_database_object(f):
    """A file in the instrument's database, in `Data/XX/` by its uuid: these have no suffix to go by."""
    return f.is_file() and not f.suffix and f.parent.parent.name == "Data"


def packs_in(root):
    """Everything under a folder: each bundle a pack, and loose files by the folder they're in. A backup goes last, so a
    sound it shares with a bundle stays with its bundle."""
    root = Path(root)
    taken = set()
    packs = []
    loose = {}
    backups = []
    for f in sorted(root.rglob("*")):
        suffix = f.suffix.lower()
        if suffix == ".mwbundle":
            packs.append([pack_name(f.stem, taken), str(f)])
        elif suffix in (".mwperf", ".mwprog"):
            loose.setdefault(f.parent, []).append(str(f))
        elif suffix == ".mwbackup":
            backups.append(str(f))
    for folder, files in sorted(loose.items()):
        packs.append([pack_name(folder.name if folder != root else "LOOSE", taken), *files])
    for f in backups:
        packs.append([pack_name("FACTORY", taken), f])
    # The instrument's own library, as `modwave_device.py fetch` copies it: only what isn't anywhere above ends up here.
    if (root / "database" / "Data").is_dir():
        packs.append([pack_name("ONBOARD", taken), *(str(f) for f in sorted((root / "database" / "Data").rglob("*")) if is_database_object(f))])
    return packs


def main():
    parser = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    parser.add_argument("--auto", help="a folder of modwave files: its wavetables, samples and patches, sorted into packs")
    parser.add_argument("--tables", nargs="+", default=[], help="files or folders holding wavetables: a backup, bundles, .mwwavetable")
    parser.add_argument("--samples", nargs="+", default=[], help="folders with .korgmultisample files beside their WAVs")
    parser.add_argument("--factory", help="a folder of the instrument's sample banks, from modwave_device.py fetch")
    parser.add_argument("--pack", action="append", nargs="+", metavar=("NAME", "PATH"), default=[],
                        help="a folder name for the patches, then files or folders of .mwperf, .mwprog, .mwbundle")
    parser.add_argument("--out", default=str(HERE.parent / "library" / "FAIRWAVE" / "MODWAVE"), help="its last folder has to be called MODWAVE: patches name their tables from there")
    args = parser.parse_args()
    if args.auto:
        args.tables.append(args.auto)
        args.samples.append(args.auto)
        args.pack += packs_in(args.auto)
        if not args.factory and (Path(args.auto) / "factory").is_dir():
            args.factory = str(Path(args.auto) / "factory")
    if not args.pack or not args.tables:
        parser.error("say where the patches and wavetables are: --auto, or --pack and --tables")

    library = mw.Library()
    for path in args.tables:
        p = Path(path)
        for f in sorted(p.rglob("*")) if p.is_dir() else [p]:
            if f.suffix.lower() in (".mwbackup", ".mwbundle", ".mwwavetable") or is_database_object(f):
                mw.load_file(f, library)
    print(f"{len(library.wavetables)} wavetables")
    multisamples = {}
    for path in args.samples:
        for f in sorted(Path(path).rglob("*.korgmultisample")):
            try:
                item = dict(mw.read_container(f.read_bytes()))["MultiSample"]
            except (KeyError, ValueError):
                continue
            for n, w, v in mw.wire_fields(item):
                # (field 7 is its uuid. Field 1 is its name, and can be 16 characters long, so only 7 will do)
                if n == 7 and w == 2 and len(v) == 16:
                    multisamples.setdefault(mw.uuid_text(v), FileMultisample(f))
    print(f"{len(multisamples)} multisamples from files")
    if args.factory:
        for u, m in read_banks(args.factory).items():
            multisamples.setdefault(u, m)
        print(f"{len(multisamples)} with the instrument's banks")
    tables = Tables(args.out, library, multisamples)
    out = Path(args.out)
    made = Counter()
    failed = Counter()
    report = []
    seen = set()
    for pack in args.pack:
        name, paths = pack[0], pack[1:]
        taken = set()
        in_folder = 0
        part = 1
        folder = out / name
        files = []
        for path in paths:
            p = Path(path)
            files += sorted(f for f in p.rglob("*") if f.suffix.lower() in (".mwperf", ".mwprog", ".mwbundle", ".mwbackup")) if p.is_dir() else [p]
        print(f"{name}: {len(files)} files", flush=True)
        for f in files:
            for sound, info, programs, macros, tempo in sounds_in(f):
                identity = info.get("uuid") or sound
                if identity in seen:
                    continue
                seen.add(identity)
                text, why = translate(sound, info, programs, macros, tempo, tables, f.name if f.suffix else "the instrument's own library")
                if text is None:
                    failed[why] += 1
                    report.append(f"{name}\t{sound}\t{why}")
                    continue
                # (the Browser lists 256 to a folder, one of which is `..`)
                if in_folder == FOLDER_ENTRIES:
                    part += 1
                    in_folder = 0
                    folder = out / f"{name[:7]}{part}"
                folder.mkdir(parents=True, exist_ok=True)
                stem = file_name(sound, taken)
                (folder / f"{stem}.fwp").write_text(text, encoding="ascii", newline="\n")
                in_folder += 1
                made[name] += 1
    print("made", dict(made), f"{sum(made.values())} in all")
    print("skipped", dict(failed))
    print(f"{len(tables.written)} tables, {sum(tables.written.values()) // (1024 * 1024)} MB")
    out.mkdir(parents=True, exist_ok=True)
    (out / "SKIPPED.TXT").write_text("\n".join(report) + "\n", encoding="utf-8")


if __name__ == "__main__":
    sys.exit(main())
