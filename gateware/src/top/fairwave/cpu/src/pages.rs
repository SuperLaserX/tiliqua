//! The Envelopes, Routing and Mixer screens: their cells, what each shows, and what the
//! encoder does to it. No drawing here, so the host can test all of it.
//!
//! Each screen is a flat list of cells: turning walks it, wrapping, and a click toggles
//! editing the cell. The Envelopes screen picks an envelope or LFO first (`ModCursor`), and its
//! list is that one's settings.

use core::fmt::Write;

use heapless::String;

use crate::modulation::*;
use crate::nav::Event;
use crate::patch::{self, Patch, Row, N_LAYERS};
use crate::store::N_PATCHES;
use crate::text;
use crate::wave::TRACE_CHOICES;

/// Where the encoder is on a screen.
#[derive(Clone, Copy, PartialEq, Eq, Debug, Default)]
pub struct Cursor {
    pub at: usize,
    pub editing: bool,
}

impl Cursor {
    pub fn turn(&mut self, detents: i32, cells: usize) {
        self.at = (self.at as i32 + detents).rem_euclid(cells as i32) as usize;
    }

    pub fn click(&mut self) {
        self.editing = !self.editing;
    }
}

/// A row of an envelope's tab.
#[derive(Clone, Copy, PartialEq, Eq, Debug)]
pub enum EnvRow {
    Delay,
    Attack,
    Hold,
    Decay,
    Sustain,
    Release,
    Loop,
    Gate,
    Vca,
    Out,
    AttackCurve,
    DecayCurve,
    ReleaseCurve,
}

impl EnvRow {
    pub const ALL: [EnvRow; 13] = [
        EnvRow::Delay, EnvRow::Attack, EnvRow::Hold, EnvRow::Decay, EnvRow::Sustain, EnvRow::Release,
        EnvRow::Loop, EnvRow::Gate, EnvRow::Vca, EnvRow::Out, EnvRow::AttackCurve, EnvRow::DecayCurve,
        EnvRow::ReleaseCurve,
    ];

    pub const fn name(self) -> &'static str {
        match self {
            EnvRow::Delay => "DELAY",
            EnvRow::Attack => "ATTACK",
            EnvRow::Hold => "HOLD",
            EnvRow::Decay => "DECAY",
            EnvRow::Sustain => "SUSTAIN",
            EnvRow::Release => "RELEASE",
            EnvRow::Loop => "LOOP",
            EnvRow::Gate => "GATE",
            EnvRow::Vca => "VCA",
            EnvRow::Out => "SEND TO",
            EnvRow::AttackCurve => "A CURVE",
            EnvRow::DecayCurve => "D CURVE",
            EnvRow::ReleaseCurve => "R CURVE",
        }
    }
}

/// A row of an LFO's tab.
#[derive(Clone, Copy, PartialEq, Eq, Debug)]
pub enum LfoRow {
    Rate,
    Shape,
    Phase,
    Level,
    Polarity,
    Sync,
    Out,
}

impl LfoRow {
    pub const ALL: [LfoRow; 7] =
        [LfoRow::Rate, LfoRow::Shape, LfoRow::Phase, LfoRow::Level, LfoRow::Polarity, LfoRow::Sync, LfoRow::Out];

    pub const fn name(self) -> &'static str {
        match self {
            LfoRow::Rate => "RATE",
            LfoRow::Shape => "SHAPE",
            LfoRow::Polarity => "POLAR",
            LfoRow::Phase => "PHASE",
            LfoRow::Level => "LEVEL",
            LfoRow::Sync => "SYNC",
            LfoRow::Out => "SEND TO",
        }
    }
}

pub const TAB_NAMES: [&str; N_ENVELOPES + N_LFOS] = ["ENV 1", "ENV 2", "LFO 1", "LFO 2", "LFO 3"];

/// The settings of a tab of the Envelopes screen.
pub const fn mod_rows(tab: usize) -> usize {
    if tab < N_ENVELOPES { EnvRow::ALL.len() } else { LfoRow::ALL.len() }
}

/// Where the encoder is on the Envelopes screen. It starts on the tabs: turning picks an envelope
/// or LFO, and a click opens it. Then turning walks its settings as on any screen; one step past
/// either end is the tab's name again, where a click goes back to picking.
#[derive(Clone, Copy, PartialEq, Eq, Debug, Default)]
pub struct ModCursor {
    pub tab: usize,
    /// The setting it is on; `mod_rows(tab)` is the tab's name. None: picking a tab.
    pub at: Option<usize>,
    pub editing: bool,
}

