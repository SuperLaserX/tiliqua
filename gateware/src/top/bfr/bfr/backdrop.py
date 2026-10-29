"""The UI's backdrop: a sunset glow behind everything the firmware draws, with
rings rippling out from the centre of the screen.

A scan-out overlay (`TiliquaSoc`'s `fb_overlay`): wherever the framebuffer
pixel is 0, it puts a pixel of its own, computed from the pixel's distance r
to the centre. So the backdrop takes no framebuffer memory or bandwidth, no
CPU time, and moves every frame; erasing to 0 reveals it.

- The glow: `base + slope * r`, in one hue whose palette ramp the firmware
  sets through colours (dark wine in the hub, where the text is, to amber
  at the rim), not only brightness.
- The ripples: rings `freq` apart, moving out by `speed` each frame, as
  bright as `level` and as wide as `width` (the firmware follows the
  reverb's output with both), fading in from the centre.
- 2x2 ordered dither between the palette's 16 intensities.
- The curtain: outside radius `curtain` only the backdrop shows, with a
  bright rim at the edge. The firmware closes and opens it around a type
  change, hiding the redraw.

r = sqrt(dx^2 + dy^2): two multipliers and a table of square roots (one
block RAM, indexed by r^2 >> 7). Everything is pipelined; the timing
signals go through the same number of registers (LATENCY), so the stage
after it sees them aligned.

The settings arrive from the sync domain and are taken into the pixel clock's
once a frame, at vsync, only when two samples in a row agree (a register
written just then waits a cycle rather than mixing old and new bits).
"""

import math

from amaranth import *
from amaranth.lib import data, wiring
from amaranth.lib.cdc import FFSynchronizer
from amaranth.lib.memory import Memory
from amaranth.lib.wiring import In, Out
from amaranth_soc import csr

from tiliqua.video.types import ScanPixel

SQRT_SHIFT = 7          # the root table is indexed by r^2 >> SQRT_SHIFT
SQRT_DEPTH = 2048       # radius up to 512
R_MAX = 511


def sqrt_table():
    """r for each bucket of r^2 (its middle), saturated at R_MAX."""
    half = 1 << (SQRT_SHIFT - 1)
    return [min(R_MAX, int(round(math.sqrt((k << SQRT_SHIFT) + half)))) for k in range(SQRT_DEPTH)]


class Settings(data.Struct):
    enable:  unsigned(1)
    hue:     unsigned(4)    # the palette hue of the backdrop
    cx:      unsigned(11)   # the centre (physical scan coordinates)
    cy:      unsigned(11)
    curtain: unsigned(10)   # radius; R_MAX or more: fully open
    base:    unsigned(8)    # glow at the centre, in 1/16 intensity
    slope:   unsigned(8)    # glow added per pixel of radius, in 1/1024 intensity
    freq:    unsigned(8)    # ring spacing 4096 / freq pixels
    speed:   signed(8)      # rings move out speed/64 pixels a frame (freq 64)
    level:   unsigned(8)    # ring brightness
    width:   unsigned(8)    # ring width: 255 about half the spacing


def defaults():
    return {"enable": 0, "hue": 6, "cx": 360, "cy": 360, "curtain": 1023, "base": 24,
            "slope": 64, "freq": 64, "speed": 24, "level": 0, "width": 128}


