"""Run each H3000/H3500 algorithm's DSP triple on the board model and report
bus conflicts plus the frame positions of ADC/DAC/host accesses.

usage: python -m model.analyze <H3000-Firmware dir> [set] [key1 key2 key3]
"""
import collections
import os
import sys

from .board import Board, FRAME, load_image

TRIPLES = {
    "h3000_v153": [
        ("ultratap", "0110", "0111", "0112"),
        ("shift04+00", "0410", "0411", "0012"),
        ("shift04+02", "0410", "0411", "0212"),
        ("shift04+03", "0410", "0411", "0312"),
        ("shift04+04", "0410", "0411", "0412"),
        ("shift08", "0810", "0811", "0812"),
        ("combs14", "1410", "1411", "1412"),
        ("verb1E", "1E10", "1E11", "1E12"),
        ("verb28", "2810", "2811", "2812"),
    ],
    "h3500": [
        ("ultratap", "0110", "0111", "0112"),
        ("shift04+00", "0410", "0411", "0012"),
        ("shift04+04", "0410", "0411", "0412"),
        ("combs14", "1410", "1411", "1412"),
        ("verb1E", "1E10", "1E11", "1E12"),
        ("verb28", "2810", "2811", "2812"),
        ("patchfactory", "6F10", "6F11", "6F12"),
        ("stutter", "7010", "7011", "7012"),
        ("denseroom", "7210", "7211", "7212"),
        ("vocoder", "7310", "7311", "7312"),
        ("multishift", "7410", "7411", "7412"),
        ("banddelay", "7510", "7511", "7512"),
        ("string", "7610", "7611", "7612"),
        ("phaser", "7710", "7711", "7712"),
        ("sampler", "7810", "7811", "7812"),
        ("modfactory1", "7A10", "7A11", "7A12"),
        ("modfactory2", "7A13", "7A14", "7A15"),
    ],
}


def images(root, dset):
    names = {}
    d = os.path.join(root, "dsp", "images", dset)
    for line in open(os.path.join(d, "names.txt")):
        fn, nm = line.split()
        names[nm[:4].upper()] = os.path.join(d, fn)
    return names


def run_triple(names, keys, frames=24, warm=12000, **kw):
    progs = [load_image(names[k]) if k in names else None for k in keys]
    b = Board(progs, log=False, **kw)
    b.run(warm * FRAME)
    b.log_enabled = True
    b.run(frames * FRAME)
    return b


def summarize(b):
    pos = collections.defaultdict(collections.Counter)
    for t, dsp, io, port, v in b.events:
        if (io, port) in (("IN", 7), ("OUT", 5), ("OUT", 6), ("IN", 5), ("IN", 6), ("IN", 0), ("OUT", 0)):
            pos[(io, port, dsp)][b.frame_pos(t)] += 1
    mem = sum(1 for e in b.events if e[3] == 4)
    nframes = (max(e[0] for e in b.events) - min(e[0] for e in b.events)) / FRAME if b.events else 1
    return pos, mem / max(nframes, 1)


def main():
    root = sys.argv[1]
    sets = [sys.argv[2]] if len(sys.argv) > 2 else list(TRIPLES)
    for dset in sets:
        names = images(root, dset)
        triples = TRIPLES[dset]
        if len(sys.argv) > 5:
            triples = [("custom",) + tuple(sys.argv[3:6])]
        for name, *keys in triples:
            b = run_triple(names, keys)
            c = b.conflicts()
            pos, memrate = summarize(b)
            print("== %s %s %s  conflicts=%d  mem/frame=%.1f" % (dset, name, keys, len(c), memrate))
            for t, evs in c[:6]:
                print("     conflict @%d pos %d: %s" % (t, b.frame_pos(t), evs))
            for k in sorted(pos):
                print("     %-3s PA%d dsp%d: %s" % (k[0], k[1], k[2] + 1, dict(sorted(pos[k].items()))))


if __name__ == "__main__":
    main()