impl ModCursor {
    /// The setting being moved or edited, if it is on one.
    pub fn row(&self) -> Option<usize> {
        self.at.filter(|r| *r < mod_rows(self.tab))
    }

    /// Whether the tab's name is what the encoder is on.
    pub fn on_tab(&self) -> bool {
        self.row().is_none()
    }

    pub fn event(&mut self, event: Event, patch: &mut Patch) {
        match (self.at, event) {
            (_, Event::Hold) => {}
            (None, Event::Turn(n)) => {
                self.tab = (self.tab as i32 + n).rem_euclid(TAB_NAMES.len() as i32) as usize;
            }
            (None, Event::Click) => self.at = Some(0),
            (Some(r), Event::Turn(n)) if self.editing => adjust_mod(patch, self.tab, r, n),
            (Some(r), Event::Turn(n)) => {
                self.at = Some((r as i32 + n).rem_euclid(mod_rows(self.tab) as i32 + 1) as usize);
            }
            (Some(r), Event::Click) if r == mod_rows(self.tab) => self.at = None,
            (Some(_), Event::Click) => self.editing = !self.editing,
        }
    }
}

fn add(value: u8, detents: i32, max: u8) -> u8 {
    (value as i32 + detents).clamp(0, max as i32) as u8
}

fn step_mask(mask: u8, detents: i32) -> u8 {
    (mask as i32 + detents).rem_euclid(4) as u8
}

fn curve(value: i8, detents: i32) -> i8 {
    (value as i32 + detents * 5).clamp(-100, 100) as i8
}

/// What envelope `e` puts on the jacks.
const fn env_out(e: usize) -> OutSel {
    if e == 0 { OutSel::Env1 } else { OutSel::Env2 }
}

const fn lfo_out(k: usize) -> OutSel {
    match k {
        0 => OutSel::Lfo1,
        1 => OutSel::Lfo2,
        _ => OutSel::Lfo3,
    }
}

pub fn adjust_envelope(patch: &mut Patch, e: usize, row: EnvRow, detents: i32) {
    let v = &mut patch.envelopes[e];
    match row {
        EnvRow::Delay => v.delay = add(v.delay, detents, TIME_MAX),
        EnvRow::Attack => v.attack = add(v.attack, detents, TIME_MAX),
        EnvRow::Hold => v.hold = add(v.hold, detents, TIME_MAX),
        EnvRow::Decay => v.decay = add(v.decay, detents, TIME_MAX),
        EnvRow::Sustain => v.sustain = add(v.sustain, detents, 100),
        EnvRow::Release => v.release = add(v.release, detents, TIME_MAX),
        EnvRow::Loop => v.looping = v.looping.next(detents),
        EnvRow::Gate => v.gate = step_mask(v.gate, detents),
        EnvRow::Vca => v.vca = step_mask(v.vca, detents),
        EnvRow::Out => {
            let sel = env_out(e);
            let mask = step_mask(patch.mixer.jacks_of(sel), detents);
            patch.mixer.set_jacks(sel, mask);
        }
        EnvRow::AttackCurve => v.curves[0] = curve(v.curves[0], detents),
        EnvRow::DecayCurve => v.curves[1] = curve(v.curves[1], detents),
        EnvRow::ReleaseCurve => v.curves[2] = curve(v.curves[2], detents),
    }
}

pub fn adjust_lfo(patch: &mut Patch, k: usize, row: LfoRow, detents: i32) {
    let v = &mut patch.lfos[k];
    match row {
        LfoRow::Rate => v.rate = add(v.rate, detents, RATE_MAX),
        LfoRow::Shape => v.shape = v.shape.next(detents),
        LfoRow::Polarity => v.unipolar = !v.unipolar,
        LfoRow::Phase => v.phase = (v.phase as i32 + detents * 15).rem_euclid(360) as u16,
        LfoRow::Level => v.level = add(v.level, detents, 100),
        LfoRow::Sync => v.sync = step_mask(v.sync, detents),
        LfoRow::Out => {
            let sel = lfo_out(k);
            let mask = step_mask(patch.mixer.jacks_of(sel), detents);
            patch.mixer.set_jacks(sel, mask);
        }
    }
}

/// Moves a setting of the Envelopes screen.
pub fn adjust_mod(patch: &mut Patch, tab: usize, row: usize, detents: i32) {
    if tab < N_ENVELOPES {
        adjust_envelope(patch, tab, EnvRow::ALL[row], detents);
    } else {
        adjust_lfo(patch, tab - N_ENVELOPES, LfoRow::ALL[row], detents);
    }
}

