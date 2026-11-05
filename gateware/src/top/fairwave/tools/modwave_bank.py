"""Reads the sample banks a modwave keeps on its flash, as `modwave_device.py fetch` copies them.

Each folder holds three files, named by uuid: the bank's description (`-0001-`, a FlatBuffer marked `KBnk`), its audio
(`-0004-...00000000`) and a cache of what the instrument keeps in memory (`-0004-...feffffff`, not needed here). Korg's own
banks are 16-bit PCM with every word XORed with `0x69AD`, which is what the instrument's program fills silence with for
them. The bank of the owner's own samples isn't scrambled, and is trimmed to where each sample starts.

Which field is which was read from the instrument's program, and checked against the owner's bank, whose Sample Builder
files say the same things another way. A multisample's uuid comes from its place in its bank, as `modwave_device.py info`
lists them.
"""

import struct
import sys
import uuid
from dataclasses import dataclass, field
from pathlib import Path

import numpy as np

HERE = Path(__file__).resolve().parent
sys.path.insert(0, str(HERE))
from korg import Zone  # noqa: E402

SCRAMBLE = 0x69AD
UNSCRAMBLED_BANK = 2    # the first byte after `Korg` in a uuid: its owner's samples
AUDIO_AT = 64           # where a bank's audio starts in its file, past the container's header


