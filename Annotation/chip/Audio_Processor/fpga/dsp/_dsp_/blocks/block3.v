    irq_reg #(.ADDR(IRQ_ADDR), .ADDR_W(8), .REG_WIDTH(3))
    irq_reg 
    (
        .wb_clk(wb_clk),
        .wb_rst(wb_rst),
        .wb_dbus_adr(wb_dbus_adr),
        .wb_dbus_dat(wb_dbus_dat),
        .wb_dbus_we(wb_dbus_we),
        .wb_dbus_cyc(wb_dbus_cyc),
        .ack(irq_ack),
        .rdt(irq_rdt),
        .irq_in(irqs),
        .irq(soc_irq)
    );