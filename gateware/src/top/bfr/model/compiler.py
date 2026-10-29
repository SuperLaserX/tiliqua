"""Compiler: an algorithm's signal graph -> a scheduled program and its tables.

Steps:

1. Lower the `Sig` graph to nodes. A node is one sum of products, computed in
   one accumulator; its terms are (operand A, operand B) pairs. A tap whose
   delay depends on a crossfaded parameter becomes two taps (sides A and B),
   weighted by the group's fade weights.
2. Inline every node used exactly once (and not stored) into its consumer, so
   `(x + y) * 0.5` becomes one chain of two products.
3. Decide where each value lives: a value with one use stays in its
   accumulator and its consumer reads it there; a value with several uses, or
   used as the B operand of a signal product, is also stored to a temporary
   register.
4. List-schedule the instructions cycle by cycle, highest critical path first,
   honouring the pipeline latencies in `isa` and the 8 accumulators. Stores
   go in each instruction's store slot.
5. Lay out the delay lines (block RAM for short ones, PSRAM for the rest),
   the tap table, the coefficient bank and the registers.

Operands (tuples):
    A: ("mem", tap) | ("reg", key) | ("node", Node) | ("interp", modtap, which, side)
    B: ("coef", P) | ("cfade", P, group, side) | ("reg", key) | ("node", Node)
       | ("interp", which)
"""

import math

from . import fp, isa
from .dsl import Algorithm, Lin, ModTap, P, Reg, Sig, Tap, bounds
from .engine import lfo_increment

CLOCK_HZ = 60_000_000
MIN_PSRAM_DELAY = 64        # shorter lines go to block RAM (the stream engine needs >= 2N + 1)
EBR_WORDS = 4096            # block-RAM delay pool (8 EBR of 512 x 36)
PSRAM_WORDS = 1 << 20       # 4 MB of PSRAM for delay memory (the SoC's ring, at 8 MB)
EBR_BLOCK_WORDS = 512       # 32-bit words per EBR
PSRAM_BURST_OVERHEAD = 20   # bus clocks per burst besides its data beats (H3000: 28 per 8 beats)


class CompileError(Exception):
    pass


class Node:
    def __init__(self, nid, label=""):
        self.id = nid
        self.label = label or f"n{nid}"
        self.terms = []         # [A, B] lists
        self.stores = []        # ("mem", line) | ("reg", regkey) | ("out", k) | ("mod", modtap)
        self.uses = []          # (consumer, term index, "A" | "B")

    def __repr__(self):
        return self.label


class Side:
    """One side (0 = A, 1 = B) of a crossfaded tap or modulated tap."""

    def __init__(self, tap, group, side):
        self.tap, self.group, self.side = tap, group, side

    def __getattr__(self, name):
        return getattr(self.tap, name)


def _opkey(op):
    if op[0] == "mem":
        return ("mem", id(op[1].line), op[1].delay.key(), getattr(op[1], "side", None))
    if op[0] == "node":
        return ("node", op[1].id)
    if op[0] == "interp":
        return ("interp",) + tuple(id(x) if i == 0 else x for i, x in enumerate(op[1:]))
    return op


def _bkey(b):
    """Merge key of a coefficient-like B operand, or None."""
    if b[0] == "coef":
        return ("coef",)
    if b[0] == "cfade":
        return ("cfade", b[2], b[3])
    return None


