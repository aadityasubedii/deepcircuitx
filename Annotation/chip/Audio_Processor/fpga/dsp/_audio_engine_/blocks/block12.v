    chip_select #(.ADDR(ADDR_STATUS)) 
    cs_status(
        .wb_ck(ck),
        .addr(cs_adr),
        .wb_cyc(wb_dbus_cyc),
        .wb_rst(wb_rst),
        .ack(status_ack),
        .cyc(status_cyc)
    );
