"""Instruction set of the bfr engine (version 0). See SPEC.md for the semantics.

One instruction issues per clock. Each instruction can do one multiply
(into an accumulator) and, independently, one store of an accumulator to a
delay-memory write tap or a register.
"""

from dataclasses import dataclass, field

# -- sizes --------------------------------------------------------------------

N_ACC = 8
N_REG = 128
N_COEF = 256
N_TAP = 256
N_LFO = 4
N_IN = 4
N_OUT = 4
N_FADE = 2                  # crossfade groups (one per crossfaded parameter)
FADE_ONE = 1 << 24          # fade position at side B

# -- register map -------------------------------------------------------------

REG_GENERAL = 64            # R0..R63: general purpose (state, modulation, temporaries)
REG_IN = 64                 # IN0..IN3: audio inputs (read only)
REG_OUT = 68                # OUT0..OUT3: audio outputs
REG_LFO = 72                # LFOk part p at REG_LFO + 4k + p
LFO_SIN, LFO_COS, LFO_TRI, LFO_SAW = range(4)
REG_NOISE = 88              # white noise in [-1, 1)
REG_ONE = 89                # constant 1.0
REG_FADE = 90               # FADEg.a at REG_FADE + 2g, FADEg.b at REG_FADE + 2g + 1
REG_READONLY = (set(range(REG_IN, REG_IN + N_IN))
                | set(range(REG_LFO, REG_FADE + 2 * N_FADE)))


def reg_name(r):
    if r < REG_GENERAL:
        return f"R{r}"
    if REG_IN <= r < REG_IN + N_IN:
        return f"IN{r - REG_IN}"
    if REG_OUT <= r < REG_OUT + N_OUT:
        return f"OUT{r - REG_OUT}"
    if REG_LFO <= r < REG_LFO + 4 * N_LFO:
        k, p = divmod(r - REG_LFO, 4)
        return f"LFO{k}.{('sin', 'cos', 'tri', 'saw')[p]}"
    if REG_FADE <= r < REG_FADE + 2 * N_FADE:
        g, s = divmod(r - REG_FADE, 2)
        return f"FADE{g}.{'ab'[s]}"
    return {REG_NOISE: "NOISE", REG_ONE: "ONE"}.get(r, f"X{r}")


# -- instruction fields ----------------------------------------------------------

OP_NOP, OP_MUL, OP_MAC = 0, 1, 2
A_MEM, A_REG, A_ACC = 0, 1, 2
B_COEF, B_REG, B_INTERP0, B_INTERP1 = 0, 1, 2, 3
B_CFADE = 4                 # 4 + 2g + side: coefficient times FADEg.a / FADEg.b
S_MEM, S_REG, S_FIX = 0, 1, 2   # S_FIX: register, fixed point (modulation offsets, outputs)

FIELDS = (                  # (name, width), least significant first: 41 bits
    ("op", 3),
    ("d", 3),
    ("asel", 2),
    ("aidx", 8),
    ("bsel", 3),
    ("bidx", 8),
    ("st", 1),
    ("sacc", 3),
    ("ssel", 2),
    ("sidx", 8),
)
INSTR_BITS = sum(w for _, w in FIELDS)

# -- pipeline (from the gateware, bfr/core.py) -----------------------------------

# Minimum instruction distance between a producer and a consumer.
LAT_ACC = 8     # write of acc k (stage 10) -> read of acc k as operand A, or a store (stage 3)
LAT_MAC = 1     # write of acc k -> accumulate into acc k (forwarded)
LAT_REG = 5     # store to register r (stage 6) -> read of r (stage 1, transparent)
LAT_MOD = 5     # store to a modulated tap's register -> interpolated read (also stage 1:
                # an interpolated read names the register in bidx)
PIPE_DEPTH = 53  # clocks per frame besides the instructions: prologue 33, drain 11,
                 # epilogue 8, idle 1 (measured in simulation)

# -- PSRAM stream engine (gateware bfr/stream.py) ---------------------------------

PROG_DEPTH = 1024           # program memory of the default build (instructions)
STREAM_BURST = 8            # words per PSRAM burst (aligned); a stream moves one per N samples
RBUF_WORDS = 2048           # stream read buffer of the default build: a region per PSRAM read tap
WBUF_WORDS = 512            # stream write buffer: 2N words per PSRAM write tap
BUF_BITS = 13               # buffer address width in tap entries (read buffers up to 8192 words)


