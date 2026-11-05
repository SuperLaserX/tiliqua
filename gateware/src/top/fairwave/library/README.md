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
| Donk | **Needs a gate.** A hollow pipe that knocks and rings, half a second long, with a sub under it. 0 V is C3 |
| Donk Scouse | **Needs a gate.** Higher and harder, with a ring modulated edge, for offbeats |
| Donk Deep | **Needs a gate.** Low and round, an FM pluck for deep house. 0 V is C2 |

**`CLASSIC`**: not basses.

| Sound | What it is |
|---|---|
| What The | **Needs a gate.** The Alpha Juno's rave hoover, sampled from an emulation: see below. A stereo pair, `out0` and `out1` |
| Hoover | **Needs a gate.** The same sound with a live envelope and LFO on its filter, at any pitch |
| Mentasm | **Needs a gate.** An octave lower, with a shorter swoop, for riffs |
| PPG Pad | A long, slowly scanning digital pad. Plays by itself |
| Glass Bell | **Needs a gate.** Struck and ringing |
| Vowel Lead | **Needs a gate.** A voice singing, best mid-keyboard |
| Sync Lead | **Needs a gate.** The early eighties screaming lead |

What The, Hoover and Mentasm play a rendering of the Alpha Juno's factory patch, worked out from its published settings by
`tools/make_rendered.py`. It's an emulation, and the rates and times are estimates, since the settings are numbers from 0 to 127
with no published Hz or seconds. A recording of the real thing can take its place: `tools/make_sample.py` makes the table.

The rest are newer. Everything marked below needs a gate on gate 1 unless it says otherwise, and each patch's `ABOUT` line
says what it's for.

| Folder | Sounds |
|---|---|
| `KICKS` | FM Kick, FM Kick Long, FM Kick Metal, FM Kick Zap, 808 Boom, 909 Punch, Techno Kick, Rumble Kick, Psy Kick, DnB Kick, Hardstyle Kick, Hardstyle Long, Gabber Kick, Industrial Kick. CV 1 tunes them, and a short trigger is enough |
| `CROSS` | The cross modulations, for hearing what each does. FM: E Piano, Bell, Brass, Growl, Metal, Slow Pad. AM: Tremolo, Sidebands, Organ, Talk, Beat Pad. PD: Saw Sweep, Square Bass, Reso, Fold Lead, Slow Bend. Ring: Bell, Metal Hit, Robot, Sci Fi, Dalek |
| `TECHNO` | Dub Chord, Detroit Pad, Rave Stab, Acid Line, Rumble Bass, Minimal Blip, Hypnotic Loop and Industrial Drone (those two run by themselves) |
| `HARDSTYLE` | Screech, Screech Rise, Reverse Bass, Euphoric Lead, Gated Stab, Hardcore Hoover |
| `TRANCE` | Supersaw, Trance Pluck, Goa Lead, Trance Gate, Crystal Arp |
| `HOUSE` | Deep Stab, Organ Stab, Garage Bass, Italo Bass, Disco Strings |
| `DNB` | Neuro Growl, Wobble, Foghorn, Jungle Sub, Liquid Pad |
| `ROLLING` | As above, and also Full On Roll, Forest Roll, Goa Roll, Zap Roll, PD Roll |
| `ORCHESTRA` | Sampled: Symphonic Strings, Legato Strings, String Quartet, Deep Strings, Pizzicato, Contrabass, Cello, French Horn, Brass Section, Horn Section, Timpani, Orchestra Hit, Orch Stab Akai, Choir Men, Choir Women, Choir Vox, Church Organ, Pipe Organ, Flute, Harp |
| `CINEMATIC` | Sampled: Low Brass Braam, Sub Strings, Dark Choir, Drop Hit, Ethno Hit, Space War, Reso Sweep, Ober Pad, Hollow Pad. On the oscillators: Riser, Sub Drop, Impact Boom, Tension Drone, Ostinato Low, Power Chord |
| `GUITARS` | Sampled: Nylon, Steel, Electric Clean, Electric Warm, Muted, Picked, Overdrive, Koto. See also Power Chord under `CINEMATIC` |
| `GRAINS` | Long winding pads, and what grains can do: Glacier, Winding Strings, Choir Drift, Dream Cloud, Warm Octaves, Steam Fifths, Slow Bloom, Freeze, Stretch, Scatter Brass, and on built-in tables Grain Spray, Grain Drift, Bell Cloud, Swarm Texture |
| `FAIRLIGHT` | One patch for each of 114 Fairlight CMI voices, played from the original recording. See below |