class Table:
    """A FlatBuffer table, by field number. A field that isn't there is its default."""

    def __init__(self, buf, at):
        self.buf = buf
        self.at = at
        vtable = at - struct.unpack_from("<i", buf, at)[0]
        size = struct.unpack_from("<H", buf, vtable)[0]
        self.fields = {(i - 4) // 2: at + offset for i in range(4, size, 2) if (offset := struct.unpack_from("<H", buf, vtable + i)[0])}

    def number(self, n, fmt="<I", default=0):
        return struct.unpack_from(fmt, self.buf, self.fields[n])[0] if n in self.fields else default

    def _target(self, n):
        o = self.fields[n]
        return o + struct.unpack_from("<I", self.buf, o)[0]

    def table(self, n):
        return Table(self.buf, self._target(n)) if n in self.fields else None

    def tables(self, n):
        if n not in self.fields:
            return []
        p = self._target(n)
        return [Table(self.buf, p + 4 + 4 * i + struct.unpack_from("<I", self.buf, p + 4 + 4 * i)[0]) for i in range(struct.unpack_from("<I", self.buf, p)[0])]

    def numbers(self, n, fmt="<I"):
        if n not in self.fields:
            return []
        p = self._target(n)
        return [struct.unpack_from(fmt, self.buf, p + 4 + 4 * i)[0] for i in range(struct.unpack_from("<I", self.buf, p)[0])]

    def bytes(self, n):
        if n not in self.fields:
            return b""
        p = self._target(n)
        return self.buf[p + 4:p + 4 + struct.unpack_from("<I", self.buf, p)[0]]

    def text(self, n):
        return self.bytes(n).decode("utf-8", "replace")


@dataclass
class Sample:
    at: int                 # bytes into the audio
    stored: int             # frames there are
    rate: int
    channels: int
    start: int
    loop_start: int
    end: int                # the last frame it plays
    one_shot: bool
    other_starts: dict = field(default_factory=dict)

    def start_of(self, offset):
        """Where a patch's Sample Start Offset starts it: 0 is its own start, and one the sample hasn't got is its first frame."""
        return self.start if not offset else self.other_starts.get(offset, 0)


@dataclass
class BankZone(Zone):
    sample: Sample = None
    fixed_pitch: bool = False
    channel: int = 0        # 0 as recorded, 1 left, 2 right


class Multisample:
    """Zones and how to hear them. It answers as `FileMultisample` in `import_modwave.py` does."""

    def __init__(self, bank, name, zones):
        self.bank = bank
        self.name = name
        self.zones = zones

    def audio(self, zone, channel=0):
        return self.bank.audio(zone.sample, zone.channel or channel), zone.sample.rate


class Bank:
    def __init__(self, folder):
        folder = Path(folder)
        files = {f.name: f for f in folder.iterdir()}
        description = next(f for n, f in files.items() if "-0001-" in n)
        self.audio_path = next(f for n, f in files.items() if "-0004-" in n and n.endswith("00000000"))
        self.scrambled = uuid.UUID(description.name).bytes[4] != UNSCRAMBLED_BANK
        self.identity = uuid.UUID(description.name).bytes
        self.pcm = None
        buf = description.read_bytes()
        if buf[4:8] != b"KBnk":
            raise ValueError(f"{description} isn't a sample bank")
        root = Table(buf, struct.unpack_from("<I", buf, 0)[0])
        self.name = root.text(3)
        self.author = root.text(2)
        self.samples = [self._sample(t) for t in root.tables(5)]
        self.multisamples = {}
        bank_id = root.number(1)
        for i, m in enumerate(root.tables(4)):
            own = m.bytes(4)
            ident = own if len(own) == 16 else b"Korg" + bytes([self.identity[4]]) + bytes(3) + b"\x00\x02" + struct.pack("<HI", bank_id, i)
            self.multisamples[str(uuid.UUID(bytes=ident))] = Multisample(self, m.text(0), self._zones(m))

    def _sample(self, t):
        data = t.table(1)
        if data is None:
            raise ValueError("a sample with nothing to say about its audio")
        channels = data.number(5, "<B", 1)
        starts = {k + 1: v for k, v in enumerate(t.numbers(7))}
        starts.update({7: t.number(5), 8: t.number(6)})
        stored = t.number(4)
        return Sample(data.number(1), min(stored, data.number(2)) if data.number(2) else 0, data.number(3), channels, t.number(2), t.number(3),
                      stored - 1, bool(t.number(12, "<B")), starts)

    def _zones(self, m):
        zones = []
        for z in m.tables(1):
            ref = z.table(0)
            sample = self.samples[ref.number(0, "<H") if ref else 0]
            if sample.stored:
                zones.append(BankZone("", sample.start, sample.loop_start, sample.end, sample.one_shot, z.number(2, "<b"), z.number(3, "<b"),
                                      z.number(5, "<f", 0.0), sample, bool(z.number(4, "<B")), ref.number(1, "<b") if ref else 0))
        return zones

    def audio(self, sample, channel=0):
        """A sample from -1 to 1 as float, mono: its two channels mixed, or the one that's asked for."""
        if self.pcm is None:
            self.pcm = np.memmap(self.audio_path, dtype=np.uint8, mode="r")
        words = sample.stored * sample.channels
        raw = np.frombuffer(self.pcm[AUDIO_AT + sample.at:AUDIO_AT + sample.at + words * 2].tobytes(), dtype="<u2")
        if self.scrambled:
            raw = raw ^ SCRAMBLE
        x = raw.astype(np.uint16).view(np.int16).astype(float) / 32768
        if sample.channels == 1:
            return x
        frames = x[:len(x) // sample.channels * sample.channels].reshape(-1, sample.channels)
        return frames[:, channel - 1] if channel in (1, 2) and channel <= sample.channels else frames.mean(axis=1)


def read_banks(folder):
    """{uuid: Multisample} for every bank under a folder."""
    out = {}
    for f in sorted(Path(folder).iterdir()):
        if f.is_dir():
            out.update(Bank(f).multisamples)
    return out


def main():
    for folder in sys.argv[1:]:
        for f in sorted(Path(folder).iterdir()):
            if f.is_dir():
                b = Bank(f)
                zones = sum(len(m.zones) for m in b.multisamples.values())
                print(f"{f.name}: {b.name!r} by {b.author!r}, {len(b.multisamples)} multisamples, {zones} zones, {len(b.samples)} samples, {'scrambled' if b.scrambled else 'plain'}")


if __name__ == "__main__":
    sys.exit(main())
