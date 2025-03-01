`timescale 1ns / 1ps



// 4-bit Ripple Carry Adder in Verilog
module ripple_carry_adder_4bit (
    input [3:0] a,
    input [3:0] b,
    input cin,
    output [3:0] sum,
    output cout
);
    
    wire [3:0] carry;
    
    assign {cout, sum} = a + b + cin;
    
endmodule
