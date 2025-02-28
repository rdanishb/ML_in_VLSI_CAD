#include <hls_stream.h>
#include <ap_int.h>

// Define bit-width for counter
typedef ap_uint<8> uint8;

void frequency_divider(bool clk, bool reset, uint8 N, bool &clk_out) {
    #pragma HLS INTERFACE ap_ctrl_none port=return
    #pragma HLS INTERFACE s_axilite port=clk
    #pragma HLS INTERFACE s_axilite port=reset
    #pragma HLS INTERFACE s_axilite port=N
    #pragma HLS INTERFACE s_axilite port=clk_out

    static uint8 counter = 0;
    static bool clk_div = 0;
    #pragma HLS RESET variable=counter
    #pragma HLS RESET variable=clk_div

    if (reset) {
        counter = 0;
        clk_div = 0;
    } else if (clk) {
        if (counter >= (N - 1)) {
            counter = 0;
            clk_div = !clk_div;
        } else {
            counter++;
        }
    }
    clk_out = clk_div;
}
