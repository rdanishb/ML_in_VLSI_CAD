`timescale 1ns / 1ps



module tb_shift_add_multiplier;
    reg [3:0] a, b;
    wire [7:0] product;

    shift_add_multiplier uut (
        .a(a),
        .b(b),
        .product(product)
    );

    initial begin
        a = 4'b0011; b = 4'b0101; #10; // 3 * 5 = 15
        a = 4'b0110; b = 4'b0011; #10; // 6 * 3 = 18
        a = 4'b1111; b = 4'b0001; #10; // 15 * 1 = 15
        a = 4'b1001; b = 4'b1001; #10; // 9 * 9 = 81
        a = 4'b0000; b = 4'b1010; #10; // 0 * 10 = 0
        $stop;
    end
endmodule
