#include <hls_stream.h>
#include <ap_int.h>

// Define bit-width
typedef ap_uint<4> uint4;
typedef ap_uint<2> uint2;

// 4:2 Priority Encoder
void priority_encoder_4to2(uint4 in, uint2 &out, bool &valid) {
    #pragma HLS INTERFACE ap_ctrl_none port=return
    #pragma HLS INTERFACE s_axilite port=in
    #pragma HLS INTERFACE s_axilite port=out
    #pragma HLS INTERFACE s_axilite port=valid

    valid = 1;
    if (in[3]) {
        out = 3;
    } else if (in[2]) {
        out = 2;
    } else if (in[1]) {
        out = 1;
    } else if (in[0]) {
        out = 0;
    } else {
        valid = 0; // No valid input
        out = 0;
    }
}
