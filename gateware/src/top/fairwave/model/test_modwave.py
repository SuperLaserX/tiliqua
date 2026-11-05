"""`tools/modwave.py` and `tools/import_modwave.py`: reading a modwave's files, and what becomes of a sound."""

import struct
import sys
import uuid
from collections import Counter
from pathlib import Path
from types import SimpleNamespace

import numpy as np
import pytest

from .patchfile import parse, time_samples

TOOLS = Path(__file__).resolve().parent.parent / "tools"
sys.path.insert(0, str(TOOLS))

import import_modwave as im  # noqa: E402
import modwave as mw  # noqa: E402

BANKS = Path(r"D:\midi\modwave")


def zigzag(v):
    return (v << 1) ^ (v >> 63)


def varint(v):
    v &= (1 << 64) - 1
    out = bytearray()
    while True:
        b = v & 0x7F
        v >>= 7
        if v:
            out.append(b | 0x80)
        else:
            out.append(b)
            return bytes(out)


def encode(message, values):
    """A dict as protobuf bytes, by the same schema the decoder reads: for making sounds to test with."""
    by_name = {f["name"]: (int(n), f) for n, f in mw.SCHEMA["messages"][message].items()}
    out = bytearray()
    for name, value in values.items():
        number, f = by_name[name]
        for one in value if f.get("repeated") else [value]:
            kind = f["type"]
            if kind == "message":
                body = encode(f["type_name"], one)
                out += varint(number << 3 | 2) + varint(len(body)) + body
            elif kind in ("string", "bytes"):
                body = one.encode() if kind == "string" else one
                out += varint(number << 3 | 2) + varint(len(body)) + body
            elif kind == "float":
                out += varint(number << 3 | 5) + struct.pack("<f", one)
            elif kind in ("sint32", "sint64"):
                out += varint(number << 3) + varint(zigzag(one))
            else:
                out += varint(number << 3) + varint(int(one))
    return bytes(out)


def fp(value, *mods):
    p = {"value": value}
    if mods:
        p["modulation_list"] = {"modulation": [{"source": {"type": s}, "intensity": {"float_value": a}} for s, a in mods]}
    return p


def ip(value):
    return {"value": value}


TABLE_A = uuid.UUID(int=1).bytes
TABLE_B = uuid.UUID(int=2).bytes


def a_library():
    """A saw table of 8 frames, getting darker, and a square table."""
    t = np.arange(2048) / 2048
    n = np.arange(1, 400)[:, None]
    harmonics = np.sin(2 * np.pi * n * t[None, :]) / n
    saw = harmonics.sum(axis=0)
    saws = np.array([np.sum(harmonics[:max(1, 200 >> i)], axis=0) for i in range(8)])
    lib = mw.Library()
    lib.wavetables[mw.uuid_text(TABLE_A)] = mw.WaveTable(mw.uuid_text(TABLE_A), "TEST SAW", saws / np.abs(saw).max())
    square = np.where(t < 0.5, 1.0, -1.0)[None, :]
    lib.wavetables[mw.uuid_text(TABLE_B)] = mw.WaveTable(mw.uuid_text(TABLE_B), "TEST SQUARE", square)
    return lib


def a_program(**changes):
    """A program as the instrument would save one, with one oscillator on, a filter that's wide open, and all else off."""
    adsr = {"attack_time_secs": fp(0.01), "decay_time_secs": fp(0.2), "sustain_level_percent": fp(40.0), "release_time_secs": fp(0.1), "decay_curve": fp(6.0)}
    voice = [{"name": "Filter Key Track", "key_track": {"low_slope": fp(-1.0), "low_key": ip(36), "mid_key": ip(60), "high_key": ip(84), "high_slope": fp(1.0)}},
             {"name": "Amp Key Track", "key_track": {}},
             {"name": "Filter ADSR", "adsr": adsr},
             {"name": "Osc 1 X ADSR", "adsr": adsr},
             {"name": "Osc 2 X ADSR", "adsr": adsr},
             {"name": "Filter LFO", "lfo": {"waveform": ip(4), "frequency_hz": fp(3.0)}}]
    osc1 = {"oscillator_type": ip(0), "wave_table_osc": {"wave_table_a_uuid": TABLE_A, "position_percent": fp(0.0), "position_interpolation_width_percent": fp(100.0)},
            "morph_type": ip(0), "morph_amount_percent": fp(0.0), "level_percent": fp(100.0)}
    osc2 = {"oscillator_type": ip(0), "wave_table_osc": {"wave_table_a_uuid": TABLE_B, "position_percent": fp(0.0), "position_interpolation_width_percent": fp(100.0)},
            "morph_type": ip(0), "morph_amount_percent": fp(0.0), "level_percent": fp(0.0)}
    model = {"common": {"voice_modulator": voice}, "oscillator1": osc1, "oscillator2": osc2, "amp_eg": adsr, "amp": {"level_percent": fp(100.0)}}
    model.update(changes)
    return mw.decode(encode(mw.NS + "Program", {"name": "TEST", "patch": [{"name": "x", "data": encode(mw.NS + "DwxModel", model)}]}), mw.NS + "Program")


