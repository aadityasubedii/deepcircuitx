    dpram #(.BITS(16), .SIZE(16))
    dpram_hi(   
        .ck(wb_clk),
        .we(ack & wb_dbus_we),
        .waddr(write_adr),
        .wdata(wr_hi_dat),
        .re(ram_re),
        .raddr(ram_addr),
        .rdata(rd_hi_dat)
    );