class _Lowering:
    """Sig graph -> nodes."""

    def __init__(self, fade_group):
        self.fade_group = fade_group        # param name -> group
        self.nodes = []
        self.memo = {}          # id(Sig) -> Node
        self.modnodes = {}      # id(ModTap) -> (value node, mod node)
        self.modtaps = []
        self.taps = {}          # key -> Tap or Side (deduplicated)
        self.xfade = {}         # (id(line), delay key) -> crossfaded tap node

    def new_node(self, label=""):
        n = Node(len(self.nodes), label)
        self.nodes.append(n)
        return n

    def group_of(self, p):
        groups = {self.fade_group[n] for n in p.params() if n in self.fade_group}
        if len(groups) > 1:
            raise CompileError(f"a tap delay depends on two crossfaded parameters: {p!r}")
        return groups.pop() if groups else None

    def operand(self, sig):
        """A-side operand for a signal."""
        if isinstance(sig, Reg):
            return ("reg", sig.key())
        if isinstance(sig, Tap):
            g = self.group_of(sig.delay)
            if g is None:
                return ("mem", self.taps.setdefault((id(sig.line), sig.delay.key(), None), sig))
            return ("node", self.xfade_tap(sig, g))
        if isinstance(sig, ModTap):
            return ("node", self.modtap_node(sig))
        if isinstance(sig, Lin):
            return ("node", self.lin_node(sig))
        raise CompileError(f"not a signal: {sig!r}")

    def xfade_tap(self, tap, g):
        key = (id(tap.line), tap.delay.key())
        if key not in self.xfade:
            n = self.new_node(f"{tap.line.name}.xfade")
            for side in (0, 1):
                t = self.taps.setdefault(key + (side,), Side(tap, g, side))
                n.terms.append([("mem", t), ("cfade", P.lift(1.0), g, side)])
            self.xfade[key] = n
        return self.xfade[key]

    def node_of(self, sig, label=""):
        """A node computing `sig` (wrapping a source in x * 1.0 if needed)."""
        op = self.operand(sig)
        if op[0] == "node":
            return op[1]
        n = self.new_node(label)
        n.terms.append([op, ("coef", P.lift(1.0))])
        return n

    def lin_node(self, lin):
        n = self.memo.get(id(lin))
        if n:
            return n
        n = self.new_node(getattr(lin, "label", ""))
        self.memo[id(lin)] = n
        for x, c in lin.terms:
            if isinstance(c, Sig):
                # Signal product: B must come from a register.
                if isinstance(c, Reg):
                    a, b = self.operand(x), ("reg", c.key())
                elif isinstance(x, Reg):
                    a, b = self.operand(c), ("reg", x.key())
                else:
                    a, b = self.operand(x), ("node", self.node_of(c))
            else:
                a, b = self.operand(x), ("coef", c)
            n.terms.append([a, b])
        return n

    def modtap_node(self, mt):
        if id(mt) in self.modnodes:
            return self.modnodes[id(mt)][0]
        # The offset is computed scaled by 1/256 (so large depths fit the
        # accumulator) and stored as fixed point (samples * 2^16).
        mod = self.new_node(f"{mt.line.name}.mod")
        mod.terms.append([self.operand(mt.mod), ("coef", mt.depth * fp.MOD_SCALE)])
        mod.stores.append(("mod", mt))

        def interp(side, label):
            n = self.new_node(label)
            n.terms.append([("interp", mt, 0, side), ("interp", 0)])
            n.terms.append([("interp", mt, 1, side), ("interp", 1)])
            return n
        g = self.group_of(mt.center)
        if g is None:
            n = interp(None, f"{mt.line.name}.modtap")
        else:
            n = self.new_node(f"{mt.line.name}.modtap.xfade")
            for side in (0, 1):
                s = interp(side, f"{mt.line.name}.modtap.{'ab'[side]}")
                n.terms.append([("node", s), ("cfade", P.lift(1.0), g, side)])
        self.modnodes[id(mt)] = (n, mod)
        self.modtaps.append(mt)
        return n


def _compute_uses(nodes):
    for n in nodes:
        n.uses = []
    for c in nodes:
        for ti, (a, b) in enumerate(c.terms):
            if a[0] == "node":
                a[1].uses.append((c, ti, "A"))
            if b[0] == "node":
                b[1].uses.append((c, ti, "B"))


def _live(nodes):
    """Nodes reachable from stores."""
    live, stack = set(), [n for n in nodes if n.stores]
    while stack:
        n = stack.pop()
        if n.id in live:
            continue
        live.add(n.id)
        for a, b in n.terms:
            for op in (a, b):
                if op[0] == "node":
                    stack.append(op[1])
    return [n for n in nodes if n.id in live]


def _scaled(n, kb):
    """n's terms with consumer coefficient kb folded in, or None if impossible."""
    k = kb[1]
    unit = kb[0] == "coef" and k.const == 1.0
    out = []
    for a, b in n.terms:
        if b[0] == "coef":
            nb = ("coef", b[1] * k) if kb[0] == "coef" else ("cfade", b[1] * k, kb[2], kb[3])
        elif b[0] == "cfade":
            if kb[0] == "cfade":
                return None             # a product of two fade weights
            nb = ("cfade", b[1] * k, b[2], b[3])
        elif unit:
            nb = b
        else:
            return None
        out.append([a, nb])
    return out


def _inline(nodes):
    """Fold single-use, unstored nodes into their consumer."""
    while True:
        nodes = _live(nodes)
        _compute_uses(nodes)
        changed = False
        for n in nodes:
            if n.stores or len(n.uses) != 1:
                continue
            c, ti, side = n.uses[0]
            kb = c.terms[ti][1]
            if side != "A" or _bkey(kb) is None:
                continue
            moved = _scaled(n, kb)
            if moved is None:
                continue
            c.terms[ti:ti + 1] = moved
            n.terms = []
            changed = True
            break           # uses changed; recompute
        if not changed:
            return nodes


def _merge_terms(n):
    """Combine terms with the same A operand and coefficient kind; drop zeros."""
    out, seen = [], {}
    for a, b in n.terms:
        bk = _bkey(b)
        if bk is not None:
            key = (_opkey(a), bk)
            if key in seen:
                t = out[seen[key]]
                t[1] = (t[1][0], t[1][1] + b[1]) + tuple(t[1][2:])
                continue
            seen[key] = len(out)
        out.append([a, b])
    out = [t for t in out if not (_bkey(t[1]) is not None and t[1][1].const == 0.0)]
    if not out:
        out = [[("reg", ("one", 0, 0)), ("coef", P.lift(0.0))]]
    n.terms = out


