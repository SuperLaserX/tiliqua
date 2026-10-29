"""Rust for the firmware, from the compiled programs a bitstream carries.

- `program.rs` (included by the `bfr-cpu` crate): a module per program with
  its tables, parameter declarations (menu grids, help text), presets, and
  every parameter-driven coefficient, tap offset and LFO rate as bytecode
  over the parameter values (`bytecode`: the same expressions the model
  evaluates, in the same order, for `cpu/src/expr.rs`) with the program's
  constant pool; `PROGRAMS`, and the table sizes as the largest of the set.
- `ui.rs` (included by the firmware's options.rs): the menu pages. Each
  parameter page is a row of slots (`ParamOption`), bound to whichever
  program is running, so one menu serves every type.

`top.py` writes both for the algorithms and sample rate it builds.
"""

import math
import struct
import zlib

from . import isa
from .dsl import P

# Menu grid: lin parameters step by a round number (about 100 steps), log
# parameters take LOG_STEPS steps between the ends.
LOG_STEPS = 100


def _lit(x):
    if math.isinf(x):
        return "f64::INFINITY" if x > 0 else "f64::NEG_INFINITY"
    s = repr(float(x))
    return f"({s}f64)" if s.startswith("-") else f"{s}f64"


_UNARY = {"exp": "math::exp", "log": "math::ln", "sqrt": "math::sqrt", "sin": "math::sin",
          "cos": "math::cos", "tan": "math::tan", "floor": "math::floor", "abs": "math::abs"}
_BINARY = {"add": "+", "sub": "-", "mul": "*", "div": "/"}
_CALLS = {"pow": "math::pow", "min": "math::min", "max": "math::max"}


# cpu/src/expr.rs's opcodes
_OPS = {name: k for k, name in enumerate(
    ("const", "param", "add", "sub", "mul", "div", "pow", "min", "max",
     "exp", "log", "sqrt", "sin", "cos", "tan", "floor", "abs", "round"))}
EXPR_STACK = 16


def bytecode(p, index, consts):
    """`p` (a P) as postfix bytes for `cpu/src/expr.rs`: operands depth
    first, left first, so the evaluator does the same operations in the
    same order as `rust_expr`. Constants are added to `consts` (a list, the
    program's pool, shared by its expressions)."""
    code = []
    depth = [0, 0]                          # current, deepest

    def push():
        depth[0] += 1
        depth[1] = max(depth[1], depth[0])

    def emit(p):
        p = P.lift(p)
        if p.op == "const":
            x = p.args[0]
            # (by bits: 0.0 and -0.0 differ, as do NaNs)
            key = struct.pack("<d", x)
            for k, c in enumerate(consts):
                if struct.pack("<d", c) == key:
                    break
            else:
                k = len(consts)
                consts.append(x)
            if k > 255:
                raise ValueError("more than 256 constants in a program's expressions")
            code.extend((_OPS["const"], k))
            push()
            return
        if p.op == "param":
            code.extend((_OPS["param"], index[p.args[0]]))
            push()
            return
        if p.op not in _OPS:
            raise ValueError(f"no bytecode for {p.op!r}")
        for a in p.args:
            emit(a)
        code.append(_OPS[p.op])
        depth[0] -= len(p.args) - 1

    emit(p)
    if depth[1] > EXPR_STACK:
        raise ValueError(f"expression needs a stack of {depth[1]} (the evaluator has {EXPR_STACK})")
    return code


def rust_expr(p, index):
    """`p` (a P) as a Rust f64 expression of the parameter slice `p`."""
    p = P.lift(p)
    if p.op == "const":
        return _lit(p.args[0])
    if p.op == "param":
        return f"p[{index[p.args[0]]}]"
    args = [rust_expr(a, index) for a in p.args]
    if p.op in _BINARY:
        return f"({args[0]} {_BINARY[p.op]} {args[1]})"
    if p.op in _CALLS:
        return f"{_CALLS[p.op]}({args[0]}, {args[1]})"
    if p.op == "round":
        return f"math::floor({args[0]} + 0.5f64)"
    if p.op in _UNARY:
        return f"{_UNARY[p.op]}({args[0]})"
    raise ValueError(f"no Rust for {p.op!r}")


def _nice(x):
    """The smallest 1, 2 or 5 x 10^k >= x."""
    k = math.floor(math.log10(x))
    for m in (1, 2, 5, 10):
        if m * 10 ** k >= x * (1 - 1e-12):
            return m * 10 ** k
    return 10 ** (k + 1)


