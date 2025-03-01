`timescale 1ns / 1ps



// Testbench
module tb_d_flip_flop;
    reg clk, d, reset;
    wire q;
    
    // Instantiate the DUT (Device Under Test)
    d_flip_flop uut (
        .clk(clk),
        .d(d),
        .reset(reset),
        .q(q)
    );
    
    // Clock generation
    always #5 clk = ~clk;
    
    initial begin
        // Initialize signals
        clk = 0;
        d = 0;
        reset = 1;
        #10;
        
        reset = 0;
        d = 1;
        #10;
        
        d = 0;
        #10;
        
        d = 1;
        #10;
        
        reset = 1;
        #10;
        
        reset = 0;
        d = 0;
        #10;
        
        // Finish simulation
        $finish;
    end
endmodule

