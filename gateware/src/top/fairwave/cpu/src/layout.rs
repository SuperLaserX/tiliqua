//! Where everything goes on each screen. The tests check that it is all on the glass and nothing
//! collides, which is the kind of thing a round screen gets wrong silently.
//!
//! Each screen has its own round layout, drawn with the same few parts: text, arcs and lines.
//!
//! - Oscillators: mirrored about a centre column of names, an arc gauge for position, tilt and
//!   level hugging the rim on each side.
//! - Envelopes: the shape in a dome at the top, tabs on an arc above it, the segments' times on an
//!   arc underneath, left to right as they happen.
//! - Routing: a patch bay, sources on the left arc and destinations on the right, a line for each
//!   slot across the middle, and the slot being edited underneath.
//! - Mixer: a crossfader arc at the top with a layer's level at each end, the outputs on an arc
//!   at the bottom.
//! - Wave view: the table as a rhombus across the middle (`crate::wave`), its settings above and
//!   below it, where the circle leaves room.
//! - Browser: the files in a column with the highlighted one in the middle, a gauge at the rim
//!   for how far through them; a preview is the wave view again with its own settings.
//! - Patches: a ring of the eight, with what to do in the middle.

use crate::geometry::*;
use crate::modulation::N_SLOTS;
use crate::nav::Page;
use crate::browser::PreviewRow;
use crate::pages::{EnvRow, LfoRow, MixRow, PatchAction, WaveRow, TAB_NAMES};
use crate::patch::Row;
use crate::store::N_PATCHES;

/// The rim ring, and the arc on it that marks the screen showing.
pub const RIM_RADIUS: i32 = 346;
/// Line segments in a full circle: under a pixel of sag at the rim.
pub const RIM_SEGMENTS: usize = 180;

/// How a line of text sits on its position.
#[derive(Clone, Copy, PartialEq, Eq, Debug)]
pub enum Align {
    Left,
    Centre,
    Right,
}

/// A line of text's position: vertically centred on `y`.
#[derive(Clone, Copy, PartialEq, Eq, Debug)]
pub struct Spot {
    pub x: i32,
    pub y: i32,
    pub align: Align,
}

impl Spot {
    pub const fn left(x: i32, y: i32) -> Spot {
        Spot { x, y, align: Align::Left }
    }

    pub const fn centre(x: i32, y: i32) -> Spot {
        Spot { x, y, align: Align::Centre }
    }

    pub const fn right(x: i32, y: i32) -> Spot {
        Spot { x, y, align: Align::Right }
    }

    pub const fn at_y(self, y: i32) -> Spot {
        Spot { x: self.x, y, align: self.align }
    }

    /// The box of `chars` characters of `font` here.
    pub const fn rect(&self, font: Font, chars: usize) -> Rect {
        let w = font.w * chars as i32;
        let x = match self.align {
            Align::Left => self.x,
            Align::Centre => self.x - w / 2,
            Align::Right => self.x - w,
        };
        Rect { x, y: self.y - font.h / 2, w, h: font.h }
    }
}

/// A setting's name and value.
#[derive(Clone, Copy, PartialEq, Eq, Debug)]
pub struct Cell {
    pub name: Spot,
    pub value: Spot,
    /// Whether the value is in the big font.
    pub big: bool,
}

impl Cell {
    pub const fn value_font(&self) -> Font {
        if self.big { BIG } else { TEXT }
    }
}

/// A named setting with its value under it, centred on a point of an arc.
fn on_arc(radius: f32, turns: f32) -> Cell {
    let (x, y) = polar(radius, turns);
    Cell { name: Spot::centre(x, y - 14), value: Spot::centre(x, y + 5), big: true }
}

/// An arc gauge: a line round the screen.
#[derive(Clone, Copy, PartialEq, Debug)]
pub struct Arc {
    pub radius: i32,
    /// Radii drawn, inward from `radius`.
    pub thick: i32,
    /// Where it starts and ends, in turns clockwise from 12 o'clock. Its value runs this way.
    pub from: f32,
    pub to: f32,
    pub segments: usize,
}

impl Arc {
    pub fn point(&self, radius: i32, segment: usize) -> (i32, i32) {
        polar(radius as f32, self.from + (self.to - self.from) * segment as f32 / self.segments as f32)
    }

    /// A walk along it, a segment at a step.
    pub fn walk(&self) -> Walk {
        Walk::new(self.from, (self.to - self.from) / self.segments as f32)
    }

