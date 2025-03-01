`timescale 1ns / 1ps


module nn_accelerator (
    input wire clk,
    input wire reset,
    input wire signed [7:0] weight0,     // Individual weight inputs
    input wire signed [7:0] weight1,
    input wire signed [7:0] weight2,
    input wire signed [7:0] weight3,
    input wire signed [7:0] input0,         // Individual input values
    input wire signed [7:0] input1,
    input wire signed [7:0] input2,
    input wire signed [7:0] input3,
    output reg signed [15:0] output_neuron                       // Output sum
);
    
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            output_neuron <= 16'd0;  // Reset output
        end else begin
            output_neuron <= (weight0 * input0) + (weight1 * input1) +
                             (weight2 * input2) + (weight3 * input3);
        end
    end

endmodule