**`FAIRLIGHT`.** A CMI IIx voice is a real recording, 16384 8-bit samples at 30.2 kHz, so these play as the instrument did,
attack then loop, restarting on a gate. Each was tuned by measuring it: 0 V is the C its maker's key mapping would have put under
middle C, within the range of what it is (the comment at the top of the patch says which, in Hz), and a set with no steady
pitch plays at its own speed. Basses have a clean sub added on oscillator 2, and strings and voices a second copy a few cents away:
take oscillator 2's `BALANCE` to 0% to hear the recording alone. `Drum Kit`, `Drums GM` and `Bells` are several recordings in
one table, and CV 2 picks which.

Made by `tools/make_fairlight.py`, from a folder of multisamples.

**The audio.** `FAIRLIGHT/WAVES` and most of `SAMPLES` come from `ExampleTables`, recordings of commercial instruments and sample
sets: fine on your own drive, but think before sharing them. `SAMPLES/WHATL`, `WHATR`, `HOOVBRI` and `HOOVDRK` are rendered here.
Remake them with `tools/make_fairlight.py`, `tools/make_instruments.py` and `tools/make_rendered.py`.

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
| `DONK` | a round, hollow note to a knock, under a filter that rings |
| `HARD` | a clean sine to a clipped buzz with a tone of its own, for a hardstyle kick's tail |
| `DUBCHORD` | a minor seventh chord in one frame, dark to open. `TUNE = -40`, `FINE = 14` puts its root on C4 |
| `RAVECHRD` | a rave's minor chord in one frame, dark to open, tuned the same |
| `POWER` | a power chord in one frame, clean to crunch. `TUNE = -12` puts its root on C4 |

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
| | `READ` | `CLEAN`, `PLAIN`, `STEPS`, `RAW`, or `SAMPLE` to play a recording (see below) |
| | `TUNE` | Semitones, -48 to 48 |
| | `FINE` | Cents, -50 to 50 |
| | `POS` | 0% to 100% |
| | `SHIFT` | -200% to 200%. Also called `LOOP`, which is what it does under `READ = SAMPLE` |
| | `EDGE` | `CLAMP`, `WRAP`, `MIRROR` |
| | `GRAIN` | `OFF`, `LFO 1` to `LFO 3`, `LFO 1 B` to `LFO 3 B`, `SYNC 1` to `SYNC 3`: see below |
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

`GRAIN = LFO 1` makes each cycle of that LFO restart the oscillator and take up a new position, held until the next cycle, and
fades each grain in and out as it goes: the fade is in the gateware, shut when a grain starts and full half way, so a restart
can't click and the LFO's shape and `PHASE` don't matter. The LFO's `RATE` is the grain rate.

| `GRAIN` | What restarts the oscillator | Fade |
|---|---|---|
| `LFO 1` | that LFO's cycle starting | yes |
| `LFO 1 B` | that LFO passing half way, so half a cycle after `LFO 1` | yes: added to `LFO 1`'s, it makes a steady level |
| `SYNC 1` | that LFO's cycle starting | none: the old behaviour, a hard sync, for samples and rhythm |

So two streams that overlap evenly are:

```
[OSC 1]
GRAIN = LFO 1

[OSC 2]
GRAIN = LFO 1 B

[LFO 1]
RATE = 5 HZ
```

Two LFOs at different rates give streams that drift through each other, with the level breathing. An LFO or CV on `POS` moves
where a grain starts: a slow one is the place wandering through a table, a `RANDOM` one is spray. Because two streams on one clock
average in the mixer, they come out about 6 dB quieter than one oscillator playing alone.

## Patches from a modwave

`MODWAVE` holds patches translated from a Korg modwave: a folder for each pack, and their tables in `MODWAVE/T`. Leave `T` where it
is, as the patches name their tables from there. The translation is `tools/import_modwave.py`:

```
python src/top/fairwave/tools/import_modwave.py --auto D:/midi/modwave
```