def translated(tmp_path, info=None, **changes):
    tables = im.Tables(tmp_path / "FAIRWAVE" / "MODWAVE", a_library())
    text, why = im.translate("TEST", info or {}, [(a_program(**changes), {}, 0)], {}, 120.0, tables, "test")
    assert text is not None, why
    f = parse(text.encode())
    assert (f.skipped, f.first_skipped) == (0, 0), text
    return text, f, tables


def table_of(tables, f, i):
    from .patchfile import read_wav
    return read_wav((tables.out.parent / f.tables[i]).read_bytes())


def route_map(f):
    return {(s[0], s[1]): s[2] for s in f.settings["slots"]}


# ---- Reading ----


def container(*items):
    header = b"".join(varint(2 << 3 | 2) + varint(len(e)) + e for e in
                      (varint(1 << 3 | 2) + varint(len(name)) + name + varint(3 << 3) + varint(1) for name, _ in items))
    body = b"".join(struct.pack("<I", len(data)) + data for _, data in items)
    return b"Korg" + struct.pack("<I", len(header)) + header + body


def test_an_object_from_the_instruments_database_reads_as_a_file_would(tmp_path):
    info = encode(mw.NS + "ObjectInfo", {"name": "Mine", "uuid": uuid.UUID(int=9).bytes})
    path = tmp_path / str(uuid.UUID(int=9))
    path.write_bytes(container((b"Program", encode(mw.NS + "Program", {"name": "x"})), (b"ObjectInfo", info)))
    lib = mw.load_file(path)
    assert list(lib.programs) == ["Mine"]
    table = np.zeros((2, 2048), dtype="<f4")
    path.write_bytes(container((b"WaveTable", table.tobytes()), (b"ObjectInfo", info)))
    lib = mw.load_file(path)
    assert lib.wavetables[str(uuid.UUID(int=9))].frames.shape == (2, 2048)


def test_other_objects_in_the_database_are_passed_over(tmp_path):
    path = tmp_path / str(uuid.UUID(int=9))
    path.write_bytes(container((b"Effect", b"\x00"), (b"ObjectInfo", b"")))
    lib = mw.load_file(path)
    assert not (lib.programs or lib.performances or lib.wavetables)


def test_the_instruments_library_goes_last_so_a_sound_stays_with_its_pack(tmp_path):
    data = tmp_path / "database" / "Data" / "5D"
    data.mkdir(parents=True)
    (data / str(uuid.UUID(int=9))).write_bytes(b"x")
    (tmp_path / "database" / "inspiration.db").write_bytes(b"x")
    (tmp_path / "A.mwbundle").write_bytes(b"x")
    (tmp_path / "backup.mwbackup").write_bytes(b"x")
    packs = im.packs_in(tmp_path)
    assert [p[0] for p in packs] == ["A", "FACTORY", "ONBOARD"]
    assert packs[-1][1:] == [str(data / str(uuid.UUID(int=9)))]


def test_a_message_reads_back_as_it_was_written():
    body = encode(mw.NS + "IntParameter", {"value": -3})
    assert mw.decode(body, mw.NS + "IntParameter") == {"value": -3}
    body = encode(mw.NS + "FloatParameter", {"value": 1.5})
    assert mw.decode(body, mw.NS + "FloatParameter") == {"value": 1.5}


