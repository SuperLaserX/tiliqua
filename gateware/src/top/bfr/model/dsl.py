"""Algorithm description language.

An algorithm is a Python function `build(a)` that receives an `Algorithm`
and describes one sample's worth of processing with ordinary arithmetic:

    def build(a):
        decay = a.param("decay", default=0.5, lo=0.0, hi=0.95)
        line = a.delay("echo")
        x = a.input(0) + line.tap(a.ms(250)) * decay
        line.write(x)
        a.output(0, x)

Two kinds of value appear:

- `P`: coefficient math. Parameters, the sample rate and constants combine
  into expressions that the CPU evaluates whenever a parameter changes.
  The DSP only ever sees the resulting coefficients.
- `Sig`: per-sample signals (inputs, delay taps, LFOs, filter states and
  sums of products of these). The compiler turns them into instructions.

Sums of products are the native operation: `x * k1 + y * k2` is one
accumulator chain. A product of two signals, such as `x * lfo.sin`, is also
one instruction, provided one of them is in a register.
"""

import math

from . import isa

# -- coefficient expressions ----------------------------------------------------

_FUNCS = {
    "exp": math.exp, "log": math.log, "sqrt": math.sqrt, "sin": math.sin,
    "cos": math.cos, "tan": math.tan, "floor": math.floor, "abs": abs,
    "round": lambda x: math.floor(x + 0.5),
}
_BINOPS = {
    "add": lambda x, y: x + y, "sub": lambda x, y: x - y,
    "mul": lambda x, y: x * y, "div": lambda x, y: x / y,
    "pow": lambda x, y: x ** y, "min": min, "max": max,
}


class P:
    """A coefficient expression: constants, parameters and arithmetic."""

    __slots__ = ("op", "args")

    def __init__(self, op, *args):
        self.op, self.args = op, args

    # construction
    @staticmethod
    def lift(x):
        if isinstance(x, P):
            return x
        if isinstance(x, (int, float)) and not isinstance(x, bool):
            return P("const", float(x))
        raise TypeError(f"not a coefficient: {x!r}")

    def _bin(self, op, other, swap=False):
        try:
            other = P.lift(other)
        except TypeError:
            return NotImplemented
        x, y = (other, self) if swap else (self, other)
        if x.op == "const" and y.op == "const":
            return P("const", _BINOPS[op](x.args[0], y.args[0]))
        if op == "mul":
            for u, v in ((x, y), (y, x)):
                if u.op == "const" and u.args[0] == 1.0:
                    return v
        if op in ("add", "sub") and y.op == "const" and y.args[0] == 0.0:
            return x
        return P(op, x, y)

    def __add__(self, o): return self._bin("add", o)
    def __radd__(self, o): return self._bin("add", o, swap=True)
    def __sub__(self, o): return self._bin("sub", o)
    def __rsub__(self, o): return self._bin("sub", o, swap=True)
    def __mul__(self, o):
        if isinstance(o, Sig):
            return NotImplemented
        return self._bin("mul", o)
    def __rmul__(self, o): return self._bin("mul", o, swap=True)
    def __truediv__(self, o): return self._bin("div", o)
    def __rtruediv__(self, o): return self._bin("div", o, swap=True)
    def __pow__(self, o): return self._bin("pow", o)
    def __rpow__(self, o): return self._bin("pow", o, swap=True)
    def __neg__(self): return P("const", -1.0) * self

    # inspection
    @property
    def const(self):
        return self.args[0] if self.op == "const" else None

    def key(self):
        if self.op == "const":
            return ("const", self.args[0])
        if self.op == "param":
            return ("param", self.args[0])
        return (self.op,) + tuple(a.key() for a in self.args)

    def params(self):
        if self.op == "param":
            return {self.args[0]}
        if self.op == "const":
            return set()
        out = set()
        for a in self.args:
            out |= a.params()
        return out

    def eval(self, env):
        if self.op == "const":
            return self.args[0]
        if self.op == "param":
            return env[self.args[0]]
        vals = [a.eval(env) for a in self.args]
        if self.op in _FUNCS:
            return float(_FUNCS[self.op](*vals))
        return float(_BINOPS[self.op](*vals))

    def __repr__(self):
        if self.op == "const":
            return repr(self.args[0])
        if self.op == "param":
            return self.args[0]
        return f"{self.op}({', '.join(map(repr, self.args))})"


def _func(name):
    def f(*xs):
        xs = [P.lift(x) for x in xs]
        if all(x.op == "const" for x in xs):
            return P("const", float((_FUNCS.get(name) or _BINOPS[name])(*[x.args[0] for x in xs])))
        return P(name, *xs)
    f.__name__ = name
    return f


