`timescale 1ns / 1ps



module crc_generator (
    input wire clk,
    input wire reset,
    input wire [7:0] data,
    input wire valid,
    output reg [7:0] crc
);

    parameter POLY = 8'hD5; // Polynomial: x^8 + x^7 + x^6 + x^4 + x^2 + 1

    reg [7:0] crc_reg;
    reg [7:0] temp_crc; // Moved declaration outside the always block
    integer i; // Declare loop variable outside

    always @(posedge clk or posedge reset) begin
        if (reset) 
            crc_reg <= 8'hFF; // Initialize CRC register
        else if (valid) begin
            temp_crc = crc_reg ^ data;
            for (i = 0; i < 8; i = i + 1) begin
                if (temp_crc[7])
                    temp_crc = (temp_crc << 1) ^ POLY;
                else
                    temp_crc = temp_crc << 1;
            end
            crc_reg <= temp_crc;
        end
    end

    always @(posedge clk) begin
        crc <= crc_reg; // Ensure crc is updated properly
    end

endmodule

