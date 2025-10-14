    gpio #(.ADDR(GPIO_ADDR), .AWIDTH(8))
    gpio_io (
        
        .wb_clk(wb_clk),
        .wb_rst(wb_rst),
        .wb_dbus_adr(wb_dbus_adr),
        .wb_dbus_dat(wb_dbus_dat),
        .wb_dbus_sel(wb_dbus_sel),
        .wb_dbus_we(wb_dbus_we),
        .wb_dbus_cyc(wb_dbus_cyc),
        .rdt(gpio_rdt),
        .ack(gpio_ack),
        
        .gpio(gpio_reg)
    );