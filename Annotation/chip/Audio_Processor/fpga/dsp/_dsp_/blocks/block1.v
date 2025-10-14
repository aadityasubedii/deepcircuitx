    parameter with_csr = 1;

    serv_rf_top #(.RESET_PC(RESET_PC), .WITH_CSR(with_csr))
    cpu (
        .clk(wb_clk),
        .i_rst(wb_rst),
        .i_timer_irq(soc_irq),
        
        .o_ibus_adr(wb_ibus_adr),
        .o_ibus_cyc(wb_ibus_cyc),
        .i_ibus_rdt(wb_ibus_rdt),
        .i_ibus_ack(wb_ibus_ack),
        
        .o_dbus_adr(wb_dbus_adr),
        .o_dbus_dat(wb_dbus_dat),
        .o_dbus_sel(wb_dbus_sel),
        .o_dbus_we(wb_dbus_we),
        .o_dbus_cyc(wb_dbus_cyc),
        .i_dbus_rdt(wb_dbus_rdt),
        .i_dbus_ack(wb_dbus_ack)
    );