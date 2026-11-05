"""Reads files from a Korg modwave over USB. Its factory samples are on its own flash and in no file Korg ships.

Plug the instrument in, close Korg's Editor Librarian, and from `gateware/`:

    python src/top/fairwave/tools/modwave_device.py info
    python src/top/fairwave/tools/modwave_device.py list /Korg/FileSystem/Internal/Collections
    python src/top/fairwave/tools/modwave_device.py fetch /Korg/FileSystem/Internal/Collections/Sample D:/midi/modwave/factory
    python src/top/fairwave/tools/modwave_device.py fetch /Korg/FileSystem/Internal/Database D:/midi/modwave/database

Those two folders are what `import_modwave.py --auto D:/midi/modwave` looks for: the sample banks (3.4 GB, about 15 minutes),
and the instrument's own library of sounds and wavetables (0.2 GB). `fetch` picks up where it left off if it's stopped.
`--host` and `--port` say where it is if Bonjour can't find it. In Git Bash, set `MSYS_NO_PATHCONV=1` first, or it turns
`/Korg/...` into a Windows path.

It only reads: `CALLS` lists everything it can ask for, and `Device.call` refuses anything else. The instrument offers
calls that write and delete too, so that list is the safety catch and is what to check before adding to it.

USB gives the instrument a network adapter, and it serves `_korg-synth._tcp` on it: the `rpcz` library over ZeroMQ, as
read from its own program (`dwX`). This speaks enough of ZeroMQ's protocol (ZMTP 3.0) itself to need nothing installed.
"""

import argparse
import hashlib
import json
import re
import socket
import struct
import subprocess
import sys
import time
from pathlib import Path

HERE = Path(__file__).resolve().parent
sys.path.insert(0, str(HERE))
import modwave as mw  # noqa: E402

SERVICE_TYPE = "_korg-synth._tcp"
NS = "KorgProtocolMessage."
READ_SIZE = 1 << 20     # the instrument allocates what's asked for, and has 1 GB for its sound engine as well

# Each call this can make: (service, method) -> the response's message. None of them change anything on the instrument.
CALLS = {
    ("ClientService", "IdentifyServer"): "ClientIdentifyServerResponse",
    ("FileSystemService", "GetFileList"): "GetFileListResponse",
    ("FileSystemService", "GetFileSize"): "GetFileSizeResponse",
    ("FileSystemService", "ReadFile"): "ReadFileResponse",
    ("SoundLibraryService", "GetAllSampleCollectionInfo"): "GetAllSampleCollectionInfoResponse",
    ("SoundLibraryService", "GetCollectionNames"): "GetCollectionNamesResponse",
    ("SoundLibraryService", "GetCollectionMultiSampleList"): "GetCollectionMultiSampleListResponse",
}

MORE, LONG, COMMAND = 1, 2, 4
RESPONSE_STATUS = {0: "OK", 1: "INACTIVE", 2: "ACTIVE", 3: "CANCELLED", 4: "APPLICATION_ERROR", 5: "DEADLINE_EXCEEDED", 6: "TERMINATED"}


class DeviceError(Exception):
    pass


def field(number, value):
    """A protobuf field: a string, bytes, a bool or an unsigned number."""
    def varint(v):
        out = bytearray()
        while v > 0x7F:
            out.append(v & 0x7F | 0x80)
            v >>= 7
        out.append(v)
        return bytes(out)
    if isinstance(value, str):
        value = value.encode("utf-8")
    if isinstance(value, bytes):
        return varint(number << 3 | 2) + varint(len(value)) + value
    return varint(number << 3) + varint(int(value))


