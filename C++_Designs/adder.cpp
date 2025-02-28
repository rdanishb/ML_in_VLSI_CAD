#include <hls_stream.h>
#include <ap_int.h>

// Top-level function for HLS synthesis
typedef ap_uint<4> uint4;
typedef ap_uint<5> uint5;

void adder_4bit(uint4 a, uint4 b, uint5 &sum) {
    #pragma HLS INTERFACE ap_ctrl_none port=return
    #pragma HLS INTERFACE s_axilite port=a
    #pragma HLS INTERFACE s_axilite port=b
    #pragma HLS INTERFACE s_axilite port=sum
    
    sum = a + b;
}
