"""The reverb types, one module each (see lab.py to make one).

`TYPES` lists the ones a bitstream carries, in menu order: `top.py`
builds them (unless `--algorithms` says otherwise), and the tests and
`tools/render_presets.py` cover them. Add new ones at the end: the saved
type is an index into the list. `lab` (the template) is out of the menu
for now: append it to try a design. `fdn8` is a test algorithm.
"""

TYPES = ["plate", "space", "spring", "shimmer", "reverse", "ambient", "bloom", "void",
         "resonator", "ensemble", "pulse", "tunnel", "echo", "morph", "split", "rotor", "gated",
         "spiral", "orbit", "fold", "carrier", "vowel", "bounce", "crusher", "strobe", "swirl"]
