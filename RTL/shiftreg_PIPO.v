`timescale 1ns / 1ps



module pipo_shift_register (
    input  wire        clk,
    input  wire        reset,
    input  wire [3:0]  parallel_in,
    output reg  [3:0]  parallel_out
);

    always @(posedge clk or posedge reset) begin
        if (reset)
            parallel_out <= 4'b0000;
        else
            parallel_out <= parallel_in;
    end

endmodule

