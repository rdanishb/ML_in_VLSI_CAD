#include <hls_stream.h>
#include <ap_int.h>

#define WIDTH 8 // Define register width

typedef ap_uint<WIDTH> reg_t;

enum shift_mode_t { NO_SHIFT, LEFT_SHIFT, RIGHT_SHIFT, LOAD };

typedef struct {
    reg_t data_in;
    bool serial_in;
    shift_mode_t mode;
} shift_input_t;

typedef struct {
    reg_t data_out;
} shift_output_t;

void universal_shift_register(shift_input_t input, shift_output_t &output) {
    #pragma HLS INTERFACE ap_ctrl_none port=return
    #pragma HLS INTERFACE s_axilite port=input
    #pragma HLS INTERFACE s_axilite port=output

    static reg_t reg = 0; // Register storage
    #pragma HLS RESET variable=reg

    switch (input.mode) {
        case NO_SHIFT:
            break;
        case LEFT_SHIFT:
            reg = (reg << 1) | input.serial_in;
            break;
        case RIGHT_SHIFT:
            reg = (reg >> 1) | (input.serial_in << (WIDTH - 1));
            break;
        case LOAD:
            reg = input.data_in;
            break;
    }
    output.data_out = reg;
}
