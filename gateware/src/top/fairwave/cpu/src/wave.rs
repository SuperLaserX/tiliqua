//! The wave view: a table drawn as a surface, as on the Fairlight CMI's page D, and the line an
//! oscillator reads through it. No drawing here, so the host can test all of it.
//!
//! Frames are stacked and skewed into a rhombus, which suits a round screen. The surface is drawn
//! once, and again only when the table changes. The read line can move every frame, and the
//! framebuffer has no layers, so moving it rubs out what it crossed: `Surface::under` finds the
//! segments of the surface it can have touched, and only those are drawn again. Every pixel of a
//! line lies inside the box its two ends make, so testing the boxes misses nothing.

use crate::patch::Edge;
use crate::table::Table;

const POINTS_LOG2: u32 = 7;
/// Segments in a trace: the CMI's largest `END SEG`.
pub const POINTS: usize = 1 << POINTS_LOG2;
pub const VERTICES: usize = POINTS + 1;
pub const MAX_TRACES: usize = 64;
/// How many traces the screen offers to draw, at most: fewer read better on a large table.
pub const TRACE_CHOICES: [usize; 4] = [8, 16, 32, 64];
pub const DEFAULT_TRACES: usize = 2;
/// Room needed for the surface's heights.
pub const YS: usize = MAX_TRACES * VERTICES;

/// Pixels across a segment. A whole number, so finding the segment under a point is a shift.
const STEP_X: i32 = 2;
/// The surface in pixels from the screen's centre, x to the right and y down: a cycle's length
/// runs along `TIME`, the table's along `DEPTH`.
pub const TIME_X: i32 = STEP_X * POINTS as i32;
pub const TIME_Y: i32 = 64;
pub const DEPTH_X: i32 = 300;
pub const DEPTH_Y: i32 = -212;
/// How far a sample at the table's peak stands off the floor.
pub const HEIGHT: i32 = 56;
pub const ORIGIN_X: i32 = -(TIME_X + DEPTH_X) / 2;
pub const ORIGIN_Y: i32 = -(TIME_Y + DEPTH_Y) / 2;

/// Where a line reads at one phase: two frames, and the blend between them (U0.16).
#[derive(Clone, Copy, PartialEq, Eq, Debug)]
pub struct Coords {
    pub f0: u32,
    pub f1: u32,
    pub blend: u32,
}

/// What an oscillator is reading, as it has it. `frame(phi) = pos + shift * phi`.
#[derive(Clone, Copy, PartialEq, Eq, Debug)]
pub struct Line {
    /// Q10.16 frames.
    pub pos: u32,
    /// Q11.6 frames a cycle.
    pub shift: i32,
    pub edge: Edge,
}

impl Line {
    /// From the gateware's monitor register: Q10.6 and Q11.4.
    pub const fn from_monitor(pos: u16, shift: i16, edge: Edge) -> Line {
        Line { pos: (pos as u32) << 10, shift: (shift as i32) << 2, edge }
    }

    /// As `frame_coords` in `model/wavescan.py`. `phi` is U0.17: 0x20000 is a whole cycle.
    pub fn coords(&self, phi: u32, frames: u32) -> Coords {
        let f = self.pos as i32 + ((self.shift as i64 * phi as i64) >> 7) as i32;
        let n = f >> 16;
        let ff = (f & 0xFFFF) as u32;
        let last = frames as i32 - 1;
        match self.edge {
            Edge::Clamp => {
                if f < 0 {
                    Coords { f0: 0, f1: 0, blend: 0 }
                } else if n >= last {
                    Coords { f0: last as u32, f1: last as u32, blend: 0 }
                } else {
                    Coords { f0: n as u32, f1: n as u32 + 1, blend: ff }
                }
            }
            Edge::Wrap => {
                let m = n.rem_euclid(frames as i32) as u32;
                Coords { f0: m, f1: if m + 1 == frames { 0 } else { m + 1 }, blend: ff }
            }
            Edge::Mirror => {
                if frames == 1 {
                    return Coords { f0: 0, f1: 0, blend: 0 };
                }
                let period = 2 * last;
                let m = n.rem_euclid(period);
                if m < last {
                    Coords { f0: m as u32, f1: m as u32 + 1, blend: ff }
                } else {
                    Coords { f0: (period - m - 1) as u32, f1: (period - m) as u32, blend: 0xFFFF - ff }
                }
            }
        }
    }

