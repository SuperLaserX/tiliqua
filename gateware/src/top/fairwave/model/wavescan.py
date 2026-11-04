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
    pos         Q14.16        frames, signed: past the table's ends is what wrap and mirror are for
    shift       Q11.6         frames per cycle, signed (18 bits)
    level       U1.16         0x10000 is unity; above that the output saturates

Every shift is arithmetic (rounds down), as in the gateware.

**Band-limited levels.** A long frame read at a high pitch skips samples, and what it skips comes
back as aliasing. So under each table the CPU can keep the same frames at half the length, a
quarter, and so on, each with only the harmonics a pitch that reads it can use (`mip_rows`,
`pack_table`). A level holds half the harmonics its length could: linear interpolation's own images
are what is left otherwise, and this takes another 10 to 16 dB off the aliasing. They sit straight
after the table, a row of one frame's length for each frame, one level after another within the row:

    frame f, level j >= 1, word w:      row frames + f, word (j - 1 ones, then a zero, then w)

The row's word index has `frame_log2` - 1 bits, so this is a prefix code: a mask, not an adder.
`max_level` says how many levels are there to read: 0 until the CPU has made them.

**Reading styles.** `stepped` keeps to one frame instead of blending two, as the wavetable
machines of the early 80s did. `raw` keeps to one sample instead of interpolating two.

