`timescale 1ns / 1ps



// SR Flip-Flop in Verilog
module sr_flip_flop (
    input clk,
    input s,
    input r,
    input reset,
    output reg q
);
    
    always @(posedge clk or posedge reset) begin
        if (reset)
            q <= 1'b0;
        else if (s && !r)
            q <= 1'b1; // Set
        else if (!s && r)
            q <= 1'b0; // Reset
        else if (s && r)
            q <= 1'b0; // Invalid state, resetting to 0
    end
endmodule