# -- scheduling -----------------------------------------------------------------

class _Scheduler:

    def __init__(self, nodes, modnode_of, temps):
        self.nodes = nodes
        self.modnode_of = modnode_of       # id(ModTap) -> mod node
        self.free_accs = list(range(isa.N_ACC))
        self.free_temps = list(temps)
        self.temps_peak = 0
        self.accs_peak = 0
        self.spills = 0
        self.mod_time = {}                 # id(ModTap) -> store cycle
        self.state_reads = {}              # state key -> unissued reads
        self.out = []
        for n in nodes:
            n.remaining = list(range(len(n.terms)))
            n.acc = None
            n.started = n.done = False
            n.t_done = None
            n.reg = None                   # (register, store cycle)
            n_reads = len(n.uses)
            n.mode = "reg" if (n_reads >= 2 or any(s == "B" for _, _, s in n.uses)) else "acc"
            n.acc_reads = n_reads if n.mode == "acc" else 0
            n.reg_reads = n_reads if n.mode == "reg" else 0
            n.pending = list(n.stores) + (["temp"] if n.mode == "reg" else [])
            for a, b in n.terms:
                for op in (a, b):
                    if op[0] == "reg" and op[1][0] == "state":
                        self.state_reads[op[1]] = self.state_reads.get(op[1], 0) + 1
        self._heights()

    def _heights(self):
        consumers_of_mod = {}
        for n in self.nodes:
            for a, _ in n.terms:
                if a[0] == "interp":
                    consumers_of_mod.setdefault(id(a[1]), set()).add(n)
        memo = {}

        def h(n):
            if n.id in memo:
                return memo[n.id]
            memo[n.id] = 0              # guards against (impossible) cycles
            best = isa.LAT_ACC if n.stores else 0
            for c, _, side in n.uses:
                lat = isa.LAT_ACC if n.mode == "acc" else isa.LAT_ACC + isa.LAT_REG
                best = max(best, lat + h(c))
            for s in n.stores:
                if s[0] == "mod":
                    for c in consumers_of_mod.get(id(s[1]), ()):
                        best = max(best, isa.LAT_ACC + isa.LAT_MOD + h(c))
            memo[n.id] = len(n.terms) + best
            return memo[n.id]
        for n in self.nodes:
            n.height = h(n)

    # readiness
    def _op_ready(self, op, t):
        kind = op[0]
        if kind in ("mem", "reg", "coef", "cfade"):
            return True
        if kind == "interp":
            if len(op) == 2:
                return True
            st = self.mod_time.get(id(op[1]))
            return st is not None and t >= st + isa.LAT_MOD
        x = op[1]
        if x.mode == "acc":
            return x.done and x.acc is not None and t >= x.t_done + isa.LAT_ACC
        return x.reg is not None and t >= x.reg[1] + isa.LAT_REG

    def _term_ready(self, n, ti, t):
        a, b = n.terms[ti]
        return self._op_ready(a, t) and self._op_ready(b, t)

    def _deps_started(self, n):
        for a, b in n.terms:
            for op in (a, b):
                if op[0] == "node" and not op[1].started:
                    return False
                if op[0] == "interp" and len(op) > 2 and not self.modnode_of[id(op[1])].started:
                    return False
        return True

    def _store_ready(self, x, dest, t, extra_reads=()):
        if not (x.done and x.acc is not None and t >= x.t_done + isa.LAT_ACC):
            return False
        if dest[0] == "reg" and dest[1][0] == "state":
            left = self.state_reads.get(dest[1], 0) - sum(1 for k in extra_reads if k == dest[1])
            return left == 0
        return True

    # one cycle
    def step(self, t):
        cands = []
        acc_short = False
        for n in self.nodes:
            if n.done:
                continue
            if n.started:
                for ti in n.remaining:
                    if self._term_ready(n, ti, t):
                        cands.append(((1, n.height), n, ti, None))
                        break
                continue
            if not self._deps_started(n):
                continue
            ready = [ti for ti in n.remaining if self._term_ready(n, ti, t)]
            if not ready:
                continue
            inplace = [(ti, x) for ti in ready for x in [self._inplace(n, ti, t)] if x is not None]
            if inplace:
                cands.append(((2, n.height), n, inplace[0][0], inplace[0][1]))
            elif self.free_accs:
                cands.append(((0, n.height), n, ready[0], None))
            else:
                acc_short = True
        instr = None
        if cands:
            # critical path first; among equals finish chains, then reuse accs
            prio, n, ti, inplace = max(cands, key=lambda c: (c[0][1], c[0][0]))
            instr = self._issue(n, ti, inplace, t)
        store = self._pick_store(instr, t)
        if instr is None and store is None and acc_short:
            victim = self._spill_victim(t)
            if victim is not None:
                self.spills += 1
                victim.mode = "reg"
                victim.reg_reads = victim.acc_reads
                victim.acc_reads = 0
                victim.pending.append("temp")
                store = self._pick_store(None, t)
        rec = None
        if store is not None:
            x, dest = store
            self._do_store(store, t)
            rec = {"node": x, "dest": dest, "acc": x.acc_at_store,
                   "reg": x.reg[0] if dest == "temp" else None}
        if instr is not None:
            self._release_inplace(instr)
        for n in self.nodes:
            self._maybe_release(n)
        self.accs_peak = max(self.accs_peak, isa.N_ACC - len(self.free_accs))
        self.out.append((instr, rec))
        return instr is not None or store is not None

    def _inplace(self, n, ti, t):
        a = n.terms[ti][0]
        if a[0] != "node":
            return None
        x = a[1]
        if x.mode != "acc" or x.acc_reads != 1 or x.acc is None:
            return None
        if len(x.pending) > 1:
            return None
        if x.pending and not self._store_ready(x, x.pending[0], t, self._state_keys(n, ti)):
            return None
        return x

    @staticmethod
    def _state_keys(n, ti):
        return [op[1] for op in n.terms[ti] if op[0] == "reg" and op[1][0] == "state"]

    def _issue(self, n, ti, inplace, t):
        a, b = n.terms[ti]
        first = not n.started
        if first:
            n.started = True
            if inplace is not None:
                n.acc = inplace.acc
            else:
                n.acc = self.free_accs.pop(0)
        n.remaining.remove(ti)
        a_acc = None
        if a[0] == "node" and a[1].mode == "acc":
            a_acc = a[1].acc
        for op in (a, b):
            if op[0] == "node":
                x = op[1]
                if x.mode == "acc" and op is a:
                    x.acc_reads -= 1
                else:
                    x.reg_reads -= 1
                    if x.reg_reads == 0 and x.reg is not None:
                        self.free_temps.append(x.reg[0])
            if op[0] == "reg" and op[1][0] == "state":
                self.state_reads[op[1]] -= 1
        if not n.remaining:
            n.done, n.t_done = True, t
        return {"node": n, "term": ti, "op": isa.OP_MUL if first else isa.OP_MAC,
                "d": n.acc, "a": a, "b": b, "inplace": inplace, "a_acc": a_acc}

    def _pick_store(self, instr, t):
        a_acc = None
        if instr is not None and instr["a"][0] == "node" and instr["a"][1].mode == "acc":
            a_acc = instr["a"][1]
        best = None
        for x in self.nodes:
            if not x.pending or (a_acc is not None and x is not a_acc):
                continue
            for dest in x.pending:
                if dest == "temp" and not self.free_temps:
                    continue
                if not self._store_ready(x, dest, t):
                    continue
                rank = (3 if dest == "temp" else 2 if dest[0] == "mod" else 1, x.height)
                if best is None or rank > best[0]:
                    best = (rank, x, dest)
        if instr is not None and instr["inplace"] is not None:
            x = instr["inplace"]
            if x.pending:
                return (x, x.pending[0])
        return best and (best[1], best[2])

    def _do_store(self, store, t):
        x, dest = store
        x.pending.remove(dest)
        x.acc_at_store = x.acc
        if dest == "temp":
            r = self.free_temps.pop(0)
            x.reg = (r, t)
            self.temps_peak = max(self.temps_peak, 64 - len(self.free_temps))
            if x.reg_reads == 0:
                self.free_temps.append(r)
        elif dest[0] == "mod":
            self.mod_time[id(dest[1])] = t

    def _release_inplace(self, instr):
        x = instr["inplace"]
        if x is not None:
            x.acc = None            # handed over to the consumer

    def _maybe_release(self, x):
        if x.acc is not None and x.done and x.acc_reads == 0 and not x.pending:
            self.free_accs.append(x.acc)
            x.acc = None

    def _spill_victim(self, t):
        best = None
        for x in self.nodes:
            if x.mode != "acc" or not x.done or x.acc is None or x.acc_reads == 0:
                continue
            if t < x.t_done + isa.LAT_ACC or not self.free_temps:
                continue
            urgency = max((c.height for c, _, _ in x.uses), default=0)
            if best is None or urgency < best[0]:
                best = (urgency, x)
        return best and best[1]

    def run(self):
        t, idle = 0, 0
        while any(not n.done or n.pending for n in self.nodes):
            progressed = self.step(t)
            idle = 0 if progressed else idle + 1
            if idle > 64:
                stuck = [n for n in self.nodes if not n.done or n.pending]
                raise CompileError(f"scheduler stuck at cycle {t}: {stuck[:8]}")
            t += 1
        while self.out and self.out[-1] == (None, None):
            self.out.pop()
        return self.out


