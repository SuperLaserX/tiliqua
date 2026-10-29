"""The sprite/text blitter, with its sprite-memory address registered (a
project-local replacement for `tiliqua.raster.blit.Peripheral`).

Derived from `tiliqua/raster/blit.py` (Copyright (c) 2024 Seb Holzapfel,
CERN-OHL-S-2.0): same registers, memory, command FIFO and plot requests.

The stock blitter computes the sprite memory's read address combinationally
from the sheet width: (width + 7) >> 3 bytes a row, times the sprite row,
plus the column, straight into the block RAM's address. In most placements
of this SoC that path missed 60 MHz (by 0.3 to 2.2 ns), and as the worst
path it drew the placer's effort away from the CPU's. Here:

- `bytes_per_row` is a register, set when the sheet width is written;
- a new state, ADDR, registers the address and the pixel's bit index before
  the read, so the multiply-add ends in flip-flops, not in the RAM's address.

Each sprite pixel takes one more clock (5 rather than 4, before the plot);
the plotting backend and PSRAM are much slower than that.

`pipelined_blit()` hands `TiliquaSoc` this class instead of the stock one.
"""

import contextlib
import functools

from amaranth import *
from amaranth.lib import wiring

from tiliqua.raster import blit
from tiliqua.raster.plot import BlendMode, OffsetMode
from tiliqua.video.types import Pixel


