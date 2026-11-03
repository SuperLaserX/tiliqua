"""This bitstream's regions through the flasher's own layout check. Packing an archive doesn't run
that check, so a region that doesn't fit would otherwise only show when it is flashed."""

import importlib.util
import sys
from pathlib import Path

import pytest

from tiliqua.build.types import FLASH_PAGE_SZ, N_MANIFESTS, BitstreamManifest, MemoryRegion, RegionType
from tiliqua.flash.spiflash_layout import SlotLayout, compute_concrete_regions_to_flash

# The most the layout leaves the bitstream and the firmware.
BITSTREAM_MAX = SlotLayout.FIRMWARE_BASE_OFFSET
FIRMWARE_MAX = SlotLayout.OPTIONS_BASE_OFFSET - SlotLayout.FIRMWARE_BASE_OFFSET


def patch_window():
    spec = importlib.util.spec_from_file_location(
        "fairwave_top", Path(__file__).resolve().parents[1] / "top.py")
    top = importlib.util.module_from_spec(spec)
    sys.modules[spec.name] = top
    spec.loader.exec_module(top)
    return top.FairWaveSoc.PATCH_WINDOW


def manifest(window):
    return BitstreamManifest(
        hw_rev=5, name="FAIRWAVE", tag="test", regions=[
            MemoryRegion("top.bit", BITSTREAM_MAX, RegionType.Bitstream),
            MemoryRegion("firmware.bin", FIRMWARE_MAX, RegionType.RamLoad, psram_dst=0x200000),
            MemoryRegion("<options>", window, RegionType.OptionStorage),
            MemoryRegion("manifest.json", FLASH_PAGE_SZ, RegionType.Manifest),
        ])


@pytest.mark.parametrize("slot", range(N_MANIFESTS))
def test_the_patch_window_fits_every_slot(slot):
    window = patch_window()
    _, regions = compute_concrete_regions_to_flash(manifest(window), slot)
    options = next(r for r in regions if r.memory_region.region_type == RegionType.OptionStorage)
    assert options.size == window


def test_a_larger_patch_window_would_be_refused():
    # (ValueError is what the check means to raise; AttributeError is what formatting its message
    # raises at the moment.)
    with pytest.raises((ValueError, AttributeError)):
        compute_concrete_regions_to_flash(manifest(patch_window() + FLASH_PAGE_SZ), 0)
