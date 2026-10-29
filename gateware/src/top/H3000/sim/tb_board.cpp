// CXXRTL testbench for the H3000 DSP board.
//
// usage: tb_board <img1|-> <img2|-> <img3|-> <warm_frames> <log_frames> <trace.txt>
//
// Loads the three TMS32010 program images (H3000 image format: first word is
// the load address), runs the board with a deterministic stereo input and
// writes every bus I/O event of the logged frames as
//     frame pos dsp IN|OUT port value
// plus "DAC frame left right" lines and "BUS frame value" lines for the
// host's bus reads (port frame & 7 in each logged frame). model/trace.py
// writes the same format from the Python reference model, so the two can be
// diffed.
//
// H3K_CLOCK=mode,left,right selects the DAC clock and has the host program
// the frequency synthesizers through its bus slot.

#include "simtop.cc"

#include <cmath>
#include <cstdint>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <tuple>
#include <utility>
#include <vector>

static bool load_image(const char *path, uint16_t &org, std::vector<uint16_t> &words) {
    if (!strcmp(path, "-"))
        return false;
    FILE *f = fopen(path, "rb");
    if (!f) {
        fprintf(stderr, "cannot open %s\n", path);
        exit(1);
    }
    std::vector<uint16_t> all;
    int hi, lo;
    while ((hi = fgetc(f)) != EOF && (lo = fgetc(f)) != EOF)
        all.push_back((uint16_t)((hi << 8) | lo));
    fclose(f);
    org = all[0] & 0xFFF;
    words.assign(all.begin() + 1, all.end());
    return true;
}

// H3K_DUMP=path replays a session recorded by `h3000-host ... dump` (the
// programs, host latch writes, bus writes and clock selects; events at
// 26 E cycles per frame) with a 441 Hz tone input, and logs only DAC lines.
// FIRQ acknowledges are latch writes to PARAM_FIRQ_ACK (0x8000) in the dump
// and go to the board's param FIFO as they are.
static bool replay = false;

static int16_t adc_left(long frame) {
    if (replay)
        return (int16_t)lround(8000.0 * sin(2 * 3.14159265358979323846 * 441.0 * frame / 44100.0));
    return (int16_t)lround(8000.0 * sin(frame * 0.05));
}
static int16_t adc_right(long frame) {
    if (replay)
        return adc_left(frame);
    return (int16_t)lround(6000.0 * sin(frame * 0.031 + 1.0));
}

struct Dump {
    std::vector<std::pair<uint16_t, uint16_t>> prog[3];
    std::vector<std::pair<uint16_t, uint16_t>> params;
    std::vector<std::tuple<long, unsigned, unsigned>> bus;  // frame, port, data
    std::vector<std::pair<long, unsigned>> modes;           // frame, mode
    unsigned mode0 = 0;
};

static Dump load_dump(const char *path) {
    Dump d;
    FILE *f = fopen(path, "r");
    if (!f) {
        fprintf(stderr, "cannot open %s\n", path);
        exit(1);
    }
    char line[256];
    long long run = 0;
    std::vector<std::tuple<long long, unsigned, unsigned>> bus;
    std::vector<std::pair<long long, unsigned>> modes;
    std::vector<std::tuple<long long, unsigned, unsigned>> params;
    while (fgets(line, sizeof line, f)) {
        long long c;
        unsigned a, b, v;
        if (sscanf(line, "RUN %lld", &c) == 1)
            run = c;
        else if (sscanf(line, "PROG %u %x %x", &a, &b, &v) == 3)
            d.prog[a - 1].push_back({(uint16_t)b, (uint16_t)v});
        else if (sscanf(line, "PARAM %lld %x %x", &c, &a, &v) == 3)
            params.push_back({c, a, v});
        else if (sscanf(line, "BUS %lld %u %x", &c, &a, &v) == 3)
            bus.push_back({c, a, v});
        else if (sscanf(line, "MODE %lld %u", &c, &a) == 2)
            modes.push_back({c, a});
    }
    fclose(f);
    auto frame_of = [&](long long c) { return c < run ? 0L : (long)((c - run) / 26); };
    for (auto &[c, a, v] : params)
        if (c >= run)
            d.params.push_back({(uint16_t)a, (uint16_t)v});
    for (auto &[c, p, v] : bus)
        d.bus.push_back({frame_of(c), p, v});
    for (auto &[c, m] : modes) {
        if (c < run)
            d.mode0 = m;
        else
            d.modes.push_back({frame_of(c), m});
    }
    return d;
}

