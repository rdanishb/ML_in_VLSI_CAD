`timescale 1ns / 1ps



module shift_register_piso (
    input wire clk,
    input wire reset,
    input wire load,
    input wire [3:0] parallel_in,
    output reg serial_out
);

    reg [3:0] shift_reg;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            shift_reg <= 4'b0000;
        end else if (load) begin
            shift_reg <= parallel_in;
        end else begin
            serial_out <= shift_reg[3]; // Output MSB
            shift_reg <= shift_reg << 1; // Shift left
        end
    end

endmodule

