// Verilator harness for the whole FairWave SoC (see fairwave/socsim.py).
//
//   tb_soc <firmware.bin> <bootinfo.bin> [cycles=N] [cv=mv,mv,mv,mv] [enc=clock:keys,...]
//          [keygap=clocks] [pulse=ch,lo_mv,hi_mv,period,high,start] [load=path,offset]
//          [dump=offset,bytes]
//
// Runs in the output directory; writes frameNN.bmp (tb_cpp/dvi.h), audio.raw (the DAC
// stream exactly as the design writes it), trace.raw (with each of its samples, the
// inputs that sample used and the state a model needs to pick it up from) and uart.txt.

#include <cmath>
#include <cstdint>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <fstream>
#include <sstream>
#include <string>
#include <vector>

#include "Vtiliqua_soc.h"
#include "verilated.h"

#include "dvi.h"
#include "i2s.h"
#include "psram.h"

// Verilator's runtime asks for this when no context time is in use.
double sc_time_stamp() { return 0; }

// What the encoder should do, and when.
struct EncoderEvent {
    uint64_t at;
    char key;
};

// Plays events on the encoder's pins: a detent is two quadrature steps.
class EncoderDriver {
    Vtiliqua_soc* dut;
    std::vector<EncoderEvent> events;
    size_t next = 0;
    int phase = 0;                  // quadrature position
    int steps = 0, dir = 0;
    uint64_t release_at = 0, step_at = 0;
    // Keys are at least this far apart, however long the one before took: a hand can't turn
    // the encoder within a poll of letting go of it, which the firmware would see out of order.
    uint64_t gap, ready_at = 0;

    // A few hundred us between steps, about 2 ms for a click: the firmware polls
    // every 5 ms, and the long press takes 500 ms of holding.
    static constexpr uint64_t STEP = 12000, CLICK = 1200000, HOLD = 36000000;

    void pins() {
        static const int GRAY[4][2] = {{0, 0}, {1, 0}, {1, 1}, {0, 1}};
        dut->enc_i = GRAY[phase & 3][0];
        dut->enc_q = GRAY[phase & 3][1];
    }

public:
    EncoderDriver(Vtiliqua_soc* d, std::vector<EncoderEvent> ev, uint64_t key_gap)
        : dut(d), events(std::move(ev)), gap(key_gap) {
        pins();
        dut->enc_s = 0;
    }

    void tick(uint64_t cycle) {
        if (next < events.size() && cycle >= events[next].at && cycle >= ready_at && !steps && !release_at) {
            switch (events[next].key) {
                case 'R': steps = 2; dir = -1; step_at = cycle; break;
                case 'L': steps = 2; dir = 1; step_at = cycle; break;
                case 'P': dut->enc_s = 1; release_at = cycle + CLICK; break;
                case 'H': dut->enc_s = 1; release_at = cycle + HOLD; break;
            }
            ++next;
        }
        if (steps && cycle >= step_at) {
            phase += dir;
            pins();
            --steps;
            step_at = cycle + STEP;
            if (!steps) ready_at = cycle + gap;
        }
        if (release_at && cycle >= release_at) {
            dut->enc_s = 0;
            release_at = 0;
            ready_at = cycle + gap;
        }
    }
};

static std::vector<EncoderEvent> parse_events(const std::string& text, uint64_t gap) {
    // "25000000:RR,28000000:P": the keys of one group follow each other `gap` clocks apart.
    std::vector<EncoderEvent> out;
    std::stringstream groups(text);
    std::string g;
    while (std::getline(groups, g, ',')) {
        size_t colon = g.find(':');
        uint64_t at = std::strtoull(g.c_str(), nullptr, 10);
        for (size_t i = colon + 1; i < g.size(); ++i) {
            out.push_back({at, g[i]});
            at += gap;
        }
    }
    return out;
}

