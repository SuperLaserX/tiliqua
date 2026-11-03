"""Everything around the oscillators, in integers: inputs, envelopes, LFOs, the matrix, the
VCAs and the mixer. The definition the gateware must match bit for bit (`fairwave/test_mod.py`).

Once per output sample, in this order:

    INPUTS      the CVs are smoothed; the gates pass Schmitt triggers
    ENVELOPES   two DAHDSRs, which can loop
    LFOS        three
    MATRIX      twelve slots add source x amount onto nine destinations' base values
    FINISH      the destinations become the layers' increment, position, tilt and level;
                the envelopes routed to a layer's VCA multiply its level
    (the oscillators compute a sample of each layer: `model/wavescan.py`)
    MIX         the two layers crossfade into a mix; each output picks what it carries

Number formats:

    source      18 bits signed, 16000 to the volt (a quarter of a DAC count), so a CV keeps
                its resolution through the matrix: 0.06 mV, or 0.075 cents at 1 V/oct
    level, t    U1.16: ONE is full. An envelope's top and an LFO's peak are 5 V as sources.
    pitch       Q.16 octaves above C4
    position    U1.16, of the table; tilt: Q2.16, tables per cycle
    amount      18 bits signed: the slot adds (source * amount) >> 14

Every shift is arithmetic (rounds down), as in the gateware.

The firmware writes words, with the same layout as `write()` below: rates, curves and so on
are in `cpu/src/params.rs`. So the model is driven as the gateware is, and neither knows
about times in milliseconds.
"""

from dataclasses import dataclass, field

FS = 48000
C4_HZ = 261.62558

ONE = 1 << 16
VOLT = 16000
FULL = 5 * VOLT                 # 5 V as a source: an envelope's top
UNITY_LEVEL = 0x9C40            # a layer at 100%: table full scale becomes 5 V at the jack

# Sources, as a slot names them.
NONE, CV1, CV2, ENV1, ENV2, LFO1, LFO2, LFO3 = range(8)
# Destinations: four per layer, and the mix's balance.
PITCH, POS, SHIFT, LEVEL = range(4)
LAYER_DESTS = 4
BALANCE = 8
N_DESTS = 9
N_SLOTS = 12
AMOUNT_SHIFT = 14

# What an output can carry.
OUT_OFF, OUT_MIX, OUT_L1, OUT_L2, OUT_ENV1, OUT_ENV2, OUT_LFO1, OUT_LFO2, OUT_LFO3 = range(9)

# Envelope stages. A stage's rate is at its own number in an envelope's words.
IDLE, DELAY, ATTACK, HOLD, DECAY, SUSTAIN, RELEASE = range(7)
W_CTRL, W_SUSTAIN, W_CURVES = 0, 5, 7
LOOP_OFF, LOOP_GATED, LOOP_FREE = 0, 1, 2

SINE, TRI, SAW_UP, SAW_DOWN, SQUARE, RANDOM = range(6)

# The Schmitt triggers on the gate inputs, in DAC counts (4 to the mV).
GATE_HIGH = 6000                # 1.5 V
GATE_LOW = 3000                 # 0.75 V

# The CVs' one-pole: a time constant of 32 samples (0.67 ms, 240 Hz).
CV_SHIFT = 5
CV_FRAC = 10
# An empty jack is exactly 0 V, or tuning would depend on the board (`cpu/src/cv.rs`): a
# reading under this counts as nothing unless the jack's switch says it is patched.
CV_FLOOR = VOLT * 150 // 1000

# Pitch stops here: octaves below C4, and up to just under Nyquist at 48 kHz.
PITCH_MIN = -12 << 16
PITCH_MAX = (6 << 16) + 0x8000


def exp_rom(fs=FS):
    """257 increments, across the octave above C4 (the last is the next octave's first)."""
    base = C4_HZ / fs * 2 ** 32
    return [round(base * 2 ** (n / 256)) for n in range(257)]


def clamp(x, lo, hi):
    return lo if x < lo else hi if x > hi else x


def shape(u, c):
    """A segment's position `u` (U0.16) through its curve `c` (+-ONE): 0 is a straight line,
    -ONE starts fast and ends slow, like a capacitor, and +ONE the reverse. Exact at both
    ends, monotonic, and it stays in [0, ONE]. (The same map twice, for a stronger curve:
    at the extremes it is u^4 and 1 - (1 - u)^4.)"""
    for _ in range(2):
        u = u - ((c * ((u * (ONE - u)) >> 16)) >> 16)
    return u


