`timescale 1ns / 1ps



module tb_magnitude_comparator;
    reg [3:0] a, b;
    wire a_gt_b, a_lt_b, a_eq_b;

    magnitude_comparator uut (
        .a(a),
        .b(b),
        .a_gt_b(a_gt_b),
        .a_lt_b(a_lt_b),
        .a_eq_b(a_eq_b)
    );

    initial begin
        a = 4'b0001; b = 4'b0010; #10; // a < b
        a = 4'b0110; b = 4'b0011; #10; // a > b
        a = 4'b1010; b = 4'b1010; #10; // a == b
        a = 4'b1111; b = 4'b0000; #10; // a > b
        a = 4'b0101; b = 4'b0110; #10; // a < b
        $stop;
    end
endmodule
