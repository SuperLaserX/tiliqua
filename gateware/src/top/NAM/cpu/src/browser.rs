//! The profile browser's logic: where the encoder is, and where on the drive. No drawing or drive
//! here. (FairWave's `cpu/src/browser.rs`, without its preview.)
//!
//! Turning walks a folder and a click opens what is highlighted: a folder lists, the way up goes
//! back, a profile loads.

use heapless::String;

use crate::disk::{Entry, PATH_BYTES};
use crate::namfile::{Gear, Summary, Tone};
use crate::nav::Event;

/// What the browser wants done.
#[derive(Clone, Copy, PartialEq, Eq, Debug)]
pub enum BrowserAction {
    /// Open the row: a folder, the way up, or a profile to load.
    Open(usize),
}

/// Where the encoder is in the list.
#[derive(Clone, Copy, PartialEq, Eq, Debug, Default)]
pub struct BrowserCursor {
    /// The row highlighted, and how many there are.
    pub at: usize,
    pub rows: usize,
}

impl BrowserCursor {
    pub fn event(&mut self, event: Event) -> Option<BrowserAction> {
        match event {
            Event::Hold => None,
            Event::Turn(n) => {
                if self.rows > 0 {
                    self.at = (self.at as i32 + n).rem_euclid(self.rows as i32) as usize;
                }
                None
            }
            Event::Click => (self.rows > 0).then_some(BrowserAction::Open(self.at)),
        }
    }

    /// A new list of `rows`, the highlight at the top.
    pub fn reset(&mut self, rows: usize) {
        self.rows = rows;
        self.at = 0;
    }

    /// The first row of a screenful of `shown`, keeping the highlight in the middle where it can.
    pub fn top(&self, shown: usize) -> usize {
        self.at.saturating_sub(shown / 2).min(self.rows.saturating_sub(shown))
    }
}

/// Where the browser is on the drive: in short names to open things by, `AMPS/PLEXIC~1`, and in
/// the names a player knows, `Amps/Plexi Captures`.
#[derive(Clone, PartialEq, Eq, Debug, Default)]
pub struct DrivePath {
    path: String<PATH_BYTES>,
    names: String<160>,
}

impl DrivePath {
    pub fn as_str(&self) -> &str {
        self.path.as_str()
    }

    /// As much of the end of where it is as fits `most` characters, to show.
    pub fn shown(&self, most: usize) -> &str {
        let s = self.names.as_str();
        s.get(s.len().saturating_sub(most)..).unwrap_or("")
    }

    pub fn clear(&mut self) {
        self.path.clear();
        self.names.clear();
    }

    pub fn is_top(&self) -> bool {
        self.path.is_empty()
    }

    /// Goes into a folder. False if the path would be too long to keep.
    pub fn enter(&mut self, short: &str, name: &str) -> bool {
        let (Some(path), Some(names)) = (joined(&self.path, short), joined(&self.names, name)) else {
            return false;
        };
        self.path = path;
        self.names = names;
        true
    }

    pub fn up(&mut self) {
        self.path.truncate(self.path.rfind('/').unwrap_or(0));
        self.names.truncate(self.names.rfind('/').unwrap_or(0));
    }

    /// The path of a file in this folder. None if too long.
    pub fn of(&self, short: &str) -> Option<String<PATH_BYTES>> {
        joined(&self.path, short)
    }
}

/// `folder/name`, or just `name` at the top. None if it doesn't fit.
fn joined<const N: usize>(folder: &String<N>, name: &str) -> Option<String<N>> {
    let mut new = folder.clone();
    ((new.is_empty() || new.push('/').is_ok()) && new.push_str(name).is_ok()).then_some(new)
}

/// A profile's name as the screens show it: its file's, without the extension.
pub fn profile_name(file: &str) -> String<40> {
    let stem = match file.rsplit_once('.') {
        Some((stem, ext)) if ext.eq_ignore_ascii_case("nam") && !stem.is_empty() => stem,
        _ => file,
    };
    let mut out = String::new();
    for c in stem.chars() {
        if out.push(c).is_err() {
            break;
        }
    }
    out
}

/// What the browser shows of a profile: a title, and a line of what its metadata says.
#[derive(Clone, PartialEq, Eq, Debug)]
pub struct Info {
    pub title: String<48>,
    pub detail: String<64>,
    pub tone: Option<Tone>,
}

impl Info {
    pub const EMPTY: Info = Info { title: String::new(), detail: String::new(), tone: None };

