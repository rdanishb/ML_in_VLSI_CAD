#include <hls_stream.h>
#include <ap_int.h>

#define POLY 0xD5 // Example 8-bit polynomial (x^8 + x^7 + x^6 + x^4 + x^2 + 1)
#define WIDTH 8  // CRC width

typedef ap_uint<WIDTH> crc_t;
typedef ap_uint<8> data_t;

typedef struct {
    data_t data;
    bool valid;
} crc_input_t;

typedef struct {
    crc_t crc;
} crc_output_t;

void crc_generator(crc_input_t input, crc_output_t &output) {
    #pragma HLS INTERFACE ap_ctrl_none port=return
    #pragma HLS INTERFACE s_axilite port=input
    #pragma HLS INTERFACE s_axilite port=output

    static crc_t crc_reg = 0xFF; // Initialize CRC register
    #pragma HLS RESET variable=crc_reg

    if (input.valid) {
        crc_t crc = crc_reg ^ input.data;
        for (int i = 0; i < 8; i++) {
            if (crc & 0x80) {
                crc = (crc << 1) ^ POLY;
            } else {
                crc = crc << 1;
            }
        }
        crc_reg = crc;
    }
    output.crc = crc_reg;
}
