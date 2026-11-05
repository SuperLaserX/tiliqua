"""`tools/samples.py`: a recording made into a table, and what comes out of the models when it plays."""

import math
import sys
from pathlib import Path

import numpy as np
import pytest

from .modulation import C4_HZ, Modulation
from .patchfile import SAMPLE, configure, default_settings, layers_for, patch_of, read_wav
from .wavescan import CLAMP, WRAP, advance, both, pack_frames

sys.path.insert(0, str(Path(__file__).resolve().parent.parent / "tools"))

from samples import (concatenated, flatten, frame_percent, hz_of, midi_of, pitch_of, read_audio, to_table, tune_of,  # noqa: E402
                     wav_bytes)

FS = 48000


def sine(hz, n, rate):
    return 0.8 * np.sin(2 * np.pi * hz * np.arange(n) / rate)


def wav_of(table):
    return read_wav(wav_bytes(table.samples, table.frame_len, table.rate))


def play(table, semitones, cents, seconds, edge, loop_frame=0):
    """The table through the models, with its gate and CV at nothing."""
    frames = wav_of(table)
    s = default_settings()
    tenths = frame_percent(loop_frame, len(frames))
    for layer in s["layers"]:
        layer |= dict(read=SAMPLE, semitones=semitones, fine=cents, position=0, edge=edge, shift=tenths)
    s["envs"][0]["vca"] = 0
    s["slots"] = []
    s["outs"] = [1, 1, 0, 0]
    patch = patch_of(s)
    layers = layers_for(patch, [(0x8000, frames), (0x8000, frames)])
    mem = pack_frames(frames, base_word=0x8000 << 6)
    m = Modulation()
    configure(m, patch, layers)
    m.patched = 1
    out = np.zeros(int(seconds * FS))
    for i in range(len(out)):
        m.step([0, 0, 0, 0])
        m.apply(layers)
        l1, l2 = both(layers, mem, m.cross())
        out[i] = m.mix(l1, l2)[0]
        for layer in layers:
            advance(layer)
    return out


def peak_frequency(x):
    n = len(x)
    f = np.abs(np.fft.rfft(x * np.hanning(n), 8 * n))
    return np.fft.rfftfreq(8 * n, 1 / FS)[np.argmax(f)]


