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
`timescale 1ns / 1ps

module lifo_stack_tb;

    reg clk;
    reg reset;
    reg push, pop;
    reg [7:0] data_in;
    wire [7:0] data_out;
    wire empty, full;

    // Instantiate the LIFO stack
    lifo_stack uut (
        .clk(clk),
        .reset(reset),
        .push(push),
        .pop(pop),
        .data_in(data_in),
        .data_out(data_out),
        .empty(empty),
        .full(full)
    );

    // Generate clock signal
    always #5 clk = ~clk;

    initial begin
        $monitor("Time=%0t | Push=%b | Pop=%b | Data In=%h | Data Out=%h | Empty=%b | Full=%b", 
                 $time, push, pop, data_in, data_out, empty, full);

        clk = 0; reset = 1; push = 0; pop = 0; data_in = 8'h00;
        #10 reset = 0;

        // Push values onto stack
        #10 push = 1; data_in = 8'h11;
        #10 push = 1; data_in = 8'h22;
        #10 push = 1; data_in = 8'h33;
        #10 push = 1; data_in = 8'h44;
        #10 push = 1; data_in = 8'h55;
        #10 push = 1; data_in = 8'h66;
        #10 push = 1; data_in = 8'h77;
        #10 push = 1; data_in = 8'h88;
        #10 push = 0; // Stop pushing

        // Pop values from stack
        #10 pop = 1;
        #10 pop = 1;
        #10 pop = 1;
        #10 pop = 1;
        #10 pop = 1;
        #10 pop = 1;
        #10 pop = 1;
        #10 pop = 1;
        #10 pop = 0; // Stop popping

        #10 $finish;
    end

endmodule
