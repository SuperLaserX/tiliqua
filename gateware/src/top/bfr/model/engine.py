"""Reference engine: runs a compiled program sample by sample, bit-exact.

Two implementations of the same semantics (SPEC.md):

- `Engine.process_ref`: a plain interpreter over the decoded instructions.
- `Engine.process`: the program compiled to one straight-line Python
  function, several times faster, for rendering audio.

`test_model.py` checks that they agree, and `fp` checks the arithmetic
against its integer definitions.

Each sample:
  1. the inputs, LFO outputs, noise and fade weights are written to their
     registers,
  2. the instructions run in order, each one completely,
  3. the outputs are read from OUT0..3,
  4. the delay pointer, the LFO phases, the noise generator and the fade
     positions advance.

The engine also models the CPU's side of crossfades (`set_param`,
`_service_fades`), run every CPU_POLL samples.
"""

import math

from . import fp, isa

# -- LFOs and noise ------------------------------------------------------------

# Quarter-wave sine, 24-bit, and the full cycle (1024 entries + wrap) built from it.
SIN_QUARTER = [int(math.floor(math.sin(math.pi / 2 * i / 256) * (2 ** 23 - 1) + 0.5))
               for i in range(257)]


def _sin_entry(i):
    i &= 1023
    q, r = i >> 8, i & 255
    if q == 0:
        return SIN_QUARTER[r]
    if q == 1:
        return SIN_QUARTER[256 - r]
    if q == 2:
        return -SIN_QUARTER[r]
    return -SIN_QUARTER[256 - r]


SIN_TABLE = [_sin_entry(i) for i in range(1025)]
INV23 = 1.0 / (1 << 23)
INV24 = 1.0 / (1 << 24)
M32 = 0xFFFFFFFF
NOISE_SEED = 0x1234567
CPU_POLL = 32               # samples between the CPU's checks of the fade unit


def lfo_sin(phase):
    """Sine of a 32-bit phase: table of 1024 entries, linear interpolation."""
    i, f = phase >> 22, (phase >> 6) & 0xFFFF
    a = SIN_TABLE[i]
    return (a + (((SIN_TABLE[i + 1] - a) * f) >> 16)) * INV23


def lfo_outputs(phase):
    """(sin, cos, tri, saw) of a 32-bit phase, each in [-1, 1]."""
    u = (phase + 0x40000000) & M32
    saw = phase >> 8
    if saw >= 1 << 23:
        saw -= 1 << 24
    return (lfo_sin(phase), lfo_sin(u),
            ((1 << 23) - (abs(u - (1 << 31)) >> 7)) * INV23, saw * INV23)


def lfo_increment(rate_hz, fs):
    """Phase increment per sample for a rate in Hz."""
    return int(math.floor(rate_hz / fs * 2 ** 32 + 0.5)) & M32


def fade_rate(samples):
    """Fade position step per sample for a crossfade of `samples`."""
    return max(1, int(math.floor(isa.FADE_ONE / samples + 0.5)))


def fade_step(p, target, rate):
    if p < target:
        return min(p + rate, target)
    if p > target:
        return max(p - rate, target)
    return p


def noise_value(x):
    v = x >> 8
    if v >= 1 << 23:
        v -= 1 << 24
    return v * INV23


def noise_step(x):
    x ^= (x << 13) & M32
    x ^= x >> 17
    x ^= (x << 5) & M32
    return x


# -- static checks -----------------------------------------------------------------

