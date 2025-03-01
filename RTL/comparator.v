`timescale 1ns / 1ps



module magnitude_comparator (
    input  [3:0] a, 
    input  [3:0] b,
    output a_gt_b,
    output a_lt_b,
    output a_eq_b
);

    assign a_gt_b = (a > b);
    assign a_lt_b = (a < b);
    assign a_eq_b = (a == b);

endmodule