"""Run the CXXRTL board simulation and the Python reference model on the same
DSP programs and compare their bus-event and DAC traces.

usage: python sim/compare.py <tb_board.exe> <images dir> key1 key2 key3 [warm] [frames]
"""
import os
import subprocess
import sys
import tempfile

HERE = os.path.dirname(os.path.abspath(__file__))


def images(d):
    names = {}
    for line in open(os.path.join(d, "names.txt")):
        fn, nm = line.split()
        names[nm[:4].upper()] = os.path.join(d, fn)
    return names


def split(path, last_frame):
    ev, dac, bus = [], {}, []
    for line in open(path):
        f = line.split()
        if f[0] == "DAC":
            if int(f[1]) < last_frame:
                dac[int(f[1])] = (f[2], f[3])
        elif f[0] == "BUS":
            bus.append(line.strip())
        else:
            ev.append(line.strip())
    return ev, dac, bus


def main():
    tb, imgdir, *keys = sys.argv[1:6]
    warm = int(sys.argv[6]) if len(sys.argv) > 6 else 9000
    nlog = int(sys.argv[7]) if len(sys.argv) > 7 else 24
    names = images(imgdir)
    paths = [names.get(k.upper(), "-") if k != "-" else "-" for k in keys]
    tmp = tempfile.mkdtemp()
    hw, md = os.path.join(tmp, "hw.txt"), os.path.join(tmp, "model.txt")
    r = subprocess.run([tb, *paths, str(warm), str(nlog), hw], capture_output=True, text=True)
    print("hw:", r.stderr.strip())
    subprocess.run([sys.executable, "-m", "model.trace", *paths, str(warm), str(nlog), md],
                   cwd=os.path.join(HERE, ".."), check=True)
    last = warm + nlog - 1
    ev_h, dac_h, bus_h = split(hw, last)
    ev_m, dac_m, bus_m = split(md, last)
    dac_m = {k: v for k, v in dac_m.items() if k in dac_h}
    nz = sum(1 for v in dac_m.values() if v != ("0000", "0000"))
    ok = ev_h == ev_m and dac_h == dac_m and bus_h == bus_m
    print("%s: events hw=%d model=%d, dac frames=%d (nonzero %d), host reads=%d: %s" % (
        " ".join(keys), len(ev_h), len(ev_m), len(dac_h), nz, len(bus_h),
        "MATCH" if ok else "MISMATCH"))
    if not ok:
        for a, b in zip(ev_h, ev_m):
            if a != b:
                print("  first event difference: hw '%s' vs model '%s'" % (a, b))
                break
        for a, b in zip(bus_h, bus_m):
            if a != b:
                print("  first host read difference: hw '%s' vs model '%s'" % (a, b))
                break
        if len(bus_h) != len(bus_m):
            print("  host reads: hw %d vs model %d" % (len(bus_h), len(bus_m)))
        for k in sorted(dac_h):
            if dac_h[k] != dac_m.get(k):
                print("  first DAC difference frame %d: hw %s vs model %s" % (k, dac_h[k], dac_m.get(k)))
                break
    return 0 if ok else 1


if __name__ == "__main__":
    sys.exit(main())
