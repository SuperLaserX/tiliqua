"""`tools/modwave_bank.py`, and what `tools/import_modwave.py` makes of a factory sample, on a small bank made here."""

import re
import struct
import sys
import uuid
from pathlib import Path

import numpy as np
import pytest

from .patchfile import parse
from .test_modwave import a_library, a_program, fp, ip

TOOLS = Path(__file__).resolve().parent.parent / "tools"
sys.path.insert(0, str(TOOLS))

import import_modwave as im  # noqa: E402
import korg  # noqa: E402
import modwave as mw  # noqa: E402
import modwave_bank as mb  # noqa: E402
from samples import C4_HZ, to_table  # noqa: E402


def flatbuffer(root, ident=b"KBnk"):
    """A dict as a FlatBuffer, each table's fields at their numbers: (format, value) inline, or `table`, `tables`, `text`, `bytes`, `numbers`."""
    out = bytearray(8)
    pending = []

    def table(fields):
        slots = 1 + max(fields, default=-1)
        vtable = len(out)
        offsets = [0] * slots
        at = 4
        for n in sorted(fields):
            offsets[n] = at
            at += 4
        out.extend(struct.pack("<HH", 4 + 2 * slots, at) + b"".join(struct.pack("<H", o) for o in offsets))
        out.extend(bytes(-len(out) % 4))
        place = len(out)
        out.extend(struct.pack("<i", place - vtable))
        for n in sorted(fields):
            kind, value = fields[n]
            if kind in ("table", "tables", "text", "bytes", "numbers"):
                pending.append((len(out), kind, value))
                out.extend(bytes(4))
            else:
                out.extend(struct.pack(kind, value).ljust(4, b"\0"))
        return place

    def blob(data):
        place = len(out)
        out.extend(struct.pack("<I", len(data)) + data + bytes(-len(data) % 4))
        return place

    struct.pack_into("<I", out, 0, table(root))
    out[4:8] = ident
    while pending:
        at, kind, value = pending.pop(0)
        if kind == "table":
            place = table(value)
        elif kind == "text":
            place = blob(value.encode())
        elif kind == "bytes":
            place = blob(value)
        elif kind == "numbers":
            place = len(out)
            out.extend(struct.pack("<I", len(value)) + b"".join(struct.pack("<I", v) for v in value))
        else:
            place = len(out)
            out.extend(struct.pack("<I", len(value)))
            for one in value:
                pending.append((len(out), "table", one))
                out.extend(bytes(4))
        struct.pack_into("<I", out, at, place - at)
    return bytes(out)


def sample(at, frames, rate=48000, channels=None, start=0, loop=None, one_shot=False, others=None):
    data = {1: ("<I", at), 2: ("<I", frames), 3: ("<I", rate), 4: ("<B", 2)}
    if channels:
        data[5] = ("<B", channels)
    fields = {1: ("table", data), 4: ("<I", frames)}
    if start:
        fields[2] = ("<I", start)
    if loop is not None:
        fields[3] = ("<I", loop)
    if one_shot:
        fields[12] = ("<B", 1)
    fields.update(others or {})
    return fields


def zone(index, top=127, root=60, tune=None, fixed=False, channel=None):
    ref = {0: ("<H", index)}
    if channel:
        ref[1] = ("<b", channel)
    fields = {0: ("table", ref), 2: ("<b", top), 3: ("<b", root)}
    if tune is not None:
        fields[5] = ("<f", tune)
    if fixed:
        fields[4] = ("<B", 1)
    return fields


def multisample(name, *zones, own_uuid=None):
    fields = {0: ("text", name), 1: ("tables", list(zones))}
    if own_uuid:
        fields[4] = ("bytes", own_uuid)
    return fields


def tone(n, hz=440.0, rate=48000, level=0.5):
    return np.round(level * 32767 * np.sin(2 * np.pi * hz * np.arange(n) / rate)).astype(np.int16)