def test_a_container_holds_what_its_header_says():
    head = encode(mw.NS + "Program", {"name": "x"})
    entry = b"\x0a\x07Program\x18\x01"
    header = b"\x08\x01" + b"\x12" + bytes([len(entry)]) + entry
    b = b"Korg" + struct.pack("<I", len(header)) + header + struct.pack("<I", len(head)) + head
    assert mw.read_container(b) == [("Program", head)]


def test_a_wavetable_is_frames_of_2048_floats():
    raw = np.arange(4096, dtype="<f4").tobytes()
    info = encode(mw.NS + "ObjectInfo", {"uuid": TABLE_A, "name": "T", "instrument_main_category": ["Sweep"]})
    t = mw.wavetable_of({"WaveTable": raw, "ObjectInfo": info})
    assert t.frames.shape == (2, 2048) and t.name == "T" and t.frames[1, 0] == 2048
    assert t.categories == ["Sweep"]


@pytest.mark.skipif(not (BANKS / "base").exists(), reason="the modwave's own files aren't here")
def test_the_modwaves_own_files_read():
    lib = mw.load_file(BANKS / "base" / " Init Performance.mwperf")
    assert " Init Performance" in lib.performances
    perf, _ = lib.performances[" Init Performance"]
    layers = mw.layers_of(perf)
    assert [t for t, _ in layers][:2] == ["Layer A", "Layer B"]
    model = mw.models_of(layers[0][1])[0]
    assert "oscillator1" in model and "filter" in model and "amp_eg" in model
    table = mw.load_file(BANKS / "base" / "Silence.mwwavetable")
    assert next(iter(table.wavetables.values())).frames.shape == (1, 2048)


# ---- Tables ----


def spectrum(cycle):
    return np.abs(np.fft.rfft(cycle)) / (len(cycle) / 2)


SAW = (2 * np.arange(2048) / 2048 - 1)[None, :]


@pytest.mark.parametrize("mode,kept,gone", [
    ("LOAD_MODE_KNOCK_OUT_EVEN_HARMONICS", [1, 3, 5], [2, 4, 6]),
    ("LOAD_MODE_KNOCK_OUT_ODD_HARMONICS", [1, 2, 4], [3, 5, 7]),
    ("LOAD_MODE_KNOCK_OUT_EVERY_3RD_HARMONIC", [1, 2, 4, 5], [3, 6, 9]),
    ("LOAD_MODE_KEEP_LOW_12_HARMONICS", [1, 12], [13, 40]),
    ("LOAD_MODE_KEEP_LOW_20_HARMONICS", [1, 20], [21, 40]),
])
def test_a_modifier_keeps_the_harmonics_the_manual_says(mode, kept, gone):
    s = spectrum(im.modified(SAW, mode)[0])
    assert all(s[k] > 0.01 for k in kept)
    assert all(s[k] < 1e-6 for k in gone)


def test_hard_clip_is_a_gain_of_three():
    out = im.modified(np.array([[0.1, 0.5, -0.5]]), "LOAD_MODE_HARD_CLIP")
    assert out[0].tolist() == pytest.approx([0.3, 1.0, -1.0])


def test_fade_out_and_reverse_go_by_the_frames():
    frames = np.ones((5, 4))
    assert im.modified(frames, "LOAD_MODE_FADE_OUT")[:, 0].tolist() == pytest.approx([1, 0.75, 0.5, 0.25, 0])
    numbered = np.arange(3)[:, None] * np.ones((3, 4))
    assert im.modified(numbered, "LOAD_MODE_REVERSE")[:, 0].tolist() == [2, 1, 0]


def test_no_modifier_changes_nothing():
    assert im.modified(SAW, "LOAD_MODE_NORMAL") is SAW
    assert im.modified(SAW, None) is SAW


def test_a_gain_modifier_is_the_gain_it_says():
    assert im.modified(np.ones((1, 4)), "LOAD_MODE_MINUS_6_DB")[0, 0] == pytest.approx(0.5012)