def grid(d):
    """(log, steps, default index, decimals) of a parameter's menu grid."""
    lo, hi = d.lo, d.hi
    if d.curve == "log":
        steps = LOG_STEPS
        index = round(math.log(d.default / lo) / math.log(hi / lo) * steps)
        return True, steps, index, -1
    step = d.step or _nice((hi - lo) / 100)
    steps = round((hi - lo) / step)
    if abs(steps * step - (hi - lo)) > 1e-9 * (hi - lo):
        steps = 100
    index = round((d.default - lo) / (hi - lo) * steps)
    decimals = max(0, -math.floor(math.log10(step) + 1e-9))
    return False, steps, index, decimals


def grid_value(d, i):
    """The value at grid index i, as the firmware computes it (`ParamDecl::at`)."""
    log, steps, index, _ = grid(d)
    if i == index:
        return d.default
    if i >= steps:
        return d.hi
    t = i / steps
    return d.lo * (d.hi / d.lo) ** t if log else d.lo + (d.hi - d.lo) * t


def grid_index(d, v):
    """The menu grid index nearest to value v."""
    log, steps, index, _ = grid(d)
    if v == d.default:
        return index
    t = math.log(v / d.lo) / math.log(d.hi / d.lo) if log else (v - d.lo) / (d.hi - d.lo)
    return max(0, min(steps, round(t * steps)))


def pages(progs):
    """Menu pages, in order of first use across the programs."""
    names = []
    for prog in progs:
        for d in prog.params:
            if d.page not in names:
                names.append(d.page)
    return names


def slots(prog, page_names):
    """(page, slot) of each parameter: its place on its page."""
    used = [0] * len(page_names)
    out = []
    for d in prog.params:
        pg = page_names.index(d.page)
        out.append((pg, used[pg]))
        used[pg] += 1
    return out


def _ident(name):
    if not name.isidentifier():
        raise ValueError(f"program name {name!r} is not a Rust identifier")
    return name


def _str(s):
    return '"' + s.replace("\\", "\\\\").replace('"', '\\"') + '"'


def _program_mod(prog, page_names):
    names = [d.name for d in prog.params]
    if len(names) > 32:
        raise ValueError("at most 32 parameters")
    index = {n: i for i, n in enumerate(names)}
    fade_group = {name: g for g, (name, _) in enumerate(prog.fades)}
    consts = []

    def mask(p):
        return sum(1 << index[n] for n in P.lift(p).params())

    def env(e):
        return "Env::Current" if e is None else f"Env::Side({e[0]}, {e[1]})"

    def exprs(items):
        rows = []
        for target, base, p, e in items:
            code = ", ".join(map(str, bytecode(p, index, consts)))
            rows.append(f"        Expr {{ target: {target}, base: {base}, env: {env(e)}, "
                        f"params: {mask(p):#x}, code: &[{code}] }},")
        return "&[\n" + "\n".join(rows) + "\n    ]" if rows else "&[]"

    params = []
    for d, (pg, slot) in zip(prog.params, slots(prog, page_names)):
        log, steps, idx, dec = grid(d)
        params.append(
            f"        ParamDecl {{ name: {_str(d.name)}, label: {_str(d.name.replace('_', '-'))}, "
            f"default: {_lit(d.default)}, lo: {_lit(d.lo)}, hi: {_lit(d.hi)}, unit: {_str(d.unit)}, "
            f"log: {'true' if log else 'false'}, steps: {steps}, default_index: {idx}, "
            f"decimals: {dec}, fade: {fade_group.get(d.name, -1)}, page: {pg}, slot: {slot}, "
            f"help: {_str(d.help)} }},")
    taps = []
    for t in prog.taps:
        taps.append(f"        TapDesc {{ space: {t.space}, kind: {t.kind}, offset: {t.offset}, "
                    f"depth: {t.depth}, mreg: {t.mreg}, buf: {t.buf}, bmask: {t.bmask}, "
                    f"stream: {t.stream}, group: {t.group}, side: {t.side} }},")
    presets = []
    decls = {d.name: d for d in prog.params}
    from .compiler import FOLLOWERS
    for name, values in prog.presets:
        vals = ", ".join(f"({index[k]}, {grid_index(decls[k], v)})" for k, v in values.items())
        # (source: the firmware's numbering, CV1, CV2, then the followers)
        mods = ", ".join(f"({2 + FOLLOWERS.index(src)}, {index[k]}, {pct})"
                         for src, k, pct in prog.preset_mods.get(name, []))
        presets.append(f"        Preset {{ name: {_str(name)}, values: &[{vals}], mods: &[{mods}] }},")
    triggers = [f"Trigger {{ name: {_str(n)}, reg: {r}, help: {_str(h)} }}"
                for n, r, h in prog.triggers]
    st = prog.streams
    regs = ", ".join(f"({r}, {bits:#x})" for r, bits in sorted(prog.reg_init.items()))

    def words(xs, fmt="{:#x}"):
        return "&[" + ", ".join(fmt.format(x) for x in xs) + "]"

    nl = "\n"
    coef_exprs = exprs([(i, 0, p, e) for i, p, e in prog.coef_exprs])
    tap_exprs = exprs([(i, base, p, e) for i, base, p, e in prog.tap_exprs])
    lfo_exprs = exprs([(k, 0, p, None) for k, p in prog.lfo_exprs])
    return f"""
/// {prog.title or prog.name}: {prog.description}
pub mod {_ident(prog.name)} {{
    use crate::types::*;

    pub static PROGRAM: Program = Program {{
    name: {_str(prog.name)},
    title: {_str(prog.title or prog.name)},
    description: {_str(prog.description)},
    fs: {prog.fs},
    instrs: {words(i.encode() for i in prog.instrs)},
    coefs: {words(prog.coefs)},
    regs: &[{regs}],
    lfo_phase: [{", ".join(map(str, prog.lfo_phase))}],
    lfo_inc: [{", ".join(map(str, prog.lfo_inc))}],
    mem_words: [{prog.mem_words[isa.SPACE_PSRAM]}, {prog.mem_words[isa.SPACE_EBR]}],
    params: &[
{nl.join(params)}
    ],
    presets: &[
{nl.join(presets)}
    ],
    triggers: &[{", ".join(triggers)}],
    coef_exprs: {coef_exprs},
    tap_exprs: {tap_exprs},
    lfo_exprs: {lfo_exprs},
    consts: &[{", ".join(_lit(c) for c in consts)}],
    fades: &[{", ".join(f"({index[n]}, {s})" for n, s in prog.fades)}],
    taps: &[
{nl.join(taps)}
    ],
    streams: {words(st["taps"], "{}")},
    warmup: {words(st["warmup"], "{}")},
    burst: {st["burst"]},
    }};
}}
"""


