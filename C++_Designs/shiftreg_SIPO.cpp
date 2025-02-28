#include <hls_stream.h>
#include <ap_int.h>

// Define bit-width
typedef ap_uint<4> uint4;

// Shift Register (Serial-in, Parallel-out)
void sipo_shift_register(bool clk, bool reset, bool serial_in, uint4 &parallel_out) {
    #pragma HLS INTERFACE ap_ctrl_none port=return
    #pragma HLS INTERFACE s_axilite port=clk
    #pragma HLS INTERFACE s_axilite port=reset
    #pragma HLS INTERFACE s_axilite port=serial_in
    #pragma HLS INTERFACE s_axilite port=parallel_out

    static uint4 shift_reg = 0;
    #pragma HLS RESET variable=shift_reg

    if (reset) {
        shift_reg = 0;
    } else if (clk) {
        shift_reg = (shift_reg << 1) | serial_in;
    }
    parallel_out = shift_reg;
}
