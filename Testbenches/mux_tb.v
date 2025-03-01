`timescale 1ns / 1ps



// Testbench
module tb_mux_4to1;
    reg [7:0] in0, in1, in2, in3;
    reg [1:0] sel;
    wire [7:0] out;
    
    // Instantiate the DUT (Device Under Test)
    mux_4to1 uut (
        .in0(in0),
        .in1(in1),
        .in2(in2),
        .in3(in3),
        .sel(sel),
        .out(out)
    );
    
    initial begin
        // Initialize inputs
        in0 = 8'hA0; in1 = 8'hB1; in2 = 8'hC2; in3 = 8'hD3;
        sel = 2'b00; #10;
        sel = 2'b01; #10;
        sel = 2'b10; #10;
        sel = 2'b11; #10;
        
        // Finish simulation
        $finish;
    end
    
endmodule

