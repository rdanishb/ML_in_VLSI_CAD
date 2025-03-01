`timescale 1ns / 1ps



module lfsr_prng_tb;

    reg clk;
    reg reset;
    wire [7:0] random_out;

    // Instantiate the DUT
    lfsr_prng uut (
        .clk(clk),
        .reset(reset),
        .random_out(random_out)
    );

    // Clock Generation
    always #5 clk = ~clk; // 10ns clock period

    initial begin
        // Initialize signals
        clk = 0;
        reset = 1;

        #10 reset = 0; // Deassert reset
        
        // Run the LFSR for several clock cycles
        #200;

        $finish; // End simulation
    end

endmodule