**Cross modulation** (`both`). One layer, the modulator, is computed first; the other, the carrier,
then uses its output, level and all, so its envelope sets the amount as on any FM synth.

    pm      the carrier's read phase moves by depth * modulator. 100% is 2 cycles either way
            (an FM index of 12.6) at the modulator's full 5 V.
    lock    the modulator is read at the carrier's own phase, so its table is the curve the
            carrier's phase is bent by: phase distortion. The pitch is the carrier's alone and
            every partial stays a harmonic. (A triangle here gives the Casio CZ's own bent saw.)
    ring    the carrier is multiplied by 1 + depth * (modulator - 1), with the modulator as +-1
            at full 5 V: at 100%, carrier times modulator. Half that depth is classic AM,
            carrier times (1 + modulator) / 2, so the firmware's AM needs nothing more here.
"""

from dataclasses import dataclass

CLAMP, WRAP, MIRROR = 0, 1, 2

ONE = 1 << 16
# A layer at 100% reaches this at the jack: 5 V (`modulation.py`'s UNITY_LEVEL of full scale).
MOD_FULL = 20000
# The depth that makes `modulator * depth` 2**31, near enough, at MOD_FULL: 100%.
DEPTH_FULL = (1 << 31) // MOD_FULL

# Levels stop at frames of this length.
MIN_LOG2 = 3

# A half-band filter, Q15: 39 taps, of which these are the ones that aren't zero. Pass to 0.2 of the
# sample rate within 0.01 dB, stop from 0.3 by 60 dB. (Kaiser window, beta 6.) They add up to a
# quarter, so DC stays exact both ways.
HALF_BAND = (10350, -3246, 1721, -1015, 606, -349, 187, -89, 35, -8)
HALF_BAND_CENTRE = 1 << 14


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
    max_level: int = 0      # band-limited levels there are to read
    stepped: int = 0        # one frame, not a blend of two
    raw: int = 0            # one sample, not a blend of two

    def table_reg(self):
        """The `table` register's value (one register, so a table changes atomically)."""
        return self.table_base | (self.frame_log2 - 8) << 16 | (self.frames - 1) << 18 | self.max_level << 28

    def ctrl_reg(self, grain=0):
        return self.edge | self.stepped << 2 | self.raw << 3 | grain << 4


@dataclass
class Cross:
    """How one layer modulates the other: the routing register's top bits, and the depth."""
    ring: int = 0
    pm: int = 0
    lock: int = 0
    modulator: int = 0      # which layer: the other is the carrier
    depth: int = 0          # DEPTH_FULL is 100%

    def word(self):
        return self.ring | self.pm << 1 | self.lock << 2 | self.modulator << 3


def frame_coords(layer, phase=None):
    """The two frames to read and the blend between them (U0.16)."""
    phi = (layer.phase if phase is None else phase) >> 15   # the top 17 bits
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


def mip_level(layer, inc):
    """Which level to read at an increment: how many times to halve the step through the frame to
    bring it under 3 samples a sample. A level holds harmonics up to 0.2 of its length, so at 3 they
    reach 0.6 of the sample rate and at 1.5 they reach 0.3. That is half way between folding a
    little back near the very top, where it is both quiet and hard to hear, and losing too much."""
    halves = inc >> (31 - layer.frame_log2)         # the step, in half samples
    if halves < 4:
        return 0
    top = halves.bit_length() - 1
    return min(top - 2 + ((halves >> (top - 1)) & 1), layer.max_level)


def word_read(layer, mem, frame, word, level=0):
    k = layer.frame_log2
    row = frame if level == 0 else frame + layer.frames
    prefix = ((1 << (k - 1)) - 1) & ~((1 << (k - level)) - 1)
    return mem.get((layer.table_base << 6) + (row << (k - 1)) + (word | prefix), 0)


def s16(x):
    return x - 0x10000 if x & 0x8000 else x


def read_pair(layer, mem, frame, index, level=0):
    """Samples `index` and `index` + 1 of `frame` at `level` (wrapping round the frame)."""
    half = 1 << (layer.frame_log2 - level - 1)      # words in a frame
    w = index >> 1
    if index & 1:
        hi = word_read(layer, mem, frame, w, level) >> 16
        lo = word_read(layer, mem, frame, (w + 1) & (half - 1), level) & 0xFFFF
        return s16(hi), s16(lo)
    word = word_read(layer, mem, frame, w, level)
    return s16(word & 0xFFFF), s16(word >> 16)


def saturate(x):
    return max(-32768, min(32767, x))


def sample(layer, mem, phase=None, inc=None):
    """The layer's output at its current phase, before the phase advances: or read at `phase`,
    moving at `inc`, if it is following something else."""
    if layer.level == 0:
        return 0
    phase = layer.phase if phase is None else phase
    level = mip_level(layer, layer.inc if inc is None else inc)
    k = layer.frame_log2 - level
    index = phase >> (32 - k)
    fi = 0 if layer.raw else (phase >> (16 - k)) & 0xFFFF
    f0, f1, ff = frame_coords(layer, phase)
    if layer.stepped:
        ff = 0

    x0, x1 = read_pair(layer, mem, f0, index, level)
    out = x0 + (((x1 - x0) * fi) >> 16)
    if ff != 0 and f0 != f1:
        x0, x1 = read_pair(layer, mem, f1, index, level)
        bot = x0 + (((x1 - x0) * fi) >> 16)
        out += ((bot - out) * ff) >> 16
    out = (out * layer.level) >> 16
    return saturate(out)


def both(layers, mem, cross=None):
    """Two layers' outputs, with whatever one does to the other."""
    if cross is None or not (cross.ring or cross.pm or cross.lock):
        return [sample(layers[0], mem), sample(layers[1], mem)]
    modulator, carrier = layers[cross.modulator], layers[1 - cross.modulator]
    if cross.lock:
        m = sample(modulator, mem, phase=carrier.phase, inc=carrier.inc)
    else:
        m = sample(modulator, mem)
    # (one multiplier and one operand for both: the firmware never sets ring and pm together)
    product = (m - MOD_FULL if cross.ring else m) * cross.depth
    phase = carrier.phase
    if cross.pm:
        phase = (phase + (product << 2)) & 0xFFFFFFFF
    c = sample(carrier, mem, phase=phase)
    if cross.ring and carrier.level != 0:
        # (18 bits: at the most a depth can be, it stays in them)
        gain = ((ONE + (product >> 15) + (1 << 17)) & 0x3FFFF) - (1 << 17)
        c = saturate((c * gain) >> 16)
    return [m, c] if cross.modulator == 0 else [c, m]


def render(layers, mem, n, on_sample=None, cross=None):
    """`n` samples of each layer, as lists of signed 16-bit values.

    `on_sample(i, layers)` may change the layers before sample `i` is computed.
    """
    out = [[] for _ in layers]
    for i in range(n):
        if on_sample:
            on_sample(i, layers)
        if cross:
            values = both(layers, mem, cross)
        else:
            values = [sample(layer, mem) for layer in layers]
        for o, v in zip(out, values):
            o.append(v)
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


def decimate(frame):
    """A frame at half the length, filtered to fit. It is one cycle, so the filter runs round it."""
    n = len(frame)
    out = []
    for i in range(0, n, 2):
        total = HALF_BAND_CENTRE * frame[i]
        for k, c in enumerate(HALF_BAND):
            d = 2 * k + 1
            total += c * (frame[(i - d) % n] + frame[(i + d) % n])
        out.append(saturate((total + (1 << 14)) >> 15))
    return out


def interpolate(frame):
    """A frame at twice the length: what it had, and the same filter's samples between them."""
    n = len(frame)
    out = []
    for i in range(n):
        total = 0
        for k, c in enumerate(HALF_BAND):
            total += c * (frame[(i - k) % n] + frame[(i + 1 + k) % n])
        out += [frame[i], saturate((total + (1 << 13)) >> 14)]
    return out


def levels_of(frame_log2):
    return frame_log2 - MIN_LOG2


def mip_rows(frames):
    """Each frame's row of levels: the same length as the frame, the unused end zero. A level is
    made by halving the length twice and then doubling it once, so it holds half what it could."""
    rows = []
    for frame in frames:
        row = []
        half = decimate(frame)
        for _ in range(levels_of(len(frame).bit_length() - 1)):
            quarter = decimate(half)
            row += interpolate(quarter)
            half = quarter
        rows.append(row + [0] * (len(frame) - len(row)))
    return rows


def pack_table(frames, base_word=0):
    """A table and its levels, as {word address: word}."""
    return pack_frames(list(frames) + mip_rows(frames), base_word)
