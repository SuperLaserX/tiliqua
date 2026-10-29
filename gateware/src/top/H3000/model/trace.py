"""Write a bus-event trace from the Python board model, in the same format as
sim/tb_board.cpp, so the gateware can be checked against the reference.

usage: python -m model.trace img1 img2 img3 warm_frames log_frames out.txt
       (use '-' for an idle DSP)
"""
import math
import os
import sys

from .board import Board, FRAME, load_image

START_CYCLE = 3


def adc_left(frame):
    return int(round(8000.0 * math.sin(frame * 0.05)))


def adc_right(frame):
    return int(round(6000.0 * math.sin(frame * 0.031 + 1.0)))


def main():
    imgs = sys.argv[1:4]
    warm = int(sys.argv[4])
    nlog = int(sys.argv[5])
    out = sys.argv[6]
    progs = [None if p == "-" else load_image(p) for p in imgs]

    def adc(frame, pos, dsp):
        return adc_left(frame) if pos < 52 else adc_right(frame)

    # The gateware's cores start executing 3 instruction cycles into frame 0
    # (IKA32010 reset-release latency), so start the model at that phase.
    # H3K_CLOCK=mode,left,right sets the DAC clock select, and the host
    # programs the synthesizers through its bus slot (frames 0 and 1).
    b = Board(progs, adc=adc, frame_offset=-START_CYCLE)
    if os.environ.get("H3K_CLOCK"):
        mode, fsyn_l, fsyn_r = (int(x, 0) for x in os.environ["H3K_CLOCK"].split(","))
        b.clock_mode = mode
        b.host_bus_write(0, 0x2000 | fsyn_l)
        b.host_bus_write(0, 0x3000 | fsyn_r)

    # Optional instruction trace of one DSP: TRACE=dsp,from_frame,to_frame,path
    tr = os.environ.get("TRACE")
    if tr:
        d, fr0, fr1, path = tr.split(",", 3)
        d, fr0, fr1 = int(d), int(fr0), int(fr1)
        trf = open(path, "w")
        dsp = b.dsps[d]
        step = dsp.step

        def traced_step():
            fr = b.frame_no(dsp.cycle)
            if fr0 <= fr < fr1:
                trf.write("%d %d %04x %08x %04x\n" % (fr, b.frame_pos(dsp.cycle),
                          dsp.pmem[dsp.pc], dsp.acc & 0xFFFFFFFF, dsp.t))
            return step()
        dsp.step = traced_step

    # Logged frames: the host also reads port (frame & 7) in each one.
    start = warm * FRAME - START_CYCLE
    b.run_until(start - 8)
    b.log_enabled = True
    for fr in range(warm, warm + nlog):
        b.run_until(start + (fr - warm) * FRAME)
        b.host_bus_read(fr & 7)
    b.run_until(start + nlog * FRAME + 16)
    with open(out, "w") as f:
        for t, dsp, io, port, v in sorted(b.events, key=lambda e: (e[0], e[1])):
            fr, pos = b.frame_no(t), b.frame_pos(t)
            if warm <= fr < warm + nlog:
                f.write("%d %d %d %s %d %04x\n" % (fr, pos, dsp, io, port, v & 0xFFFF))
        for fr, v in b.host_results:
            if warm <= fr < warm + nlog:
                f.write("BUS %d %04x\n" % (fr, v))
        # DAC: the board's output sample for each frame
        dac = {fr: (l, r) for fr, l, r in b.dac_frames}
        for fr in range(warm, warm + nlog):
            l, r = dac.get(fr, (0, 0))
            f.write("DAC %d %04x %04x\n" % (fr, l, r))


if __name__ == "__main__":
    main()
