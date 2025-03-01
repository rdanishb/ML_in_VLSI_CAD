`timescale 1ns / 1ps

module adder_4bit (
    input  wire [3:0] a,
    input  wire [3:0] b,
    output reg  [4:0] sum
);
    
    always @(*) begin
        sum = a + b;
    end
    
endmodule