That reads every `.mwbundle`, `.mwbackup`, `.mwperf`, `.mwprog`, `.mwwavetable` and `.korgmultisample` under a folder. Each bundle
becomes a pack, loose files go by their folder, and a backup comes last as `FACTORY`, so a sound it shares with a bundle stays with
its bundle. `MODWAVE/SKIPPED.TXT` lists the sounds it couldn't make, and why.

Factory samples and anything only on the instrument come from what `tools/modwave_device.py` copies off it, into folders called `factory`
and `database` beside the rest. Connect the instrument over USB and close Korg's Editor Librarian first:

```
python src/top/fairwave/tools/modwave_device.py fetch /Korg/FileSystem/Internal/Collections/Sample D:/midi/modwave/factory
python src/top/fairwave/tools/modwave_device.py fetch /Korg/FileSystem/Internal/Database D:/midi/modwave/database
```

That only reads. Sounds that are only on the instrument go in a pack called `ONBOARD`.

A patch plays what its C4 key plays at 0 V, or for a bass, the key that puts its loudest oscillator at C2. Its comments say which
that is, what it left out, and which effects it had. Open one in a text editor to read them.

**What comes across.** Wavetables, positions, tuning, Wavetable Modifiers, A/B blend, the sub oscillator, levels, envelopes, LFOs,
macro knobs as they were saved, and the filter and morphs, worked into the tables.

**What changes.** FairWave has two oscillators, two envelopes and three LFOs, so a two-layer sound keeps its two loudest oscillators,
its amp envelope as `ENV 1`, the envelope that matters most as `ENV 2`, and the LFOs that matter most. The mod wheel is `CV 2`.
FairWave has no filter, so a filter that doesn't move is baked in, and `POS` is still the wavetable's position. If it does move,
each frame of a new table is one moment of that movement and `POS` moves along it. A sampled oscillator's filter can't move, so it's
baked where its envelope holds it for most of a note, and it plays one key's sample across the whole keyboard. A sample's level and loop
tuning aren't kept, and a one-shot over about 16 seconds is cut short. An envelope's segment can be 90 seconds on a modwave and 32.8 here.

**What's lost.** Effects, velocity, the motion sequencer, Kaoss Physics and modulation processors. So is whatever changes an
envelope's or LFO's speed, as that isn't in seconds or hertz. Without the instrument's banks, an oscillator that needs a factory sample is
dropped, and a sound with nothing else is listed in `SKIPPED.TXT`.

**How close it is.** The file format comes from the modwave's own software, so what a patch says is read exactly. What it sounds like is
another matter: filters and morphs follow the manual's descriptions, not the instrument's code, and how far `DEPTH` goes in an FM, AM or
ring patch compared with the modwave's Morph Amount is a guess. Compare with the instrument, and trust your ears over this.

## Playing a recording

`READ = SAMPLE` reads a table's frames end to end as one long recording, so pitch is speed:

```
[OSC 1]
TABLE = SAMPLES/MYSOUND.WAV
READ  = SAMPLE
TUNE  = -14         # a frame is a cycle: this is how far from C4 its own speed is
POS   = 0%          # where a restart starts from
EDGE  = WRAP        # WRAP goes round to LOOP at the end. CLAMP and MIRROR stop: silent until a restart
LOOP  = 30%         # where it goes round to, by whole frames
GRAIN = SYNC 1      # a restart from LFO 1, with no fade

[LFO 1]
RATE = 0.01 HZ      # as slow as it goes, so it restarts on...
SYNC = GATE 1       # ...each gate, and at no other time
```

With `GRAIN = LFO 1` and `LFO 1 B` instead it's real granular synthesis on a recording: time and pitch come apart, `POS` is the
place in time, and a slow LFO on it stretches or winds through the recording. See the `GRAINS` folder.

A recording has to end on a whole frame with its loop starting on one, and the shortest frame is 256 samples, so
`tools/make_sample.py` lines one up and works out those settings:

```
python src/top/fairwave/tools/make_sample.py take3.wav library/FAIRWAVE/SAMPLES/MYSOUND.WAV --c 48 --loop 44100 88199
```

A table can be up to 1024 frames: a little over 5 seconds at 48 kHz with 256-sample frames, or 43 with 2048-sample ones. A table
takes twice its size in the synth's memory, which has 7 MB to hold what's loaded.
