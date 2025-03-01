`timescale 1ns / 1ps



// JK Flip-Flop in Verilog
module jk_flip_flop (
    input clk,
    input j,
    input k,
    input reset,
    output reg q
);
    
    always @(posedge clk or posedge reset) begin
        if (reset)
            q <= 1'b0;
        else if (j == 0 && k == 0)
            q <= q; // No change
        else if (j == 0 && k == 1)
            q <= 1'b0; // Reset
        else if (j == 1 && k == 0)
            q <= 1'b1; // Set
        else if (j == 1 && k == 1)
            q <= ~q; // Toggle
    end
endmodule