class Zmtp:
    """One DEALER socket's end of ZMTP 3.0, with no authentication (the NULL mechanism), which is what the instrument asks for."""

    def __init__(self, host, port, timeout=30.0, debug=False):
        self.debug = debug
        self.sock = socket.create_connection((host, port), timeout)
        self.sock.setsockopt(socket.IPPROTO_TCP, socket.TCP_NODELAY, 1)
        self.sock.sendall(b"\xff" + bytes(8) + b"\x7f" + bytes((3, 0)) + b"NULL".ljust(20, b"\0") + b"\0" + bytes(31))
        peer = self.exactly(64)
        if peer[0] != 0xFF or peer[9] != 0x7F or peer[10] < 3:
            raise DeviceError(f"that isn't ZMTP 3: {peer[:12].hex()}")
        mechanism = peer[12:32].rstrip(b"\0")
        if mechanism != b"NULL":
            raise DeviceError(f"it asks for {mechanism!r} authentication, which this doesn't do")
        ready = b"\x05READY" + b"\x0bSocket-Type" + struct.pack(">I", 6) + b"DEALER" + b"\x08Identity" + struct.pack(">I", 0)
        self.sock.sendall(bytes((COMMAND, len(ready))) + ready)
        flags, body = self.frame()
        if not flags & COMMAND or not body.startswith(b"\x05READY"):
            raise DeviceError(f"expected its READY: {body[:40].hex()}")

    def exactly(self, n):
        out = bytearray()
        while len(out) < n:
            part = self.sock.recv(min(n - len(out), 1 << 20))
            if not part:
                raise DeviceError("the instrument closed the connection")
            out += part
        return bytes(out)

    def frame(self):
        flags = self.exactly(1)[0]
        size = struct.unpack(">Q", self.exactly(8))[0] if flags & LONG else self.exactly(1)[0]
        return flags, self.exactly(size)

    def send(self, frames):
        out = bytearray()
        for i, body in enumerate(frames):
            flags = MORE if i < len(frames) - 1 else 0
            if len(body) > 255:
                out += bytes((flags | LONG,)) + struct.pack(">Q", len(body))
            else:
                out += bytes((flags, len(body)))
            out += body
        if self.debug:
            print("  >", [f.hex() if len(f) < 80 else f"{len(f)} bytes" for f in frames], file=sys.stderr)
        self.sock.sendall(out)

    def receive(self):
        frames = []
        while True:
            flags, body = self.frame()
            if flags & COMMAND:     # (nothing in ZMTP 3.0 needs answering)
                continue
            frames.append(body)
            if not flags & MORE:
                if self.debug:
                    print("  <", [f.hex() if len(f) < 80 else f"{len(f)} bytes" for f in frames], file=sys.stderr)
                return frames

    def close(self):
        self.sock.close()


class Device:
    """The instrument's read-only calls. A request is [empty, event id, header, message], and comes back [empty, event id, header, message]."""

    def __init__(self, host, port, timeout=30.0, debug=False):
        self.link = Zmtp(host, port, timeout, debug)
        self.event = 0

    def call(self, service, method, request=b""):
        response = CALLS.get((service, method))
        if response is None:
            raise DeviceError(f"{service}.{method} isn't on the read-only list")
        self.event += 1
        event = struct.pack("<Q", self.event)
        self.link.send([b"", event, field(3, service) + field(4, method), request])
        while True:
            frames = self.link.receive()
            if len(frames) >= 3 and frames[0] == b"" and frames[1] == event:
                break
            if len(frames) < 3 or frames[0] != b"":
                raise DeviceError(f"unexpected reply: {[f[:32].hex() for f in frames]}")
        head = {n: v for n, _, v in mw.wire_fields(frames[2])}
        status = head.get(1, 0)
        if status != 0:
            raise DeviceError(f"{service}.{method}: {RESPONSE_STATUS.get(status, status)} {head.get(3, b'').decode('utf-8', 'replace')}")
        out = mw.decode(frames[3] if len(frames) > 3 else b"", NS + response)
        result = out.get("result", "RESULT_OK")
        if result != "RESULT_OK":
            raise DeviceError(f"{service}.{method}: {result}")
        return out

    def files(self, folder):
        """(path, size) of every file under a folder. The instrument gives whole paths back, not names."""
        reply = self.call("FileSystemService", "GetFileList", field(1, folder) + field(2, True))

        def walk(nodes):
            for node in nodes:
                if node.get("is_folder"):
                    yield from walk(node.get("child_node", []))
                else:
                    yield node.get("name", ""), node.get("size_bytes", 0)
        return list(walk(reply.get("file_node", [])))

    def read(self, path, offset, length):
        """Exactly `length` bytes: the instrument fails a read that runs past a file's end."""
        reply = self.call("FileSystemService", "ReadFile", field(1, path) + field(2, offset) + field(3, length))
        data = reply.get("buffer", b"")
        if len(data) != length:
            raise DeviceError(f"{path}: asked for {length} bytes at {offset}, got {len(data)}")
        return data

    def close(self):
        self.link.close()