def program_rs(progs):
    if not progs:
        raise ValueError("no programs")
    if len({p.fs for p in progs}) != 1:
        raise ValueError("programs for different sample rates")
    page_names = pages(progs)
    names = ", ".join(p.name for p in progs)
    out = [f"// Generated by model/rustgen.py: {names} at {progs[0].fs} Hz. Do not edit.\n"]
    out.append(f"""
/// Table sizes: the largest of the programs (the CPU keeps a copy of each).
pub const N_COEFS: usize = {max(len(p.coefs) for p in progs)};
pub const N_TAPS: usize = {max(len(p.taps) for p in progs)};
pub const N_STREAMS: usize = {max(len(p.streams["taps"]) for p in progs)};
pub const N_PROGRAMS: usize = {len(progs)};
/// Menu pages of the parameters (`ParamDecl::page` indexes this).
pub static PAGES: [&str; {len(page_names)}] = [{", ".join(_str(n) for n in page_names)}];

pub static PROGRAMS: [&Program; N_PROGRAMS] = [{", ".join(f"&{p.name}::PROGRAM" for p in progs)}];
/// The first program, which the bitstream holds at power-up.
pub use {progs[0].name}::PROGRAM;
""")
    for prog in progs:
        out.append(_program_mod(prog, page_names))
    return "".join(out)


def _key(*parts):
    """A stable option key for persistence (as the opts derive's are)."""
    return zlib.crc32("/".join(parts).encode()) & 0xFFFFFFFF


def _camel(name):
    return "".join(w.capitalize() for w in name.replace("-", "_").split("_"))


# The modulation sources' depth pages, in the firmware's order (cv.rs).
SOURCES = ("cv1", "cv2", "level", "bass", "treble")


