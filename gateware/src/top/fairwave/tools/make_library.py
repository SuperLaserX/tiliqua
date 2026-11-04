"""Makes the wavetables of the sound library: `library/FAIRWAVE/TABLES/*.WAV`.

    python src/top/fairwave/tools/make_library.py

Copy `library/FAIRWAVE` to the top of a FAT32 USB drive. The Browser starts there, and its `.fwp` patches
find these tables by themselves. Each table is 64 frames of 1024 samples, 16-bit, with its length stated
the way Serum states it. 1024 holds 512 harmonics, plenty for a bass, and a table takes a quarter of a
megabyte of the synth's memory with its band-limited levels.

FairWave has no filter, so a filter is made here: each frame is what a filter at some cutoff would leave,
and `POS` is the cutoff. An envelope on `POS` is a filter envelope, and the cutoff follows the note, as a
filter with full key tracking does. They are worked out from what each sound is, not copied from anything.
"""

import struct
from pathlib import Path

import numpy as np

LENGTH = 1024
FRAMES = 64
TOP = LENGTH // 2
HARMONICS = np.arange(1, TOP + 1, dtype=float)
PEAK = 32000
OVERSAMPLED = LENGTH * 16

HERE = Path(__file__).resolve().parent
OUT = HERE.parent / "library" / "FAIRWAVE" / "TABLES"

# Where each frame is, 0 to 1, for the tables below.
WAY = np.linspace(0, 1, FRAMES)


def taper():
    """Harmonics fade out at the top of what a frame can hold, so nothing rings at its very edge."""
    t = np.ones(TOP)
    start = int(TOP * 0.75)
    t[start:] = np.cos(np.linspace(0, np.pi / 2, TOP - start)) ** 2
    return t


def frame_of(spectrum):
    """A frame from harmonics' complex amplitudes, 1 being a sine at full scale (sine phase if real)."""
    x = np.zeros(TOP + 1, complex)
    x[1:] = -1j * np.asarray(spectrum, complex) * taper() * LENGTH / 2
    return np.fft.irfft(x, LENGTH)


def band_limited(wave):
    """A frame from a cycle worked out in the time domain at a high rate: what fits of its harmonics."""
    x = np.fft.rfft(wave)[:TOP + 1] / (len(wave) / LENGTH)
    x[0] = 0
    x[1:] *= taper()
    return np.fft.irfft(x, LENGTH)


def at_full_level(frames):
    """Every frame to the same peak: scanning changes the timbre, not the volume."""
    return np.array([f * PEAK / np.abs(f).max() for f in frames])


def lowpass(c, order=4):
    """A filter's gain at each harmonic, with its cutoff at harmonic `c`."""
    return 1 / np.sqrt(1 + (HARMONICS / c) ** (2 * order))


def ladder(c, k):
    """A four-pole ladder at harmonic `c` with resonance `k` (self-oscillates at 4), phase and all."""
    g = 1 / (1 + 1j * HARMONICS / c)
    return g ** 4 / (1 + k * g ** 4)


def sweep(lo, hi):
    """Cutoffs from `lo` to `hi`, evenly by ear."""
    return lo * (hi / lo) ** WAY


SAW = 1 / HARMONICS
SQUARE = (HARMONICS % 2 == 1) / HARMONICS


def sawlp():
    """A saw under a 24 dB filter: from nearly a sine at 0% to all of it at 100%."""
    return at_full_level([frame_of(SAW * lowpass(c)) for c in sweep(1.2, 300)])


def sqrlp():
    """The same with a square: hollow, odd harmonics only."""
    return at_full_level([frame_of(SQUARE * lowpass(c)) for c in sweep(1.2, 300)])


def acidlp():
    """A saw under a resonant ladder: the peak walks up the harmonics as a 303's does."""
    return at_full_level([frame_of(SAW * ladder(c, 3.3)) for c in sweep(1.5, 120)])


def phase_axis():
    return np.arange(OVERSAMPLED) / OVERSAMPLED


def sync():
    """Hard sync: a saw restarted every cycle, running up to 8 times as fast. It tears as it rises."""
    t = phase_axis()
    return at_full_level([band_limited(2 * ((t * r) % 1) - 1) for r in 1 + 7 * WAY ** 1.3])