# -- layout --------------------------------------------------------------------

def _round_delay(v):
    return int(math.floor(v + 0.5))


def compile_algorithm(build, fs, name=None, crossfade=True, burst=isa.STREAM_BURST,
                      rbuf_words=isa.RBUF_WORDS):
    """Run `build(a)` for sample rate `fs` and compile the result.

    crossfade=False makes parameter-driven taps jump instead (for comparison).
    `burst` and `rbuf_words` are the stream engine's burst length and read
    buffer size (build parameters of the gateware).
    """
    a = Algorithm(name or getattr(build, "__module__", "algorithm"), fs)
    build(a)
    if not crossfade:
        for d in a.params:
            d.fade_ms = 0.0
    return compile_graph(a, burst, rbuf_words)


# Modulation sources a preset may set depths for (the firmware's followers).
FOLLOWERS = ("level", "bass", "treble")


def compile_module(mod, fs, **kwargs):
    """Compile an algorithm module: `build`, `NAME`, and for the menu `TITLE`,
    `DESCRIPTION` and `PRESETS` (a list of (name, {parameter: value}) or
    (name, {parameter: value}, [(follower, parameter, percent)])), which are
    checked against the parameters. A preset's third item sets how the
    input's level, bass or treble (`FOLLOWERS`) moves parameters, as the
    menu's depths do: if any preset of a type has one, every preset sets
    the type's follower depths (those it doesn't list to 0)."""
    prog = compile_algorithm(mod.build, fs, mod.NAME, **kwargs)
    prog.title = getattr(mod, "TITLE", mod.NAME)
    prog.description = getattr(mod, "DESCRIPTION", "")
    decls = {d.name: d for d in prog.params}
    for preset in getattr(mod, "PRESETS", []):
        name, values, mods = (tuple(preset) + ([],))[:3]
        for k, v in values.items():
            if k not in decls:
                raise CompileError(f"{mod.NAME} preset {name!r}: no parameter {k!r}")
            if not decls[k].lo <= v <= decls[k].hi:
                raise CompileError(f"{mod.NAME} preset {name!r}: {k} = {v} outside "
                                   f"[{decls[k].lo}, {decls[k].hi}]")
        for src, k, pct in mods:
            if src not in FOLLOWERS:
                raise CompileError(f"{mod.NAME} preset {name!r}: no follower {src!r} "
                                   f"(one of {', '.join(FOLLOWERS)})")
            if k not in decls:
                raise CompileError(f"{mod.NAME} preset {name!r}: no parameter {k!r}")
            if not (-100 <= pct <= 100 and pct == int(pct)):
                raise CompileError(f"{mod.NAME} preset {name!r}: {src} -> {k} depth {pct} "
                                   f"is not a whole percent in -100..100")
        prog.presets.append((name, dict(values)))
        prog.preset_mods[name] = [(src, k, int(pct)) for src, k, pct in mods]
    return prog


