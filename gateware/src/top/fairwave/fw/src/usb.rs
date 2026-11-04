//! The USB drive: noticing one plugged in, powering it, and reading it. Runs in the main loop; a
//! read blocks that, but the audio is all gateware and the controls have their interrupt. A
//! simulation has no USB, so it reads a disk image in PSRAM through the same trait.

use guh_dma::DmaBuf;
use heapless::String;
use guh_usb_msc::partition::find_first_fat32_lba;
use guh_usb_msc::usb_msc::{PartitionView, UsbMsc, UsbMscStatus, BLOCK_BYTES};
use crate::hal::tusb322::{AccessoryType, AttachedState, TUSB322Driver, TUSB322Mode};
use log::{info, warn};

use fairwave_cpu::disk::{self, Buffers, DiskError, Entry, ImageDisk};
use fairwave_cpu::store::PATH_BYTES;

use crate::pac::constants::*;
use crate::*;

/// How often to ask the USB-C controller whether anything is plugged in.
const POLL_MS: u32 = 250;
/// How long a drive gets to enumerate.
const ENUMERATE_MS: u32 = 8000;

/// What is being read: a drive, or the simulation's image.
pub enum Disk {
    Usb(UsbMsc0),
    Image(ImageDisk),
}

impl UsbMsc for Disk {
    fn status(&self) -> UsbMscStatus {
        match self {
            Disk::Usb(d) => d.status(),
            Disk::Image(d) => d.status(),
        }
    }

    fn capacity(&self) -> u32 {
        match self {
            Disk::Usb(d) => d.capacity(),
            Disk::Image(d) => d.capacity(),
        }
    }

    fn block_size(&self) -> u32 {
        match self {
            Disk::Usb(d) => d.block_size(),
            Disk::Image(d) => d.block_size(),
        }
    }

    fn plug_events(&self) -> u32 {
        match self {
            Disk::Usb(d) => d.plug_events(),
            Disk::Image(d) => d.plug_events(),
        }
    }

    fn read_blocks(&mut self, start_lba: u32, buf: &'static DmaBuf) -> Option<u32> {
        match self {
            Disk::Usb(d) => d.read_blocks(start_lba, buf),
            Disk::Image(d) => d.read_blocks(start_lba, buf),
        }
    }

    fn write_blocks(&mut self, start_lba: u32, buf: &'static DmaBuf) -> Option<u32> {
        match self {
            Disk::Usb(d) => d.write_blocks(start_lba, buf),
            Disk::Image(d) => d.write_blocks(start_lba, buf),
        }
    }

    fn psram_base(&self) -> u32 {
        match self {
            Disk::Usb(d) => d.psram_base(),
            Disk::Image(d) => d.psram_base(),
        }
    }

    fn completed_count(&self) -> u32 {
        match self {
            Disk::Usb(d) => d.completed_count(),
            Disk::Image(d) => d.completed_count(),
        }
    }

    fn error_count(&self) -> u32 {
        match self {
            Disk::Usb(d) => d.error_count(),
            Disk::Image(d) => d.error_count(),
        }
    }
}

#[derive(Clone, Copy, PartialEq, Eq, Debug)]
pub enum DriveState {
    Nothing,
    /// Powered, and not yet answering.
    Starting { since: u32 },
    Ready,
    Failed(&'static str),
}

impl DriveState {
    pub const fn text(self) -> &'static str {
        match self {
            DriveState::Nothing => "INSERT A USB DRIVE",
            DriveState::Starting { .. } => "READING THE DRIVE",
            DriveState::Ready => "",
            DriveState::Failed(why) => why,
        }
    }
}

#[derive(Clone, Copy, PartialEq, Eq, Debug)]
pub enum DriveEvent {
    Mounted,
    Gone,
}

pub struct Drive {
    pub state: DriveState,
    disk: Option<PartitionView<Disk>>,
    plugs: u32,
    buffers: Buffers,
    /// Absent in a simulation.
    usb: Option<(TUSB322Driver<I2c0>, pac::USB_VBUS)>,
    last_poll: u32,
}

impl Drive {
    pub fn new() -> Drive {
        const CHUNK: usize = USB_MSC_MAX_BLOCKS_PER_READ as usize * BLOCK_BYTES;
        let scratch = (PSRAM_BASE + USB_SCRATCH_PSRAM_OFFSET) as *mut u8;
        let buffers = unsafe {
            Buffers {
                windows: [
                    DmaBuf::from_raw_parts(scratch, CHUNK),
                    DmaBuf::from_raw_parts(scratch.add(CHUNK), CHUNK),
                ],
                fat_cache: DmaBuf::from_raw_parts(scratch.add(2 * CHUNK), CHUNK),
            }
        };
        let usb = if DISK_IN_PSRAM {
            None
        } else {
            let mut tusb = TUSB322Driver::new(I2c0::new(unsafe { pac::I2C0::steal() }));
            tusb.soft_reset().ok();
            tusb.set_mode(TUSB322Mode::Dfp).ok();
            Some((tusb, unsafe { pac::USB_VBUS::steal() }))
        };
        Drive { state: DriveState::Nothing, disk: None, plugs: 0, buffers, usb, last_poll: 0 }
    }

