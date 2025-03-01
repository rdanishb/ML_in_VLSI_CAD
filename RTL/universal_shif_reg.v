`timescale 1ns / 1ps



module universal_shift_register (
    input wire clk,
    input wire reset,
    input wire [7:0] data_in,
    input wire serial_in,
    input wire [1:0] mode,
    output reg [7:0] data_out
);

    // Shift mode definitions
    localparam NO_SHIFT   = 2'b00;
    localparam LEFT_SHIFT = 2'b01;
    localparam RIGHT_SHIFT = 2'b10;
    localparam LOAD       = 2'b11;

    always @(posedge clk or posedge reset) begin
        if (reset)
            data_out <= 8'b0;
        else begin
            case (mode)
                NO_SHIFT: data_out <= data_out;  // Hold value
                LEFT_SHIFT: data_out <= (data_out << 1) | serial_in;
                RIGHT_SHIFT: data_out <= (data_out >> 1) | (serial_in << 7);
                LOAD: data_out <= data_in;
            endcase
        end
    end

endmodule


