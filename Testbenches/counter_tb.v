`timescale 1ns / 1ps



// Testbench
module tb_counter;
    reg clk, enable, reset;
    wire [3:0] count;
    
    // Instantiate the DUT (Device Under Test)
    counter uut (
        .clk(clk),
        .enable(enable),
        .reset(reset),
        .count(count)
    );
    
    // Clock generation
    always #5 clk = ~clk;
    
    initial begin
        // Initialize signals
        clk = 0;
        enable = 0;
        reset = 1;
        #10;
        
        reset = 0;
        enable = 1;
        #50;
        
        enable = 0;
        #20;
        
        reset = 1;
        #10;
        
        reset = 0;
        enable = 1;
        #30;
        
        // Finish simulation
        $finish;
    end
endmodule


