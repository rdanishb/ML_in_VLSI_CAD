`timescale 1ns / 1ps



// Testbench
module tb_demux_1to4;
    reg [7:0] in;
    reg [1:0] sel;
    wire [7:0] out0, out1, out2, out3;
    
    // Instantiate the DUT (Device Under Test)
    demux_1to4 uut (
        .in(in),
        .sel(sel),
        .out0(out0),
        .out1(out1),
        .out2(out2),
        .out3(out3)
    );
    
    initial begin
        // Apply test cases
        in = 8'hFF; sel = 2'b00; #10;
        in = 8'hAA; sel = 2'b01; #10;
        in = 8'h55; sel = 2'b10; #10;
        in = 8'h33; sel = 2'b11; #10;
        
        // Finish simulation
        $finish;
    end
endmodule
