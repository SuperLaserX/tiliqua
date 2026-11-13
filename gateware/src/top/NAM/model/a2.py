"""The NAM A2 network: file loader and floating-point reference.

A2 is one WaveNet layer array of 23 layers. The two published widths are
A2-Lite (3 channels) and A2-Full (8 channels); a `.nam` file usually carries
both in a `SlimmableContainer`.

Per sample, with `C` channels, input `x`:

    lin[c]  = rechannel[c] * x
    hsum[c] = 0
    for each layer l (kernel K, dilation D):
        hist_l[t] = lin
        z[i]  = conv_b[i] + sum_k sum_j conv_w[k][i][j] * hist_l[t - (K-1-k)*D][j]
        z[i] += mixin[i] * x
        z[i]  = z[i] if z[i] >= 0 else 0.01 * z[i]
        hsum[i] += z[i]
        lin[c] += l1x1_b[c] + sum_b l1x1_w[c][b] * z[b]
    y = head_b + sum_k sum_b head_w[k][b] * hsum[t - (15-k)][b]
    out = y * head_scale

This follows `NeuralAmpModelerCore/NAM/wavenet/a2_fast.cpp`. It was compared once
with the compiled Core (built with zig c++ and Eigen 3.4.0, outside the repo) on
the Core's example audio: -128 to -134 dB, both widths, both the A2 path and the
generic WaveNet path. That comparison's script isn't in the repo.
"""

import json
from dataclasses import dataclass, field

import numpy as np

NUM_LAYERS = 23
HEAD_KERNEL = 16
LEAKY_SLOPE = 0.01
KERNEL_SIZES = (6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 15, 15, 6, 6, 6, 6, 6, 6, 6)
DILATIONS = (1, 3, 7, 17, 41, 101, 239, 1, 3, 7, 17, 41, 101, 239, 1, 13,
             1, 3, 7, 17, 41, 101, 239)
WIDTHS = (3, 8)

# Samples of history the network looks back over: silence for this long puts
# every delay line in its resting state.
RECEPTIVE_FIELD = 1 + sum((k - 1) * d for k, d in zip(KERNEL_SIZES, DILATIONS)) + HEAD_KERNEL - 1


def weight_count(channels):
    c = channels
    per_layer = [k * c * c + c + c + c * c + c for k in KERNEL_SIZES]
    return c + sum(per_layer) + HEAD_KERNEL * c + 1 + 1


class NotA2(ValueError):
    """The file holds a model this engine can't run; the message says why."""


@dataclass
class Layer:
    kernel: int
    dilation: int
    conv_w: np.ndarray      # [k][out][in]
    conv_b: np.ndarray      # [out]
    mixin: np.ndarray       # [out]
    l1x1_w: np.ndarray      # [out][in]
    l1x1_b: np.ndarray      # [out]


@dataclass
class A2Weights:
    channels: int
    rechannel: np.ndarray   # [c]
    layers: list
    head_w: np.ndarray      # [k][c]
    head_b: float
    head_scale: float
    # What the file says about levels; None where it doesn't.
    loudness: float = None
    input_level_dbu: float = None
    output_level_dbu: float = None
    sample_rate: float = None
    name: str = ""
    meta: dict = field(default_factory=dict)


def unpack_weights(flat, channels):
    """The flat `weights` list of a WaveNet entry, in the Core's order."""
    c = channels
    flat = np.asarray(flat, dtype=np.float64)
    if len(flat) != weight_count(c):
        raise NotA2(f"{len(flat)} weights; an A2 of {c} channels has {weight_count(c)}")
    pos = 0

    def take(n):
        nonlocal pos
        out = flat[pos:pos + n]
        pos += n
        return out

    rechannel = take(c).copy()
    layers = []
    for k, d in zip(KERNEL_SIZES, DILATIONS):
        # File order is out, in, tap.
        conv_w = take(c * c * k).reshape(c, c, k).transpose(2, 0, 1).copy()
        conv_b = take(c).copy()
        mixin = take(c).copy()
        l1x1_w = take(c * c).reshape(c, c).copy()
        l1x1_b = take(c).copy()
        layers.append(Layer(k, d, conv_w, conv_b, mixin, l1x1_w, l1x1_b))
    # Head: channel, tap.
    head_w = take(c * HEAD_KERNEL).reshape(c, HEAD_KERNEL).T.copy()
    head_b = float(take(1)[0])
    head_scale = float(take(1)[0])
    assert pos == len(flat)
    return A2Weights(c, rechannel, layers, head_w, head_b, head_scale)


def _all(value, n, test):
    if isinstance(value, list):
        return len(value) == n and all(test(v) for v in value)
    return test(value)


def _inactive(obj):
    return obj is None or obj is False or (isinstance(obj, dict) and not obj.get("active", False))


