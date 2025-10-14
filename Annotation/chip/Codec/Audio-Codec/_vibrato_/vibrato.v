module vibrato
#(parameter DATA_WIDTH=16)
(
    input clk,
    input write_clk,
    input signed[(DATA_WIDTH-1):0] audio_right_in,
    input signed[(DATA_WIDTH-1):0] audio_left_in,
    output reg signed[(DATA_WIDTH-1):0] audio_right_out,
    output reg signed[(DATA_WIDTH-1):0] audio_left_out,
    output wire [15:0] debug
);

    assign debug = sine>>9;

    wire signed[(DATA_WIDTH-1):0] delayed_audio_left, delayed_audio_right;
    wire[15:0] sine; 

    AudioBuffer #(.DATA_WIDTH(DATA_WIDTH)) audioBuffer(
        .clk(clk),
        .write_clk(write_clk),
        .audio_data_right(audio_right_in),
        .audio_data_left(audio_left_in),
        .data_read_right(delayed_audio_right),
        .data_read_left(delayed_audio_left),
        .read_shift(sine>>9)
    );

    sine_generator sine_generator(
        .clk(write_clk),
        .fcw(24'b000000000000001000000000),
        .sine(sine)
    );

    always @ (negedge write_clk) begin
        audio_right_out = delayed_audio_right;
        audio_left_out = delayed_audio_left;
    end

endmodule
