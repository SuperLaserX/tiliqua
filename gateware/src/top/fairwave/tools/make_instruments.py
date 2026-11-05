"""Makes the sampled instruments and grain patches: tables in `library/FAIRWAVE/SAMPLES`, patches beside them.

    python src/top/fairwave/tools/make_instruments.py src/top/fairwave/ExampleTables/All

Each is one zone of a multisample, played by `READ = SAMPLE`, so all its notes are that one recording at different
speeds. Its pitch is measured, as in `make_fairlight.py`.
"""

import glob
import sys
from dataclasses import dataclass, field
from pathlib import Path

HERE = Path(__file__).resolve().parent
sys.path.insert(0, str(HERE))

from korg import read_multisample  # noqa: E402
from make_fairlight import Family, osc_text, patch_text  # noqa: E402
from samples import flatten, frame_percent, hz_of, midi_of, percent_text, pitch_of, read_audio, to_table, tune_of, write_table  # noqa: E402

LIB = HERE.parent / "library" / "FAIRWAVE"
OUT = LIB / "SAMPLES"


@dataclass
class Source:
    """A recording as a table: which set, which of its zones, and how long to keep."""
    short: str
    set_name: str
    near: int = 60          # the zone with its root nearest this
    seconds: float = 0      # a one-shot cut to this long, faded out, if not 0
    # (A set's loop is thrown away for `one_shot`, for a table whose every moment a grain can read, and those have
    # their level evened out, for that.)
    one_shot: bool = False


@dataclass
class Instrument:
    folder: str
    file: str
    title: str
    about: str
    source: str
    c: int                  # the C at 0 V, as a MIDI note
    family: Family
    notes: list = field(default_factory=list)


def _f(kind, attack, release, **kw):
    return Family("", kind, "", 127, attack=attack, release=release, **kw)


SOURCES = {s.short: s for s in [
    Source("BOWS", "Korg Karma-SymphonicBows", 60),
    Source("LEGATO", "Korg Karma-LegatoStrings", 60),
    Source("QUARTET", "Korg Karma-String Quartet", 60),
    Source("DEEPSTR", "D110-DeepStrings", 48),
    Source("PIZZ", "D110-Pizzicato", 60),
    Source("CONTRA", "D110-Contrabass", 48),
    Source("CELLO", "D110-Cello 1", 48),
    Source("FRHORN", "D110-Fr Horn", 60),
    Source("BRASS", "D110-Brass 1", 60),
    Source("HORNS", "Akai AX73 Horns", 60),
    Source("TIMPANI", "D110-Timpani", 48),
    Source("ORCHHIT", "D110-Orche Hit", 60),
    Source("AKAIORCH", "Akai AX73 Orch 2", 60),
    Source("MEN", "D110-Voxy Men", 60),
    Source("WOMEN", "D110-Voxy Women", 60),
    Source("VOX", "Akai AX73 Vox", 60),
    Source("CHURCH", "Akai AX73 Church Organ", 60),
    Source("PIPE", "D110-PipeOrgan1", 60),
    Source("FLUTE", "D110-Flute 1", 72),
    Source("HARP", "D110-Harp 1", 60),
    Source("ATMOLONG", "D110-Atmospherelong", 60, one_shot=True),
    Source("WARMPAD", "D110-Warm Pad", 60, one_shot=True),
    Source("STEAM", "D110-Steam Pad", 60, one_shot=True),
    Source("HOLLOW", "D110-Hollow Pad", 60),
    Source("DREAM", "Korg Karma-DreamSynthMOSS", 60, one_shot=True),
    Source("OBER", "Korg Karma-OberStringPadMOSS", 60),
    Source("SPACEWAR", "D110-Space War", 60),
    Source("REZSWEEP", "D110-Reso Sweep", 60),
    Source("GUITAR1", "D110-Guitar 1", 60),
    Source("GUITAR2", "D110-Guitar 2", 60),
    Source("ELECGTR1", "D110-Elec Gtr 1", 60),
    Source("ELECGTR2", "D110-Elec Gtr 2", 60),
    Source("EGMUTE", "D110-EG Mute", 60),
    Source("PICKGTR", "D110-PickGuitar", 60),
    Source("OVERDRV", "D110-Overdrive", 60),
    Source("KOTO", "D110-Koto", 60),
    Source("DROPHIT", "D110-Drop Hit", 60),
    Source("ETHNOHIT", "D110-Ethno Hit", 60),
]}