fn gate_text(mask: u8, off: &'static str) -> &'static str {
    match mask & 3 {
        0 => off,
        1 => "GATE 1",
        2 => "GATE 2",
        _ => "EITHER",
    }
}

/// Where a source is going, by the numbers on the panel: `NONE`, `OUT 2`, `OUT 2+3`. `outs` has
/// bit n set if `out<n>` carries it, so this tells the truth about what the Mixer has set too.
fn outs_text(outs: u8) -> String<11> {
    let mut s = String::new();
    if outs & 15 == 0 {
        s.push_str("NONE").ok();
        return s;
    }
    s.push_str("OUT ").ok();
    let mut first = true;
    for n in 0..4 {
        if outs >> n & 1 != 0 {
            if !first {
                s.push('+').ok();
            }
            write!(s, "{}", n).ok();
            first = false;
        }
    }
    s
}

pub fn envelope_text(patch: &Patch, e: usize, row: EnvRow) -> String<11> {
    let v = &patch.envelopes[e];
    let name = |s: &str| {
        let mut out: String<11> = String::new();
        out.push_str(s).ok();
        out
    };
    match row {
        EnvRow::Delay => text::time(time_samples(v.delay, 48000), v.delay == 0),
        EnvRow::Attack => text::time(time_samples(v.attack, 48000), v.attack == 0),
        EnvRow::Hold => text::time(time_samples(v.hold, 48000), v.hold == 0),
        EnvRow::Decay => text::time(time_samples(v.decay, 48000), v.decay == 0),
        EnvRow::Release => text::time(time_samples(v.release, 48000), v.release == 0),
        EnvRow::Sustain => text::percent(v.sustain as i32),
        EnvRow::Loop => name(match v.looping {
            LoopMode::Off => "OFF",
            LoopMode::Gated => "GATED",
            LoopMode::Free => "FREE",
        }),
        EnvRow::Gate => name(gate_text(v.gate, "OFF")),
        EnvRow::Vca => name(match v.vca & 3 {
            0 => "-",
            1 => "OSC 1",
            2 => "OSC 2",
            _ => "BOTH",
        }),
        EnvRow::Out => outs_text(patch.mixer.outs_of(env_out(e))),
        EnvRow::AttackCurve => text::signed(v.curves[0] as i32),
        EnvRow::DecayCurve => text::signed(v.curves[1] as i32),
        EnvRow::ReleaseCurve => text::signed(v.curves[2] as i32),
    }
}

pub fn lfo_text(patch: &Patch, k: usize, row: LfoRow) -> String<11> {
    let v = &patch.lfos[k];
    let name = |s: &str| {
        let mut out: String<11> = String::new();
        out.push_str(s).ok();
        out
    };
    match row {
        LfoRow::Rate => text::hertz(rate_millihertz(v.rate)),
        LfoRow::Shape => name(v.shape.name()),
        LfoRow::Polarity => name(if v.unipolar { "UNI" } else { "BI" }),
        LfoRow::Phase => text::degrees(v.phase as i32),
        LfoRow::Level => text::percent(v.level as i32),
        LfoRow::Sync => name(gate_text(v.sync, "FREE")),
        LfoRow::Out => outs_text(patch.mixer.outs_of(lfo_out(k))),
    }
}

/// A column of the Routing screen.
#[derive(Clone, Copy, PartialEq, Eq, Debug)]
pub enum RouteCol {
    Source,
    Dest,
    Amount,
}

impl RouteCol {
    pub const ALL: [RouteCol; 3] = [RouteCol::Source, RouteCol::Dest, RouteCol::Amount];
}

pub const ROUTE_CELLS: usize = N_SLOTS * RouteCol::ALL.len();

/// A cell of the Routing screen: its slot and column.
pub const fn route_cell(at: usize) -> (usize, usize) {
    (at / RouteCol::ALL.len(), at % RouteCol::ALL.len())
}

pub fn adjust_route(patch: &mut Patch, at: usize, detents: i32) {
    let (slot, col) = route_cell(at);
    let s = &mut patch.slots[slot];
    match RouteCol::ALL[col] {
        RouteCol::Source => s.source = s.source.next(detents),
        RouteCol::Dest => {
            s.dest = s.dest.next(detents);
            let limit = s.dest.amount_limit();
            s.amount = s.amount.clamp(-limit, limit);
        }
        RouteCol::Amount => {
            let limit = s.dest.amount_limit() as i32;
            s.amount = (s.amount as i32 + detents).clamp(-limit, limit) as i16;
        }
    }
}

pub fn route_text(patch: &Patch, at: usize) -> String<11> {
    let (slot, col) = route_cell(at);
    let s = &patch.slots[slot];
    let mut out: String<11> = String::new();
    match RouteCol::ALL[col] {
        RouteCol::Source => {
            out.push_str(s.source.name()).ok();
        }
        // (an empty slot's other cells are still there, but say nothing)
        RouteCol::Dest if s.source == Source::None => {
            out.push_str("---").ok();
        }
        RouteCol::Dest => {
            out.push_str(s.dest.name()).ok();
        }
        RouteCol::Amount if s.source == Source::None => {
            out.push_str("---").ok();
        }
        RouteCol::Amount => out = text::signed_half_percent(s.amount as i32),
    }
    out
}

/// A setting on the Wave View screen. Most belong to the oscillator it is showing; `Traces` only
/// to the view.
#[derive(Clone, Copy, PartialEq, Eq, Debug)]
pub enum WaveRow {
    Osc,
    Table,
    Position,
    Shift,
    Edge,
    Traces,
}

impl WaveRow {
    pub const ALL: [WaveRow; 6] =
        [WaveRow::Osc, WaveRow::Table, WaveRow::Position, WaveRow::Shift, WaveRow::Edge, WaveRow::Traces];

    pub const fn name(self) -> &'static str {
        match self {
            WaveRow::Osc => "OSC",
            WaveRow::Table => "TABLE",
            WaveRow::Position => "POS",
            WaveRow::Shift => "SHIFT",
            WaveRow::Edge => "EDGE",
            WaveRow::Traces => "TRACES",
        }
    }

    /// The Oscillators screen's row for the same setting, if there is one.
    pub const fn row(self) -> Option<Row> {
        match self {
            WaveRow::Table => Some(Row::Table),
            WaveRow::Position => Some(Row::Position),
            WaveRow::Shift => Some(Row::Shift),
            WaveRow::Edge => Some(Row::Edge),
            WaveRow::Osc | WaveRow::Traces => None,
        }
    }
}