int main(int argc, char **argv) {
    if (argc != 7) {
        fprintf(stderr, "usage: %s img1 img2 img3 warm_frames log_frames trace.txt\n", argv[0]);
        return 2;
    }
    long warm = atol(argv[4]);
    long nlog = atol(argv[5]);
    FILE *out = fopen(argv[6], "w");
    Dump dump;
    if (const char *p = getenv("H3K_DUMP")) {
        replay = true;
        dump = load_dump(p);
    }
    size_t next_param = 0, next_bus = 0, next_mode = 0;

    cxxrtl_design::p_top top;
    // The extra step() after the rising edge settles the output ports, which
    // CXXRTL otherwise leaves one evaluation behind the registers.
    auto tick = [&]() {
        top.p_clk.set<bool>(false);
        top.step();
        top.p_clk.set<bool>(true);
        top.step();
        top.step();
    };

    top.p_rst.set<bool>(true);
    tick();
    tick();
    top.p_rst.set<bool>(false);
    top.p_run.set<bool>(false);
    for (int i = 0; i < 8; i++)
        tick();

    // Load programs. The 2K-word program RAM is mirrored, so reset at 0x000
    // enters the program loaded at 0x800 (as model/tms32010.py).
    for (int d = 0; d < 3; d++) {
        auto put = [&](uint16_t addr, uint16_t data) {
            top.p_ploadvalid.set<bool>(true);
            top.p_ploaddsp.set<uint8_t>(d);
            top.p_ploadaddr.set<uint16_t>(addr);
            top.p_ploaddata.set<uint16_t>(data);
            tick();
        };
        if (replay) {
            for (auto &[w, v] : dump.prog[d])
                put(0x800 | (w & 0x7FF), v);
            continue;
        }
        uint16_t org;
        std::vector<uint16_t> words;
        if (!load_image(argv[1 + d], org, words)) {
            org = 0x800;
            words = {0xF900, 0x0800};
        }
        for (size_t i = 0; i < words.size(); i++)
            put((org + i) & 0xFFF, words[i]);
    }
    top.p_ploadvalid.set<bool>(false);
    if (replay)
        top.p_clockmode.set<unsigned>(dump.mode0);

    // Host bus requests: one per clock while the FIFO has room.
    auto bus_push = [&](unsigned port, unsigned data, bool read) {
        top.p_busvalid.set<bool>(true);
        top.p_busport.set<unsigned>(port);
        top.p_busdata.set<unsigned>(data);
        top.p_busread.set<bool>(read);
        top.step();
        if (!top.p_busready.get<bool>()) {
            fprintf(stderr, "bus FIFO full\n");
            exit(1);
        }
        tick();
        top.p_busvalid.set<bool>(false);
        top.step();
    };
    if (const char *c = getenv("H3K_CLOCK")) {
        unsigned mode = 0, fl = 0xCC0, fr = 0xCC0;
        sscanf(c, "%i,%i,%i", &mode, &fl, &fr);
        top.p_clockmode.set<unsigned>(mode);
        bus_push(0, 0x2000 | fl, false);
        bus_push(0, 0x3000 | fr, false);
    }
    top.p_run.set<bool>(true);

    long frame_in = 0;
    top.p_adcvalid.set<bool>(true);
    top.p_adcl.set<uint16_t>((uint16_t)adc_left(0));
    top.p_adcr.set<uint16_t>((uint16_t)adc_right(0));
    top.step();

    long clocks = 0;
    long first_fetch = -1;
    unsigned max_frame_clocks = 0;
    unsigned long sum_frame_clocks = 0;
    const long end = warm + nlog;

    // Optional instruction trace of one DSP: TRACE=dsp,from_frame,to_frame,path
    int tr_dsp = -1;
    long tr_from = 0, tr_to = 0;
    FILE *tr = nullptr;
    if (const char *t = getenv("TRACE")) {
        char path[512];
        if (sscanf(t, "%d,%ld,%ld,%511s", &tr_dsp, &tr_from, &tr_to, path) == 4)
            tr = fopen(path, "w");
    }
    int watch_dsp = -1;
    unsigned watch_addr = 0, watch_val = 0;
    if (const char *w = getenv("WATCH"))
        sscanf(w, "%d,%x", &watch_dsp, &watch_addr);
    auto tr_state = [&](int d, unsigned &op, unsigned &cyc, unsigned &acc, unsigned &t) {
        switch (d) {
        case 0:
            op = top.p_board_2e_dsp0_2e_core_2e_if__opcodereg.curr.get<unsigned>();
            cyc = top.p_board_2e_dsp0_2e_core_2e_ex__inst__cycle.curr.get<unsigned>();
            acc = top.p_board_2e_dsp0_2e_core_2e_u__alu_2e_o__ALU__ACC__OUTPUT.curr.get<unsigned>();
            t = top.p_board_2e_dsp0_2e_core_2e_reg__t.curr.get<unsigned>();
            break;
        case 1:
            op = top.p_board_2e_dsp1_2e_core_2e_if__opcodereg.curr.get<unsigned>();
            cyc = top.p_board_2e_dsp1_2e_core_2e_ex__inst__cycle.curr.get<unsigned>();
            acc = top.p_board_2e_dsp1_2e_core_2e_u__alu_2e_o__ALU__ACC__OUTPUT.curr.get<unsigned>();
            t = top.p_board_2e_dsp1_2e_core_2e_reg__t.curr.get<unsigned>();
            break;
        default:
            op = top.p_board_2e_dsp2_2e_core_2e_if__opcodereg.curr.get<unsigned>();
            cyc = top.p_board_2e_dsp2_2e_core_2e_ex__inst__cycle.curr.get<unsigned>();
            acc = top.p_board_2e_dsp2_2e_core_2e_u__alu_2e_o__ALU__ACC__OUTPUT.curr.get<unsigned>();
            t = top.p_board_2e_dsp2_2e_core_2e_reg__t.curr.get<unsigned>();
            break;
        }
    };
    long bus_frame = -1;
    unsigned bus_reads = top.p_busreads.get<unsigned>();
    while (true) {
        long frame = top.p_frames.get<uint32_t>();
        if (frame >= end)
            break;
        bool push = false, push_param = false;
        if (replay) {
            // Replayed host traffic: clock selects and bus writes at their
            // frame, host latch writes as fast as the FIFO takes them.
            while (next_mode < dump.modes.size() && dump.modes[next_mode].first <= frame)
                top.p_clockmode.set<unsigned>(dump.modes[next_mode++].second);
            if (next_bus < dump.bus.size() && std::get<0>(dump.bus[next_bus]) <= frame &&
                top.p_busready.get<bool>()) {
                push = true;
                top.p_busvalid.set<bool>(true);
                top.p_busport.set<unsigned>(std::get<1>(dump.bus[next_bus]));
                top.p_busdata.set<unsigned>(std::get<2>(dump.bus[next_bus]));
                top.p_busread.set<bool>(false);
                next_bus++;
            }
            if (next_param < dump.params.size() && top.p_paramready.get<bool>()) {
                push_param = true;
                top.p_paramvalid.set<bool>(true);
                top.p_paramaddr.set<unsigned>(dump.params[next_param].first);
                top.p_paramdata.set<unsigned>(dump.params[next_param].second);
                next_param++;
            }
        } else if (frame >= warm && frame != bus_frame) {
            // Queue this frame's host read (the FIFO has room: one per frame).
            push = true;
            bus_frame = frame;
            top.p_busvalid.set<bool>(true);
            top.p_busport.set<unsigned>(frame & 7);
            top.p_busdata.set<unsigned>(0);
            top.p_busread.set<bool>(true);
        }
        bool consume = top.p_adcvalid.get<bool>() && top.p_adcready.get<bool>();
        if (!replay && top.p_ncen.get<bool>() && frame >= warm) {
            unsigned pos = top.p_pos.get<unsigned>();
            const value<12> *aout[3] = {&top.p_aout0, &top.p_aout1, &top.p_aout2};
            const value<1> *wen[3] = {&top.p_wen0, &top.p_wen1, &top.p_wen2};
            const value<1> *denn[3] = {&top.p_denn0, &top.p_denn1, &top.p_denn2};
            const value<16> *dout[3] = {&top.p_dout0, &top.p_dout1, &top.p_dout2};
            const value<16> *din[3] = {&top.p_din0, &top.p_din1, &top.p_din2};
            for (int d = 0; d < 3; d++) {
                unsigned a = aout[d]->get<unsigned>();
                if (a >= 8)
                    continue;
                if (!wen[d]->get<bool>())
                    fprintf(out, "%ld %u %d OUT %u %04x\n", frame, pos, d, a, dout[d]->get<unsigned>());
                if (!denn[d]->get<bool>())
                    fprintf(out, "%ld %u %d IN %u %04x\n", frame, pos, d, a, din[d]->get<unsigned>());
            }
        }
        if (top.p_dacvalid.get<bool>() && frame > warm && frame <= end) {
            unsigned fc = top.p_frameclk.get<unsigned>();
            if (fc > max_frame_clocks)
                max_frame_clocks = fc;
            sum_frame_clocks += fc;
        }
        if (top.p_dacvalid.get<bool>() && frame > warm && frame <= end)
            fprintf(out, "DAC %ld %04x %04x\n", frame - 1, top.p_dacl.get<unsigned>(),
                    top.p_dacr.get<unsigned>());
        if (first_fetch < 0 && top.p_aout0.get<unsigned>() == 0x800) {
            // B 0x800 at address 0 fetches its target in its second cycle.
            first_fetch = (long)top.p_frames.get<uint32_t>() * 104 + top.p_pos.get<unsigned>();
            fprintf(stderr, "dsp0 first fetch of 0x800 at frame cycle %ld\n", first_fetch);
        }
        bool was_ncen = top.p_ncen.get<bool>();
        tick();
        clocks++;
        if (push || push_param) {
            top.p_busvalid.set<bool>(false);
            top.p_paramvalid.set<bool>(false);
            top.step();
        }
        if (top.p_busreads.get<unsigned>() != bus_reads) {
            bus_reads = top.p_busreads.get<unsigned>();
            long f = top.p_frames.get<uint32_t>();
            if (f >= warm && f < end)
                fprintf(out, "BUS %ld %04x\n", f, top.p_busresult.get<unsigned>());
        }
        if (watch_dsp >= 0) {
            // WATCH=dsp,addr: report every change of one data-RAM word.
            const memory<16> *rams[3] = {
                &top.memory_p_board_2e_dsp0_2e_core_2e_u__ram_2e_RAM,
                &top.memory_p_board_2e_dsp1_2e_core_2e_u__ram_2e_RAM,
                &top.memory_p_board_2e_dsp2_2e_core_2e_u__ram_2e_RAM};
            unsigned v = (*rams[watch_dsp])[watch_addr].get<unsigned>();
            if (v != watch_val) {
                unsigned op, cyc, acc, t;
                tr_state(watch_dsp, op, cyc, acc, t);
                fprintf(stderr, "watch: frame %u pos %u ram[%02x] %04x -> %04x (opcode now %04x)\n",
                        top.p_frames.get<unsigned>(), top.p_pos.get<unsigned>(), watch_addr,
                        watch_val, v, op);
                watch_val = v;
            }
        }
        if (tr && was_ncen && frame >= tr_from && frame < tr_to) {
            // After an instruction-cycle edge: log each instruction as it starts.
            unsigned op, cyc, acc, t;
            tr_state(tr_dsp, op, cyc, acc, t);
            if (cyc == 0)
                fprintf(tr, "%u %u %04x %08x %04x\n", top.p_frames.get<unsigned>(),
                        top.p_pos.get<unsigned>(), op, acc, t);
        }
        if (consume) {
            frame_in++;
            top.p_adcl.set<uint16_t>((uint16_t)adc_left(frame_in));
            top.p_adcr.set<uint16_t>((uint16_t)adc_right(frame_in));
            top.step();
        }
    }
    fclose(out);
    if (tr)
        fclose(tr);
    fprintf(stderr, "frames=%ld clocks=%ld stall_clocks=%u misses=%u writebacks=%u "
            "frame_clocks(logged): avg=%.1f max=%u\n", end, clocks,
            top.p_stallclk.get<uint32_t>(), top.p_misses.get<uint32_t>(),
            top.p_writebacks.get<uint32_t>(),
            nlog > 1 ? (double)sum_frame_clocks / (nlog - 1) : 0.0, max_frame_clocks);
    return 0;
}
