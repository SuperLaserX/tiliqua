"""The whole SoC in Verilator, firmware included, on this Windows machine.

`tiliqua.build.sim.simulate` needs `make`, a C++ compiler on PATH and Verilator's
Perl wrapper, none of which work here (the suite's wrapper is missing a Perl
module). This is the same flow with the tools that do: `verilator_bin` directly,
compiled with `zig c++` (the `ziglang` package in the venv, as H3000's simulation
uses). `top.py` installs it in place of the stock function, so shared code is
untouched and `python src/top/fairwave/top.py sim --name FAIRWAVE-SIM --modeline
720x720p60proto1` works as on any project. (`--name` gives the simulation's firmware,
built for a fixed video mode, its own build directory, away from the archive you flash.)

The harness (`sim/tb_soc.cpp`) adds a tap on the DAC stream, so the audio can be
compared with the model bit for bit, and it can turn and press the encoder and put
voltages on the inputs. What it does is set with `FAIRWAVE_SIM_ARGS`:

    cycles=30000000 cv=1000,0,0,0 pulse=2,0,5000,4800,2400,60000 enc=25000000:RR,28000000:P

- `cycles`: sync-domain clocks to simulate (60 per microsecond);
- `cv`: the inputs' voltages, in mV;
- `pulse=ch,lo,hi,period,high,start`: a square wave on an input instead of its steady
  voltage: in mV, and audio frames;
- `enc`: encoder events at a clock count: R and L turn a detent, H holds for the
  long press, P clicks; `keygap` is the clocks between the keys of a group (40 ms unless set);
- `load=path,offset`: a file put in PSRAM, as the bootloader would for `--usb-table` (there can be
  several: saved patches, and the disk image that stands in for a USB drive);
- `dump=offset,bytes`: PSRAM written out at the end, for `tools/check_sim.py`.

Results land in `build/fairwave-sim/out`: `frameNN.png` (the framebuffer as
scanned out, turned upright), `audio.raw` (the DAC stream as written, four
little-endian 16-bit channels), `trace.raw` (with each sample, the inputs it used and the
state a model needs to pick it up from: `WaveScanPeripheral.trace`) and `uart.txt`.

The first run compiles for a few minutes; objects are reused while the Verilog and
the harness don't change.
"""

import concurrent.futures
import glob
import hashlib
import os
import shutil
import subprocess
import sys

from amaranth.back import verilog

from tiliqua.build import sim as stock_sim
from tiliqua.build.types import FirmwareLocation
from tiliqua.platform import TiliquaRevision

HERE = os.path.dirname(os.path.realpath(__file__))
HARNESS = os.path.join(HERE, "..", "sim", "tb_soc.cpp")
BUILD = os.path.join("build", "fairwave-sim")
OBJ = os.path.join(BUILD, "obj_dir")
OUT = os.path.join(BUILD, "out")


def ports(fragment):
    """The stock SoC ports, plus the encoder and taps on the DAC stream and the DSP's state."""
    pmod = fragment.pmod0
    return stock_sim.soc_simulation_ports(fragment) | {
        "dsp_trace": (fragment.wavescan.trace.as_value(), None),
        "enc_i":     (fragment.encoder0.pins.i, None),
        "enc_q":     (fragment.encoder0.pins.q, None),
        "enc_s":     (fragment.encoder0.pins.s, None),
        "dac_valid": (pmod.i_cal.valid, None),
        "dac_ready": (pmod.i_cal.ready, None),
        "dac_data":  (pmod.i_cal.payload.as_value(), None),
    }


def _suite():
    """oss-cad-suite: at the repository's root unless OSS_CAD_SUITE says otherwise."""
    root = os.environ.get("OSS_CAD_SUITE") or os.path.abspath(
        os.path.join(HERE, "..", "..", "..", "..", "..", "oss-cad-suite"))
    if not os.path.exists(os.path.join(root, "bin", "verilator_bin.exe")):
        raise SystemExit(f"no verilator_bin.exe in {root} (set OSS_CAD_SUITE)")
    return root


