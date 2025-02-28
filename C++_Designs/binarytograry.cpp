#include <hls_stream.h>
#include <ap_int.h>

// Define bit-width
typedef ap_uint<4> uint4;

// Binary to Gray Code Converter
void binary_to_gray(uint4 binary_in, uint4 &gray_out) {
    #pragma HLS INTERFACE ap_ctrl_none port=return
    #pragma HLS INTERFACE s_axilite port=binary_in
    #pragma HLS INTERFACE s_axilite port=gray_out

    gray_out = binary_in ^ (binary_in >> 1);
}