    /// Whether the line differs enough from `shown` to show: half a pixel at the table's depth.
    /// (Otherwise the noise on a CV would keep it moving when nothing can be seen to move.)
    pub fn moved_from(&self, shown: &Line, frames: u32) -> bool {
        const HALF_PIXEL_DIV: u32 = 2 * 367;
        let span = frames.saturating_sub(1);
        let far = |a: i64, b: i64, unit: u32| (a - b).unsigned_abs() >= (((span << unit) / HALF_PIXEL_DIV).max(1)) as u64;
        self.edge != shown.edge
            || far(self.pos as i64, shown.pos as i64, 16)
            || far(self.shift as i64, shown.shift as i64, 6)
    }
}

/// How far back through the table a coordinate is: U1.16 of the way from the first frame to the
/// last. (A table of one frame stands half way.)
fn depth(c: &Coords, frames: u32) -> u32 {
    if frames <= 1 {
        return 1 << 15;
    }
    let along = (c.f0 << 16) + c.blend;
    (along / (frames - 1)).min(1 << 16)
}

/// The point on the floor under vertex `k` at a depth.
fn floor(depth: u32, k: usize) -> (i32, i32) {
    let d = depth as i32;
    (
        ORIGIN_X + ((d * DEPTH_X + 0x8000) >> 16) + k as i32 * STEP_X,
        ORIGIN_Y + ((d * DEPTH_Y + 0x8000) >> 16) + ((k as i32 * TIME_Y) >> POINTS_LOG2),
    )
}

/// The sample index at vertex `k`. The last vertex closes the cycle.
const fn index_of(k: usize, frame_log2: u8) -> usize {
    ((k << frame_log2) >> POINTS_LOG2) & ((1 << frame_log2) - 1)
}

/// The read line, as drawn.
#[derive(Clone, Copy, PartialEq, Eq, Debug)]
pub struct Scan {
    pub points: [(i16, i16); VERTICES],
    /// Whether the line goes on from each point to the next: not where a wrap jumps.
    pub joined: [bool; POINTS],
}

impl Scan {
    pub const EMPTY: Scan = Scan { points: [(0, 0); VERTICES], joined: [false; POINTS] };

    /// The line's segments.
    pub fn segments(&self) -> impl Iterator<Item = ((i32, i32), (i32, i32))> + '_ {
        self.joined.iter().enumerate().filter(|(_, joined)| **joined).map(|(k, _)| {
            let (a, b) = (self.points[k], self.points[k + 1]);
            ((a.0 as i32, a.1 as i32), (b.0 as i32, b.1 as i32))
        })
    }
}

/// Which segments of the surface to draw again.
pub struct Marks {
    words: [[u32; POINTS / 32]; MAX_TRACES],
}

impl Marks {
    pub const fn new() -> Marks {
        Marks { words: [[0; POINTS / 32]; MAX_TRACES] }
    }

    pub fn clear(&mut self) {
        self.words = [[0; POINTS / 32]; MAX_TRACES];
    }

    fn mark(&mut self, trace: usize, k: usize) {
        self.words[trace][k >> 5] |= 1 << (k & 31);
    }

    /// A trace's marked segments.
    pub fn marked(&self, trace: usize) -> impl Iterator<Item = usize> + '_ {
        self.words[trace].iter().enumerate().flat_map(|(w, bits)| {
            let bits = *bits;
            (0..32).filter(move |b| bits & (1 << b) != 0).map(move |b| w * 32 + b)
        })
    }

    pub fn count(&self) -> u32 {
        self.words.iter().flatten().map(|w| w.count_ones()).sum()
    }
}