def check(prog, clock_hz=60_000_000):
    """Pipeline hazards and structural rules. Returns a list of problems."""
    problems = []
    acc_w, reg_w = {}, {}
    writes = {}
    taps = prog.taps
    for j, ins in enumerate(prog.instrs):
        def need(what, since, lat):
            if since is not None and j - since < lat:
                problems.append(f"{j}: {what} {j - since} after its write (needs {lat})")
        if ins.op != isa.OP_NOP:
            interp = ins.bsel in (isa.B_INTERP0, isa.B_INTERP1)
            if ins.asel == isa.A_ACC:
                need(f"a{ins.aidx} read", acc_w.get(ins.aidx), isa.LAT_ACC)
            elif ins.asel == isa.A_REG:
                need(f"{isa.reg_name(ins.aidx)} read", reg_w.get(ins.aidx), isa.LAT_REG)
            else:
                t = taps[ins.aidx]
                if t.kind == isa.TAP_WRITE:
                    problems.append(f"{j}: reads write tap T{ins.aidx}")
                if (t.kind == isa.TAP_MOD) != interp:
                    problems.append(f"{j}: tap T{ins.aidx} and B operand don't match")
                if t.kind == isa.TAP_MOD:
                    need(f"modulation {isa.reg_name(t.mreg)} read", reg_w.get(t.mreg), isa.LAT_MOD)
                    if ins.bidx != t.mreg:
                        problems.append(f"{j}: interpolated read names R{ins.bidx}, tap uses R{t.mreg}")
            if interp and ins.asel != isa.A_MEM:
                problems.append(f"{j}: interpolation needs a memory operand")
            if ins.bsel == isa.B_REG:
                need(f"{isa.reg_name(ins.bidx)} read", reg_w.get(ins.bidx), isa.LAT_REG)
            if ins.op == isa.OP_MAC:
                need(f"a{ins.d} accumulate", acc_w.get(ins.d), isa.LAT_MAC)
        if ins.st:
            need(f"a{ins.sacc} store", acc_w.get(ins.sacc), isa.LAT_ACC)
            if ins.op != isa.OP_NOP and ins.asel == isa.A_ACC and ins.aidx != ins.sacc:
                problems.append(f"{j}: stores a{ins.sacc} while reading a{ins.aidx}")
            if ins.ssel == isa.S_MEM:
                if taps[ins.sidx].kind != isa.TAP_WRITE:
                    problems.append(f"{j}: stores to non-write tap T{ins.sidx}")
                writes[ins.sidx] = writes.get(ins.sidx, 0) + 1
            else:
                if ins.sidx in isa.REG_READONLY:
                    problems.append(f"{j}: stores to read-only {isa.reg_name(ins.sidx)}")
                reg_w[ins.sidx] = j
        if ins.op != isa.OP_NOP:
            acc_w[ins.d] = j
    for i, t in enumerate(taps):
        if t.kind == isa.TAP_WRITE and writes.get(i, 0) != 1:
            problems.append(f"write tap T{i} stored {writes.get(i, 0)} times per sample (must be 1)")
    if len(prog.instrs) + isa.PIPE_DEPTH > clock_hz // prog.fs:
        problems.append(f"{len(prog.instrs)} instructions + {isa.PIPE_DEPTH} > budget {clock_hz // prog.fs}")
    problems += _check_streams(prog)
    return problems


def _check_streams(prog):
    """The stream engine's rules for PSRAM taps (see SPEC.md)."""
    st = prog.streams
    if not st:
        return []
    problems = []
    n, ring = st["burst"], prog.mem_words[isa.SPACE_PSRAM]
    ps = [(i, t) for i, t in enumerate(prog.taps) if t.space == isa.SPACE_PSRAM]
    writes = [t.offset for _, t in ps if t.kind == isa.TAP_WRITE]
    for i, t in ps:
        if t.buf & t.bmask or (t.bmask + 1) & t.bmask:
            problems.append(f"T{i}: buffer region {t.buf}+{t.bmask + 1} is not an aligned power of two")
        if t.kind == isa.TAP_WRITE:
            if t.bmask + 1 != 2 * n:
                problems.append(f"T{i}: write buffer region {t.bmask + 1} words (must be {2 * n})")
            continue
        window = 2 * t.depth + 1 if t.kind == isa.TAP_MOD else 0
        if t.bmask + 1 < window + 2 * n:
            problems.append(f"T{i}: buffer region {t.bmask + 1} words < window {window} + {2 * n}")
        # A burst is flushed at most 2N samples after its first word is written,
        # and fetched N samples before its first word is read; requests are
        # served in order, so the flush must be queued first.
        hi = t.offset + (t.depth if t.kind == isa.TAP_MOD else 0)
        gap = min(((w - hi) % ring for w in writes), default=ring)
        if gap < 2 * n + 1:
            problems.append(f"T{i}: reads {gap} samples behind a write (the stream engine needs {2 * n + 1})")
    return problems


