"""The model's reading of a patch file, and the sound library. The firmware's has its own tests
(`cpu/src/patchfile.rs`), and `tools/check_library.py` holds the two to each other."""

from pathlib import Path

import pytest

from . import modulation as mod
from .modulation import Modulation
from .patchfile import (ABOUT_CHARS, CLEAN, FM, NAME_CHARS, RAW, RING, STEPS, a_layer, configure, default_patch, env_words,
                        layers_for, lfo_words, parse, patch_of, default_settings, rate_index, rate_millihertz, read_wav,
                        slot_word, time_index, time_samples)
from .wavescan import CLAMP, DEPTH_FULL, MIRROR, WRAP

LIBRARY = Path(__file__).resolve().parent.parent / "library" / "FAIRWAVE"
PATCHES = sorted(LIBRARY.rglob("*.fwp"))


def body(text):
    f = parse(f"FAIRWAVE PATCH 1\n{text}".encode())
    assert f.skipped == 0, f"line {f.first_skipped}"
    return f


def test_a_file_that_says_nothing_is_the_default_patch():
    assert parse(b"FAIRWAVE PATCH 1\n").patch == default_patch()


def test_the_default_patch_is_the_one_the_firmware_starts_with():
    p = default_patch()
    assert p["env"] == [env_words(1), env_words(2)]
    assert p["lfo"] == [lfo_words(53, mod.SINE), lfo_words(72, mod.TRI), lfo_words(37, mod.SQUARE)]
    assert p["slots"] == [slot_word(mod.CV1, mod.PITCH, 100), slot_word(mod.CV1, 4 + mod.PITCH, 100),
                          slot_word(mod.CV2, mod.POS, 100), slot_word(mod.CV2, 4 + mod.POS, 100)]
    assert p["outs"] == [mod.OUT_L1, mod.OUT_L2, mod.OUT_ENV1, mod.OUT_ENV2]


@pytest.mark.parametrize("text", [b"", b"\n# nothing\n", b"RIFF....WAVEfmt ", b"NAME = X\nFAIRWAVE PATCH 1\n", b"\xff\xfe\x00A\n"])
def test_only_a_patch_file_is_read_as_one(text):
    with pytest.raises(ValueError):
        parse(text)


def test_a_byte_order_mark_comments_and_case_dont_matter():
    assert parse("﻿FAIRWAVE PATCH 1\n".encode()).skipped == 0
    f = parse(b"# a sound\n\n  fairwave patch 1  \r\n[osc1]\r\nedge=wrap # past the end\r\n")
    assert f.settings["layers"][0]["edge"] == WRAP and f.skipped == 0


def test_a_name_and_about_are_cut_to_fit():
    f = body(f"NAME = {'N' * 40}\nABOUT = {'A' * 90}\n")
    assert (len(f.name), len(f.about)) == (NAME_CHARS, ABOUT_CHARS)


def test_an_oscillators_settings():
    f = body("[OSC 2]\nTABLE = TABLES/SAWLP.WAV\nFRAME = 1024\nREAD = STEPS\nTUNE = -24\nFINE = -8\nPOS = 12.5%\n"
             "SHIFT = -150%\nEDGE = MIRROR\nGRAIN = LFO 3\nLEVEL = 75%\n")
    assert f.settings["layers"][1] == a_layer(table=1, read=STEPS, semitones=-24, fine=-8, position=125, shift=-1500,
                                              edge=MIRROR, grain=3, level=75)
    assert f.settings["layers"][0] == a_layer(table=0)
    assert (f.tables[1], f.frame_log2) == ("TABLES/SAWLP.WAV", [0, 10])


def test_times_land_on_the_nearest_step():
    assert time_index("0") == 0
    assert time_index("1 MS") == 1
    assert time_samples(time_index("2 ms")) == 96
    assert time_index("1.5 S") == time_index("1500 MS")
    assert time_index("1000 S") == 121
    assert time_index("-5") == 0
    assert time_index("SOON") is None and time_index("5 WEEKS") is None
    for ms in (3, 20, 64, 103, 1500, 20000):
        chosen = abs(time_samples(time_index(f"{ms}")) - ms * 48)
        assert all(abs(time_samples(i) - ms * 48) >= chosen for i in range(122)), ms


def test_rates_land_on_the_nearest_step():
    assert rate_millihertz(rate_index("0.01 HZ")) == 10
    assert rate_millihertz(rate_index("5.12")) == 5120
    assert rate_index("1000") == 107
    assert rate_index("5 BPM") is None


def test_routing_replaces_the_default_and_steps_by_half_a_percent():
    assert body("[ROUTING]\n").patch["slots"] == []
    f = body("[ROUTING]\nCV 1 > PITCH 1 = 100%\nENV 1 > POS 1 = -12.5%\nLFO 3 > X DEPTH = 12.3%\nLFO 1 > PITCH 2 = 900%\n")
    assert f.settings["slots"] == [(mod.CV1, mod.PITCH, 200), (mod.ENV1, mod.POS, -25), (mod.LFO3, mod.CROSS, 25),
                                   (mod.LFO1, 4 + mod.PITCH, 390)]


def test_a_thirteenth_route_is_one_too_many():
    f = parse(b"FAIRWAVE PATCH 1\n[ROUTING]\n" + b"LFO 1 > POS 1 = 1%\n" * 13)
    assert len(f.settings["slots"]) == 12
    assert (f.skipped, f.first_skipped) == (1, 15)


