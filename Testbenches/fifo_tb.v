`timescale 1ns / 1ps



module tb_fifo_memory;

    reg clk, reset, write_enable, read_enable;
    reg [7:0] data_in;
    wire [7:0] data_out;
    wire full, empty;

    // Instantiate DUT
    fifo_memory uut (
        .clk(clk),
        .reset(reset),
        .write_enable(write_enable),
        .read_enable(read_enable),
        .data_in(data_in),
        .data_out(data_out),
        .full(full),
        .empty(empty)
    );

    // Generate clock
    always #5 clk = ~clk;

    initial begin
        // Initialize signals
        clk = 0;
        reset = 1;
        write_enable = 0;
        read_enable = 0;
        data_in = 0;

        #10 reset = 0;

        // Write some data
        repeat (5) begin
            #10 data_in = $random;
            write_enable = 1;
        end
        #10 write_enable = 0;

        // Read some data
        repeat (5) begin
            #10 read_enable = 1;
        end
        #10 read_enable = 0;

        $finish; // Terminate simulation
    end

endmodule

