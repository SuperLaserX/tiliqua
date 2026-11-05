"""Turns a recording into a table `READ = SAMPLE` can play: 16-bit mono, whole frames, its loop on a boundary.

A sample's loop can only start on a frame and has to end at the table's end, so the frame length (256, the
shortest there is) is what a loop gets lined up to. Lining it up means playing the recording about one part
in fifty faster or slower, which `tune_of` puts back, and turning the loop round to begin a little later.
"""

import math
import struct
from dataclasses import dataclass
from pathlib import Path

import numpy as np
from scipy.signal import resample as fourier_resample
from scipy.signal import resample_poly

C4_HZ = 261.62558
FRAME_LENGTHS = (256, 512, 1024, 2048)
MAX_FRAMES = 1024
# A loop lands on a frame only so finely: a patch's `LOOP` is in tenths of a percent.
MAX_LOOPED_FRAMES = 512
PEAK = 30000.0
END_FADE_SECONDS = 0.004


def read_audio(path):
    """(samples from -1 to 1, mono, as float; sample rate)."""
    b = Path(path).read_bytes()
    if b[:4] != b"RIFF" or b[8:12] != b"WAVE":
        raise ValueError(f"{path}: not a WAV")
    at, rate, bits, channels, tag, data = 12, 0, 0, 1, 1, b""
    while at + 8 <= len(b):
        kind, size = b[at:at + 4], int.from_bytes(b[at + 4:at + 8], "little")
        if kind == b"fmt ":
            tag = int.from_bytes(b[at + 8:at + 10], "little")
            channels = int.from_bytes(b[at + 10:at + 12], "little")
            rate = int.from_bytes(b[at + 12:at + 16], "little")
            bits = int.from_bytes(b[at + 22:at + 24], "little")
            if tag == 0xFFFE:
                tag = int.from_bytes(b[at + 32:at + 34], "little")
        elif kind == b"data":
            data = b[at + 8:at + 8 + size]
        at += 8 + size + (size & 1)
    if bits == 8:
        x = (np.frombuffer(data, dtype=np.uint8).astype(float) - 128) / 128
    elif bits == 16:
        x = np.frombuffer(data[:len(data) & ~1], dtype="<i2").astype(float) / 32768
    elif bits == 24:
        n = len(data) // 3
        raw = np.frombuffer(data[:n * 3], dtype=np.uint8).reshape(n, 3)
        x = (raw[:, 0].astype(np.int32) | raw[:, 1].astype(np.int32) << 8 | raw[:, 2].astype(np.int8).astype(np.int32) << 16) / 8388608
    elif bits == 32 and tag == 3:
        x = np.frombuffer(data[:len(data) & ~3], dtype="<f4").astype(float)
    elif bits == 32:
        x = np.frombuffer(data[:len(data) & ~3], dtype="<i4").astype(float) / 2147483648
    else:
        raise ValueError(f"{path}: {bits}-bit, format {tag}")
    if channels > 1:
        x = x[:len(x) // channels * channels].reshape(-1, channels).mean(axis=1)
    return x, rate


def pitch_of(x, rate, lo=25.0, hi=2100.0):
    """(fundamental in Hz of the loudest part, how sure from 0 to 1), by YIN's difference function."""
    n = min(len(x), 8192)
    if n < 1024:
        return None, 0.0
    energy = np.convolve(x ** 2, np.ones(n) / n, "same")
    a = max(0, min(int(np.argmax(energy)) - n // 2, len(x) - n))
    w = x[a:a + n] - x[a:a + n].mean()
    if not np.any(w):
        return None, 0.0
    f = np.fft.rfft(w, 2 * n)
    r = np.fft.irfft(f * np.conj(f))[:n // 2]
    total = np.concatenate([[0.0], np.cumsum(w ** 2)])
    tau = np.arange(n // 2)
    d = total[n - tau] + (total[n] - total[tau]) - 2 * r
    d[0] = 0
    running = np.cumsum(d)
    cm = np.ones(n // 2)
    cm[1:] = d[1:] * tau[1:] / np.maximum(running[1:], 1e-12)
    t_min, t_max = max(2, int(rate / hi)), min(int(rate / lo), n // 2 - 2)
    if t_min >= t_max:
        return None, 0.0
    best = next((t for t in range(t_min, t_max) if cm[t] < 0.15 and cm[t] <= cm[t + 1]), None)
    if best is None:
        best = t_min + int(np.argmin(cm[t_min:t_max]))
    a2, b2, c2 = cm[best - 1], cm[best], cm[best + 1]
    bend = a2 - 2 * b2 + c2
    shift = 0.5 * (a2 - c2) / bend if bend else 0
    return rate / (best + shift), 1 - float(b2)


def midi_of(hz):
    return 69 + 12 * math.log2(hz / 440)


def hz_of(midi):
    return 440 * 2 ** ((midi - 69) / 12)


@dataclass
class Table:
    samples: np.ndarray     # int16
    frame_len: int
    rate: float             # of `samples`, after lining up
    loop_frame: int | None  # None: it plays once
    starts: list            # the frames each of its recordings starts on

    @property
    def frames(self):
        return len(self.samples) // self.frame_len


def stretch(x, ratio):
    """`x` at `ratio` times as many samples, band-limited."""
    if abs(ratio - 1) < 1e-9:
        return x
    n = round(ratio * 4096)
    g = math.gcd(n, 4096)
    return resample_poly(x, n // g, 4096 // g, window=("kaiser", 12.0))


def frame_len_for(samples, looped):
    limit = MAX_LOOPED_FRAMES if looped else MAX_FRAMES
    for length in FRAME_LENGTHS:
        if samples <= length * limit:
            return length
    raise ValueError(f"{samples} samples is too long for a table")


def fade_tail(y, rate):
    n = min(len(y), int(END_FADE_SECONDS * rate))
    if n > 1:
        y = y.copy()
        y[-n:] *= np.linspace(1, 0, n)
    return y


def one_shot(x, rate, start, end):
    y = x[start:end + 1]
    y = fade_tail(y - y.mean(), rate)
    length = frame_len_for(len(y), False)
    y = np.concatenate([y, np.zeros(-len(y) % length)])
    return y, length, float(rate), None


def joined(loop):
    """A recording's own loop can click where it comes round: if so, its end is drawn in to meet its start."""
    jump = loop[0] - loop[-1]
    if abs(jump) <= np.percentile(np.abs(np.diff(loop)), 98):
        return loop
    n = max(2, min(len(loop) // 4, 128))
    out = loop.copy()
    out[-n:] += jump * np.linspace(0, 1, n) ** 2
    return out


def looped(x, rate, start, loop_start, end):
    """The attack, then the loop, with the loop lined up to the frames."""
    attack = x[start:loop_start]
    loop = joined(x[loop_start:end + 1])
    length = frame_len_for(len(attack) + len(loop) + 256, True)
    # A short loop goes round more than once in the table: that costs nothing, and lands it nearer.
    wanted = max(length * 4, 2048)
    turns = max(1, math.ceil(wanted / len(loop)))
    body = np.tile(loop, turns)
    frames = max(1, math.ceil(len(body) / length))
    ratio = frames * length / len(body)
    body = fourier_resample(body, frames * length)
    head = stretch(attack, ratio) if len(attack) else attack
    # The loop's first part goes on the end of the attack, and so also ends the table: it has only turned round.
    extra = -len(head) % length
    y = np.concatenate([head, body[:extra], body[extra:], body[:extra]])
    loop_frame = (len(head) + extra) // length
    assert len(y) % length == 0
    return y, length, rate * ratio, loop_frame


def to_table(x, rate, start, loop_start, end, is_one_shot):
    x = x - x[start:end + 1].mean()
    if is_one_shot or loop_start >= end:
        y, length, new_rate, loop_frame = one_shot(x, rate, start, end)
    else:
        y, length, new_rate, loop_frame = looped(x, rate, start, loop_start, end)
    frames = len(y) // length
    return Table(scaled(y), length, new_rate, loop_frame, [0]), frames


def scaled(y):
    peak = np.abs(y).max()
    gain = PEAK / peak if peak > 0 else 1
    return np.clip(np.round(y * gain), -32768, 32767).astype(np.int16)


def concatenated(parts):
    """Several recordings as one table, each starting on a frame: (x, rate), played once each."""
    rate = parts[0][1]
    ys = [fade_tail(p - p.mean(), rate) if r == rate else fade_tail(stretch(p - p.mean(), rate / r), rate) for p, r in parts]
    ys = [y / max(np.abs(y).max(), 1e-9) for y in ys]
    total = sum(len(y) for y in ys)
    length = frame_len_for(total + 2048 * len(ys), False)
    starts, out = [], []
    at = 0
    for y in ys:
        starts.append(at)
        y = np.concatenate([y, np.zeros(-len(y) % length)])
        out.append(y)
        at += len(y) // length
    return Table(scaled(np.concatenate(out)), length, float(rate), None, starts)


def flatten(y, rate, amount=0.85):
    """A recording with its level evened out over time: for grains, which can read from anywhere in it."""
    n = max(1, int(0.25 * rate))
    level = np.sqrt(np.convolve(y ** 2, np.ones(n) / n, "same"))
    level = np.maximum(level, level.max() * 0.02)
    return y / level ** amount


def wav_bytes(samples, length, rate=48000):
    data = samples.astype("<i2").tobytes()
    fmt = struct.pack("<HHIIHH", 1, 1, int(round(rate)), int(round(rate)) * 2, 2, 16)
    clm = f"<!>{length} 00000000 sample FairWave".encode()
    body = b"fmt " + struct.pack("<I", len(fmt)) + fmt
    body += b"clm " + struct.pack("<I", len(clm)) + clm + b"\0" * (len(clm) & 1)
    body += b"data" + struct.pack("<I", len(data)) + data
    return b"RIFF" + struct.pack("<I", 4 + len(body)) + b"WAVE" + body


def write_table(path, table):
    path = Path(path)
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_bytes(wav_bytes(table.samples, table.frame_len, table.rate))


def tune_of(table, natural_hz, target_hz):
    """(semitones, cents) for 0 V to sound `target_hz`, the recording's pitch at its own speed being `natural_hz`.
    A frame is a cycle to the oscillator, so its own speed is the frame's frequency at the table's rate."""
    cycle = target_hz * table.rate / (natural_hz * table.frame_len)
    cents = round(1200 * math.log2(cycle / C4_HZ))
    semitones = round(cents / 100)
    return semitones, cents - semitones * 100


def frame_percent(frame, frames):
    """A `POS` or `LOOP` to land on `frame`, in tenths of a percent, as `Modulation.finish` scales one."""
    if frame == 0 or frames <= 1:
        return 0
    ones = 1 << 16
    for tenths in range(frame * 1000 // (frames - 1), 2001):
        at = (tenths * ones // 1000 * (frames - 1)) >> 16
        if at == frame:
            return tenths
        if at > frame:
            break
    raise ValueError(f"frame {frame} of {frames} can't be landed on")


def percent_text(tenths):
    return f"{tenths // 10}.{tenths % 10}%" if tenths % 10 else f"{tenths // 10}%"