INSTRUMENTS = [
    # Strings and the orchestra.
    Instrument("ORCHESTRA", "Symphonic Strings", "SYMPHONIC STR", "A STRING SECTION. GATE 1, CV 1", "BOWS", 60, _f("strings", "120 MS", "550 MS", detune=8)),
    Instrument("ORCHESTRA", "Legato Strings", "LEGATO STRINGS", "SLOW BOWS. GATE 1, CV 1", "LEGATO", 60, _f("strings", "260 MS", "800 MS", detune=7)),
    Instrument("ORCHESTRA", "String Quartet", "STRING QUARTET", "FOUR PLAYERS. GATE 1, CV 1", "QUARTET", 60, _f("strings", "60 MS", "350 MS", detune=4, vibrato=True)),
    Instrument("ORCHESTRA", "Deep Strings", "DEEP STRINGS", "CELLOS AND BASSES. GATE 1, CV 1", "DEEPSTR", 48, _f("strings", "200 MS", "700 MS", detune=8)),
    Instrument("ORCHESTRA", "Pizzicato", "PIZZICATO", "PLUCKED STRINGS. GATE 1, CV 1", "PIZZ", 60, _f("strings", "0", "160 MS", detune=4)),
    Instrument("ORCHESTRA", "Contrabass", "CONTRABASS", "ONE BOWED BASS. GATE 1, CV 1", "CONTRA", 36, _f("strings", "90 MS", "300 MS", detune=3, vibrato=True)),
    Instrument("ORCHESTRA", "Cello", "CELLO", "ONE CELLO. GATE 1, CV 1", "CELLO", 48, _f("strings", "70 MS", "300 MS", detune=3, vibrato=True)),
    Instrument("ORCHESTRA", "French Horn", "FRENCH HORN", "A HORN, ROUND. GATE 1, CV 1", "FRHORN", 48, _f("brass", "50 MS", "260 MS", detune=4, vibrato=True)),
    Instrument("ORCHESTRA", "Brass Section", "BRASS SECTION", "BRASS TOGETHER. GATE 1, CV 1", "BRASS", 60, _f("brass", "20 MS", "180 MS", detune=6)),
    Instrument("ORCHESTRA", "Horn Section", "HORN SECTION", "THE AKAI'S HORNS. GATE 1, CV 1", "HORNS", 60, _f("brass", "15 MS", "160 MS", detune=5)),
    Instrument("ORCHESTRA", "Timpani", "TIMPANI", "STRUCK, ROLLS WITH GATES", "TIMPANI", 48, _f("perc", "0", "500 MS", detune=2)),
    Instrument("ORCHESTRA", "Orchestra Hit", "ORCHESTRA HIT", "THE D-110'S. GATE 1, CV 1", "ORCHHIT", 60, _f("stab", "0", "200 MS", detune=4)),
    Instrument("ORCHESTRA", "Orch Stab Akai", "ORCH STAB AKAI", "THE AKAI'S STAB. GATE 1, CV 1", "AKAIORCH", 60, _f("stab", "0", "220 MS", detune=4)),
    Instrument("ORCHESTRA", "Choir Men", "CHOIR MEN", "LOW VOICES. GATE 1, CV 1", "MEN", 48, _f("vox", "220 MS", "800 MS", detune=7)),
    Instrument("ORCHESTRA", "Choir Women", "CHOIR WOMEN", "HIGH VOICES. GATE 1, CV 1", "WOMEN", 60, _f("vox", "220 MS", "900 MS", detune=7)),
    Instrument("ORCHESTRA", "Choir Vox", "CHOIR VOX", "THE AKAI'S VOICES. GATE 1, CV 1", "VOX", 60, _f("vox", "150 MS", "700 MS", detune=6)),
    Instrument("ORCHESTRA", "Church Organ", "CHURCH ORGAN", "THE AKAI'S PIPES. GATE 1, CV 1", "CHURCH", 60, _f("keys", "40 MS", "300 MS", detune=3)),
    Instrument("ORCHESTRA", "Pipe Organ", "PIPE ORGAN", "THE D-110'S PIPES. GATE 1, CV 1", "PIPE", 60, _f("keys", "30 MS", "250 MS", detune=3)),
    Instrument("ORCHESTRA", "Flute", "FLUTE", "A BREATHY FLUTE. GATE 1, CV 1", "FLUTE", 72, _f("lead", "40 MS", "160 MS", detune=2, vibrato=True)),
    Instrument("ORCHESTRA", "Harp", "HARP", "PLUCKED, LONG RING", "HARP", 60, _f("perc", "0", "900 MS", detune=3)),
    # Cinematic: the same recordings, for size.
    Instrument("CINEMATIC", "Low Brass Braam", "BRAAM", "THE TRAILER HORN. GATE 1, CV 1", "BRASS", 36, _f("brass", "70 MS", "1.2 S", detune=14)),
    Instrument("CINEMATIC", "Sub Strings", "SUB STRINGS", "STRINGS AN OCTAVE DOWN", "DEEPSTR", 36, _f("strings", "400 MS", "1.4 S", detune=10)),
    Instrument("CINEMATIC", "Dark Choir", "DARK CHOIR", "SLOW, LOW VOICES", "MEN", 36, _f("vox", "900 MS", "2 S", detune=10)),
    Instrument("CINEMATIC", "Drop Hit", "DROP HIT", "THE D-110'S IMPACT", "DROPHIT", 48, _f("stab", "0", "600 MS", detune=4)),
    Instrument("CINEMATIC", "Ethno Hit", "ETHNO HIT", "A STRUCK HIT WITH A TAIL", "ETHNOHIT", 48, _f("stab", "0", "600 MS", detune=4)),
    Instrument("CINEMATIC", "Space War", "SPACE WAR", "THE D-110'S FX. GATE 1", "SPACEWAR", 48, _f("stab", "0", "500 MS", detune=7)),
    Instrument("CINEMATIC", "Reso Sweep", "RESO SWEEP", "A FILTER OPENING, SAMPLED", "REZSWEEP", 48, _f("stab", "40 MS", "800 MS", detune=7)),
    Instrument("CINEMATIC", "Ober Pad", "OBER PAD", "KARMA'S STRING PAD", "OBER", 60, _f("strings", "450 MS", "1.2 S", detune=9)),
    Instrument("CINEMATIC", "Hollow Pad", "HOLLOW PAD", "THE D-110'S HOLLOW PAD", "HOLLOW", 60, _f("strings", "350 MS", "1.2 S", detune=9)),
    # Guitars.
    Instrument("GUITARS", "Nylon", "NYLON", "PLUCKED, THE D-110'S GUITAR 1", "GUITAR1", 48, _f("guitar", "0", "260 MS", detune=3)),
    Instrument("GUITARS", "Steel", "STEEL", "PLUCKED, THE D-110'S GUITAR 2", "GUITAR2", 48, _f("guitar", "0", "260 MS", detune=4)),
    Instrument("GUITARS", "Electric Clean", "ELEC CLEAN", "AN ELECTRIC, CLEAN", "ELECGTR1", 48, _f("guitar", "0", "220 MS", detune=5)),
    Instrument("GUITARS", "Electric Warm", "ELEC WARM", "ANOTHER ELECTRIC", "ELECGTR2", 48, _f("guitar", "0", "220 MS", detune=5)),
    Instrument("GUITARS", "Muted", "MUTED", "PALM MUTED: RIFFS", "EGMUTE", 48, _f("guitar", "0", "60 MS", detune=3)),
    Instrument("GUITARS", "Picked", "PICKED", "PICKED, BITING", "PICKGTR", 48, _f("guitar", "0", "180 MS", detune=4)),
    Instrument("GUITARS", "Overdrive", "OVERDRIVE", "AN OVERDRIVEN LEAD, SUSTAINED", "OVERDRV", 48, _f("guitar", "2 MS", "220 MS", detune=6, vibrato=True)),
    Instrument("GUITARS", "Koto", "KOTO", "PLUCKED, THE D-110'S KOTO", "KOTO", 60, _f("guitar", "0", "400 MS", detune=2)),
]


