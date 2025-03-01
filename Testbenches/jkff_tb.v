`timescale 1ns / 1ps



// Testbench
module tb_jk_flip_flop;
    reg clk, j, k, reset;
    wire q;
    
    // Instantiate the DUT (Device Under Test)
    jk_flip_flop uut (
        .clk(clk),
        .j(j),
        .k(k),
        .reset(reset),
        .q(q)
    );
    
    // Clock generation
    always #5 clk = ~clk;
    
    initial begin
        // Initialize signals
        clk = 0;
        j = 0;
        k = 0;
        reset = 1;
        #10;
        
        reset = 0;
        j = 1; k = 0; #10; // Set
        j = 0; k = 1; #10; // Reset
        j = 1; k = 1; #10; // Toggle
        j = 0; k = 0; #10; // No change
        j = 1; k = 1; #10; // Toggle
        
        reset = 1;
        #10;
        
        reset = 0;
        j = 1; k = 0; #10; // Set
        
        // Finish simulation
        $finish;
    end
endmodule