def _zig(*args, cwd=None):
    subprocess.check_call([sys.executable, "-m", "ziglang", "c++", *args], cwd=cwd)


def _compile_all(sources, defines, include):
    """Each source to an object next to the others, reusing unchanged ones."""
    flags = ["-std=c++17", "-O2", "-w", "-DVM_TRACE=0", "-DVM_COVERAGE=0", "-DVL_THREADED=0",
             *[f"-D{k}={v}" for k, v in defines.items()], *[f"-I{i}" for i in include]]

    # A generated source can stay the same while the header it relies on moves things about,
    # so they count too, for everything but Verilator's own runtime.
    headers = b"".join(open(h, "rb").read() for h in sorted(glob.glob(os.path.join(OBJ, "*.h"))))

    def build(src):
        depends = b"" if os.path.basename(src).startswith("verilated") else headers
        key = hashlib.sha1((open(src, "rb").read() + repr(flags).encode() + depends)).hexdigest()[:16]
        obj = os.path.join(OBJ, f"{os.path.basename(src)[:-4]}-{key}.o")
        if not os.path.exists(obj):
            _zig("-c", *flags, os.path.abspath(src), "-o", os.path.abspath(obj))
        return obj

    with concurrent.futures.ThreadPoolExecutor(max_workers=os.cpu_count()) as pool:
        return list(pool.map(build, sources))


def simulate(fragment, ports, harness, hw_platform, clock_settings, tracing=False, archiver=None):
    """Same signature as `tiliqua.build.sim.simulate`."""
    if fragment.fb.fixed_modeline is None:
        raise SystemExit("simulation needs a static video mode: --modeline 720x720p60proto1")
    assert fragment.fw_location == FirmwareLocation.PSRAM
    os.makedirs(OBJ, exist_ok=True)
    os.makedirs(OUT, exist_ok=True)
    for old in glob.glob(os.path.join(OUT, "*")):
        os.remove(old)

    print("writing Verilog ...")
    platform = stock_sim.VerilatorPlatform(hw_platform)
    soc_v = os.path.join(BUILD, "tiliqua_soc.v")
    text = verilog.convert(fragment, platform=platform, ports=ports)
    with open(soc_v, "w") as f:
        f.write(text)
    for name, contents in platform.files.items():
        with open(os.path.join(BUILD, name), "w") as f:
            f.write(contents)

    # What the bootloader would leave in PSRAM.
    manifest = archiver.write_manifest()
    manifest_path = os.path.join(BUILD, "manifest.json")
    manifest.write_to_path(manifest_path)
    bootinfo_path = os.path.join(BUILD, "bootinfo.bin")
    # The tool is shared, and cargo refreshes its lockfile: leave it as it was, and keep
    # the build out of its directory.
    lock = os.path.join("src", "rs", "bootinfo_gen", "Cargo.lock")
    with open(lock, "rb") as f:
        lock_before = f.read()
    try:
        subprocess.check_call([
            "cargo", "run", "--manifest-path", "src/rs/bootinfo_gen/Cargo.toml", "--",
            "--manifest", manifest_path,
            "--h-active", str(fragment.fb.fixed_modeline.h_active),
            "--v-active", str(fragment.fb.fixed_modeline.v_active),
            "--fixed-pclk-hz", str(clock_settings.frequencies.dvi),
            "--output", bootinfo_path],
            env=dict(os.environ, CARGO_TARGET_DIR=os.path.abspath(os.path.join(BUILD, "bootinfo"))))
    finally:
        with open(lock, "rb") as f:
            if f.read() != lock_before:
                with open(lock, "wb") as w:
                    w.write(lock_before)

    suite = _suite()
    root = os.path.join(suite, "share", "verilator")
    env = dict(os.environ, VERILATOR_ROOT=root,
               PATH=os.pathsep.join([os.path.join(suite, "bin"), os.path.join(suite, "lib"),
                                     os.environ["PATH"]]))

    print("verilating ...")
    # (a changed design generates differently named files: only the objects carry over,
    # and they are named by their sources' contents)
    for old in glob.glob(os.path.join(OBJ, "*")):
        if not old.endswith(".o"):
            os.remove(old)
    sources = [f for f in platform.files if f.endswith((".v", ".sv"))]
    subprocess.check_call([
        os.path.join(suite, "bin", "verilator_bin.exe"),
        "-Wno-fatal", "-Wno-lint", "-Wno-COMBDLY", "-Wno-CASEINCOMPLETE", "-Wno-CASEOVERLAP",
        "-Wno-WIDTHEXPAND", "-Wno-WIDTHTRUNC", "-Wno-TIMESCALEMOD", "-Wno-PINMISSING",
        "-Wno-ASCRANGE", "-Wno-UNSIGNED", "-Wno-CMPCONST", "--quiet-exit",
        "--cc", "--Mdir", OBJ, f"-I{BUILD}", "-O3", "--x-assign", "fast", "--noassert",
        "--top-module", "top", "--prefix", "Vtiliqua_soc",
        soc_v, *[os.path.join(BUILD, f) for f in sources],
    ], env=env)

    print("compiling ...")
    include = [os.path.join(root, "include"), os.path.join(root, "include", "vltstd"), OBJ,
               os.path.join("src", "tb_cpp")]
    defines = {
        "SYNC_CLK_HZ": clock_settings.frequencies.sync,
        "AUDIO_CLK_HZ": clock_settings.frequencies.audio,
        "DVI_CLK_HZ": clock_settings.frequencies.dvi,
        "DVI_H_ACTIVE": fragment.fb.fixed_modeline.h_active,
        "DVI_V_ACTIVE": fragment.fb.fixed_modeline.v_active,
        "PSRAM_FW_OFFSET": hex(fragment.fw_base - fragment.psram_base),
        "BOOTINFO_OFFSET": hex(fragment.bootinfo_base - fragment.psram_base),
    }
    # The inputs' default calibration, so the harness can put true voltages on them.
    pmod_rev = TiliquaRevision.from_platform(fragment.platform_class).pmod_rev()
    for ch, (mul, add) in enumerate(pmod_rev.default_calibration()[:4]):
        defines[f"ADC_MUL{ch}"] = f"{mul}f"
        defines[f"ADC_ADD{ch}"] = f"{add}f"
    objs = _compile_all(
        [*sorted(glob.glob(os.path.join(OBJ, "*.cpp"))),
         os.path.join(root, "include", "verilated.cpp"),
         os.path.join(root, "include", "verilated_threads.cpp"),
         HARNESS],
        defines, include)
    exe = os.path.join(BUILD, "tb_soc.exe")
    _zig("-O2", *[os.path.abspath(o) for o in objs], "-o", os.path.abspath(exe))
    run(exe, fragment.firmware_bin_path, bootinfo_path)