class Backdrop(wiring.Component):
    """ScanPixel in, the same ScanPixel `LATENCY` pixel clocks later out, with
    the backdrop under it (dvi domain). `settings` is in the sync domain."""

    LATENCY = 12

    def __init__(self):
        super().__init__({
            "i": In(ScanPixel),
            "o": Out(ScanPixel),
            "settings": In(Settings),
        })

    def elaborate(self, platform):
        m = Module()

        # -- settings: a stable copy, taken once a frame ------------------------
        syn, prev, s = Signal(Settings), Signal(Settings), Signal(Settings, init=defaults())
        m.submodules.settings_ff = FFSynchronizer(self.settings, syn, o_domain="dvi",
                                                  init=defaults())
        vs_prev, want = Signal(), Signal()
        frame = self.i.vsync & ~vs_prev
        m.d.dvi += [prev.eq(syn), vs_prev.eq(self.i.vsync)]
        with m.If(frame):
            m.d.dvi += want.eq(1)
        with m.If((want | frame) & (syn.as_value() == prev.as_value())):
            m.d.dvi += [s.eq(syn), want.eq(0)]

        # Ring phase, 1/256 of the spacing in its top 8 bits.
        t = Signal(12)
        with m.If(frame):
            m.d.dvi += t.eq(t + s.speed)

        # -- the scan, delayed alongside -----------------------------------------
        d = [self.i]
        for k in range(1, self.LATENCY):
            p = Signal(ScanPixel, name=f"scan{k}")
            m.d.dvi += p.eq(d[-1])
            d.append(p)

        def reg(name, shape, value):
            r = Signal(shape, name=name)
            m.d.dvi += r.eq(value)
            return r

        # 1-3: r^2
        dx = reg("dx", signed(13), self.i.x - s.cx)
        dy = reg("dy", signed(13), self.i.y - s.cy)
        dx2 = reg("dx2", unsigned(24), dx * dx)
        dy2 = reg("dy2", unsigned(24), dy * dy)
        r2 = reg("r2", unsigned(25), dx2 + dy2)
        # 4-5: r, read from the table then registered (block RAM outputs are slow)
        m.submodules.sqrt = sqrt = Memory(shape=unsigned(9), depth=SQRT_DEPTH, init=sqrt_table())
        rp = sqrt.read_port(domain="dvi")
        m.d.comb += rp.addr.eq(Mux(r2 >= (SQRT_DEPTH << SQRT_SHIFT), SQRT_DEPTH - 1,
                                   r2 >> SQRT_SHIFT))
        r = reg("r", unsigned(9), rp.data)
        # 6: products, the curtain and the ripples' fade-in
        ph_m = reg("ph_m", unsigned(17), r * s.freq)
        gl_m = reg("gl_m", unsigned(17), r * s.slope)
        inside6 = reg("inside6", 1, r <= s.curtain)
        rim6 = reg("rim6", 1, (s.curtain < R_MAX) & (r <= s.curtain) & (r + 2 > s.curtain))
        env6 = reg("env6", unsigned(5), Mux(r >= 31 << 4, 31, r >> 4))
        # 7: ring phase and glow
        ph = reg("ph", unsigned(8), (ph_m >> 4) - t[4:])
        glow_sum = s.base + (gl_m >> 6)
        glow = reg("glow", unsigned(8), Mux(glow_sum > 255, 255, glow_sum))
        # 8: a bright ring once per period, `width` wide, soft edged
        tri = ph[:7] ^ ph[7].replicate(7)                    # 0..127..0
        over = Signal(signed(9))
        m.d.comb += over.eq(tri - (127 - (s.width >> 1)))
        ring = reg("ring", unsigned(8), Mux(over <= 0, 0, Mux(over >= 32, 255, over << 3)))
        # 9-10: its brightness, then faded in from the centre
        rip = reg("rip", unsigned(8), (ring * s.level) >> 8)
        env = env6
        for k in range(3):                                   # (stage 6 to 9)
            env = reg(f"env{7 + k}", unsigned(5), env)
        rip_w = reg("rip_w", unsigned(8), (rip * env) >> 5)
        # 11: the backdrop's level, 4.4 bits
        glow_d = [Signal(unsigned(8), name=f"glow{k}") for k in range(3)]
        m.d.dvi += [glow_d[0].eq(glow), glow_d[1].eq(glow_d[0]), glow_d[2].eq(glow_d[1])]
        v_sum = glow_d[2] + rip_w
        v = reg("v", unsigned(8), Mux(v_sum > 255, 255, v_sum))
        # (the curtain bits, delayed from stage 6 to 11)
        inside, rim = inside6, rim6
        for k in range(5):
            inside, rim = reg(f"inside{7 + k}", 1, inside), reg(f"rim{7 + k}", 1, rim)

        # 12: dither, and the backdrop where the framebuffer is 0 or curtained
        p = d[-1]
        bayer = Mux(p.x[0], Mux(p.y[0], 4, 8), Mux(p.y[0], 12, 0))
        lvl = v + bayer
        intensity = Mux(lvl > 255, 15, lvl >> 4)
        show = s.enable & p.de & ((p.pixel.as_value() == 0) | ~inside | rim)
        m.d.dvi += self.o.eq(p)
        with m.If(show):
            m.d.dvi += [self.o.pixel.color.eq(s.hue),
                        self.o.pixel.intensity.eq(Mux(rim, 15, intensity))]
        return m


class Peripheral(wiring.Component):
    """The backdrop's settings, from the CPU (all write-only)."""

    class Control(csr.Register, access="w"):
        enable: csr.Field(csr.action.W, unsigned(1))
        hue:    csr.Field(csr.action.W, unsigned(4))

    class Centre(csr.Register, access="w"):
        x: csr.Field(csr.action.W, unsigned(11))
        y: csr.Field(csr.action.W, unsigned(11))

    class Curtain(csr.Register, access="w"):
        radius: csr.Field(csr.action.W, unsigned(10))

    class Glow(csr.Register, access="w"):
        base:  csr.Field(csr.action.W, unsigned(8))
        slope: csr.Field(csr.action.W, unsigned(8))

    class Ripple(csr.Register, access="w"):
        freq:  csr.Field(csr.action.W, unsigned(8))
        speed: csr.Field(csr.action.W, unsigned(8))
        level: csr.Field(csr.action.W, unsigned(8))
        width: csr.Field(csr.action.W, unsigned(8))

    def __init__(self):
        self.backdrop = Backdrop()
        regs = csr.Builder(addr_width=5, data_width=8)
        self._control = regs.add("control", self.Control(), offset=0x00)
        self._centre  = regs.add("centre",  self.Centre(),  offset=0x04)
        self._curtain = regs.add("curtain", self.Curtain(), offset=0x08)
        self._glow    = regs.add("glow",    self.Glow(),    offset=0x0C)
        self._ripple  = regs.add("ripple",  self.Ripple(),  offset=0x10)
        self._bridge = csr.Bridge(regs.as_memory_map())
        super().__init__({
            "bus": In(csr.Signature(addr_width=regs.addr_width, data_width=regs.data_width)),
        })
        self.bus.memory_map = self._bridge.bus.memory_map

    def elaborate(self, platform):
        m = Module()
        m.submodules.bridge = self._bridge
        m.submodules.backdrop = self.backdrop
        wiring.connect(m, wiring.flipped(self.bus), self._bridge.bus)

        st = Signal(Settings, init=defaults())
        m.d.comb += self.backdrop.settings.eq(st)
        fields = {
            self._control: {"enable": st.enable, "hue": st.hue},
            self._centre:  {"x": st.cx, "y": st.cy},
            self._curtain: {"radius": st.curtain},
            self._glow:    {"base": st.base, "slope": st.slope},
            self._ripple:  {"freq": st.freq, "speed": st.speed, "level": st.level,
                            "width": st.width},
        }
        for reg, targets in fields.items():
            with m.If(reg.element.w_stb):
                for name, target in targets.items():
                    m.d.sync += target.eq(getattr(reg.f, name).w_data)
        return m
