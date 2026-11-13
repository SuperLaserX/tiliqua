//! Reading a `.nam` file: enough JSON to find the networks in it, check that they are A2 and
//! take their metadata, then stream the weights through twice, once for their ranges and once
//! to quantise them (`quant.rs`). Nothing is copied: the file stays where the drive put it,
//! and values are byte ranges into it.

use crate::quant::{self, LayerMax, Maxes, MAX_CHANNELS, MAX_LAYERS};

pub const NUM_LAYERS: usize = 23;
pub const KERNEL_SIZES: [u32; NUM_LAYERS] = [6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 15, 15, 6, 6, 6, 6, 6, 6, 6];
pub const DILATIONS: [u32; NUM_LAYERS] =
    [1, 3, 7, 17, 41, 101, 239, 1, 3, 7, 17, 41, 101, 239, 1, 13, 1, 3, 7, 17, 41, 101, 239];

/// Why a file can't be used, in the words the screen shows.
#[derive(Clone, Copy, PartialEq, Eq, Debug)]
pub enum NotA2 {
    NotJson,
    NotNam,
    /// A WaveNet, but not the A2 shape (which part differs).
    Shape(&'static str),
    /// An architecture this engine doesn't run (LSTM, a general WaveNet...).
    Architecture,
    WrongWeightCount,
    BadNumber,
}

impl NotA2 {
    pub const fn text(self) -> &'static str {
        match self {
            NotA2::NotJson => "NOT A NAM FILE",
            NotA2::NotNam => "NOT A NAM FILE",
            NotA2::Shape(_) => "NOT AN A2 PROFILE",
            NotA2::Architecture => "ONLY A2 PROFILES RUN HERE",
            NotA2::WrongWeightCount => "WEIGHTS DON'T MATCH THE SHAPE",
            NotA2::BadNumber => "A WEIGHT ISN'T A NUMBER",
        }
    }
}

/// A byte range of the file.
#[derive(Clone, Copy, PartialEq, Eq, Debug)]
pub struct Span {
    pub start: usize,
    pub end: usize,
}

/// One A2 network in the file.
#[derive(Clone, Copy, PartialEq, Debug)]
pub struct Network {
    pub channels: usize,
    /// The `weights` array, brackets included.
    pub weights: Span,
    pub head_scale: f64,
    pub loudness: Option<f64>,
    pub input_level_dbu: Option<f64>,
    pub output_level_dbu: Option<f64>,
    pub sample_rate: Option<f64>,
}

impl Network {
    pub fn weight_count(&self) -> usize {
        weight_count(self.channels)
    }
}

pub fn weight_count(c: usize) -> usize {
    let per_layer: usize = KERNEL_SIZES.iter().map(|&k| k as usize * c * c + c + c + c * c + c).sum();
    c + per_layer + 16 * c + 1 + 1
}

/// The networks found: at most Lite and Full, narrowest first.
#[derive(Clone, Copy, PartialEq, Debug, Default)]
pub struct Networks {
    pub found: [Option<Network>; 2],
}

impl Networks {
    pub fn count(&self) -> usize {
        self.found.iter().filter(|n| n.is_some()).count()
    }

    pub fn widest(&self) -> Option<&Network> {
        self.found.iter().rev().find_map(|n| n.as_ref())
    }

    pub fn narrowest(&self) -> Option<&Network> {
        self.found.iter().find_map(|n| n.as_ref())
    }

    fn add(&mut self, n: Network) {
        // Narrowest first.
        if self.found[0].is_none() {
            self.found[0] = Some(n);
        } else if n.channels < self.found[0].unwrap().channels {
            self.found[1] = self.found[0];
            self.found[0] = Some(n);
        } else {
            self.found[1] = Some(n);
        }
    }
}

// ---- JSON ---------------------------------------------------------------------------------

pub struct Json<'a> {
    pub bytes: &'a [u8],
}

type JResult<T> = Result<T, NotA2>;

