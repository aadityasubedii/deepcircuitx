    sample_delay_buffer #(.sample_width(audio_width), .buffer_depth(4)) delay_buffer_(
        .reset(reset),
        .clk(clk),
        .i_valid(i_valid),
        .i_ready(i_ready),
        .i_audio(i_audio),
        .o_valid_operator(o_valid_operator),
        .o_ready_operator(o_ready_operator),
        .o_current(o_current),
        .o_buffer(o_buffer),
        .i_valid_result(i_valid_result),
        .i_ready_result(i_ready_result),
        .i_result(i_result),
        .i_buffer(i_buffer),
        .o_valid(o_valid),
        .o_ready(o_ready),
        .o_audio(o_audio)
    );