def pwm():
    """A pulse from square to a sliver. Move `POS` slowly for a Juno's width modulation."""
    t = phase_axis()
    return at_full_level([band_limited(np.where(t < d, 1.0, -1.0)) for d in 0.5 + (0.03 - 0.5) * WAY])


def fold():
    """A sine into a wavefolder, an offset drifting in: odd harmonics, and then even ones as well."""
    t = phase_axis()
    s = np.sin(2 * np.pi * t)
    return at_full_level([band_limited(np.sin(np.pi * (0.12 + 3.4 * w) * s + 0.9 * w)) for w in WAY])


def subdrv():
    """A sine driven into saturation: a clean sub at 0%, a rounded square with an edge at 100%."""
    t = phase_axis()
    s = np.sin(2 * np.pi * t)
    return at_full_level([band_limited(np.tanh((0.3 + 12 * w ** 2) * s + 0.3 * w)) for w in WAY])


def growl():
    """FM into saturation, under a moving formant: a dark mutter at 0%, a tearing 'wow' at 100%. Put an
    LFO on `POS` and it wobbles."""
    t = phase_axis()
    frames = []
    for w in WAY:
        index = 0.25 + 7 * w
        y = np.sin(2 * np.pi * t + index * np.sin(4 * np.pi * t + 0.6 * index * np.sin(2 * np.pi * t)))
        x = np.fft.rfft(np.tanh(1.4 * y))[:TOP + 1]
        x[0] = 0
        centre = 2 * 30 ** w
        bump = 1 + 4 * np.exp(-np.log(HARMONICS / centre) ** 2 / (2 * 0.3 ** 2))
        x[1:] *= bump * lowpass(3 * centre, 2) * taper()
        frames.append(np.fft.irfft(x, LENGTH))
    return at_full_level(frames)


# Formants, from Peterson and Barney's men, in the order that moves least between neighbours.
VOWELS = [(300, 870, 2240), (570, 840, 2410), (730, 1090, 2440), (530, 1840, 2480), (270, 2290, 3010)]
# The note the formants are right for: C2, where the bass patches sit with nothing patched.
TALK_NOTE = 65.41


def talk():
    """A saw through a voice's formants, from U through O, A, E to I, at a bass note's pitch."""
    frames = []
    hertz = HARMONICS * TALK_NOTE
    for w in WAY:
        at = w * (len(VOWELS) - 1)
        i = min(int(at), len(VOWELS) - 2)
        f = at - i
        peaks = [a ** (1 - f) * b ** f for a, b in zip(VOWELS[i], VOWELS[i + 1])]
        gain = 0.25 / HARMONICS
        for peak, height, width in zip(peaks, (1, 0.7, 0.3), (110, 140, 200)):
            gain = gain + height * np.exp(-((hertz - peak) / width) ** 2)
        frames.append(frame_of(gain))
    return at_full_level(frames)


