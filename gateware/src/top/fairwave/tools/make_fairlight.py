"""Makes a table and a patch from every Fairlight set in a folder of multisamples.

    python src/top/fairwave/tools/make_fairlight.py src/top/fairwave/ExampleTables/All

A Fairlight CMI IIx voice is 16384 8-bit samples at 30.2 kHz: these are real recordings, not single cycles, so
each plays with `READ = SAMPLE`, its attack once and then its loop, the way the instrument played them. What
each patch does around that follows from what the set is called (`FAMILIES`). Each set's pitch is measured,
since its metadata says what key it was mapped to and not what it sounds: most turn out to be A sharp at some
octave, because the CMI's segments are 128 samples at 30.2 kHz, which is 236 Hz. 0 V is then tuned to a C.
"""

import re
import sys
from dataclasses import dataclass, replace
from pathlib import Path

import numpy as np

HERE = Path(__file__).resolve().parent
sys.path.insert(0, str(HERE))

from korg import read_multisample  # noqa: E402
from samples import (concatenated, frame_percent, hz_of, midi_of, percent_text, pitch_of, read_audio, to_table,  # noqa: E402
                     tune_of, write_table)

OUT = HERE.parent / "library" / "FAIRWAVE" / "FAIRLIGHT"
SETS = re.compile(r"^(?:Fairlight|Fairlgiht|Faright|Farilgiht|Farilight|Faurlight)\s*(.+?)\s*$", re.I)
A_SHARP = 58.0


@dataclass
class Family:
    pattern: str
    kind: str
    about: str
    highest: int        # the highest C 0 V is taken to, as a MIDI note
    lowest: int = 36
    attack: str = "1 MS"
    release: str = "120 MS"
    decay: str = "1 S"
    sustain: int = 100
    detune: int = 7     # osc 2's cents from osc 1, and the balance
    balance: int = 50
    sub: bool = False
    vibrato: bool = False
    level: int = 100


# In order: the first to match a set's name is its family.
FAMILIES = [
    Family(r"drum|kit", "kit", "DRUMS. CV 2 PICKS THE HIT", 60, attack="0", release="60 MS", decay="420 MS", sustain=0),
    Family(r"bells", "kit", "BELLS. CV 2 PICKS WHICH", 72, attack="0", release="600 MS"),
    Family(r"orch5", "stab", "THE ORCHESTRA HIT. GATE 1, CV 1", 60, attack="0", release="240 MS", detune=5),
    Family(r"dum\b|mallet", "perc", "STRUCK AND DECAYING", 60, attack="0", release="200 MS"),
    Family(r"polymoog", "strings", "THE POLYMOOG ON THE CMI", 60, attack="40 MS", release="500 MS", detune=9),
    Family(r"bass vocal", "vox", "THE LOW VOICE", 48, attack="60 MS", release="300 MS", vibrato=True),
    Family(r"dbl bass", "bass", "UPRIGHT BASS", 36, release="120 MS", detune=0, sub=True),
    Family(r"bass|\bwow\b|\bzow\b", "bass", "BASS, WITH A SUB UNDER IT", 36, release="90 MS", detune=0, sub=True),
    Family(r"gtr|guitar|strat|strum|fuzz|dist|flange|wail", "guitar", "PLUCKED, THEN LET RING", 60, release="220 MS", detune=6),
    Family(r"cello|low string|bigstring", "strings", "LOW STRINGS", 48, attack="90 MS", release="450 MS", detune=9),
    Family(r"string|vln|bow|pizz|orch|shimmer", "strings", "STRINGS", 72, attack="70 MS", release="500 MS", detune=9),
    Family(r"trumpet|trumpit|brass|tromb|horn", "brass", "BRASS", 72, attack="25 MS", release="160 MS", detune=6, vibrato=True),
    Family(r"whist|breath", "lead", "A THIN LEAD", 84, attack="25 MS", release="180 MS", detune=3, vibrato=True),
    Family(r"piano", "keys", "THE CMI'S PIANO", 60, release="400 MS", detune=4),
    Family(r"stab|triad|tramchlo|sfzan|bucchi", "stab", "A STAB", 60, attack="0", release="240 MS", detune=5),
    Family(r"", "vox", "THE CMI'S VOICES", 72, attack="110 MS", release="500 MS", detune=8, vibrato=True),
]


def family_of(name):
    return next(f for f in FAMILIES if re.search(f.pattern, name, re.I))


