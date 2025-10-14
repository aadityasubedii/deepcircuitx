    chip_select #(.ADDR(0), .WIDTH(8))
    cs_ram (
        .wb_ck(wb_clk),
        .addr(x_adr[31:24]),
        .wb_cyc(x_cyc),
        .wb_rst(wb_rst),
        .ack(x_ack),
        .cyc(ram_cs)
    );