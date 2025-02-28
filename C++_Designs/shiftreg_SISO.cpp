#include <hls_stream.h>
#include <ap_int.h>

// Define bit-width
typedef ap_uint<4> uint4;
typedef ap_uint<1> uint1;

// 4-bit Serial-in Serial-out (SISO) Shift Register
void shift_register_siso(uint1 clk, uint1 reset, uint1 serial_in, uint1 &serial_out) {
    #pragma HLS INTERFACE ap_ctrl_none port=return
    #pragma HLS INTERFACE s_axilite port=clk
    #pragma HLS INTERFACE s_axilite port=reset
    #pragma HLS INTERFACE s_axilite port=serial_in
    #pragma HLS INTERFACE s_axilite port=serial_out

    static uint4 shift_reg = 0;
    #pragma HLS RESET variable=shift_reg

    if (reset) {
        shift_reg = 0;
    } else if (clk) {
        serial_out = shift_reg[3]; // Output MSB
        shift_reg = (shift_reg << 1) | serial_in;
    }
}
