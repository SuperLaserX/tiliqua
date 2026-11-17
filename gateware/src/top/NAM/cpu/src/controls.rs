//! The Amp screen's settings and the encoder on them, and the level meters' arithmetic. No
//! drawing here.
//!
//! Turning moves between the settings; a click starts editing the one highlighted, turning then
//! changes it, and a click again stops. Levels change live; the network's width loads the profile
//! again (`Change` says which).

use heapless::String;
use core::fmt::Write;

use crate::loader::{Levels, OutputMode, Width};
use crate::nav::Event;
use crate::quant;

/// The trims' ranges, in dB (wider than the plugin's ±20: a guitar into a Eurorack input is
/// quiet).
pub const INPUT_RANGE: (i32, i32) = (-30, 40);
pub const OUTPUT_RANGE: (i32, i32) = (-40, 20);

#[derive(Clone, Copy, PartialEq, Eq, Debug)]
pub enum Setting {
    Input,
    Output,
    Calibrate,
    Mode,
    Width,
}

impl Setting {
    pub const ALL: [Setting; 5] = [Setting::Input, Setting::Output, Setting::Calibrate, Setting::Mode, Setting::Width];

    pub const fn name(self) -> &'static str {
        match self {
            Setting::Input => "INPUT",
            Setting::Output => "OUTPUT",
            Setting::Calibrate => "INPUT CAL",
            Setting::Mode => "OUTPUT MODE",
            Setting::Width => "NETWORK",
        }
    }
}

/// The widths the profile playing has.
#[derive(Clone, Copy, PartialEq, Eq, Debug, Default)]
pub struct Offers {
    pub lite: bool,
    pub full: bool,
}

/// What an edit changed: the levels (written live) or the width (a reload).
#[derive(Clone, Copy, PartialEq, Eq, Debug)]
pub enum Change {
    Levels,
    Width,
}

/// The Amp screen's settings.
#[derive(Clone, Copy, PartialEq, Eq, Debug)]
pub struct Controls {
    pub input_db: i32,
    pub output_db: i32,
    pub calibrated: bool,
    pub output: OutputMode,
    pub width: Width,
}

impl Default for Controls {
    fn default() -> Self {
        Controls { input_db: 0, output_db: 0, calibrated: true, output: OutputMode::Normalized, width: Width::Full }
    }
}

impl Controls {
    pub fn levels(&self) -> Levels {
        Levels {
            calibrated: self.calibrated,
            input_trim_db: self.input_db as f64,
            output: self.output,
            output_trim_db: self.output_db as f64,
        }
    }

    /// A setting's value as shown.
    pub fn text(&self, s: Setting, offers: Offers) -> String<16> {
        let mut t = String::new();
        match s {
            Setting::Input => db(&mut t, self.input_db),
            Setting::Output => db(&mut t, self.output_db),
            Setting::Calibrate => {
                t.push_str(if self.calibrated { "ON" } else { "OFF" }).ok();
            }
            Setting::Mode => {
                t.push_str(self.output.name()).ok();
            }
            Setting::Width => {
                t.push_str(self.width.name()).ok();
                if offers.lite != offers.full {
                    t.push_str(" ONLY").ok();
                }
            }
        }
        t
    }

    /// Turns setting `s` by `n` detents. None if nothing changed.
    pub fn step(&mut self, s: Setting, n: i32, offers: Offers) -> Option<Change> {
        let before = *self;
        match s {
            Setting::Input => self.input_db = (self.input_db + n).clamp(INPUT_RANGE.0, INPUT_RANGE.1),
            Setting::Output => self.output_db = (self.output_db + n).clamp(OUTPUT_RANGE.0, OUTPUT_RANGE.1),
            Setting::Calibrate => {
                if n % 2 != 0 {
                    self.calibrated = !self.calibrated;
                }
            }
            Setting::Mode => {
                let len = OutputMode::ALL.len() as i32;
                let i = OutputMode::ALL.iter().position(|m| *m == self.output).unwrap_or(0) as i32;
                self.output = OutputMode::ALL[(i + n).rem_euclid(len) as usize];
            }
            Setting::Width => {
                if offers.lite && offers.full && n % 2 != 0 {
                    self.width = match self.width {
                        Width::Lite => Width::Full,
                        Width::Full => Width::Lite,
                    };
                }
            }
        }
        if *self == before {
            None
        } else if s == Setting::Width {
            Some(Change::Width)
        } else {
            Some(Change::Levels)
        }
    }
}