/// Moves a setting of the Wave View. `layer` is the oscillator showing, and `traces` an index into
/// `TRACE_CHOICES`; `tables` is how many are resident.
pub fn adjust_wave(patch: &mut Patch, layer: &mut usize, traces: &mut usize, row: WaveRow, detents: i32, tables: u8) {
    match row {
        WaveRow::Osc => *layer = (*layer as i32 + detents).rem_euclid(N_LAYERS as i32) as usize,
        WaveRow::Traces => *traces = (*traces as i32 + detents).clamp(0, TRACE_CHOICES.len() as i32 - 1) as usize,
        _ => {
            if let Some(r) = row.row() {
                patch::adjust(&mut patch.layers[*layer], r, detents, tables);
            }
        }
    }
}

/// A row of the Mixer screen.
#[derive(Clone, Copy, PartialEq, Eq, Debug)]
pub enum MixRow {
    Out1,
    Out2,
    EnvOut1,
    EnvOut2,
    Balance,
    Level1,
    Level2,
}

impl MixRow {
    pub const ALL: [MixRow; 7] = [
        MixRow::Out1, MixRow::Out2, MixRow::EnvOut1, MixRow::EnvOut2, MixRow::Balance, MixRow::Level1,
        MixRow::Level2,
    ];

    /// The outputs go by the numbers on the panel.
    pub const fn name(self) -> &'static str {
        match self {
            MixRow::Out1 => "OUT 0",
            MixRow::Out2 => "OUT 1",
            MixRow::EnvOut1 => "OUT 2",
            MixRow::EnvOut2 => "OUT 3",
            MixRow::Balance => "BALANCE",
            MixRow::Level1 => "LEVEL 1",
            MixRow::Level2 => "LEVEL 2",
        }
    }
}

pub fn adjust_mix(patch: &mut Patch, row: MixRow, detents: i32) {
    let outs = &mut patch.mixer.outs;
    match row {
        MixRow::Out1 => outs[0] = outs[0].next(detents),
        MixRow::Out2 => outs[1] = outs[1].next(detents),
        MixRow::EnvOut1 => outs[2] = outs[2].next(detents),
        MixRow::EnvOut2 => outs[3] = outs[3].next(detents),
        MixRow::Balance => {
            patch.mixer.balance = (patch.mixer.balance as i32 + detents * 10).clamp(0, 1000) as i16;
        }
        MixRow::Level1 => patch.layers[0].level = add(patch.layers[0].level, detents, 100),
        MixRow::Level2 => patch.layers[1].level = add(patch.layers[1].level, detents, 100),
    }
}