def test_cross_modulation_is_told_as_the_firmware_tells_it():
    f = body("[CROSS MOD]\nMODE = FM\nFROM = OSC 2\nDEPTH = 62.5%\n")
    assert f.patch["cross"] == FM | 1 << 3
    assert f.patch["depth_word"] == 625 * DEPTH_FULL // 1000
    am = body("[CROSS MOD]\nMODE = AM\nDEPTH = 100%\n")
    assert am.patch["cross"] == RING
    assert am.patch["depth_word"] == DEPTH_FULL // 2, "AM is ring modulation at half the depth"


def test_a_value_out_of_range_stops_at_its_end():
    f = body("[OSC 1]\nPOS = 150%\nSHIFT = 900%\nLEVEL = 300%\nTUNE = 99\nFINE = -90\n[MIXER]\nBALANCE = -20%\n")
    layer = f.settings["layers"][0]
    assert (layer["position"], layer["shift"], layer["level"], layer["semitones"], layer["fine"]) == (1000, 2000, 100, 48, -50)
    assert f.settings["balance"] == 0
    assert body("[OSC 1]\nTUNE = 99999999999999999999999999\n").settings["layers"][0]["semitones"] == 48


def test_what_isnt_understood_is_left_out_and_counted():
    f = parse(b"FAIRWAVE PATCH 1\n[OSC 1]\nTUNE = -12\nFLAVOUR = STRAWBERRY\nEDGE = SIDEWAYS\nPOS = NEARLY\nno equals sign\n"
              b"[HOLOGRAM]\nSIZE = 3\n[LFO 4]\nRATE = 1\n[ROUTING]\nCV 1 > ELBOW = 100%\nLFO 1 = 10%\n[OSC 2]\nTUNE = 7\n\xff\xfe\n")
    assert f.settings["layers"][0]["semitones"] == -12
    assert f.settings["layers"][0]["edge"] == CLAMP
    assert f.settings["layers"][1]["semitones"] == 7
    assert (f.skipped, f.first_skipped) == (11, 4)


def test_fine_tuning_reaches_the_pitch():
    f = body("[OSC 1]\nTUNE = 1\nFINE = -50\n")
    frames = [[0] * 256]
    layers = layers_for(f.patch, [(0x8000, frames), (0x8100, frames)])
    m = Modulation()
    configure(m, f.patch, layers)
    assert m.base[mod.PITCH] == 65536 // 24, "half a semitone"


# ---- The library ----


def test_there_is_a_library():
    assert len(PATCHES) >= 30
    for folder in ("BASS", "REESE", "ROLLING", "CLASSIC"):
        assert any(p.parent.name == folder for p in PATCHES), folder


@pytest.mark.parametrize("path", PATCHES, ids=lambda p: f"{p.parent.name}/{p.stem}")
def test_every_patch_reads_with_nothing_left_out_and_its_tables_are_there(path):
    f = parse(path.read_bytes())
    assert (f.skipped, f.first_skipped) == (0, 0)
    assert f.name and f.about, "the Browser shows these"
    for table in f.tables:
        if "/" in table:
            frames = read_wav((LIBRARY / table).read_bytes())
            assert (len(frames), len(frames[0])) == (64, 1024), table
    # Every route takes CV 1 to a pitch, so it can be played, unless it has no way to be.
    assert any(s[0] == mod.CV1 for s in f.settings["slots"])


@pytest.mark.parametrize("path", PATCHES, ids=lambda p: f"{p.parent.name}/{p.stem}")
def test_every_patch_makes_sound_on_some_output(path):
    s = parse(path.read_bytes()).settings
    assert mod.OUT_MIX in s["outs"][:2] or mod.OUT_L1 in s["outs"][:2] or mod.OUT_L2 in s["outs"][:2]


def test_the_rolling_patches_run_by_themselves_near_their_tempo_on_one_envelope():
    """Two free envelopes wouldn't stay in step, so the roll's filter and its level are one."""
    for name, bpm_16ths in (("Psy Snap", 145), ("Psy Round", 145), ("Acid Roll", 145), ("FM Roll", 145)):
        s = parse((LIBRARY / "ROLLING" / f"{name}.fwp").read_bytes()).settings
        e = s["envs"][0]
        assert e["loop"] == mod.LOOP_FREE, name
        assert s["envs"][1]["loop"] != mod.LOOP_FREE, name
        period = sum(time_samples(e[k]) for k in ("delay", "attack", "hold", "decay", "release"))
        assert abs(60 / (period / 48000 * 4) - bpm_16ths) < 2.5, f"{name}: {period} samples"


def test_a_grain_patchs_windows_are_shut_when_grains_start():
    for name in ("Grain Drift", "Grain Spray"):
        s = parse((LIBRARY / "CLASSIC" / f"{name}.fwp").read_bytes()).settings
        for layer in s["layers"]:
            k = s["lfos"][layer["grain"] - 1]
            assert layer["grain"] != 0, name
            value = mod.lfo_shape(k["shape"], k["phase"] * 65536 // 360, 0)
            assert (value + mod.ONE) >> 1 == 0 and k["unipolar"], name


def test_a_table_file_says_its_frame_length_and_has_no_dc():
    for path in (LIBRARY / "TABLES").glob("*.WAV"):
        frames = read_wav(path.read_bytes())
        for frame in frames:
            assert abs(sum(frame)) / len(frame) < 40, path.name


def test_a_table_file_that_isnt_one_is_refused():
    with pytest.raises(ValueError):
        read_wav(b"not a wav at all")


def test_settings_become_words_as_the_firmware_makes_them():
    s = default_settings()
    s["envs"][0]["sustain"] = 25
    assert patch_of(s)["env"][0][5] == 25 * mod.ONE // 100
    assert CLEAN == 0 and RAW == 3
