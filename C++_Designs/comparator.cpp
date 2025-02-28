#include <hls_stream.h>
#include <ap_int.h>

// Define bit-width
typedef ap_uint<4> uint4;

// 4-bit Magnitude Comparator
void magnitude_comparator(uint4 a, uint4 b, bool &a_gt_b, bool &a_lt_b, bool &a_eq_b) {
    #pragma HLS INTERFACE ap_ctrl_none port=return
    #pragma HLS INTERFACE s_axilite port=a
    #pragma HLS INTERFACE s_axilite port=b
    #pragma HLS INTERFACE s_axilite port=a_gt_b
    #pragma HLS INTERFACE s_axilite port=a_lt_b
    #pragma HLS INTERFACE s_axilite port=a_eq_b

    a_gt_b = (a > b);
    a_lt_b = (a < b);
    a_eq_b = (a == b);
}