def natural_pitch(x, rate, start, end, loop_len, family):
    """A recording's pitch at its own speed, or None if it hasn't one that can be trusted. An unsure answer
    is taken if it's the A sharp that most of them are, or if a sub is to go under it (a wrong one is better
    than none there), but a high one is more likely an overtone."""
    hz, sure = pitch_of(x[start:end + 1], rate)
    if hz is None:
        return None
    off_a_sharp = abs((midi_of(hz) - A_SHARP + 6) % 12 - 6)
    trusted = sure >= 0.7 or (hz < 600 and (off_a_sharp < 0.6 or family.sub))
    if not trusted:
        return None
    hz = checked_against_spectrum(x[start:end + 1], rate, hz)
    if loop_len:
        # A loop holds whole cycles, so its length says more exactly what the pitch is.
        cycles = max(1, round(loop_len * hz / rate))
        return cycles * rate / loop_len
    return hz


def checked_against_spectrum(x, rate, hz):
    """A voice's formant can fool the difference function: if its lowest strong partial isn't related to what that
    said, by a whole number either way, the partial is more likely right. (If it is, the partial may only be an
    overtone, the fundamental being quiet, as on a distorted guitar, and the first answer stands.)"""
    n = min(len(x), 16384)
    window = x[:n] * np.hanning(n)
    power = np.abs(np.fft.rfft(window))
    freq = np.fft.rfftfreq(n, 1 / rate)
    band = np.nonzero((freq > 30) & (freq < 2500))[0]
    if len(band) == 0:
        return hz
    top = power[band].max()
    lowest = next((freq[i] for i in band if power[i] > 0.3 * top and power[i] >= power[i - 1] and power[i] >= power[i + 1]), None)
    if lowest is None:
        return hz
    ratio = max(hz, lowest) / min(hz, lowest)
    return hz if abs(1200 * np.log2(ratio / round(ratio))) < 70 else float(lowest)


def target_for(natural, root_key, family, table):
    """The C at 0 V. The set's metadata says which key plays a recording at its own speed, which says what range
    its maker meant for it: so where a keyboard's middle C would have landed, within the family's range, and
    not so far from its own speed that the tuning runs out."""
    if natural is None:
        return None
    meant = midi_of(natural) + 60 - root_key
    target = max(family.lowest, min(family.highest, 60 + 12 * round((meant - 60) / 12)))
    while tune_of(table, natural, hz_of(target))[0] < -36:
        target += 12
    return target


def short_names(names):
    """An 8.3 name for each, unique on a FAT drive."""
    seen, out = set(), {}
    for name in names:
        base = re.sub(r"[^A-Z0-9]", "", name.upper())[:8] or "SAMPLE"
        short, n = base, 1
        while short in seen:
            n += 1
            short = f"{base[:7]}{n}"
        seen.add(short)
        out[name] = short
    return out


def osc_text(n, table, tune, fine, spec, grain=True, level=None):
    lines = [f"[OSC {n}]", f"TABLE = {table}", "READ = SAMPLE", f"TUNE = {tune}"]
    if fine:
        lines.append(f"FINE = {fine}")
    lines.append("POS = 0%")
    if spec.loop_frame is None:
        lines.append("EDGE = CLAMP")
    else:
        lines += ["EDGE = WRAP", f"LOOP = {percent_text(frame_percent(spec.loop_frame, spec.frames))}"]
    if grain:
        lines.append("GRAIN = SYNC 1")
    if level is not None:
        lines.append(f"LEVEL = {level}%")
    return "\n".join(lines) + "\n"


def patch_text(title, about, comment, table_name, table, tune, fine, family, zones_text=""):
    rows = []
    sections = []
    second = tune * 100 + fine + family.detune
    tune2, fine2 = round(second / 100), second - round(second / 100) * 100
    sections.append(osc_text(1, table_name, tune, fine, table))
    if family.sub:
        sections.append("[OSC 2]\nTABLE = TABLES/SUBDRV.WAV\nTUNE = -24\nPOS = 0%\n")
    else:
        sections.append(osc_text(2, table_name, tune2, fine2, table))
    # (a recording that plays once has its own attack, which mustn't be faded away)
    attack = family.attack if table.loop_frame is not None or family.attack == "0" else "2 MS"
    sections.append(
        f"[ENV 1]\nATTACK = {attack}\nDECAY = {family.decay}\nSUSTAIN = {family.sustain}%\n"
        f"RELEASE = {family.release}\nD CURVE = 40\nVCA = BOTH\n")
    sections.append("[LFO 1]\nRATE = 0.01 HZ\nSHAPE = SAW UP\nSYNC = GATE 1\n")
    rows = ["CV 1 > PITCH 1 = 100%", "CV 1 > PITCH 2 = 100%"]
    if family.kind == "kit":
        rows += ["CV 2 > POS 1 = 100%", "CV 2 > POS 2 = 100%"]
    else:
        rows += ["CV 2 > POS 1 = 12%"] + ([] if family.sub else ["CV 2 > POS 2 = 12%"])
    if family.vibrato:
        sections.append("[LFO 2]\nRATE = 5.1 HZ\nSHAPE = SINE\nLEVEL = 30%\n")
        rows += ["LFO 2 > PITCH 1 = 0.5%", "LFO 2 > PITCH 2 = 0.5%"]
    sections.append("[ROUTING]\n" + "\n".join(rows) + "\n")
    balance = 26 if family.sub else family.balance
    sections.append(f"[MIXER]\nOUT 0 = MIX\nOUT 1 = MIX\nBALANCE = {balance}%\n")
    head = f"FAIRWAVE PATCH 1\nNAME  = {title}\nABOUT = {about}\n\n"
    notes = "".join(f"# {line}\n" for line in comment + zones_text.splitlines())
    return head + notes + "\n".join(sections)


