`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.02.2025 17:05:38
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


module pipelined_alu (
    input wire clk,
    input wire reset,
    input wire [7:0] a,
    input wire [7:0] b,
    input wire [2:0] op, // 3-bit operation selector
    output reg [15:0] result
);

    // Define operation codes
    localparam ADD    = 3'b000;
    localparam SUB    = 3'b001;
    localparam MUL    = 3'b010;
    localparam AND_OP = 3'b011;
    localparam OR_OP  = 3'b100;
    localparam XOR_OP = 3'b101;

    // Pipeline register
    reg [15:0] result_reg;

    always @(posedge clk or posedge reset) begin
        if (reset)
            result_reg <= 16'b0;
        else begin
            case (op)
                ADD:    result_reg <= a + b;
                SUB:    result_reg <= a - b;
                MUL:    result_reg <= a * b;
                AND_OP: result_reg <= a & b;
                OR_OP:  result_reg <= a | b;
                XOR_OP: result_reg <= a ^ b;
                default: result_reg <= 16'b0;
            endcase
        end
    end

    always @(posedge clk) begin
        result <= result_reg; // Output the result
    end

endmodule

