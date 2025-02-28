#include <hls_stream.h>
#include <ap_int.h>

#define STACK_SIZE 8 // Define stack depth

typedef ap_uint<8> data_t;

typedef struct {
    bool push;
    bool pop;
    data_t data_in;
} lifo_input_t;

typedef struct {
    data_t data_out;
    bool empty;
    bool full;
} lifo_output_t;

void lifo_stack(lifo_input_t input, lifo_output_t &output) {
    #pragma HLS INTERFACE ap_ctrl_none port=return
    #pragma HLS INTERFACE s_axilite port=input
    #pragma HLS INTERFACE s_axilite port=output

    static data_t stack[STACK_SIZE];
    static ap_uint<4> top = 0; // Stack pointer
    #pragma HLS RESET variable=top

    output.data_out = 0; // Default output

    if (input.push && !input.pop && top < STACK_SIZE) {
        stack[top++] = input.data_in; // Push operation
    } 
    else if (input.pop && !input.push && top > 0) {
        output.data_out = stack[--top]; // Pop operation
    }

    output.empty = (top == 0);
    output.full = (top == STACK_SIZE);
}