def _pow2(n, at_least):
    w = at_least
    while w < n:
        w *= 2
    return w


def compile_set(mods, fs, prog_depth=isa.PROG_DEPTH, rbuf_words=isa.RBUF_WORDS,
                wbuf_words=isa.WBUF_WORDS, ebr_words=EBR_WORDS, **kwargs):
    """Compile the algorithms one bitstream carries (the firmware loads one at
    a time). Each must fit the frame budget and the sizes they share: program
    memory, stream buffers and the block-RAM delay pool. Returns the programs
    and the sizes the gateware needs: {"prog_depth", "rbuf_words",
    "wbuf_words", "ebr_words"}."""
    progs = [compile_module(mod, fs, rbuf_words=rbuf_words, **kwargs) for mod in mods]
    names = [p.name for p in progs]
    if len(set(names)) != len(names):
        raise CompileError(f"algorithm names repeat: {names}")
    for p in progs:
        r = p.report
        if not r["fits"]:
            raise CompileError(f"{p.name} doesn't fit at {fs} Hz: {r['cycles']} clocks > {r['budget']}")
        if len(p.instrs) > prog_depth:
            raise CompileError(f"{p.name}: {len(p.instrs)} instructions > {prog_depth}")
        if p.streams["wbuf_words"] > wbuf_words:
            raise CompileError(f"{p.name}: write buffer {p.streams['wbuf_words']} words > {wbuf_words}")
        if p.mem_words[isa.SPACE_EBR] > ebr_words:
            raise CompileError(f"{p.name}: block-RAM pool {p.mem_words[isa.SPACE_EBR]} words > {ebr_words}")
    sizes = {
        "prog_depth": prog_depth,
        "rbuf_words": _pow2(max(p.streams["rbuf_words"] for p in progs), 512),
        "wbuf_words": _pow2(max(p.streams["wbuf_words"] for p in progs), 512),
        "ebr_words": max(16, max(p.mem_words[isa.SPACE_EBR] for p in progs)),
    }
    return progs, sizes


def stream_window(t):
    """Addresses a PSRAM read tap reads beyond its offset: a modulated tap reads
    offset - depth - 1 .. offset + depth."""
    return 2 * t.depth + 1 if t.kind == isa.TAP_MOD else 0