fn db<const N: usize>(t: &mut String<N>, v: i32) {
    if v == 0 {
        t.push_str("0 DB").ok();
    } else {
        write!(t, "{:+} DB", v).ok();
    }
}

/// Where the encoder is on the Amp screen.
#[derive(Clone, Copy, PartialEq, Eq, Debug, Default)]
pub struct AmpCursor {
    pub at: usize,
    pub editing: bool,
}

impl AmpCursor {
    pub fn setting(&self) -> Setting {
        Setting::ALL[self.at]
    }

    pub fn event(&mut self, e: Event, c: &mut Controls, offers: Offers) -> Option<Change> {
        match e {
            Event::Hold => None,
            Event::Click => {
                self.editing = !self.editing;
                None
            }
            Event::Turn(n) if self.editing => c.step(self.setting(), n, offers),
            Event::Turn(n) => {
                let len = Setting::ALL.len() as i32;
                self.at = (self.at as i32 + n).rem_euclid(len) as usize;
                None
            }
        }
    }
}

// ---- Meters -------------------------------------------------------------------------------

/// A meter's scale: segments of `METER_STEP_DB` from `METER_FLOOR_DB` up to full scale.
pub const METER_FLOOR_DB: i32 = -60;
pub const METER_STEP_DB: i32 = 2;
pub const METER_SEGMENTS: usize = (-METER_FLOOR_DB / METER_STEP_DB) as usize;
/// How far a meter falls each update (40 ms): a segment, 50 dB a second.
const FALL: usize = 1;
/// How many updates a clip stays lit (a second).
const CLIP_HOLD: u8 = 25;

/// The peak (a 16-bit sample's magnitude) at which each segment lights: segment `k` at
/// `METER_FLOOR_DB + k * METER_STEP_DB` dBFS.
pub fn meter_thresholds() -> [u16; METER_SEGMENTS] {
    let mut t = [0u16; METER_SEGMENTS];
    for (k, v) in t.iter_mut().enumerate() {
        let db = (METER_FLOOR_DB + k as i32 * METER_STEP_DB) as f64;
        *v = quant::round_half_up(32768.0 * quant::db_to_linear(db)).clamp(1, 32767) as u16;
    }
    t
}

/// A level meter: lit segments that jump up to a peak and fall back slowly, and a clip light held
/// for a second.
#[derive(Clone, Copy, PartialEq, Eq, Debug, Default)]
pub struct Meter {
    pub lit: usize,
    clip_for: u8,
}

impl Meter {
    /// The peak since the last update.
    pub fn update(&mut self, peak: u16, thresholds: &[u16; METER_SEGMENTS]) {
        let reach = thresholds.iter().take_while(|&&t| peak >= t).count();
        self.lit = reach.max(self.lit.saturating_sub(FALL));
        if peak >= 32767 {
            self.clip_for = CLIP_HOLD;
        } else {
            self.clip_for = self.clip_for.saturating_sub(1);
        }
    }

