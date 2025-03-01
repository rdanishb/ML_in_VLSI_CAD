`timescale 1ns / 1ps



// D Flip-Flop in Verilog
// D Flip-Flop in Verilog
module d_flip_flop (
    input clk,
    input d,
    input reset,
    output reg q
);
    
    always @(posedge clk or posedge reset) begin
        if (reset)
            q <= 1'b0;
        else
            q <= d;
    end
endmodule