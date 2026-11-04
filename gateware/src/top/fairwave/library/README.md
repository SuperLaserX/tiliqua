# FairWave's sound library

A set of sounds to load from a USB drive, and the file format they're written in, so you can change them or
write your own in a text editor.

## Installing

Copy the `FAIRWAVE` folder to the top of a FAT32 USB drive. That's all: the Browser starts in a folder called
`FAIRWAVE` (in any case) if a drive has one, and in the drive's root if not. `.. (UP)` still goes back to the root.

On the Browser screen, turn to a sound. A moment later a line says what it is and what it needs. Click to play it.
It stays in the list, so you can turn to the next and click again. To keep one, go to Patches and save it: the patch
remembers where its tables came from, and finds them again when the drive is in.

Nothing else on the drive changes: the Browser only ever reads it.

## What's there

With nothing patched, `CV 1` is 0 V, and that's C2 (65 Hz) on the basses. Take `TUNE` down an octave for a sub.
Patches marked **needs a gate** are silent until a gate reaches gate 1 (`in2`).

**`ROLLING`**: an envelope looping at sixteenth notes, so most of these play by themselves. A gate restarts the loop, so
send sixteenths from a sequencer and it follows.

| Sound | What it is |
|---|---|
| Psy Snap | A tight psytrance roll, about 145 BPM: a snap of filter on a saw, over a sine |
| Psy Round | The same with a square: hollow, longer notes |
| Acid Roll | A saw under a resonant filter, the peak swept down each note |
| FM Roll | Two sines, the FM depth falling with each note: woody and knocking |
| Triplet Gallop | Eighth-note triplets, about 142 BPM |
| Hold To Roll | **Needs a gate.** Rolls while the gate is high, stops when it falls: write fills with long notes |
| DnB Roller | A held sub with a Reese opening over it in eighths at 174 BPM |

**`REESE`**: all **need a gate**.

| Sound | What it is |
|---|---|
| Reese Classic | Two darkened saws a few cents apart. CV 2 opens them up |
| Reese Wide | One saw on each of `out0` and `out1`, for stereo |
| Reese Neuro | One saw frequency-modulating the other: tearing and slowly turning |
| Reese In A Table | Phasing held inside the table: a saw LFO through it beats at the same rate on any note |
| Reese Over Sub | A Reese over a solid sine, so the low end doesn't phase away |

**`BASS`**: all **need a gate**.

| Sound | What it is |
|---|---|
| Saw Pluck | The everyday one: a filter envelope on a saw |
| Square Hollow | Woody, odd harmonics only |
| Fat Stack | A saw and a square an octave down, filtered together |
| PPG Step | The early digital machines: no blending between waves, stair steps left in |
| Sync Tear | A hard sync sweep over a sine |
| PWM Juno | Slow pulse width modulation |
| Growl Wobble | An LFO through a table from a mutter to a tearing 'wow'. Its rate is the speed of the wub |
| Talk Bass | Runs through a voice's vowels on each note: it says 'yoy' |
| FM Solid | Two sines, a bright pick falling away to a pure tone, as on a DX7 |
| CZ Reso | A Casio CZ's resonant phase distortion |
| Fold Dirty | A sine wavefolded as the envelope opens |
| Sub Drive | Nearly a pure sine, with a little drive from the envelope and CV 2 |
| Organ House | The drawbar organ bass of early nineties house |
| Donk | A short pluck with a ring modulated knock |

**`CLASSIC`**: not basses.

| Sound | What it is |
|---|---|
| Hoover | **Needs a gate.** The rave hoover: pulse and saw well apart, swooping into each note |
| PPG Pad | A long, slowly scanning digital pad. Plays by itself |
| Glass Bell | **Needs a gate.** Struck and ringing |
| Vowel Lead | **Needs a gate.** A voice singing, best mid-keyboard |
| Sync Lead | **Needs a gate.** The early eighties screaming lead |
| Grain Drift | Slow grains drifting over each other. Plays by itself |
| Grain Spray | Scattered grains, each a different overtone. Plays by itself |

