"""The WaveScan oscillator, in integers: the definition the gateware must match
bit for bit (`fairwave/test_osc.py`).

A table is `frames` frames of 2**`frame_log2` signed 16-bit samples, laid end to end
and little-endian, in 32-bit PSRAM words. Both are per table: nothing assumes a
frame length, and two layers can hold tables of different lengths.

Each sample, one layer reads the table at (phase, frame), where the frame coordinate
follows the phase along a line:

    frame(phi) = pos + shift * phi      phi in [0, 1) is the cycle's phase

`shift` = 0 is a classic wavetable, `pos` choosing and blending frames. Otherwise one
cycle crosses several frames, reading across the table as if it were a 3D surface;
the sign is the direction. Past the table's ends the line clamps, wraps or mirrors.

Number formats:

    phase, inc  u32           one cycle is 2**32
    pos         Q10.16        frames, unsigned
    shift       Q11.6         frames per cycle, signed (18 bits)
    level       U1.16         0x10000 is unity; above that the output saturates

Every shift is arithmetic (rounds down), as in the gateware.
"""

from dataclasses import dataclass

CLAMP, WRAP, MIRROR = 0, 1, 2


@dataclass
class Layer:
    table_base: int = 0     # in units of 256 bytes
    frame_log2: int = 8     # 8 to 11: 256 to 2048 samples
    frames: int = 1         # 1 to 1024
    inc: int = 0
    pos: int = 0
    shift: int = 0
    level: int = 0x10000
    edge: int = CLAMP
    phase: int = 0

    def table_reg(self):
        """The `table` register's value (one register, so a table changes atomically)."""
        return self.table_base | (self.frame_log2 - 8) << 16 | (self.frames - 1) << 18

    def ctrl_reg(self):
        return self.level | self.edge << 17


def frame_coords(layer):
    """The two frames to read and the blend between them (U0.16)."""
    phi = layer.phase >> 15                         # the top 17 bits
    f = layer.pos + ((layer.shift * phi) >> 7)      # Q.16
    n, ff = f >> 16, f & 0xFFFF
    frames = layer.frames

    if layer.edge == CLAMP:
        if f < 0:
            return 0, 0, 0
        if n >= frames - 1:
            return frames - 1, frames - 1, 0
        return n, n + 1, ff

    # The floored modulo, from the remainder of the magnitude: for n < 0, ~n = -n - 1.
    def floor_mod(d):
        return n % d

    if layer.edge == WRAP:
        m = floor_mod(frames)
        return m, 0 if m + 1 == frames else m + 1, ff

    # MIRROR
    if frames == 1:
        return 0, 0, 0
    period = 2 * (frames - 1)
    m = floor_mod(period)
    if m < frames - 1:
        return m, m + 1, ff
    return period - m - 1, period - m, 0xFFFF - ff


def word_read(layer, mem, frame, word):
    return mem.get((layer.table_base << 6) + (frame << (layer.frame_log2 - 1)) + word, 0)


def s16(x):
    return x - 0x10000 if x & 0x8000 else x


def read_pair(layer, mem, frame, index):
    """Samples `index` and `index` + 1 of `frame` (wrapping round the frame)."""
    half = 1 << (layer.frame_log2 - 1)              # words in a frame
    w = index >> 1
    if index & 1:
        hi = word_read(layer, mem, frame, w) >> 16
        lo = word_read(layer, mem, frame, (w + 1) & (half - 1)) & 0xFFFF
        return s16(hi), s16(lo)
    word = word_read(layer, mem, frame, w)
    return s16(word & 0xFFFF), s16(word >> 16)


def sample(layer, mem):
    """The layer's output at its current phase, before the phase advances."""
    if layer.level == 0:
        return 0
    k = layer.frame_log2
    index = layer.phase >> (32 - k)
    fi = (layer.phase >> (16 - k)) & 0xFFFF
    f0, f1, ff = frame_coords(layer)

    x0, x1 = read_pair(layer, mem, f0, index)
    out = x0 + (((x1 - x0) * fi) >> 16)
    if ff != 0 and f0 != f1:
        x0, x1 = read_pair(layer, mem, f1, index)
        bot = x0 + (((x1 - x0) * fi) >> 16)
        out += ((bot - out) * ff) >> 16
    out = (out * layer.level) >> 16
    return max(-32768, min(32767, out))


def render(layers, mem, n, on_sample=None):
    """`n` samples of each layer, as lists of signed 16-bit values.

    `on_sample(i, layers)` may change the layers before sample `i` is computed.
    """
    out = [[] for _ in layers]
    for i in range(n):
        if on_sample:
            on_sample(i, layers)
        for layer, o in zip(layers, out):
            o.append(sample(layer, mem))
        for layer in layers:
            layer.phase = (layer.phase + layer.inc) & 0xFFFFFFFF
    return out


def pack_frames(frames, base_word=0):
    """Frames of signed 16-bit samples (each an even length) as {word address: word}."""
    mem = {}
    word = base_word
    for frame in frames:
        for i in range(0, len(frame), 2):
            mem[word] = (frame[i] & 0xFFFF) | (frame[i + 1] & 0xFFFF) << 16
            word += 1
    return mem
