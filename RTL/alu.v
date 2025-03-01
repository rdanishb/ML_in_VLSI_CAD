`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.02.2025 23:50:07
// Design Name: 
// Module Name: main
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


// 4-bit ALU in Verilog
module ALU (
    input  [3:0] a,
    input  [3:0] b,
    input  [2:0] op,
    output reg [4:0] result
);
    
    always @(*) begin
        case (op)
            3'b000: result = a + b;   // ADD
            3'b001: result = a - b;   // SUB
            3'b010: result = a & b;   // AND
            3'b011: result = a | b;   // OR
            3'b100: result = a ^ b;   // XOR
            default: result = 5'b00000;
        endcase
    end
endmodule

