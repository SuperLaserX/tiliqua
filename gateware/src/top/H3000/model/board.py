"""Model of the H3000 DSP board: three lockstep TMS32010s on a shared I/O bus.

Port map (reverse engineered from the DSP microcode and 6809 kernel, and
confirmed by the H3000 service manual):

    IN  PA0   status word: bit 15 instruction-cycle parity (odd/even sync),
              bit 3 / 2 left / right FSYN STAT (the left / right DAC took its
              last word and needs the next), bit 1 FIRQ request (raised by a
              DSP, cleared by the host's acknowledge), bits 0, 9..4 flags Q0,
              Q7..Q2 (the bit positions of Q2..Q7 are a guess; Q1, which no
              kernel sets, is not readable)
    OUT PA0   status port: data bits 15..13 select the destination
                001  frequency synthesizer, bit 12 = right, 11..0 = value
                100  flag Q[bits 12..10] = bit 0 (Q0 interrupts the host)
                110  FIRQ to the host
    IN  PA1-3 mailboxes (OUT by one DSP or the host, IN by the others)
    OUT PA4   delay-memory write at the address register
    IN  PA4   delay-memory read at the address register, which then
              post-increments (writes do not advance it)
    IN  PA5   host (6809) parameter latch: address word
    IN  PA6   host (6809) parameter latch: data word
    OUT PA5/6 left / right DAC
    OUT PA7   delay-memory address register (16 bit, shared)
    IN  PA7   ADC sample
    BIO       frame clock (one 104-instruction-cycle frame per audio sample)

A value written by OUT in cycle t is visible to IN in cycle t+1 or later.

Status bit 1 is how the DSP programs that take parameters at their own pace
(the H3500 pitch detectors, Vocoder, Multi-Shift and Studio Sampler DSP3)
talk to the 6809: they raise FIRQ, then read the host latch every frame
until the FIRQ is acknowledged, and the 6809's FIRQ handler sends their
parameters before acknowledging (module 6F at bank $2D, $05F5).

The DACs are double buffered: OUT PA5/PA6 loads a latch, and each tick of
the channel's output sample clock moves the latch into the converter and
raises FSYN STAT. The clock is either the input sample rate (one tick at the
end of each frame) or one of two frequency synthesizers, whose period is
(4096 - value) / 8 instruction cycles: the pitch shifters run their DACs
faster or slower than the input rate. On Tiliqua the converters run at the
input rate, so each output sample is the time average of the converter
value over the frame (the held output resampled with a box filter).

The 6809 also gets one bus slot per frame (HOST_SLOT) to read or write a
port.
"""

import collections

from .tms32010 import TMS32010

FRAME = 104
HOST_SLOT = 58
FSYN_UNITY = 0xCC0  # synthesizer value for the input sample rate
LEFT, RIGHT = 0, 1


class Latch:
    """A register whose writes become visible on the following cycle."""

    def __init__(self, value=0):
        self.hist = collections.deque([(-1, value)], maxlen=4)

    def write(self, t, v):
        self.hist.appendleft((t, v & 0xFFFF))

    def read(self, t):
        for wt, v in self.hist:
            if wt < t:
                return v
        return self.hist[-1][1]


def s16(v):
    v &= 0xFFFF
    return v - 0x10000 if v & 0x8000 else v


def frame_average(total):
    """Converter value summed over a frame -> output sample (~ total / 104),
    exactly as the gateware computes it."""
    return (((total >> 7) * 315) >> 8) & 0xFFFF