def write_bank(folder, words, samples, multis, bank=b"\x00", bank_id=0x1003, name="Modwave 1"):
    """A bank's two files. `words` are the samples as they should come out, so a Korg bank's get scrambled."""
    folder.mkdir(parents=True)
    base = "4b6f7267-0200-0000" if bank == b"\x02" else "4b6f7267-0000-0000"
    low, high = bank_id & 0xFF, bank_id >> 8
    fields = {2: ("text", "Korg"), 3: ("text", name), 4: ("tables", multis), 5: ("tables", samples)}
    if bank_id:
        fields[1] = ("<I", bank_id)
    (folder / f"{base}-0001-{low:02x}{high:02x}ffffffff").write_bytes(flatbuffer(fields))
    data = np.asarray(words, dtype=np.int16).astype("<i2").tobytes()
    if bank != b"\x02":
        data = (np.frombuffer(data, dtype="<u2") ^ mb.SCRAMBLE).astype("<u2").tobytes()
    (folder / f"{base}-0004-{low:02x}{high:02x}00000000").write_bytes(bytes(mb.AUDIO_AT) + data)
    (folder / f"{base}-0004-{low:02x}{high:02x}feffffff").write_bytes(b"not needed")


def uuid_of(bank, bank_id, index):
    return str(uuid.UUID(bytes=b"Korg" + bank + bytes(3) + b"\x00\x02" + struct.pack("<HI", bank_id, index)))


@pytest.fixture
def bank_folder(tmp_path):
    mono = tone(1000)
    stereo = np.stack([tone(500, 220.0), tone(500, 330.0)], axis=1).reshape(-1)
    words = np.concatenate([mono, stereo])
    samples = [sample(0, 1000, loop=100),
               sample(2000, 500, rate=44100, channels=2, start=7, one_shot=True,
                      others={7: ("numbers", [11, 22]), 5: ("<I", 70), 6: ("<I", 80)}),
               {1: ("table", {0: ("<b", 1)}), 4: ("<I", 0)}]
    multis = [multisample("Syn: Tone", zone(0, top=60, root=48, tune=-18.0), zone(1, top=120, root=72)),
              multisample("Drm: Hit", zone(1, fixed=True, channel=2)),
              multisample("Nothing", zone(2))]
    folder = tmp_path / "00-1003"
    write_bank(folder, words, samples, multis)
    return folder, mono, stereo.reshape(-1, 2)


def test_a_multisample_uuid_is_its_bank_and_its_place(bank_folder):
    bank = mb.Bank(bank_folder[0])
    assert list(bank.multisamples) == [uuid_of(b"\x00", 0x1003, i) for i in range(3)]
    assert bank.multisamples[uuid_of(b"\x00", 0x1003, 0)].name == "Syn: Tone"
    assert (bank.name, bank.author) == ("Modwave 1", "Korg")


def test_the_uuid_a_real_factory_multisample_has(tmp_path):
    folder = tmp_path / "00-1000"
    write_bank(folder, tone(8), [sample(0, 8)], [multisample("Piano", zone(0)), multisample("Piano 2", zone(0))], bank_id=0x1000)
    # (as the instrument lists it)
    assert "4b6f7267-0000-0000-0002-001001000000" in mb.Bank(folder).multisamples


def test_a_zones_keys_and_tuning_are_read(bank_folder):
    zones = mb.Bank(bank_folder[0]).multisamples[uuid_of(b"\x00", 0x1003, 0)].zones
    assert [(z.top_key, z.root_key) for z in zones] == [(60, 48), (120, 72)]
    assert zones[0].tune_cents == pytest.approx(-18.0)
    assert zones[1].tune_cents == 0.0


def test_where_a_sample_starts_loops_and_ends(bank_folder):
    zones = mb.Bank(bank_folder[0]).multisamples[uuid_of(b"\x00", 0x1003, 0)].zones
    assert (zones[0].start, zones[0].loop_start, zones[0].end, zones[0].one_shot) == (0, 100, 999, False)
    assert (zones[1].start, zones[1].end, zones[1].one_shot) == (7, 499, True)


def test_a_korg_banks_audio_comes_out_exact(bank_folder):
    folder, mono, stereo = bank_folder
    source = mb.Bank(folder).multisamples[uuid_of(b"\x00", 0x1003, 0)]
    x, rate = source.audio(source.zones[0])
    assert rate == 48000
    assert np.array_equal(np.round(x * 32768).astype(np.int16), mono)


