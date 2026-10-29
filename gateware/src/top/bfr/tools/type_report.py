"""What each reverb type uses of the engine's shared pools.

    python tools/type_report.py [TYPE ...]      (default: every type in TYPES)

For each type at 48 kHz: clocks of the frame budget, instructions, the
PSRAM stream read and write buffers, the block-RAM pool, streams, its
parameters and LFOs; or the compiler's error. The pools a bitstream gives
every type are `top.py`'s POOLS.
"""

import importlib
import os
import sys

HERE = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, HERE)

from algorithms import TYPES  # noqa: E402
from model import isa  # noqa: E402
from model.compiler import compile_module  # noqa: E402


def main(names):
    for n in names:
        try:
            p = compile_module(importlib.import_module(f"algorithms.{n}"), 48000)
        except Exception as e:                  # (report it, go on)
            print(f"{n:10} ERROR {type(e).__name__}: {e}")
            continue
        r, st = p.report, p.streams
        print(f"{n:10} clocks {r['cycles']:5}/{r['budget']}  instr {len(p.instrs):4}  "
              f"rbuf {st['rbuf_words']:5}  wbuf {st['wbuf_words']:4}  "
              f"ebr {p.mem_words[isa.SPACE_EBR]:5}  streams {len(st['taps']):3}  "
              f"params {len(p.params):2}  lfos {sum(1 for x in p.lfo_inc if x)}")


if __name__ == "__main__":
    main(sys.argv[1:] or TYPES)