def _streams(taps, n_fades, burst, rbuf_words):
    """Give every PSRAM tap a stream number and a stream-buffer region.

    A read tap's region holds its window plus two bursts (the one being read
    and the one being fetched); a write tap's holds two bursts (the one being
    written and the one being flushed). Regions are powers of two at aligned
    bases, so the buffer word for PSRAM address a is buf | (a & bmask).
    """
    if burst < 2 or burst & (burst - 1):
        raise CompileError(f"stream burst {burst} must be a power of two")
    ps = [i for i, t in enumerate(taps) if t.space == isa.SPACE_PSRAM]
    reads = [i for i in ps if taps[i].kind != isa.TAP_WRITE]
    writes = [i for i in ps if taps[i].kind == isa.TAP_WRITE]

    def size(t):
        n = 2 * burst
        while n < stream_window(t) + 2 * burst:
            n *= 2
        return n
    base = 0
    for i in sorted(reads, key=lambda i: -size(taps[i])):      # largest first keeps bases aligned
        taps[i].buf, taps[i].bmask = base, size(taps[i]) - 1
        base += size(taps[i])
    rbuf = base
    for k, i in enumerate(writes):
        taps[i].buf, taps[i].bmask = 2 * burst * k, 2 * burst - 1
    wbuf = 2 * burst * len(writes)
    for s, i in enumerate(ps):
        taps[i].stream = s
    if rbuf > min(rbuf_words, 1 << isa.BUF_BITS):
        raise CompileError(f"PSRAM read streams need {rbuf} buffer words > {rbuf_words}")
    if wbuf > isa.WBUF_WORDS:
        raise CompileError(f"PSRAM write streams need {wbuf} buffer words > {isa.WBUF_WORDS}")
    # After a tap's offset changes (or its stream is enabled), its region holds
    # the right words once the scanner has fetched the window and two bursts.
    warmup = [max((stream_window(taps[i]) + 2 * burst for i in reads if taps[i].group == g),
                  default=0) for g in range(n_fades)]
    return {"burst": burst, "taps": ps, "rbuf_words": rbuf, "wbuf_words": wbuf, "warmup": warmup}


