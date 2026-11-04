//! What the user has set, in their units, what that tells the gateware, and how the encoder
//! moves through and edits the layers on the oscillators screen.
//!
//! `position` and `shift` are relative to the table (a shift of 1000 crosses the whole
//! table in one cycle), so a setting means the same thing on a table of any shape and
//! survives changing tables. The gateware scales them to the table, once a sample, with
//! whatever the matrix adds (`model/modulation.py`).

use crate::modulation::*;
use crate::table::Table;

pub const N_LAYERS: usize = 2;
/// How far `fine` goes, in cents: past this, a semitone of `semitones` is the nearer step.
pub const FINE_MAX: i8 = 50;

/// 100% of the cross modulation's depth, as the gateware has it (`model/wavescan.py`).
pub const DEPTH_FULL: u32 = 107_374;

/// How the scan behaves past a table's ends.
#[derive(Clone, Copy, PartialEq, Eq, Debug)]
pub enum Edge {
    Clamp = 0,
    Wrap = 1,
    Mirror = 2,
}

impl Edge {
    pub const fn name(self) -> &'static str {
        match self {
            Edge::Clamp => "CLAMP",
            Edge::Wrap => "WRAP",
            Edge::Mirror => "MIRROR",
        }
    }

    pub const fn next(self, by: i32) -> Edge {
        match (self as i32 + by).rem_euclid(3) {
            0 => Edge::Clamp,
            1 => Edge::Wrap,
            _ => Edge::Mirror,
        }
    }
}

/// How much care goes into reading a table.
#[derive(Clone, Copy, PartialEq, Eq, Debug)]
pub enum ReadStyle {
    /// Band-limited, once its levels are made, and blended between samples and between frames.
    Clean = 0,
    /// Blended, but straight from the table however high the pitch: it aliases, as old machines did.
    Plain = 1,
    /// As plain, keeping to one frame instead of blending two: the PPG's steps.
    Stepped = 2,
    /// One frame and one sample: stairs.
    Raw = 3,
}

impl ReadStyle {
    pub const fn name(self) -> &'static str {
        match self {
            ReadStyle::Clean => "CLEAN",
            ReadStyle::Plain => "PLAIN",
            ReadStyle::Stepped => "STEPS",
            ReadStyle::Raw => "RAW",
        }
    }

    pub const fn next(self, by: i32) -> ReadStyle {
        match (self as i32 + by).rem_euclid(4) {
            0 => ReadStyle::Clean,
            1 => ReadStyle::Plain,
            2 => ReadStyle::Stepped,
            _ => ReadStyle::Raw,
        }
    }

    const fn stepped(self) -> bool {
        matches!(self, ReadStyle::Stepped | ReadStyle::Raw)
    }

    const fn raw(self) -> bool {
        matches!(self, ReadStyle::Raw)
    }
}

/// The name of a grain's clock: the LFO whose cycles restart a layer.
pub const fn grain_name(grain: u8) -> &'static str {
    match grain {
        1 => "LFO 1",
        2 => "LFO 2",
        3 => "LFO 3",
        _ => "OFF",
    }
}

#[derive(Clone, Copy, PartialEq, Eq, Debug)]
pub struct Layer {
    /// Which of the resident tables.
    pub table: u8,
    pub semitones: i16,
    /// Cents on top of those: what two oscillators are detuned by.
    pub fine: i8,
    /// Through the table, in thousandths.
    pub position: u16,
    /// Of the table per cycle, in thousandths, signed: the tilt.
    pub shift: i16,
    pub edge: Edge,
    /// In percent.
    pub level: u8,
    pub read: ReadStyle,
    /// 1 to 3: this LFO's cycles restart the layer and it takes up its position only then. 0: off.
    pub grain: u8,
}

/// What one oscillator does to the other.
#[derive(Clone, Copy, PartialEq, Eq, Debug)]
pub enum CrossMode {
    Off = 0,
    /// Carrier times modulator.
    Ring = 1,
    /// Carrier times modulator, the modulator lifted to 0 to 1 first.
    Am = 2,
    /// The modulator moves the carrier's phase, by up to 2 cycles either way.
    Fm = 3,
    /// As FM, with the modulator read at the carrier's own phase: phase distortion, only harmonics.
    Pd = 4,
}

