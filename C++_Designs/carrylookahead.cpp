#include <hls_stream.h>
#include <ap_int.h>

// Define bit-width
typedef ap_uint<4> uint4;
typedef ap_uint<1> uint1;

// 4-bit Carry Lookahead Adder
void carry_lookahead_adder(uint4 a, uint4 b, uint1 cin, uint4 &sum, uint1 &cout) {
    #pragma HLS INTERFACE ap_ctrl_none port=return
    #pragma HLS INTERFACE s_axilite port=a
    #pragma HLS INTERFACE s_axilite port=b
    #pragma HLS INTERFACE s_axilite port=cin
    #pragma HLS INTERFACE s_axilite port=sum
    #pragma HLS INTERFACE s_axilite port=cout

    uint1 p[4], g[4], c[5];
    
    // Generate and propagate signals
    for (int i = 0; i < 4; i++) {
        #pragma HLS UNROLL
        p[i] = a[i] ^ b[i];
        g[i] = a[i] & b[i];
    }
    
    // Carry computation
    c[0] = cin;
    c[1] = g[0] | (p[0] & c[0]);
    c[2] = g[1] | (p[1] & c[1]);
    c[3] = g[2] | (p[2] & c[2]);
    c[4] = g[3] | (p[3] & c[3]);
    
    // Sum computation
    for (int i = 0; i < 4; i++) {
        #pragma HLS UNROLL
        sum[i] = p[i] ^ c[i];
    }
    
    cout = c[4];
}
