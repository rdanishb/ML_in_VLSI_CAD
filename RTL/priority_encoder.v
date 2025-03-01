`timescale 1ns / 1ps



// 4:2 Priority Encoder in Verilog
module priority_encoder_4to2 (
    input [3:0] in,
    output reg [1:0] out,
    output reg valid
);
    
    always @(*) begin
        valid = 1'b1;
        casez (in)
            4'b1???: out = 2'b11;
            4'b01??: out = 2'b10;
            4'b001?: out = 2'b01;
            4'b0001: out = 2'b00;
            default: begin
                out = 2'b00;
                valid = 1'b0; // No valid input
            end
        endcase
    end
endmodule