    pub fn clipped(&self) -> bool {
        self.clip_for > 0
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    const BOTH: Offers = Offers { lite: true, full: true };

    #[test]
    fn turning_moves_a_click_edits_and_turning_then_changes() {
        let mut c = Controls::default();
        let mut k = AmpCursor::default();
        assert_eq!(k.event(Event::Turn(1), &mut c, BOTH), None);
        assert_eq!(k.setting(), Setting::Output);
        k.event(Event::Click, &mut c, BOTH);
        assert!(k.editing);
        assert_eq!(k.event(Event::Turn(-3), &mut c, BOTH), Some(Change::Levels));
        assert_eq!(c.output_db, -3);
        k.event(Event::Click, &mut c, BOTH);
        // (from the second, two back wraps round to the last)
        assert_eq!(k.event(Event::Turn(-2), &mut c, BOTH), None);
        assert_eq!(k.setting(), Setting::Width);
    }

    #[test]
    fn trims_stop_at_their_ends_and_say_so_when_they_dont_move() {
        let mut c = Controls::default();
        assert_eq!(c.step(Setting::Input, 100, BOTH), Some(Change::Levels));
        assert_eq!(c.input_db, INPUT_RANGE.1);
        assert_eq!(c.step(Setting::Input, 5, BOTH), None);
        c.step(Setting::Output, -100, BOTH);
        assert_eq!(c.output_db, OUTPUT_RANGE.0);
        assert_eq!(c.text(Setting::Output, BOTH).as_str(), "-40 DB");
        assert_eq!(c.text(Setting::Input, BOTH).as_str(), "+40 DB");
        c.input_db = 0;
        assert_eq!(c.text(Setting::Input, BOTH).as_str(), "0 DB");
        assert_eq!(c.levels().input_trim_db, 0.0);
    }

    #[test]
    fn modes_turn_round_and_switches_flip() {
        let mut c = Controls::default();
        assert_eq!(c.step(Setting::Mode, 1, BOTH), Some(Change::Levels));
        assert_eq!(c.output, OutputMode::Calibrated);
        c.step(Setting::Mode, 1, BOTH);
        assert_eq!(c.output, OutputMode::Raw);
        assert_eq!(c.text(Setting::Mode, BOTH).as_str(), "RAW");
        c.step(Setting::Calibrate, 1, BOTH);
        assert!(!c.calibrated);
        assert_eq!(c.text(Setting::Calibrate, BOTH).as_str(), "OFF");
        assert_eq!(c.step(Setting::Calibrate, 2, BOTH), None);
    }

    #[test]
    fn the_width_changes_only_when_the_profile_has_both() {
        let mut c = Controls::default();
        assert_eq!(c.step(Setting::Width, 1, BOTH), Some(Change::Width));
        assert_eq!(c.width, Width::Lite);
        let full_only = Offers { lite: false, full: true };
        assert_eq!(c.step(Setting::Width, 1, full_only), None);
        c.width = Width::Full;
        assert_eq!(c.text(Setting::Width, full_only).as_str(), "FULL ONLY");
        assert_eq!(c.text(Setting::Width, BOTH).as_str(), "FULL");
        assert_eq!(c.step(Setting::Width, 1, Offers::default()), None);
    }

    #[test]
    fn a_meter_lights_to_its_peak_falls_slowly_and_holds_a_clip() {
        let t = meter_thresholds();
        assert!(t.windows(2).all(|w| w[0] < w[1]));
        assert_eq!(t[0], 33); // -60 dBFS
        assert_eq!(METER_SEGMENTS, 30);
        let mut m = Meter::default();
        m.update(16423, &t); // -6 dBFS (32768 x 0.501): segments up to -6 lit
        assert_eq!(t[27], 16423);
        assert_eq!(m.lit, 28);
        m.update(0, &t);
        assert_eq!(m.lit, 27);
        m.update(32767, &t);
        assert_eq!(m.lit, 30);
        assert!(m.clipped());
        for _ in 0..CLIP_HOLD {
            m.update(0, &t);
        }
        assert!(!m.clipped());
        assert_eq!(m.lit, 30 - CLIP_HOLD as usize);
    }
}

// ---- The Tone screen ----------------------------------------------------------------------

/// The Tone screen's settings: the noise gate, and the tone stack (the plugin's EQ: bass, middle
/// and treble, in dB; `tone_tables.rs` has each step's coefficients).
#[derive(Clone, Copy, PartialEq, Eq, Debug)]
pub enum ToneSetting {
    Gate,
    Threshold,
    Eq,
    Bass,
    Middle,
    Treble,
}

impl ToneSetting {
    pub const ALL: [ToneSetting; 6] = [ToneSetting::Gate, ToneSetting::Threshold, ToneSetting::Eq, ToneSetting::Bass,
                                       ToneSetting::Middle, ToneSetting::Treble];

    pub const fn name(self) -> &'static str {
        match self {
            ToneSetting::Gate => "NOISE GATE",
            ToneSetting::Threshold => "THRESHOLD",
            ToneSetting::Eq => "EQ",
            ToneSetting::Bass => "BASS",
            ToneSetting::Middle => "MIDDLE",
            ToneSetting::Treble => "TREBLE",
        }
    }
}

#[derive(Clone, Copy, PartialEq, Eq, Debug)]
pub struct ToneControls {
    pub gate: bool,
    pub threshold_db: i32,
    pub eq: bool,
    pub bass_db: i32,
    pub middle_db: i32,
    pub treble_db: i32,
}

impl Default for ToneControls {
    fn default() -> Self {
        ToneControls { gate: true, threshold_db: crate::gate::THRESHOLD_DEFAULT, eq: true, bass_db: 0, middle_db: 0,
                       treble_db: 0 }
    }
}

