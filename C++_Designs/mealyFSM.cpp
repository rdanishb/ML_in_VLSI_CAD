#include <hls_stream.h>
#include <ap_int.h>

#define IDLE 0
#define S1 1
#define S2 2
#define S3 3

typedef ap_uint<1> bit_t;
typedef ap_uint<3> state_t;

// Mealy State Machine for Sequence Detection (Detecting 1011)
void sequence_detector_mealy(bit_t clk, bit_t reset, bit_t input_bit, bit_t &detected) {
    #pragma HLS INTERFACE ap_ctrl_none port=return
    #pragma HLS INTERFACE s_axilite port=clk
    #pragma HLS INTERFACE s_axilite port=reset
    #pragma HLS INTERFACE s_axilite port=input_bit
    #pragma HLS INTERFACE s_axilite port=detected

    static state_t state = IDLE;
    #pragma HLS RESET variable=state

    detected = 0; // Mealy FSM outputs depend on both state and input

    if (reset) {
        state = IDLE;
    } else {
        switch (state) {
            case IDLE:
                state = (input_bit == 1) ? S1 : IDLE;
                break;
            case S1:
                state = (input_bit == 0) ? S2 : S1;
                break;
            case S2:
                state = (input_bit == 1) ? S3 : IDLE;
                break;
            case S3:
                detected = (input_bit == 1) ? 1 : 0;
                state = (input_bit == 1) ? S1 : S2;
                break;
        }
    }
}