def check_shape(config):
    """Channel count of a WaveNet `config` if it is an A2; raises NotA2 if not.

    The same test as `is_a2_shape` in the Core."""
    def no(why):
        raise NotA2(why)

    layers = config.get("layers")
    if not isinstance(layers, list) or len(layers) != 1:
        no("not a single layer array")
    if config.get("head") is not None:
        no("has a post-stack head")
    if "condition_dsp" in config and config["condition_dsp"] is not None:
        no("has a condition DSP")
    if not isinstance(config.get("head_scale"), (int, float)):
        no("no head scale")
    if config.get("in_channels", 1) != 1:
        no("more than one input channel")
    la = layers[0]
    if la.get("input_size") != 1 or la.get("condition_size") != 1:
        no("input or condition size isn't 1")
    c = la.get("channels")
    if c not in WIDTHS:
        no(f"{c} channels; A2 has 3 or 8")
    if la.get("bottleneck", c) != c:
        no("bottleneck differs from channels")
    if tuple(la.get("dilations", ())) != DILATIONS:
        no("dilations aren't A2's")
    kernels = la.get("kernel_sizes")
    if kernels is None or tuple(kernels) != KERNEL_SIZES:
        no("kernel sizes aren't A2's")

    def leaky(a):
        return (isinstance(a, dict) and a.get("type") == "LeakyReLU"
                and abs(a.get("negative_slope", 0.01) - LEAKY_SLOPE) < 1e-7)

    act = la.get("activation")
    if not (isinstance(act, list) and len(act) == NUM_LAYERS and all(leaky(a) for a in act)):
        no("activation isn't LeakyReLU(0.01) on every layer")
    if "gating_mode" in la and not _all(la["gating_mode"], NUM_LAYERS,
                                        lambda g: str(g).lower() == "none"):
        no("gated layers")
    if la.get("gated") is True:
        no("gated layers")
    if "secondary_activation" in la and not _all(la["secondary_activation"], NUM_LAYERS,
                                                 lambda a: a is None):
        no("secondary activation")
    if not _inactive(la.get("head1x1")):
        no("head 1x1 is active")
    l1 = la.get("layer1x1")
    if not (isinstance(l1, dict) and l1.get("active") and l1.get("groups", 1) == 1):
        no("layer 1x1 is missing or grouped")
    head = la.get("head")
    if not (isinstance(head, dict) and head.get("out_channels") == 1
            and head.get("kernel_size") == HEAD_KERNEL and head.get("bias") is True
            and head.get("head_dilation", 1) == 1):
        no("head isn't a 16-tap convolution to one channel with bias")
    for key, value in la.items():
        if key.endswith("_film") or key.startswith("film"):
            if not _inactive(value):
                no(f"{key} is active")
    if la.get("groups_input", 1) != 1 or la.get("groups_input_mixin", 1) != 1:
        no("grouped convolutions")
    if la.get("slimmable") is not None:
        no("slimmable layer array")
    return c


def _wavenet_entry(entry, name=""):
    if entry.get("architecture") != "WaveNet":
        raise NotA2(f"architecture is {entry.get('architecture')}")
    channels = check_shape(entry["config"])
    w = unpack_weights(entry["weights"], channels)
    meta = entry.get("metadata") or {}
    w.meta = meta
    w.loudness = meta.get("loudness")
    w.input_level_dbu = meta.get("input_level_dbu")
    w.output_level_dbu = meta.get("output_level_dbu")
    w.sample_rate = entry.get("sample_rate")
    w.name = name
    return w


def load_nam(path):
    """Every A2 network in a `.nam` file, widest last.

    A plain WaveNet file gives one; a SlimmableContainer gives one for each
    submodel that is an A2. Raises NotA2 if there is none."""
    with open(path, "r", encoding="utf-8") as f:
        doc = json.load(f)
    found = []
    reasons = []
    if doc.get("architecture") == "SlimmableContainer":
        for sub in doc["config"].get("submodels", []):
            try:
                w = _wavenet_entry(sub["model"])
            except NotA2 as e:
                reasons.append(str(e))
                continue
            # The container's own metadata covers what a submodel leaves out.
            top = doc.get("metadata") or {}
            for key in ("loudness", "input_level_dbu", "output_level_dbu"):
                if getattr(w, key) is None:
                    setattr(w, key, top.get(key))
            if w.sample_rate is None:
                w.sample_rate = doc.get("sample_rate")
            found.append(w)
    else:
        try:
            found.append(_wavenet_entry(doc))
        except NotA2 as e:
            reasons.append(str(e))
    if not found:
        raise NotA2("; ".join(reasons) or "no model")
    found.sort(key=lambda w: w.channels)
    return found


def delayed(a, n):
    """`a` delayed by `n` rows, zeros shifted in."""
    if n == 0:
        return a
    out = np.zeros_like(a)
    out[n:] = a[:-n]
    return out


def run_float(w, x, prewarm=True, dtype=np.float64, taps=None):
    """Output for input `x` (array of samples in -1..1).

    With `prewarm` the delay lines start as they'd be after silence, as the
    Core does on reset; without it they start at zero, as the engine does
    out of reset. `taps`, if a dict, receives the internal signals."""
    x = np.asarray(x, dtype=dtype)
    pad = RECEPTIVE_FIELD if prewarm else 0
    xe = np.concatenate([np.zeros(pad, dtype=dtype), x])
    lin = np.outer(xe, w.rechannel.astype(dtype))
    hsum = np.zeros_like(lin)
    if taps is not None:
        taps["hist"] = []
        taps["z"] = []
    for layer in w.layers:
        k_, d = layer.kernel, layer.dilation
        z = np.outer(xe, layer.mixin.astype(dtype)) + layer.conv_b.astype(dtype)
        for k in range(k_):
            z += delayed(lin, (k_ - 1 - k) * d) @ layer.conv_w[k].astype(dtype).T
        z = np.where(z >= 0, z, dtype(LEAKY_SLOPE) * z)
        if taps is not None:
            taps["hist"].append(lin[pad:].copy())
            taps["z"].append(z[pad:].copy())
        hsum += z
        lin = lin + z @ layer.l1x1_w.astype(dtype).T + layer.l1x1_b.astype(dtype)
    y = np.full(len(xe), w.head_b, dtype=dtype)
    for k in range(HEAD_KERNEL):
        y += delayed(hsum, HEAD_KERNEL - 1 - k) @ w.head_w[k].astype(dtype)
    if taps is not None:
        taps["hsum"] = hsum[pad:].copy()
        taps["lin"] = lin[pad:].copy()
    return (y * dtype(w.head_scale))[pad:]
