pub const UI_NAME: &str = "NAM";
pub const UI_TAG: &str = "7054955-";
pub const HW_REV_MAJOR: u32 = 5;
pub const USE_EXTERNAL_PLL: bool = true;
pub const CLOCK_SYNC_HZ: u32 = 60000000;
pub const CLOCK_AUDIO_HZ: u32 = 12288000;
pub const CLOCK_DVI_HZ: u32 = 74250000;
pub const FIXED_MODELINE: Option<(u16, u16)> = None;
pub const PSRAM_BASE: usize = 0x20000000;
pub const PSRAM_SZ_BYTES: usize = 0x1000000;
pub const PSRAM_SZ_WORDS: usize = PSRAM_SZ_BYTES / 4;
pub const SPIFLASH_BASE: usize = 0x10000000;
pub const SPIFLASH_SZ_BYTES: usize = 0x1000000;
pub const PSRAM_FB_BASE: usize = 0x20000000;
pub const N_BITSTREAMS: usize = 8;
pub const BOOTINFO_BASE: usize = 0x20fff000;
pub const TOUCH_SENSOR_ORDER: [u8; 8] = [5, 7, 8, 9, 10, 11, 12, 13];
pub const PMOD_DEFAULT_CAL: [f32; 4] = [-1.248, -0.03, 0.9, 0.0];
pub const BLIT_MEM_BASE: usize = 0xc0000000;
pub const AUDIO_FS: u32 = 48000;
// Extra constants specified by an SoC subclass:
pub const MODULE_DOCSTRING: &str = r###"
NAM: a guitar amp from a Neural Amp Modeler profile.

A2 profiles (Lite and Full) run in the FPGA at 48 kHz. Plug the guitar into
IN0 and take OUT0 (OUT1 carries the same, OUT2 the dry signal). Profiles load
from a USB drive; the screen has the browser, levels, gate and tone controls.
See README.md in this directory for the plan.

    .. code-block:: text

        ┌────┐
        │in0 │◄─ guitar
        │in1 │◄─ (stereo, later)
        └────┘
        ┌────┐
        │out0│─► amp
        │out1│─► amp
        │out2│─► dry
        └────┘

Build from `gateware/`, with the venv's Scripts on PATH:

    python src/top/NAM/top.py build
"###;
pub const USB_MSC_MAX_BLOCKS_PER_READ: u32 = 0x40;
pub const USB_SCRATCH_PSRAM_OFFSET: usize = 0xfe7000;
pub const PSRAM_UI_SCRATCH: usize = 0x100000;
pub const PSRAM_FILE_BASE: usize = 0x400000;
pub const PSRAM_FILE_BYTES: usize = 0x400000;
pub const PSRAM_RINGS_BASE: usize = 0x800000;
pub const PSRAM_RINGS_BYTES: usize = 0x100000;
pub const ENGINE_WMEM_ROWS: usize = 0x600;
pub const ENGINE_AUX_WORDS: usize = 0x400;
pub const ENGINE_HIST_WORDS: usize = 0x2800;
pub const ENGINE_SBUF_R_WORDS: usize = 0x400;
pub const ENGINE_SBUF_W_WORDS: usize = 0x100;
pub const ENGINE_SEGMENTS: usize = 0x100;
pub const ENGINE_N_RINGS: usize = 0x20;
pub const ENGINE_N_READ_STREAMS: usize = 0x20;
pub const ENGINE_N_WRITE_STREAMS: usize = 0x8;
pub const DISK_IN_PSRAM: bool = false;
pub const PSRAM_DISK: usize = 0xB00000;
pub const PSRAM_DISK_BYTES: usize = 0x300000;