def natural_of(zone, x, rate):
    start, end = zone.start, zone.end or len(x) - 1
    hz, sure = pitch_of(x[start:end + 1], rate)
    if hz is None or sure < 0.5:
        return hz_of(zone.root_key), False
    # An octave's slip is what this measure does: the metadata is good on these sets, for which octave.
    meant = zone.root_key + zone.tune_cents / 100
    fixed = midi_of(hz) + 12 * round((meant - midi_of(hz)) / 12)
    return hz_of(fixed), True


def build_source(source, root):
    """(its Table, its pitch at its own speed, whether that was measured)."""
    path = next(iter(sorted(root.glob(f"{glob.escape(source.set_name)}*.korgmultisample"))), None)
    if path is None:
        raise SystemExit(f"no multisample for {source.set_name}")
    multi = read_multisample(path)
    if not multi.zones:
        raise SystemExit(f"{source.set_name} has no zones")
    zone = min(multi.zones, key=lambda z: abs(z.root_key - source.near))
    x, rate = read_audio(root / zone.path)
    end = zone.end or len(x) - 1
    one_shot = zone.one_shot or source.one_shot
    if source.seconds and one_shot:
        end = min(end, zone.start + int(source.seconds * rate))
    natural, measured = natural_of(zone, x, rate)
    if source.one_shot:
        x = x.copy()
        x[zone.start:end + 1] = flatten(x[zone.start:end + 1], rate)
    table, _ = to_table(x, rate, zone.start, zone.loop_start, end, one_shot)
    return table, natural, measured