    /// The segment a value out of `full` reaches.
    pub const fn segment(&self, value: i32, full: i32) -> usize {
        let v = if value < 0 { 0 } else if value > full { full } else { value };
        (v as i64 * self.segments as i64 / full as i64) as usize
    }
}

// ---- Oscillators ----

pub const OSC_BRAND_Y: i32 = -294;
pub const OSC_TITLE_Y: i32 = -262;
pub const OSC_HEADER_Y: i32 = -212;
pub const OSC_TOP: i32 = -170;
pub const OSC_PITCH: i32 = 42;
/// Values stand this far either side of the centre line.
pub const OSC_VALUE_X: i32 = 52;
pub const OSC_VALUE_CHARS: usize = 11;
pub const OSC_STATUS_Y: i32 = 138;
pub const OSC_HINT_Y: i32 = 160;

pub const fn osc_y(row: usize) -> i32 {
    OSC_TOP + OSC_PITCH * row as i32
}

pub const fn osc_name(row: usize) -> Spot {
    Spot::centre(0, osc_y(row))
}

pub const fn osc_value(row: usize, layer: usize) -> Spot {
    if layer == 0 {
        Spot::right(-OSC_VALUE_X, osc_y(row))
    } else {
        Spot::left(OSC_VALUE_X, osc_y(row))
    }
}

pub const fn osc_header(layer: usize) -> Spot {
    osc_value(0, layer).at_y(OSC_HEADER_Y)
}

/// The gauges on the Oscillators screen, three a side: position, tilt and level. They read
/// upwards on both sides, so they mirror each other.
pub const OSC_GAUGES: usize = 3;
const GAUGE_ROWS: [Row; OSC_GAUGES] = [Row::Position, Row::Shift, Row::Level];

pub const fn osc_gauge_row(gauge: usize) -> Row {
    GAUGE_ROWS[gauge]
}

pub const fn osc_gauge(gauge: usize, layer: usize) -> Arc {
    let radius = 334 - 12 * gauge as i32;
    if layer == 0 {
        Arc { radius, thick: 2, from: 0.60, to: 0.90, segments: 48 }
    } else {
        Arc { radius, thick: 2, from: 0.40, to: 0.10, segments: 48 }
    }
}

// ---- Envelopes ----

/// The tabs: on an arc above the shape.
pub const TAB_ARC_RADIUS: f32 = 318.0;
pub const TAB_ARC_STEP: f32 = 0.042;

pub fn mod_tab(tab: usize) -> Spot {
    let (x, y) = polar(TAB_ARC_RADIUS, (tab as f32 - (TAB_NAMES.len() - 1) as f32 / 2.0) * TAB_ARC_STEP);
    Spot::centre(x, y)
}

/// The shape: the dome.
pub const CURVE_X: i32 = -180;
pub const CURVE_Y: i32 = -262;
pub const CURVE_W: i32 = 360;
pub const CURVE_H: i32 = 140;
/// The floor under it, and the playhead under that.
pub const CURVE_FLOOR_Y: i32 = CURVE_Y + CURVE_H + 3;
pub const PLAYHEAD_Y: i32 = CURVE_FLOOR_Y + 3;
pub const PLAYHEAD_H: i32 = 7;

/// The live level: a thick arc beside the shape, at the rim. 5 V reaches its top; a bipolar one
/// (an LFO) swings about its middle.
pub const LIVE_ARC: Arc = Arc { radius: 336, thick: 4, from: 0.235, to: 0.075, segments: 40 };

const ENV_ARC_RADIUS: f32 = 262.0;
const ENV_ROW_Y: i32 = -86;
const MOD_ROW_PITCH: i32 = 28;
const ENV_NAME_X: [i32; 2] = [-194, 26];
const ENV_VALUE_X: [i32; 2] = [-126, 98];

/// Characters a cell's value can reach.
pub const MOD_VALUE_CHARS: usize = 11;
pub const RING_VALUE_CHARS: usize = 8;