def fetch(device, folder, out, read_size=READ_SIZE, say=print):
    """Copies a folder from the instrument. What's already whole is kept, and a partial `.part` file carries on."""
    out = Path(out)
    files = device.files(folder)
    total = sum(size for _, size in files)
    say(f"{len(files)} files, {total / 1e9:.2f} GB")
    done = 0
    began = time.monotonic()
    fetched = 0
    manifest = []
    for path, size in files:
        relative = path[len(folder.rstrip("/")) + 1:]
        if not path.startswith(folder.rstrip("/") + "/") or relative.startswith("/") or ".." in relative.split("/"):
            raise DeviceError(f"{path} isn't under {folder}")
        local = out / relative
        local.parent.mkdir(parents=True, exist_ok=True)
        part = local.with_name(local.name + ".part")
        if not (local.exists() and local.stat().st_size == size):
            at = part.stat().st_size if part.exists() else 0
            if at > size:
                part.unlink()
                at = 0
            with part.open("ab") as f:
                while at < size:
                    data = device.read(path, at, min(read_size, size - at))
                    f.write(data)
                    at += len(data)
                    fetched += len(data)
                    seconds = time.monotonic() - began
                    rate = fetched / seconds if seconds else 0
                    print(f"\r{(done + at) / 1e6:9.1f} of {total / 1e6:.1f} MB, {rate / 1e6:5.1f} MB/s  {relative[-40:]:40}", end="", flush=True, file=sys.stderr)
            part.replace(local)
        done += size
        digest = hashlib.sha256()
        with local.open("rb") as f:
            for chunk in iter(lambda: f.read(1 << 20), b""):
                digest.update(chunk)
        manifest.append({"path": path, "size": size, "sha256": digest.hexdigest()})
    (out / "MANIFEST.json").write_text(json.dumps({"folder": folder, "files": manifest}, indent=1), encoding="utf-8")
    say(f"\n{len(files)} files in {out}")
    return manifest


def find(seconds=4.0):
    """(host, port) from Bonjour, which Korg's own software installs."""
    def lines_of(args):
        p = subprocess.Popen(["dns-sd", *args], stdout=subprocess.PIPE, stderr=subprocess.DEVNULL, text=True, errors="replace")
        try:
            out, _ = p.communicate(timeout=seconds)
        except subprocess.TimeoutExpired:
            p.kill()
            out, _ = p.communicate()
        return out.splitlines()
    try:
        browse = lines_of(["-B", SERVICE_TYPE, "local."])
    except OSError as e:
        raise DeviceError(f"couldn't run dns-sd, so say where it is with --host and --port: {e}")
    names = [m.group(1).strip() for m in (re.search(re.escape(SERVICE_TYPE) + r"\.\s+(.+)$", line) for line in browse if " Add " in line) if m]
    if not names:
        raise DeviceError("no modwave found: is it on, connected by USB, and finished starting up?")
    for line in lines_of(["-L", names[0], SERVICE_TYPE, "local."]):
        m = re.search(r"can be reached at (\S+?)\.?:(\d+)", line)
        if m:
            return m.group(1), int(m.group(2))
    raise DeviceError(f"found {names[0]} but couldn't resolve it")


def folder_on_instrument(text):
    """A path on the instrument. Git Bash turns `/Korg/...` into a Windows path before Python sees it, which the instrument just calls a file error."""
    if re.match(r"[A-Za-z]:[/\\]", text):
        raise argparse.ArgumentTypeError(f"{text} is a Windows path. Git Bash rewrites paths starting with /, so set MSYS_NO_PATHCONV=1 or use PowerShell")
    return text


def main():
    parser = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    parser.add_argument("--host")
    parser.add_argument("--port", type=int)
    parser.add_argument("--debug", action="store_true", help="print every frame")
    verbs = parser.add_subparsers(dest="verb", required=True)
    verbs.add_parser("info", help="what the instrument is, and its sample collections")
    listing = verbs.add_parser("list", help="the files under a folder")
    listing.add_argument("folder", type=folder_on_instrument)
    copy = verbs.add_parser("fetch", help="copy a folder here")
    copy.add_argument("folder", type=folder_on_instrument)
    copy.add_argument("out")
    args = parser.parse_args()

    host, port = (args.host, args.port) if args.host and args.port else find()
    print(f"{host} port {port}")
    device = Device(host, port, debug=args.debug)
    try:
        if args.verb == "info":
            print(json.dumps(mw.plain(device.call("ClientService", "IdentifyServer")), indent=1))
            print(json.dumps(mw.plain(device.call("SoundLibraryService", "GetAllSampleCollectionInfo")), indent=1))
            names = device.call("SoundLibraryService", "GetCollectionNames", field(1, 1)).get("collection_name", [])
            print("sample collections:", names)
            request = b"".join(field(1, name) for name in names)
            samples = device.call("SoundLibraryService", "GetCollectionMultiSampleList", request).get("uuid_name", [])
            print(f"{len(samples)} multisamples")
            for s in samples:
                print(f"  {mw.uuid_text(s.get('uuid', b''))}  {s.get('name', '')}")
        elif args.verb == "list":
            files = device.files(args.folder)
            for path, size in files:
                print(f"{size:13}  {path}")
            print(f"{len(files)} files, {sum(s for _, s in files) / 1e9:.2f} GB")
        elif args.verb == "fetch":
            fetch(device, args.folder, args.out)
    finally:
        device.close()
    return 0


if __name__ == "__main__":
    try:
        sys.exit(main())
    except (DeviceError, OSError) as e:
        sys.exit(f"modwave_device: {e}")