# ---- Grains ----


def grain_patch(title, about, comment, source, table, natural, c, clocks, second=None, position=50, drift=None,
                scatter=0, attack="1.5 S", release="3 S", tune2=0, level=100, cv2=50):
    """Two streams of grains of a recording. `clocks`: `(hz, hz2)`, or `(hz,)` for two streams on one clock half a
    cycle apart, which add up to a steady level. `drift`: `(hz, shape, percent)`, an LFO taking the place grains
    are read from about, slowly. `scatter`: how much a random LFO throws each grain's place about."""
    semitones, fine = tune_of(table, natural, hz_of(c))
    name = f"SAMPLES/{source}.WAV"
    lines = []
    def osc(n, grain, tune_offset):
        t = semitones * 100 + fine + tune_offset
        whole = round(t / 100)
        text = (f"[OSC {n}]\nTABLE = {name}\nREAD = SAMPLE\nTUNE = {whole}\nFINE = {t - whole * 100}\nPOS = {position}%\n"
                f"EDGE = WRAP\nGRAIN = {grain}\n")
        if table.loop_frame:
            text += f"LOOP = {percent_text(frame_percent(table.loop_frame, table.frames))}\n"
        return text
    if len(clocks) == 1:
        lines += [osc(1, "LFO 1", 0), osc(2, "LFO 1 B", tune2)]
        lines.append(f"[LFO 1]\nRATE = {clocks[0]} HZ\nSHAPE = SAW UP\n")
    else:
        lines += [osc(1, "LFO 1", 0), osc(2, "LFO 2", tune2)]
        lines.append(f"[LFO 1]\nRATE = {clocks[0]} HZ\nSHAPE = SAW UP\n")
        lines.append(f"[LFO 2]\nRATE = {clocks[1]} HZ\nSHAPE = SAW UP\n")
    lines.append(f"[ENV 1]\nATTACK = {attack}\nDECAY = 1 S\nSUSTAIN = 100%\nRELEASE = {release}\nVCA = BOTH\n")
    rows = ["CV 1 > PITCH 1 = 100%", "CV 1 > PITCH 2 = 100%", f"CV 2 > POS 1 = {cv2}%", f"CV 2 > POS 2 = {cv2}%"]
    lfo3 = None
    if drift and len(clocks) == 1:
        lines.append(f"[LFO 2]\nRATE = {drift[0]} HZ\nSHAPE = {drift[1]}\n")
        rows += [f"LFO 2 > POS 1 = {drift[2]}%", f"LFO 2 > POS 2 = {drift[2]}%"]
    elif drift:
        lfo3 = (drift[0], drift[1])
        rows += [f"LFO 3 > POS 1 = {drift[2]}%", f"LFO 3 > POS 2 = {drift[2]}%"]
    if scatter:
        assert lfo3 is None, title
        lfo3 = (17, "RANDOM")
        rows += [f"LFO 3 > POS 1 = {scatter}%", f"LFO 3 > POS 2 = {-scatter}%"]
    if lfo3:
        lines.append(f"[LFO 3]\nRATE = {lfo3[0]} HZ\nSHAPE = {lfo3[1]}\n")
    lines.append("[ROUTING]\n" + "\n".join(rows) + "\n")
    lines.append(f"[MIXER]\nOUT 0 = MIX\nOUT 1 = MIX\nLEVEL 1 = {level}%\nLEVEL 2 = {level}%\n")
    head = f"FAIRWAVE PATCH 1\nNAME  = {title}\nABOUT = {about}\n\n" + "".join(f"# {c_}\n" for c_ in comment)
    return head + "\n".join(lines)