def test_position_runs_from_the_first_wave_to_the_last_and_crossfades_between():
    frames = np.arange(5)[:, None] * np.ones((5, 4))
    assert im.at_position(frames, 0, 100)[0] == 0
    assert im.at_position(frames, 100, 100)[0] == 4
    assert im.at_position(frames, 50, 100)[0] == 2
    assert im.at_position(frames, 37.5, 100)[0] == pytest.approx(1.5)


def test_with_no_crossfade_a_position_is_one_wave_or_the_next():
    frames = np.arange(4)[:, None] * np.ones((4, 4))
    seen = {im.at_position(frames, p, 0)[0] for p in np.linspace(0, 100, 101)}
    assert seen == {0.0, 1.0, 2.0, 3.0}


# ---- Morphs ----


def smooth_cycle(n=2048):
    t = np.arange(n) / n
    return np.sin(2 * np.pi * t) + 0.3 * np.sin(6 * np.pi * t)


def test_stretch_at_50_leaves_a_wave_alone():
    c = smooth_cycle()
    assert im.morphed(c, im.MORPH_STRETCH, 50) is c


def test_stretch_otherwise_moves_its_peak_and_not_its_end():
    c = np.sin(2 * np.pi * np.arange(2048) / 2048)
    out = im.morphed(c, im.MORPH_STRETCH, 25)
    # A sine's peak is a quarter of the way through it: the first half of it takes a quarter of the cycle now.
    assert abs(int(np.argmax(out)) - 2048 / 8) < 12
    assert abs(out[0]) < 0.05


def test_narrow_squeezes_it_to_the_front_and_leaves_silence():
    out = im.morphed(smooth_cycle(), im.MORPH_NARROW, 75)
    assert np.abs(out[700:]).max() < 0.08
    assert np.abs(out[:500]).max() > 0.5


def test_sync_is_more_cycles_as_it_rises():
    c = np.sin(2 * np.pi * np.arange(2048) / 2048)
    # A hundred percent is the max sync interval: 1200 cents here, twice the speed.
    out = im.morphed(c, im.MORPH_SYNC, 100, max_sync_cents=1200)
    assert np.argmax(spectrum(out)[1:40]) + 1 == 2


def test_flip_inverts_its_second_part():
    c = np.ones(2048) * 0.5
    c = c - 0.0
    out = im.morphed(np.sin(2 * np.pi * np.arange(2048) / 2048) * 0 + c, im.MORPH_FLIP, 50)
    assert out[400] > 0 and out[1600] < 0


def test_mirror_is_the_same_both_ways_at_50():
    out = im.morphed(smooth_cycle(), im.MORPH_MIRROR, 50)
    assert np.abs(out[100:900] - out[::-1][99:899]).max() < 0.05


def test_cross_morphs_leave_a_cycle_for_the_cross_modulation_to_do():
    c = smooth_cycle()
    for kind in (im.MORPH_FM, im.MORPH_AM, im.MORPH_RING):
        assert im.morphed(c, kind, 80) is c


# ---- Filters ----


def gains(poles, mode, reso=0.0, note=60):
    hz = np.array([20.0, 100.0, im.hz_of(note), 4000.0, 16000.0])
    return np.abs(im.response(poles, mode, {}, note, reso, hz))


@pytest.mark.parametrize("poles", ["2", "4", "P", "M"])
def test_a_low_pass_passes_lows_and_cuts_highs(poles):
    g = gains(poles, "LP")
    assert g[0] > 0.7
    assert g[4] < 0.01


@pytest.mark.parametrize("poles", ["2", "4", "M"])
def test_a_high_pass_is_the_other_way(poles):
    g = gains(poles, "HP")
    assert g[0] < 0.01
    assert g[4] > 0.7


def test_a_four_pole_is_steeper_than_a_two_pole():
    assert gains("4", "LP")[3] < gains("2", "LP")[3]


def test_resonance_lifts_the_cutoff():
    assert gains("2", "LP", 90)[2] > gains("2", "LP", 0)[2] * 3


def test_a_multi_filter_mixes_its_two_modes():
    message = {"mode_control": [{"mode": "LOW_PASS"}, {"mode": "HIGH_PASS"}], "mode_crossfade_percent": {"value": 100.0}}
    hz = np.array([20.0, 16000.0])
    g = np.abs(im.response("2", "MULTI", message, 60, 0, hz))
    assert g[0] < 0.01 and g[1] > 0.7
    message["mode_crossfade_percent"] = {"value": 0.0}
    g = np.abs(im.response("2", "MULTI", message, 60, 0, hz))
    assert g[0] > 0.7 and g[1] < 0.01