def lfo_shape(kind, x, held):
    """A waveform at phase `x` (U0.16), as Q1.16 in [-ONE, ONE]. A cycle starts at 0, rising,
    where it has a choice. "Sine" is a parabola per half cycle: 3.8% third harmonic, and
    smooth, which is all an LFO needs."""
    if kind == SINE:
        s = x - 0x10000 if x & 0x8000 else x
        return (s * (0x8000 - abs(s))) >> 12
    if kind == TRI:
        if x < 0x4000:
            return x * 4
        if x < 0xC000:
            return 2 * ONE - x * 4
        return x * 4 - 4 * ONE
    if kind == SAW_UP:
        return x * 2 - ONE
    if kind == SAW_DOWN:
        return ONE - x * 2
    if kind == SQUARE:
        return ONE if x < 0x8000 else -ONE
    return held


@dataclass
class Envelope:
    """Words 0 to 7 as the firmware writes them, and the state."""
    words: list = field(default_factory=lambda: [0] * 8)
    stage: int = IDLE
    t: int = 0
    start: int = 0
    level: int = 0
    out: int = 0

    def enter(self, stage):
        self.stage, self.t, self.start = stage, 0, self.level

    def step(self, gates, rising):
        ctrl = self.words[W_CTRL]
        mask, loop = ctrl & 3, (ctrl >> 2) & 3
        gate = (gates & mask) != 0
        if rising & mask:
            self.enter(DELAY)
        elif loop != LOOP_FREE and not gate and self.stage not in (IDLE, RELEASE):
            self.enter(RELEASE)
        elif loop == LOOP_FREE and self.stage == IDLE:
            self.enter(DELAY)

        sustain = self.words[W_SUSTAIN]
        if self.stage == IDLE:
            self.level = 0
        elif self.stage == SUSTAIN:
            self.level = sustain
        else:
            rate = self.words[self.stage] or (1 << 32)      # 0 is one sample: 2**32
            total = self.t + rate
            carry = total >> 32
            self.t = total & 0xFFFFFFFF
            if self.stage in (ATTACK, DECAY, RELEASE):
                target = {ATTACK: ONE, DECAY: sustain, RELEASE: 0}[self.stage]
                if carry:
                    self.level = target
                else:
                    curves = self.words[W_CURVES]
                    at = {ATTACK: 0, DECAY: 10, RELEASE: 20}[self.stage]
                    c = (curves >> at) & 0x3FF
                    c = (c - 0x400 if c & 0x200 else c) << 8
                    y = shape(self.t >> 16, c)
                    self.level = self.start + (((target - self.start) * y) >> 16)
            if carry:
                self.t, self.start = 0, self.level
                self.stage = {
                    DELAY: ATTACK,
                    ATTACK: HOLD,
                    HOLD: DECAY,
                    DECAY: SUSTAIN if loop == LOOP_OFF else RELEASE,
                    RELEASE: DELAY if loop == LOOP_FREE or (loop == LOOP_GATED and gate) else IDLE,
                }[self.stage]
        self.out = (self.level * FULL) >> 16


@dataclass
class Lfo:
    """Words 0 to 2: the rate; offset (16), shape (3), unipolar (1), sync mask (2); the
    amplitude as a source (FULL at 100%)."""
    words: list = field(default_factory=lambda: [0] * 3)
    phase: int = 0
    held: int = 0
    out: int = 0

    def step(self, rising, random17):
        rate, ctrl, amp = self.words
        offset, kind, uni, sync = ctrl & 0xFFFF, (ctrl >> 16) & 7, (ctrl >> 19) & 1, (ctrl >> 20) & 3
        total = self.phase + rate
        wrapped = (total >> 32) != 0
        self.phase = total & 0xFFFFFFFF
        if rising & sync:
            self.phase, wrapped = 0, True
        if wrapped:
            self.held = random17
        y = lfo_shape(kind, ((self.phase >> 16) + offset) & 0xFFFF, self.held)
        if uni:
            y = (y + ONE) >> 1
        self.out = (y * amp) >> 16


