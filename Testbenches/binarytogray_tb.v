`timescale 1ns / 1ps



module tb_binary_to_gray;

    reg [3:0] binary_in;
    wire [3:0] gray_out;

    // Instantiate DUT
    binary_to_gray uut (
        .binary_in(binary_in),
        .gray_out(gray_out)
    );

    initial begin
        $display("Binary | Gray Code");
        
        for (binary_in = 0; binary_in < 16; binary_in = binary_in + 1) begin
            #10; // Wait for the output to stabilize
            $display("   %b   |   %b", binary_in, gray_out);
        end

        $finish; // Terminate simulation
    end
    
endmodule

