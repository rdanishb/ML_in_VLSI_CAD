`timescale 1ns / 1ps



// 4:1 Multiplexer in Verilog
module mux_4to1 (
    input [7:0] in0,
    input [7:0] in1,
    input [7:0] in2,
    input [7:0] in3,
    input [1:0] sel,
    output reg [7:0] out
);
    
    always @(*) begin
        case (sel)
            2'b00: out = in0;
            2'b01: out = in1;
            2'b10: out = in2;
            2'b11: out = in3;
            default: out = 8'b00000000;
        endcase
    end
endmodule
