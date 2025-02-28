#include <hls_stream.h>
#include <ap_int.h>

// Define bit-width
typedef ap_uint<2> uint2;
typedef ap_uint<8> uint8;

// 1:4 Demultiplexer
void demux_1to4(uint8 in, uint2 sel, uint8 &out0, uint8 &out1, uint8 &out2, uint8 &out3) {
    #pragma HLS INTERFACE ap_ctrl_none port=return
    #pragma HLS INTERFACE s_axilite port=in
    #pragma HLS INTERFACE s_axilite port=sel
    #pragma HLS INTERFACE s_axilite port=out0
    #pragma HLS INTERFACE s_axilite port=out1
    #pragma HLS INTERFACE s_axilite port=out2
    #pragma HLS INTERFACE s_axilite port=out3

    out0 = 0;
    out1 = 0;
    out2 = 0;
    out3 = 0;

    switch (sel) {
        case 0: out0 = in; break;
        case 1: out1 = in; break;
        case 2: out2 = in; break;
        case 3: out3 = in; break;
        default: break;
    }
}