class Board:

    def __init__(self, programs, bio_low=FRAME // 2, frame_offset=0,
                 adc=None, pa0=None, log=False, read_step=1,
                 clock_mode=0, fsyn=(FSYN_UNITY, FSYN_UNITY)):
        """programs: list of 3 (origin, [words]) tuples, or None for an idle DSP.

        clock_mode: DAC clock select (the 6809's FREQ SELECT latches):
        0 input rate, 1 right synthesizer for both DACs, 2 (and 3) left /
        right synthesizers."""
        self.dsps = []
        for i, prog in enumerate(programs):
            d = TMS32010(i, self)
            if prog is None:
                d.load(0x800, [0xF900, 0x800])  # B $
            else:
                d.load(*prog)
            self.dsps.append(d)
        self.bio_low = bio_low
        self.frame_offset = frame_offset
        self.read_step = read_step
        self.latch = [Latch() for _ in range(8)]
        self.addr = Latch()
        self.mem = [0] * 65536
        self.host_addr = 0
        self.host_data = 0
        self.host_reads = [0, 0, 0]  # PA6 reads per DSP since last host write
        self.adc = adc or (lambda frame, pos, dsp: 0)
        self.pa0 = pa0 or self.pa0_parity
        self.log_enabled = log
        self.events = []  # (cycle, dsp, 'IN'/'OUT', port, value)
        self.dac = {5: [], 6: []}  # port -> [(cycle, value)] of OUTs
        self.dac_frames = []  # (frame, left, right) output samples
        # Status port / converter state, advanced cycle by cycle by _sync().
        self.clock_mode = clock_mode
        self.fsyn_pending = [4096 - v for v in fsyn]
        self.fsyn_period = list(self.fsyn_pending)
        self.fsyn_phase = [0, 0]
        self.fsyn_stat = [0, 0]
        self.converter = [0, 0]
        self.frame_sum = [0, 0]
        self.flags = [0] * 8
        self.firq = 0
        self.outs = collections.defaultdict(list)  # cycle -> [(port, value)]
        # Board state is advanced from the start of frame 0.
        self.t_sync = frame_offset
        self.host_queue = collections.deque()  # ('w', port, v) / ('r', port)
        self.host_results = []  # (frame, value) of host reads

    # -- frame timing ------------------------------------------------------

    def frame_pos(self, t):
        return (t - self.frame_offset) % FRAME

    def frame_no(self, t):
        return (t - self.frame_offset) // FRAME

    def bio(self, dsp, t):
        return 0 if self.frame_pos(t) < self.bio_low else 1

    @staticmethod
    def pa0_parity(board, dsp, t):
        return 0x8000 if (board.frame_pos(t) & 1) == 0 else 0

    def status(self, t):
        """Status flags other than parity, as seen at the start of cycle t."""
        q = self.flags
        v = (self.fsyn_stat[LEFT] << 3) | (self.fsyn_stat[RIGHT] << 2) | (self.firq << 1) | q[0]
        for n in range(2, 8):
            v |= q[n] << (n + 2)
        return v

    # -- per-cycle board state ---------------------------------------------

    def _status_write(self, v):
        group = v >> 13
        if group == 0b001:
            self.fsyn_pending[(v >> 12) & 1] = 4096 - (v & 0xFFF)
        elif group == 0b100:
            self.flags[(v >> 10) & 7] = v & 1
        elif group == 0b110:
            self.firq = 1

    def _end_of_cycle(self, c):
        pos = self.frame_pos(c)
        if pos == HOST_SLOT and self.host_queue:
            # The host cannot reach the delay memory: port 4 reads 0 and
            # ignores writes.
            req = self.host_queue.popleft()
            if req[0] == "r":
                v = 0 if req[1] == 4 else self._read(None, req[1], c)
                self.host_results.append((self.frame_no(c), v))
            elif req[1] != 4:
                self._write(None, req[1], req[2], c)
        for ch in (LEFT, RIGHT):
            self.frame_sum[ch] += s16(self.converter[ch])
        for port, v in self.outs.pop(c, ()):
            if port == 5:
                self.fsyn_stat[LEFT] = 0
            elif port == 6:
                self.fsyn_stat[RIGHT] = 0
            elif port == 0:
                self._status_write(v)
        tick = [False, False]
        for s in (LEFT, RIGHT):
            self.fsyn_phase[s] += 8
            if self.fsyn_phase[s] >= self.fsyn_period[s]:
                tick[s] = True
                self.fsyn_phase[s] -= self.fsyn_period[s]
                self.fsyn_period[s] = self.fsyn_pending[s]
        frame_tick = pos == FRAME - 1
        if self.clock_mode == 1:
            clocks = (tick[RIGHT], tick[RIGHT])
        elif self.clock_mode >= 2:
            clocks = (tick[LEFT], tick[RIGHT])
        else:
            clocks = (frame_tick, frame_tick)
        for ch, port in ((LEFT, 5), (RIGHT, 6)):
            if clocks[ch]:
                self.converter[ch] = self.latch[port].read(c)
                self.fsyn_stat[ch] = 1
        if frame_tick:
            self.dac_frames.append((self.frame_no(c),
                                    frame_average(self.frame_sum[LEFT]),
                                    frame_average(self.frame_sum[RIGHT])))
            self.frame_sum = [0, 0]

    def _sync(self, t):
        """Advance the board state over all cycles before t."""
        while self.t_sync < t:
            self._end_of_cycle(self.t_sync)
            self.t_sync += 1

    # -- bus ---------------------------------------------------------------

    def _read(self, dsp, port, t):
        if port == 4:
            a = self.addr.read(t)
            v = self.mem[a]
            # Reads post-increment the address register (writes do not):
            # the microcode uses dummy reads to step through memory.
            self.addr.write(t, (a + self.read_step) & 0xFFFF)
        elif port == 5:
            v = self.host_addr
        elif port == 6:
            v = self.host_data
            if dsp is not None:
                self.host_reads[dsp] += 1
        elif port == 7:
            v = self.adc(self.frame_no(t), self.frame_pos(t), dsp) & 0xFFFF
        elif port == 0:
            v = self.pa0(self, dsp, t) | self.status(t)
        else:
            v = self.latch[port].read(t)
        return v

    def _write(self, dsp, port, v, t):
        v &= 0xFFFF
        if port == 7:
            self.addr.write(t, v)
        elif port == 4:
            self.mem[self.addr.read(t)] = v
        if port in (5, 6):
            self.dac[port].append((t, v))
        self.outs[t].append((port, v))
        self.latch[port].write(t, v)

    def read(self, dsp, port, t):
        self._sync(t)
        v = self._read(dsp, port, t)
        if self.log_enabled:
            self.events.append((t, dsp, "IN", port, v))
        return v

    def write(self, dsp, port, v, t):
        self._sync(t)
        self._write(dsp, port, v, t)
        if self.log_enabled:
            self.events.append((t, dsp, "OUT", port, v & 0xFFFF))

    def host_write(self, addr, data):
        self.host_addr = addr & 0xFFFF
        self.host_data = data & 0xFFFF
        self.host_reads = [0, 0, 0]

    def host_firq_ack(self):
        """The 6809 acknowledges the FIRQ ($8055)."""
        self.firq = 0

    def host_bus_write(self, port, v):
        """Queue a 6809 write to a bus port (performed in the next host slot)."""
        self.host_queue.append(("w", port, v))

    def host_bus_read(self, port):
        """Queue a 6809 read of a bus port; the result lands in host_results."""
        self.host_queue.append(("r", port))

    # -- run -----------------------------------------------------------------

    def run(self, cycles):
        self.run_until(min(d.cycle for d in self.dsps) + cycles)

    def run_until(self, end):
        """Run every DSP up to cycle end and settle the board state."""
        while True:
            d = min(self.dsps, key=lambda x: (x.cycle, x.index))
            if d.cycle >= end:
                break
            d.step()
        self._sync(end)

    def conflicts(self):
        """Cycles where the shared bus would be driven by more than one source."""
        by_cycle = collections.defaultdict(list)
        for t, dsp, io, port, v in self.events:
            by_cycle[t].append((dsp, io, port))
        bad = []
        for t, evs in sorted(by_cycle.items()):
            outs = [e for e in evs if e[1] == "OUT"]
            ins_ports = {e[2] for e in evs if e[1] == "IN"}
            if len(outs) > 1 or (outs and ins_ports) or len(ins_ports) > 1:
                bad.append((t, evs))
        return bad


def load_image(path):
    import struct
    data = open(path, "rb").read()
    words = [struct.unpack(">H", data[i:i + 2])[0] for i in range(0, len(data) - 1, 2)]
    return words[0] & 0xFFF, words[1:]