impl CrossMode {
    pub const fn name(self) -> &'static str {
        match self {
            CrossMode::Off => "OFF",
            CrossMode::Ring => "RING",
            CrossMode::Am => "AM",
            CrossMode::Fm => "FM",
            CrossMode::Pd => "PD",
        }
    }

    pub const fn next(self, by: i32) -> CrossMode {
        match (self as i32 + by).rem_euclid(5) {
            0 => CrossMode::Off,
            1 => CrossMode::Ring,
            2 => CrossMode::Am,
            3 => CrossMode::Fm,
            _ => CrossMode::Pd,
        }
    }
}

#[derive(Clone, Copy, PartialEq, Eq, Debug)]
pub struct Cross {
    pub mode: CrossMode,
    /// Which oscillator modulates: 0 is oscillator 1, and the other is the carrier.
    pub modulator: u8,
    /// In thousandths.
    pub depth: u16,
}

impl Cross {
    pub const OFF: Cross = Cross { mode: CrossMode::Off, modulator: 0, depth: 500 };

    /// The routing register's bits: ring, pm, lock, modulator.
    pub const fn word(&self) -> u32 {
        let (ring, pm, lock) = match self.mode {
            CrossMode::Off => (0, 0, 0),
            CrossMode::Ring | CrossMode::Am => (1, 0, 0),
            CrossMode::Fm => (0, 1, 0),
            CrossMode::Pd => (0, 1, 1),
        };
        ring | pm << 1 | lock << 2 | (self.modulator as u32 & 1) << 3
    }

    /// The gateware's depth. AM is ring modulation at half of it.
    pub const fn depth_word(&self) -> u32 {
        let full = self.depth as u32 * DEPTH_FULL / 1000;
        if matches!(self.mode, CrossMode::Am) { full / 2 } else { full }
    }
}

impl Layer {
    pub const fn default_for(i: usize) -> Layer {
        Layer {
            table: i as u8,
            semitones: 0,
            fine: 0,
            position: 500,
            shift: 0,
            edge: Edge::Clamp,
            level: 100,
            read: ReadStyle::Clean,
            grain: 0,
        }
    }

    /// The `ctrl` register: edge (2), stepped, raw, grain (2).
    const fn ctrl(&self) -> u32 {
        self.edge as u32 | (self.read.stepped() as u32) << 2 | (self.read.raw() as u32) << 3
            | (self.grain as u32 & 3) << 4
    }
}

/// Everything the user sets.
#[derive(Clone, Copy, PartialEq, Eq, Debug)]
pub struct Patch {
    pub layers: [Layer; N_LAYERS],
    pub envelopes: [Envelope; N_ENVELOPES],
    pub lfos: [Lfo; N_LFOS],
    pub slots: [Slot; N_SLOTS],
    pub mixer: Mixer,
    pub cross: Cross,
}

impl Default for Patch {
    fn default() -> Self {
        Patch {
            layers: core::array::from_fn(Layer::default_for),
            envelopes: core::array::from_fn(Envelope::default_for),
            lfos: core::array::from_fn(Lfo::default_for),
            slots: default_slots(),
            mixer: Mixer::default(),
            cross: Cross::OFF,
        }
    }
}

/// All the words the gateware holds, as `model/modulation.py` defines them.
#[derive(Clone, Copy, PartialEq, Eq, Debug)]
pub struct Words {
    pub table: [u32; N_LAYERS],
    pub ctrl: [u32; N_LAYERS],
    pub envelopes: [[u32; 8]; N_ENVELOPES],
    pub lfos: [[u32; 3]; N_LFOS],
    pub slots: [u32; N_SLOTS],
    pub base: [u32; N_DESTS],
    /// The outputs' selections, the VCA masks and the cross modulation's mode. (The jack switches are
    /// added as they change.)
    pub routing: u32,
}

impl Words {
    /// Both layers silent, whatever would move their levels: for a patch whose tables are on their way.
    pub fn hush(&mut self) {
        self.base[Dest::Level1 as usize] = 0;
        self.base[Dest::Level2 as usize] = 0;
        for slot in self.slots.iter_mut() {
            let dest = (*slot >> 21) & 15;
            if dest == Dest::Level1 as u32 || dest == Dest::Level2 as u32 {
                *slot = 0;
            }
        }
    }
}