impl Default for Marks {
    fn default() -> Self {
        Marks::new()
    }
}

/// A table as drawn: where each trace stands and how high each of its vertices is. The heights
/// are kept (in PSRAM on the hardware) because `under` reads them so often.
pub struct Surface<'a> {
    ys: &'a mut [i16],
    xs: [i16; MAX_TRACES],
    traces: usize,
    frames: u32,
    frame_log2: u8,
    peak: i32,
    gain: i32,
}

impl<'a> Surface<'a> {
    /// `ys` has room for `YS` heights.
    pub fn new(ys: &'a mut [i16]) -> Self {
        assert!(ys.len() >= YS);
        Surface { ys, xs: [0; MAX_TRACES], traces: 0, frames: 1, frame_log2: 8, peak: 0, gain: 0 }
    }

    pub const fn traces(&self) -> usize {
        self.traces
    }

    /// Measures `table` and works out its traces, at most `wanted` of them, evenly through it from
    /// the first frame to the last. It is scaled so its peak stands `HEIGHT` off the floor, so a
    /// quiet table is as easy to see as a loud one. `read` gives a frame's sample.
    pub fn build(&mut self, table: &Table, wanted: usize, read: &impl Fn(u32, usize) -> i16) {
        self.frames = table.frames as u32;
        self.frame_log2 = table.frame_log2;
        self.traces = wanted.min(MAX_TRACES).min(table.frames as usize).max(1);

        let mut peak = 0;
        for i in 0..self.traces {
            let f = self.trace_frame(i);
            for k in 0..POINTS {
                peak = peak.max((read(f, index_of(k, self.frame_log2)) as i32).abs());
            }
        }
        self.peak = peak;
        self.gain = if peak == 0 { 0 } else { (HEIGHT << 16) / peak };

        for i in 0..self.traces {
            let f = self.trace_frame(i);
            let d = depth(&Coords { f0: f, f1: f, blend: 0 }, self.frames);
            self.xs[i] = floor(d, 0).0 as i16;
            for k in 0..VERTICES {
                let v = read(f, index_of(k, self.frame_log2)) as i32;
                self.ys[i * VERTICES + k] = (floor(d, k).1 - self.lift(v)) as i16;
            }
        }
    }

    fn trace_frame(&self, i: usize) -> u32 {
        if self.traces <= 1 { 0 } else { i as u32 * (self.frames - 1) / (self.traces as u32 - 1) }
    }

    /// How far a sample stands off the floor. A frame between the traces can pass the peak they
    /// were measured at: it stops at `HEIGHT`, which also keeps it off the text.
    fn lift(&self, v: i32) -> i32 {
        (v.clamp(-self.peak, self.peak) * self.gain) >> 16
    }

    /// Vertex `k` of trace `i`. Trace 0 is the first frame, at the front.
    pub fn vertex(&self, i: usize, k: usize) -> (i32, i32) {
        (self.xs[i] as i32 + k as i32 * STEP_X, self.ys[i * VERTICES + k] as i32)
    }

    /// A trace's brightness, the front ones brighter.
    pub const fn shade(&self, i: usize) -> u8 {
        if self.traces <= 1 { 12 } else { 12 - (i * 6 / (self.traces - 1)) as u8 }
    }

    /// What the oscillator reads at vertex `k`, the frames blended as it blends them.
    pub fn value_at(&self, line: &Line, k: usize, read: &impl Fn(u32, usize) -> i16) -> i32 {
        let c = line.coords((k as u32) << (17 - POINTS_LOG2), self.frames);
        let index = index_of(k, self.frame_log2);
        let x0 = read(c.f0, index) as i32;
        if c.blend == 0 || c.f0 == c.f1 {
            return x0;
        }
        let x1 = read(c.f1, index) as i32;
        x0 + (((x1 - x0) as i64 * c.blend as i64) >> 16) as i32
    }

