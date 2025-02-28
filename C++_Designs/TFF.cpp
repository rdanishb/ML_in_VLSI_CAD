#include <hls_stream.h>
#include <ap_int.h>

// Define T Flip-Flop function
void t_flip_flop(bool clk, bool t, bool reset, bool &q) {
    #pragma HLS INTERFACE ap_ctrl_none port=return
    #pragma HLS INTERFACE s_axilite port=clk
    #pragma HLS INTERFACE s_axilite port=t
    #pragma HLS INTERFACE s_axilite port=reset
    #pragma HLS INTERFACE s_axilite port=q

    static bool q_reg = 0;
    #pragma HLS RESET variable=q_reg

    if (reset) {
        q_reg = 0;
    } else if (clk) {
        if (t) {
            q_reg = !q_reg; // Toggle
        }
    }
    q = q_reg;
}