impl<'a> Json<'a> {
    pub fn new(bytes: &'a [u8]) -> Json<'a> {
        Json { bytes }
    }

    fn at(&self, i: usize) -> Option<u8> {
        self.bytes.get(i).copied()
    }

    fn skip_ws(&self, mut i: usize) -> usize {
        while let Some(b) = self.at(i) {
            if b == b' ' || b == b'\n' || b == b'\r' || b == b'\t' {
                i += 1;
            } else {
                break;
            }
        }
        i
    }

    /// From a string's opening quote to after its closing quote.
    fn skip_string(&self, mut i: usize) -> JResult<usize> {
        if self.at(i) != Some(b'"') {
            return Err(NotA2::NotJson);
        }
        i += 1;
        while let Some(b) = self.at(i) {
            match b {
                b'\\' => i += 2,
                b'"' => return Ok(i + 1),
                _ => i += 1,
            }
        }
        Err(NotA2::NotJson)
    }

    /// From a value's first byte to after its last.
    pub fn skip_value(&self, i: usize) -> JResult<usize> {
        let i = self.skip_ws(i);
        match self.at(i).ok_or(NotA2::NotJson)? {
            b'"' => self.skip_string(i),
            b'{' | b'[' => {
                // Nesting without recursion: strings are skipped whole.
                let mut depth = 0i32;
                let mut j = i;
                while let Some(b) = self.at(j) {
                    match b {
                        b'"' => {
                            j = self.skip_string(j)?;
                            continue;
                        }
                        b'{' | b'[' => depth += 1,
                        b'}' | b']' => {
                            depth -= 1;
                            if depth == 0 {
                                return Ok(j + 1);
                            }
                        }
                        _ => {}
                    }
                    j += 1;
                }
                Err(NotA2::NotJson)
            }
            _ => {
                let mut j = i;
                while let Some(b) = self.at(j) {
                    if b == b',' || b == b'}' || b == b']' || b == b' ' || b == b'\n' || b == b'\r' || b == b'\t' {
                        break;
                    }
                    j += 1;
                }
                if j == i {
                    return Err(NotA2::NotJson);
                }
                Ok(j)
            }
        }
    }

    /// The value of `key` in the object starting at `obj` (its `{`).
    pub fn get(&self, obj: Span, key: &str) -> JResult<Option<Span>> {
        let mut i = self.skip_ws(obj.start);
        if self.at(i) != Some(b'{') {
            return Err(NotA2::NotJson);
        }
        i += 1;
        loop {
            i = self.skip_ws(i);
            match self.at(i) {
                Some(b'}') => return Ok(None),
                Some(b',') => {
                    i += 1;
                    continue;
                }
                Some(b'"') => {}
                _ => return Err(NotA2::NotJson),
            }
            let key_end = self.skip_string(i)?;
            let name = &self.bytes[i + 1..key_end - 1];
            i = self.skip_ws(key_end);
            if self.at(i) != Some(b':') {
                return Err(NotA2::NotJson);
            }
            i = self.skip_ws(i + 1);
            let value_end = self.skip_value(i)?;
            if name == key.as_bytes() {
                return Ok(Some(Span { start: i, end: value_end }));
            }
            i = value_end;
        }
    }

    /// Iterates an array's values.
    pub fn items(&self, arr: Span) -> Items<'_, 'a> {
        let i = self.skip_ws(arr.start);
        Items { json: self, i: i + 1, started: false, failed: self.at(i) != Some(b'['), end: arr.end }
    }

    pub fn str_eq(&self, v: Span, text: &str) -> bool {
        let s = &self.bytes[v.start..v.end];
        s.len() == text.len() + 2 && s[0] == b'"' && &s[1..s.len() - 1] == text.as_bytes()
    }

    pub fn is_null(&self, v: Span) -> bool {
        &self.bytes[v.start..v.end] == b"null"
    }

    pub fn is_true(&self, v: Span) -> bool {
        &self.bytes[v.start..v.end] == b"true"
    }

    pub fn is_false(&self, v: Span) -> bool {
        &self.bytes[v.start..v.end] == b"false"
    }

    pub fn starts_with(&self, v: Span, b: u8) -> bool {
        self.at(v.start) == Some(b)
    }

    pub fn number(&self, v: Span) -> JResult<f64> {
        let s = core::str::from_utf8(&self.bytes[v.start..v.end]).map_err(|_| NotA2::BadNumber)?;
        s.parse::<f64>().map_err(|_| NotA2::BadNumber)
    }

    pub fn integer(&self, v: Span) -> JResult<i64> {
        let n = self.number(v)?;
        if n != (n as i64) as f64 {
            return Err(NotA2::BadNumber);
        }
        Ok(n as i64)
    }

    /// How many values an array has.
    pub fn len(&self, arr: Span) -> JResult<usize> {
        let mut n = 0;
        for item in self.items(arr) {
            item?;
            n += 1;
        }
        Ok(n)
    }
}

pub struct Items<'j, 'a> {
    json: &'j Json<'a>,
    i: usize,
    started: bool,
    failed: bool,
    end: usize,
}

impl Iterator for Items<'_, '_> {
    type Item = JResult<Span>;

