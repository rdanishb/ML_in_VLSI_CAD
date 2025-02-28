#include <hls_stream.h>
#include <ap_int.h>

#define IDLE 0
#define S1 1
#define S2 2
#define S3 3
#define S4 4

typedef ap_uint<1> bit_t;
typedef ap_uint<3> state_t;

// Moore State Machine for Sequence Detection (Detecting 1011)
void sequence_detector_moore(bit_t clk, bit_t reset, bit_t input_bit, bit_t &detected) {
    #pragma HLS INTERFACE ap_ctrl_none port=return
    #pragma HLS INTERFACE s_axilite port=clk
    #pragma HLS INTERFACE s_axilite port=reset
    #pragma HLS INTERFACE s_axilite port=input_bit
    #pragma HLS INTERFACE s_axilite port=detected

    static state_t state = IDLE;
    #pragma HLS RESET variable=state

    if (reset) {
        state = IDLE;
        detected = 0;
    } else {
        switch (state) {
            case IDLE:
                state = (input_bit == 1) ? S1 : IDLE;
                detected = 0;
                break;
            case S1:
                state = (input_bit == 0) ? S2 : S1;
                break;
            case S2:
                state = (input_bit == 1) ? S3 : IDLE;
                break;
            case S3:
                state = (input_bit == 1) ? S4 : S2;
                break;
            case S4:
                detected = 1;
                state = (input_bit == 1) ? S1 : S2;
                break;
        }
    }
}