def compile_graph(a, burst=isa.STREAM_BURST, rbuf_words=isa.RBUF_WORDS):
    fade_params = [d for d in a.params if d.fade_ms > 0]
    if len(fade_params) > isa.N_FADE:
        raise CompileError(f"at most {isa.N_FADE} crossfaded parameters")
    fade_group = {d.name: g for g, d in enumerate(fade_params)}
    low = _Lowering(fade_group)
    defaults = {d.name: d.default for d in a.params}

    # Roots: delay-line writes, state writes, outputs.
    for line in a.lines:
        if line.written is None:
            if line.taps or line.modtaps:
                raise CompileError(f"delay line {line.name!r} is read but never written")
            continue
        if not (line.taps or line.modtaps):
            raise CompileError(f"delay line {line.name!r} is written but never read")
        low.node_of(line.written, f"{line.name}.in").stores.append(("mem", line))
    for s in a.states:
        if s.written is None:
            raise CompileError(f"state {s.name!r} is never written")
        low.node_of(s.written, s.name).stores.append(("reg", s.prev.key()))
    for k, sig in sorted(a.outputs.items()):
        low.node_of(sig, f"out{k}").stores.append(("out", k))
    nodes = _inline(low.nodes)
    for n in nodes:
        _merge_terms(n)
    nodes = _inline(nodes)
    _compute_uses(nodes)

    # Registers: states, then one per modulated tap, the rest are temporaries.
    regs = {}
    for s in a.states:
        regs[s.prev.key()] = len(regs)
    modreg = {}
    for mt in low.modtaps:
        modreg[id(mt)] = len(regs) + len(modreg)
    n_fixed = len(regs) + len(modreg)
    if n_fixed > isa.REG_GENERAL:
        raise CompileError(f"{n_fixed} state and modulation registers > {isa.REG_GENERAL}")

    sched = _Scheduler(nodes, {k: v[1] for k, v in low.modnodes.items()},
                       range(n_fixed, isa.REG_GENERAL))
    slots = sched.run()

    # Delay lines.
    space_used = {isa.SPACE_PSRAM: 0, isa.SPACE_EBR: 0}
    line_info = {}
    for line in a.lines:
        if line.written is None:
            continue
        lo_d, hi_d = math.inf, -math.inf
        for t in line.taps:
            lo, hi = bounds(t.delay, a.params)
            lo_d, hi_d = min(lo_d, _round_delay(lo)), max(hi_d, _round_delay(hi))
        for mt in line.modtaps:
            lo, hi = bounds(mt.center, a.params)
            lo_d = min(lo_d, _round_delay(lo) - mt.max_depth)
            hi_d = max(hi_d, _round_delay(hi) + mt.max_depth + 1)
        if lo_d < 1:
            raise CompileError(f"delay line {line.name!r}: a tap can be {lo_d} samples old (minimum 1)")
        space = isa.SPACE_EBR if lo_d < MIN_PSRAM_DELAY or line.block_ram else isa.SPACE_PSRAM
        base = space_used[space] + hi_d
        space_used[space] += hi_d + 1
        line_info[id(line)] = (space, base, lo_d, hi_d)
    mem_words = {}
    for space, used in space_used.items():
        words = max(16, 2 * burst)
        while words < used:
            words *= 2
        mem_words[space] = words
    if space_used[isa.SPACE_EBR] > EBR_WORDS:
        raise CompileError(f"short delay lines need {space_used[isa.SPACE_EBR]} block-RAM words > {EBR_WORDS}")
    if space_used[isa.SPACE_PSRAM] > PSRAM_WORDS:
        raise CompileError(f"delay lines need {space_used[isa.SPACE_PSRAM]} PSRAM words > {PSRAM_WORDS}")

    def env_of(p, group, side):
        """Crossfade side whose parameter values `p` is evaluated with, or None."""
        if group is None or fade_params[group].name not in p.params():
            return None
        return (group, side)

    # Tap table.
    taps, tap_index, tap_exprs = [], {}, []

    def tap_for(key, make):
        if key not in tap_index:
            if len(taps) == isa.N_TAP:
                raise CompileError(f"more than {isa.N_TAP} taps")
            tap_index[key] = len(taps)
            taps.append(make(len(taps)))
        return tap_index[key]

    def fixed_tap(t):
        space, base, _, _ = line_info[id(t.line)]
        side = getattr(t, "side", None)
        group = t.group if side is not None else None

        def make(i):
            if t.delay.const is None:
                tap_exprs.append((i, base, t.delay, env_of(t.delay, group, side)))
            d = _round_delay(t.delay.eval(defaults))
            suffix = "" if side is None else "ab"[side]
            return isa.Tap(space, isa.TAP_READ, base - d, label=f"{t.line.name}[{d}]{suffix}",
                           group=-1 if group is None else group, side=side or 0)
        return tap_for(("r", id(t.line), t.delay.key(), side), make)

    def write_tap(line):
        space, base, _, _ = line_info[id(line)]
        return tap_for(("w", id(line)), lambda i: isa.Tap(space, isa.TAP_WRITE, base, label=f"{line.name}.in"))

    def mod_tap(mt, side):
        space, base, _, _ = line_info[id(mt.line)]
        group = low.group_of(mt.center) if side is not None else None

        def make(i):
            if mt.center.const is None:
                tap_exprs.append((i, base, mt.center, env_of(mt.center, group, side)))
            d = _round_delay(mt.center.eval(defaults))
            suffix = "" if side is None else "ab"[side]
            return isa.Tap(space, isa.TAP_MOD, base - d, mt.max_depth, modreg[id(mt)],
                           label=f"{mt.line.name}[{d}~{mt.max_depth}]{suffix}",
                           group=-1 if group is None else group, side=side or 0)
        return tap_for(("m", id(mt), side), make)

    # Coefficient bank.
    coefs, coef_index, coef_exprs = [], {}, []

    def coef_for(p, group=None, side=None):
        env = env_of(p, group, side)
        key = (p.key(), env)
        if key not in coef_index:
            if len(coefs) == isa.N_COEF:
                raise CompileError(f"more than {isa.N_COEF} coefficients")
            coef_index[key] = len(coefs)
            if p.const is None:
                coef_exprs.append((len(coefs), p, env))
            coefs.append(fp.f32_round(p.eval(defaults)))
        return coef_index[key]

    def reg_of(key):
        kind = key[0]
        if kind == "in":
            return isa.REG_IN + key[1]
        if kind == "lfo":
            return isa.REG_LFO + 4 * key[1] + key[2]
        if kind == "noise":
            return isa.REG_NOISE
        if kind == "one":
            return isa.REG_ONE
        return regs[key]

    instrs, listing = [], []
    for instr, store in slots:
        f = {}
        note = []
        if instr is not None:
            n = instr["node"]
            a_op, b_op = instr["a"], instr["b"]
            f.update(op=instr["op"], d=instr["d"])
            if a_op[0] == "mem":
                f.update(asel=isa.A_MEM, aidx=fixed_tap(a_op[1]))
            elif a_op[0] == "interp":
                f.update(asel=isa.A_MEM, aidx=mod_tap(a_op[1], a_op[3]))
            elif a_op[0] == "reg":
                f.update(asel=isa.A_REG, aidx=reg_of(a_op[1]))
            elif instr["a_acc"] is not None:
                f.update(asel=isa.A_ACC, aidx=instr["a_acc"])
            else:
                f.update(asel=isa.A_REG, aidx=a_op[1].reg[0])
            if b_op[0] == "coef":
                f.update(bsel=isa.B_COEF, bidx=coef_for(b_op[1]))
            elif b_op[0] == "cfade":
                g, s = b_op[2], b_op[3]
                f.update(bsel=isa.B_CFADE + 2 * g + s, bidx=coef_for(b_op[1], g, s))
            elif b_op[0] == "interp":
                # bidx names the modulation register, so hardware can read it early.
                f.update(bsel=isa.B_INTERP0 if b_op[1] == 0 else isa.B_INTERP1,
                         bidx=modreg[id(a_op[1])])
            elif b_op[0] == "reg":
                f.update(bsel=isa.B_REG, bidx=reg_of(b_op[1]))
            else:
                f.update(bsel=isa.B_REG, bidx=b_op[1].reg[0])
            note.append(n.label)
        if store is not None:
            x, dest = store["node"], store["dest"]
            f.update(st=1, sacc=store["acc"])
            if dest == "temp":
                f.update(ssel=isa.S_REG, sidx=store["reg"])
            elif dest[0] == "mem":
                f.update(ssel=isa.S_MEM, sidx=write_tap(dest[1]))
            elif dest[0] == "out":
                # (fixed point: the epilogue's conversion is a shift)
                f.update(ssel=isa.S_FIX, sidx=isa.REG_OUT + dest[1])
            elif dest[0] == "mod":
                f.update(ssel=isa.S_FIX, sidx=modreg[id(dest[1])])
            else:
                f.update(ssel=isa.S_REG, sidx=reg_of(dest[1]))
            note.append(f"st {x.label}")
        instrs.append(isa.Instr(**f))
        listing.append(", ".join(note))

    fs = a.fs
    lfo_inc, lfo_phase, lfo_exprs = [0] * isa.N_LFO, [0] * isa.N_LFO, []
    for lfo in a.lfos:
        lfo_phase[lfo.index] = int(round(lfo.phase * 2 ** 32)) & 0xFFFFFFFF
        lfo_inc[lfo.index] = lfo_increment(lfo.rate.eval(defaults), fs)
        if lfo.rate.const is None:
            lfo_exprs.append((lfo.index, lfo.rate))
    reg_init = {regs[s.prev.key()]: fp.f32_round(s.init) for s in a.states if s.init}
    fades = [(d.name, max(1, _round_delay(d.fade_ms * fs / 1000.0))) for d in fade_params]

    prog = isa.Program(a.name, fs, instrs, taps, coefs, reg_init, lfo_phase, lfo_inc,
                       mem_words, a.params, coef_exprs, tap_exprs, lfo_exprs, fades,
                       listing=listing)
    prog.streams = _streams(taps, len(fades), burst, rbuf_words)
    prog.triggers = [(name, regs[env.prev.key()], help) for name, env, help in a.triggers]
    prog.report = _report(prog, sched, space_used, n_fixed, len(a.states))
    return prog


