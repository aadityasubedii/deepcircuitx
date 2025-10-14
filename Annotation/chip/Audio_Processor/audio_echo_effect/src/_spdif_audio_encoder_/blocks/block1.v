    spdif_frame_encoder #(.audio_width(audio_width)) encoder_ (
        .clk128(clk128),
        .reset(reset),
        .next_sub_frame_number(),
        .i_valid(o_valid),
        .i_ready(o_ready),
        .i_is_left(o_is_left),
        .i_audio(o_audio),
        .i_user(1'b0),
        .i_control(1'b0),
        .spdif(spdif));