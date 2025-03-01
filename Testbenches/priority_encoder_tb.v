`timescale 1ns / 1ps



// Testbench
module tb_priority_encoder_4to2;
    reg [3:0] in;
    wire [1:0] out;
    wire valid;
    
    // Instantiate the DUT (Device Under Test)
    priority_encoder_4to2 uut (
        .in(in),
        .out(out),
        .valid(valid)
    );
    
    initial begin
        // Apply test cases
        in = 4'b0000; #10;
        in = 4'b0001; #10;
        in = 4'b0010; #10;
        in = 4'b0100; #10;
        in = 4'b1000; #10;
        in = 4'b0110; #10;
        in = 4'b1010; #10;
        in = 4'b1100; #10;
        
        // Finish simulation
        $finish;
    end
endmodule