impl Patch {
    /// `table` is the table each layer plays, and `mips` how many levels it has ready.
    pub fn words(&self, table: &[Table; N_LAYERS], mips: &[u8; N_LAYERS], fs: u32) -> Words {
        let fraction = |thousandths: i64| (thousandths * ONE).div_euclid(1000) as u32;
        let mut base = [0; N_DESTS];
        for (i, l) in self.layers.iter().enumerate() {
            let at = i * 4;
            // Q.16 octaves, signed.
            base[at] = ((l.semitones as i64 * 100 + l.fine as i64) * ONE).div_euclid(1200) as u32;
            base[at + 1] = fraction(l.position as i64);
            base[at + 2] = fraction(l.shift as i64);
            base[at + 3] = fraction(l.level as i64 * 10);
        }
        base[Dest::Balance as usize] = fraction(self.mixer.balance as i64);
        base[Dest::Cross as usize] = self.cross.depth_word();
        let vca = (self.envelopes[0].vca as u32 & 3) | (self.envelopes[1].vca as u32 & 3) << 2;
        let am = self.cross.mode as u32 == CrossMode::Am as u32;
        let levels = |i: usize| if self.layers[i].read as u32 == ReadStyle::Clean as u32 { mips[i] } else { 0 };
        Words {
            table: core::array::from_fn(|i| table[i].reg(levels(i))),
            ctrl: core::array::from_fn(|i| self.layers[i].ctrl()),
            envelopes: core::array::from_fn(|i| self.envelopes[i].words(fs)),
            lfos: core::array::from_fn(|i| self.lfos[i].words(fs)),
            slots: core::array::from_fn(|i| self.slots[i].word(am)),
            base,
            routing: self.mixer.outs_word() | vca << 16 | self.cross.word() << 22,
        }
    }
}

/// A row of the oscillators screen.
#[derive(Clone, Copy, PartialEq, Eq, Debug)]
pub enum Row {
    Table,
    Frame,
    Read,
    Tune,
    Fine,
    Position,
    Shift,
    Edge,
    Grain,
    Level,
}

impl Row {
    pub const ALL: [Row; 10] = [
        Row::Table, Row::Frame, Row::Read, Row::Tune, Row::Fine, Row::Position, Row::Shift, Row::Edge, Row::Grain,
        Row::Level,
    ];

    pub const fn name(self) -> &'static str {
        match self {
            Row::Table => "TABLE",
            Row::Frame => "FRAME",
            Row::Read => "READ",
            Row::Tune => "TUNE",
            Row::Fine => "FINE",
            Row::Position => "POS",
            Row::Shift => "SHIFT",
            Row::Edge => "EDGE",
            Row::Grain => "GRAIN",
            Row::Level => "LEVEL",
        }
    }
}

/// Moves one value of `layer` by `detents`. `tables` is how many are resident. (`Frame`
/// belongs to the table, not the layer: see `adjust_frame_len`.)
pub fn adjust(layer: &mut Layer, row: Row, detents: i32, tables: u8) {
    match row {
        Row::Frame => {}
        Row::Table => {
            if tables > 0 {
                layer.table = (layer.table as i32 + detents).rem_euclid(tables as i32) as u8;
            }
        }
        Row::Tune => {
            layer.semitones = (layer.semitones as i32 + detents).clamp(-48, 48) as i16;
        }
        Row::Fine => {
            layer.fine = (layer.fine as i32 + detents).clamp(-FINE_MAX as i32, FINE_MAX as i32) as i8;
        }
        Row::Position => {
            layer.position = (layer.position as i32 + detents * 10).clamp(0, 1000) as u16;
        }
        Row::Shift => {
            layer.shift = (layer.shift as i32 + detents * 25).clamp(-2000, 2000) as i16;
        }
        Row::Edge => layer.edge = layer.edge.next(detents),
        Row::Read => layer.read = layer.read.next(detents),
        Row::Grain => layer.grain = (layer.grain as i32 + detents).rem_euclid(4) as u8,
        Row::Level => {
            layer.level = (layer.level as i32 + detents).clamp(0, 100) as u8;
        }
    }
}

/// The table read with a frame length `detents` doublings away. `total` is the samples it
/// holds. The frame length belongs to the table, so both layers playing it follow.
pub fn adjust_frame_len(table: &Table, detents: i32, total: usize) -> Table {
    let log2 = (table.frame_log2 as i32 + detents).clamp(0, 15) as u8;
    table.reshaped(log2, total)
}

/// Where the encoder is on the oscillators screen: a cell of the grid of rows and
/// layers, and whether turning edits it.
#[derive(Clone, Copy, PartialEq, Eq, Debug, Default)]
pub struct Cursor {
    pub row: usize,
    pub layer: usize,
    pub editing: bool,
}