/// The tone stack's sections for these settings, as the gateware takes them: bass, middle,
/// treble, the DC blocker (always on).
pub fn tone_sections(c: &ToneControls) -> [[i32; 5]; 4] {
    use crate::tone_tables as t;
    if !c.eq {
        return [t::IDENTITY, t::IDENTITY, t::IDENTITY, t::DC_BLOCKER];
    }
    let pick = |table: &[[i32; 5]], min: i32, db: i32| table[(db - min).clamp(0, table.len() as i32 - 1) as usize];
    [pick(&t::BASS, t::BASS_MIN, c.bass_db), pick(&t::MIDDLE, t::MIDDLE_MIN, c.middle_db),
     pick(&t::TREBLE, t::TREBLE_MIN, c.treble_db), t::DC_BLOCKER]
}

impl ToneControls {
    pub fn text(&self, s: ToneSetting) -> String<16> {
        let mut t = String::new();
        match s {
            ToneSetting::Gate => {
                t.push_str(if self.gate { "ON" } else { "OFF" }).ok();
            }
            ToneSetting::Threshold => db(&mut t, self.threshold_db),
            ToneSetting::Eq => {
                t.push_str(if self.eq { "ON" } else { "OFF" }).ok();
            }
            ToneSetting::Bass => db(&mut t, self.bass_db),
            ToneSetting::Middle => db(&mut t, self.middle_db),
            ToneSetting::Treble => db(&mut t, self.treble_db),
        }
        t
    }

    /// Turns setting `s` by `n` detents; whether anything changed.
    pub fn step(&mut self, s: ToneSetting, n: i32) -> bool {
        let before = *self;
        match s {
            ToneSetting::Gate => {
                if n % 2 != 0 {
                    self.gate = !self.gate;
                }
            }
            ToneSetting::Threshold => {
                let (lo, hi) = crate::gate::THRESHOLD_RANGE;
                self.threshold_db = (self.threshold_db + n).clamp(lo, hi);
            }
            ToneSetting::Eq => {
                if n % 2 != 0 {
                    self.eq = !self.eq;
                }
            }
            ToneSetting::Bass => self.bass_db = (self.bass_db + n).clamp(-20, 20),
            ToneSetting::Middle => self.middle_db = (self.middle_db + n).clamp(-15, 15),
            ToneSetting::Treble => self.treble_db = (self.treble_db + n).clamp(-10, 10),
        }
        *self != before
    }
}

/// Where the encoder is on the Tone screen: as on the Amp screen, turn moves and a click edits.
#[derive(Clone, Copy, PartialEq, Eq, Debug, Default)]
pub struct ToneCursor {
    pub at: usize,
    pub editing: bool,
}

impl ToneCursor {
    pub fn setting(&self) -> ToneSetting {
        ToneSetting::ALL[self.at]
    }

    /// Whether the settings changed.
    pub fn event(&mut self, e: Event, c: &mut ToneControls) -> bool {
        match e {
            Event::Hold => false,
            Event::Click => {
                self.editing = !self.editing;
                false
            }
            Event::Turn(n) if self.editing => c.step(self.setting(), n),
            Event::Turn(n) => {
                let len = ToneSetting::ALL.len() as i32;
                self.at = (self.at as i32 + n).rem_euclid(len) as usize;
                false
            }
        }
    }
}

// ---- The System screen ---------------------------------------------------------------------

/// The themes, by name (their colours are the firmware's, `fw/src/theme.rs`, in this order):
/// the dark ones, then the light.
pub const THEMES: [&str; 17] = [
    "SLATE", "TWEED", "NEON", "PHOSPHOR", "STAGE", "AMBER", "OCEAN", "GLACIER", "FOREST", "COPPER",
    "CRIMSON", "SUNSET", "ROYAL", "GRAPHITE", "FOG", "SAND", "DAYLIGHT",
];
/// The theme before one is picked (and the one the user chose as the default).
pub const THEME_DEFAULT: usize = 3;
const _: () = assert!(THEME_DEFAULT < THEMES.len());
/// Themes the pick at power-up leaves out (they can still be chosen): a white screen is a lot
/// to be met with.
pub const THEMES_NOT_PICKED: [&str; 1] = ["DAYLIGHT"];

/// The theme for this start, picked from `entropy` (any 32 bits, well mixed): one of the themes
/// not left out, each as likely.
pub fn picked_theme(entropy: u32) -> usize {
    let pool = THEMES.iter().filter(|n| !THEMES_NOT_PICKED.contains(n)).count();
    let k = ((entropy as u64 * pool as u64) >> 32) as usize;
    THEMES.iter().enumerate().filter(|(_, n)| !THEMES_NOT_PICKED.contains(n)).nth(k).map_or(THEME_DEFAULT, |(i, _)| i)
}