    fn next(&mut self) -> Option<JResult<Span>> {
        if self.failed {
            self.failed = false;
            return Some(Err(NotA2::NotJson));
        }
        let mut i = self.json.skip_ws(self.i);
        match self.json.at(i) {
            Some(b']') => return None,
            Some(b',') if self.started => i = self.json.skip_ws(i + 1),
            Some(_) if !self.started => {}
            _ => return Some(Err(NotA2::NotJson)),
        }
        if i >= self.end {
            return Some(Err(NotA2::NotJson));
        }
        self.started = true;
        match self.json.skip_value(i) {
            Ok(end) => {
                self.i = end;
                Some(Ok(Span { start: i, end }))
            }
            Err(e) => Some(Err(e)),
        }
    }
}

// ---- The networks ---------------------------------------------------------------------------

fn opt_number(j: &Json, obj: Span, key: &str) -> JResult<Option<f64>> {
    match j.get(obj, key)? {
        Some(v) if !j.is_null(v) => Ok(Some(j.number(v)?)),
        _ => Ok(None),
    }
}

/// Whether an entry is inactive: missing, null, false or `{"active": false}`.
fn inactive(j: &Json, obj: Span, key: &str) -> JResult<bool> {
    let Some(v) = j.get(obj, key)? else { return Ok(true) };
    if j.is_null(v) || j.is_false(v) {
        return Ok(true);
    }
    if j.starts_with(v, b'{') {
        return Ok(match j.get(v, "active")? {
            Some(a) => !j.is_true(a),
            None => true,
        });
    }
    Ok(false)
}

fn all_items(j: &Json, arr: Span, n: usize, mut test: impl FnMut(Span) -> JResult<bool>) -> JResult<bool> {
    let mut count = 0;
    for item in j.items(arr) {
        if !test(item?)? {
            return Ok(false);
        }
        count += 1;
    }
    Ok(count == n)
}

/// The channel count of a WaveNet `config` if it is an A2 (`a2.check_shape`).
fn check_shape(j: &Json, config: Span) -> JResult<usize> {
    let shape = |why| Err(NotA2::Shape(why));
    let Some(layers) = j.get(config, "layers")? else { return shape("no layers") };
    if j.len(layers)? != 1 {
        return shape("not one layer array");
    }
    if let Some(h) = j.get(config, "head")? {
        if !j.is_null(h) {
            return shape("post-stack head");
        }
    }
    if let Some(cd) = j.get(config, "condition_dsp")? {
        if !j.is_null(cd) {
            return shape("condition DSP");
        }
    }
    match j.get(config, "head_scale")? {
        Some(hs) if !j.is_null(hs) => j.number(hs)?,
        _ => return shape("no head scale"),
    };
    if let Some(ic) = j.get(config, "in_channels")? {
        if j.integer(ic)? != 1 {
            return shape("input channels");
        }
    }
    let la = j.items(layers).next().unwrap()?;
    for key in ["input_size", "condition_size"] {
        match j.get(la, key)? {
            Some(v) if j.integer(v)? == 1 => {}
            _ => return shape("input size"),
        }
    }
    let c = match j.get(la, "channels")? {
        Some(v) => j.integer(v)? as usize,
        None => return shape("channels"),
    };
    if c != 3 && c != 8 {
        return shape("channels");
    }
    if let Some(b) = j.get(la, "bottleneck")? {
        if j.integer(b)? as usize != c {
            return shape("bottleneck");
        }
    }
    let Some(d) = j.get(la, "dilations")? else { return shape("dilations") };
    let mut k = 0;
    if !all_items(j, d, NUM_LAYERS, |v| {
        let ok = j.integer(v)? == DILATIONS[k.min(NUM_LAYERS - 1)] as i64;
        k += 1;
        Ok(ok)
    })? {
        return shape("dilations");
    }
    let Some(ks) = j.get(la, "kernel_sizes")? else { return shape("kernel sizes") };
    k = 0;
    if !all_items(j, ks, NUM_LAYERS, |v| {
        let ok = j.integer(v)? == KERNEL_SIZES[k.min(NUM_LAYERS - 1)] as i64;
        k += 1;
        Ok(ok)
    })? {
        return shape("kernel sizes");
    }
    let Some(act) = j.get(la, "activation")? else { return shape("activation") };
    if !j.starts_with(act, b'[')
        || !all_items(j, act, NUM_LAYERS, |a| {
            if !j.starts_with(a, b'{') {
                return Ok(false);
            }
            let ty = j.get(a, "type")?.is_some_and(|t| j.str_eq(t, "LeakyReLU"));
            let slope = match j.get(a, "negative_slope")? {
                Some(s) => (j.number(s)? - 0.01).abs() < 1e-7,
                None => true,
            };
            Ok(ty && slope)
        })?
    {
        return shape("activation");
    }
    if let Some(g) = j.get(la, "gating_mode")? {
        let none = |v: Span| Ok(j.str_eq(v, "none") || j.str_eq(v, "None") || j.str_eq(v, "NONE"));
        let ok = if j.starts_with(g, b'[') { all_items(j, g, NUM_LAYERS, none)? } else { none(g)? };
        if !ok {
            return shape("gated");
        }
    }
    if let Some(g) = j.get(la, "gated")? {
        if j.is_true(g) {
            return shape("gated");
        }
    }
    if let Some(s) = j.get(la, "secondary_activation")? {
        let ok = if j.starts_with(s, b'[') { all_items(j, s, NUM_LAYERS, |v| Ok(j.is_null(v)))? } else { j.is_null(s) };
        if !ok {
            return shape("secondary activation");
        }
    }
    if !inactive(j, la, "head1x1")? {
        return shape("head 1x1");
    }
    match j.get(la, "layer1x1")? {
        Some(l1) if j.starts_with(l1, b'{') => {
            if !j.get(l1, "active")?.is_some_and(|a| j.is_true(a)) {
                return shape("layer 1x1");
            }
            if let Some(g) = j.get(l1, "groups")? {
                if j.integer(g)? != 1 {
                    return shape("layer 1x1 groups");
                }
            }
        }
        _ => return shape("layer 1x1"),
    }
    match j.get(la, "head")? {
        Some(h) if j.starts_with(h, b'{') => {
            let out = j.get(h, "out_channels")?.map(|v| j.integer(v)).transpose()?;
            let ks = j.get(h, "kernel_size")?.map(|v| j.integer(v)).transpose()?;
            let bias = j.get(h, "bias")?.is_some_and(|b| j.is_true(b));
            let dil = j.get(h, "head_dilation")?.map(|v| j.integer(v)).transpose()?.unwrap_or(1);
            if out != Some(1) || ks != Some(16) || !bias || dil != 1 {
                return shape("head");
            }
        }
        _ => return shape("head"),
    }
    for key in [
        "conv_pre_film", "conv_post_film", "input_mixin_pre_film", "input_mixin_post_film",
        "activation_pre_film", "activation_post_film", "layer1x1_post_film", "head1x1_post_film", "film",
    ] {
        if !inactive(j, la, key)? {
            return shape("film");
        }
    }
    for key in ["groups_input", "groups_input_mixin"] {
        if let Some(g) = j.get(la, key)? {
            if j.integer(g)? != 1 {
                return shape("groups");
            }
        }
    }
    if let Some(s) = j.get(la, "slimmable")? {
        if !j.is_null(s) {
            return shape("slimmable layers");
        }
    }
    Ok(c)
}

/// One `WaveNet` entry (a whole file, or a submodel).
fn wavenet(j: &Json, entry: Span) -> JResult<Network> {
    let Some(arch) = j.get(entry, "architecture")? else { return Err(NotA2::NotNam) };
    if !j.str_eq(arch, "WaveNet") {
        return Err(NotA2::Architecture);
    }
    let Some(config) = j.get(entry, "config")? else { return Err(NotA2::NotNam) };
    let channels = check_shape(j, config)?;
    let Some(weights) = j.get(entry, "weights")? else { return Err(NotA2::NotNam) };
    if !j.starts_with(weights, b'[') {
        return Err(NotA2::NotNam);
    }
    let head_scale = j.number(j.get(config, "head_scale")?.unwrap())?;
    let (mut loudness, mut input_level_dbu, mut output_level_dbu) = (None, None, None);
    if let Some(meta) = j.get(entry, "metadata")? {
        if j.starts_with(meta, b'{') {
            loudness = opt_number(j, meta, "loudness")?;
            input_level_dbu = opt_number(j, meta, "input_level_dbu")?;
            output_level_dbu = opt_number(j, meta, "output_level_dbu")?;
        }
    }
    let sample_rate = opt_number(j, entry, "sample_rate")?;
    Ok(Network { channels, weights, head_scale, loudness, input_level_dbu, output_level_dbu, sample_rate })
}

/// Every A2 network in a `.nam` (`a2.load_nam`): a plain WaveNet file gives one, a
/// SlimmableContainer one per A2 submodel, the container's metadata filling what a submodel
/// leaves out. The error is the last reason a network was refused.
pub fn scan(bytes: &[u8]) -> Result<Networks, NotA2> {
    let j = Json::new(bytes);
    let doc = Span { start: 0, end: bytes.len() };
    let i = j.skip_ws(0);
    if j.at(i) != Some(b'{') {
        return Err(NotA2::NotJson);
    }
    let doc = Span { start: i, end: doc.end };
    let Some(arch) = j.get(doc, "architecture")? else { return Err(NotA2::NotNam) };
    let mut out = Networks::default();
    if j.str_eq(arch, "SlimmableContainer") {
        let Some(config) = j.get(doc, "config")? else { return Err(NotA2::NotNam) };
        let Some(subs) = j.get(config, "submodels")? else { return Err(NotA2::NotNam) };
        let top_meta = j.get(doc, "metadata")?.filter(|m| j.starts_with(*m, b'{'));
        let top_rate = opt_number(&j, doc, "sample_rate")?;
        let mut last = NotA2::NotNam;
        for sub in j.items(subs) {
            let sub = sub?;
            let Some(model) = j.get(sub, "model")? else { continue };
            match wavenet(&j, model) {
                Ok(mut n) => {
                    if let Some(meta) = top_meta {
                        if n.loudness.is_none() {
                            n.loudness = opt_number(&j, meta, "loudness")?;
                        }
                        if n.input_level_dbu.is_none() {
                            n.input_level_dbu = opt_number(&j, meta, "input_level_dbu")?;
                        }
                        if n.output_level_dbu.is_none() {
                            n.output_level_dbu = opt_number(&j, meta, "output_level_dbu")?;
                        }
                    }
                    if n.sample_rate.is_none() {
                        n.sample_rate = top_rate;
                    }
                    if out.count() < 2 {
                        out.add(n);
                    }
                }
                Err(e) => last = e,
            }
        }
        if out.count() == 0 {
            return Err(last);
        }
    } else {
        out.add(wavenet(&j, doc)?);
    }
    Ok(out)
}

// ---- The weights ----------------------------------------------------------------------------

/// Which weight a flat index is (`a2.unpack_weights`'s order).
#[derive(Clone, Copy, PartialEq, Eq, Debug)]
pub enum Class {
    Rechannel,
    ConvW(usize),
    ConvB(usize),
    Mixin(usize),
    L1x1W(usize),
    L1x1B(usize),
    HeadW,
    HeadB,
    HeadScale,
}

/// Where each class starts in the flat list, for `c` channels.
pub struct Layout {
    pub c: usize,
    pub layer_start: [usize; MAX_LAYERS],
    pub head_w: usize,
    pub total: usize,
}

impl Layout {
    pub fn new(c: usize) -> Layout {
        let mut layer_start = [0; MAX_LAYERS];
        let mut pos = c;
        for (l, k) in KERNEL_SIZES.iter().enumerate() {
            layer_start[l] = pos;
            pos += *k as usize * c * c + c + c + c * c + c;
        }
        Layout { c, layer_start, head_w: pos, total: pos + 16 * c + 2 }
    }