    /// From a file's name and the summary of its start: the metadata's name if it has one, else
    /// the file's (underscores as spaces); the detail is the gear, the tone, the kind and who
    /// captured it, as far as the metadata says.
    pub fn new(file_name: &str, s: &Summary) -> Info {
        let m = &s.meta;
        let mut title: String<48> = String::new();
        let source = if m.name.trim().is_empty() { profile_name(file_name) } else { text_of(m.name.trim()) };
        let mut space = false;
        for c in source.trim().chars() {
            let c = if c == '_' { ' ' } else { c };
            if c == ' ' && (space || title.is_empty()) {
                continue;
            }
            space = c == ' ';
            if title.push(c).is_err() {
                break;
            }
        }
        while title.ends_with(' ') {
            title.pop();
        }
        let mut detail: String<64> = String::new();
        let mut part = |s: &str| {
            if s.is_empty() {
                return;
            }
            if !detail.is_empty() {
                let _ = detail.push_str(", ");
            }
            for c in s.chars() {
                if detail.push(c).is_err() {
                    break;
                }
            }
        };
        let mut gear: String<64> = String::new();
        for p in [m.make.trim(), m.model.trim()] {
            if !p.is_empty() {
                if !gear.is_empty() {
                    let _ = gear.push(' ');
                }
                let _ = gear.push_str(p);
            }
        }
        part(gear.as_str());
        part(m.tone.map_or("", Tone::text));
        part(m.gear.map_or("", Gear::text));
        if !m.by.trim().is_empty() {
            let mut by: String<36> = String::new();
            let _ = by.push_str("BY ");
            let _ = by.push_str(m.by.trim());
            part(by.as_str());
        }
        Info { title, detail, tone: m.tone }
    }
}

fn text_of(s: &str) -> String<40> {
    let mut out = String::new();
    for c in s.chars() {
        if out.push(c).is_err() {
            break;
        }
    }
    out
}

/// A row of the browser's list: the way up, a folder or a profile (by their index in the
/// listing), or a heading over a group of profiles of one tone.
#[derive(Clone, Copy, PartialEq, Eq, Debug)]
pub enum Row {
    Up,
    Folder(u16),
    Heading(Option<Tone>),
    Profile(u16),
}

impl Row {
    pub const fn selectable(self) -> bool {
        !matches!(self, Row::Heading(_))
    }
}

/// A heading's words: the tone, or the profiles that don't say one.
pub const fn heading_text(tone: Option<Tone>) -> &'static str {
    match tone {
        Some(t) => t.text(),
        None => "OTHER",
    }
}

fn lower_cmp(a: &str, b: &str) -> core::cmp::Ordering {
    a.bytes().map(|c| c.to_ascii_lowercase()).cmp(b.bytes().map(|c| c.to_ascii_lowercase()))
}

/// Puts a listing in order in `rows` (at least `entries.len() + 6` long), and returns how many:
/// the way up, the folders by name, then the profiles by tone, cleanest first, and by title, with
/// a heading over each tone (the ones without a tone last, as OTHER). If no profile says its tone
/// there are no headings. `infos[i]` is the profile at `entries[i]`; `order` is scratch, as long
/// as `entries`.
pub fn arrange(entries: &[Entry], infos: &[Info], order: &mut [u16], rows: &mut [Row]) -> usize {
    let mut n = 0;
    let mut put = |rows: &mut [Row], r: Row| {
        rows[n] = r;
        n += 1;
    };
    if entries.iter().any(Entry::is_up) {
        put(rows, Row::Up);
    }
    let mut k = 0;
    for (i, e) in entries.iter().enumerate() {
        if e.is_dir && !e.is_up() {
            order[k] = i as u16;
            k += 1;
        }
    }
    order[..k].sort_unstable_by(|&a, &b| lower_cmp(entries[a as usize].name(), entries[b as usize].name()));
    for &i in &order[..k] {
        put(rows, Row::Folder(i));
    }
    let mut k = 0;
    for (i, e) in entries.iter().enumerate() {
        if !e.is_dir {
            order[k] = i as u16;
            k += 1;
        }
    }
    let rank = |t: Option<Tone>| t.map_or(Tone::ALL.len(), |t| t as usize);
    order[..k].sort_unstable_by(|&a, &b| {
        let (ia, ib) = (&infos[a as usize], &infos[b as usize]);
        rank(ia.tone).cmp(&rank(ib.tone))
            .then_with(|| lower_cmp(ia.title.as_str(), ib.title.as_str()))
            .then_with(|| entries[a as usize].short().cmp(entries[b as usize].short()))
    });
    let headed = order[..k].iter().any(|&i| infos[i as usize].tone.is_some());
    let mut group: Option<Option<Tone>> = None;
    for &i in &order[..k] {
        let tone = infos[i as usize].tone;
        if headed && group != Some(tone) {
            put(rows, Row::Heading(tone));
            group = Some(tone);
        }
        put(rows, Row::Profile(i));
    }
    n
}