    /// The line `line` makes across the surface.
    pub fn scan(&self, line: &Line, read: &impl Fn(u32, usize) -> i16, out: &mut Scan) {
        let mut before = 0;
        for k in 0..VERTICES {
            let c = line.coords((k as u32) << (17 - POINTS_LOG2), self.frames);
            let d = depth(&c, self.frames);
            let (x, y) = floor(d, k);
            out.points[k] = (x as i16, (y - self.lift(self.value_at(line, k, read))) as i16);
            if k > 0 {
                out.joined[k - 1] = (d as i32 - before as i32).abs() < 1 << 15;
            }
            before = d;
        }
    }

    /// Marks every segment of the surface that shares a box with a segment of `scan`. One trace at
    /// a time, along it: the heights are in PSRAM, and across the traces each read misses the cache.
    pub fn under(&self, scan: &Scan, marks: &mut Marks) {
        let mut boxes = [(0i16, 0i16, 0i16, 0i16); POINTS];
        let mut n = 0;
        for (a, b) in scan.segments() {
            boxes[n] = (a.0.min(b.0) as i16, a.0.max(b.0) as i16, a.1.min(b.1) as i16, a.1.max(b.1) as i16);
            n += 1;
        }
        let boxes = &boxes[..n];
        for i in 0..self.traces {
            let at = self.xs[i] as i32;
            let ys = &self.ys[i * VERTICES..(i + 1) * VERTICES];
            for &(x0, x1, y0, y1) in boxes {
                // Segment k runs from at + 2k to at + 2k + 2.
                let first = ((x0 as i32 - at - STEP_X) >> 1).max(0);
                let last = ((x1 as i32 - at) >> 1).min(POINTS as i32 - 1);
                for k in first..=last {
                    let k = k as usize;
                    let (p, q) = (ys[k], ys[k + 1]);
                    if p.max(q) >= y0 && p.min(q) <= y1 {
                        marks.mark(i, k);
                    }
                }
            }
        }
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use std::collections::HashMap;
    use std::vec;
    use std::vec::Vec;

    const LOG2: u8 = 8;

    fn table(frames: u16) -> Table {
        Table { offset: 0, frame_log2: LOG2, frames }
    }

    /// A shape that changes through the table, with its peak on the last frame.
    fn morph(frames: u32) -> impl Fn(u32, usize) -> i16 {
        move |f, i| {
            let phase = i as f64 / 256.0 * core::f64::consts::TAU;
            let amount = (f + 1) as f64 / frames as f64;
            ((phase.sin() + 0.5 * (phase * (1.0 + f as f64)).sin()) * amount * 18000.0) as i16
        }
    }

    fn surface_of(ys: &mut Vec<i16>, frames: u16, wanted: usize) -> Surface<'_> {
        let mut s = Surface::new(ys);
        s.build(&table(frames), wanted, &morph(frames as u32));
        s
    }

    fn line(pos_frames: f64, shift_frames: f64, edge: Edge) -> Line {
        Line { pos: (pos_frames * 65536.0) as u32, shift: (shift_frames * 64.0) as i32, edge }
    }

