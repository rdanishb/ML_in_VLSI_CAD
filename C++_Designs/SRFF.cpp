#include <hls_stream.h>
#include <ap_int.h>

// Define SR Flip-Flop function
void sr_flip_flop(bool clk, bool s, bool r, bool reset, bool &q) {
    #pragma HLS INTERFACE ap_ctrl_none port=return
    #pragma HLS INTERFACE s_axilite port=clk
    #pragma HLS INTERFACE s_axilite port=s
    #pragma HLS INTERFACE s_axilite port=r
    #pragma HLS INTERFACE s_axilite port=reset
    #pragma HLS INTERFACE s_axilite port=q

    static bool q_reg = 0;
    #pragma HLS RESET variable=q_reg

    if (reset) {
        q_reg = 0;
    } else if (clk) {
        if (s && !r) {
            q_reg = 1; // Set
        } else if (!s && r) {
            q_reg = 0; // Reset
        } else if (s && r) {
            q_reg = 0; // Invalid state, resetting to 0
        }
    }
    q = q_reg;
}