    pub const fn is_ready(&self) -> bool {
        matches!(self.state, DriveState::Ready)
    }

    fn mount(&mut self, mut disk: Disk) -> DriveState {
        if disk.block_size() != BLOCK_BYTES as u32 {
            warn!("drive: unsupported block size {}", disk.block_size());
            return DriveState::Failed("UNSUPPORTED DRIVE");
        }
        let lba = find_first_fat32_lba(&mut disk, self.buffers.windows[0]);
        info!("drive: {} blocks, file system at block {}", disk.capacity(), lba);
        self.plugs = disk.plug_events();
        self.disk = Some(PartitionView::new(disk, lba));
        DriveState::Ready
    }

    /// Whether the USB-C controller says something is there. None: couldn't ask.
    fn attached(&mut self) -> Option<bool> {
        let (tusb, _) = self.usb.as_mut()?;
        let (ctrl, conn) = (tusb.read_connection_status_control().ok()?, tusb.read_connection_status().ok()?);
        // (some adapters show up as an accessory rather than attached)
        Some(ctrl.attached_state == AttachedState::AttachedSrc
            || (ctrl.attached_state == AttachedState::AttachedAccessory && conn.accessory == AccessoryType::DebugDfp))
    }

    fn set_power(&mut self, on: bool) {
        if let Some((_, vbus)) = self.usb.as_mut() {
            vbus.flags().write(|w| w.en().bit(on));
        }
    }

    /// Follows the drive coming and going. Doesn't block.
    pub fn poll(&mut self, now: u32) -> Option<DriveEvent> {
        if DISK_IN_PSRAM {
            if self.state == DriveState::Nothing {
                let image = unsafe {
                    core::slice::from_raw_parts((PSRAM_BASE + PSRAM_DISK) as *const u8, PSRAM_DISK_BYTES)
                };
                self.state = self.mount(Disk::Image(ImageDisk::new(image, DISK_BLOCKS)));
                return Some(DriveEvent::Mounted);
            }
            return None;
        }
        if let DriveState::Starting { since } = self.state {
            let usb = unsafe { UsbMsc0::new(pac::USB_MSC::steal(), PSRAM_BASE as u32) };
            if usb.is_ready() {
                self.state = self.mount(Disk::Usb(usb));
                if self.is_ready() {
                    return Some(DriveEvent::Mounted);
                }
            } else if now.wrapping_sub(since) > ENUMERATE_MS {
                warn!("drive: did not enumerate");
                self.state = DriveState::Failed("DRIVE NOT ANSWERING");
            }
        }
        if now.wrapping_sub(self.last_poll) < POLL_MS {
            return None;
        }
        self.last_poll = now;
        let there = self.attached()?;
        match (self.state, there) {
            (DriveState::Nothing, true) => {
                info!("drive: plugged in");
                self.set_power(true);
                self.state = DriveState::Starting { since: now };
                None
            }
            (DriveState::Nothing, false) => None,
            (_, false) => {
                info!("drive: gone");
                self.set_power(false);
                self.disk = None;
                self.state = DriveState::Nothing;
                Some(DriveEvent::Gone)
            }
            (DriveState::Ready, true) => {
                // Swapped too fast for the controller to see it go.
                let lost = self.disk.as_ref().is_some_and(|d| d.link_lost(self.plugs));
                if lost {
                    self.disk = None;
                    self.state = DriveState::Starting { since: now };
                    return Some(DriveEvent::Gone);
                }
                None
            }
            _ => None,
        }
    }

    pub fn list(&mut self, dir: &str, out: &mut [Entry]) -> Result<usize, DiskError> {
        let disk = self.disk.as_mut().ok_or(DiskError::Mount)?;
        disk::list(disk, &self.buffers, dir, out)
    }

    pub fn find(&mut self, path: &str) -> Result<Entry, DiskError> {
        let disk = self.disk.as_mut().ok_or(DiskError::Mount)?;
        disk::find(disk, &self.buffers, path)
    }

    pub fn resolve(&mut self, from: &str, name: &str) -> Result<String<PATH_BYTES>, DiskError> {
        let disk = self.disk.as_mut().ok_or(DiskError::Mount)?;
        disk::resolve(disk, &self.buffers, from, name)
    }

    pub fn peek(&mut self, path: &str, head: &mut [u8]) -> Result<(usize, usize), DiskError> {
        let disk = self.disk.as_mut().ok_or(DiskError::Mount)?;
        disk::peek(disk, &self.buffers, path, head)
    }

    pub fn read_file(&mut self, path: &str, to: &'static DmaBuf) -> Result<usize, DiskError> {
        let disk = self.disk.as_mut().ok_or(DiskError::Mount)?;
        disk::read_file(disk, &self.buffers, path, to, USB_MSC_MAX_BLOCKS_PER_READ)
    }
}

impl Default for Drive {
    fn default() -> Self {
        Drive::new()
    }
}
