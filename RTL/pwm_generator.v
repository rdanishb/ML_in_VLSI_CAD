`timescale 1ns / 1ps



module pwm_generator (
    input wire clk,
    input wire reset,
    input wire [7:0] duty_cycle,
    output reg pwm_out
);

    reg [7:0] counter;

    always @(posedge clk or posedge reset) begin
        if (reset)
            counter <= 8'b0;
        else
            counter <= counter + 1;
    end

    always @(posedge clk) begin
        pwm_out <= (counter < duty_cycle);
    end

endmodule