pub fn mix_text(patch: &Patch, row: MixRow) -> String<11> {
    let name = |s: &str| {
        let mut out: String<11> = String::new();
        out.push_str(s).ok();
        out
    };
    let outs = &patch.mixer.outs;
    match row {
        MixRow::Out1 => name(outs[0].name()),
        MixRow::Out2 => name(outs[1].name()),
        MixRow::EnvOut1 => name(outs[2].name()),
        MixRow::EnvOut2 => name(outs[3].name()),
        MixRow::Balance => text::permille(patch.mixer.balance as i32),
        MixRow::Level1 => text::percent(patch.layers[0].level as i32),
        MixRow::Level2 => text::percent(patch.layers[1].level as i32),
    }
}

/// What can be done with a patch.
#[derive(Clone, Copy, PartialEq, Eq, Debug)]
pub enum PatchAction {
    Load,
    Save,
    Erase,
    /// Back to the default patch, without touching what is saved.
    Init,
    Back,
}

impl PatchAction {
    pub const ALL: [PatchAction; 5] =
        [PatchAction::Load, PatchAction::Save, PatchAction::Erase, PatchAction::Init, PatchAction::Back];

    pub const fn name(self) -> &'static str {
        match self {
            PatchAction::Load => "LOAD",
            PatchAction::Save => "SAVE",
            PatchAction::Erase => "ERASE",
            PatchAction::Init => "INIT",
            PatchAction::Back => "BACK",
        }
    }
}

/// Where the encoder is on the Patches screen: turning picks a patch; a click offers what can be
/// done with it, turning picks from those, and a click does it.
#[derive(Clone, Copy, PartialEq, Eq, Debug, Default)]
pub struct PatchCursor {
    pub patch: usize,
    /// The action highlighted, while they are on offer.
    pub action: Option<usize>,
}