// ---- The Scope screen ----------------------------------------------------------------------

/// Which signals the Scope screen shows.
#[derive(Clone, Copy, PartialEq, Eq, Debug, Default)]
pub enum ScopeShow {
    #[default]
    Both,
    Output,
    Input,
}

/// Which pictures: waves and spectra, or one of them (the waves alone need no FFT, and stop
/// capturing once they have a screenful).
#[derive(Clone, Copy, PartialEq, Eq, Debug, Default)]
pub enum ScopeDisplay {
    #[default]
    All,
    Waves,
    Spectra,
}

#[derive(Clone, Copy, PartialEq, Eq, Debug, Default)]
pub struct ScopeControls {
    pub show: ScopeShow,
    pub display: ScopeDisplay,
}

impl ScopeControls {
    pub fn input(&self) -> bool {
        self.show != ScopeShow::Output
    }
    pub fn output(&self) -> bool {
        self.show != ScopeShow::Input
    }
    pub fn waves(&self) -> bool {
        self.display != ScopeDisplay::Spectra
    }
    pub fn spectra(&self) -> bool {
        self.display != ScopeDisplay::Waves
    }

    /// Turning picks the signals, a click the pictures; whether anything changed.
    pub fn event(&mut self, e: Event) -> bool {
        const SHOWS: [ScopeShow; 3] = [ScopeShow::Both, ScopeShow::Output, ScopeShow::Input];
        const DISPLAYS: [ScopeDisplay; 3] = [ScopeDisplay::All, ScopeDisplay::Waves, ScopeDisplay::Spectra];
        match e {
            Event::Turn(n) => {
                let i = SHOWS.iter().position(|s| *s == self.show).unwrap_or(0) as i32;
                self.show = SHOWS[(i + n).rem_euclid(3) as usize];
                n % 3 != 0
            }
            Event::Click => {
                let i = DISPLAYS.iter().position(|d| *d == self.display).unwrap_or(0);
                self.display = DISPLAYS[(i + 1) % 3];
                true
            }
            Event::Hold => false,
        }
    }

    /// What is shown, in words.
    pub fn text(&self) -> &'static str {
        match (self.show, self.display) {
            (ScopeShow::Both, ScopeDisplay::All) => "IN AND OUT, WAVES AND SPECTRA",
            (ScopeShow::Both, ScopeDisplay::Waves) => "IN AND OUT, WAVES",
            (ScopeShow::Both, ScopeDisplay::Spectra) => "IN AND OUT, SPECTRA",
            (ScopeShow::Output, ScopeDisplay::All) => "OUT, WAVE AND SPECTRUM",
            (ScopeShow::Output, ScopeDisplay::Waves) => "OUT, WAVE",
            (ScopeShow::Output, ScopeDisplay::Spectra) => "OUT, SPECTRUM",
            (ScopeShow::Input, ScopeDisplay::All) => "IN, WAVE AND SPECTRUM",
            (ScopeShow::Input, ScopeDisplay::Waves) => "IN, WAVE",
            (ScopeShow::Input, ScopeDisplay::Spectra) => "IN, SPECTRUM",
        }
    }
}

/// Where the encoder is on the System screen: its one setting, the theme. A click edits it,
/// turning then picks.
#[derive(Clone, Copy, PartialEq, Eq, Debug, Default)]
pub struct SystemCursor {
    pub editing: bool,
}

impl SystemCursor {
    /// Whether the theme changed.
    pub fn event(&mut self, e: Event, theme: &mut usize) -> bool {
        match e {
            Event::Click => {
                self.editing = !self.editing;
                false
            }
            Event::Turn(n) if self.editing => {
                let t = (*theme as i32 + n).rem_euclid(THEMES.len() as i32) as usize;
                let changed = t != *theme;
                *theme = t;
                changed
            }
            _ => false,
        }
    }
}

#[cfg(test)]
mod tone_tests {
    use super::*;

