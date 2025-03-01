`timescale 1ns / 1ps



module tb_seven_segment_decoder;

    reg [3:0] binary_in;
    wire [6:0] segment_out;

    // Instantiate DUT
    seven_segment_decoder uut (
        .binary_in(binary_in),
        .segment_out(segment_out)
    );

    initial begin
        $display("Binary | 7-Segment Output");
        
        for (binary_in = 0; binary_in < 16; binary_in = binary_in + 1) begin
            #10; // Wait for the output to stabilize
            $display("  %h   |   %b", binary_in, segment_out);
        end

        $finish; // Terminate simulation
    end
    
endmodule