/// A row of an envelope's tab: the six stages on the arc underneath, left to right as they
/// happen, and the rest in two columns in the middle.
pub fn env_cell(row: EnvRow) -> Cell {
    let plain = |col: usize, r: i32| Cell {
        name: Spot::left(ENV_NAME_X[col], ENV_ROW_Y + r * MOD_ROW_PITCH),
        value: Spot::left(ENV_VALUE_X[col], ENV_ROW_Y + r * MOD_ROW_PITCH),
        big: false,
    };
    let ring = |k: usize| on_arc(ENV_ARC_RADIUS, 0.70 - 0.08 * k as f32);
    match row {
        EnvRow::Delay => ring(0),
        EnvRow::Attack => ring(1),
        EnvRow::Hold => ring(2),
        EnvRow::Decay => ring(3),
        EnvRow::Sustain => ring(4),
        EnvRow::Release => ring(5),
        EnvRow::Loop => plain(0, 0),
        EnvRow::Gate => plain(0, 1),
        EnvRow::Vca => plain(0, 2),
        EnvRow::Out => plain(0, 3),
        EnvRow::AttackCurve => plain(1, 0),
        EnvRow::DecayCurve => plain(1, 1),
        EnvRow::ReleaseCurve => plain(1, 2),
    }
}

/// A row of an LFO's tab: its four main settings on the arc, the rest in the middle.
pub fn lfo_cell(row: LfoRow) -> Cell {
    let plain = |r: i32| Cell {
        name: Spot::left(ENV_NAME_X[0] + 90, ENV_ROW_Y + 14 + r * MOD_ROW_PITCH),
        value: Spot::left(ENV_VALUE_X[0] + 90, ENV_ROW_Y + 14 + r * MOD_ROW_PITCH),
        big: false,
    };
    let ring = |k: usize| on_arc(ENV_ARC_RADIUS, 0.66 - 0.107 * k as f32);
    match row {
        LfoRow::Rate => ring(0),
        LfoRow::Shape => ring(1),
        LfoRow::Phase => ring(2),
        LfoRow::Level => ring(3),
        LfoRow::Polarity => plain(0),
        LfoRow::Sync => plain(1),
        LfoRow::Out => plain(2),
    }
}

pub const MOD_STATUS_Y: i32 = 88;
pub const MOD_HINT_Y: i32 = 110;

// ---- Routing ----

pub const ROUTE_TITLE_Y: i32 = -296;
pub const BAY_RADIUS: i32 = 232;
/// Sources on the left, destinations on the right: their nodes, on a circle.
pub const N_BAY_SOURCES: usize = 7;
pub const N_BAY_DESTS: usize = 9;
const BAY_SOURCE_TOP: i32 = -190;
const BAY_SOURCE_PITCH: i32 = 52;
const BAY_DEST_TOP: i32 = -196;
const BAY_DEST_PITCH: i32 = 40;
const BAY_LABEL_GAP: i32 = 9;

/// The bay's half width at `y`, by Newton's square root, in integers.
const fn on_bay(y: i32) -> i32 {
    let target = BAY_RADIUS * BAY_RADIUS - y * y;
    let mut x = BAY_RADIUS;
    let mut i = 0;
    while i < 6 {
        x = (x + target / x) / 2;
        i += 1;
    }
    x
}

/// A source's node (index 0 is CV 1: `Source::None` has no node).
pub const fn bay_source(i: usize) -> (i32, i32) {
    let y = BAY_SOURCE_TOP + BAY_SOURCE_PITCH * i as i32;
    (-on_bay(y), y)
}

pub const fn bay_dest(i: usize) -> (i32, i32) {
    let y = BAY_DEST_TOP + BAY_DEST_PITCH * i as i32;
    (on_bay(y), y)
}

pub const fn bay_source_label(i: usize) -> Spot {
    let (x, y) = bay_source(i);
    Spot::right(x - BAY_LABEL_GAP, y)
}

pub const fn bay_dest_label(i: usize) -> Spot {
    let (x, y) = bay_dest(i);
    Spot::left(x + BAY_LABEL_GAP, y)
}

/// Under the bay: a number for each slot, and the one being edited.
pub const ROUTE_STRIP_Y: i32 = 158;
const ROUTE_STRIP_PITCH: i32 = 24;

pub const fn route_strip(slot: usize) -> Spot {
    Spot::centre(ROUTE_STRIP_PITCH * slot as i32 - ROUTE_STRIP_PITCH * (N_SLOTS as i32 - 1) / 2, ROUTE_STRIP_Y)
}

pub const ROUTE_FIELD_NAME_Y: i32 = 186;
pub const ROUTE_FIELD_Y: i32 = 206;
pub const ROUTE_FIELD_X: [i32; 3] = [-122, 0, 122];
pub const ROUTE_ARROW_X: i32 = -72;
pub const ROUTE_STATUS_Y: i32 = 240;
pub const ROUTE_HINT_Y: i32 = 262;

// ---- Mixer ----

