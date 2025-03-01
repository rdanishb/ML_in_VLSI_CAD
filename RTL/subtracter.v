`timescale 1ns / 1ps



module binary_subtracter (
    input [3:0] a,
    input [3:0] b,
    input bin,
    output [3:0] diff,
    output bout
);
    wire [4:0] borrow;
    assign borrow[0] = bin;

    genvar i;
    generate
        for (i = 0; i < 4; i = i + 1) begin : subtract_loop
            assign diff[i] = a[i] ^ b[i] ^ borrow[i];
            assign borrow[i+1] = (~a[i] & b[i]) | ((~a[i] | b[i]) & borrow[i]);
        end
    endgenerate
    
    assign bout = borrow[4];
endmodule
