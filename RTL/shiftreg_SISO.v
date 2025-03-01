`timescale 1ns / 1ps



module shift_register_siso (
    input wire clk,
    input wire reset,
    input wire serial_in,
    output reg serial_out
);

    reg [3:0] shift_reg;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            shift_reg <= 4'b0000;
        end else begin
            serial_out <= shift_reg[3]; // Output MSB
            shift_reg <= {shift_reg[2:0], serial_in}; // Shift left
        end
    end

endmodule