impl PatchCursor {
    /// Takes an event. `used`: whether the patch picked holds anything. Returns what to do.
    pub fn event(&mut self, event: Event, used: bool) -> Option<(PatchAction, usize)> {
        match (self.action, event) {
            (None, Event::Turn(n)) => {
                self.patch = (self.patch as i32 + n).rem_euclid(N_PATCHES as i32) as usize;
                None
            }
            (None, Event::Click) => {
                // An empty patch can't be loaded, so saving is what's likely.
                let first = if used { PatchAction::Load } else { PatchAction::Save };
                self.action = PatchAction::ALL.iter().position(|a| *a == first);
                None
            }
            (Some(a), Event::Turn(n)) => {
                let len = PatchAction::ALL.len() as i32;
                self.action = Some((a as i32 + n).rem_euclid(len) as usize);
                None
            }
            (Some(a), Event::Click) => {
                self.action = None;
                Some((PatchAction::ALL[a], self.patch))
            }
            (_, Event::Hold) => None,
        }
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    fn patch() -> Patch {
        Patch::default()
    }

    #[test]
    fn the_envelopes_screen_starts_on_the_tabs_and_turning_only_picks_a_tab() {
        let mut p = patch();
        let mut c = ModCursor::default();
        assert_eq!((c.tab, c.at), (0, None));
        c.event(Event::Turn(3), &mut p);
        assert_eq!(c.tab, 3);
        c.event(Event::Turn(3), &mut p);
        assert_eq!(c.tab, 1, "and it wraps");
        c.event(Event::Turn(-2), &mut p);
        assert_eq!(c.tab, 4);
        assert!(c.on_tab());
        assert_eq!(p, patch(), "nothing is edited");
    }

    #[test]
    fn a_click_opens_the_tab_and_turning_stays_inside_it() {
        let mut p = patch();
        let mut c = ModCursor { tab: 2, at: None, editing: false };
        c.event(Event::Click, &mut p);
        assert_eq!(c.row(), Some(0));
        // All the way round its settings: the tab never changes.
        for _ in 0..(LfoRow::ALL.len() + 1) * 2 {
            c.event(Event::Turn(1), &mut p);
            assert_eq!(c.tab, 2);
        }
        assert_eq!(c.row(), Some(0));
        c.event(Event::Turn(-1), &mut p);
        assert!(c.on_tab(), "one step back from the first is the tab's name");
    }

    #[test]
    fn a_click_on_the_tabs_name_goes_back_to_picking() {
        let mut p = patch();
        let mut c = ModCursor { tab: 0, at: None, editing: false };
        c.event(Event::Click, &mut p);
        c.event(Event::Turn(EnvRow::ALL.len() as i32), &mut p);
        assert!(c.on_tab() && c.at.is_some());
        c.event(Event::Click, &mut p);
        assert_eq!(c.at, None);
        c.event(Event::Turn(1), &mut p);
        assert_eq!(c.tab, 1);
    }

    #[test]
    fn a_click_on_a_setting_edits_it_and_that_tab_alone() {
        let mut p = patch();
        let mut c = ModCursor { tab: 1, at: None, editing: false };
        c.event(Event::Click, &mut p);
        c.event(Event::Turn(1), &mut p);
        assert_eq!(c.row(), Some(1));
        c.event(Event::Click, &mut p);
        assert!(c.editing);
        c.event(Event::Turn(4), &mut p);
        assert_eq!(c.row(), Some(1), "turning edits now: it doesn't move");
        assert_eq!(p.envelopes[1].attack, patch().envelopes[1].attack + 4);
        assert_eq!(p.envelopes[0], patch().envelopes[0]);
        c.event(Event::Click, &mut p);
        assert!(!c.editing);
        c.event(Event::Turn(1), &mut p);
        assert_eq!(c.row(), Some(2));
    }

    #[test]
    fn the_tabs_have_their_own_settings() {
        assert_eq!(mod_rows(0), EnvRow::ALL.len());
        assert_eq!(mod_rows(1), EnvRow::ALL.len());
        assert_eq!(mod_rows(2), LfoRow::ALL.len());
        assert_eq!(mod_rows(4), LfoRow::ALL.len());
    }

    #[test]
    fn the_cursor_wraps_both_ways_and_a_click_toggles() {
        let mut c = Cursor::default();
        c.turn(-1, ROUTE_CELLS);
        assert_eq!(c.at, ROUTE_CELLS - 1);
        c.turn(1, ROUTE_CELLS);
        assert_eq!(c.at, 0);
        c.click();
        assert!(c.editing);
        c.click();
        assert!(!c.editing);
    }

    #[test]
    fn every_cell_on_every_screen_moves_something_and_has_short_text() {
        for tab in 0..TAB_NAMES.len() {
            for row in 0..mod_rows(tab) {
                let mut p = patch();
                let before = p;
                adjust_mod(&mut p, tab, row, 1);
                if p == before {
                    adjust_mod(&mut p, tab, row, -1);
                }
                assert_ne!(p, before, "{tab} {row} didn't move");
                let t = if tab < 2 {
                    envelope_text(&p, tab, EnvRow::ALL[row])
                } else {
                    lfo_text(&p, tab - 2, LfoRow::ALL[row])
                };
                assert!(!t.is_empty() && t.len() <= 9, "{tab} {row}: {t}");
            }
        }
        for at in 0..ROUTE_CELLS {
            let mut p = patch();
            let before = p;
            adjust_route(&mut p, at, 1);
            assert_ne!(p, before, "route {at} didn't move");
            let t = route_text(&p, at);
            assert!(!t.is_empty() && t.len() <= 9, "{at}: {t}");
        }
        for row in MixRow::ALL {
            let mut p = patch();
            let before = p;
            adjust_mix(&mut p, row, -1);
            assert_ne!(p, before, "{row:?} didn't move");
            let t = mix_text(&p, row);
            assert!(!t.is_empty() && t.len() <= 9, "{row:?}: {t}");
        }
    }

    #[test]
    fn values_stop_at_their_limits() {
        let mut p = patch();
        adjust_envelope(&mut p, 0, EnvRow::Attack, 1000);
        assert_eq!(p.envelopes[0].attack, TIME_MAX);
        adjust_envelope(&mut p, 0, EnvRow::Attack, -1000);
        assert_eq!(p.envelopes[0].attack, 0);
        adjust_envelope(&mut p, 0, EnvRow::Sustain, 1000);
        assert_eq!(p.envelopes[0].sustain, 100);
        adjust_envelope(&mut p, 0, EnvRow::DecayCurve, 1000);
        assert_eq!(p.envelopes[0].curves[1], 100);
        adjust_envelope(&mut p, 0, EnvRow::DecayCurve, -1000);
        assert_eq!(p.envelopes[0].curves[1], -100);
        adjust_lfo(&mut p, 0, LfoRow::Rate, 1000);
        assert_eq!(p.lfos[0].rate, RATE_MAX);
        adjust_lfo(&mut p, 0, LfoRow::Phase, 25);
        assert_eq!(p.lfos[0].phase, 15, "phase wraps");
    }

    #[test]
    fn looping_steps_through_its_modes_and_reads_them() {
        let mut p = patch();
        assert_eq!(envelope_text(&p, 0, EnvRow::Loop).as_str(), "OFF");
        adjust_envelope(&mut p, 0, EnvRow::Loop, 1);
        assert_eq!(envelope_text(&p, 0, EnvRow::Loop).as_str(), "GATED");
        adjust_envelope(&mut p, 0, EnvRow::Loop, 1);
        assert_eq!(envelope_text(&p, 0, EnvRow::Loop).as_str(), "FREE");
    }

    #[test]
    fn the_gate_and_vca_choices_read_their_masks() {
        let mut p = patch();
        assert_eq!(envelope_text(&p, 0, EnvRow::Gate).as_str(), "GATE 1");
        assert_eq!(envelope_text(&p, 1, EnvRow::Gate).as_str(), "GATE 2");
        adjust_envelope(&mut p, 0, EnvRow::Gate, 2);
        assert_eq!(envelope_text(&p, 0, EnvRow::Gate).as_str(), "EITHER");
        assert_eq!(envelope_text(&p, 0, EnvRow::Vca).as_str(), "-", "open by default");
        adjust_envelope(&mut p, 0, EnvRow::Vca, 3);
        assert_eq!(envelope_text(&p, 0, EnvRow::Vca).as_str(), "BOTH");
        assert_eq!(p.envelopes[0].vca, 3);
    }

    #[test]
    fn an_envelopes_out_row_moves_its_jacks_and_shows_them() {
        let mut p = patch();
        assert_eq!(envelope_text(&p, 0, EnvRow::Out).as_str(), "OUT 2", "by the number on the panel");
        adjust_envelope(&mut p, 0, EnvRow::Out, 2);
        assert_eq!(envelope_text(&p, 0, EnvRow::Out).as_str(), "OUT 2+3");
        assert_eq!(envelope_text(&p, 1, EnvRow::Out).as_str(), "NONE", "it took envelope 2's jack");
        assert_eq!(mix_text(&p, MixRow::EnvOut2).as_str(), "ENV 1", "the Mixer screen agrees");
    }

    #[test]
    fn an_lfo_can_go_to_a_jack() {
        let mut p = patch();
        assert_eq!(lfo_text(&p, 2, LfoRow::Out).as_str(), "NONE");
        adjust_lfo(&mut p, 2, LfoRow::Out, 2);
        assert_eq!(lfo_text(&p, 2, LfoRow::Out).as_str(), "OUT 3");
        assert_eq!(p.mixer.outs[3], OutSel::Lfo3);
        assert_eq!(p.mixer.outs[2], OutSel::Env1, "the other jack keeps its envelope");
    }

    #[test]
    fn a_source_on_an_output_the_mixer_chose_says_so() {
        let mut p = patch();
        adjust_mix(&mut p, MixRow::Out1, 2); // OUT 0, from OSC 1 on to ENV 1
        assert_eq!(p.mixer.outs[0], OutSel::Env1);
        assert_eq!(envelope_text(&p, 0, EnvRow::Out).as_str(), "OUT 0+2");
        // Its own row only moves the envelope jacks, and leaves that alone.
        adjust_envelope(&mut p, 0, EnvRow::Out, 1);
        assert_eq!(p.mixer.outs[0], OutSel::Env1);
        assert_eq!(envelope_text(&p, 0, EnvRow::Out).as_str(), "OUT 0+3");
    }

    #[test]
    fn the_send_to_text_fits_at_its_longest() {
        let mut p = patch();
        p.mixer.outs = [OutSel::Lfo1; 4];
        let t = lfo_text(&p, 0, LfoRow::Out);
        assert_eq!(t.as_str(), "OUT 0+1+2+3");
    }

    #[test]
    fn amounts_move_in_half_percents_and_stop_at_their_limits() {
        let mut p = patch();
        let amount = 4 * 3 + 2; // the fifth slot's amount
        p.slots[4].source = Source::Lfo1;
        p.slots[4].dest = Dest::Position1;
        adjust_route(&mut p, amount, 1);
        assert_eq!(route_text(&p, amount).as_str(), "+0.5%");
        adjust_route(&mut p, amount, 199);
        assert_eq!(route_text(&p, amount).as_str(), "+100.0%");
        adjust_route(&mut p, amount, -300);
        assert_eq!(route_text(&p, amount).as_str(), "-50.0%");
        adjust_route(&mut p, amount, 10_000);
        assert_eq!(p.slots[4].amount, 800);
        p.slots[4].dest = Dest::Pitch2;
        p.slots[4].amount = 0;
        adjust_route(&mut p, amount, -10_000);
        assert_eq!(p.slots[4].amount, -390);
    }

    #[test]
    fn changing_a_slot_to_pitch_keeps_its_amount_in_range() {
        let mut p = patch();
        let at = 4 * 3; // the fifth slot's source
        p.slots[4].dest = Dest::Balance;
        p.slots[4].amount = 800;
        adjust_route(&mut p, at + 1, 1);
        assert_eq!(p.slots[4].dest, Dest::Pitch1);
        assert_eq!(p.slots[4].amount, 390);
    }

    #[test]
    fn the_wave_view_edits_the_oscillator_it_shows() {
        let mut p = patch();
        let (mut layer, mut traces) = (0, 2);
        adjust_wave(&mut p, &mut layer, &mut traces, WaveRow::Osc, 1, 2);
        assert_eq!(layer, 1);
        adjust_wave(&mut p, &mut layer, &mut traces, WaveRow::Position, 5, 2);
        adjust_wave(&mut p, &mut layer, &mut traces, WaveRow::Shift, -4, 2);
        adjust_wave(&mut p, &mut layer, &mut traces, WaveRow::Edge, 1, 2);
        adjust_wave(&mut p, &mut layer, &mut traces, WaveRow::Table, 1, 2);
        assert_eq!(p.layers[1].position, 550);
        assert_eq!(p.layers[1].shift, -100);
        assert_eq!(p.layers[1].edge, crate::patch::Edge::Wrap);
        assert_eq!(p.layers[1].table, 0);
        assert_eq!(p.layers[0], patch().layers[0], "the other is left alone");
        adjust_wave(&mut p, &mut layer, &mut traces, WaveRow::Osc, 1, 2);
        assert_eq!(layer, 0, "and it wraps");
    }

    #[test]
    fn the_trace_choice_stops_at_its_ends_and_isnt_part_of_the_patch() {
        let mut p = patch();
        let (mut layer, mut traces) = (0, 2);
        adjust_wave(&mut p, &mut layer, &mut traces, WaveRow::Traces, 10, 2);
        assert_eq!(TRACE_CHOICES[traces], 64);
        adjust_wave(&mut p, &mut layer, &mut traces, WaveRow::Traces, -10, 2);
        assert_eq!(TRACE_CHOICES[traces], 8);
        assert_eq!(p, patch());
    }

    #[test]
    fn an_empty_slot_says_so() {
        let p = patch();
        assert_eq!(route_text(&p, 4 * 3).as_str(), "---");
        assert_eq!(route_text(&p, 4 * 3 + 1).as_str(), "---");
        assert_eq!(route_text(&p, 4 * 3 + 2).as_str(), "---");
        assert_eq!(route_text(&p, 0).as_str(), "CV 1");
        assert_eq!(route_text(&p, 1).as_str(), "PITCH 1");
        assert_eq!(route_text(&p, 2).as_str(), "+100.0%");
    }

    #[test]
    fn outputs_go_by_the_numbers_on_the_panel() {
        assert_eq!(MixRow::ALL[0].name(), "OUT 0");
        assert_eq!(MixRow::ALL[3].name(), "OUT 3");
    }

    #[test]
    fn a_click_offers_actions_and_another_does_the_one_picked() {
        let mut c = PatchCursor::default();
        assert_eq!(c.event(Event::Turn(3), true), None);
        assert_eq!(c.patch, 3);
        assert_eq!(c.event(Event::Click, true), None);
        assert_eq!(c.action, Some(0), "a used patch offers LOAD first");
        assert_eq!(c.event(Event::Turn(1), true), None);
        assert_eq!(c.patch, 3, "turning now picks an action");
        assert_eq!(c.event(Event::Click, true), Some((PatchAction::Save, 3)));
        assert_eq!(c.action, None, "and back to picking patches");
    }

    #[test]
    fn an_empty_patch_offers_save_first() {
        let mut c = PatchCursor::default();
        c.event(Event::Click, false);
        assert_eq!(c.action, Some(1));
    }

    #[test]
    fn patches_and_actions_wrap() {
        let mut c = PatchCursor::default();
        c.event(Event::Turn(-1), true);
        assert_eq!(c.patch, N_PATCHES - 1);
        c.event(Event::Click, true);
        c.event(Event::Turn(-1), true);
        assert_eq!(c.action, Some(PatchAction::ALL.len() - 1));
    }

    #[test]
    fn the_mixer_screen_shares_the_layers_levels() {
        let mut p = patch();
        adjust_mix(&mut p, MixRow::Level1, -25);
        assert_eq!(p.layers[0].level, 75);
        assert_eq!(mix_text(&p, MixRow::Level1).as_str(), "75%");
        adjust_mix(&mut p, MixRow::Balance, 1000);
        assert_eq!(p.mixer.balance, 1000);
        adjust_mix(&mut p, MixRow::Balance, -1000);
        assert_eq!(p.mixer.balance, 0);
    }
}
