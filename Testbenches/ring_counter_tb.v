`timescale 1ns / 1ps

module ring_counter_tb;

    reg clk;
    reg reset;
    wire [3:0] count;

    // Instantiate the ring counter
    ring_counter uut (
        .clk(clk),
        .reset(reset),
        .count(count)
    );

    // Clock generation
    always #5 clk = ~clk; // 10ns clock period

    initial begin
        $monitor("Time=%0t | Reset=%b | Count=%b", $time, reset, count);

        clk = 0;
        reset = 1; #10;
        reset = 0; #100; // Run the counter

        #50 reset = 1; // Apply reset again
        #10 reset = 0;

        #100 $finish;
    end

endmodule