# -- engine ------------------------------------------------------------------------

class Engine:

    def __init__(self, prog, io_bits=24):
        self.prog = prog
        self.io_bits = io_bits
        self._coef_exprs = [(i, p, env, p.params()) for i, p, env in prog.coef_exprs]
        self._tap_exprs = [(i, base, p, env, p.params()) for i, base, p, env in prog.tap_exprs]
        self._lfo_exprs = [(k, p, p.params()) for k, p in prog.lfo_exprs]
        self._fade_of = {name: g for g, (name, _) in enumerate(prog.fades)}
        self.fade_rate = [fade_rate(n) for _, n in prog.fades]
        self.warmup = list(prog.streams.get("warmup", [0] * len(prog.fades)))
        self._fn = _codegen(prog, io_bits)
        self.reset()

    def reset(self):
        p = self.prog
        self.acc = [0] * isa.N_ACC
        self.R = [0.0] * isa.N_REG
        self.R[isa.REG_ONE] = 1.0
        for r, bits in p.reg_init.items():
            self.R[r] = fp.bits_to_float(bits)
        self.mem = [[0.0] * p.mem_words[s] for s in (isa.SPACE_PSRAM, isa.SPACE_EBR)]
        self.mask = [p.mem_words[s] - 1 for s in (isa.SPACE_PSRAM, isa.SPACE_EBR)]
        self.ptr = 0
        self.coef_bits = list(p.coefs)
        self.C = [fp.bits_to_float(b) for b in p.coefs]
        self.offsets = [t.offset for t in p.taps]
        self.lfo_phase = list(p.lfo_phase)
        self.lfo_inc = list(p.lfo_inc)
        self.noise = NOISE_SEED
        self.params = {d.name: d.default for d in p.params}
        # Crossfades: position 0 = side A, FADE_ONE = side B.
        self.fade_p = [0] * isa.N_FADE
        self.fade_target = [0] * isa.N_FADE
        self.fade_pending = [False] * isa.N_FADE
        self.side_value = [[self.params[name]] * 2 for name, _ in p.fades]
        # A loaded silent side waits until its PSRAM streams have warmed up.
        self.warm_side = [None] * isa.N_FADE
        self.warm_until = [0] * isa.N_FADE
        for g in range(isa.N_FADE):
            self.R[isa.REG_FADE + 2 * g] = 1.0
        self.samples = 0

    # parameters (the CPU's job on hardware)
    def trigger(self, name):
        """Fire the program's trigger `name` (`Control::trigger`)."""
        for n, r, _ in self.prog.triggers:
            if n == name:
                self.R[r] = 1.0
                return
        raise KeyError(f"{self.prog.name} has no trigger {name!r}")

    def set_param(self, name, value):
        decl = next(d for d in self.prog.params if d.name == name)
        value = min(max(float(value), decl.lo), decl.hi)
        self.params[name] = value
        if name in self._fade_of:
            self.fade_pending[self._fade_of[name]] = True
            self._service_fades()
        else:
            self._recompute(lambda env, names: name in names)

    def fading(self):
        """True while any crossfade runs or waits to run."""
        return any(self.fade_p[g] != self.fade_target[g] or self.fade_pending[g]
                   or self.warm_side[g] is not None for g in range(len(self.prog.fades)))

    def stream_enabled(self, i):
        """Whether tap i's PSRAM stream must run (the CPU's job): a crossfaded
        tap's stream may stop while its side's weight is zero and nothing is
        about to fade to it. A stopped stream's buffer goes stale; starting it
        again (or changing its offset) needs the group's warm-up."""
        t = self.prog.taps[i]
        if t.group < 0:
            return True
        g, s = t.group, t.side
        if s == self._active(g) or s == self.warm_side[g]:
            return True
        return self.fade_p[g] != (isa.FADE_ONE if s == 0 else 0)

    def _active(self, g):
        """The side group g is at, or fading to."""
        return 1 if self.fade_target[g] == isa.FADE_ONE else 0

    def _env(self, env):
        """Parameter values for entries evaluated with `env` (None or (group, side))."""
        d = dict(self.params)
        for h, (name, _) in enumerate(self.prog.fades):
            s = env[1] if env is not None and env[0] == h else self._active(h)
            d[name] = self.side_value[h][s]
        return d

    def _recompute(self, pred):
        for i, p, env, names in self._coef_exprs:
            if pred(env, names):
                self.set_coef(i, fp.f32_round(p.eval(self._env(env))))
        for i, base, p, env, names in self._tap_exprs:
            if pred(env, names):
                self.offsets[i] = base - int(math.floor(p.eval(self._env(env)) + 0.5))
        for k, p, names in self._lfo_exprs:
            if pred(None, names):
                self.lfo_inc[k] = lfo_increment(p.eval(self._env(None)), self.prog.fs)

    def _service_fades(self):
        """Start a pending crossfade on each idle group: load the silent side
        with the latest value, wait for its PSRAM streams to warm up (the
        program's warm-up, in samples), then fade to it."""
        for g, (name, _) in enumerate(self.prog.fades):
            if self.warm_side[g] is None:
                if not self.fade_pending[g] or self.fade_p[g] != self.fade_target[g]:
                    continue
                self.fade_pending[g] = False
                if self.params[name] == self.side_value[g][self._active(g)]:
                    continue
                new = 1 - self._active(g)
                self.side_value[g][new] = self.params[name]
                self._recompute(lambda env, names: env == (g, new))
                self.warm_side[g] = new
                self.warm_until[g] = self.samples + self.warmup[g]
            if self.samples >= self.warm_until[g]:
                new, self.warm_side[g] = self.warm_side[g], None
                self.fade_target[g] = isa.FADE_ONE if new else 0
                self._recompute(lambda env, names: (env is None or env[0] != g) and name in names)

    def set_coef(self, i, bits):
        self.coef_bits[i] = bits
        self.C[i] = fp.bits_to_float(bits)

    # processing
    def process(self, inputs):
        """inputs: sequence of N_IN-tuples of signed io_bits-bit ints. Returns output tuples."""
        return self._chunked(inputs, lambda chunk, out: self._fn(self, chunk, out))

    def process_ref(self, inputs):
        """The same as process(), by interpreting the instructions."""
        return self._chunked(inputs, self._run_ref)

    def _chunked(self, inputs, run):
        out = []
        if not self.prog.fades:
            run(inputs, out)
            self.samples += len(inputs)
            return out
        i = 0
        while i < len(inputs):
            chunk = inputs[i:i + CPU_POLL - self.samples % CPU_POLL]
            run(chunk, out)
            i += len(chunk)
            self.samples += len(chunk)
            if self.samples % CPU_POLL == 0:
                self._service_fades()
        return out

    def _run_ref(self, inputs, out):
        prog, R = self.prog, self.R
        scale = 1.0 / (1 << (self.io_bits - 1))
        for x in inputs:
            for k in range(isa.N_IN):
                R[isa.REG_IN + k] = x[k] * scale
            for k in range(isa.N_LFO):
                R[isa.REG_LFO + 4 * k:isa.REG_LFO + 4 * k + 4] = lfo_outputs(self.lfo_phase[k])
            R[isa.REG_NOISE] = noise_value(self.noise)
            for g in range(len(prog.fades)):
                R[isa.REG_FADE + 2 * g] = (isa.FADE_ONE - self.fade_p[g]) * INV24
                R[isa.REG_FADE + 2 * g + 1] = self.fade_p[g] * INV24
            for ins in prog.instrs:
                self._exec(ins)
            out.append(tuple(fp.fix_to_out(R[isa.REG_OUT + k], self.io_bits) for k in range(isa.N_OUT)))
            self.ptr += 1
            for k in range(isa.N_LFO):
                self.lfo_phase[k] = (self.lfo_phase[k] + self.lfo_inc[k]) & M32
            self.noise = noise_step(self.noise)
            for g in range(len(prog.fades)):
                self.fade_p[g] = fade_step(self.fade_p[g], self.fade_target[g], self.fade_rate[g])

    def _exec(self, ins):
        R, C, acc, taps = self.R, self.C, self.acc, self.prog.taps
        if ins.op != isa.OP_NOP:
            if ins.asel == isa.A_MEM:
                t = taps[ins.aidx]
                mem, mask = self.mem[t.space], self.mask[t.space]
                addr = self.ptr + self.offsets[ins.aidx]
                if ins.bsel == isa.B_INTERP0 or ins.bsel == isa.B_INTERP1:
                    n, f = fp.interp_split(R[t.mreg], t.depth)
                    if ins.bsel == isa.B_INTERP0:
                        xa, xb = mem[(addr - n) & mask], (65536 - f) / 65536.0
                    else:
                        xa, xb = mem[(addr - n - 1) & mask], f / 65536.0
                else:
                    xa = mem[addr & mask]
            elif ins.asel == isa.A_REG:
                xa = R[ins.aidx]
            else:
                xa = fp.acc_to_float(acc[ins.aidx])
            if ins.bsel == isa.B_COEF:
                xb = C[ins.bidx]
            elif ins.bsel == isa.B_REG:
                xb = R[ins.bidx]
            elif ins.bsel >= isa.B_CFADE:
                xb = fp.scale_fast(C[ins.bidx], R[isa.REG_FADE + ins.bsel - isa.B_CFADE])
        if ins.st:
            v = fp.acc_to_fix(acc[ins.sacc]) if ins.ssel == isa.S_FIX else fp.acc_to_float(acc[ins.sacc])
            if ins.ssel == isa.S_MEM:
                t = taps[ins.sidx]
                self.mem[t.space][(self.ptr + self.offsets[ins.sidx]) & self.mask[t.space]] = v
            elif ins.sidx not in isa.REG_READONLY:
                R[ins.sidx] = v
        if ins.op == isa.OP_MUL:
            acc[ins.d] = fp.mul_fast(xa, xb)
        elif ins.op == isa.OP_MAC:
            acc[ins.d] = fp.sat(acc[ins.d] + fp.mul_fast(xa, xb))