def test_silence_in_a_korg_bank_is_the_word_the_instrument_fills_it_with(tmp_path):
    folder = tmp_path / "00-1003"
    write_bank(folder, np.zeros(16), [sample(0, 16)], [multisample("Quiet", zone(0))])
    raw = next(f for f in folder.iterdir() if f.name.endswith("00000000")).read_bytes()
    assert raw[mb.AUDIO_AT:mb.AUDIO_AT + 2] == struct.pack("<H", 0x69AD)
    source = mb.Bank(folder).multisamples[uuid_of(b"\x00", 0x1003, 0)]
    assert not source.audio(source.zones[0])[0].any()


def test_the_owners_own_bank_is_plain_and_has_its_own_uuids(tmp_path):
    folder = tmp_path / "02-0000"
    own = uuid.UUID(int=7).bytes
    words = tone(100)
    write_bank(folder, words, [sample(0, 100)], [multisample("Mine", zone(0), own_uuid=own)], bank=b"\x02", bank_id=0, name="All")
    bank = mb.Bank(folder)
    assert not bank.scrambled
    source = bank.multisamples[str(uuid.UUID(bytes=own))]
    assert np.array_equal(np.round(source.audio(source.zones[0])[0] * 32768).astype(np.int16), words)


def test_only_what_a_sample_holds_is_read_when_it_was_trimmed(tmp_path):
    # (the owner's bank says how long the file was, and stores it from where it starts to where it ends)
    folder = tmp_path / "02-0000"
    fields = sample(0, 100)
    fields[1][1][2] = ("<I", 5000)
    write_bank(folder, tone(100), [fields], [multisample("Mine", zone(0), own_uuid=uuid.UUID(int=7).bytes)], bank=b"\x02", bank_id=0)
    source = mb.Bank(folder).multisamples[str(uuid.UUID(int=7))]
    assert len(source.audio(source.zones[0])[0]) == 100


def test_stereo_is_mixed_unless_a_channel_is_asked_for(bank_folder):
    folder, _, stereo = bank_folder
    bank = mb.Bank(folder)
    source = bank.multisamples[uuid_of(b"\x00", 0x1003, 0)]
    z = source.zones[1]
    x, rate = source.audio(z)
    assert rate == 44100
    assert x == pytest.approx(stereo.mean(axis=1) / 32768)
    assert source.audio(z, 1)[0] == pytest.approx(stereo[:, 0] / 32768)
    assert source.audio(z, 2)[0] == pytest.approx(stereo[:, 1] / 32768)


def test_a_zone_can_insist_on_a_channel(bank_folder):
    folder, _, stereo = bank_folder
    source = mb.Bank(folder).multisamples[uuid_of(b"\x00", 0x1003, 1)]
    assert source.audio(source.zones[0])[0] == pytest.approx(stereo[:, 1] / 32768)


def test_a_sample_start_offset_picks_a_start_as_the_instrument_does(bank_folder):
    z = mb.Bank(bank_folder[0]).multisamples[uuid_of(b"\x00", 0x1003, 1)].zones[0].sample
    assert [z.start_of(n) for n in (0, 1, 2, 3, 7, 8, 10)] == [7, 11, 22, 0, 70, 80, 0]


def test_a_zone_with_no_audio_is_left_out(bank_folder):
    assert mb.Bank(bank_folder[0]).multisamples[uuid_of(b"\x00", 0x1003, 2)].zones == []


def test_a_file_that_isnt_a_bank_says_so(tmp_path):
    folder = tmp_path / "00-1003"
    write_bank(folder, tone(8), [sample(0, 8)], [multisample("x", zone(0))])
    next(f for f in folder.iterdir() if "-0001-" in f.name).write_bytes(bytes(64))
    with pytest.raises(ValueError, match="isn't a sample bank"):
        mb.Bank(folder)


def test_every_bank_under_a_folder_is_read(tmp_path):
    write_bank(tmp_path / "00-1000", tone(8), [sample(0, 8)], [multisample("a", zone(0))], bank_id=0x1000)
    write_bank(tmp_path / "00-1003", tone(8), [sample(0, 8)], [multisample("b", zone(0))])
    assert {m.name for m in mb.read_banks(tmp_path).values()} == {"a", "b"}


