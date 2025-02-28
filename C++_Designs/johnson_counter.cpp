#include <hls_stream.h>
#include <ap_int.h>

#define WIDTH 4 // Define the width of the Johnson counter

typedef ap_uint<WIDTH> counter_t;

typedef struct {
    bool reset;
} johnson_counter_input_t;

typedef struct {
    counter_t count;
} johnson_counter_output_t;

void johnson_counter(johnson_counter_input_t input, johnson_counter_output_t &output) {
    #pragma HLS INTERFACE ap_ctrl_none port=return
    #pragma HLS INTERFACE s_axilite port=input
    #pragma HLS INTERFACE s_axilite port=output

    static counter_t reg = 0; // Initial state
    #pragma HLS RESET variable=reg

    if (input.reset) {
        reg = 0; // Reset to initial state
    } else {
        bool feedback = ~reg[WIDTH - 1]; // Inverted MSB feedback
        reg = (reg << 1) | feedback; // Shift left with feedback
    }
    output.count = reg;
}
