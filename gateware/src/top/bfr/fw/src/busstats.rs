//! PSRAM bus statistics for the serial log.
//!
//! - The PSRAM controller's own counters: how busy it is and how many words
//!   it reads and writes.
//! - With the `busmon` feature (and the SoC built with `BUS_MONITOR`), the
//!   arbiter's monitor (`bfr/psram.py`), which watches one master per window
//!   of 2^24 clocks; `poll` moves it on to the next master after each window,
//!   so every master is covered once every few windows.

use log::info;
use tiliqua_pac as pac;

use pac::constants::*;

#[cfg(feature = "busmon")]
mod monitor {
    use super::*;

    const WINDOW_LOG2: u32 = 24;
    const N: usize = BUS_MASTERS.len();

    #[derive(Clone, Copy, Default)]
    struct Window {
        valid: bool,
        hold: u32,
        wait: u32,
        words: u32,
        txns: u32,
        longest: u16,
        longest_wait: u16,
    }

    pub struct Monitor {
        mon: pac::BUSMON,
        seq: u8,
        windows: [Window; N],
    }

    impl Monitor {
        pub fn new(mon: pac::BUSMON) -> Self {
            let seq = mon.result().read().seq().bits();
            mon.select().write(|w| unsafe { w.master().bits(0) });
            Self { mon, seq, windows: [Window::default(); N] }
        }

        /// Collect a finished window, and watch the next master.
        pub fn poll(&mut self) {
            let r = self.mon.result().read();
            if r.seq().bits() == self.seq {
                return;
            }
            self.seq = r.seq().bits();
            let i = r.master().bits() as usize;
            let l = self.mon.longest().read();
            if i < N {
                self.windows[i] = Window {
                    valid: true,
                    hold: self.mon.hold().read().count().bits(),
                    wait: self.mon.wait().read().count().bits(),
                    words: self.mon.words().read().count().bits(),
                    txns: self.mon.txns().read().count().bits(),
                    longest: l.hold().bits(),
                    longest_wait: l.wait().bits(),
                };
            }
            let next = (self.mon.select().read().master().bits() as usize + 1) % N;
            self.mon.select().write(|w| unsafe { w.master().bits(next as u8) });
        }

        pub fn log(&self) {
            // Per window: percent of the window, per-second rates.
            let pct = |x: u32| (x as u64 * 1000 >> WINDOW_LOG2) as u32;
            let rate = |x: u32| ((x as u64 * CLOCK_SYNC_HZ as u64) >> WINDOW_LOG2) as u32;
            for (name, w) in BUS_MASTERS.iter().zip(self.windows.iter()) {
                if !w.valid {
                    continue;
                }
                info!("bus {:8}: hold {}.{}%  wait {}.{}%  {} kw/s  {} txn/s  longest {} wait {} clk",
                      name, pct(w.hold) / 10, pct(w.hold) % 10, pct(w.wait) / 10, pct(w.wait) % 10,
                      rate(w.words) / 1000, rate(w.txns), w.longest, w.longest_wait);
            }
        }
    }
}

pub struct BusStats {
    psram: pac::PSRAM_CSR,
    #[cfg(feature = "busmon")]
    monitor: monitor::Monitor,
}

impl BusStats {
    /// Takes the PSRAM_CSR (and BUSMON) peripherals: nothing else uses them.
    pub fn new() -> Self {
        let p = unsafe { pac::Peripherals::steal() };
        p.PSRAM_CSR.ctrl().write(|w| w.collect().bit(true));
        Self {
            psram: p.PSRAM_CSR,
            #[cfg(feature = "busmon")]
            monitor: monitor::Monitor::new(p.BUSMON),
        }
    }

    /// Between logs: the monitor's windows (nothing without `busmon`).
    pub fn poll(&mut self) {
        #[cfg(feature = "busmon")]
        self.monitor.poll();
    }

    /// Log the controller's totals since the last call (and each master's
    /// latest window), then restart the totals.
    pub fn log(&mut self) {
        let elapsed = self.psram.stats0().read().cycles_elapsed().bits().max(1) as u64;
        let idle = self.psram.stats1().read().cycles_idle().bits() as u64;
        let rd = self.psram.stats2().read().cycles_ack_r().bits() as u64;
        let wr = self.psram.stats3().read().cycles_ack_w().bits() as u64;
        self.psram.ctrl().write(|w| w.collect().bit(true));
        let per_s = |x: u64| (x * CLOCK_SYNC_HZ as u64 / elapsed) as u32;
        info!("psram: busy {}%  read {} kw/s  write {} kw/s  (over {} ms)",
              (elapsed - idle.min(elapsed)) * 100 / elapsed, per_s(rd) / 1000, per_s(wr) / 1000,
              elapsed * 1000 / CLOCK_SYNC_HZ as u64);
        #[cfg(feature = "busmon")]
        self.monitor.log();
    }
}
