    chip_select #(.ADDR(ADDR_INPUT)) 
    cs_input(
        .wb_ck(ck),
        .addr(cs_adr),
        .wb_cyc(wb_dbus_cyc),
        .wb_rst(wb_rst),
        .ack(input_ack),
        .cyc(input_cyc)
    );