# ---- Whole sounds ----


def test_a_plain_oscillator_is_its_own_table_at_its_own_position(tmp_path):
    text, f, tables = translated(tmp_path)
    assert len(table_of(tables, f, 0)) == 8 and len(table_of(tables, f, 0)[0]) == 2048
    assert f.settings["layers"][0]["position"] == 0
    assert f.settings["layers"][1]["level"] == 0, "with one oscillator on, the other is silent"


def test_an_envelope_on_position_goes_straight_to_pos(tmp_path):
    osc = {"oscillator_type": ip(0), "wave_table_osc": {"wave_table_a_uuid": TABLE_A, "position_percent": fp(10.0, (20003, 60.0)), "position_interpolation_width_percent": fp(100.0)},
           "morph_type": ip(0), "morph_amount_percent": fp(0.0), "level_percent": fp(100.0)}
    _, f, tables = translated(tmp_path, oscillator1=osc)
    assert route_map(f)[(3 + 1, 1)] == 120, "ENV 2 > POS 1 = 60%, in half percents"
    assert f.settings["layers"][0]["position"] == 100
    assert len(table_of(tables, f, 0)) == 8, "it's still the wavetable"


def test_the_amp_envelope_is_env_1_with_its_times(tmp_path):
    _, f, _ = translated(tmp_path)
    env = f.settings["envs"][0]
    assert env["vca"] == 3
    assert abs(time_samples(env["decay"]) / 48000 - 0.2) < 0.03
    assert env["sustain"] == 40
    assert env["curves"][1] == 60, "a curve of 6 is 60 here"


def test_a_time_is_as_its_knob_is_set_whatever_modulates_it(tmp_path):
    """An envelope time's modulation is on the instrument's own curve: read as seconds, this was an attack of three hours."""
    adsr = {"attack_time_secs": fp(0.01, (267, 17079.76)), "decay_time_secs": fp(0.2, (401, -17079.76)), "sustain_level_percent": fp(40.0), "release_time_secs": fp(0.1)}
    text, f, _ = translated(tmp_path, amp_eg=adsr)
    env = f.settings["envs"][0]
    assert abs(time_samples(env["attack"]) / 48000 - 0.01) < 0.002
    assert abs(time_samples(env["decay"]) / 48000 - 0.2) < 0.03
    assert "envelope and LFO speeds" in text


def test_an_lfos_rate_is_as_its_knob_is_set_whatever_modulates_it():
    lost = Counter()
    lfo = mw.decode(encode(mw.NS + "LFO", {"frequency_hz": fp(3.0, (401, 500.0))}), mw.NS + "LFO")
    assert im.lfo_hz(lfo, 120.0, lost) == 3.0
    assert lost


def test_a_loud_layer_isnt_put_aside_for_an_fm_pair_at_no_level():
    def osc(layer, index, level, morph=0):
        return SimpleNamespace(layer=layer, index=index, level=level, morph=(morph, 0.0, []))

    loud = osc(0, 0, 1.0)
    pair = [osc(1, 0, 0.0), osc(1, 1, 0.0, im.MORPH_FM)]
    assert loud in im.pick_two([loud, *pair])
    pair = [osc(1, 0, 0.0), osc(1, 1, 0.8, im.MORPH_FM)]
    assert im.pick_two([loud, *pair]) == pair, "one that's as loud keeps its modulator"


def test_a_recording_made_off_centre_comes_back_to_it_and_keeps_its_movement(tmp_path):
    tables = im.Tables(tmp_path / "FAIRWAVE" / "MODWAVE", a_library())
    # Quiet then loud: a mean frame by frame would change what's in a recording.
    frames = np.full((2, 256), 0.25)
    frames[1] = 0.25 + 0.5 * np.sin(2 * np.pi * np.arange(256) / 32)
    frames[0, ::2] += 0.1
    rel, _ = tables.write(frames, sample=True)
    from .patchfile import read_wav
    out = np.array(read_wav((tables.out.parent / rel).read_bytes()), float)
    assert abs(out.mean()) < 2
    assert abs(out[0].mean() - out[1].mean()) > 1000, "frame by frame, these would both be at 0"