@dataclass(frozen=True)
class Instr:
    op: int = OP_NOP
    d: int = 0
    asel: int = A_MEM
    aidx: int = 0
    bsel: int = B_COEF
    bidx: int = 0
    st: int = 0
    sacc: int = 0
    ssel: int = S_MEM
    sidx: int = 0

    def encode(self):
        word, shift = 0, 0
        for name, width in FIELDS:
            v = getattr(self, name)
            if not 0 <= v < (1 << width):
                raise ValueError(f"{name}={v} does not fit {width} bits")
            word |= v << shift
            shift += width
        return word

    @staticmethod
    def decode(word):
        vals, shift = {}, 0
        for name, width in FIELDS:
            vals[name] = (word >> shift) & ((1 << width) - 1)
            shift += width
        return Instr(**vals)

    def text(self, taps=None):
        """Assembly-like text for listings."""
        def tap(i):
            t = taps[i] if taps else None
            return f"T{i}" + (f"({t.label})" if t and t.label else "")
        parts = []
        if self.op != OP_NOP:
            if self.asel == A_MEM:
                a = tap(self.aidx)
            elif self.asel == A_REG:
                a = reg_name(self.aidx)
            else:
                a = f"a{self.aidx}"
            if self.bsel >= B_CFADE:
                b = f"C{self.bidx}*{reg_name(REG_FADE + self.bsel - B_CFADE)}"
            else:
                b = {B_COEF: f"C{self.bidx}", B_REG: reg_name(self.bidx),
                     B_INTERP0: "1-frac", B_INTERP1: "frac"}[self.bsel]
            if self.bsel == B_INTERP1:
                a += "+1"
            parts.append(f"{'mul' if self.op == OP_MUL else 'mac'} a{self.d}, {a}, {b}")
        else:
            parts.append("nop")
        if self.st:
            dst = tap(self.sidx) if self.ssel == S_MEM else reg_name(self.sidx)
            parts.append(f"st{'.fix' if self.ssel == S_FIX else ''} a{self.sacc} -> {dst}")
        return " ; ".join(parts)


# -- tap table ----------------------------------------------------------------

SPACE_PSRAM, SPACE_EBR = 0, 1
TAP_READ, TAP_WRITE, TAP_MOD = 0, 1, 2


@dataclass
class Tap:
    """One delay-memory access stream.

    The address is (ptr + offset) & mask of its memory space, where ptr
    advances by one word per sample. A modulated tap reads at
    offset - n and offset - n - 1, where n is the whole part of the value in
    register `mreg` (fixed point, samples * 2^16, clamped to +-depth).
    """
    space: int
    kind: int
    offset: int
    depth: int = 0
    mreg: int = 0
    label: str = ""
    group: int = -1         # crossfade group, or -1
    side: int = 0           # 0 = A, 1 = B (for crossfaded taps)
    # PSRAM taps: stream number and buffer region (base, size - 1) in the stream
    # engine's read or write buffer, which holds the word for address a at
    # buf | (a & bmask).
    stream: int = -1
    buf: int = 0
    bmask: int = 0


@dataclass
class ParamDecl:
    name: str
    default: float
    lo: float
    hi: float
    unit: str = ""
    curve: str = "lin"      # "lin" or "log": how the UI moves the value
    fade_ms: float = 0.0    # > 0: taps depending on it crossfade over this time
    page: str = "main"      # menu page in the firmware
    help: str = ""          # one sentence for the menu's help line
    step: float = 0.0       # > 0: the menu's step (lin only; else about 100 steps)


@dataclass
class Program:
    """A compiled algorithm: everything the engine needs for one sample rate."""
    name: str
    fs: int
    instrs: list
    taps: list
    coefs: list                     # f32 bits at the default parameter values
    reg_init: dict                  # register -> f32 bits at reset
    lfo_phase: list                 # initial 32-bit phases
    lfo_inc: list                   # 32-bit increments at the default values
    mem_words: dict                 # space -> ring size in words (power of two)
    params: list                    # ParamDecl
    # Parameter-driven values, re-evaluated when a parameter changes. `env` is
    # None (current values) or (group, side): the values of that crossfade side.
    coef_exprs: list = field(default_factory=list)   # (coef index, P, env)
    tap_exprs: list = field(default_factory=list)    # (tap index, base, P delay in samples, env)
    lfo_exprs: list = field(default_factory=list)    # (lfo index, P rate in Hz)
    fades: list = field(default_factory=list)        # per group: (parameter name, fade samples)
    report: dict = field(default_factory=dict)
    listing: list = field(default_factory=list)      # comment per instruction
    # PSRAM streams: {"burst", "taps" (tap index per stream), "rbuf_words",
    # "wbuf_words", "warmup" (per fade group: samples a changed tap needs)}
    streams: dict = field(default_factory=dict)
    # For the menu: the type's name and one-sentence description, and its
    # named presets as (name, {parameter: value}).
    title: str = ""
    description: str = ""
    presets: list = field(default_factory=list)
    # preset name -> [(follower, parameter, percent)] (compiler.compile_module)
    preset_mods: dict = field(default_factory=dict)
    # One-shot envelopes the firmware fires: (name, register, help). Firing
    # writes 1.0 to the register (between frames, as every register write).
    triggers: list = field(default_factory=list)