class PipelinedBlit(blit.Peripheral):

    def elaborate(self, platform) -> Module:
        m = Module()

        m.submodules.bridge = self._bridge
        m.submodules._cmd_fifo = cmd_fifo = self._cmd_fifo
        wiring.connect(m, wiring.flipped(self.csr_bus), self._bridge.bus)

        m.submodules.sprite_mem = self._sprite_mem
        sprite_r_port = self._sprite_mem.read_port()
        sprite_w_port = self._sprite_mem.write_port()

        # Sheet width CSR (SoC must set this): kept as the bytes per sprite
        # row it implies.
        bytes_per_row = Signal(16)
        sw = self._sheet_width
        with m.If(sw.element.w_stb):
            m.d.sync += bytes_per_row.eq((sw.f.width.w_data + 7) >> 3)

        # Status register (SoC must check this before issuing commands)
        m.d.comb += [
            # full = FIFO can't accept new commands
            self._status.f.full.r_data.eq(~cmd_fifo.i.ready),
            # empty = FIFO is empty and no command executing (safe to change spritesheet)
            self._status.f.empty.r_data.eq(~cmd_fifo.o.valid & cmd_fifo.o.ready),
            self._status.f.mem_words.r_data.eq(self.memory_words),
        ]

        # Connect spritesheet memory to wishbone interface (write-only)
        m.d.comb += [
            sprite_w_port.addr.eq(self.sprite_mem_bus.adr),
            sprite_w_port.data.eq(self.sprite_mem_bus.dat_w),
            sprite_w_port.en.eq(self.sprite_mem_bus.cyc & self.sprite_mem_bus.stb & self.sprite_mem_bus.we),
            self.sprite_mem_bus.ack.eq(self.sprite_mem_bus.cyc & self.sprite_mem_bus.stb),
        ]

        # Enqueue command on 'src' register write
        with m.If(self._src.element.w_stb):
            m.d.comb += [
                cmd_fifo.i.valid.eq(1),
                cmd_fifo.i.payload.kind.eq(self.BlitCmd.Kind.SRC),
                cmd_fifo.i.payload.params.src.src_x.eq(self._src.f.src_x.w_data),
                cmd_fifo.i.payload.params.src.src_y.eq(self._src.f.src_y.w_data),
                cmd_fifo.i.payload.params.src.width.eq(self._src.f.width.w_data),
                cmd_fifo.i.payload.params.src.height.eq(self._src.f.height.w_data),
            ]

        # Enqueue command on 'blit' register write
        with m.If(self._blit.element.w_stb & cmd_fifo.i.ready):
            m.d.comb += [
                cmd_fifo.i.valid.eq(1),
                cmd_fifo.i.payload.kind.eq(self.BlitCmd.Kind.BLIT),
                cmd_fifo.i.payload.params.blit.dst_x.eq(self._blit.f.dst_x.w_data),
                cmd_fifo.i.payload.params.blit.dst_y.eq(self._blit.f.dst_y.w_data),
                cmd_fifo.i.payload.params.blit.pixel.eq(self._blit.f.pixel.w_data),
            ]

        # Current command being executed (i.e. last command taken from command FIFO)
        current_src_x = Signal(8)
        current_src_y = Signal(8)
        current_width = Signal(8)
        current_height = Signal(8)
        current_dst_x = Signal(signed(12))
        current_dst_y = Signal(signed(12))
        current_pixel = Signal(Pixel)

        # Position within the sprite rectangle (plot_*), and within the sheet (sprite_*).
        plot_x = Signal(8)
        plot_y = Signal(8)
        sprite_x = Signal(16)
        sprite_y = Signal(16)

        # Sprite memory address and bit position for the current source pixel
        # (sheet width divisible by 8, as for the stock blitter), registered
        # in ADDR for the read in READ_SPRITE_DATA and the test in CHECK_PIXEL.
        byte_addr = Signal(16)
        sprite_memory_addr = Signal(self.memory_addr_width)
        pixel_bit_index = Signal(5)
        m.d.comb += [
            byte_addr.eq(sprite_y * bytes_per_row + (sprite_x >> 3)),
            sprite_memory_addr.eq(byte_addr >> 2),
            pixel_bit_index.eq(((byte_addr & 3) << 3) | (sprite_x & 7)),
        ]
        addr_r = Signal.like(sprite_memory_addr)
        bit_r = Signal.like(pixel_bit_index)

        # Check if current pixel should be drawn (handle MSB-first bytes in little-endian words, as we
        # will get from a `memcpy` of raw fontsheet data)
        draw_pixel = Signal()
        corrected_bit_index = Signal(5)
        m.d.comb += [
            corrected_bit_index.eq(((bit_r >> 3) << 3) | (7 - bit_r[0:3])),
            draw_pixel.eq(sprite_r_port.data.bit_select(corrected_bit_index, 1)),
        ]

        m.d.comb += [
            self.o.payload.x.eq(current_dst_x + plot_x),
            self.o.payload.y.eq(current_dst_y + plot_y),
            self.o.payload.pixel.eq(current_pixel),
            self.o.payload.blend.eq(BlendMode.REPLACE),
            self.o.payload.offset.eq(OffsetMode.ABSOLUTE),
        ]

        m.d.comb += sprite_r_port.addr.eq(addr_r)

        with m.FSM():

            with m.State('IDLE'):
                m.d.comb += cmd_fifo.o.ready.eq(1)
                with m.If(cmd_fifo.o.valid):
                    with m.Switch(cmd_fifo.o.payload.kind):
                        with m.Case(self.BlitCmd.Kind.SRC):
                            m.d.sync += [
                                current_src_x .eq(cmd_fifo.o.payload.params.src.src_x),
                                current_src_y .eq(cmd_fifo.o.payload.params.src.src_y),
                                current_height.eq(cmd_fifo.o.payload.params.src.height),
                                current_width .eq(cmd_fifo.o.payload.params.src.width),
                            ]
                            # Stay in 'IDLE' state on spritesheet source commands.
                        with m.Case(self.BlitCmd.Kind.BLIT):
                            m.d.sync += [
                                plot_x.eq(0),
                                plot_y.eq(0),
                                sprite_x.eq(current_src_x),
                                sprite_y.eq(current_src_y),
                                current_dst_x.eq(cmd_fifo.o.payload.params.blit.dst_x),
                                current_dst_y.eq(cmd_fifo.o.payload.params.blit.dst_y),
                                current_pixel.eq(cmd_fifo.o.payload.params.blit.pixel),
                            ]
                            m.next = 'ADDR'

            with m.State('ADDR'):
                m.d.sync += [addr_r.eq(sprite_memory_addr), bit_r.eq(pixel_bit_index)]
                m.next = 'READ_SPRITE_DATA'

            with m.State('READ_SPRITE_DATA'):
                m.next = 'CHECK_PIXEL'

            with m.State('CHECK_PIXEL'):
                with m.If(draw_pixel):
                    m.next = 'PLOT'
                with m.Else():
                    # Pixel is transparent - skip to next
                    m.next = 'NEXT_PIXEL'

            with m.State('PLOT'):
                # Send request to plotting backend, wait until it is accepted.
                m.d.comb += self.o.valid.eq(1)
                with m.If(self.o.ready):
                    m.next = 'NEXT_PIXEL'

            with m.State('NEXT_PIXEL'):
                with m.If(plot_x == (current_width - 1)):
                    m.d.sync += plot_x.eq(0)
                    m.d.sync += sprite_x.eq(current_src_x)
                    with m.If(plot_y == (current_height - 1)):
                        m.next = 'IDLE'
                    with m.Else():
                        m.d.sync += plot_y.eq(plot_y + 1)
                        m.d.sync += sprite_y.eq(sprite_y + 1)
                        m.next = 'ADDR'
                with m.Else():
                    m.d.sync += plot_x.eq(plot_x + 1)
                    m.d.sync += sprite_x.eq(sprite_x + 1)
                    m.next = 'ADDR'

        return m


@contextlib.contextmanager
def pipelined_blit(memory_words=2048):
    """Within this block, `TiliquaSoc` builds a `PipelinedBlit` with
    `memory_words` of sprite memory (the stock blitter has 1024; the CPU's
    window onto it is 8 KiB, at most 2048)."""
    assert memory_words <= 2048
    stock = blit.Peripheral
    blit.Peripheral = functools.partial(PipelinedBlit, memory_words=memory_words)
    try:
        yield
    finally:
        blit.Peripheral = stock