def ppg():
    """A digital table in the spirit of the early machines: four banks of very different harmonics, each
    cycle only 128 8-bit samples held to fill the frame, so its stair steps are part of the sound. Read
    them with `READ = STEPS` to hear each one as they did."""
    t = phase_axis()
    frames = []
    for k in range(FRAMES):
        bank, step = k // 16, k % 16
        if bank == 0:           # odd stacks, getting buzzier
            parts = [(2 * j + 1, 1 / (2 * j + 1) ** 0.7) for j in range(1 + step)]
        elif bank == 1:         # the fundamental and a cluster walking up
            centre = 4 + 2 * step
            parts = [(1, 1.0)] + [(centre + d, 0.8 - 0.25 * abs(d)) for d in range(-2, 3)]
        elif bank == 2:         # octaves, the top ones rising
            parts = [(2 ** j, (1 + step) / 16 if j > 2 else 1.0) for j in range(6)]
        else:                   # two pulses drawing apart, in harmonics
            parts = [(n, np.sin(np.pi * n * (0.03 + 0.03 * step)) ** 2 / n ** 0.4) for n in range(1, 48)]
        wave = sum(a * np.sin(2 * np.pi * n * t) for n, a in parts)
        wave = wave / np.abs(wave).max()
        held = np.round(wave[::OVERSAMPLED // 128] * 127) / 127
        frames.append(band_limited(np.repeat(held, OVERSAMPLED // 128)))
    return at_full_level(frames)


def reese():
    """Two saws slipping past each other: each frame has the second a little further round, and the table
    wraps seamlessly. A saw LFO on `POS` with `EDGE = WRAP` is a detuned pair inside one oscillator, beating
    at the LFO's rate on any note. Not levelled: the dip as they cancel is the sound."""
    mellow = SAW * lowpass(18, 2)
    frames = [frame_of(mellow * (1 + np.exp(2j * np.pi * HARMONICS * w))) for w in np.arange(FRAMES) / FRAMES]
    return np.array(frames) * PEAK / max(np.abs(f).max() for f in frames)


DRAWBARS = np.array([1, 2, 3, 4, 6, 8, 10, 12, 16])
ORGAN_STOPS = np.array([
    [8, 0, 0, 0, 0, 0, 0, 0, 0],    # flute alone
    [8, 8, 2, 0, 0, 0, 0, 0, 0],
    [8, 8, 8, 4, 0, 0, 0, 0, 0],    # the house organ
    [8, 8, 8, 8, 6, 4, 2, 0, 0],
    [8, 8, 8, 8, 8, 8, 8, 8, 8],    # everything
], dtype=float)


def organ():
    """A drawbar organ, the stops pulled out one by one."""
    frames = []
    for w in WAY:
        at = w * (len(ORGAN_STOPS) - 1)
        i = min(int(at), len(ORGAN_STOPS) - 2)
        stops = ORGAN_STOPS[i] + (ORGAN_STOPS[i + 1] - ORGAN_STOPS[i]) * (at - i)
        gain = np.zeros(TOP)
        gain[DRAWBARS - 1] = stops / 8
        frames.append(frame_of(gain))
    return at_full_level(frames)


def glass():
    """Sparse high harmonics in a moving band, for pads and bells. Fixed phases, so frames blend cleanly."""
    frames = []
    picks = (HARMONICS % 4 == 1) | (HARMONICS % 7 == 0) | (HARMONICS <= 2)
    for w in WAY:
        centre = 2 + 44 * w
        bump = np.exp(-np.log(HARMONICS / centre) ** 2 / (2 * 0.55 ** 2))
        gain = picks * bump / np.sqrt(HARMONICS)
        gain[0] = max(gain[0], 0.35)
        frames.append(frame_of(gain * np.exp(2j * np.pi * ((HARMONICS * 0.618) % 1))))
    return at_full_level(frames)


TABLES = {"SAWLP": sawlp, "SQRLP": sqrlp, "ACIDLP": acidlp, "SYNC": sync, "PWM": pwm, "FOLD": fold, "SUBDRV": subdrv,
          "GROWL": growl, "TALK": talk, "PPG": ppg, "REESE": reese, "ORGAN": organ, "GLASS": glass}


def wav_bytes(frames):
    samples = np.clip(np.round(frames), -32768, 32767).astype("<i2").tobytes()
    fmt = struct.pack("<HHIIHH", 1, 1, 48000, 96000, 2, 16)
    clm = f"<!>{LENGTH} 00000000 wavetable FairWave".encode()
    body = b"fmt " + struct.pack("<I", len(fmt)) + fmt
    body += b"clm " + struct.pack("<I", len(clm)) + clm + b"\0" * (len(clm) & 1)
    body += b"data" + struct.pack("<I", len(samples)) + samples
    return b"RIFF" + struct.pack("<I", 4 + len(body)) + b"WAVE" + body


def main():
    OUT.mkdir(parents=True, exist_ok=True)
    for name, make in TABLES.items():
        frames = make()
        assert frames.shape == (FRAMES, LENGTH), name
        (OUT / f"{name}.WAV").write_bytes(wav_bytes(frames))
        print(f"{name:8} {frames.shape[0]} x {frames.shape[1]}, peak {np.abs(frames).max():.0f}")


if __name__ == "__main__":
    main()