def run(exe, firmware, bootinfo):
    """Runs the built simulation and post-processes its frames."""
    args = os.environ.get("FAIRWAVE_SIM_ARGS", "").split()
    print(f"running {exe} {' '.join(args)} ...", flush=True)
    subprocess.check_call([os.path.abspath(exe), os.path.abspath(firmware),
                           os.path.abspath(bootinfo), *args], cwd=OUT)
    frames_to_png(OUT)


def frames_to_png(out):
    """The scan-out dumps are BMPs of the panel as wired (it is mounted a quarter turn
    round, and the firmware's drawing is rotated to suit): turn them upright."""
    from PIL import Image
    for bmp in sorted(glob.glob(os.path.join(out, "frame*.bmp"))):
        with Image.open(bmp) as im:
            im.convert("RGB").rotate(90).save(bmp[:-4] + ".png")
        os.remove(bmp)
    print(f"results in {out}")


if __name__ == "__main__":
    # Rerun the last build with new FAIRWAVE_SIM_ARGS:
    # python src/top/fairwave/fairwave/socsim.py build/fairwave-sim/... (from gateware/)
    for old in glob.glob(os.path.join(OUT, "*")):
        os.remove(old)
    run(os.path.join(BUILD, "tb_soc.exe"), sys.argv[1],
        os.path.join(BUILD, "bootinfo.bin"))
