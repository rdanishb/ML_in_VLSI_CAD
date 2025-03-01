`timescale 1ns / 1ps



module parity_generator_checker (
    input  [3:0] data,
    output parity,
    output error
);

    // Even Parity Generation
    assign parity = data[0] ^ data[1] ^ data[2] ^ data[3];

    // Error detection (assuming received parity bit is correct)
    assign error = (parity != 0);

endmodule