int main(int argc, char** argv) {
    if (argc < 3) {
        fprintf(stderr, "usage: tb_soc firmware.bin bootinfo.bin [cycles=N] [cv=a,b,c,d] [enc=...]\n");
        return 2;
    }

    uint64_t cycles = 30000000;
    int cv_mv[4] = {0, 0, 0, 0};
    size_t dump_offset = 0, dump_bytes = 0;
    std::vector<std::pair<std::string, size_t>> loads;
    std::string enc_text;
    // 40 ms: time for each key to be seen and drawn.
    uint64_t key_gap = 2400000;
    // A square wave on an input instead of its steady voltage, in audio frames.
    struct Pulse { int lo = 0, hi = 0; uint64_t period = 0, high = 0, start = 0; } pulses[4];
    for (int i = 3; i < argc; ++i) {
        std::string a = argv[i];
        if (a.rfind("cycles=", 0) == 0) {
            cycles = std::strtoull(a.c_str() + 7, nullptr, 10);
        } else if (a.rfind("cv=", 0) == 0) {
            std::sscanf(a.c_str() + 3, "%d,%d,%d,%d", &cv_mv[0], &cv_mv[1], &cv_mv[2], &cv_mv[3]);
        } else if (a.rfind("pulse=", 0) == 0) {
            int ch, lo, hi;
            unsigned long long period, high, start;
            std::sscanf(a.c_str() + 6, "%d,%d,%d,%llu,%llu,%llu", &ch, &lo, &hi, &period, &high, &start);
            pulses[ch] = Pulse{lo, hi, period, high, start};
        } else if (a.rfind("enc=", 0) == 0) {
            enc_text = a.substr(4);
        } else if (a.rfind("keygap=", 0) == 0) {
            key_gap = std::strtoull(a.c_str() + 7, nullptr, 10);
        } else if (a.rfind("load=", 0) == 0) {
            // load=path,offset: what a UsbLoad region would leave in PSRAM.
            size_t comma = a.rfind(',');
            loads.emplace_back(a.substr(5, comma - 5), std::strtoul(a.c_str() + comma + 1, nullptr, 0));
        } else if (a.rfind("dump=", 0) == 0) {
            std::sscanf(a.c_str() + 5, "%zi,%zi", &dump_offset, &dump_bytes);
        }
    }

    VerilatedContext* ctx = new VerilatedContext;
    ctx->commandArgs(1, argv);
    Vtiliqua_soc* top = new Vtiliqua_soc{ctx};

    PSRAMDriver<Vtiliqua_soc> psram(top);
    I2SDriver<Vtiliqua_soc> i2s(top);
    DVIDriver<Vtiliqua_soc> dvi(top);
    EncoderDriver encoder(top, parse_events(enc_text, key_gap), key_gap);

    // Firmware and bootinfo where the bootloader leaves them.
    {
        std::ifstream f(argv[1], std::ios::binary);
        if (!f) { fprintf(stderr, "no firmware %s\n", argv[1]); return 2; }
        f.read((char*)psram.psram_data + PSRAM_FW_OFFSET, psram.psram_size_bytes - PSRAM_FW_OFFSET);
    }
    {
        std::ifstream f(argv[2], std::ios::binary);
        if (!f) { fprintf(stderr, "no bootinfo %s\n", argv[2]); return 2; }
        f.read((char*)psram.psram_data + BOOTINFO_OFFSET, 4096);
    }

    for (const auto& [path, offset] : loads) {
        std::ifstream f(path, std::ios::binary);
        if (!f) { fprintf(stderr, "no file %s\n", path.c_str()); return 2; }
        f.read((char*)psram.psram_data + offset, psram.psram_size_bytes - offset);
    }

    // The inputs: one sample per audio frame for the whole run. The calibrator turns a
    // raw sample r into mul * r + add (full scale, 1.0, is 8.192 V), and the driver
    // sends its sample one bit late, so it arrives doubled: undo both.
    uint64_t audio_frames = cycles / (SYNC_CLK_HZ / 48000) + 64;
    const float cal_mul[4] = {ADC_MUL0, ADC_MUL1, ADC_MUL2, ADC_MUL3};
    const float cal_add[4] = {ADC_ADD0, ADC_ADD1, ADC_ADD2, ADC_ADD3};
    for (int ch = 0; ch < 4; ++ch) {
        auto sample = [&](int mv) {
            float raw = (mv / 8192.0f - cal_add[ch]) / cal_mul[ch];
            return (int16_t)(raw * 32768.0f / 2.0f);
        };
        const Pulse& p = pulses[ch];
        for (uint64_t n = 0; n < audio_frames; ++n) {
            int mv = cv_mv[ch];
            if (p.period) {
                mv = n >= p.start && (n - p.start) % p.period < p.high ? p.hi : p.lo;
            }
            i2s.inject_sample(ch, sample(mv));
            // (the driver takes channel 2's next sample twice a frame, at the last slot's end
            // and at the frame's start, and sends the second)
            if (ch == 2) i2s.inject_sample(ch, sample(mv));
        }
    }

    std::ofstream audio("audio.raw", std::ios::binary);
    std::ofstream trace("trace.raw", std::ios::binary);
    std::ofstream uart("uart.txt", std::ios::binary);

    // The three clocks' half periods, in picoseconds.
    const uint64_t half_sync = 500000000000ULL / SYNC_CLK_HZ;
    const uint64_t half_dvi = 500000000000ULL / DVI_CLK_HZ;
    const uint64_t half_audio = 500000000000ULL / AUDIO_CLK_HZ;
    uint64_t next_sync = half_sync, next_dvi = half_dvi, next_audio = half_audio;

    top->rst_sync = top->rst_dvi = top->rst_audio = 1;
    top->eval();
    top->clk_sync = 1; top->eval(); top->clk_sync = 0; top->eval();
    top->clk_dvi = 1; top->eval(); top->clk_dvi = 0; top->eval();
    top->clk_audio = 1; top->eval(); top->clk_audio = 0; top->eval();
    top->rst_sync = top->rst_dvi = top->rst_audio = 0;
    top->eval();

    uint64_t cycle = 0, words = 0, last_report = 0;
    bool line_start = true;
    while (cycle < cycles && !ctx->gotFinish()) {
        uint64_t now = std::min(next_sync, std::min(next_dvi, next_audio));

        // The DAC tap and the UART sample what the rising edge will latch: the
        // values settled before the clock moves.
        bool rising_sync = now == next_sync && !top->clk_sync;
        if (rising_sync) {
            if (top->dac_valid && top->dac_ready) {
                audio.write((const char*)&top->dac_data, 8);
                trace.write((const char*)&top->dsp_trace, sizeof(top->dsp_trace));
                ++words;
            }
            if (top->uart0_w_stb) {
                // Every line stamped with the clock, to see how long the boot takes.
                if (line_start) {
                    uart << "[" << cycle << "] ";
                    line_start = false;
                }
                uart.put((char)top->uart0_w_data);
                uart.flush();
                line_start = top->uart0_w_data == '\n';
            }
        }

        if (now == next_dvi) {
            top->clk_dvi = !top->clk_dvi;
            dvi.post_edge();
            next_dvi += half_dvi;
        }
        if (now == next_audio) {
            top->clk_audio = !top->clk_audio;
            i2s.post_edge();
            next_audio += half_audio;
        }
        if (now == next_sync) {
            top->clk_sync = !top->clk_sync;
            psram.post_edge();
            next_sync += half_sync;
            if (top->clk_sync) {
                ++cycle;
                encoder.tick(cycle);
                if (cycle - last_report >= 10000000) {
                    last_report = cycle;
                    fprintf(stderr, "[sim] %llu clocks, %llu audio frames\n",
                            (unsigned long long)cycle, (unsigned long long)words);
                }
            }
        }
        top->eval();
    }

    printf("\n[sim] done: %llu clocks, %llu audio frames\n", (unsigned long long)cycle,
           (unsigned long long)words);
    psram.post_sim();

    // PSRAM as the engine sees it, for checking the audio against the model.
    if (dump_bytes) {
        std::ofstream dump("psram.bin", std::ios::binary);
        dump.write((const char*)psram.psram_data + dump_offset, dump_bytes);
    }
    return 0;
}
