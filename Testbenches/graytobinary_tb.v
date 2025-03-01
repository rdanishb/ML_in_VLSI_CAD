`timescale 1ns / 1ps



// Testbench
module tb_gray_to_binary;
    reg  [3:0] gray_in;
    wire [3:0] binary_out;
    
    gray_to_binary uut (
        .gray_in(gray_in),
        .binary_out(binary_out)
    );
    
    initial begin
        $monitor("Gray: %b -> Binary: %b", gray_in, binary_out);
        
        gray_in = 4'b0000; #10;
        gray_in = 4'b0001; #10;
        gray_in = 4'b0011; #10;
        gray_in = 4'b0010; #10;
        gray_in = 4'b0110; #10;
        gray_in = 4'b0111; #10;
        gray_in = 4'b0101; #10;
        gray_in = 4'b0100; #10;
        gray_in = 4'b1100; #10;
        gray_in = 4'b1101; #10;
        gray_in = 4'b1111; #10;
        gray_in = 4'b1110; #10;
        
        $finish;
    end
endmodule
