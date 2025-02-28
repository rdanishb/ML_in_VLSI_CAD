#include <hls_stream.h>
#include <ap_int.h>

// Define bit-width
typedef ap_uint<8> uint8;

// Linear Feedback Shift Register (LFSR) - Pseudo-Random Number Generator
void lfsr_prng(bool clk, bool reset, uint8 &random_out) {
    #pragma HLS INTERFACE ap_ctrl_none port=return
    #pragma HLS INTERFACE s_axilite port=clk
    #pragma HLS INTERFACE s_axilite port=reset
    #pragma HLS INTERFACE s_axilite port=random_out

    static uint8 lfsr = 0b00000001; // Initial non-zero state
    #pragma HLS RESET variable=lfsr

    if (reset) {
        lfsr = 0b00000001; // Reset to initial state
    } else {
        bool feedback = lfsr[7] ^ lfsr[5] ^ lfsr[4] ^ lfsr[3]; // Example taps for an 8-bit LFSR
        lfsr = (lfsr << 1) | feedback; // Shift left and insert feedback bit
    }
    random_out = lfsr;
}
