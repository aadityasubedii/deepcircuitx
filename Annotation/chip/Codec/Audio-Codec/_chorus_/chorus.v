module chorus
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

    wire signed[(DATA_WIDTH-1):0] delayed_audio_left1, delayed_audio_left2, delayed_audio_left3, delayed_audio_left4, delayed_audio_right1, delayed_audio_right2, delayed_audio_right3, delayed_audio_right4;
    wire[15:0] sine1, sine2, sine3, sine4;

    sine_generator sine_generator1(
        .clk(write_clk),
        .fcw(24'b000000000000000010000000),
        .sine(sine1)
    );

    sine_generator sine_generator2(
        .clk(write_clk),
        .fcw(24'b000000000000000010010000),
        .sine(sine2)
    );

    sine_generator sine_generator3(
        .clk(write_clk),
        .fcw(24'b000000000000000010001000),
        .sine(sine3)
    );

    sine_generator sine_generator4(
        .clk(write_clk),
        .fcw(24'b000000000000000010110000),
        .sine(sine4)
    );

    AudioBuffer #(.DATA_WIDTH(DATA_WIDTH)) audioBuffer1(
        .clk(clk),
        .write_clk(write_clk),
        .audio_data_right(audio_right_in),
        .audio_data_left(audio_left_in),
        .data_read_right(delayed_audio_right1),
        .data_read_left(delayed_audio_left1),
        .read_shift(12'd480 + sine1[15:7])
    );

    AudioBuffer #(.DATA_WIDTH(DATA_WIDTH)) audioBuffer2(
        .clk(clk),
        .write_clk(write_clk),
        .audio_data_right(audio_right_in),
        .audio_data_left(audio_left_in),
        .data_read_right(delayed_audio_right2),
        .data_read_left(delayed_audio_left2),
        .read_shift(12'd480 + sine2[15:7])
    );

    AudioBuffer #(.DATA_WIDTH(DATA_WIDTH)) audioBuffer3(
        .clk(clk),
        .write_clk(write_clk),
        .audio_data_right(audio_right_in),
        .audio_data_left(audio_left_in),
        .data_read_right(delayed_audio_right3),
        .data_read_left(delayed_audio_left3),
        .read_shift(12'd480 + sine3[15:7])
    );

    AudioBuffer #(.DATA_WIDTH(DATA_WIDTH)) audioBuffer4(
        .clk(clk),
        .write_clk(write_clk),
        .audio_data_right(audio_right_in),
        .audio_data_left(audio_left_in),
        .data_read_right(delayed_audio_right4),
        .data_read_left(delayed_audio_left4),
        .read_shift(12'd480 + sine4[15:7])
    );

     

    always @ (negedge write_clk) begin
        audio_right_out = (delayed_audio_right1 + delayed_audio_right2 + delayed_audio_right3 + delayed_audio_right4)/4;
        audio_left_out = (delayed_audio_left1 + delayed_audio_left2 + delayed_audio_left3 + delayed_audio_left4)/4;
    end

endmodule
