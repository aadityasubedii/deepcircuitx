    sk9822_peripheral #(.ADDR(LED_ADDR))
    sk9822_peripheral(
        .wb_clk(wb_clk),
        .wb_rst(wb_rst),
        .wb_dbus_cyc(wb_dbus_cyc),
        .wb_dbus_we(wb_dbus_we),
        .wb_dbus_adr(wb_dbus_adr),
        .wb_dbus_dat(wb_dbus_dat),
        .ack(led_ack),
        .led_ck(led_ck),
        .led_data(led_data)
    );