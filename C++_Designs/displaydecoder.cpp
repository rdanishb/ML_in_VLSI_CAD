#include <hls_stream.h>
#include <ap_int.h>

// Define bit-width
typedef ap_uint<4> uint4;
typedef ap_uint<7> uint7;

// 7-Segment Display Decoder (Binary to 7-Segment Mapping)
void seven_segment_decoder(uint4 binary_in, uint7 &segment_out) {
    #pragma HLS INTERFACE ap_ctrl_none port=return
    #pragma HLS INTERFACE s_axilite port=binary_in
    #pragma HLS INTERFACE s_axilite port=segment_out

    switch (binary_in) {
        case 0x0: segment_out = 0b0111111; break; // 0
        case 0x1: segment_out = 0b0000110; break; // 1
        case 0x2: segment_out = 0b1011011; break; // 2
        case 0x3: segment_out = 0b1001111; break; // 3
        case 0x4: segment_out = 0b1100110; break; // 4
        case 0x5: segment_out = 0b1101101; break; // 5
        case 0x6: segment_out = 0b1111101; break; // 6
        case 0x7: segment_out = 0b0000111; break; // 7
        case 0x8: segment_out = 0b1111111; break; // 8
        case 0x9: segment_out = 0b1101111; break; // 9
        case 0xA: segment_out = 0b1110111; break; // A
        case 0xB: segment_out = 0b1111100; break; // B
        case 0xC: segment_out = 0b0111001; break; // C
        case 0xD: segment_out = 0b1011110; break; // D
        case 0xE: segment_out = 0b1111001; break; // E
        case 0xF: segment_out = 0b1110001; break; // F
        default:  segment_out = 0b0000000; break; // Invalid input
    }
}
