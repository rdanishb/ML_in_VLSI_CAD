`timescale 1ns / 1ps



module tb_crc_generator;

    reg clk;
    reg reset;
    reg [7:0] data;
    reg valid;
    wire [7:0] crc;

    // Instantiate the CRC generator
    crc_generator uut (
        .clk(clk),
        .reset(reset),
        .data(data),
        .valid(valid),
        .crc(crc)
    );

    // Clock generation
    always #5 clk = ~clk;

    initial begin
        // Initialize signals
        clk = 0;
        reset = 1;
        data = 8'h00;
        valid = 0;
        #10 reset = 0;  // Release reset
        
        // Test case 1: Send first data byte
        valid = 1; data = 8'hAB;
        #10;

        // Test case 2: Send another byte
        valid = 1; data = 8'h34;
        #10;

        // Test case 3: Send another byte
        valid = 1; data = 8'h56;
        #10;

        // Test case 4: Send another byte
        valid = 1; data = 8'h78;
        #10;

        // Disable valid signal (no data processed)
        valid = 0;
        #10;

        // Test case 5: Reset and send new data
        reset = 1;
        #10 reset = 0;
        valid = 1; data = 8'h9A;
        #10;

        // End simulation
        $finish;
    end

endmodule

