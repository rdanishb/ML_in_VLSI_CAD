#include <hls_stream.h>
#include <ap_int.h>

// Define D Flip-Flop function
void d_flip_flop(bool clk, bool d, bool reset, bool &q) {
    #pragma HLS INTERFACE ap_ctrl_none port=return
    #pragma HLS INTERFACE s_axilite port=clk
    #pragma HLS INTERFACE s_axilite port=d
    #pragma HLS INTERFACE s_axilite port=reset
    #pragma HLS INTERFACE s_axilite port=q

    static bool q_reg = 0;
    #pragma HLS RESET variable=q_reg

    if (reset) {
        q_reg = 0;
    } else if (clk) {
        q_reg = d;
    }
    q = q_reg;
}
