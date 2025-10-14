    chip_select #(.ADDR(ADDR_RESULT)) 
    cs_result(
        .wb_ck(ck),
        .addr(cs_adr),
        .wb_cyc(wb_dbus_cyc),
        .wb_rst(wb_rst),
        .ack(result_ack),
        .cyc(result_cyc)
    );
