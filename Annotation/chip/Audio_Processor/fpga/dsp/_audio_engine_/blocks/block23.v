    dpram #(.BITS(32), .SIZE(CODE*2))
    coef (
        .ck(ck),
        .we(coef_we),
        .waddr(coef_waddr),
        .wdata(wb_dbus_dat),
        .re(1'h1),
        .raddr(coef_raddr),
        .rdata(coef_rdata)
    );