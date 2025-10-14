    sequencer #(.CHAN_W(CHAN_W), .FRAME_W(FRAME_W), .AUDIO_W(AUDIO_W), .CODE_W(CODE_W))
    seq (
        .ck(ck),
        .rst(reset),
        .frame(frame),
        .coef_addr(code_raddr),
        .coef_data(coef_rdata), 
        .audio_raddr(audio_raddr),
        .audio_in(audio_rdata),
        .out_addr(seq_wr_addr),
        .out_audio(seq_audio),
        .out_we(seq_we),
        .done(seq_done),
        .error(error), 
        .capture_out(capture)
    );