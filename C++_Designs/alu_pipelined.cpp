#include <hls_stream.h>
#include <ap_int.h>

#define WIDTH 8 // Define data width

typedef ap_int<WIDTH> data_t;
typedef ap_int<16> result_t;

enum alu_op_t { ADD, SUB, MUL, AND_OP, OR_OP, XOR_OP };

void pipelined_alu(data_t a, data_t b, alu_op_t op, result_t &result) {
    #pragma HLS INTERFACE ap_ctrl_none port=return
    #pragma HLS INTERFACE s_axilite port=a
    #pragma HLS INTERFACE s_axilite port=b
    #pragma HLS INTERFACE s_axilite port=op
    #pragma HLS INTERFACE s_axilite port=result
    #pragma HLS PIPELINE II=1 // Pipeline with initiation interval of 1

    switch (op) {
        case ADD:
            result = a + b;
            break;
        case SUB:
            result = a - b;
            break;
        case MUL:
            result = a * b;
            break;
        case AND_OP:
            result = a & b;
            break;
        case OR_OP:
            result = a | b;
            break;
        case XOR_OP:
            result = a ^ b;
            break;
    }
}
