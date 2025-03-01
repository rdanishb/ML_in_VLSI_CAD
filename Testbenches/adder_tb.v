// Testbench
module tb_adder_4bit;
    reg [3:0] a, b;
    wire [4:0] sum;
    
    // Instantiate the DUT (Device Under Test)
    adder_4bit uut (
        .a(a),
        .b(b),
        .sum(sum)
    );
    
    initial begin
        // Apply test cases
        a = 4'b0000; b = 4'b0000; #10;
        a = 4'b0001; b = 4'b0001; #10;
        a = 4'b0110; b = 4'b0011; #10;
        a = 4'b1111; b = 4'b0001; #10;
        a = 4'b1010; b = 4'b0101; #10;
        a = 4'b1111; b = 4'b1111; #10;
        
        // Finish simulation
        $finish;
    end
endmodule
