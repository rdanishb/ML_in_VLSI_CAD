#include <hls_stream.h>
#include <ap_int.h>

#define N 4 // Number of inputs/neurons

typedef ap_int<8> data_t;
typedef ap_int<16> acc_t;

typedef struct {
    data_t weights[N];
    data_t inputs[N];
} nn_layer_t;

typedef struct {
    acc_t output;
} nn_output_t;

void nn_accelerator(nn_layer_t layer, nn_output_t &result) {
    #pragma HLS INTERFACE ap_ctrl_none port=return
    #pragma HLS INTERFACE s_axilite port=layer
    #pragma HLS INTERFACE s_axilite port=result

    acc_t sum = 0;
    for (int i = 0; i < N; i++) {
        #pragma HLS UNROLL
        sum += layer.weights[i] * layer.inputs[i];
    }
    result.output = sum;
}
