#include <hls_stream.h>
#include <ap_int.h>

#define WIDTH 4 // Define the width of the ring counter

typedef ap_uint<WIDTH> counter_t;

typedef struct {
    bool reset;
} ring_counter_input_t;

typedef struct {
    counter_t count;
} ring_counter_output_t;

void ring_counter(ring_counter_input_t input, ring_counter_output_t &output) {
    #pragma HLS INTERFACE ap_ctrl_none port=return
    #pragma HLS INTERFACE s_axilite port=input
    #pragma HLS INTERFACE s_axilite port=output

    static counter_t reg = 1; // Initial value with a single '1'
    #pragma HLS RESET variable=reg

    if (input.reset) {
        reg = 1; // Reset to initial state
    } else {
        reg = (reg << 1) | (reg >> (WIDTH - 1)); // Rotate left
    }
    output.count = reg;
}
