#include <hls_stream.h>
#include <ap_int.h>

// Define bit-width
typedef ap_uint<4> uint4;

// Gray to Binary Code Converter
void gray_to_binary(uint4 gray_in, uint4 &binary_out) {
    #pragma HLS INTERFACE ap_ctrl_none port=return
    #pragma HLS INTERFACE s_axilite port=gray_in
    #pragma HLS INTERFACE s_axilite port=binary_out

    binary_out[3] = gray_in[3];
    binary_out[2] = binary_out[3] ^ gray_in[2];
    binary_out[1] = binary_out[2] ^ gray_in[1];
    binary_out[0] = binary_out[1] ^ gray_in[0];
}
