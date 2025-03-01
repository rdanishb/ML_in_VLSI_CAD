`timescale 1ns / 1ps


module pwm_generator_tb;

    reg clk;
    reg reset;
    reg [7:0] duty_cycle;
    wire pwm_out;

    // Instantiate PWM Generator
    pwm_generator uut (
        .clk(clk),
        .reset(reset),
        .duty_cycle(duty_cycle),
        .pwm_out(pwm_out)
    );

    // Clock generation
    always #5 clk = ~clk; // 10ns clock period

    initial begin
        clk = 0;
        reset = 1;
        duty_cycle = 0;
        
        #10 reset = 0; // Release reset

        // Test different duty cycles
        #10 duty_cycle = 8'd64;  // 25% duty cycle
        #100 duty_cycle = 8'd128; // 50% duty cycle
        #100 duty_cycle = 8'd192; // 75% duty cycle
        #100 duty_cycle = 8'd255; // 100% duty cycle (always high)
        #100 duty_cycle = 8'd0;   // 0% duty cycle (always low)

        #100 $finish;
    end

endmodule