class Modulation:
    """One sample at a time. `write` is the parameter port, `step` runs a sample."""

    # The parameter port's address map.
    ENV_AT, LFO_AT, SLOT_AT, BASE_AT = 0x00, 0x10, 0x20, 0x30

    def __init__(self, fs=FS):
        self.rom = exp_rom(fs)
        self.envs = [Envelope(), Envelope()]
        self.lfos = [Lfo(), Lfo(), Lfo()]
        self.slots = [0] * 16
        self.base = [0] * 16
        self.acc = [0] * 16
        self.out_sel = [0] * 4
        self.vca = [0, 0]           # per envelope: the layers it multiplies
        self.patched = 0            # the CV jacks' switches
        self.frames_m1 = [0, 0]
        self.cv_state = [0, 0]
        self.gates = 0
        self.lfsr = 1
        self.sources = [0] * 8
        self.inc = [0, 0]
        self.pos = [0, 0]
        self.shift = [0, 0]
        self.level = [0, 0]
        self.balance = 0

    def write(self, addr, data):
        at, index = addr & 0xF0, addr & 0x0F
        if at == self.ENV_AT:
            self.envs[index >> 3].words[index & 7] = data
        elif at == self.LFO_AT:
            if index >> 2 < 3 and index & 3 < 3:
                self.lfos[index >> 2].words[index & 3] = data
        elif at == self.SLOT_AT:
            self.slots[index] = data
        elif at == self.BASE_AT:
            # (26 bits signed, as the destination's accumulator)
            d = data & 0x3FFFFFF
            self.base[index] = d - (1 << 26) if d & (1 << 25) else d

    def routing(self, word):
        """Four outputs' selections (4 bits each), two VCA masks, the CV jacks' switches."""
        self.out_sel = [(word >> (4 * i)) & 15 for i in range(4)]
        self.vca = [(word >> 16) & 3, (word >> 18) & 3]
        self.patched = (word >> 20) & 3

    def inputs(self, adc):
        """`adc`: the four input channels, in DAC counts."""
        for i in range(2):
            # (the target's low bits round the reading: the shift stops up to 31 below it)
            target = adc[i] << CV_FRAC | 1 << (CV_FRAC - 3)
            self.cv_state[i] += (target - self.cv_state[i]) >> CV_SHIFT
            v = self.cv_state[i] >> (CV_FRAC - 2)
            if not (self.patched >> i) & 1 and -CV_FLOOR < v < CV_FLOOR:
                v = 0
            self.sources[CV1 + i] = v
        gates = self.gates
        for i in range(2):
            if adc[2 + i] >= GATE_HIGH:
                gates |= 1 << i
            elif adc[2 + i] < GATE_LOW:
                gates &= ~(1 << i)
        rising = gates & ~self.gates
        self.gates = gates
        return gates, rising

    def random(self):
        """PRBS23: 17 bits of it as a signed value, and one step."""
        v = self.lfsr & 0x1FFFF
        v = v - 0x20000 if v & 0x10000 else v
        bit = ((self.lfsr >> 22) ^ (self.lfsr >> 17)) & 1
        self.lfsr = ((self.lfsr << 1) | bit) & 0x7FFFFF
        return v

    def finish(self):
        for i in range(2):
            at = i * LAYER_DESTS
            p = clamp(self.acc[at + PITCH], PITCH_MIN, PITCH_MAX)
            n, f = (p >> 8) & 0xFF, p & 0xFF
            r0, r1 = self.rom[n], self.rom[n + 1]
            v = r0 + (((r1 - r0) * f) >> 8)
            octave = p >> 16
            self.inc[i] = (v << octave if octave >= 0 else v >> -octave) & 0xFFFFFFFF

            self.pos[i] = clamp(self.acc[at + POS], 0, ONE) * self.frames_m1[i]
            self.shift[i] = (clamp(self.acc[at + SHIFT], -(1 << 17), (1 << 17) - 1)
                             * self.frames_m1[i]) >> 10

            q = clamp(self.acc[at + LEVEL], 0, ONE)
            for e, env in enumerate(self.envs):
                if (self.vca[e] >> i) & 1:
                    q = (q * env.level) >> 16
            self.level[i] = (q * UNITY_LEVEL) >> 16
        self.balance = clamp(self.acc[BALANCE], 0, ONE)

    def step(self, adc):
        """Everything up to the oscillators, for the next sample."""
        gates, rising = self.inputs(adc)
        for e, env in enumerate(self.envs):
            env.step(gates, rising)
            self.sources[ENV1 + e] = env.out
        for k, lfo in enumerate(self.lfos):
            lfo.step(rising, self.random())
            self.sources[LFO1 + k] = lfo.out
        self.acc = list(self.base)
        for word in self.slots[:N_SLOTS]:
            amount = word & 0x3FFFF
            amount = amount - 0x40000 if amount & 0x20000 else amount
            src, dest = (word >> 18) & 7, (word >> 21) & 15
            self.acc[dest] += (self.sources[src] * amount) >> AMOUNT_SHIFT
        self.finish()

    def mix(self, l1, l2):
        """The two layers' samples, to the four outputs (DAC counts)."""
        mix = l1 + (((l2 - l1) * self.balance) >> 16)
        bus = [0, mix, l1, l2]
        bus += [self.sources[s] >> 2 for s in (ENV1, ENV2, LFO1, LFO2, LFO3)]
        return [bus[s] if s < len(bus) else 0 for s in self.out_sel]

    def apply(self, layers):
        """Writes this sample's results into the oscillators' `Layer`s."""
        for i, layer in enumerate(layers):
            layer.inc = self.inc[i]
            layer.pos = self.pos[i]
            layer.shift = self.shift[i]
            layer.level = self.level[i]