    #[test]
    fn the_read_line_is_what_the_oscillators_model_reads() {
        // `model/wavescan.py`'s `sample`, on 5 frames of 256 of (f * 1000 + i * 3 - 2000).
        let read = |f: u32, i: usize| (f as i32 * 1000 + i as i32 * 3 - 2000) as i16;
        let mut ys = vec![0; YS];
        let mut s = Surface::new(&mut ys);
        s.build(&table(5), 8, &read);
        let cases: [(Edge, u32, i32, [i32; 16]); 5] = [
            (Edge::Clamp, 98304, 0, [-500, -452, -404, -356, -308, -260, -212, -164, -116, -68, -20, 28, 76, 124, 172, 220]),
            (Edge::Clamp, 32768, 144, [-1500, -1312, -1123, -935, -746, -557, -369, -180, 9, 197, 386, 574, 763, 952, 1140, 1329]),
            (Edge::Clamp, 196608, 512, [1000, 1548, 2096, 2144, 2192, 2240, 2288, 2336, 2384, 2432, 2480, 2528, 2576, 2624, 2672, 2720]),
            (Edge::Wrap, 196608, -224, [1000, 829, 658, 487, 317, 146, -25, -196, -366, -537, -708, -879, -1049, -1220, -1078, -155]),
            (Edge::Mirror, 65536, 640, [-1000, -327, 346, 1019, 1692, 2114, 1537, 960, 383, -194, -771, -1348, -924, -251, 422, 1095]),
        ];
        for (edge, pos, shift, want) in cases {
            let l = Line { pos, shift, edge };
            for (n, w) in want.iter().enumerate() {
                let got = s.value_at(&l, n * 8, &read);
                assert_eq!(got, *w, "{edge:?} pos {pos} shift {shift} at vertex {}", n * 8);
            }
        }
    }

    #[test]
    fn the_surface_fits_the_round_screen() {
        use crate::geometry::{MARGIN, RADIUS};
        let reach = (RADIUS - MARGIN) * (RADIUS - MARGIN);
        for (x, y) in [
            (ORIGIN_X, ORIGIN_Y),
            (ORIGIN_X + TIME_X, ORIGIN_Y + TIME_Y),
            (ORIGIN_X + DEPTH_X, ORIGIN_Y + DEPTH_Y),
            (ORIGIN_X + TIME_X + DEPTH_X, ORIGIN_Y + TIME_Y + DEPTH_Y),
        ] {
            for lift in [-HEIGHT, HEIGHT] {
                assert!(x * x + (y + lift) * (y + lift) < reach, "({x}, {})", y + lift);
            }
        }
    }

    #[test]
    fn traces_run_evenly_from_the_first_frame_to_the_last() {
        let mut ys = vec![0; YS];
        let s = surface_of(&mut ys, 31, 32);
        assert_eq!(s.traces(), 31, "no more traces than frames");
        assert_eq!((s.trace_frame(0), s.trace_frame(30)), (0, 30));
        let s = surface_of(&mut ys, 200, 16);
        assert_eq!(s.traces(), 16);
        assert_eq!((s.trace_frame(0), s.trace_frame(15)), (0, 199));
        let gaps: Vec<u32> = (1..16).map(|i| s.trace_frame(i) - s.trace_frame(i - 1)).collect();
        assert!(gaps.iter().all(|g| (13..=14).contains(g)), "{gaps:?}");
    }

    #[test]
    fn the_front_is_the_first_frame_and_the_table_goes_back_up_to_the_right() {
        let mut ys = vec![0; YS];
        let s = surface_of(&mut ys, 16, 16);
        assert_eq!(s.vertex(0, 0).0, ORIGIN_X);
        assert_eq!(s.vertex(15, POINTS).0, ORIGIN_X + TIME_X + DEPTH_X);
        assert!(s.shade(0) > s.shade(15));
    }

    #[test]
    fn the_peak_stands_at_its_height_whatever_the_tables_level() {
        for scale in [1.0, 0.02] {
            let read = move |f: u32, i: usize| (morph(16)(f, i) as f64 * scale) as i16;
            let mut ys = vec![0; YS];
            let mut s = Surface::new(&mut ys);
            s.build(&table(16), 16, &read);
            let mut most = 0;
            for i in 0..16 {
                let d = depth(&Coords { f0: s.trace_frame(i), f1: s.trace_frame(i), blend: 0 }, 16);
                for k in 0..POINTS {
                    most = most.max((s.vertex(i, k).1 - floor(d, k).1).abs());
                }
            }
            assert!((HEIGHT - 1..=HEIGHT).contains(&most), "{most} at scale {scale}");
        }
    }

