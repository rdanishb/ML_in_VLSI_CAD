`timescale 1ns / 1ps



module sipo_shift_register (
    input  wire clk,
    input  wire reset,
    input  wire serial_in,
    output reg [3:0] parallel_out
);

    always @(posedge clk or posedge reset) begin
        if (reset)
            parallel_out <= 4'b0000;
        else
            parallel_out <= {parallel_out[2:0], serial_in}; // Shift left and insert serial_in
    end

endmodule