`TABLES` holds the wavetables these use. Each is also an ordinary table you can load from the Browser and scan yourself.
FairWave has no filter, so a filter is baked into a table: each frame is what a filter at some cutoff would leave, and
`POS` is the cutoff. An envelope on `POS` is then a filter envelope, and the cutoff follows the note.

| Table | Scanning from 0% to 100% goes from |
|---|---|
| `SAWLP` | nearly a sine to a full saw, under a 24 dB filter |
| `SQRLP` | nearly a sine to a full square |
| `ACIDLP` | a saw under a resonant filter, the peak walking up |
| `SYNC` | a saw hard synced from 1 to 8 times the note |
| `PWM` | a square to a narrow pulse |
| `FOLD` | a sine to a heavily wavefolded one |
| `SUBDRV` | a clean sine to a driven, rounded square |
| `GROWL` | a dark mutter to a tearing 'wow' |
| `TALK` | a voice's vowels: U, O, A, E, I |
| `PPG` | four banks of very different digital waves |
| `REESE` | two saws slipping past each other: it wraps seamlessly |
| `ORGAN` | a drawbar organ with the stops being pulled out |
| `GLASS` | a sparse, bright band moving up |

Remake them with `python src/top/fairwave/tools/make_library.py`. They come from the numbers in that file, and aren't
copied from anything.

To hear a sound without flashing anything, `tools/render_patch.py` plays a patch through the models, which match the
gateware bit for bit, and writes a WAV.

## Writing a patch

A patch file is plain text, with `.fwp` as its extension. It uses the names the screens use, so what you see on a screen
is what you write. A file only says what differs from the default patch:

```
FAIRWAVE PATCH 1
NAME  = MY BASS
ABOUT = A FEW WORDS FOR THE BROWSER

# A comment. Anything after a # is ignored.
[OSC 1]
TABLE = TABLES/SAWLP.WAV
TUNE  = -24
POS   = 25%

[ENV 1]
ATTACK  = 1 MS
DECAY   = 200 MS
SUSTAIN = 30%
VCA     = BOTH

[ROUTING]
CV 1 > PITCH 1 = 100%
CV 1 > PITCH 2 = 100%
ENV 1 > POS 1  = 45%

[MIXER]
OUT 0 = MIX
OUT 1 = MIX
```

The first line has to be `FAIRWAVE PATCH 1`. Keep `NAME` and `ABOUT` near the top, as the Browser only reads the first
kilobyte to show them. `NAME` is cut to 16 characters and `ABOUT` to 34. Upper and lower case don't matter, nor do spaces in
names, so `lfo1` and `LFO 1` are the same.