# ---- A Sample Builder file's tuning ----


def varint(v):
    out = bytearray()
    while v > 0x7F:
        out.append(v & 0x7F | 0x80)
        v >>= 7
    out.append(v)
    return bytes(out)


def test_a_sample_builder_files_tuning_is_in_tenths_of_a_cent(tmp_path):
    def text(n, b):
        return varint(n << 3 | 2) + varint(len(b)) + b
    inner = text(1, b"a.wav") + varint(2 << 3) + varint(0) + varint(4 << 3) + varint(100)
    z = text(1, inner) + varint(3 << 3) + varint(127) + varint(4 << 3) + varint(60) + varint(6 << 3 | 5) + struct.pack("<f", -180.0)
    content = text(5, z)
    path = tmp_path / "x.korgmultisample"
    path.write_bytes(b"Korg" + struct.pack("<I", len(content)) + content)
    assert korg.read_multisample(path).zones[0].tune_cents == pytest.approx(-18.0)


# ---- What the importer makes of them ----


SET = uuid.UUID(bytes=b"Korg" + bytes(4) + b"\x00\x02" + struct.pack("<HI", 0x1003, 0)).bytes


def sample_oscillator(offset=None, channel=None):
    reference = {"uuid": SET}
    if channel:
        reference["channel_select"] = channel
    set_zone = {"multisample_reference": reference, "level_percent": 100.0}
    if offset:
        set_zone["sample_start_offset"] = offset
    return {"oscillator_type": ip(2), "pcm_osc": {"multi_sample_set": {"velocity_zone": [set_zone]}},
            "morph_type": ip(0), "morph_amount_percent": fp(0.0), "level_percent": fp(100.0)}


def imported(tmp_path, *zones, words=None, samples=None, osc=None):
    words = tone(48000) if words is None else words
    folder = tmp_path / "bank" / "00-1003"
    write_bank(folder, words, samples or [sample(0, len(words), loop=24000)], [multisample("Syn: Tone", *zones)])
    tables = im.Tables(tmp_path / "out" / "FAIRWAVE" / "MODWAVE", a_library(), mb.read_banks(folder.parent))
    text, why = im.translate("TEST", {}, [(a_program(oscillator1=osc or sample_oscillator()), {}, 0)], {}, 120.0, tables, "test")
    assert text is not None, why
    f = parse(text.encode())
    assert (f.skipped, f.first_skipped) == (0, 0), text
    return text, f, tables


def pitch_of_text(text):
    """A patch's first oscillator's `TUNE` and `FINE`, in cents."""
    section = text[text.index("[OSC 1]"):text.index("[OSC 2]")]
    fine = re.search(r"FINE = (-?\d+)", section)
    return 100 * int(re.search(r"TUNE = (-?\d+)", section).group(1)) + (int(fine.group(1)) if fine else 0)


def test_a_factory_sample_becomes_a_patch(tmp_path):
    text, f, tables = imported(tmp_path, zone(0))
    assert "READ = SAMPLE" in text
    assert "the sample Syn: Tone" in text
    assert "CV 1 > PITCH 1" in text
    assert len(tables.written) == 1


def test_a_sample_sounds_at_its_root_key_when_its_key_is_played(tmp_path):
    words = tone(48000)
    text, f, tables = imported(tmp_path, zone(0, root=60))
    table = next(iter(tables.recordings.values()))
    assert pitch_of_text(text) == pytest.approx(1200 * np.log2(table.rate / table.frame_len / C4_HZ), abs=0.51)


def test_a_zones_tuning_is_in_cents(tmp_path):
    plain, _, _ = imported(tmp_path / "a", zone(0, root=60))
    tuned, _, _ = imported(tmp_path / "b", zone(0, root=60, tune=-18.0))
    assert pitch_of_text(tuned) - pitch_of_text(plain) == pytest.approx(-18, abs=1)


