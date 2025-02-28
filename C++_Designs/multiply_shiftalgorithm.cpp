#include <hls_stream.h>
#include <ap_int.h>

// Define bit-width
typedef ap_uint<4> uint4;
typedef ap_uint<8> uint8;

// 4-bit Multiplication using Shift-Add Algorithm
void shift_add_multiplier(uint4 a, uint4 b, uint8 &product) {
    #pragma HLS INTERFACE ap_ctrl_none port=return
    #pragma HLS INTERFACE s_axilite port=a
    #pragma HLS INTERFACE s_axilite port=b
    #pragma HLS INTERFACE s_axilite port=product

    product = 0;
    uint8 multiplicand = a;
    uint4 multiplier = b;
    
    for (int i = 0; i < 4; i++) {
        #pragma HLS UNROLL
        if (multiplier[i]) {
            product += (multiplicand << i);
        }
    }
}
