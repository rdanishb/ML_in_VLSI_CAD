`timescale 1ns / 1ps



module tb_frequency_divider;

    reg clk;
    reg reset;
    reg [7:0] N;
    wire clk_out;

    // Instantiate DUT
    frequency_divider uut (
        .clk(clk),
        .reset(reset),
        .N(N),
        .clk_out(clk_out)
    );

    // Generate a clock signal
    always #5 clk = ~clk; // 10ns period

    initial begin
        // Initialize signals
        clk = 0;
        reset = 1;
        N = 4;  // Example division factor
        
        #10 reset = 0; // Release reset
        
        #500; // Run for a while
        
        $finish; // Terminate simulation
    end
    
endmodule

