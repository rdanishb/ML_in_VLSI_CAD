`timescale 1ns / 1ps



// Testbench
module tb_carry_lookahead_adder;
    reg [3:0] a, b;
    reg cin;
    wire [3:0] sum;
    wire cout;
    
    carry_lookahead_adder uut (
        .a(a),
        .b(b),
        .cin(cin),
        .sum(sum),
        .cout(cout)
    );
    
    initial begin
        a = 4'b0000; b = 4'b0000; cin = 0; #10;
        a = 4'b0001; b = 4'b0010; cin = 0; #10;
        a = 4'b0101; b = 4'b0011; cin = 1; #10;
        a = 4'b1111; b = 4'b1111; cin = 1; #10;
        a = 4'b1001; b = 4'b0110; cin = 0; #10;
        a = 4'b0111; b = 4'b0001; cin = 1; #10;
        $finish;
    end
endmodule