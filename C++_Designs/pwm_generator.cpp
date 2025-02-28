#include <hls_stream.h>
#include <ap_int.h>

#define WIDTH 8 // Bit-width of the counter

typedef ap_uint<WIDTH> pwm_t;

typedef struct {
    pwm_t duty_cycle;
} pwm_input_t;

typedef struct {
    bool pwm_out;
} pwm_output_t;

void pwm_generator(pwm_input_t input, pwm_output_t &output) {
    #pragma HLS INTERFACE ap_ctrl_none port=return
    #pragma HLS INTERFACE s_axilite port=input
    #pragma HLS INTERFACE s_axilite port=output

    static pwm_t counter = 0;
    #pragma HLS RESET variable=counter

    counter++;
    output.pwm_out = (counter < input.duty_cycle);
}