pub const MIX_TITLE_Y: i32 = -296;
/// The crossfader: from all layer 1, over the top, to all layer 2.
pub const FADER: Arc = Arc { radius: 214, thick: 3, from: -0.16, to: 0.16, segments: 50 };

/// A layer's level, hugging the rim on its side, reading upwards.
pub const fn mix_level_gauge(layer: usize) -> Arc {
    if layer == 0 {
        Arc { radius: 322, thick: 3, from: 0.62, to: 0.88, segments: 40 }
    } else {
        Arc { radius: 322, thick: 3, from: 0.38, to: 0.12, segments: 40 }
    }
}

/// The layers' names, at the crossfader's ends.
pub const MIX_END_X: i32 = 180;
pub const MIX_END_Y: i32 = -92;

pub fn mix_cell(row: MixRow) -> Cell {
    let ring = |k: usize| on_arc(258.0, 0.64 - 0.0933 * k as f32);
    match row {
        MixRow::Out1 => ring(0),
        MixRow::Out2 => ring(1),
        MixRow::EnvOut1 => ring(2),
        MixRow::EnvOut2 => ring(3),
        MixRow::Balance => Cell { name: Spot::centre(0, -168), value: Spot::centre(0, -146), big: true },
        MixRow::Level1 => Cell { name: Spot::centre(-MIX_END_X, -64), value: Spot::centre(-MIX_END_X, -44), big: true },
        MixRow::Level2 => Cell { name: Spot::centre(MIX_END_X, -64), value: Spot::centre(MIX_END_X, -44), big: true },
    }
}

pub const MIX_STATUS_Y: i32 = 46;
pub const MIX_HINT_Y: i32 = 68;

// ---- Patches ----

pub const WAVE_TITLE_Y: i32 = -316;
/// The table's shape.
pub const WAVE_INFO: Spot = Spot::centre(40, -226);
pub const WAVE_STATUS_Y: i32 = 288;
pub const WAVE_HINT_Y: i32 = 306;

pub fn wave_cell(row: WaveRow) -> Cell {
    let above = |x: i32| Cell { name: Spot::centre(x, -272), value: Spot::centre(x, -252), big: true };
    let ring = |k: usize| on_arc(252.0, 0.62 - 0.08 * k as f32);
    match row {
        WaveRow::Osc => above(-110),
        WaveRow::Table => above(40),
        WaveRow::Position => ring(0),
        WaveRow::Shift => ring(1),
        WaveRow::Edge => ring(2),
        WaveRow::Traces => ring(3),
    }
}

pub const BROWSE_TITLE_Y: i32 = -316;
pub const BROWSE_PATH_Y: i32 = -282;
pub const BROWSE_ROWS: usize = 9;
/// Characters in a row: a name, and a folder's slash.
pub const BROWSE_ROW_CHARS: usize = 28;
pub const BROWSE_DETAIL_Y: i32 = 118;
pub const BROWSE_NOTE_Y: i32 = 146;
pub const BROWSE_ARC: Arc = Arc { radius: 322, thick: 3, from: 0.18, to: 0.32, segments: 28 };

pub const fn browse_row(i: usize) -> Spot {
    Spot::left(-140, -182 + 30 * i as i32)
}

/// A preview: the wave view, its settings under the table.
pub fn preview_cell(row: PreviewRow) -> Cell {
    let above = |x: i32| Cell { name: Spot::centre(x, -272), value: Spot::centre(x, -252), big: true };
    let ring = |k: usize| on_arc(252.0, 0.58 - 0.08 * k as f32);
    match row {
        PreviewRow::Osc => above(-110),
        PreviewRow::Frame => ring(0),
        PreviewRow::Keep => ring(1),
        PreviewRow::Back => ring(2),
    }
}

/// The name of the table in a preview, where the wave view has its `TABLE`.
pub fn preview_name() -> Cell {
    wave_cell(WaveRow::Table)
}

pub const PATCH_RING_RADIUS: f32 = 288.0;
pub const PATCH_TITLE_Y: i32 = -214;
pub const PATCH_NAME_Y: i32 = -120;
pub const PATCH_STATE_Y: i32 = -92;
pub const PATCH_ACTION_Y: i32 = -28;
pub const PATCH_ACTION_PITCH: i32 = 76;
pub const PATCH_NOTE_Y: i32 = 34;
pub const PATCH_STATUS_Y: i32 = 110;
pub const PATCH_HINT_Y: i32 = 132;

pub fn patch_ring(i: usize) -> Spot {
    let (x, y) = polar(PATCH_RING_RADIUS, i as f32 / N_PATCHES as f32);
    Spot::centre(x, y)
}

