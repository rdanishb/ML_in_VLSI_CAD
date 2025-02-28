#include <hls_stream.h>
#include <ap_int.h>

// Define bit-width
typedef ap_uint<4> uint4;
typedef ap_uint<1> uint1;

// 4-bit Binary Subtracter
void binary_subtracter(uint4 a, uint4 b, uint1 bin, uint4 &diff, uint1 &bout) {
    #pragma HLS INTERFACE ap_ctrl_none port=return
    #pragma HLS INTERFACE s_axilite port=a
    #pragma HLS INTERFACE s_axilite port=b
    #pragma HLS INTERFACE s_axilite port=bin
    #pragma HLS INTERFACE s_axilite port=diff
    #pragma HLS INTERFACE s_axilite port=bout

    uint1 borrow[5];
    borrow[0] = bin;
    
    for (int i = 0; i < 4; i++) {
        #pragma HLS UNROLL
        uint1 a_bit = a[i];
        uint1 b_bit = b[i];
        diff[i] = a_bit ^ b_bit ^ borrow[i];
        borrow[i+1] = (~a_bit & b_bit) | ((~a_bit | b_bit) & borrow[i]);
    }
    
    bout = borrow[4];
}
