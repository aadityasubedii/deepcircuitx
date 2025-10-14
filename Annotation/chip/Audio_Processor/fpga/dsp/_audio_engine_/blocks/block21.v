    dpram #(.BITS(16), .SIZE(AUDIO)) 
    audio_in (.ck(ck),
        .we(audio_we), 
        .waddr(audio_waddr), 
        .wdata(audio_wdata),
        .re(1'h1), 
        .raddr(audio_raddr), 
        .rdata(audio_rdata)
    );