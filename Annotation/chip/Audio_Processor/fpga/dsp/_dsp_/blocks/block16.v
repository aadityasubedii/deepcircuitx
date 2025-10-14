    sp_ram ram (
        .ck(wb_clk),
        .addr(x_adr),
        .cyc(ram_cs),
        .we(x_we),
        .sel(x_sel),
        .wdata(x_dat),
        .rdata(x_rdt)
    );