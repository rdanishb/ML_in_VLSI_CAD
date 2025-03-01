`timescale 1ns / 1ps

module lifo_stack (
    input wire clk,
    input wire reset,
    input wire push,
    input wire pop,
    input wire [7:0] data_in,
    output reg [7:0] data_out,
    output reg empty,
    output reg full
);

    parameter STACK_SIZE = 8;
    reg [7:0] stack [0:STACK_SIZE-1];
    reg [3:0] top;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            top <= 0;
            empty <= 1;
            full <= 0;
        end 
        else begin
            if (push && !pop && top < STACK_SIZE) begin
                stack[top] <= data_in;
                top <= top + 1;
            end 
            else if (pop && !push && top > 0) begin
                top <= top - 1;
                data_out <= stack[top - 1];
            end
            empty <= (top == 0);
            full <= (top == STACK_SIZE);
        end
    end
endmodule