def low_pass_at(rate, hz):
    def gain_of(n):
        f = np.fft.rfftfreq(n, 1 / rate)
        return 1 / (1 + 1j * f / hz)
    return gain_of


def test_a_filtered_loop_comes_round_to_where_it_ended():
    """Filtered as one long cycle, a very low cutoff makes the end of a loop lead back to the recording's start: a click."""
    rate = 48000
    t = np.arange(rate) / rate
    x = np.sin(2 * np.pi * 110 * t) * np.exp(-t * 3) + 0.8
    x[24000:] = np.sin(2 * np.pi * 110 * t[:24000])  # from here it's whole cycles of 110 Hz, so a loop of them joins
    out = im.filtered_recording(x, 24000, low_pass_at(rate, 20))
    assert len(out) == len(x)
    join = abs(out[-1] - out[24000])
    steepest = np.abs(np.diff(out[24000:])).max()
    assert join <= steepest * 2
    assert np.abs(np.diff(out)).max() <= steepest * 3, "and what comes before it runs into it"


def test_a_recording_that_plays_once_doesnt_lead_back_to_its_start():
    x = np.zeros(4096)
    x[-400:] = 1.0
    out = im.filtered_recording(x, None, low_pass_at(48000, 200))
    assert len(out) == len(x)
    assert np.abs(out[:400]).max() < 0.01


def test_a_recording_held_under_an_envelope_has_its_filter_open():
    adsr = {"adsr": {"sustain_level_percent": {"value": 50.0}}}
    no_sustain = {"adsr": {"decay_time_secs": {"value": 0.3}}}
    sources = im.Sources({}, [adsr, no_sustain, {"lfo": {}}], [], [])
    osc = SimpleNamespace(cutoff=(10.0, [im.Move("v0", 60.0)]), sources=sources, model={})
    assert im.where_a_filter_sits(osc) == 40.0
    osc.cutoff = (10.0, [im.Move("v1", 60.0)])
    assert im.where_a_filter_sits(osc) == 40.0, "with no sustain it's only passing: half way"
    osc.cutoff = (10.0, [im.Move("v2", 60.0), im.Move("wheel", 30.0)])
    assert im.where_a_filter_sits(osc) == 10.0, "an LFO's middle and a wheel at rest don't move it"


def test_a_filter_envelope_becomes_a_table_along_it(tmp_path):
    flt = {"enable": {"value": True}, "four_pole_resonant_low_pass_filter": {"common": {
        "frequency_semitones": fp(40.0), "resonance_percent": fp(0.0), "input_trim_percent": fp(100.0), "output_level_percent": fp(100.0),
        "frequency_eg_modulation": {"modulation": {"source": {"type": 20002}, "intensity": {"float_value": 60.0}}},
        "frequency_key_track_modulation": {"modulation": {"source": {"type": 20000}, "intensity": {"float_value": 60.0}}}}}}
    text, f, tables = translated(tmp_path, filter=flt)
    frames = table_of(tables, f, 0)
    assert len(frames) == im.PATH_FRAMES and len(frames[0]) == im.BAKED_LENGTH
    routes = route_map(f)
    assert routes[(4, 1)] == 200, "ENV 2 > POS 1 = 100%"
    assert not any(s[0] == 1 and s[1] == 1 for s in f.settings["slots"]), "a key track of 60 follows the note, as a baked table does"
    assert f.settings["layers"][0]["position"] == 0
    # And the table really is darker at its start than at its end.
    first, last = spectrum(np.array(frames[0], float)), spectrum(np.array(frames[-1], float))
    assert first[40:].sum() < last[40:].sum() / 3
    assert "ENV 2" in text.upper() or "[ENV 2]" in text