pub const fn patch_action(i: usize) -> Spot {
    Spot::centre(PATCH_ACTION_PITCH * i as i32 - PATCH_ACTION_PITCH * (PatchAction::ALL.len() as i32 - 1) / 2,
                 PATCH_ACTION_Y)
}

// ---- The screens still to come: their name, and the inputs ----

pub const TITLE_Y: i32 = -214;
pub const PAGE_Y: i32 = -178;
pub const NOTE_Y: i32 = -148;

/// The meters: one row per input (label, bar, value).
pub const METER_ROWS: usize = 4;
pub const METER_TOP: i32 = -96;
pub const METER_PITCH: i32 = 38;
pub const METER_LABEL_X: i32 = -214;
/// The bar's half length, for full scale either way from its centre (x = 0).
pub const METER_HALF: i32 = 150;
pub const METER_THICK: i32 = 8;
pub const METER_VALUE_X: i32 = 166;
/// Volts at full scale.
pub const METER_VOLTS: i32 = 8;

pub const STATUS_Y: i32 = 126;

/// The switcher's ring of screen names.
pub const TAB_RADIUS: f32 = 262.0;

pub const fn meter_y(row: usize) -> i32 {
    METER_TOP + METER_PITCH * row as i32
}

/// Bar pixels from the centre for a reading, clamped to full scale.
pub fn meter_len(mv: i32) -> i32 {
    let full = METER_VOLTS * 1000;
    mv.clamp(-full, full) * METER_HALF / full
}

/// The name of screen `page` in the switcher.
pub fn tab(page: Page) -> Rect {
    let turns = page.index() as f32 / Page::ALL.len() as f32;
    let (x, y) = polar(TAB_RADIUS, turns);
    Rect::text(BIG, page.name().len(), x, y)
}

/// The hub's own line in the switcher: a centred title under the ring.
pub fn hub_title(chars: usize) -> Rect {
    Rect::text(BIG, chars, 0, 0)
}

#[cfg(test)]
mod tests {
    use std::vec::Vec;

    use super::*;
    use crate::modulation::N_ENVELOPES;

    fn safe() -> i32 {
        RADIUS - MARGIN
    }

    /// Everything fits the glass, and nothing touches anything else.
    fn check(rects: &[Rect]) {
        for (i, a) in rects.iter().enumerate() {
            assert!(a.fits(safe()), "off the glass: {a:?}");
            for b in rects.iter().skip(i + 1) {
                assert!(!a.overlaps(b), "{a:?} touches {b:?}");
            }
        }
    }

    fn arc_points(arc: &Arc) -> Vec<(i32, i32)> {
        (0..=arc.segments)
            .flat_map(|s| [arc.point(arc.radius, s), arc.point(arc.radius - arc.thick + 1, s)])
            .collect()
    }

    fn clear_of_arc(arc: &Arc, rects: &[Rect]) {
        for (x, y) in arc_points(arc) {
            let p = Rect { x, y, w: 1, h: 1 };
            for r in rects {
                assert!(!r.overlaps(&p), "{p:?} of {arc:?} on {r:?}");
            }
        }
    }

    fn arc_on_glass(arc: &Arc) {
        for (x, y) in arc_points(arc) {
            assert!(x * x + y * y < (RIM_RADIUS - 3) * (RIM_RADIUS - 3), "{arc:?} reaches the rim at {x},{y}");
        }
    }

    #[test]
    fn the_rim_is_on_the_glass() {
        assert!(RIM_RADIUS + 2 <= RADIUS);
    }

    #[test]
    fn a_rim_segment_sags_under_a_pixel() {
        let half = core::f64::consts::PI / RIM_SEGMENTS as f64;
        let sag = RIM_RADIUS as f64 * (1.0 - half.cos());
        assert!(sag < 1.0, "sag {sag}");
    }

    #[test]
    fn every_tab_of_the_switcher_fits_and_clears_its_neighbours_and_the_hub() {
        let hub = hub_title("OSCILLATORS".len());
        for (i, a) in Page::ALL.iter().enumerate() {
            let ra = tab(*a);
            assert!(ra.fits(safe()), "{:?} off the glass: {:?}", a, ra);
            assert!(!ra.overlaps(&hub), "{:?} on the hub: {:?}", a, ra);
            for b in Page::ALL.iter().skip(i + 1) {
                assert!(!ra.overlaps(&tab(*b)), "{:?} touches {:?}", a, b);
            }
        }
    }