def test_a_root_an_octave_up_plays_an_octave_down(tmp_path):
    plain, _, _ = imported(tmp_path / "a", zone(0, root=60))
    higher, _, _ = imported(tmp_path / "b", zone(0, root=72))
    assert pitch_of_text(higher) - pitch_of_text(plain) == pytest.approx(-1200, abs=1)


def test_a_samples_own_rate_sets_its_speed(tmp_path):
    words = tone(48000)
    a, _, ta = imported(tmp_path / "a", zone(0), words=words, samples=[sample(0, 48000, loop=24000, rate=48000)])
    b, _, tb = imported(tmp_path / "b", zone(0), words=words, samples=[sample(0, 48000, loop=24000, rate=24000)])
    assert pitch_of_text(b) - pitch_of_text(a) == pytest.approx(-1200, abs=2)


def test_the_zone_for_the_note_is_the_one_played(tmp_path):
    low, high = tone(4096, 100.0), tone(4096, 900.0)
    samples = [sample(0, 4096, one_shot=True), sample(8192, 4096, one_shot=True)]
    words = np.concatenate([low, high])
    _, _, tables = imported(tmp_path, zone(0, top=48), zone(1, top=127), words=words, samples=samples)
    table = next(iter(tables.recordings.values()))
    crossings = np.sum(np.diff(np.signbit(table.samples[:4096].astype(int))) != 0)
    assert crossings == pytest.approx(2 * 900 * 4096 / 48000, rel=0.1)


def test_a_fixed_pitch_sample_plays_as_recorded_at_0_v_and_cv_1_still_tunes_it(tmp_path):
    text, f, _ = imported(tmp_path, zone(0, root=72, fixed=True))
    free, _, _ = imported(tmp_path / "b", zone(0, root=60, fixed=True))
    assert pitch_of_text(text) == pitch_of_text(free), "its root key doesn't matter if no key moves it"
    assert "CV 1 > PITCH 1" in text, "every patch in the library takes CV 1 to a pitch"
    assert "plays at one pitch on every key" in text


def test_a_start_offset_starts_a_sample_later(tmp_path):
    words = np.concatenate([np.zeros(4096, dtype=np.int16), tone(44096)])
    samples = [sample(0, len(words), one_shot=True, others={7: ("numbers", [4096])})]
    _, _, tables = imported(tmp_path, zone(0), words=words, samples=samples, osc=sample_oscillator(offset=1))
    assert np.abs(next(iter(tables.recordings.values())).samples[:256]).max() > 1000


def test_a_channel_a_patch_selects_is_the_one_heard(tmp_path):
    left, right = tone(8192, 200.0), tone(8192, 2000.0)
    words = np.stack([left, right], axis=1).reshape(-1)
    samples = [sample(0, 8192, channels=2, one_shot=True)]
    _, _, tables = imported(tmp_path, zone(0), words=words, samples=samples, osc=sample_oscillator(channel=2))
    table = next(iter(tables.recordings.values()))
    crossings = np.sum(np.diff(np.signbit(table.samples[:8192].astype(int))) != 0)
    assert crossings == pytest.approx(2 * 2000 * 8192 / 48000, rel=0.1)


def test_a_multisample_with_no_audio_counts_as_not_here(tmp_path):
    folder = tmp_path / "bank" / "00-1003"
    write_bank(folder, tone(8), [{1: ("table", {0: ("<b", 1)}), 4: ("<I", 0)}], [multisample("Nothing", zone(0))])
    tables = im.Tables(tmp_path / "out" / "FAIRWAVE" / "MODWAVE", a_library(), mb.read_banks(folder.parent))
    text, why = im.translate("TEST", {}, [(a_program(oscillator1=sample_oscillator()), {}, 0)], {}, 120.0, tables, "test")
    assert text is None
    assert why == "needs the modwave's own samples"


def played_pitch_error(text, tables, source_rate, root, played=60):
    """How many cents a patch's first oscillator is off what its sample should sound at, for the key 0 V plays."""
    table = max(tables.recordings.values(), key=lambda t: t.rate)
    frames_a_second = C4_HZ * 2 ** (pitch_of_text(text) / 1200)
    speed = frames_a_second * table.frame_len / table.rate
    return 1200 * np.log2(speed) - 100 * (played - root)


