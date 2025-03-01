`timescale 1ns / 1ps



// T Flip-Flop in Verilog
module t_flip_flop (
    input clk,
    input t,
    input reset,
    output reg q
);
    
    always @(posedge clk or posedge reset) begin
        if (reset)
            q <= 1'b0;
        else if (t)
            q <= ~q; // Toggle
    end
endmodule

