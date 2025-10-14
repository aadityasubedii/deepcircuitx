module tremolo
#(parameter DATA_WIDTH=16)
(
    input clk,
    input signed[(DATA_WIDTH-1):0] audio_right_in,
    input signed[(DATA_WIDTH-1):0] audio_left_in,
    output reg signed[(DATA_WIDTH-1):0] audio_right_out,
    output reg signed[(DATA_WIDTH-1):0] audio_left_out,
    output wire [16:0] debug
);
    wire [15:0] sine;
    wire signed [42:0] mult_results_right, mult_results_left;
    wire signed [16:0] signed_sine;

    assign signed_sine = {1'b0, sine};
    assign mult_results_right = signed_sine*audio_right_in;
    assign mult_results_left = signed_sine*audio_left_in;
    assign debug = signed_sine;

    sine_generator sine_generator(
        .clk(clk),
        .fcw(24'b000000000000010000000000),
        .sine(sine)
    );

    always @(negedge clk) begin
        audio_right_out = mult_results_right>>>16;
        audio_left_out = mult_results_left>>>16;
    end

endmodule

