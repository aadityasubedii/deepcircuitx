    uart #(.ADDR(UART_ADDR), .AWIDTH(8))
    uart_io (
        
        .wb_clk(wb_clk),
        .wb_rst(wb_rst),
        .wb_dbus_adr(wb_dbus_adr),
        .wb_dbus_dat(wb_dbus_dat),
        .wb_dbus_sel(wb_dbus_sel),
        .wb_dbus_we(wb_dbus_we),
        .wb_dbus_cyc(wb_dbus_cyc),
        .rdt(uart_rdt),
        .ack(uart_ack),
        
        .baud_en(baud_en),
        .tx(tx),
        .busy(tx_busy)
    );