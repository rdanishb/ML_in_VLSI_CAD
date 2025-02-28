#include <hls_stream.h>
#include <ap_int.h>

// Define bit-width
typedef ap_uint<4> uint4;

void counter(bool clk, bool enable, bool reset, uint4 &count) {
    #pragma HLS INTERFACE ap_ctrl_none port=return
    #pragma HLS INTERFACE s_axilite port=clk
    #pragma HLS INTERFACE s_axilite port=enable
    #pragma HLS INTERFACE s_axilite port=reset
    #pragma HLS INTERFACE s_axilite port=count

    static uint4 counter_value = 0;
    #pragma HLS RESET variable=counter_value

    if (clk) {
        if (reset) {
            counter_value = 0;
        } else if (enable) {
            counter_value++;
        }
    }
    count = counter_value;
}
