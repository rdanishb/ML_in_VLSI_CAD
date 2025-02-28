#include <hls_stream.h>
#include <ap_int.h>

// Define bit-widths
typedef ap_uint<4> uint4;
typedef ap_uint<5> uint5;
typedef ap_uint<3> uint3;

enum ALU_Op {
    ADD = 0,
    SUB = 1,
    AND_OP = 2,
    OR_OP = 3,
    XOR_OP = 4
};

void ALU(uint4 a, uint4 b, uint3 op, uint5 &result) {
    #pragma HLS INTERFACE ap_ctrl_none port=return
    #pragma HLS INTERFACE s_axilite port=a
    #pragma HLS INTERFACE s_axilite port=b
    #pragma HLS INTERFACE s_axilite port=op
    #pragma HLS INTERFACE s_axilite port=result

    switch(op) {
        case ADD: result = a + b; break;
        case SUB: result = a - b; break;
        case AND_OP: result = a & b; break;
        case OR_OP: result = a | b; break;
        case XOR_OP: result = a ^ b; break;
        default: result = 0;
    }
}
