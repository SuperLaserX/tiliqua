"""The backdrop overlay against a Python reference of its arithmetic, on a
small simulated scan: every output pixel, and the timing signals delayed
by exactly LATENCY."""

import random

import pytest
from amaranth.sim import Simulator

from . import backdrop as B

W = H = 48              # active area of the test scan
HB, VB, VS = 8, 4, 2    # blanking pixels per line, blanking lines, vsync lines
TABLE = B.sqrt_table()


def reference(st, t, x, y, pixel):
    """The output pixel (color, intensity) for one scanned pixel."""
    dx, dy = x - st["cx"], y - st["cy"]
    r2 = dx * dx + dy * dy
    r = TABLE[B.SQRT_DEPTH - 1 if r2 >= B.SQRT_DEPTH << B.SQRT_SHIFT else r2 >> B.SQRT_SHIFT]
    inside = r <= st["curtain"]
    rim = st["curtain"] < B.R_MAX and inside and r + 2 > st["curtain"]
    env = 31 if r >= 31 << 4 else r >> 4
    ph = (((r * st["freq"]) >> 4) - (t >> 4)) & 255
    glow = min(255, st["base"] + ((r * st["slope"]) >> 6))
    tri = (ph & 127) ^ (127 if ph & 128 else 0)
    over = tri - (127 - (st["width"] >> 1))
    ring = 0 if over <= 0 else (255 if over >= 32 else over << 3)
    rip = (ring * st["level"]) >> 8
    v = min(255, glow + ((rip * env) >> 5))
    bayer = (4 if y & 1 else 8) if x & 1 else (12 if y & 1 else 0)
    lvl = v + bayer
    intensity = 15 if lvl > 255 else lvl >> 4
    if st["enable"] and (pixel == 0 or not inside or rim):
        return st["hue"], 15 if rim else intensity
    return pixel & 15, pixel >> 4


def scan(frames):
    """(x, y, de, hsync, vsync) per pixel clock."""
    for _ in range(frames):
        for y in range(-VB, H):
            for x in range(-HB, W):
                yield x, y, int(x >= 0 and y >= 0), int(-HB <= x < -HB + 2), int(y < -VB + VS)


def run(settings, pixels):
    dut = B.Backdrop()
    st = dict(B.defaults(), **settings)
    events = list(scan(3))
    ins, outs = [], []

    async def bench(ctx):
        ctx.set(dut.settings, st)
        for x, y, de, hs, vs in events:
            pix = pixels(x, y) if de else 0
            ctx.set(dut.i.x, x)
            ctx.set(dut.i.y, y)
            ctx.set(dut.i.de, de)
            ctx.set(dut.i.hsync, hs)
            ctx.set(dut.i.vsync, vs)
            ctx.set(dut.i.pixel.as_value(), pix)
            ins.append((x, y, de, hs, vs, pix))
            outs.append((ctx.get(dut.o.x), ctx.get(dut.o.y), ctx.get(dut.o.de),
                         ctx.get(dut.o.hsync), ctx.get(dut.o.vsync),
                         ctx.get(dut.o.pixel.color), ctx.get(dut.o.pixel.intensity)))
            await ctx.tick("dvi")

    s = Simulator(dut)
    s.add_clock(1 / 74.25e6, domain="dvi")
    s.add_testbench(bench)
    s.run()
    # The settings reach the pixel clock after the first vsync, so frame 2
    # takes them; the phase advances at each vsync by the speed until then:
    # twice the defaults', then st's. Frame 3 is checked.
    t = (2 * B.defaults()["speed"] + st["speed"]) & 0xFFF
    n = 2 * len(events) // 3
    L = B.Backdrop.LATENCY
    for k in range(n + L, len(events)):
        x, y, de, hs, vs, pix = ins[k - L]
        ox, oy, ode, ohs, ovs, color, intensity = outs[k]
        assert (ox, oy, ode, ohs, ovs) == (x, y, de, hs, vs), k
        if de:
            assert (color, intensity) == reference(st, t, x, y, pix), (x, y, pix)
    return outs, ins


def sparse(seed):
    rnd = random.Random(seed)
    table = {(x, y): (rnd.choice([0, 0, 0x35, 0xF1, 0x0A]) if rnd.random() < 0.4 else 0)
             for x in range(W) for y in range(H)}
    return lambda x, y: table[(x, y)]


@pytest.mark.parametrize("settings", [
    {"enable": 1, "cx": 24, "cy": 24, "freq": 255, "level": 255, "speed": 40, "hue": 9},
    {"enable": 1, "cx": 20, "cy": 30, "freq": 200, "level": 128, "speed": -77, "base": 200,
     "slope": 255},
    {"enable": 1, "cx": 24, "cy": 24, "curtain": 12, "freq": 100, "level": 90},
    {"enable": 1, "cx": 220, "cy": 190, "freq": 64, "level": 255, "speed": 100, "slope": 20},
    {"enable": 1, "cx": 220, "cy": 190, "freq": 64, "level": 200, "speed": 60, "width": 255},
    {"enable": 1, "cx": 220, "cy": 190, "freq": 64, "level": 200, "speed": 60, "width": 20},
    {"enable": 1, "cx": 220, "cy": 190, "freq": 64, "level": 255, "speed": -128, "slope": 20,
     "curtain": 230},
    {"enable": 0, "cx": 24, "cy": 24, "curtain": 5},
])
def test_backdrop_matches_reference(settings):
    run(settings, sparse(len(settings)))


def test_backdrop_is_mirror_symmetric_about_the_centre():
    outs, ins = run({"enable": 1, "cx": 24, "cy": 24, "freq": 255, "level": 255}, lambda x, y: 0)
    L = B.Backdrop.LATENCY
    n = 2 * len(ins) // 3
    seen = {}
    for k in range(n + L, len(ins)):
        x, y, de = ins[k - L][:3]
        if de:
            seen[(x, y)] = outs[k][5:]
    for (x, y), v in seen.items():
        for mx, my in ((48 - x, y), (x, 48 - y)):         # mirrored, same dither parity
            if (mx, my) in seen:
                assert seen[(mx, my)] == v