# Functions usable in coefficient math: pm.exp(p), pm.min(p, 2.0), ...
class pm:
    exp = staticmethod(_func("exp"))
    log = staticmethod(_func("log"))
    sqrt = staticmethod(_func("sqrt"))
    sin = staticmethod(_func("sin"))
    cos = staticmethod(_func("cos"))
    tan = staticmethod(_func("tan"))
    floor = staticmethod(_func("floor"))
    round = staticmethod(_func("round"))
    abs = staticmethod(_func("abs"))
    min = staticmethod(_func("min"))
    max = staticmethod(_func("max"))


def bounds(expr, decls):
    """(min, max) of an expression over the declared parameter ranges.

    Evaluated on a grid (with the defaults and range ends), which is exact for
    the monotonic expressions delay lengths are usually made of.
    """
    expr = P.lift(expr)
    names = sorted(expr.params())
    if not names:
        v = expr.eval({})
        return v, v
    by_name = {d.name: d for d in decls}
    env = {d.name: d.default for d in decls}
    steps = 33 if len(names) <= 2 else 5
    grids = []
    for n in names:
        d = by_name[n]
        pts = {d.lo, d.hi, d.default}
        for i in range(steps):
            t = i / (steps - 1)
            pts.add(d.lo * (d.hi / d.lo) ** t if d.curve == "log" and d.lo > 0
                    else d.lo + (d.hi - d.lo) * t)
        grids.append(sorted(pts))
    lo, hi = math.inf, -math.inf

    def walk(i):
        nonlocal lo, hi
        if i == len(names):
            v = expr.eval(env)
            lo, hi = min(lo, v), max(hi, v)
            return
        for v in grids[i]:
            env[names[i]] = v
            walk(i + 1)
    walk(0)
    return lo, hi


# -- signals ----------------------------------------------------------------

class Sig:
    """A per-sample value."""

    def _terms_with(self, other, sign):
        if isinstance(other, (int, float, P)):
            other = Reg("one") * other
        if not isinstance(other, Sig):
            return NotImplemented
        return Lin([(self, P.lift(1.0)), (other, P.lift(sign))])

    def __add__(self, o): return self._terms_with(o, 1.0)
    def __radd__(self, o): return self._terms_with(o, 1.0)
    def __sub__(self, o): return self._terms_with(o, -1.0)

    def __rsub__(self, o):
        r = self._terms_with(o, 1.0)
        if r is NotImplemented:
            return r
        (s, _), (t, k) = r.terms
        return Lin([(s, P.lift(-1.0)), (t, k)])

    def __neg__(self):
        return Lin([(self, P.lift(-1.0))])

    def __mul__(self, o):
        if isinstance(o, Sig):
            return Lin([(self, o)])
        try:
            return Lin([(self, P.lift(o))])
        except TypeError:
            return NotImplemented

    __rmul__ = __mul__

    def __truediv__(self, o):
        return self * (1.0 / P.lift(o))


class Reg(Sig):
    """A value in a register: an input, an LFO output, noise, 1.0, or a state."""

    def __init__(self, kind, index=0, part=0, state=None):
        self.kind, self.index, self.part, self.state = kind, index, part, state

    def key(self):
        if self.kind == "state":
            return ("state", id(self.state))
        return (self.kind, self.index, self.part)


class Tap(Sig):
    """A fixed (or parameter-driven) tap of a delay line, `delay` samples old."""

    def __init__(self, line, delay):
        self.line, self.delay = line, P.lift(delay)


class ModTap(Sig):
    """A tap whose delay is center + depth * mod (samples), linearly interpolated.

    `mod` is a signal in [-1, 1] (an LFO, for example).
    """

    def __init__(self, line, center, depth, mod, max_depth):
        self.line, self.center, self.depth = line, P.lift(center), P.lift(depth)
        self.mod, self.max_depth = mod, max_depth


class Lin(Sig):
    """Sum of products: terms of (signal, coefficient P or signal)."""

    def __init__(self, terms):
        self.terms = terms


# -- algorithm builder --------------------------------------------------------

