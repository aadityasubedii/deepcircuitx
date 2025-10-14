    process #(.audio_width(audio_width)) process_(
        .reset(reset),
        .clk(clk),
        .i_valid(o_valid_operator),
        .i_ready(o_ready_operator),
        .i_current(o_current),
        .i_buffer(o_buffer),
        .o_valid(i_valid_result),
        .o_ready(i_ready_result),
        .o_result(i_result),
        .o_buffer(i_buffer)
    );