| Section | Setting | Values |
|---|---|---|
| `[OSC 1]`, `[OSC 2]` | `TABLE` | A file (see below), or a built-in table by name: `MORPH 2048`, `PULSE 256`, `VOWELS`, `FM BELL`, `CZ RESO`, `HARD SYNC`, `WAVEFOLD`, `PLUCK`, `HARMONICS`, `CRUSH 256`, `SWARM` |
| | `FRAME` | `256`, `512`, `1024`, `2048`. Leave it out and the table says for itself |
| | `READ` | `CLEAN`, `PLAIN`, `STEPS`, `RAW` |
| | `TUNE` | Semitones, -48 to 48 |
| | `FINE` | Cents, -50 to 50 |
| | `POS` | 0% to 100% |
| | `SHIFT` | -200% to 200% |
| | `EDGE` | `CLAMP`, `WRAP`, `MIRROR` |
| | `GRAIN` | `OFF`, `LFO 1`, `LFO 2`, `LFO 3` |
| | `LEVEL` | 0% to 100% |
| `[ENV 1]`, `[ENV 2]` | `DELAY`, `ATTACK`, `HOLD`, `DECAY`, `RELEASE` | A time: `10 MS`, `1.5 S`. Plain numbers are ms |
| | `SUSTAIN` | 0% to 100% |
| | `A CURVE`, `D CURVE`, `R CURVE` | -100 to 100 |
| | `LOOP` | `OFF`, `GATED`, `FREE` |
| | `GATE` | `OFF`, `GATE 1`, `GATE 2`, `EITHER` |
| | `VCA` | `OFF`, `OSC 1`, `OSC 2`, `BOTH` |
| `[LFO 1]` to `[LFO 3]` | `RATE` | `5.1 HZ`: 0.01 to 105 |
| | `SHAPE` | `SINE`, `TRI`, `SAW UP`, `SAW DN`, `SQUARE`, `RANDOM` |
| | `PHASE` | Degrees |
| | `LEVEL` | 0% to 100% |
| | `POLAR` | `BI`, `UNI` |
| | `SYNC` | `FREE`, `GATE 1`, `GATE 2`, `EITHER` |
| `[ROUTING]` | `source > destination` | -400% to 400% (pitch: -195% to 195%), up to twelve lines. Sources: `CV 1`, `CV 2`, `ENV 1`, `ENV 2`, `LFO 1` to `LFO 3`. Destinations: `PITCH 1`, `POS 1`, `SHIFT 1`, `LEVEL 1`, the same with `2`, `BALANCE`, `X DEPTH` |
| `[MIXER]` | `OUT 0` to `OUT 3` | `OFF`, `MIX`, `OSC 1`, `OSC 2`, `ENV 1`, `ENV 2`, `LFO 1` to `LFO 3` |
| | `BALANCE` | 0% (all of oscillator 1) to 100% (all of oscillator 2) |
| | `LEVEL 1`, `LEVEL 2` | The same as `LEVEL` under `[OSC 1]` and `[OSC 2]` |
| `[CROSS MOD]` | `MODE` | `OFF`, `RING`, `AM`, `FM`, `PD` |
| | `FROM` | `OSC 1`, `OSC 2`: which one modulates |
| | `DEPTH` | 0% to 100% |

A few things to know:

- **Routing.** If there's a `[ROUTING]` section, it replaces the default routing, which is `CV 1` to both pitches and `CV 2`
  to both positions. So include `CV 1 > PITCH` lines if you want to play it.
- **Times and rates** land on the nearest step the screens have, about 9% apart. The screen shows what you got.
- **Finding a file.** `TABLE` is looked for from the folder the patch is in, then from the `FAIRWAVE` folder, so a patch and
  its table can sit side by side, or share `TABLES`. Paths use `/`, and `..` goes up a folder. Either a file's long
  name or its short one will do. A path can be up to 39 characters of short names, about four folders deep.
- **Missing tables.** The outputs stay quiet while tables load. If a table can't be found, Patches and the Browser say
  `NEEDS NAME.WAV`, and that oscillator plays table 0. It loads when a drive with the file arrives.
- **Mistakes.** A line that isn't understood is left out, and the Browser says how many there were. The serial log gives
  the line number. A value out of range stops at the end of its range. Either way the rest still plays.
- **The envelopes keep running** when you change patches, so two free-running envelopes won't start together, and won't
  stay in step unless a gate restarts them. Rolling patches use one envelope for the VCA and `POS` for this reason.

## Grains, in a file

`GRAIN = LFO 1` makes each cycle of that LFO restart the oscillator and take up a new position, held until the next
cycle. It doesn't fade anything by itself, so give a grain a window, or each restart clicks:

```
[OSC 1]
GRAIN = LFO 1
LEVEL = 0%

[LFO 1]
SHAPE = SINE
POLAR = UNI
PHASE = 270     # at 270 degrees the window is shut exactly as its cycle starts

[ROUTING]
LFO 1 > LEVEL 1 = 100%
```

A `TRI` at 270 degrees works too. An LFO's `PHASE` moves its shape, not when its cycle starts, so two LFOs at one rate
restart together. To stagger two streams, use two different rates.
