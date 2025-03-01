`timescale 1ns / 1ps



module seven_segment_decoder (
    input wire [3:0] binary_in,
    output reg [6:0] segment_out
);

    always @(*) begin
        case (binary_in)
            4'h0: segment_out = 7'b0111111; // 0
            4'h1: segment_out = 7'b0000110; // 1
            4'h2: segment_out = 7'b1011011; // 2
            4'h3: segment_out = 7'b1001111; // 3
            4'h4: segment_out = 7'b1100110; // 4
            4'h5: segment_out = 7'b1101101; // 5
            4'h6: segment_out = 7'b1111101; // 6
            4'h7: segment_out = 7'b0000111; // 7
            4'h8: segment_out = 7'b1111111; // 8
            4'h9: segment_out = 7'b1101111; // 9
            4'hA: segment_out = 7'b1110111; // A
            4'hB: segment_out = 7'b1111100; // B
            4'hC: segment_out = 7'b0111001; // C
            4'hD: segment_out = 7'b1011110; // D
            4'hE: segment_out = 7'b1111001; // E
            4'hF: segment_out = 7'b1110001; // F
            default: segment_out = 7'b0000000; // Invalid input
        endcase
    end

endmodule

