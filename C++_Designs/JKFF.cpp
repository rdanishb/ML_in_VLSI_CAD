#include <hls_stream.h>
#include <ap_int.h>

// Define JK Flip-Flop function
void jk_flip_flop(bool clk, bool j, bool k, bool reset, bool &q) {
    #pragma HLS INTERFACE ap_ctrl_none port=return
    #pragma HLS INTERFACE s_axilite port=clk
    #pragma HLS INTERFACE s_axilite port=j
    #pragma HLS INTERFACE s_axilite port=k
    #pragma HLS INTERFACE s_axilite port=reset
    #pragma HLS INTERFACE s_axilite port=q

    static bool q_reg = 0;
    #pragma HLS RESET variable=q_reg

    if (reset) {
        q_reg = 0;
    } else if (clk) {
        if (j == 0 && k == 0) {
            q_reg = q_reg; // No change
        } else if (j == 0 && k == 1) {
            q_reg = 0; // Reset
        } else if (j == 1 && k == 0) {
            q_reg = 1; // Set
        } else if (j == 1 && k == 1) {
            q_reg = !q_reg; // Toggle
        }
    }
    q = q_reg;
}