/// How many rows the cursor can be on.
pub fn selectable(rows: &[Row]) -> usize {
    rows.iter().filter(|r| r.selectable()).count()
}

/// Which row the cursor's `at` (counting only rows it can be on) is.
pub fn row_of(rows: &[Row], at: usize) -> Option<usize> {
    rows.iter().enumerate().filter(|(_, r)| r.selectable()).nth(at).map(|(i, _)| i)
}

/// The first row of a screenful of `shown`, keeping the cursor's row in the middle where it can.
pub fn top_row(rows: &[Row], at: usize, shown: usize) -> usize {
    let hi = row_of(rows, at).unwrap_or(0);
    hi.saturating_sub(shown / 2).min(rows.len().saturating_sub(shown))
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn turning_walks_the_rows_wrapping_and_a_click_opens_the_row() {
        let mut c = BrowserCursor::default();
        c.reset(3);
        assert_eq!(c.event(Event::Turn(1)), None);
        assert_eq!(c.at, 1);
        c.event(Event::Turn(2));
        assert_eq!(c.at, 0);
        c.event(Event::Turn(-1));
        assert_eq!(c.at, 2);
        assert_eq!(c.event(Event::Click), Some(BrowserAction::Open(2)));
        assert_eq!(c.event(Event::Hold), None);
        c.reset(5);
        assert_eq!(c.at, 0);
    }

    #[test]
    fn an_empty_list_does_nothing() {
        let mut c = BrowserCursor::default();
        assert_eq!(c.event(Event::Turn(3)), None);
        assert_eq!(c.at, 0);
        assert_eq!(c.event(Event::Click), None);
    }

    #[test]
    fn the_screenful_keeps_the_highlight_in_the_middle_where_it_can() {
        let mut c = BrowserCursor { at: 0, rows: 40 };
        assert_eq!(c.top(11), 0);
        c.at = 5;
        assert_eq!(c.top(11), 0);
        c.at = 20;
        assert_eq!(c.top(11), 15);
        c.at = 39;
        assert_eq!(c.top(11), 29);
        let short = BrowserCursor { at: 2, rows: 4 };
        assert_eq!(short.top(11), 0);
    }

    #[test]
    fn a_path_goes_in_and_out_of_folders() {
        let mut p = DrivePath::default();
        assert!(p.is_top());
        assert!(p.enter("NAM", "nam"));
        assert!(p.enter("PLEXIC~1", "Plexi Captures"));
        assert_eq!(p.as_str(), "NAM/PLEXIC~1");
        assert_eq!(p.shown(100), "nam/Plexi Captures");
        assert_eq!(p.of("CRUNCH.NAM").unwrap().as_str(), "NAM/PLEXIC~1/CRUNCH.NAM");
        p.up();
        assert_eq!(p.as_str(), "NAM");
        p.up();
        assert!(p.is_top());
        assert_eq!(p.of("TOP.NAM").unwrap().as_str(), "TOP.NAM");
    }

    #[test]
    fn a_path_shows_its_end_if_it_doesnt_all_fit() {
        let mut p = DrivePath::default();
        p.enter("AMPS", "Amplifiers");
        p.enter("BRITIS~1", "British Stacks");
        assert_eq!(p.shown(14), "British Stacks");
        assert_eq!(p.shown(5), "tacks");
    }

    #[test]
    fn a_path_too_deep_to_keep_is_refused() {
        let mut p = DrivePath::default();
        let mut entered = 0;
        while p.enter("FOLDER~1", "Folder") {
            entered += 1;
        }
        assert_eq!(entered, (PATH_BYTES + 1) / 9);
        assert!(p.as_str().len() <= PATH_BYTES);
    }

    #[test]
    fn a_profile_is_named_after_its_file() {
        assert_eq!(profile_name("Plexi Crunch.nam").as_str(), "Plexi Crunch");
        assert_eq!(profile_name("CLEAN.NAM").as_str(), "CLEAN");
        assert_eq!(profile_name("odd.json").as_str(), "odd.json");
        assert_eq!(profile_name(".nam").as_str(), ".nam");
        assert_eq!(profile_name(&"x".repeat(60)).len(), 40);
    }

    use crate::namfile::{Meta, Summary, Verdict};

    fn summary(name: &str, tone: Option<Tone>) -> Summary {
        let mut meta = Meta::default();
        meta.name.push_str(name).unwrap();
        meta.tone = tone;
        Summary { verdict: Verdict::A2, meta }
    }

    fn listing() -> (std::vec::Vec<Entry>, std::vec::Vec<Info>) {
        let none = summary("", None);
        let p = |short: &str, name: &str, tone| (Entry::named(short, short, false), Info::new(short, &summary(name, tone)));
        let items = [
            (Entry::up(), Info::new("..", &none)),
            (Entry::named("ZETA", "Zeta", true), Info::new("Zeta", &none)),
            p("A.NAM", "Twin", Some(Tone::Clean)),
            (Entry::named("ALPHA", "alpha", true), Info::new("alpha", &none)),
            p("B.NAM", "Brit", Some(Tone::HiGain)),
            p("C.NAM", "Mystery", None),
            p("D.NAM", "ac30", Some(Tone::Clean)),
            p("E.NAM", "Ampeg", Some(Tone::HiGain)),
            p("F.NAM", "Muff", Some(Tone::Fuzz)),
        ];
        items.into_iter().unzip()
    }

    #[test]
    fn a_listing_is_the_way_up_then_folders_then_profiles_by_tone_and_title() {
        let (entries, infos) = listing();
        let mut order = std::vec![0u16; entries.len()];
        let mut rows = std::vec![Row::Up; entries.len() + 6];
        let n = arrange(&entries, &infos, &mut order, &mut rows);
        let shown: std::vec::Vec<std::string::String> = rows[..n].iter().map(|r| match *r {
            Row::Up => "..".into(),
            Row::Folder(i) => std::format!("{}/", entries[i as usize].name()),
            Row::Heading(t) => std::format!("-- {} --", heading_text(t)),
            Row::Profile(i) => infos[i as usize].title.as_str().into(),
        }).collect();
        assert_eq!(shown, ["..", "alpha/", "Zeta/", "-- CLEAN --", "ac30", "Twin", "-- HIGH GAIN --", "Ampeg", "Brit",
                           "-- FUZZ --", "Muff", "-- OTHER --", "Mystery"]);
        let rows = &rows[..n];
        assert_eq!(selectable(rows), 9);
        assert_eq!(row_of(rows, 0), Some(0));
        assert_eq!(row_of(rows, 3), Some(4), "the cursor's fourth stop is the first profile, past its heading");
        assert_eq!(row_of(rows, 5), Some(7));
        assert_eq!(row_of(rows, 9), None);
        assert_eq!(top_row(rows, 0, 5), 0);
        assert_eq!(top_row(rows, 5, 5), 5);
        assert_eq!(top_row(rows, 8, 5), 8);
        assert!(rows.iter().all(|r| !matches!(r, Row::Heading(_)) || !r.selectable()));
    }

    #[test]
    fn without_tones_there_are_no_headings() {
        let none = summary("", None);
        let entries = [Entry::named("B.NAM", "b.nam", false), Entry::named("A.NAM", "a.nam", false)];
        let infos = [Info::new("zed.nam", &summary("Zed", None)), Info::new("a.nam", &none)];
        let mut order = [0u16; 2];
        let mut rows = [Row::Up; 8];
        let n = arrange(&entries, &infos, &mut order, &mut rows);
        assert_eq!(&rows[..n], &[Row::Profile(1), Row::Profile(0)]);
        assert_eq!(selectable(&rows[..n]), 2);
    }

    #[test]
    fn a_title_is_the_metadata_name_else_the_file_name_tidied() {
        let s = summary("  Plexi  Crunch ", None);
        assert_eq!(Info::new("plexi_crunch_a2.nam", &s).title.as_str(), "Plexi Crunch");
        let s = summary("", None);
        assert_eq!(Info::new("plexi__crunch_A2 full.nam", &s).title.as_str(), "plexi crunch A2 full");
        assert_eq!(Info::new("CLEAN.NAM", &s).title.as_str(), "CLEAN");
    }

    #[test]
    fn the_detail_says_what_the_metadata_does() {
        let mut s = summary("Brit", Some(Tone::HiGain));
        s.meta.make.push_str("Marshall").unwrap();
        s.meta.model.push_str("JCM800").unwrap();
        s.meta.gear = Some(Gear::AmpCab);
        s.meta.by.push_str("tone3000").unwrap();
        let i = Info::new("x.nam", &s);
        assert_eq!(i.detail.as_str(), "Marshall JCM800, HIGH GAIN, AMP AND CAB, BY tone3000");
        assert_eq!(i.tone, Some(Tone::HiGain));
        let mut s = summary("Brit", None);
        s.meta.model.push_str("JCM800").unwrap();
        assert_eq!(Info::new("x.nam", &s).detail.as_str(), "JCM800");
        assert_eq!(Info::new("x.nam", &summary("Brit", None)).detail.as_str(), "");
    }
}