    pub fn class_of(&self, i: usize) -> Class {
        let c = self.c;
        if i < c {
            return Class::Rechannel;
        }
        if i >= self.head_w {
            return match i - self.head_w {
                n if n < 16 * c => Class::HeadW,
                n if n == 16 * c => Class::HeadB,
                _ => Class::HeadScale,
            };
        }
        let l = (0..NUM_LAYERS).rev().find(|&l| i >= self.layer_start[l]).unwrap();
        let k = KERNEL_SIZES[l] as usize;
        let off = i - self.layer_start[l];
        if off < k * c * c {
            Class::ConvW(l)
        } else if off < k * c * c + c {
            Class::ConvB(l)
        } else if off < k * c * c + 2 * c {
            Class::Mixin(l)
        } else if off < k * c * c + 2 * c + c * c {
            Class::L1x1W(l)
        } else {
            Class::L1x1B(l)
        }
    }

    /// Indices into the flat list (file order: out, in, tap for a convolution).
    pub fn conv_w(&self, l: usize, k: usize, i: usize, j: usize) -> usize {
        self.layer_start[l] + (i * self.c + j) * KERNEL_SIZES[l] as usize + k
    }
    pub fn conv_b(&self, l: usize, i: usize) -> usize {
        self.layer_start[l] + KERNEL_SIZES[l] as usize * self.c * self.c + i
    }
    pub fn mixin(&self, l: usize, i: usize) -> usize {
        self.conv_b(l, 0) + self.c + i
    }
    pub fn l1x1_w(&self, l: usize, i: usize, b: usize) -> usize {
        self.mixin(l, 0) + self.c + i * self.c + b
    }
    pub fn l1x1_b(&self, l: usize, i: usize) -> usize {
        self.l1x1_w(l, 0, 0) + self.c * self.c + i
    }
    pub fn head_w(&self, k: usize, b: usize) -> usize {
        self.head_w + b * 16 + k
    }
    pub fn head_b(&self) -> usize {
        self.head_w + 16 * self.c
    }
}

/// Calls `f(index, value)` for every weight of the network, in order.
pub fn each_weight(bytes: &[u8], n: &Network, mut f: impl FnMut(usize, f64)) -> JResult<usize> {
    let j = Json::new(bytes);
    let mut i = 0;
    for item in j.items(n.weights) {
        let v = j.number(item?)?;
        f(i, v);
        i += 1;
    }
    Ok(i)
}

/// The first pass: the largest magnitude of every class, and the head scale.
pub fn maxes(bytes: &[u8], n: &Network) -> JResult<(Maxes, f64)> {
    let layout = Layout::new(n.channels);
    let mut m = Maxes { layers: [LayerMax::default(); MAX_LAYERS], ..Default::default() };
    let mut head_scale = n.head_scale;
    let count = each_weight(bytes, n, |i, v| {
        let a = if v < 0.0 { -v } else { v };
        let max = |slot: &mut f64| if a > *slot { *slot = a };
        match layout.class_of(i) {
            Class::Rechannel => max(&mut m.rechannel),
            Class::ConvW(l) => max(&mut m.layers[l].conv_w),
            Class::ConvB(l) => max(&mut m.layers[l].conv_b),
            Class::Mixin(l) => max(&mut m.layers[l].mixin),
            Class::L1x1W(l) => max(&mut m.layers[l].l1x1_w),
            Class::L1x1B(l) => max(&mut m.layers[l].l1x1_b),
            Class::HeadW => max(&mut m.head_w),
            Class::HeadB => max(&mut m.head_b),
            Class::HeadScale => head_scale = v,
        }
    })?;
    if count != layout.total {
        return Err(NotA2::WrongWeightCount);
    }
    Ok((m, head_scale))
}

/// The second pass: every weight quantised with its class's exponent, into `out` in the file's
/// order (`out` holds at least `weight_count` entries). The head scale's slot gets 0.
pub fn quantise(bytes: &[u8], n: &Network, fmt: &quant::Formats, plan: &[quant::LayerPlan],
                e: &quant::Exponents, out: &mut [i32]) -> JResult<()> {
    let layout = Layout::new(n.channels);
    let cs = quant::CONST_SHIFT as i32;
    let count = each_weight(bytes, n, |i, v| {
        let frac = match layout.class_of(i) {
            Class::Rechannel => e.lin_frac - fmt.x_frac as i32,
            Class::ConvW(l) => e.conv_frac[l],
            Class::ConvB(l) => plan[l].hist_frac as i32 + e.conv_frac[l] - cs,
            Class::Mixin(l) => plan[l].hist_frac as i32 + e.conv_frac[l] - fmt.x_frac as i32,
            Class::L1x1W(_) => e.lin_frac - fmt.z_frac as i32,
            Class::L1x1B(_) => e.lin_frac - cs,
            Class::HeadW => e.head_frac,
            Class::HeadB => fmt.hsum_frac as i32 + e.head_frac - cs,
            Class::HeadScale => {
                out[i] = 0;
                return;
            }
        };
        out[i] = quant::to_q(v, frac);
    })?;
    if count != layout.total {
        return Err(NotA2::WrongWeightCount);
    }
    let _ = MAX_CHANNELS;
    Ok(())
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn the_layout_matches_the_python_unpacking() {
        for c in [3usize, 8] {
            let l = Layout::new(c);
            assert_eq!(l.total, weight_count(c));
            assert_eq!(l.class_of(0), Class::Rechannel);
            assert_eq!(l.class_of(c), Class::ConvW(0));
            assert_eq!(l.class_of(l.conv_b(0, 0)), Class::ConvB(0));
            assert_eq!(l.class_of(l.mixin(0, c - 1)), Class::Mixin(0));
            assert_eq!(l.class_of(l.l1x1_w(5, 1, 2)), Class::L1x1W(5));
            assert_eq!(l.class_of(l.l1x1_b(22, c - 1)), Class::L1x1B(22));
            assert_eq!(l.class_of(l.head_w(15, c - 1)), Class::HeadW);
            assert_eq!(l.class_of(l.head_b()), Class::HeadB);
            assert_eq!(l.class_of(l.total - 1), Class::HeadScale);
            assert_eq!(l.l1x1_b(22, c - 1) + 1, l.head_w);
        }
        assert_eq!(weight_count(3), 1871);
        assert_eq!(weight_count(8), 12146);
    }

    #[test]
    fn a_small_document_scans() {
        let text = br#"{"architecture": "SlimmableContainer", "sample_rate": 48000,
            "metadata": {"loudness": -26.38, "input_level_dbu": 14.76},
            "config": {"submodels": [{"max_value": 0.5, "model": {"architecture": "LSTM", "config": {}, "weights": [1]}}]}}"#;
        assert_eq!(scan(text), Err(NotA2::Architecture));
        let j = Json::new(text);
        let doc = Span { start: 0, end: text.len() };
        let meta = j.get(doc, "metadata").unwrap().unwrap();
        assert_eq!(opt_number(&j, meta, "loudness").unwrap(), Some(-26.38));
        assert_eq!(opt_number(&j, meta, "nothing").unwrap(), None);
        assert_eq!(j.len(j.get(j.get(doc, "config").unwrap().unwrap(), "submodels").unwrap().unwrap()).unwrap(), 1);
        assert_eq!(scan(b"  [1, 2]"), Err(NotA2::NotJson));
        assert_eq!(scan(b"{\"a\": 1}"), Err(NotA2::NotNam));
    }
}