def main():
    root = Path(sys.argv[1]) if len(sys.argv) > 1 else HERE.parent / "ExampleTables" / "All"
    OUT.mkdir(parents=True, exist_ok=True)
    built = {}
    for short, source in SOURCES.items():
        table, natural, measured = build_source(source, root)
        write_table(OUT / f"{short}.WAV", table)
        built[short] = (table, natural)
        print(f"{short:9} {source.set_name:32} {natural:7.1f} Hz {'measured' if measured else 'from its root':14} "
              f"{table.frames:4} x {table.frame_len:4} loop {table.loop_frame} {len(table.samples) * 2 // 1024} KB")
    for inst in INSTRUMENTS:
        table, natural = built[inst.source]
        family = inst.family
        semitones, fine = tune_of(table, natural, hz_of(inst.c))
        assert -48 <= semitones <= 48, inst.file
        comment = [f"{SOURCES[inst.source].set_name}, played by READ = SAMPLE, restarting on each gate. 0 V is C{inst.c // 12 - 1}."] + inst.notes
        comment.append("CV 2 moves where it starts.")
        text = patch_text(inst.title, inst.about, comment, f"SAMPLES/{inst.source}.WAV", table, semitones, fine, family)
        folder = LIB / inst.folder
        folder.mkdir(exist_ok=True)
        (folder / f"{inst.file}.fwp").write_text(text, encoding="ascii", newline="\n")

    folder = LIB / "GRAINS"
    folder.mkdir(exist_ok=True)

    def grains(file, title, about, comment, source, c, **kw):
        table, natural = built[source]
        (folder / f"{file}.fwp").write_text(grain_patch(title, about, comment, source, table, natural, c, **kw),
                                            encoding="ascii", newline="\n")

    grains("Glacier", "GLACIER", "A LONG WINDING PAD. HOLD GATE 1",
           ["Two streams of grains half a cycle apart, each a fifth of a second of a recording, and the place they read",
            "from wandering slowly up and back through it: 40 seconds round. The pitch stays where CV 1 says."],
           "ATMOLONG", 60, clocks=(5.1,), position=48, drift=(0.025, "TRI", 42), attack="2.5 S", release="4 S")
    grains("Winding Strings", "WINDING STRINGS", "STRINGS THAT NEVER REPEAT. GATE 1",
           ["A string section's sound, read a little at a time, the place drifting on a slow sine: a bow that never",
            "changes direction. Move CV 2 for another part of the recording."],
           "BOWS", 60, clocks=(6.8,), position=45, drift=(0.06, "SINE", 28), attack="1.8 S", release="3 S")
    grains("Choir Drift", "CHOIR DRIFT", "VOICES, TURNING SLOWLY. GATE 1",
           ["Grains of a choir an octave apart, the upper stream quieter for being half of the mix: a held vowel",
            "turning into the next one and back."],
           "WOMEN", 60, clocks=(3.9,), position=42, drift=(0.04, "TRI", 34), tune2=1200, attack="2 S", release="3.5 S")
    grains("Dream Cloud", "DREAM CLOUD", "A SHIMMER ON TWO CLOCKS. GATE 1",
           ["Each stream on a clock of its own, so they keep passing through one another, and the level breathes with",
            "them. A random LFO throws each grain a little way from the last."],
           "DREAM", 60, clocks=(4.1, 6.3), position=38, scatter=8, attack="1.2 S", release="3 S")
    grains("Warm Octaves", "WARM OCTAVES", "PAD WITH AN OCTAVE OVER IT. GATE 1",
           ["A warm pad's recording in slow grains, with the second stream an octave up: the upper one reads twice",
            "as fast, so it moves through the recording quicker. Long and slow."],
           "WARMPAD", 60, clocks=(2.7,), position=50, drift=(0.03, "SINE", 30), tune2=1200, attack="3 S", release="5 S")
    grains("Steam Fifths", "STEAM FIFTHS", "A PAD IN FIFTHS, MOVING. GATE 1",
           ["The D-110's Steam Pad in grains, with the second stream a fifth up: a chord out of one note, drifting."],
           "STEAM", 60, clocks=(3.3,), position=40, drift=(0.05, "TRI", 30), tune2=700, attack="1.5 S", release="4 S")
    grains("Freeze", "FREEZE", "HOLDS ONE MOMENT. CV 2 PICKS IT",
           ["No drift: the grains read one place over and over, so a moment of the recording goes on as long as the gate",
            "does. CV 2 at 0 to 5 V says which moment. Fast clocks, for a smooth sound."],
           "VOX", 60, clocks=(11.3,), position=20, attack="300 MS", release="1.5 S", cv2=80)
    grains("Stretch", "STRETCH", "A VOICE, 20 SECONDS LONG. GATE 1",
           ["A ramp on the place grains read from, once through in 20 seconds: a recording of a few seconds, stretched",
            "out to that, at any pitch. Time and pitch come apart: that's what grains are for."],
           "VOX", 60, clocks=(7.3,), position=0, drift=(0.05, "SAW UP", 100), attack="200 MS", release="1.5 S", cv2=0)
    grains("Scatter Brass", "SCATTER BRASS", "A SECTION IN PIECES. GATE 1",
           ["Fast grains of a brass section, thrown about by a random LFO: every player at a different moment."],
           "BRASS", 60, clocks=(18.0,), position=45, scatter=24, attack="60 MS", release="500 MS")
    grains("Slow Bloom", "SLOW BLOOM", "A STRING PAD OPENING. GATE 1",
           ["Slow grains of Karma's string pad, on a clock slower than its own loop: it swells and turns without ever",
            "quite settling. Hold it for a long time."],
           "OBER", 60, clocks=(1.9,), position=35, drift=(0.018, "SINE", 30), attack="4 S", release="6 S")


if __name__ == "__main__":
    sys.exit(main())