@pytest.mark.parametrize("rate,natural,target", [(30200, 235.9, 261.63), (48000, 440.0, 261.63), (44100, 130.8, 65.41)])
def test_a_tuned_recording_sounds_its_target_at_0v(rate, natural, target):
    """The whole way: table, then settings, then the models' oscillator."""
    table, _ = to_table(sine(natural, rate // 2, rate), rate, 0, 0, rate // 2 - 1, True)
    semitones, cents = tune_of(table, natural, target)
    assert -48 <= semitones <= 48 and -50 <= cents <= 50
    got = peak_frequency(play(table, semitones, cents, 0.25, CLAMP))
    assert abs(1200 * math.log2(got / target)) < 3


def test_a_loop_lands_on_frames_and_at_the_tables_end():
    rate = 30200
    x = sine(236.0, 16384, rate)
    table, frames = to_table(x, rate, 11, 8064, 15823, False)
    assert len(table.samples) == frames * table.frame_len
    assert table.frame_len == 256
    assert 0 < table.loop_frame < frames


def test_a_loop_is_stretched_a_little_and_the_tuning_says_so():
    rate = 30200
    # Seven whole cycles in a loop no number of frames would hold exactly.
    period = 128.3
    n = int(period * 400)
    x = 0.8 * np.sin(2 * np.pi * np.arange(n) / period)
    loop_len = int(round(period * 7))
    loop_start = n - loop_len - 300
    table, _ = to_table(x, rate, 0, loop_start, loop_start + loop_len - 1, False)
    assert table.rate >= rate, "and it only ever gets more samples, so nothing's lost"
    assert table.rate / rate < 1.5


def test_a_loop_goes_on_round_when_the_model_plays_it():
    rate = 48000
    n = 3000
    # A period a loop holds a whole number of, so a slip anywhere would show as a click: no sample jumps by more
    # than a sine at this pitch can.
    period = 64
    x = 0.8 * np.sin(2 * np.pi * np.arange(n + period * 8) / period)
    table, _ = to_table(x, rate, 0, 1000, 1000 + period * 8 - 1, False)
    semitones, cents = tune_of(table, rate / period, rate / period)
    out = play(table, semitones, cents, 1.0, WRAP, table.loop_frame)
    steepest = np.abs(np.diff(out)).max()
    allowed = np.abs(out).max() * 2 * math.pi / period * 1.15
    assert np.abs(out).max() > 5000
    assert steepest <= allowed, f"a jump of {steepest:.0f}, where a sine has {allowed:.0f}"


def test_a_loop_that_clicks_is_drawn_together():
    rate = 30200
    n = 8000
    # Half a cycle too many: a recording's loop whose end is nowhere near its start.
    x = 0.8 * np.sin(2 * np.pi * np.arange(n) / 100)
    table, _ = to_table(x, rate, 0, 1000, 1000 + 2050 - 1, False)
    end, start = int(table.samples[-1]), int(table.samples[table.loop_frame * table.frame_len])
    steepest = int(np.abs(np.diff(table.samples.astype(int))).max())
    assert abs(end - start) <= 2 * steepest


def test_a_one_shot_ends_silent_and_stays_there():
    rate = 48000
    table, _ = to_table(sine(440, 4000, rate), rate, 0, 0, 3999, True)
    assert table.loop_frame is None
    semitones, cents = tune_of(table, 440, 440)
    out = play(table, semitones, cents, 0.2, CLAMP)
    assert np.abs(out[:2000]).max() > 5000
    assert np.abs(out[6000:]).max() == 0


def test_every_frame_can_be_landed_on_by_a_percentage():
    for frames in (2, 16, 64, 256, 512):
        ones = 1 << 16
        for frame in range(frames):
            tenths = frame_percent(frame, frames)
            assert (tenths * ones // 1000 * (frames - 1)) >> 16 == frame


def test_several_recordings_each_start_on_a_frame():
    rate = 30200
    table = concatenated([(sine(200, 5000, rate), rate), (sine(300, 1000, rate), rate), (sine(400, 2600, rate), rate)])
    frames = len(table.samples) // table.frame_len
    assert table.starts[0] == 0 and sorted(table.starts) == table.starts and table.starts[-1] < frames
    for start in table.starts:
        at = start * table.frame_len
        assert np.abs(table.samples[at:at + table.frame_len]).max() > 10000
    assert table.loop_frame is None


def test_flattening_evens_a_decay_out():
    rate = 48000
    n = rate * 2
    y = sine(300, n, rate) * np.exp(-3 * np.arange(n) / rate)
    z = flatten(y, rate)
    level = lambda a: np.sqrt(np.mean(a ** 2))  # noqa: E731
    assert level(y[:rate // 4]) / level(y[-rate // 2:-rate // 4]) > 20
    assert level(z[rate // 8:rate // 4]) / level(z[-rate // 2:-rate // 4]) < 3.5


@pytest.mark.parametrize("hz", [59.0, 118.0, 236.0, 472.0, 944.0, 1650.0])
def test_a_pitch_is_measured_from_a_rich_tone(hz):
    rate = 30200
    t = np.arange(rate // 2) / rate
    x = sum(np.sin(2 * np.pi * hz * k * t) / k for k in range(1, 6) if hz * k < rate / 2)
    got, sure = pitch_of(x, rate)
    assert abs(1200 * math.log2(got / hz)) < 20
    assert sure > 0.7


def tone(partials, n=16384, rate=30200):
    t = np.arange(n) / rate
    return sum(a * np.sin(2 * np.pi * hz * t) for hz, a in partials)


def test_a_pitch_check_leaves_a_quiet_fundamental_alone():
    """A distorted guitar: its third harmonic is the lowest loud thing in it, and that isn't its pitch."""
    from make_fairlight import checked_against_spectrum
    assert checked_against_spectrum(tone([(236, 0.1), (708, 1.0), (1180, 0.6)]), 30200, 236.0) == 236.0


def test_a_pitch_check_leaves_a_subharmonic_alone():
    from make_fairlight import checked_against_spectrum
    assert checked_against_spectrum(tone([(236, 1.0), (472, 0.6)]), 30200, 472.0) == 472.0


def test_a_pitch_check_corrects_what_a_formant_fooled():
    from make_fairlight import checked_against_spectrum
    got = checked_against_spectrum(tone([(892, 1.0), (1784, 0.5)]), 30200, 1066.0)
    assert abs(got - 892) < 5


def test_midi_notes_and_hz_agree():
    assert abs(hz_of(69) - 440) < 1e-9
    assert abs(midi_of(261.6256) - 60) < 1e-3
    assert abs(hz_of(60) - C4_HZ) < 1e-3


@pytest.mark.parametrize("kind,bits", [("pcm8", 8), ("pcm16", 16), ("pcm24", 24), ("float", 32)])
def test_each_kind_of_wav_reads_as_the_same_signal(tmp_path, kind, bits):
    n = 2000
    x = sine(300, n, 48000)
    if kind == "pcm8":
        data = np.round(x * 127 + 128).astype(np.uint8).tobytes()
        tag = 1
    elif kind == "pcm16":
        data = np.round(x * 32767).astype("<i2").tobytes()
        tag = 1
    elif kind == "pcm24":
        v = np.round(x * 8388607).astype(np.int32)
        data = b"".join(int(s).to_bytes(3, "little", signed=True) for s in v)
        tag = 1
    else:
        data = x.astype("<f4").tobytes()
        tag = 3
    fmt = tag.to_bytes(2, "little") + (2).to_bytes(2, "little") + (48000).to_bytes(4, "little")
    fmt += (48000 * 2 * bits // 8).to_bytes(4, "little") + (2 * bits // 8).to_bytes(2, "little") + bits.to_bytes(2, "little")
    stereo = b"".join(data[i:i + bits // 8] * 2 for i in range(0, len(data), bits // 8))
    body = b"fmt " + len(fmt).to_bytes(4, "little") + fmt + b"data" + len(stereo).to_bytes(4, "little") + stereo
    path = tmp_path / "t.wav"
    path.write_bytes(b"RIFF" + (4 + len(body)).to_bytes(4, "little") + b"WAVE" + body)
    got, rate = read_audio(path)
    assert rate == 48000
    assert np.abs(got - x).max() < 0.02
