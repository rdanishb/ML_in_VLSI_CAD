#include <hls_stream.h>
#include <ap_int.h>

// Define bit-width
typedef ap_uint<2> uint2;
typedef ap_uint<8> uint8;

// 4:1 Multiplexer
void mux_4to1(uint8 in0, uint8 in1, uint8 in2, uint8 in3, uint2 sel, uint8 &out) {
    #pragma HLS INTERFACE ap_ctrl_none port=return
    #pragma HLS INTERFACE s_axilite port=in0
    #pragma HLS INTERFACE s_axilite port=in1
    #pragma HLS INTERFACE s_axilite port=in2
    #pragma HLS INTERFACE s_axilite port=in3
    #pragma HLS INTERFACE s_axilite port=sel
    #pragma HLS INTERFACE s_axilite port=out

    switch (sel) {
        case 0: out = in0; break;
        case 1: out = in1; break;
        case 2: out = in2; break;
        case 3: out = in3; break;
        default: out = 0;
    }
}