    #[test]
    fn the_eq_picks_its_tables_steps_and_off_passes_the_signal() {
        use crate::tone_tables as t;
        let mut c = ToneControls::default();
        assert_eq!(tone_sections(&c), [t::BASS[20], t::MIDDLE[15], t::TREBLE[10], t::DC_BLOCKER]);
        // a flat section passes the signal: b0 is 1, and the rest cancel (b1 = a1, b2 = a2)
        let flat = t::BASS[20];
        assert_eq!((flat[1], flat[2]), (-flat[3], -flat[4]));
        assert_eq!(flat[0], 1 << t::COEF_FRAC);
        c.bass_db = 20;
        c.middle_db = -15;
        c.treble_db = 10;
        assert_eq!(tone_sections(&c)[..3], [t::BASS[40], t::MIDDLE[0], t::TREBLE[20]]);
        assert!(c.step(ToneSetting::Bass, 3) == false && c.bass_db == 20);
        assert!(c.step(ToneSetting::Treble, -25) && c.treble_db == -10);
        c.eq = false;
        assert_eq!(tone_sections(&c), [t::IDENTITY, t::IDENTITY, t::IDENTITY, t::DC_BLOCKER]);
        assert_eq!(c.text(ToneSetting::Eq).as_str(), "OFF");
        assert_eq!(c.text(ToneSetting::Bass).as_str(), "+20 DB");
    }

    #[test]
    fn the_scope_turns_through_its_signals_and_clicks_through_its_pictures() {
        let mut s = ScopeControls::default();
        assert!(s.input() && s.output() && s.waves() && s.spectra());
        assert!(s.event(Event::Turn(1)));
        assert_eq!(s.show, ScopeShow::Output);
        assert!(!s.input() && s.output());
        s.event(Event::Turn(1));
        assert!(s.input() && !s.output());
        assert!(!s.event(Event::Turn(3)), "a whole turn round: no change");
        assert!(s.event(Event::Click));
        assert!(s.waves() && !s.spectra());
        s.event(Event::Click);
        assert!(!s.waves() && s.spectra());
        assert_eq!(s.text(), "IN, SPECTRUM");
        s.event(Event::Click);
        assert_eq!(s.display, ScopeDisplay::All);
        assert!(!s.event(Event::Hold));
        assert_eq!(THEMES[THEME_DEFAULT], "PHOSPHOR");
    }

    #[test]
    fn the_startup_pick_reaches_every_theme_but_daylight_about_equally() {
        let mut counts = [0u32; THEMES.len()];
        for i in 0..17_000u32 {
            counts[picked_theme(crate::seed::fmix(i))] += 1;
        }
        for (t, n) in counts.iter().enumerate() {
            if THEMES[t] == "DAYLIGHT" {
                assert_eq!(*n, 0);
            } else {
                assert!((800..1350).contains(n), "{}: {n}", THEMES[t]);
            }
        }
        assert!(THEMES.iter().all(|n| n.len() <= 8));
    }

    #[test]
    fn the_theme_turns_round_only_while_editing() {
        let mut k = SystemCursor::default();
        let mut theme = 0;
        assert!(!k.event(Event::Turn(1), &mut theme));
        k.event(Event::Click, &mut theme);
        assert!(k.event(Event::Turn(-1), &mut theme));
        assert_eq!(theme, THEMES.len() - 1);
        assert!(k.event(Event::Turn(2), &mut theme));
        assert_eq!(theme, 1);
        assert!(!k.event(Event::Turn(THEMES.len() as i32), &mut theme));
    }

    #[test]
    fn the_gate_switches_and_its_threshold_stays_in_range() {
        let mut c = ToneControls::default();
        let mut k = ToneCursor::default();
        assert!(c.gate && c.threshold_db == -39);
        assert!(!k.event(Event::Turn(1), &mut c));
        assert_eq!(k.setting(), ToneSetting::Threshold);
        k.event(Event::Click, &mut c);
        assert!(k.event(Event::Turn(-5), &mut c));
        assert_eq!(c.threshold_db, -44);
        assert_eq!(c.text(ToneSetting::Threshold).as_str(), "-44 DB");
        assert!(k.event(Event::Turn(-80), &mut c));
        assert_eq!(c.threshold_db, -100);
        assert!(!k.event(Event::Turn(-1), &mut c));
        k.event(Event::Click, &mut c);
        k.event(Event::Turn(-1), &mut c);
        assert_eq!(k.setting(), ToneSetting::Gate);
        k.event(Event::Click, &mut c);
        assert!(k.event(Event::Turn(1), &mut c));
        assert!(!c.gate);
        assert_eq!(c.text(ToneSetting::Gate).as_str(), "OFF");
    }
}
