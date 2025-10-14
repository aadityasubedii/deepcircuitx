    dpram #(.BITS(16), .SIZE(CHANNELS*2)) 
    audio_out (.ck(ck),
        .we(result_we), 
        .waddr(result_waddr), 
        .wdata(result_wdata),
        .re(!wb_dbus_we), 
        .raddr(result_raddr), 
        .rdata(result_out)
    );