def main():
    root = Path(sys.argv[1]) if len(sys.argv) > 1 else HERE.parent / "ExampleTables" / "All"
    sets = sorted(p for p in root.glob("*.korgmultisample") if SETS.match(p.stem))
    names = [SETS.match(p.stem)[1] for p in sets]
    # Two sets in a folder that doesn't tell case apart would be one file.
    titled = {}
    for p, name in zip(sets, names):
        key = name.lower()
        while key in titled:
            name += " B"
            key = name.lower()
        titled[key] = (p, name)
    shorts = short_names([name for _, name in titled.values()])
    (OUT / "WAVES").mkdir(parents=True, exist_ok=True)
    report = []
    for p, name in titled.values():
        family = family_of(name)
        multi = read_multisample(p)
        zones = multi.zones
        short = shorts[name]
        zones_text = ""
        if family.kind == "kit" or len(zones) > 1:
            zones = sorted(zones, key=lambda z: z.top_key)
            parts = []
            labels = []
            for z in zones:
                x, rate = read_audio(root / z.path)
                parts.append((x[z.start:z.end + 1], rate))
                labels.append(Path(z.path).stem)
            table = concatenated(parts)
            natural, target = None, None
            semitones, fine = tune_of(table, 1.0, 1.0)
            where = [f"{percent_text(frame_percent(s, table.frames))} {label}" for s, label in zip(table.starts, labels)]
            zones_text = "POS or CV 2 picks the hit, 5 V reaching the last. They're at: " + ", ".join(where[:6])
            if len(where) > 6:
                zones_text += " and so on"
            pitch_note = f"{len(zones)} recordings"
        else:
            z = zones[0]
            x, rate = read_audio(root / z.path)
            loop_len = 0 if z.one_shot or z.loop_start >= z.end else z.end - z.loop_start + 1
            natural = natural_pitch(x, rate, z.start, z.end, loop_len, family)
            table, _ = to_table(x, rate, z.start, z.loop_start, z.end, z.one_shot)
            target = target_for(natural, z.root_key, family, table)
            if natural is None and family.sub:
                family = replace(family, sub=False, detune=4)
            if natural is None:
                semitones, fine = tune_of(table, 1.0, 1.0)
                pitch_note = "no steady pitch: at its own speed"
            else:
                semitones, fine = tune_of(table, natural, hz_of(target))
                pitch_note = f"{natural:.1f} Hz, tuned so 0 V is {note_name(target)}"
        table_name = f"WAVES/{short}.WAV"
        write_table(OUT / "WAVES" / f"{short}.WAV", table)
        assert -48 <= semitones <= 48, f"{name}: {semitones} semitones"
        title = f"CMI {name}".upper()[:16].strip()
        comment = [f"Fairlight CMI: {multi.name or name}. {pitch_note}."]
        if table.loop_frame is None:
            comment.append("Plays once from the start on each gate: GRAIN = SYNC 1, with LFO 1 as slow as it goes.")
        else:
            comment.append("Plays its attack, then its loop, restarting on each gate: GRAIN = SYNC 1.")
        if family.kind != "kit":
            comment.append("CV 2 moves where it starts.")
        about = family.about[:34]
        text = patch_text(title, about, comment, table_name, table, semitones, fine, family, zones_text)
        (OUT / f"{safe_file_name(name)}.fwp").write_text(text, encoding="ascii", newline="\n")
        report.append((name, family.kind, natural, target, semitones, fine, table.frames, table.frame_len, table.loop_frame))
    for r in report:
        print(f"{r[0]:22} {r[1]:8} natural {r[2] or 0:7.1f} 0V {note_name(r[3]) if r[3] else '-':4} tune {r[4]:+3} {r[5]:+3} "
              f"{r[6]:4} x {r[7]:4} loop {r[8]}")
    print(len(report), "patches")


NOTE_NAMES = "C C# D D# E F F# G G# A A# B".split()


def note_name(m):
    return f"{NOTE_NAMES[m % 12]}{m // 12 - 1}"


def safe_file_name(name):
    return re.sub(r'[<>:"/\\|?*]', "-", name)


if __name__ == "__main__":
    sys.exit(main())