    #[test]
    fn silence_lies_on_the_floor() {
        let read = |_: u32, _: usize| 0i16;
        let mut ys = vec![0; YS];
        let mut s = Surface::new(&mut ys);
        s.build(&table(4), 8, &read);
        assert_eq!(s.vertex(0, 0), floor(0, 0));
        assert_eq!(s.vertex(3, POINTS), floor(1 << 16, POINTS));
    }

    #[test]
    fn a_single_frame_stands_half_way_back() {
        let mut ys = vec![0; YS];
        let s = surface_of(&mut ys, 1, 32);
        assert_eq!(s.traces(), 1);
        assert_eq!(s.vertex(0, 0).0, ORIGIN_X + DEPTH_X / 2);
        let read = morph(1);
        let mut scan = Scan::EMPTY;
        for edge in [Edge::Clamp, Edge::Wrap, Edge::Mirror] {
            s.scan(&line(0.0, 0.0, edge), &read, &mut scan);
            assert_eq!(scan.points[10].0 as i32, s.vertex(0, 10).0, "{edge:?}");
        }
    }

    #[test]
    fn a_level_line_on_a_frame_lies_exactly_on_its_trace() {
        let mut ys = vec![0; YS];
        let s = surface_of(&mut ys, 16, 16);
        let read = morph(16);
        let mut scan = Scan::EMPTY;
        s.scan(&line(5.0, 0.0, Edge::Clamp), &read, &mut scan);
        for k in 0..VERTICES {
            assert_eq!((scan.points[k].0 as i32, scan.points[k].1 as i32), s.vertex(5, k), "vertex {k}");
        }
    }

    #[test]
    fn a_tilted_line_crosses_the_frames_it_says_it_does() {
        let mut ys = vec![0; YS];
        let s = surface_of(&mut ys, 16, 16);
        let read = |_: u32, _: usize| 0i16;
        let mut scan = Scan::EMPTY;
        s.scan(&line(3.0, 6.0, Edge::Clamp), &read, &mut scan);
        let at = |frame: u32, k: usize| floor(depth(&Coords { f0: frame, f1: frame, blend: 0 }, 16), k);
        assert_eq!((scan.points[0].0 as i32, scan.points[0].1 as i32), at(3, 0));
        assert_eq!((scan.points[POINTS].0 as i32, scan.points[POINTS].1 as i32), at(9, POINTS));
        assert!(scan.joined.iter().all(|j| *j));
    }

    #[test]
    fn a_wrap_lifts_the_pen_and_a_mirror_does_not() {
        let mut ys = vec![0; YS];
        let s = surface_of(&mut ys, 16, 16);
        let read = morph(16);
        let mut scan = Scan::EMPTY;
        s.scan(&line(10.0, 15.0, Edge::Wrap), &read, &mut scan);
        assert_eq!(scan.joined.iter().filter(|j| !**j).count(), 1, "once across the end");
        s.scan(&line(10.0, 15.0, Edge::Mirror), &read, &mut scan);
        assert!(scan.joined.iter().all(|j| *j));
        s.scan(&line(10.0, 15.0, Edge::Clamp), &read, &mut scan);
        assert!(scan.joined.iter().all(|j| *j));
    }

    #[test]
    fn a_line_never_leaves_the_surface_whatever_the_frame_holds() {
        // Traces every 10 frames miss the loudest: the line can land on it, and must stop.
        let read = |f: u32, i: usize| {
            let v = if i % 2 == 0 { 3000 } else { -3000 };
            if f % 10 == 5 { v * 10 } else { v }
        };
        let mut ys = vec![0; YS];
        let mut s = Surface::new(&mut ys);
        s.build(&table(101), 11, &read);
        let mut scan = Scan::EMPTY;
        s.scan(&line(25.0, 0.0, Edge::Clamp), &read, &mut scan);
        let d = depth(&Coords { f0: 25, f1: 25, blend: 0 }, 101);
        for k in 0..VERTICES {
            let off = scan.points[k].1 as i32 - floor(d, k).1;
            assert!(off.abs() <= HEIGHT, "vertex {k}: {off}");
        }
    }

