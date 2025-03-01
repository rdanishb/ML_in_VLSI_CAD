`timescale 1ns / 1ps



module fifo_memory (
    input wire clk,
    input wire reset,
    input wire write_enable,
    input wire read_enable,
    input wire [7:0] data_in,
    output reg [7:0] data_out,
    output reg full,
    output reg empty
);

    parameter FIFO_DEPTH = 16;
    reg [7:0] fifo [FIFO_DEPTH-1:0];
    reg [3:0] head = 0, tail = 0, count = 0;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            head <= 0;
            tail <= 0;
            count <= 0;
            full <= 0;
            empty <= 1;
        end else begin
            full <= (count == FIFO_DEPTH);
            empty <= (count == 0);

            if (write_enable && !full) begin
                fifo[tail] <= data_in;
                tail <= (tail + 1) % FIFO_DEPTH;
                count <= count + 1;
            end

            if (read_enable && !empty) begin
                data_out <= fifo[head];
                head <= (head + 1) % FIFO_DEPTH;
                count <= count - 1;
            end
        end
    end

endmodule

