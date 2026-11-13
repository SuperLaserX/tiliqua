"""The CPU variant.

BFR's: rv32im with mid-sized caches whose data is in block RAM (8 KB instruction,
4 KB data). The firmware runs from PSRAM; the stock variant's tiny caches turn it
into a constant stream of line fills, and its LUT-RAM cache data misses 60 MHz at
high utilisation (top/bfr/README.md).

A netlist is cached under a hash of its arguments and the git revision of
`deps/VexiiRiscv`. With this variant, FairWave's memory map and that submodule at
`de53da01`, the key names the netlist BFR has run on hardware
(`VexiiRiscv_7e29dff7...`), so no sbt run is needed.
"""

from vendor.vexiiriscv import vexiiriscv

CPU_VARIANT = "fairwave_rv32im_medcache"
vexiiriscv.CPU_VARIANTS.setdefault(CPU_VARIANT, vexiiriscv.CPU_BASE + [
    '--lsu-l1-sets=64',
    '--lsu-l1-ways=1',
    '--fetch-l1-sets=64',
    '--fetch-l1-ways=2',
])
