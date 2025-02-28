#include <hls_stream.h>
#include <ap_int.h>

#define FIFO_DEPTH 16

typedef ap_uint<8> data_t;

// FIFO (First-In-First-Out) Memory
void fifo_memory(bool clk, bool reset, bool write_enable, bool read_enable, data_t data_in, data_t &data_out, bool &full, bool &empty) {
    #pragma HLS INTERFACE ap_ctrl_none port=return
    #pragma HLS INTERFACE s_axilite port=clk
    #pragma HLS INTERFACE s_axilite port=reset
    #pragma HLS INTERFACE s_axilite port=write_enable
    #pragma HLS INTERFACE s_axilite port=read_enable
    #pragma HLS INTERFACE s_axilite port=data_in
    #pragma HLS INTERFACE s_axilite port=data_out
    #pragma HLS INTERFACE s_axilite port=full
    #pragma HLS INTERFACE s_axilite port=empty

    static data_t fifo[FIFO_DEPTH];
    static int head = 0, tail = 0, count = 0;
    #pragma HLS RESET variable=head
    #pragma HLS RESET variable=tail
    #pragma HLS RESET variable=count

    full = (count == FIFO_DEPTH);
    empty = (count == 0);

    if (reset) {
        head = tail = count = 0;
    } else {
        if (write_enable && !full) {
            fifo[tail] = data_in;
            tail = (tail + 1) % FIFO_DEPTH;
            count++;
        }
        if (read_enable && !empty) {
            data_out = fifo[head];
            head = (head + 1) % FIFO_DEPTH;
            count--;
        }
    }
}
