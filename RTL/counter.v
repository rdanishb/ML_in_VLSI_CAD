`timescale 1ns / 1ps



// 4-bit Counter in Verilog
module counter (
    input clk,
    input enable,
    input reset,
    output reg [3:0] count
);
    
    always @(posedge clk or posedge reset) begin
        if (reset)
            count <= 4'b0000;
        else if (enable)
            count <= count + 1;
    end
endmodule