def test_a_partial_key_track_is_a_slot_and_the_table_has_room_for_it(tmp_path):
    flt = {"enable": {"value": True}, "polysix_filter": {"common": {
        "frequency_semitones": fp(60.0), "input_trim_percent": fp(100.0), "output_level_percent": fp(100.0),
        "frequency_eg_modulation": {"modulation": {"source": {"type": 20002}, "intensity": {"float_value": 24.0}}},
        "frequency_key_track_modulation": {"modulation": {"source": {"type": 20000}, "intensity": {"float_value": 0.0}}}}}}
    _, f, _ = translated(tmp_path, filter=flt)
    routes = route_map(f)
    assert routes[(1, 1)] < 0, "with no key track, a higher note is further under the cutoff"
    assert f.settings["layers"][0]["position"] > 0, "and the table goes on past where it starts"


def test_a_cutoff_that_stays_is_baked_in_and_position_stays_real(tmp_path):
    flt = {"enable": {"value": True}, "two_pole_resonant_low_pass_filter": {"common": {
        "frequency_semitones": fp(50.0), "input_trim_percent": fp(100.0), "output_level_percent": fp(100.0)}}}
    _, f, tables = translated(tmp_path, filter=flt)
    frames = table_of(tables, f, 0)
    assert len(frames) == 8 and len(frames[0]) == im.BAKED_LENGTH
    assert spectrum(np.array(frames[0], float))[40:].sum() < spectrum(np.array(frames[0], float))[1:5].sum() / 10


def test_the_mod_wheel_is_cv_2(tmp_path):
    osc = {"oscillator_type": ip(0), "wave_table_osc": {"wave_table_a_uuid": TABLE_A, "position_percent": fp(0.0, (1, 30.0)), "position_interpolation_width_percent": fp(100.0)},
           "morph_type": ip(0), "morph_amount_percent": fp(0.0), "level_percent": fp(100.0)}
    _, f, _ = translated(tmp_path, oscillator1=osc)
    assert route_map(f)[(2, 1)] == 60


def test_two_oscillators_are_two_oscillators_tuned_and_balanced(tmp_path):
    osc2 = {"oscillator_type": ip(0), "pitch": {"transpose_octaves": ip(-1), "tune_cents": fp(7.0)},
            "wave_table_osc": {"wave_table_a_uuid": TABLE_B, "position_percent": fp(0.0), "position_interpolation_width_percent": fp(100.0)},
            "morph_type": ip(0), "morph_amount_percent": fp(0.0), "level_percent": fp(100.0)}
    _, f, _ = translated(tmp_path, oscillator2=osc2)
    a, b = f.settings["layers"]
    assert (a["semitones"], a["fine"]) == (0, 0)
    assert (b["semitones"], b["fine"]) == (-12, 7)
    assert 20 < f.settings["balance"] / 10 < 80


def test_fm_from_oscillator_1_is_the_cross_modulation(tmp_path):
    osc1 = {"oscillator_type": ip(0), "wave_table_osc": {"wave_table_a_uuid": TABLE_A, "position_percent": fp(0.0), "position_interpolation_width_percent": fp(100.0)},
            "morph_type": ip(0), "morph_amount_percent": fp(0.0), "level_percent": fp(0.0)}
    osc2 = {"oscillator_type": ip(0), "wave_table_osc": {"wave_table_a_uuid": TABLE_B, "position_percent": fp(0.0), "position_interpolation_width_percent": fp(100.0)},
            "morph_type": ip(im.MORPH_FM), "morph_amount_percent": fp(25.0, (20003, 40.0)), "level_percent": fp(100.0)}
    _, f, _ = translated(tmp_path, oscillator1=osc1, oscillator2=osc2)
    assert f.settings["mode"] == "FM" and f.settings["modulator"] == 0
    assert f.settings["depth"] == 250
    assert route_map(f)[(4, 9)] == 80, "ENV 2 > X DEPTH"
    assert f.settings["balance"] == 1000, "with oscillator 1 at no level, only the carrier is heard"


def test_a_sub_goes_in_the_table_and_an_octave_down_makes_the_frame_two_cycles(tmp_path):
    sub = {"waveform": ip(im.SUB_SQUARE), "level_percent": fp(100.0), "octave": ip(-1)}
    _, f, tables = translated(tmp_path, sub_oscillator=sub)
    frames = table_of(tables, f, 0)
    assert f.settings["layers"][0]["semitones"] == -12, "a frame is two cycles of the oscillator now"
    s = spectrum(np.array(frames[0], float))
    assert s[1] > 0.2, "the sub, at the frame's own frequency"
    assert s[2] > 0.1, "and the oscillator's fundamental, an octave above that"


