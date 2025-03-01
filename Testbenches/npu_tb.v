`timescale 1ns / 1ps




module tb_nn_accelerator;

    reg clk;
    reg reset;
    reg signed [7:0] weight0, weight1, weight2, weight3; // Individual weight inputs
    reg signed [7:0] input0, input1, input2, input3;     // Individual input values
    wire signed [15:0] output_neuron;                    // Output sum

    // Instantiate the DUT (Device Under Test)
    nn_accelerator uut (
        .clk(clk),
        .reset(reset),
        .weight0(weight0), .weight1(weight1), .weight2(weight2), .weight3(weight3),
        .input0(input0), .input1(input1), .input2(input2), .input3(input3),
        .output_neuron(output_neuron)
    );

    // Generate Clock
    always #5 clk = ~clk;

    initial begin
        clk = 0;
        reset = 1;
        #10 reset = 0;

        // Assign test values
        weight0 = 2;  input0 = 3;
        weight1 = -1; input1 = 4;
        weight2 = 5;  input2 = -2;
        weight3 = 1;  input3 = 6;

        #10;

        // Display the result
        $display("Neural Network Output: %d", output_neuron);

        $finish;
    end

endmodule