@pytest.mark.parametrize("root", [84, 96, 106, 120])
def test_a_sample_far_under_its_root_is_still_in_tune(tmp_path, root):
    text, _, tables = imported(tmp_path, zone(0, root=root), words=tone(16384), samples=[sample(0, 16384, loop=8192, rate=30200)])
    assert pitch_of_text(text) > -4850
    assert played_pitch_error(text, tables, 30200, root) == pytest.approx(0, abs=1)


def test_a_long_recording_far_under_its_root_is_still_in_tune(tmp_path):
    text, _, tables = imported(tmp_path, zone(0, root=96), words=tone(530_000), samples=[sample(0, 530_000, one_shot=True, rate=44100)])
    assert pitch_of_text(text) > -4850
    assert played_pitch_error(text, tables, 44100, 96) == pytest.approx(0, abs=1)
    table = next(t for k, t in tables.recordings.items() if k[3] is not None)
    assert len(table.samples) <= im.MAX_RECORDING + table.frame_len


def test_a_long_loop_far_under_its_root_is_cut_and_still_comes_round(tmp_path):
    n = 370_000
    text, _, tables = imported(tmp_path, zone(0, root=96), words=tone(n, 110.25), samples=[sample(0, n, loop=70_000, rate=44100)])
    assert pitch_of_text(text) > -4850
    assert played_pitch_error(text, tables, 44100, 96) == pytest.approx(0, abs=1)
    table = next(t for k, t in tables.recordings.items() if k[3] is not None)
    assert table.loop_frame is not None
    assert table.frames <= im.MAX_LOOPED_FRAMES + 2


def test_what_has_frames_enough_is_left_alone():
    x = np.zeros(4096)
    assert im.for_its_speed(x, 48000, 0, 1000, 4095, False, 1.0) is None
    assert im.for_its_speed(x, 48000, 0, 1000, 4095, False, 0.2) is None


def test_recordings_that_dont_need_it_are_shared_between_speeds(tmp_path):
    _, _, tables = imported(tmp_path, zone(0, root=60))
    source = next(iter(tables.multisamples.values()))
    z = source.zones[0]
    assert tables.recording(source, z, 0, 0, 1.0) is tables.recording(source, z, 0, 0, 0.9)


def test_a_short_recording_goes_through_as_it_is():
    x = np.arange(100.0)
    assert im.within_memory(x, 48000, 3, 10, 90, False) == (x, 48000, 3, 10, 90)


def test_a_long_one_shot_is_cut_and_faded():
    x = np.ones(im.MAX_RECORDING * 2)
    y, rate, start, _, end = im.within_memory(x, 48000, 100, 0, len(x) - 1, True)
    assert rate == 48000
    assert end - start + 1 == im.MAX_RECORDING
    assert y[start] == 1.0
    assert y[end] == pytest.approx(0.0)
    assert x.min() == 1.0, "and its source is left as it was"


def test_a_long_loop_keeps_its_length_at_a_lower_rate():
    x = np.sin(2 * np.pi * 100 * np.arange(im.MAX_RECORDING + 240_000) / 48000)
    y, rate, start, loop_start, end = im.within_memory(x, 48000, 0, 120_000, len(x) - 1, False)
    assert rate == 24000
    assert end - start + 1 <= im.MAX_RECORDING
    assert loop_start == 60_000
    # 100 Hz at the new rate
    assert np.sum(np.diff(np.signbit(y[1000:25000])) != 0) == pytest.approx(200, abs=2)


def test_the_longest_recording_makes_a_table_any_two_of_which_fit_in_memory():
    x = np.sin(2 * np.pi * 100 * np.arange(im.MAX_RECORDING * 3) / 48000)
    table, _ = to_table(*im.within_memory(x, 48000, 0, 0, len(x) - 1, True), True)
    pool = 0x700000 - 0x10000 - sum(2 ** log2 * frames * 4 for log2, frames in
                                    ((11, 31), (8, 16), (9, 25), (9, 65), (9, 48), (9, 48), (9, 48), (9, 48), (9, 63), (8, 32), (9, 32)))
    assert 2 * len(table.samples) * 4 <= pool
