`timescale 1ns / 1ps


module frequency_divider (
    input wire clk,
    input wire reset,
    input wire [7:0] N,
    output reg clk_out
);

    reg [7:0] counter = 0;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            counter <= 0;
            clk_out <= 0;
        end else begin
            if (counter >= (N - 1)) begin
                counter <= 0;
                clk_out <= ~clk_out;
            end else begin
                counter <= counter + 1;
            end
        end
    end

endmodule


