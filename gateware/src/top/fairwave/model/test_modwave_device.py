"""The modwave reader against a stand-in for the instrument, which answers the way its own program's `rpcz` does."""

import argparse
import socket
import struct
import sys
import threading
from pathlib import Path

import pytest

sys.path.insert(0, str(Path(__file__).resolve().parent.parent / "tools"))
import modwave as mw  # noqa: E402
import modwave_device as md  # noqa: E402


class StandIn:
    """Enough of the instrument: a ZMTP 3.0 peer with a few files. It keeps every request, to show what was asked of it."""

    def __init__(self, files, fail_read_at=None, short_reads=False):
        self.files = files
        self.fail_read_at = fail_read_at
        self.short_reads = short_reads
        self.requests = []
        self.reads = []
        self.listener = socket.create_server(("127.0.0.1", 0))
        self.port = self.listener.getsockname()[1]
        threading.Thread(target=self.serve, daemon=True).start()

    def serve(self):
        while True:
            try:
                conn, _ = self.listener.accept()
            except OSError:
                return
            threading.Thread(target=self.talk, args=(conn,), daemon=True).start()

    def talk(self, conn):
        def exactly(n):
            out = b""
            while len(out) < n:
                part = conn.recv(n - len(out))
                if not part:
                    raise ConnectionError
                out += part
            return out

        def frame():
            flags = exactly(1)[0]
            size = struct.unpack(">Q", exactly(8))[0] if flags & md.LONG else exactly(1)[0]
            return flags, exactly(size)
        try:
            conn.sendall(b"\xff" + bytes(8) + b"\x7f" + bytes((3, 0)) + b"NULL".ljust(20, b"\0") + b"\0" + bytes(31))
            exactly(64)
            frame()
            ready = b"\x05READY" + b"\x0bSocket-Type" + struct.pack(">I", 6) + b"ROUTER"
            conn.sendall(bytes((md.COMMAND, len(ready))) + ready)
            while True:
                frames = []
                while True:
                    flags, body = frame()
                    frames.append(body)
                    if not flags & md.MORE:
                        break
                empty, event, header, message = frames
                assert empty == b""
                head = {n: v for n, _, v in mw.wire_fields(header)}
                service, method = head[3].decode(), head[4].decode()
                self.requests.append((service, method))
                reply = self.answer(method, {n: v for n, _, v in mw.wire_fields(message)})
                out = [b"", event, b"", reply]
                data = b""
                for i, body in enumerate(out):
                    more = md.MORE if i < len(out) - 1 else 0
                    data += bytes((more | md.LONG,)) + struct.pack(">Q", len(body)) + body if len(body) > 255 else bytes((more, len(body))) + body
                conn.sendall(data)
        except (ConnectionError, OSError):
            conn.close()

    def answer(self, method, request):
        if method == "IdentifyServer":
            return md.field(6, "modwave") + md.field(7, "2.1.8")
        if method == "GetFileList":
            # (as the instrument does: names are whole paths, and a folder's own children sit inside its node)
            root = request[1].decode().rstrip("/") + "/"
            if root != "/Sample/":
                return md.field(1, 3)
            folders = {}
            nodes = b""
            for name, data in self.files.items():
                folder, _, leaf = name.rpartition("/")
                node = md.field(1, root + name) + md.field(4, len(data))
                if folder:
                    folders[folder] = folders.get(folder, b"") + md.field(3, node)
                else:
                    nodes += md.field(2, node)
            return nodes + b"".join(md.field(2, md.field(1, root + f) + md.field(2, True) + kids) for f, kids in folders.items())
        if method == "ReadFile":
            path, at, n = request[1].decode(), request.get(2, 0), request.get(3, 0)
            self.reads.append((path, at, n))
            if self.fail_read_at is not None and at >= self.fail_read_at:
                return md.field(1, 3)
            data = self.files[path.split("/", 2)[-1]]
            if at + n > len(data):
                return md.field(1, 3)
            return md.field(2, data[at:at + n // 2 if self.short_reads else at + n])
        return md.field(1, 2)


@pytest.fixture
def files():
    return {"01/4b6f7267-a": bytes(range(256)) * 40, "01/4b6f7267-b": b"\x01\x02\x03", "02/4b6f7267-c": b""}


def open_device(standin):
    return md.Device("127.0.0.1", standin.port, timeout=5.0)


def test_identifying_the_instrument_goes_through_a_whole_exchange(files):
    device = open_device(StandIn(files))
    reply = device.call("ClientService", "IdentifyServer")
    assert reply["product_name"] == "modwave"
    assert reply["product_version"] == "2.1.8"
    device.close()


@pytest.mark.parametrize("service,method", [
    ("FileSystemService", "WriteFile"),
    ("FileSystemService", "DeleteFile"),
    ("SoundLibraryService", "ImportFile"),
    ("SoundLibraryService", "RemapMultiSampleReferences"),
    ("ClientService", "Quit"),
    ("ClientService", "Add"),
])
def test_it_refuses_anything_that_could_change_the_instrument(files, service, method):
    standin = StandIn(files)
    device = open_device(standin)
    with pytest.raises(md.DeviceError, match="read-only"):
        device.call(service, method)
    assert standin.requests == []
    device.close()


def test_nothing_on_the_read_only_list_writes():
    assert not [call for call in md.CALLS if any(word in call[1] for word in ("Write", "Delete", "Set", "Import", "Remap", "Add", "Quit", "Remove"))]


def test_a_listing_flattens_its_folders_and_keeps_full_paths(files):
    device = open_device(StandIn(files))
    assert device.files("/Sample") == [("/Sample/01/4b6f7267-a", 10240), ("/Sample/01/4b6f7267-b", 3), ("/Sample/02/4b6f7267-c", 0)]
    device.close()


def test_a_fetch_copies_every_byte_and_lists_what_it_copied(files, tmp_path):
    standin = StandIn(files)
    device = open_device(standin)
    manifest = md.fetch(device, "/Sample", tmp_path, read_size=1000, say=lambda _: None)
    device.close()
    for name, data in files.items():
        assert (tmp_path / name).read_bytes() == data
    assert [m["size"] for m in manifest] == [10240, 3, 0]
    assert all(n <= 1000 for _, _, n in standin.reads), "a read larger than asked for could starve the sound engine"
    assert not list(tmp_path.rglob("*.part"))


def test_a_read_never_runs_past_the_end_as_the_instrument_would_fail_it(files, tmp_path):
    standin = StandIn(files)
    device = open_device(standin)
    md.fetch(device, "/Sample", tmp_path, read_size=7000, say=lambda _: None)
    device.close()
    assert ("/Sample/01/4b6f7267-a", 7000, 3240) in standin.reads


def test_a_stopped_fetch_carries_on_from_where_it_was(files, tmp_path):
    standin = StandIn(files, fail_read_at=4000)
    device = open_device(standin)
    with pytest.raises(md.DeviceError, match="RESULT_FILE_IO_ERROR"):
        md.fetch(device, "/Sample", tmp_path, read_size=1000, say=lambda _: None)
    device.close()
    assert (tmp_path / "01/4b6f7267-a.part").stat().st_size == 4000
    assert not (tmp_path / "01/4b6f7267-a").exists(), "a partial file mustn't look finished"

    standin = StandIn(files)
    device = open_device(standin)
    md.fetch(device, "/Sample", tmp_path, read_size=1000, say=lambda _: None)
    device.close()
    assert standin.reads[0][1] == 4000
    assert (tmp_path / "01/4b6f7267-a").read_bytes() == files["01/4b6f7267-a"]

    standin = StandIn(files)
    device = open_device(standin)
    md.fetch(device, "/Sample", tmp_path, read_size=1000, say=lambda _: None)
    device.close()
    assert standin.reads == [], "what's whole isn't read again"


def test_a_path_from_the_instrument_can_not_climb_out_of_the_folder(tmp_path):
    device = open_device(StandIn({"../escaped": b"x"}))
    with pytest.raises(md.DeviceError, match="isn't under"):
        md.fetch(device, "/Sample", tmp_path, say=lambda _: None)
    device.close()
    assert not (tmp_path.parent / "escaped").exists()


def test_a_failed_call_says_what_went_wrong(files):
    device = open_device(StandIn(files))
    with pytest.raises(md.DeviceError, match="RESULT_NOT_IMPLEMENTED"):
        device.call("SoundLibraryService", "GetAllSampleCollectionInfo")
    device.close()


def test_it_notices_a_short_read(files):
    device = open_device(StandIn(files, short_reads=True))
    with pytest.raises(md.DeviceError, match="asked for 100 bytes"):
        device.read("/Sample/01/4b6f7267-a", 0, 100)
    device.close()


@pytest.mark.parametrize("rewritten", ["C:/Program Files/Git/Korg/FileSystem", "D:\\Korg"])
def test_a_path_git_bash_has_rewritten_is_caught_before_it_reaches_the_instrument(rewritten):
    with pytest.raises(argparse.ArgumentTypeError, match="MSYS_NO_PATHCONV"):
        md.folder_on_instrument(rewritten)


def test_a_path_on_the_instrument_is_left_alone():
    assert md.folder_on_instrument("/Korg/FileSystem/Internal/Collections/Sample") == "/Korg/FileSystem/Internal/Collections/Sample"


def test_a_read_past_the_end_is_an_error_as_on_the_instrument(files):
    device = open_device(StandIn(files))
    with pytest.raises(md.DeviceError, match="RESULT_FILE_IO_ERROR"):
        device.read("/Sample/01/4b6f7267-b", 0, 100)
    device.close()
