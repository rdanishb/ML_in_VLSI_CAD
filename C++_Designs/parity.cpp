#include <hls_stream.h>
#include <ap_int.h>

// Define bit-width
typedef ap_uint<4> uint4;
typedef ap_uint<1> uint1;

// 4-bit Parity Generator and Checker
void parity_generator_checker(uint4 data, uint1 &parity, bool &error) {
    #pragma HLS INTERFACE ap_ctrl_none port=return
    #pragma HLS INTERFACE s_axilite port=data
    #pragma HLS INTERFACE s_axilite port=parity
    #pragma HLS INTERFACE s_axilite port=error

    // Generate Even Parity
    parity = data[0] ^ data[1] ^ data[2] ^ data[3];
    
    // Error checking (assuming received parity bit is correct)
    error = (parity != 0);
}
