`timescale 1ns / 1ps

module ring_counter (
    input wire clk,
    input wire reset,
    output reg [3:0] count
);

    always @(posedge clk or posedge reset) begin
        if (reset)
            count <= 4'b0001; // Reset to initial state
        else
            count <= {count[2:0], count[3]}; // Rotate left
    end

endmodule
