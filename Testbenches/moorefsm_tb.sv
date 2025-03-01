`timescale 1ns / 1ps



`timescale 1ns / 1ps

module tb_sequence_detector_moore;

    // Inputs
    reg clk;
    reg reset;
    reg input_bit;

    // Output
    wire detected;

    // Instantiate the module
    sequence_detector_moore uut (
        .clk(clk),
        .reset(reset),
        .input_bit(input_bit),
        .detected(detected)
    );

    // Clock generation
    always #5 clk = ~clk;

    initial begin
        // Monitor output
        $monitor("Time = %0t | input_bit = %b | detected = %b", $time, input_bit, detected);

        // Initialize signals
        clk = 0;
        reset = 1;
        input_bit = 0;
        #10;
        
        // Release reset
        reset = 0;
        #10;

        // Apply test sequence "1011"
        input_bit = 1; #10;
        input_bit = 0; #10;
        input_bit = 1; #10;
        input_bit = 1; #10;

        // Apply random bits
        input_bit = 0; #10;
        input_bit = 1; #10;
        input_bit = 1; #10;
        input_bit = 0; #10;
        input_bit = 1; #10;
        input_bit = 1; #10;

        // Finish simulation
        $finish;
    end

endmodule
