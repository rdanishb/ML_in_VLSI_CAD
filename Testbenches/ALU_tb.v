`timescale 1ns / 1ps


// Testbench
module tb_ALU;
    reg [3:0] a, b;
    reg [2:0] op;
    wire [4:0] result;
    
    // Instantiate the DUT (Device Under Test)
    ALU uut (
        .a(a),
        .b(b),
        .op(op),
        .result(result)
    );
    
    initial begin
        // Apply test cases
        a = 4'b0011; b = 4'b0001; op = 3'b000; #10; // ADD
        a = 4'b0110; b = 4'b0011; op = 3'b001; #10; // SUB
        a = 4'b1100; b = 4'b1010; op = 3'b010; #10; // AND
        a = 4'b1100; b = 4'b1010; op = 3'b011; #10; // OR
        a = 4'b1100; b = 4'b1010; op = 3'b100; #10; // XOR
        a = 4'b1111; b = 4'b1111; op = 3'b101; #10; // Default case
        
        // Finish simulation
        $finish;
    end
endmodule
