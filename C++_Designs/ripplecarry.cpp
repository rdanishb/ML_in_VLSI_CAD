#include <hls_stream.h>
#include <ap_int.h>

// Define bit-width
typedef ap_uint<4> uint4;
typedef ap_uint<1> uint1;

// 4-bit Ripple Carry Adder
void ripple_carry_adder_4bit(uint4 a, uint4 b, uint1 cin, uint4 &sum, uint1 &cout) {
    #pragma HLS INTERFACE ap_ctrl_none port=return
    #pragma HLS INTERFACE s_axilite port=a
    #pragma HLS INTERFACE s_axilite port=b
    #pragma HLS INTERFACE s_axilite port=cin
    #pragma HLS INTERFACE s_axilite port=sum
    #pragma HLS INTERFACE s_axilite port=cout

    uint1 carry = cin;
    for (int i = 0; i < 4; i++) {
        #pragma HLS UNROLL
        uint1 a_bit = a[i];
        uint1 b_bit = b[i];
        sum[i] = a_bit ^ b_bit ^ carry;
        carry = (a_bit & b_bit) | (carry & (a_bit ^ b_bit));
    }
    cout = carry;
}