    #[test]
    fn small_changes_dont_redraw_and_real_ones_do() {
        let at = line(10.0, 1.0, Edge::Clamp);
        let nudge = Line { pos: at.pos + 30, ..at };
        assert!(!nudge.moved_from(&at, 32), "noise on a CV");
        let moved = Line { pos: at.pos + 65536, ..at };
        assert!(moved.moved_from(&at, 32));
        assert!(Line { shift: at.shift + 64, ..at }.moved_from(&at, 32));
        assert!(Line { edge: Edge::Wrap, ..at }.moved_from(&at, 32));
        assert!(!Line { pos: at.pos + 65536, ..at }.moved_from(&Line { pos: at.pos + 65536, ..at }, 1));
    }

    /// The plotter's line, as `tiliqua/raster/line.py` draws it.
    fn plot(fb: &mut HashMap<(i32, i32), u8>, a: (i32, i32), b: (i32, i32), color: u8) {
        let (mut x, mut y) = a;
        let (dx, dy) = ((b.0 - x).abs(), (b.1 - y).abs());
        let (sx, sy) = (if b.0 >= x { 1 } else { -1 }, if b.1 >= y { 1 } else { -1 });
        let mut err = dx - dy;
        loop {
            fb.insert((x, y), color);
            if (x, y) == b {
                return;
            }
            let e2 = err << 1;
            if e2 > -dy {
                err -= dy;
                x += sx;
            }
            if e2 < dx {
                err += dx;
                y += sy;
            }
        }
    }

    fn lit(fb: &HashMap<(i32, i32), u8>) -> Vec<(i32, i32)> {
        let mut pixels: Vec<(i32, i32)> = fb.iter().filter(|(_, c)| **c != 0).map(|(p, _)| *p).collect();
        pixels.sort();
        pixels
    }

    #[test]
    fn moving_the_line_leaves_the_surface_as_it_was() {
        for (frames, wanted) in [(1, 8), (16, 16), (31, 32), (124, 64)] {
            let mut ys = vec![0; YS];
            let s = surface_of(&mut ys, frames, wanted);
            let read = morph(frames as u32);
            let mut fb = HashMap::new();
            for i in (0..s.traces()).rev() {
                for k in 0..POINTS {
                    plot(&mut fb, s.vertex(i, k), s.vertex(i, k + 1), s.shade(i));
                }
            }
            let surface = lit(&fb);

            let span = (frames - 1) as f64;
            let lines = [
                line(0.0, 0.0, Edge::Clamp),
                line(span * 0.5, 0.0, Edge::Clamp),
                line(span * 0.25, span * 0.5, Edge::Clamp),
                line(span * 0.9, -span, Edge::Clamp),
                line(span * 0.75, span * 0.8, Edge::Wrap),
                line(span * 0.2, span * 1.9, Edge::Mirror),
                line(span * 0.5, -span * 2.0, Edge::Mirror),
            ];
            let (mut old, mut new) = (Scan::EMPTY, Scan::EMPTY);
            let mut shown = false;
            for l in lines {
                s.scan(&l, &read, &mut new);
                for (a, b) in new.segments() {
                    plot(&mut fb, a, b, 15);
                }
                if shown {
                    for (a, b) in old.segments() {
                        plot(&mut fb, a, b, 0);
                    }
                    let mut marks = Marks::new();
                    s.under(&old, &mut marks);
                    for i in (0..s.traces()).rev() {
                        for k in marks.marked(i) {
                            plot(&mut fb, s.vertex(i, k), s.vertex(i, k + 1), s.shade(i));
                        }
                    }
                    for (a, b) in new.segments() {
                        plot(&mut fb, a, b, 15);
                    }
                }
                core::mem::swap(&mut old, &mut new);
                shown = true;
            }
            // The last line rubbed out and the surface repaired: nothing else is left lit or dark.
            for (a, b) in old.segments() {
                plot(&mut fb, a, b, 0);
            }
            assert_ne!(lit(&fb), surface, "rubbing it out must leave holes for this to mean anything");
            let mut marks = Marks::new();
            s.under(&old, &mut marks);
            for i in (0..s.traces()).rev() {
                for k in marks.marked(i) {
                    plot(&mut fb, s.vertex(i, k), s.vertex(i, k + 1), s.shade(i));
                }
            }
            assert_eq!(lit(&fb), surface, "{frames} frames");
        }
    }

