`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.02.2025 11:29:46
// Design Name: 
// Module Name: tb
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


module tb_parity_generator_checker;
    reg [3:0] data;
    wire parity, error;

    parity_generator_checker uut (
        .data(data),
        .parity(parity),
        .error(error)
    );

    initial begin
        data = 4'b0000; #10; // Expected parity: 0, error: 0
        data = 4'b0001; #10; // Expected parity: 1, error: 1
        data = 4'b0011; #10; // Expected parity: 0, error: 0
        data = 4'b0101; #10; // Expected parity: 0, error: 0
        data = 4'b1111; #10; // Expected parity: 0, error: 0
        data = 4'b1010; #10; // Expected parity: 0, error: 0
        data = 4'b1011; #10; // Expected parity: 1, error: 1
        $finish;
    end
endmodule