def _report(prog, sched, space_used, n_fixed, n_states):
    fs = prog.fs
    n = len(prog.instrs)
    budget = CLOCK_HZ // fs
    ps = [t for t in prog.taps if t.space == isa.SPACE_PSRAM]
    # Side B of a crossfaded tap only streams while a fade runs.
    steady = [t for t in ps if t.group < 0 or t.side == 0]
    fading = [t for t in ps if t.group >= 0 and t.side == 1]
    reads = sum(1 for t in steady if t.kind == isa.TAP_READ)
    writes = sum(1 for t in steady if t.kind == isa.TAP_WRITE)
    mods = [t for t in ps if t.kind == isa.TAP_MOD]
    n_steady = reads + writes + sum(1 for t in steady if t.kind == isa.TAP_MOD)
    ebr_pool = prog.mem_words[isa.SPACE_EBR] if space_used[isa.SPACE_EBR] else 0
    st = prog.streams
    rbuf, wbuf = st["rbuf_words"], st["wbuf_words"]
    ebr_blocks = math.ceil((ebr_pool + rbuf + wbuf) / EBR_BLOCK_WORDS)
    # Bus time: each stream moves one burst every `burst` samples.
    burst = st["burst"]

    def bus_load(streams):
        return streams * fs / burst * (burst + PSRAM_BURST_OVERHEAD) / CLOCK_HZ
    return {
        "fs": fs,
        "instructions": n,
        "cycles": n + isa.PIPE_DEPTH,
        "budget": budget,
        "fits": n + isa.PIPE_DEPTH <= budget,
        "nops": sum(1 for i in prog.instrs if i.op == isa.OP_NOP),
        "accs_peak": sched.accs_peak,
        "spills": sched.spills,
        "regs": {"state": n_states, "modulation": n_fixed - n_states,
                 "temporary_peak": max(0, sched.temps_peak - n_fixed)},
        "coefs": len(prog.coefs),
        "taps": len(prog.taps),
        "fades": len(prog.fades),
        "psram": {"read_streams": reads, "write_streams": writes,
                  "modulated": sum(1 for t in steady if t.kind == isa.TAP_MOD),
                  "fade_streams": len(fading),
                  "words": space_used[isa.SPACE_PSRAM],
                  "seconds": space_used[isa.SPACE_PSRAM] / fs,
                  "mb_per_s": n_steady * fs * 4 / 1e6,
                  "mb_per_s_fading": (n_steady + len(fading)) * fs * 4 / 1e6,
                  "bus_load": bus_load(n_steady),
                  "bus_load_fading": bus_load(n_steady + len(fading)),
                  "burst": burst, "warmup": st["warmup"]},
        "ebr": {"delay_words": space_used[isa.SPACE_EBR], "rbuf_words": rbuf,
                "wbuf_words": wbuf, "blocks": ebr_blocks},
    }