    #[test]
    fn the_oscillators_screen_fits() {
        let mut rects = Vec::new();
        rects.push(Spot::centre(0, OSC_BRAND_Y).rect(BIG, 8));
        rects.push(Spot::centre(0, OSC_TITLE_Y).rect(BIG, 11));
        for layer in 0..2 {
            rects.push(osc_header(layer).rect(TEXT, 7));
        }
        for row in 0..Row::ALL.len() {
            rects.push(osc_name(row).rect(TEXT, 5));
            for layer in 0..2 {
                rects.push(osc_value(row, layer).rect(BIG, OSC_VALUE_CHARS));
            }
        }
        for y in [OSC_STATUS_Y, OSC_HINT_Y] {
            rects.push(Spot::centre(0, y).rect(SMALL, 44));
        }
        check(&rects);
        for gauge in 0..OSC_GAUGES {
            for layer in 0..2 {
                let arc = osc_gauge(gauge, layer);
                arc_on_glass(&arc);
                clear_of_arc(&arc, &rects);
            }
        }
    }

    #[test]
    fn the_oscillator_gauges_read_the_rows_they_say() {
        assert_eq!(osc_gauge_row(0), Row::Position);
        assert_eq!(osc_gauge_row(1), Row::Shift);
        assert_eq!(osc_gauge_row(2), Row::Level);
    }

    fn mod_furniture() -> Vec<Rect> {
        let mut rects = Vec::new();
        rects.push(Rect { x: CURVE_X, y: CURVE_Y, w: CURVE_W + 1, h: PLAYHEAD_Y + PLAYHEAD_H - CURVE_Y });
        for t in 0..TAB_NAMES.len() {
            rects.push(mod_tab(t).rect(TEXT, 5));
        }
        for y in [MOD_STATUS_Y, MOD_HINT_Y] {
            rects.push(Spot::centre(0, y).rect(SMALL, 44));
        }
        rects
    }

    fn cell_rects(cell: &Cell, name_chars: usize, value_chars: usize) -> [Rect; 2] {
        [cell.name.rect(TEXT, name_chars), cell.value.rect(cell.value_font(), value_chars)]
    }

    #[test]
    fn an_envelopes_tab_fits() {
        let mut rects = mod_furniture();
        for row in EnvRow::ALL {
            let c = env_cell(row);
            let chars = if c.big { RING_VALUE_CHARS - 1 } else { MOD_VALUE_CHARS };
            rects.extend(cell_rects(&c, row.name().len(), chars));
        }
        check(&rects);
        arc_on_glass(&LIVE_ARC);
        clear_of_arc(&LIVE_ARC, &rects);
    }

    #[test]
    fn an_lfos_tab_fits() {
        let mut rects = mod_furniture();
        for row in LfoRow::ALL {
            let c = lfo_cell(row);
            let chars = if c.big { RING_VALUE_CHARS } else { MOD_VALUE_CHARS };
            rects.extend(cell_rects(&c, row.name().len(), chars));
        }
        check(&rects);
        clear_of_arc(&LIVE_ARC, &rects);
    }

    #[test]
    fn the_stages_read_left_to_right_as_they_happen() {
        let x: Vec<i32> = [EnvRow::Delay, EnvRow::Attack, EnvRow::Hold, EnvRow::Decay, EnvRow::Sustain, EnvRow::Release]
            .iter()
            .map(|r| env_cell(*r).value.x)
            .collect();
        assert!(x.windows(2).all(|w| w[0] < w[1]), "{x:?}");
    }

    #[test]
    fn there_are_as_many_tabs_as_sources_to_show() {
        assert_eq!(N_ENVELOPES, 2);
        assert_eq!(TAB_NAMES.len(), 5);
    }

    #[test]
    fn the_routing_screen_fits() {
        let mut rects = Vec::new();
        rects.push(Spot::centre(0, ROUTE_TITLE_Y).rect(BIG, 7));
        for i in 0..N_BAY_SOURCES {
            rects.push(bay_source_label(i).rect(TEXT, 5));
        }
        for i in 0..N_BAY_DESTS {
            rects.push(bay_dest_label(i).rect(TEXT, 7));
        }
        for s in 0..N_SLOTS {
            rects.push(route_strip(s).rect(TEXT, 2));
        }
        for (x, chars) in ROUTE_FIELD_X.iter().zip([5, 7, 7]) {
            rects.push(Spot::centre(*x, ROUTE_FIELD_Y).rect(BIG, chars));
            rects.push(Spot::centre(*x, ROUTE_FIELD_NAME_Y).rect(SMALL, 6));
        }
        rects.push(Spot::centre(ROUTE_ARROW_X, ROUTE_FIELD_Y).rect(BIG, 1));
        for y in [ROUTE_STATUS_Y, ROUTE_HINT_Y] {
            rects.push(Spot::centre(0, y).rect(SMALL, 44));
        }
        check(&rects);
    }