class Line:
    """A delay line: written once per sample, read by any number of taps."""

    def __init__(self, alg, name, block_ram=False):
        self.alg, self.name, self.block_ram = alg, name, block_ram
        self.written = None
        self.taps = []
        self.modtaps = []

    def write(self, sig):
        if self.written is not None:
            raise ValueError(f"delay line {self.name!r} written twice")
        self.written = sig

    def tap(self, delay):
        """Tap `delay` samples old (number or P; at least 1)."""
        t = Tap(self, delay)
        self.taps.append(t)
        return t

    def modtap(self, center, depth, mod, max_depth=None):
        """Interpolated tap at center + depth * mod samples.

        `max_depth` (samples) bounds the excursion; it defaults to the largest
        value `depth` can take.
        """
        if max_depth is None:
            max_depth = bounds(depth, self.alg.params)[1]
        t = ModTap(self, center, depth, mod, int(math.ceil(max_depth)))
        self.modtaps.append(t)
        return t


class State:
    """A register that keeps its value from one sample to the next."""

    def __init__(self, alg, name, init):
        self.alg, self.name, self.init = alg, name, init
        self.prev = Reg("state", state=self)
        self.written = None

    def write(self, sig):
        if self.written is not None:
            raise ValueError(f"state {self.name!r} written twice")
        self.written = sig


class Lfo:
    """A hardware LFO. Its outputs are registers updated once per sample."""

    def __init__(self, index, rate, phase):
        self.index, self.rate, self.phase = index, P.lift(rate), phase
        self.sin = Reg("lfo", index, isa.LFO_SIN)
        self.cos = Reg("lfo", index, isa.LFO_COS)
        self.tri = Reg("lfo", index, isa.LFO_TRI)
        self.saw = Reg("lfo", index, isa.LFO_SAW)


class Algorithm:
    """What `build(a)` receives: the algorithm under construction."""

    def __init__(self, name, fs):
        self.name, self.fs = name, fs
        self.params = []
        self.lines = []
        self.states = []
        self.triggers = []
        self.lfos = []
        self.outputs = {}
        self.noise = Reg("noise")
        self.one = Reg("one")

    def param(self, name, default, lo, hi, unit="", curve="lin", fade_ms=0.0, page="main",
              help="", step=0.0):
        """Declare a parameter. With `fade_ms`, every tap whose delay depends on
        it crossfades from the old to the new position over that time instead
        of jumping (for size, predelay and the like). `page` is the menu page
        the firmware shows it on, `help` the sentence it shows for it, and
        `step` the menu's step for a linear one (1 for a switch or semitones;
        the default is a round step giving about 100)."""
        if step and (curve != "lin" or abs((hi - lo) / step - round((hi - lo) / step)) > 1e-9):
            raise ValueError(f"parameter {name!r}: step {step} must divide [{lo}, {hi}] (lin only)")
        if any(p.name == name for p in self.params):
            raise ValueError(f"parameter {name!r} declared twice")
        if not lo <= default <= hi:
            raise ValueError(f"parameter {name!r}: default outside [{lo}, {hi}]")
        self.params.append(isa.ParamDecl(name, float(default), float(lo), float(hi), unit, curve,
                                         float(fade_ms), page, help, float(step)))
        return P("param", name)

    def input(self, k):
        return Reg("in", k)

    def output(self, k, sig):
        if k in self.outputs:
            raise ValueError(f"output {k} written twice")
        self.outputs[k] = sig

    def delay(self, name, block_ram=False):
        """A delay line. Lines whose taps can be shorter than 64 samples are in
        block RAM, the rest in the PSRAM; `block_ram` puts a longer one in
        block RAM too, where a modulated tap costs no stream buffer (the
        pool, 2,048 words in this build, is shared by a type's block-RAM
        lines: about 42 ms at 48 kHz)."""
        line = Line(self, name, block_ram)
        self.lines.append(line)
        return line

    def state(self, name, init=0.0):
        s = State(self, name, init)
        self.states.append(s)
        return s

    def trigger(self, name, decay_ms, help=""):
        """A one-shot envelope the firmware fires (a menu button or a gate):
        firing sets it to 1, and from then on it falls by 60 dB every
        `decay_ms`. Returns the envelope, 0 until the first firing."""
        env = self.state(name)
        env.write(env.prev * 10.0 ** (-3.0 / (decay_ms * self.fs / 1000.0)))
        self.triggers.append((name, env, help))
        return env.prev

    def lfo(self, rate_hz, phase=0.0):
        if len(self.lfos) == isa.N_LFO:
            raise ValueError(f"at most {isa.N_LFO} LFOs")
        lfo = Lfo(len(self.lfos), rate_hz, phase)
        self.lfos.append(lfo)
        return lfo

    def ms(self, x):
        """Milliseconds -> samples at this sample rate (number or P)."""
        return x * (self.fs / 1000.0)

    def seconds(self, x):
        return x * float(self.fs)
