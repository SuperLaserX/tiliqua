//! Includes the saved-state pages generated for the programs being built:
//! `top.py` writes `ui.rs` next to the `program.rs` named by `BFR_PROGRAM`
//! (see ../model/rustgen.py; ../cpu/build.rs includes `program.rs`).

use std::{env, fs, path::Path};

const STUB: &str = r#"
#[derive(Default, Clone, Copy, PartialEq, EnumIter, IntoStaticStr, Serialize, Deserialize)]
#[strum(serialize_all = "SCREAMING-KEBAB-CASE")]
pub enum Page { #[default] Type, Cv1, Cv2, Settings }

pub const N_SLOTS: usize = 0;

#[derive(Clone, Default)]
pub struct CvOpts {
    pub depth: [DepthOption; N_SLOTS],
}

impl OptionPage for CvOpts {
    fn options(&self) -> OptionVec<'_> { OptionVec::new() }
    fn options_mut(&mut self) -> OptionVecMut<'_> { OptionVecMut::new() }
    fn set_parent_key(&mut self, _parent_key: u32) {}
}

#[derive(Options, Clone)]
pub struct Opts {
    pub tracker: ScreenTracker<Page>,
    #[page(Page::Type)]
    pub kind: TypeOpts,
    #[page(Page::Cv1)]
    pub cv1: CvOpts,
    #[page(Page::Cv2)]
    pub cv2: CvOpts,
    #[page(Page::Settings)]
    pub settings: SettingsOpts,
}

impl Opts {
    pub fn slots(&self) -> impl Iterator<Item = &ParamOption> { core::iter::empty() }
    pub fn slots_mut(&mut self) -> impl Iterator<Item = &mut ParamOption> { core::iter::empty() }
    pub fn depths(&self, c: usize) -> &[DepthOption; N_SLOTS] { if c == 0 { &self.cv1.depth } else { &self.cv2.depth } }
    pub fn depths_mut(&mut self, c: usize) -> &mut [DepthOption; N_SLOTS] { if c == 0 { &mut self.cv1.depth } else { &mut self.cv2.depth } }
}
"#;

/// The dials' geometry (also compiled into bfr-cpu, which tests it).
#[path = "../cpu/src/dial.rs"]
#[allow(dead_code)]
mod dial;

/// The ring's pixels as a table in flash (`screen.rs`), row by row.
fn dial_table(out_dir: &Path) {
    println!("cargo:rerun-if-changed=../cpu/src/dial.rs");
    let mut px = Vec::new();
    dial::ring_pixels(f64::atan2, |x, y, t| px.push(format!("({x}, {y}, {t})")));
    let s = format!("/// The dials' ring pixels (dx, dy, position along the sweep), row by row.\n\
                     pub static RING: [(i8, i8, u16); {}] = [{}];\n", px.len(), px.join(", "));
    fs::write(out_dir.join("dial.rs"), s).unwrap();
}

fn main() {
    dial_table(Path::new(&env::var("OUT_DIR").unwrap()));
    println!("cargo:rerun-if-env-changed=BFR_PROGRAM");
    let out = Path::new(&env::var("OUT_DIR").unwrap()).join("ui.rs");
    match env::var("BFR_PROGRAM") {
        Ok(path) => {
            let ui = Path::new(&path).with_file_name("ui.rs");
            println!("cargo:rerun-if-changed={}", ui.display());
            fs::copy(&ui, &out).unwrap_or_else(|e| panic!("{}: {e}", ui.display()));
        }
        Err(_) => {
            println!("cargo:warning=BFR_PROGRAM is not set: building with no parameters (top.py sets it)");
            fs::write(&out, STUB).unwrap();
        }
    }
}