    #[test]
    fn nothing_sits_where_the_bays_lines_run() {
        // Lines run between the nodes, so anything between the arcs and in their height is in
        // the way, except the title, above them all.
        let bottom = bay_source(N_BAY_SOURCES - 1).1.max(bay_dest(N_BAY_DESTS - 1).1);
        assert!(bottom < ROUTE_STRIP_Y - TEXT.h / 2);
        let top = bay_source(0).1.min(bay_dest(0).1);
        assert!(top > ROUTE_TITLE_Y + BIG.h / 2);
    }

    #[test]
    fn the_nodes_run_down_their_arcs() {
        for i in 0..N_BAY_DESTS {
            let (x, y) = bay_dest(i);
            assert!(x > 0);
            let r = ((x * x + y * y) as f64).sqrt();
            assert!((r - BAY_RADIUS as f64).abs() < 2.0, "{r}");
        }
        for i in 0..N_BAY_SOURCES {
            assert!(bay_source(i).0 < 0);
        }
    }

    #[test]
    fn the_mixer_screen_fits() {
        let mut rects = Vec::new();
        rects.push(Spot::centre(0, MIX_TITLE_Y).rect(BIG, 5));
        for row in MixRow::ALL {
            let c = mix_cell(row);
            rects.extend(cell_rects(&c, row.name().len(), 5));
        }
        for x in [-MIX_END_X, MIX_END_X] {
            rects.push(Spot::centre(x, MIX_END_Y).rect(TEXT, 5));
        }
        for y in [MIX_STATUS_Y, MIX_HINT_Y] {
            rects.push(Spot::centre(0, y).rect(SMALL, 44));
        }
        check(&rects);
        arc_on_glass(&FADER);
        clear_of_arc(&FADER, &rects);
        for layer in 0..2 {
            arc_on_glass(&mix_level_gauge(layer));
            clear_of_arc(&mix_level_gauge(layer), &rects);
        }
    }

    #[test]
    fn the_wave_view_fits_and_the_surface_touches_nothing() {
        use crate::wave::{DEPTH_X, DEPTH_Y, HEIGHT, ORIGIN_X, ORIGIN_Y, TIME_X, TIME_Y};
        let mut rects = Vec::new();
        rects.push(Spot::centre(0, WAVE_TITLE_Y).rect(BIG, 9));
        rects.push(WAVE_INFO.rect(TEXT, 10));
        for row in WaveRow::ALL {
            // (a table's name, or the longest of `+2.000`, `100.0%` and `MIRROR`)
            let chars = match row {
                WaveRow::Table => 11,
                WaveRow::Osc | WaveRow::Traces => 2,
                _ => 6,
            };
            rects.extend(cell_rects(&wave_cell(row), row.name().len(), chars));
        }
        for y in [WAVE_STATUS_Y, WAVE_HINT_Y] {
            rects.push(Spot::centre(0, y).rect(SMALL, 44));
        }
        check(&rects);
        for t in 0..=32 {
            for depth in 0..=32 {
                for lift in (-HEIGHT..=HEIGHT).step_by(4) {
                    let x = ORIGIN_X + TIME_X * t / 32 + DEPTH_X * depth / 32;
                    let y = ORIGIN_Y + TIME_Y * t / 32 + DEPTH_Y * depth / 32 - lift;
                    assert!(x * x + y * y < (RIM_RADIUS - 8) * (RIM_RADIUS - 8), "reaches the rim at {x},{y}");
                    let p = Rect { x, y, w: 1, h: 1 };
                    for r in &rects {
                        assert!(!r.overlaps(&p), "the surface at {x},{y} touches {r:?}");
                    }
                }
            }
        }
    }

    #[test]
    fn the_browser_fits() {
        let mut rects = Vec::new();
        rects.push(Spot::centre(0, BROWSE_TITLE_Y).rect(BIG, 7));
        rects.push(Spot::centre(0, BROWSE_PATH_Y).rect(TEXT, 40));
        for i in 0..BROWSE_ROWS {
            rects.push(browse_row(i).rect(BIG, BROWSE_ROW_CHARS));
        }
        for y in [BROWSE_DETAIL_Y, BROWSE_NOTE_Y] {
            rects.push(Spot::centre(0, y).rect(TEXT, 40));
        }
        for y in [WAVE_STATUS_Y, WAVE_HINT_Y] {
            rects.push(Spot::centre(0, y).rect(SMALL, 44));
        }
        check(&rects);
        arc_on_glass(&BROWSE_ARC);
        clear_of_arc(&BROWSE_ARC, &rects);
    }

