module delay
#(parameter DATA_WIDTH=16)
(
    input clk,
    input write_clk,
    input signed[(DATA_WIDTH-1):0] audio_right_in,
    input signed[(DATA_WIDTH-1):0] audio_left_in,
    output reg signed[(DATA_WIDTH-1):0] audio_right_out,
    output reg signed[(DATA_WIDTH-1):0] audio_left_out
);

    wire signed[(DATA_WIDTH-1):0] delayed_audio_left, delayed_audio_right;

    AudioBuffer #(.DATA_WIDTH(DATA_WIDTH)) audioBuffer(
        .clk(clk),
        .write_clk(write_clk),
        .audio_data_right(audio_right_in + delayed_audio_right>>>1),
        .audio_data_left(audio_left_in + delayed_audio_left>>>1),
        .data_read_right(delayed_audio_right),
        .data_read_left(delayed_audio_left),
        .read_shift(4000)
    );

    always @ (negedge write_clk) begin
        audio_right_out = audio_right_in + delayed_audio_right/2;
        audio_left_out = audio_left_in + delayed_audio_left/2;
    end

endmodule