def ui_rs(progs):
    """The saved state (the opts crate's pages; the UI itself is the
    firmware's): Type, one page per parameter page, a depth page per
    modulation source (`SOURCES`) and Settings (TypeOpts, CvOpts'
    DepthOption and SettingsOpts are hand-written in options.rs). A parameter page holds as many slots as the program with
    most parameters on it; every page lists all its slots, used by the loaded
    type or not, so saving and loading never depend on which type is loaded."""
    page_names = pages(progs)
    out = ["// Generated by model/rustgen.py. Do not edit.\n"]
    variants = "\n".join(f"    {_camel(p)}," for p in page_names)
    out.append(f"""
#[derive(Default, Clone, Copy, PartialEq, EnumIter, IntoStaticStr, Serialize, Deserialize)]
#[strum(serialize_all = "SCREAMING-KEBAB-CASE")]
pub enum Page {{
    #[default]
    Type,
{variants}
{chr(10).join(f"    {_camel(src)}," for src in SOURCES)}
    Settings,
}}
""")
    n_slots = 0
    for pg, p in enumerate(page_names):
        n = max(sum(1 for d in prog.params if d.page == p) for prog in progs)
        cls = f"{_camel(p)}Opts"
        inits = ", ".join(f"ParamOption::new({pg}, {j}, {_key('slot', p, str(j)):#010x})"
                          for j in range(n))
        n_slots += n
        out.append(f"""
#[derive(Clone)]
pub struct {cls} {{
    pub slots: [ParamOption; {n}],
}}

impl Default for {cls} {{
    fn default() -> Self {{
        Self {{ slots: [{inits}] }}
    }}
}}

impl OptionPage for {cls} {{
    fn options(&self) -> OptionVec<'_> {{
        let mut r = OptionVec::new();
        for s in self.slots.iter() {{
            r.push(s).ok();
        }}
        r
    }}

    fn options_mut(&mut self) -> OptionVecMut<'_> {{
        let mut r = OptionVecMut::new();
        for s in self.slots.iter_mut() {{
            r.push(s).ok();
        }}
        r
    }}

    fn set_parent_key(&mut self, parent_key: u32) {{
        for s in self.slots.iter_mut() {{
            s.key_mut().hash_with(parent_key);
        }}
    }}
}}
""")
    depth_inits = ", ".join(f"DepthOption::new({_key('depth', str(j)):#010x})" for j in range(n_slots))
    page_fields = "\n".join(f"    #[page(Page::{_camel(p)})]\n    pub {p}: {_camel(p)}Opts,"
                            for p in page_names)
    source_fields = "\n".join(f"    #[page(Page::{_camel(src)})]\n    pub {src}: CvOpts,"
                              for src in SOURCES)

    def arms(mut):
        r = "&mut " if mut else "&"
        last = len(SOURCES) - 1
        return "\n".join(f"            {k if k < last else '_'} => {r}self.{src}.depth,"
                         for k, src in enumerate(SOURCES))
    depth_arms, depth_arms_mut = arms(False), arms(True)
    out.append(f"""
/// Every parameter slot, in or out of use.
pub const N_SLOTS: usize = {n_slots};

/// One modulation source's depth for every slot, in slot order.
#[derive(Clone)]
pub struct CvOpts {{
    pub depth: [DepthOption; N_SLOTS],
}}

impl Default for CvOpts {{
    fn default() -> Self {{
        Self {{ depth: [{depth_inits}] }}
    }}
}}

impl OptionPage for CvOpts {{
    fn options(&self) -> OptionVec<'_> {{
        let mut r = OptionVec::new();
        for d in self.depth.iter() {{
            r.push(d).ok();
        }}
        r
    }}

    fn options_mut(&mut self) -> OptionVecMut<'_> {{
        let mut r = OptionVecMut::new();
        for d in self.depth.iter_mut() {{
            r.push(d).ok();
        }}
        r
    }}

    fn set_parent_key(&mut self, parent_key: u32) {{
        for d in self.depth.iter_mut() {{
            d.key_mut().hash_with(parent_key);
        }}
    }}
}}

#[derive(Options, Clone)]
pub struct Opts {{
    pub tracker: ScreenTracker<Page>,
    #[page(Page::Type)]
    pub kind: TypeOpts,
{page_fields}
{source_fields}
    #[page(Page::Settings)]
    pub settings: SettingsOpts,
}}

impl Opts {{
    /// The slots of every page in order (N_SLOTS of them).
    pub fn slots(&self) -> impl Iterator<Item = &ParamOption> {{
        core::iter::empty(){"".join(f".chain(self.{p}.slots.iter())" for p in page_names)}
    }}

    pub fn slots_mut(&mut self) -> impl Iterator<Item = &mut ParamOption> {{
        core::iter::empty(){"".join(f".chain(self.{p}.slots.iter_mut())" for p in page_names)}
    }}

    /// Source `c`'s (`cv::SOURCE_NAMES`) depth for each slot.
    pub fn depths(&self, c: usize) -> &[DepthOption; N_SLOTS] {{
        match c {{
{depth_arms}
        }}
    }}

    pub fn depths_mut(&mut self, c: usize) -> &mut [DepthOption; N_SLOTS] {{
        match c {{
{depth_arms_mut}
        }}
    }}
}}
""")
    return "".join(out)


def write(progs, directory):
    """Write program.rs and ui.rs for `progs` (a program or a list) into
    `directory`; returns their paths. Only rewrites a changed file, so cargo
    doesn't rebuild for nothing."""
    import os
    if not isinstance(progs, (list, tuple)):
        progs = [progs]
    os.makedirs(directory, exist_ok=True)
    paths = []
    for name, text in (("program.rs", program_rs(progs)), ("ui.rs", ui_rs(progs))):
        path = os.path.join(directory, name)
        if not os.path.exists(path) or open(path).read() != text:
            with open(path, "w", newline="\n") as f:
                f.write(text)
        paths.append(path)
    return paths
