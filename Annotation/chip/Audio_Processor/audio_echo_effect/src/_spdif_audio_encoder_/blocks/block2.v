    dual_clock_buffer #(.width(audio_width+1)) dbuffer_ (
        .reset(reset),
        .i_clk(clk),
        .i_valid(i_valid),
        .i_ready(i_ready),
        .i_data({ i_is_left, i_audio }),
        .o_clk(clk128),
        .o_valid(o_valid),
        .o_ready(o_ready),
        .o_data({ o_is_left, o_audio })
    );