`timescale 1ns / 1ps

module johnson_counter_tb;

    reg clk;
    reg reset;
    wire [3:0] count;

    // Instantiate the Johnson counter
    johnson_counter uut (
        .clk(clk),
        .reset(reset),
        .count(count)
    );

    // Clock generation
    always #5 clk = ~clk; // 10ns clock period

    initial begin
        $monitor("Time=%0t | Reset=%b | Count=%b", $time, reset, count);

        clk = 0;
        reset = 1; #10;  // Apply reset
        reset = 0; #100; // Run counter for a few cycles

        #50 reset = 1; // Apply reset again
        #10 reset = 0;

        #100 $finish;
    end

endmodule