    #[test]
    fn every_move_of_the_line_on_a_real_table_leaves_exactly_the_surface_and_the_line() {
        // The table the firmware generates, read at the shape the simulation found holes on.
        let total = 31 * 2048;
        let mut samples = vec![0i16; total];
        crate::wavegen::harmonic_morph(&mut samples, 2048);
        let t = Table { offset: 0, frame_log2: 9, frames: (total >> 9) as u16 };
        let data = samples.clone();
        let read = move |f: u32, i: usize| data[((f as usize) << 9) + i];

        let mut ys = vec![0; YS];
        let mut s = Surface::new(&mut ys);
        s.build(&t, 64, &read);
        let mut surface = HashMap::new();
        for i in (0..s.traces()).rev() {
            for k in 0..POINTS {
                plot(&mut surface, s.vertex(i, k), s.vertex(i, k + 1), s.shade(i));
            }
        }

        let span = (t.frames - 1) as f64;
        let at = |fraction: f64, shift: f64| line(span * fraction, span * shift, Edge::Clamp);
        let moves = [at(0.5, 0.0), at(0.9, 0.0), at(0.88, 0.0), at(0.5, 0.0), at(0.9, 0.0), at(0.51, 0.0),
                     at(0.2, 0.5), at(0.21, 0.5), at(0.9, -0.6), at(0.5, 0.0)];
        let mut fb = surface.clone();
        let (mut old, mut new) = (Scan::EMPTY, Scan::EMPTY);
        let mut shown = false;
        for (n, l) in moves.iter().enumerate() {
            s.scan(l, &read, &mut new);
            for (a, b) in new.segments() {
                plot(&mut fb, a, b, 15);
            }
            if shown {
                for (a, b) in old.segments() {
                    plot(&mut fb, a, b, 0);
                }
                let mut marks = Marks::new();
                s.under(&old, &mut marks);
                for i in (0..s.traces()).rev() {
                    for k in marks.marked(i) {
                        plot(&mut fb, s.vertex(i, k), s.vertex(i, k + 1), s.shade(i));
                    }
                }
                for (a, b) in new.segments() {
                    plot(&mut fb, a, b, 15);
                }
            }
            let mut want = surface.clone();
            for (a, b) in new.segments() {
                plot(&mut want, a, b, 15);
            }
            assert_eq!(lit(&fb), lit(&want), "after move {n}");
            core::mem::swap(&mut old, &mut new);
            shown = true;
        }
    }

    #[test]
    fn moving_the_line_redraws_a_small_part_of_the_surface() {
        let mut ys = vec![0; YS];
        let s = surface_of(&mut ys, 31, 32);
        let read = morph(31);
        let mut scan = Scan::EMPTY;
        let whole = (s.traces() * POINTS) as u32;
        for l in [line(15.0, 0.0, Edge::Clamp), line(5.0, 20.0, Edge::Clamp)] {
            s.scan(&l, &read, &mut scan);
            let mut marks = Marks::new();
            s.under(&scan, &mut marks);
            assert!(marks.count() * 4 < whole, "{} of {whole}", marks.count());
        }
    }

    #[test]
    fn marks_list_what_was_marked_in_order() {
        let mut m = Marks::new();
        m.mark(2, 127);
        m.mark(2, 0);
        m.mark(2, 33);
        assert_eq!(m.marked(2).collect::<Vec<_>>(), vec![0, 33, 127]);
        assert_eq!(m.marked(3).count(), 0);
        assert_eq!(m.count(), 3);
        m.clear();
        assert_eq!(m.count(), 0);
    }
}
