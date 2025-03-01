`timescale 1ns / 1ps



module lfsr_prng (
    input wire clk,
    input wire reset,
    output reg [7:0] random_out
);

    always @(posedge clk or posedge reset) begin
        if (reset)
            random_out <= 8'b00000001; // Reset to initial non-zero state
        else
            random_out <= {random_out[6:0], random_out[7] ^ random_out[5] ^ random_out[4] ^ random_out[3]}; // Shift with feedback
    end

endmodule


