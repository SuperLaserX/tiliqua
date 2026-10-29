import sys, collections
sys.argv = sys.argv[:1] + ["target/riscv32im-unknown-none-elf/release/cachebench", "../../fw/target/roms-h3500.lzma"]
import cachesim, lzma
image = lzma.decompress(open(sys.argv[2], "rb").read(), format=lzma.FORMAT_ALONE)
blocks, sizes, data = cachesim.record(sys.argv[1], image, 6000, 50)
c = collections.Counter()
for a, s in zip(blocks, sizes):
    c[(a, s)] += s // 4
total = sum(c.values())
for (a, s), n in c.most_common(30):
    print("%08x %4d bytes  %5.2f%%" % (a, s, 100 * n / total))
