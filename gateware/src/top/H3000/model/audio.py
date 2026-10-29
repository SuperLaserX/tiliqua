"""Process a test tone through the board model, with the DSP programs, host
latch writes, bus port writes and DAC clock selects captured from the 6809
emulator (`h3000-host ... dump`).

usage: python -m model.audio dump.txt frames out.txt [freq_hz]

Writes one "left right" line per output sample (signed). Host-latch writes
are delivered like the gateware's FIFO does: each value is presented until
every DSP has read PA5 once, or for at most PARAM_TIMEOUT frames, and a FIRQ
acknowledge (address PARAM_FIRQ_ACK) takes its turn in the same queue. Bus
writes and clock selects take effect at their sample (26 E cycles per
sample); those made before the programs started apply from the first frame.
"""
import math
import sys

from .board import Board, FRAME

FS = 44100
E_PER_SAMPLE = 26
PARAM_TIMEOUT = 8
PARAM_FIRQ_ACK = 0x8000


def load_dump(path):
    run = 0
    progs = {1: {}, 2: {}, 3: {}}
    params, bus, modes = [], [], []
    for line in open(path):
        w = line.split()
        if not w:
            continue
        if w[0] == "RUN":
            run = int(w[1])
        elif w[0] == "PROG":
            progs[int(w[1])][int(w[2], 16)] = int(w[3], 16)
        elif w[0] == "PARAM":
            params.append((int(w[1]), int(w[2], 16), int(w[3], 16)))
        elif w[0] == "BUS":
            bus.append((int(w[1]), int(w[2]), int(w[3], 16)))
        elif w[0] == "MODE":
            modes.append((int(w[1]), int(w[2])))
    return run, progs, params, bus, modes


def s16(v):
    v &= 0xFFFF
    return v - 0x10000 if v & 0x8000 else v


def run(dump, nframes, freq=441.0, amp=8000, progress=False):
    start, progs, params, bus, modes = load_dump(dump)
    programs = [(0x800, [progs[d].get(a, 0x7F80) for a in range(0x800)]) for d in (1, 2, 3)]
    queue = [(a, v) for (c, a, v) in params if c >= start]

    def frame_of(c):
        return max(0, (c - start) // E_PER_SAMPLE)

    # Board state from before the programs started: the last clock select,
    # and every bus write replayed from the first frame.
    mode = 0
    for c, m in modes:
        if c < start:
            mode = m
    events = [(frame_of(c), "mode", m) for c, m in modes if c >= start]
    events += [(frame_of(c), "bus", (p, v)) for c, p, v in bus]
    events.sort(key=lambda e: e[0])

    def adc(frame, pos, dsp):
        return int(round(amp * math.sin(2 * math.pi * freq * frame / FS)))

    b = Board(programs, adc=adc, clock_mode=mode)
    seen = [False, False, False]
    read = b.read

    def read_tracking(dsp, port, t):
        if port == 5:
            seen[dsp] = True
        return read(dsp, port, t)

    b.read = read_tracking
    for d in b.dsps:
        d.bus = b

    age = PARAM_TIMEOUT
    for fr in range(nframes):
        while events and events[0][0] <= fr:
            _, kind, v = events.pop(0)
            if kind == "mode":
                b.clock_mode = v
            else:
                b.host_bus_write(*v)
        b.run_until((fr + 1) * FRAME)
        if queue and (all(seen) or age >= PARAM_TIMEOUT):
            a, v = queue.pop(0)
            if a & PARAM_FIRQ_ACK:
                b.host_firq_ack()
            else:
                b.host_write(a, v)
                seen[:] = [False, False, False]
                age = 0
        elif age < PARAM_TIMEOUT:
            age += 1
        if progress and fr % 2000 == 0:
            print("frame", fr, file=sys.stderr)
    return [(s16(l), s16(r)) for _, l, r in b.dac_frames]


def main():
    dump, nframes, path = sys.argv[1], int(sys.argv[2]), sys.argv[3]
    freq = float(sys.argv[4]) if len(sys.argv) > 4 else 441.0
    out = run(dump, nframes, freq, progress=True)
    with open(path, "w") as f:
        for l, r in out:
            f.write("%d %d\n" % (l, r))


if __name__ == "__main__":
    main()