    #[test]
    fn a_preview_fits_and_the_surface_touches_nothing() {
        use crate::wave::{DEPTH_X, DEPTH_Y, HEIGHT, ORIGIN_X, ORIGIN_Y, TIME_X, TIME_Y};
        let mut rects = Vec::new();
        rects.push(Spot::centre(0, WAVE_TITLE_Y).rect(BIG, 7));
        // (the longest a file's summary is)
        rects.push(WAVE_INFO.rect(TEXT, 26));
        rects.extend(cell_rects(&preview_name(), 5, 11));
        for row in PreviewRow::ALL {
            let chars = if row == PreviewRow::Frame { 10 } else { 4 };
            rects.extend(cell_rects(&preview_cell(row), row.name().len(), chars));
        }
        for y in [WAVE_STATUS_Y, WAVE_HINT_Y] {
            rects.push(Spot::centre(0, y).rect(SMALL, 44));
        }
        check(&rects);
        for t in 0..=32 {
            for depth in 0..=32 {
                for lift in (-HEIGHT..=HEIGHT).step_by(4) {
                    let x = ORIGIN_X + TIME_X * t / 32 + DEPTH_X * depth / 32;
                    let y = ORIGIN_Y + TIME_Y * t / 32 + DEPTH_Y * depth / 32 - lift;
                    let p = Rect { x, y, w: 1, h: 1 };
                    for r in &rects {
                        assert!(!r.overlaps(&p), "the surface at {x},{y} touches {r:?}");
                    }
                }
            }
        }
    }

    #[test]
    fn the_patches_screen_fits() {
        let mut rects = Vec::new();
        for i in 0..N_PATCHES {
            rects.push(patch_ring(i).rect(BIG, 2));
        }
        rects.push(Spot::centre(0, PATCH_TITLE_Y).rect(BIG, 7));
        rects.push(Spot::centre(0, PATCH_NAME_Y).rect(BIG, 8));
        rects.push(Spot::centre(0, PATCH_STATE_Y).rect(TEXT, 12));
        for a in 0..PatchAction::ALL.len() {
            rects.push(patch_action(a).rect(BIG, 5));
        }
        rects.push(Spot::centre(0, PATCH_NOTE_Y).rect(TEXT, 24));
        for y in [PATCH_STATUS_Y, PATCH_HINT_Y] {
            rects.push(Spot::centre(0, y).rect(SMALL, 44));
        }
        check(&rects);
    }

    #[test]
    fn every_meter_row_fits() {
        for row in 0..METER_ROWS {
            let y = meter_y(row);
            let label = Rect { x: METER_LABEL_X, y: y - TEXT.h / 2, w: TEXT.w * 4, h: TEXT.h };
            let bar = Rect { x: -METER_HALF, y: y - METER_THICK / 2, w: 2 * METER_HALF, h: METER_THICK };
            let value = Rect { x: METER_VALUE_X, y: y - TEXT.h / 2, w: TEXT.w * 7, h: TEXT.h };
            for r in [label, bar, value] {
                assert!(r.fits(safe()), "row {row}: {r:?}");
            }
            assert!(!label.overlaps(&bar) && !bar.overlaps(&value), "row {row}");
        }
    }

    #[test]
    fn a_gauge_reaches_its_end_at_full_scale_and_stays_on_it() {
        let arc = osc_gauge(0, 0);
        assert_eq!(arc.segment(0, 1000), 0);
        assert_eq!(arc.segment(1000, 1000), arc.segments);
        assert_eq!(arc.segment(5000, 1000), arc.segments);
        assert_eq!(arc.segment(-5, 1000), 0);
    }

    #[test]
    fn meter_length_is_signed_and_clamped() {
        assert_eq!(meter_len(0), 0);
        assert_eq!(meter_len(8000), METER_HALF);
        assert_eq!(meter_len(-8000), -METER_HALF);
        assert_eq!(meter_len(80_000), METER_HALF);
        assert_eq!(meter_len(-80_000), -METER_HALF);
        assert_eq!(meter_len(4000), METER_HALF / 2);
    }
}
