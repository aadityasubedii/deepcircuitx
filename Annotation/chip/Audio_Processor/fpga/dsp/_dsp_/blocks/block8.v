    ibus_read #(.ADDR(FLASH_ADDR))
    flash_read (
        .wb_clk(wb_clk),
        .wb_rst(wb_rst),
        .wb_dbus_cyc(wb_dbus_cyc),
        .wb_dbus_we(wb_dbus_we),
        .wb_dbus_adr(wb_dbus_adr),
        .wb_dbus_dat(wb_dbus_dat),
        .wb_dbus_ack(flash_ack),
        .wb_dbus_rdt(flash_rdt),
        .wb_ibus_cyc(f_cyc),
        .wb_ibus_adr(f_adr),
        .wb_ibus_ack(f_ack),
        .wb_ibus_rdt(f_rdt),
        .dev_busy(flash_busy)
    );