impl Cursor {
    /// Moves through the cells, down one layer's rows and then the next's, wrapping.
    pub fn turn(&mut self, detents: i32) {
        let rows = Row::ALL.len() as i32;
        let cells = rows * N_LAYERS as i32;
        let at = (self.layer as i32 * rows + self.row as i32 + detents).rem_euclid(cells);
        self.layer = (at / rows) as usize;
        self.row = (at % rows) as usize;
    }

    pub fn click(&mut self) {
        self.editing = !self.editing;
    }

    pub fn current_row(&self) -> Row {
        Row::ALL[self.row]
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    const TABLE: Table = Table { offset: 0x40_0000, frame_log2: 11, frames: 33 };

    fn layer() -> Layer {
        Layer { table: 0, semitones: 0, fine: 0, position: 0, shift: 0, edge: Edge::Clamp, level: 100,
                read: ReadStyle::Clean, grain: 0 }
    }

    fn words(p: &Patch) -> Words {
        p.words(&[TABLE, TABLE], &[0, 0], 48000)
    }

    #[test]
    fn position_and_tilt_are_fractions_of_the_table() {
        let mut p = Patch::default();
        p.layers[0].position = 500;
        p.layers[1].position = 1000;
        p.layers[0].shift = 1000;
        p.layers[1].shift = -2000;
        let w = words(&p);
        assert_eq!(w.base[1], 1 << 15);
        assert_eq!(w.base[5], 1 << 16);
        assert_eq!(w.base[2], 1 << 16, "1.000: the whole table in a cycle");
        assert_eq!(w.base[6] as i32, -(1 << 17));
    }

    #[test]
    fn tune_is_in_octaves() {
        let mut p = Patch::default();
        p.layers[0].semitones = 12;
        p.layers[1].semitones = -7;
        let w = words(&p);
        assert_eq!(w.base[0], 1 << 16);
        assert_eq!(w.base[4] as i32, (-7i64 * 65536).div_euclid(12) as i32);
    }

    #[test]
    fn fine_is_in_hundredths_of_a_semitone_and_changes_nothing_at_zero() {
        let mut p = Patch::default();
        p.layers[0].semitones = -7;
        assert_eq!(words(&p).base[0] as i32, (-7i64 * 65536).div_euclid(12) as i32, "as it was before there was fine");
        p.layers[0].semitones = 1;
        p.layers[0].fine = -50;
        p.layers[1].fine = 12;
        let w = words(&p);
        assert_eq!(w.base[0] as i64, 65536 / 24, "half a semitone");
        assert_eq!(w.base[4] as i64, (12i64 * 65536).div_euclid(1200));
    }

    #[test]
    fn hushed_nothing_can_bring_a_layer_up_and_the_rest_is_as_it_was() {
        let mut p = Patch::default();
        p.slots[4] = Slot { source: Source::Lfo1, dest: Dest::Level1, amount: 200 };
        p.slots[5] = Slot { source: Source::Env2, dest: Dest::Level2, amount: 200 };
        p.slots[6] = Slot { source: Source::Lfo2, dest: Dest::Balance, amount: 200 };
        let open = words(&p);
        let mut hushed = open;
        hushed.hush();
        assert_eq!((hushed.base[Dest::Level1 as usize], hushed.base[Dest::Level2 as usize]), (0, 0));
        assert_eq!(hushed.slots[4] & 0x3_FFFF, 0);
        assert_eq!(hushed.slots[5] & 0x3_FFFF, 0);
        assert_eq!(hushed.slots[6], open.slots[6], "only what moves a level");
        assert_eq!(hushed.slots[0], open.slots[0]);
        assert_eq!(hushed.base[Dest::Position1 as usize], open.base[Dest::Position1 as usize]);
        assert_eq!((hushed.table, hushed.routing), (open.table, open.routing));
    }

    #[test]
    fn fine_stops_at_its_limits() {
        let mut l = layer();
        adjust(&mut l, Row::Fine, 1000, 2);
        assert_eq!(l.fine, FINE_MAX);
        adjust(&mut l, Row::Fine, -1000, 2);
        assert_eq!(l.fine, -FINE_MAX);
    }

    #[test]
    fn level_is_a_fraction_and_edge_has_its_own_word() {
        let mut p = Patch::default();
        p.layers[0].level = 100;
        p.layers[1].level = 25;
        p.layers[1].edge = Edge::Mirror;
        let w = words(&p);
        assert_eq!(w.base[3], 1 << 16);
        assert_eq!(w.base[7], 1 << 14);
        assert_eq!(w.ctrl, [0, 2]);
    }

    #[test]
    fn balance_and_the_routing_word() {
        let mut p = Patch::default();
        p.mixer.balance = 250;
        p.envelopes[0].vca = 3;
        p.envelopes[1].vca = 2;
        let w = words(&p);
        assert_eq!(w.base[8], 1 << 14);
        assert_eq!(w.routing >> 16, 3 | 2 << 2);
        assert_eq!(w.routing & 0xFFFF, p.mixer.outs_word());
    }

    #[test]
    fn the_table_register_follows_each_layers_table() {
        let short = Table { offset: 0x50_0000, frame_log2: 8, frames: 16 };
        let w = Patch::default().words(&[TABLE, short], &[0, 0], 48000);
        assert_eq!(w.table, [TABLE.reg(0), short.reg(0)]);
    }

    #[test]
    fn the_default_patch_plays_with_nothing_patched() {
        let p = Patch::default();
        let w = words(&p);
        assert_eq!(w.base[3], 1 << 16, "layer 1 at full level");
        assert_eq!(w.base[7], 1 << 16, "and layer 2");
        assert_eq!(w.routing >> 16, 0, "no VCA closed: both drone");
        assert_eq!(w.routing & 0xFFFF, 2 | 3 << 4 | 4 << 8 | 5 << 12, "each to its output");
    }

    #[test]
    fn adjustments_stop_at_their_limits() {
        let mut l = layer();
        adjust(&mut l, Row::Tune, 1000, 2);
        assert_eq!(l.semitones, 48);
        adjust(&mut l, Row::Position, 1000, 2);
        assert_eq!(l.position, 1000);
        adjust(&mut l, Row::Position, -1000, 2);
        assert_eq!(l.position, 0);
        adjust(&mut l, Row::Shift, 1000, 2);
        assert_eq!(l.shift, 2000);
        adjust(&mut l, Row::Shift, -1000, 2);
        assert_eq!(l.shift, -2000);
        adjust(&mut l, Row::Level, 1000, 2);
        assert_eq!(l.level, 100);
        adjust(&mut l, Row::Level, -1000, 2);
        assert_eq!(l.level, 0);
    }

    #[test]
    fn table_and_edge_choices_wrap() {
        let mut l = layer();
        adjust(&mut l, Row::Table, -1, 3);
        assert_eq!(l.table, 2);
        adjust(&mut l, Row::Table, 1, 3);
        assert_eq!(l.table, 0);
        adjust(&mut l, Row::Table, 1, 0);
        assert_eq!(l.table, 0, "no tables: nothing to choose");
        adjust(&mut l, Row::Edge, 1, 3);
        assert_eq!(l.edge, Edge::Wrap);
        adjust(&mut l, Row::Edge, -2, 3);
        assert_eq!(l.edge, Edge::Mirror);
    }

    #[test]
    fn the_frame_length_moves_in_doublings_and_stops_at_its_limits() {
        let total = TABLE.samples();
        let short = adjust_frame_len(&TABLE, -3, total);
        assert_eq!(short.frame_len(), 256);
        assert_eq!(short.samples(), total, "the same samples");
        assert_eq!(adjust_frame_len(&short, -1, total).frame_len(), 256);
        assert_eq!(adjust_frame_len(&short, 100, total).frame_len(), 2048);
        assert_eq!(adjust_frame_len(&short, -100, total).frame_len(), 256);
    }

    #[test]
    fn reshaping_a_table_keeps_a_settings_meaning() {
        // Half way through is still half way through: the gateware scales it to the table.
        let mut p = Patch::default();
        p.layers[0].position = 500;
        let reshaped = adjust_frame_len(&TABLE, -1, TABLE.samples());
        assert_eq!(reshaped.frames, 66);
        assert_eq!(p.words(&[TABLE, TABLE], &[0, 0], 48000).base, p.words(&[reshaped, TABLE], &[0, 0], 48000).base);
    }

    #[test]
    fn a_table_is_read_at_its_levels_only_in_the_clean_style() {
        let mut p = Patch::default();
        let w = p.words(&[TABLE, TABLE], &[8, 5], 48000);
        assert_eq!(w.table, [TABLE.reg(8), TABLE.reg(5)]);
        p.layers[0].read = ReadStyle::Plain;
        p.layers[1].read = ReadStyle::Raw;
        let w = p.words(&[TABLE, TABLE], &[8, 5], 48000);
        assert_eq!(w.table, [TABLE.reg(0), TABLE.reg(0)]);
    }

    #[test]
    fn the_ctrl_word_has_the_edge_the_style_and_the_grain() {
        let mut p = Patch::default();
        p.layers[0].edge = Edge::Mirror;
        p.layers[0].read = ReadStyle::Stepped;
        p.layers[0].grain = 3;
        p.layers[1].read = ReadStyle::Raw;
        let w = words(&p);
        assert_eq!(w.ctrl[0], 2 | 1 << 2 | 3 << 4);
        assert_eq!(w.ctrl[1], 1 << 2 | 1 << 3);
    }

    #[test]
    fn each_mode_of_cross_modulation_sets_its_bits() {
        let mut p = Patch::default();
        let bits = |p: &Patch| words(p).routing >> 22;
        assert_eq!(bits(&p), 0, "off by default");
        for (mode, want) in [(CrossMode::Ring, 0b001), (CrossMode::Am, 0b001), (CrossMode::Fm, 0b010), (CrossMode::Pd, 0b110)] {
            p.cross.mode = mode;
            p.cross.modulator = 0;
            assert_eq!(bits(&p), want, "{mode:?}");
            p.cross.modulator = 1;
            assert_eq!(bits(&p), want | 0b1000, "{mode:?}");
        }
    }

    #[test]
    fn the_cross_depth_is_a_base_value_and_am_is_half() {
        let mut p = Patch::default();
        p.cross.mode = CrossMode::Fm;
        p.cross.depth = 1000;
        assert_eq!(words(&p).base[9], DEPTH_FULL);
        p.cross.depth = 250;
        assert_eq!(words(&p).base[9], DEPTH_FULL / 4);
        p.cross.mode = CrossMode::Am;
        p.cross.depth = 1000;
        assert_eq!(words(&p).base[9], DEPTH_FULL / 2);
    }

    #[test]
    fn a_slot_on_the_cross_depth_follows_am() {
        let mut p = Patch::default();
        p.slots[4] = Slot { source: Source::Env1, dest: Dest::Cross, amount: 200 };
        p.cross.mode = CrossMode::Ring;
        let ring = words(&p).slots[4] & 0x3_FFFF;
        p.cross.mode = CrossMode::Am;
        let am = words(&p).slots[4] & 0x3_FFFF;
        assert!((ring as i32 - 2 * am as i32).abs() <= 1, "{ring} vs {am}");
    }

    #[test]
    fn the_depth_full_is_what_the_model_says() {
        assert_eq!(DEPTH_FULL, (1u32 << 31) / 20000);
    }

    #[test]
    fn the_new_rows_walk_their_choices() {
        let mut l = layer();
        adjust(&mut l, Row::Read, 1, 2);
        assert_eq!(l.read, ReadStyle::Plain);
        adjust(&mut l, Row::Read, -2, 2);
        assert_eq!(l.read, ReadStyle::Raw);
        adjust(&mut l, Row::Grain, 1, 2);
        assert_eq!(grain_name(l.grain), "LFO 1");
        adjust(&mut l, Row::Grain, -2, 2);
        assert_eq!(grain_name(l.grain), "LFO 3");
        adjust(&mut l, Row::Grain, 1, 2);
        assert_eq!(grain_name(l.grain), "OFF");
    }

    #[test]
    fn the_cursor_walks_every_cell_and_wraps() {
        let mut c = Cursor::default();
        let cells = Row::ALL.len() * N_LAYERS;
        let mut seen = std::collections::HashSet::new();
        for _ in 0..cells {
            seen.insert((c.row, c.layer));
            c.turn(1);
        }
        assert_eq!(seen.len(), cells);
        assert_eq!((c.row, c.layer), (0, 0), "back where it started");
        c.turn(-1);
        assert_eq!((c.row, c.layer), (Row::ALL.len() - 1, N_LAYERS - 1));
    }

    #[test]
    fn a_click_enters_and_leaves_editing() {
        let mut c = Cursor::default();
        assert!(!c.editing);
        c.click();
        assert!(c.editing);
        c.click();
        assert!(!c.editing);
    }
}
