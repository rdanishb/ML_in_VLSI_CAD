`timescale 1ns / 1ps


module pipelined_alu_tb;

    reg clk;
    reg reset;
    reg [7:0] a, b;
    reg [2:0] op;
    wire [15:0] result;

    // Instantiate the ALU
    pipelined_alu uut (
        .clk(clk),
        .reset(reset),
        .a(a),
        .b(b),
        .op(op),
        .result(result)
    );

    // Clock generation
    always #5 clk = ~clk; // 10ns clock period

    initial begin
        clk = 0;
        reset = 1;
        a = 0;
        b = 0;
        op = 0;
        
        #10 reset = 0; // Deassert reset

        // Test ADD
        #10 a = 8'd10; b = 8'd5; op = 3'b000; // 10 + 5 = 15
        #10 a = 8'd20; b = 8'd15; op = 3'b000; // 20 + 15 = 35

        // Test SUB
        #10 a = 8'd20; b = 8'd5; op = 3'b001; // 20 - 5 = 15
        #10 a = 8'd50; b = 8'd25; op = 3'b001; // 50 - 25 = 25

        // Test MUL
        #10 a = 8'd3; b = 8'd4; op = 3'b010; // 3 * 4 = 12
        #10 a = 8'd10; b = 8'd10; op = 3'b010; // 10 * 10 = 100

        // Test AND
        #10 a = 8'b10101010; b = 8'b11001100; op = 3'b011; // AND operation

        // Test OR
        #10 a = 8'b10101010; b = 8'b11001100; op = 3'b100; // OR operation

        // Test XOR
        #10 a = 8'b10101010; b = 8'b11001100; op = 3'b101; // XOR operation

        #20 $finish; // Stop simulation
    end

endmodule