# -- code generation ---------------------------------------------------------------

def _codegen(prog, io_bits):
    """Compile the program into `render(eng, inputs, out)`."""
    used_lfo = set()
    used_noise = False
    for ins in prog.instrs:
        for sel, idx in ((ins.asel == isa.A_REG and ins.op, ins.aidx),
                         (ins.bsel == isa.B_REG and ins.op, ins.bidx)):
            if sel and isa.REG_LFO <= idx < isa.REG_LFO + 4 * isa.N_LFO:
                used_lfo.add((idx - isa.REG_LFO) // 4)
            if sel and idx == isa.REG_NOISE:
                used_noise = True
    for t in prog.taps:
        if t.kind == isa.TAP_MOD and isa.REG_LFO <= t.mreg < isa.REG_LFO + 4 * isa.N_LFO:
            used_lfo.add((t.mreg - isa.REG_LFO) // 4)

    L = []
    e = L.append
    e("def render(eng, inputs, out):")
    e(" R = eng.R; C = eng.C; off = eng.offsets")
    e(" M0, M1 = eng.mem; k0, k1 = eng.mask")
    e(" " + ", ".join(f"a{i}" for i in range(isa.N_ACC)) + " = eng.acc")
    e(" ptr = eng.ptr; nz = eng.noise")
    e(" ph = eng.lfo_phase; inc = eng.lfo_inc")
    for k in sorted(used_lfo):
        e(f" ph{k} = ph[{k}]; inc{k} = inc[{k}]")
    n_fades = len(prog.fades)
    for g in range(n_fades):
        e(f" fp{g} = eng.fade_p[{g}]; ft{g} = eng.fade_target[{g}]; fr{g} = eng.fade_rate[{g}]")
    e(f" insc = {1.0 / (1 << (io_bits - 1))!r}")
    e(" for x in inputs:")
    for k in range(isa.N_IN):
        e(f"  R[{isa.REG_IN + k}] = x[{k}] * insc")
    for k in sorted(used_lfo):
        b = isa.REG_LFO + 4 * k
        e(f"  i = ph{k} >> 22; f = (ph{k} >> 6) & 0xFFFF; t = SIN[i]")
        e(f"  R[{b}] = (t + (((SIN[i + 1] - t) * f) >> 16)) * INV23")
        e(f"  u = (ph{k} + 0x40000000) & 0xFFFFFFFF")
        e(f"  i = u >> 22; f = (u >> 6) & 0xFFFF; t = SIN[i]")
        e(f"  R[{b + 1}] = (t + (((SIN[i + 1] - t) * f) >> 16)) * INV23")
        e(f"  R[{b + 2}] = (8388608 - (abs(u - 2147483648) >> 7)) * INV23")
        e(f"  s = ph{k} >> 8")
        e(f"  R[{b + 3}] = (s - 16777216 if s >= 8388608 else s) * INV23")
    if used_noise:
        e("  s = nz >> 8")
        e(f"  R[{isa.REG_NOISE}] = (s - 16777216 if s >= 8388608 else s) * INV23")
    else:
        e("  nzl = nz")
    for g in range(n_fades):
        e(f"  R[{isa.REG_FADE + 2 * g}] = (16777216 - fp{g}) * INV24")
        e(f"  R[{isa.REG_FADE + 2 * g + 1}] = fp{g} * INV24")

    taps = prog.taps
    for j, ins in enumerate(prog.instrs):
        if ins.op != isa.OP_NOP:
            if ins.asel == isa.A_MEM:
                t = taps[ins.aidx]
                sp = t.space
                if ins.bsel in (isa.B_INTERP0, isa.B_INTERP1):
                    lim = t.depth << fp.FRAC_BITS
                    e(f"  q = R[{t.mreg}]")
                    e(f"  mq = {lim} if q > {lim} else (-{lim} if q < -{lim} else q)")
                    if ins.bsel == isa.B_INTERP0:
                        e(f"  xa = M{sp}[(ptr + off[{ins.aidx}] - (mq >> 16)) & k{sp}]")
                        e("  xb = (65536 - (mq & 65535)) * 1.52587890625e-05")
                    else:
                        e(f"  xa = M{sp}[(ptr + off[{ins.aidx}] - (mq >> 16) - 1) & k{sp}]")
                        e("  xb = (mq & 65535) * 1.52587890625e-05")
                else:
                    e(f"  xa = M{sp}[(ptr + off[{ins.aidx}]) & k{sp}]")
            elif ins.asel == isa.A_REG:
                e(f"  xa = R[{ins.aidx}]")
            else:
                e(f"  xa = tof(a{ins.aidx})")
            if ins.bsel == isa.B_COEF:
                e(f"  xb = C[{ins.bidx}]")
            elif ins.bsel == isa.B_REG:
                e(f"  xb = R[{ins.bidx}]")
            elif ins.bsel >= isa.B_CFADE:
                # Weights are exactly 1 or 0 outside a fade: c * 1 rounds to c.
                e(f"  w = R[{isa.REG_FADE + ins.bsel - isa.B_CFADE}]")
                e(f"  xb = C[{ins.bidx}] if w == 1.0 else (0.0 if w == 0.0 else csc(C[{ins.bidx}], w))")
        if ins.st:
            if ins.ssel == isa.S_FIX:
                v = f"afix(a{ins.sacc})"
            elif ins.op != isa.OP_NOP and ins.asel == isa.A_ACC and ins.aidx == ins.sacc:
                v = "xa"
            else:
                v = f"tof(a{ins.sacc})"
            if ins.ssel == isa.S_MEM:
                t = taps[ins.sidx]
                e(f"  M{t.space}[(ptr + off[{ins.sidx}]) & k{t.space}] = {v}")
            elif ins.sidx not in isa.REG_READONLY:
                e(f"  R[{ins.sidx}] = {v}")
        if ins.op != isa.OP_NOP:
            e("  p = xa * xb * SC")
            if ins.op == isa.OP_MUL:
                e(f"  a{ins.d} = int(p) if -LIM < p < LIM else (AM if p > 0 else -AM)")
            else:
                e(f"  v = a{ins.d} + (int(p) if -LIM < p < LIM else (AM if p > 0 else -AM))")
                e(f"  a{ins.d} = v if -AM <= v <= AM else (AM if v > 0 else -AM)")

    W = io_bits
    e("  out.append((" + ", ".join(f"fixout(R[{isa.REG_OUT + k}], {W})" for k in range(isa.N_OUT)) + ",))")
    e("  ptr += 1")
    for k in sorted(used_lfo):
        e(f"  ph{k} = (ph{k} + inc{k}) & 0xFFFFFFFF")
    e("  nz ^= (nz << 13) & 0xFFFFFFFF; nz ^= nz >> 17; nz ^= (nz << 5) & 0xFFFFFFFF")
    for g in range(n_fades):
        e(f"  if fp{g} != ft{g}: fp{g} = min(fp{g} + fr{g}, ft{g}) if fp{g} < ft{g} else max(fp{g} - fr{g}, ft{g})")
    e(" eng.acc = [" + ", ".join(f"a{i}" for i in range(isa.N_ACC)) + "]")
    e(" eng.ptr = ptr; eng.noise = nz")
    for g in range(n_fades):
        e(f" eng.fade_p[{g}] = fp{g}")
    for k in sorted(used_lfo):
        e(f" ph[{k}] = ph{k}")
    # Registers the program never reads are only brought up to date at the end:
    # they hold the last sample's values, as if refreshed every sample.
    e(" if inputs:")
    for k in range(isa.N_LFO):
        if k not in used_lfo:
            b = isa.REG_LFO + 4 * k
            e(f"  R[{b}:{b + 4}] = lfo_outputs((ph[{k}] + inc[{k}] * (len(inputs) - 1)) & 0xFFFFFFFF)")
            e(f"  ph[{k}] = (ph[{k}] + inc[{k}] * len(inputs)) & 0xFFFFFFFF")
    if not used_noise:
        e(f"  R[{isa.REG_NOISE}] = noise_value(nzl)")
    e("  pass")

    src = "\n".join(L)
    ns = {"SIN": SIN_TABLE, "INV23": INV23, "INV24": INV24, "csc": fp.scale_fast,
          "SC": fp.ACC_SCALE, "LIM": fp.ACC_LIMIT,
          "AM": fp.ACC_MAX, "tof": fp.acc_to_float, "fixout": fp.fix_to_out,
          "floor": math.floor, "lfo_outputs": lfo_outputs, "noise_value": noise_value,
          "afix": fp.acc_to_fix}
    exec(compile(src, f"<bfr program {prog.name}>", "exec"), ns)
    fn = ns["render"]
    fn.source = src
    return fn
