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

#[derive(Clone, Copy, PartialEq, Eq, Debug)]
pub struct Layer {
    /// Which of the resident tables.
    pub table: u8,
    pub semitones: i16,
    /// Through the table, in thousandths.
    pub position: u16,
    /// Of the table per cycle, in thousandths, signed: the tilt.
    pub shift: i16,
    pub edge: Edge,
    /// In percent.
    pub level: u8,
}

impl Layer {
    pub const fn default_for(i: usize) -> Layer {
        Layer {
            table: i as u8,
            semitones: 0,
            position: 500,
            shift: 0,
            edge: Edge::Clamp,
            level: 100,
        }
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
}

impl Default for Patch {
    fn default() -> Self {
        Patch {
            layers: core::array::from_fn(Layer::default_for),
            envelopes: core::array::from_fn(Envelope::default_for),
            lfos: core::array::from_fn(Lfo::default_for),
            slots: default_slots(),
            mixer: Mixer::default(),
        }
    }
}

/// All the words the gateware holds, as `model/modulation.py` defines them.
#[derive(Clone, Copy, PartialEq, Eq, Debug)]
pub struct Words {
    pub table: [u32; N_LAYERS],
    pub edge: [u32; N_LAYERS],
    pub envelopes: [[u32; 8]; N_ENVELOPES],
    pub lfos: [[u32; 3]; N_LFOS],
    pub slots: [u32; N_SLOTS],
    pub base: [u32; N_DESTS],
    /// The outputs' selections and the VCA masks. (The jack switches are added as they change.)
    pub routing: u32,
}

impl Patch {
    /// `table` is the table each layer plays.
    pub fn words(&self, table: &[Table; N_LAYERS], fs: u32) -> Words {
        let fraction = |thousandths: i64| (thousandths * ONE).div_euclid(1000) as u32;
        let mut base = [0; N_DESTS];
        for (i, l) in self.layers.iter().enumerate() {
            let at = i * 4;
            // Q.16 octaves, signed.
            base[at] = (l.semitones as i64 * ONE).div_euclid(12) as u32;
            base[at + 1] = fraction(l.position as i64);
            base[at + 2] = fraction(l.shift as i64);
            base[at + 3] = fraction(l.level as i64 * 10);
        }
        base[Dest::Balance as usize] = fraction(self.mixer.balance as i64);
        let vca = (self.envelopes[0].vca as u32 & 3) | (self.envelopes[1].vca as u32 & 3) << 2;
        Words {
            table: core::array::from_fn(|i| table[i].reg()),
            edge: core::array::from_fn(|i| self.layers[i].edge as u32),
            envelopes: core::array::from_fn(|i| self.envelopes[i].words(fs)),
            lfos: core::array::from_fn(|i| self.lfos[i].words(fs)),
            slots: core::array::from_fn(|i| self.slots[i].word()),
            base,
            routing: self.mixer.outs_word() | vca << 16,
        }
    }
}

/// A row of the oscillators screen.
#[derive(Clone, Copy, PartialEq, Eq, Debug)]
pub enum Row {
    Table,
    Frame,
    Tune,
    Position,
    Shift,
    Edge,
    Level,
}

impl Row {
    pub const ALL: [Row; 7] =
        [Row::Table, Row::Frame, Row::Tune, Row::Position, Row::Shift, Row::Edge, Row::Level];

    pub const fn name(self) -> &'static str {
        match self {
            Row::Table => "TABLE",
            Row::Frame => "FRAME",
            Row::Tune => "TUNE",
            Row::Position => "POS",
            Row::Shift => "SHIFT",
            Row::Edge => "EDGE",
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
        Row::Position => {
            layer.position = (layer.position as i32 + detents * 10).clamp(0, 1000) as u16;
        }
        Row::Shift => {
            layer.shift = (layer.shift as i32 + detents * 25).clamp(-2000, 2000) as i16;
        }
        Row::Edge => layer.edge = layer.edge.next(detents),
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
        Layer { table: 0, semitones: 0, position: 0, shift: 0, edge: Edge::Clamp, level: 100 }
    }

    fn words(p: &Patch) -> Words {
        p.words(&[TABLE, TABLE], 48000)
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
    fn level_is_a_fraction_and_edge_has_its_own_word() {
        let mut p = Patch::default();
        p.layers[0].level = 100;
        p.layers[1].level = 25;
        p.layers[1].edge = Edge::Mirror;
        let w = words(&p);
        assert_eq!(w.base[3], 1 << 16);
        assert_eq!(w.base[7], 1 << 14);
        assert_eq!(w.edge, [0, 2]);
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
        let w = Patch::default().words(&[TABLE, short], 48000);
        assert_eq!(w.table, [TABLE.reg(), short.reg()]);
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
        assert_eq!(p.words(&[TABLE, TABLE], 48000).base, p.words(&[reshaped, TABLE], 48000).base);
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
