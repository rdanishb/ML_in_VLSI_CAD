`timescale 1ns / 1ps



module sequence_detector_moore (
    input  wire clk,
    input  wire reset,
    input  wire input_bit,
    output reg  detected
);

    typedef enum reg [2:0] {
        IDLE = 3'b000,
        S1   = 3'b001,
        S2   = 3'b010,
        S3   = 3'b011,
        S4   = 3'b100
    } state_t;

    state_t state;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            state <= IDLE;
            detected <= 1'b0;
        end else begin
            case (state)
                IDLE: begin
                    state <= (input_bit == 1) ? S1 : IDLE;
                    detected <= 1'b0;
                end
                S1: state <= (input_bit == 0) ? S2 : S1;
                S2: state <= (input_bit == 1) ? S3 : IDLE;
                S3: state <= (input_bit == 1) ? S4 : S2;
                S4: begin
                    detected <= 1'b1;
                    state <= (input_bit == 1) ? S1 : S2;
                end
                default: state <= IDLE;
            endcase
        end
    end

endmodule