def test_a_noise_generator_is_said_to_be_left_out(tmp_path):
    text, _, _ = translated(tmp_path, sub_oscillator={"waveform": ip(10), "level_percent": fp(50.0)})
    assert "noise generator" in text


def test_a_bass_sits_at_c2_and_says_which_key_that_is(tmp_path):
    pitch = {"transpose_octaves": ip(-1)}
    text, f, _ = translated(tmp_path, info={"instrument_main_category": ["Bass"]}, pitch=pitch)
    assert f.settings["layers"][0]["semitones"] == -24, "its loudest oscillator at C2, whatever key that took"
    assert "C3 key" in text


def test_anything_else_plays_as_its_keys_do(tmp_path):
    _, f, _ = translated(tmp_path, pitch={"transpose_octaves": ip(-1)})
    assert f.settings["layers"][0]["semitones"] == -12


def test_a_macro_is_taken_where_the_patch_left_it(tmp_path):
    osc = {"oscillator_type": ip(0), "wave_table_osc": {"wave_table_a_uuid": TABLE_A, "position_percent": fp(10.0, (401, 40.0)), "position_interpolation_width_percent": fp(100.0)},
           "morph_type": ip(0), "morph_amount_percent": fp(0.0), "level_percent": fp(100.0)}
    tables = im.Tables(tmp_path / "FAIRWAVE" / "MODWAVE", a_library())
    text, _ = im.translate("TEST", {}, [(a_program(oscillator1=osc), {}, 0)], {401: 0.5}, 120.0, tables, "test")
    assert parse(text.encode()).settings["layers"][0]["position"] == 300, "10 + 40 x 0.5"


def test_a_layer_silenced_by_its_filters_output_isnt_heard(tmp_path):
    flt = {"enable": {"value": True}, "polysix_filter": {"common": {"frequency_semitones": fp(60.0), "input_trim_percent": fp(100.0), "output_level_percent": {"modulation_list": {"modulation": [{"source": {"type": 403}, "intensity": {"float_value": 50.0}}]}}}}}
    tables = im.Tables(tmp_path / "FAIRWAVE" / "MODWAVE", a_library())
    text, why = im.translate("TEST", {}, [(a_program(filter=flt), {}, 0)], {}, 120.0, tables, "test")
    assert text is None and why == "nothing audible"


def test_two_patches_with_one_table_share_a_file(tmp_path):
    tables = im.Tables(tmp_path / "FAIRWAVE" / "MODWAVE", a_library())
    a, _ = im.translate("ONE", {}, [(a_program(), {}, 0)], {}, 120.0, tables, "test")
    b, _ = im.translate("TWO", {}, [(a_program(), {}, 0)], {}, 120.0, tables, "test")
    assert parse(a.encode()).tables[0] == parse(b.encode()).tables[0]
    assert len(tables.written) == 1


def test_a_table_path_fits_what_a_patch_can_keep():
    name = "FAIRWAVE/MODWAVE/T/AB/12345678.WAV"
    assert len(name) <= 39


def test_a_cycle_a_morph_left_off_centre_is_brought_back(tmp_path):
    tables = im.Tables(tmp_path / "FAIRWAVE" / "MODWAVE", a_library())
    frames = np.ones((2, 1024)) * 0.5
    frames[:, 512:] = 1.0
    rel, _ = tables.write(frames)
    from .patchfile import read_wav
    out = read_wav((tables.out.parent / rel).read_bytes())
    assert abs(sum(out[0])) / 1024 < 2


def test_the_sub_is_band_limited():
    s = spectrum(im.sub_cycle(im.SUB_SQUARE, 2048))
    assert s[1] == pytest.approx(4 / np.pi, rel=1e-3)
    assert s[2] < 1e-9 and s[3] == pytest.approx(4 / np.pi / 3, rel=1e-3)
    s = spectrum(im.sub_cycle(im.SUB_TRIANGLE, 2048))
    assert s[1] == pytest.approx(8 / np.pi ** 2, rel=1e-3)
