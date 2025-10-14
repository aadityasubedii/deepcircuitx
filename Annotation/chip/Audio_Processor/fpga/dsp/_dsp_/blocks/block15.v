    generate

        if (TIMER_ENABLED) begin

            wire timer_cyc;

            chip_select #(.ADDR(TIMER_ADDR), .WIDTH(8))
            cs_timer (
                .wb_ck(wb_clk),
                .addr(wb_dbus_adr[31:24]),
                .wb_cyc(wb_dbus_cyc),
                .wb_rst(wb_rst),
                .ack(timer_ack),
                .cyc(timer_cyc)
            );

            timer timer (
                .wb_clk(wb_clk),
                .wb_rst(wb_rst),
                .ck_en(1'b1), 
                .wb_dbus_dat(wb_dbus_dat),
                .wb_dbus_adr(wb_dbus_adr),
                .wb_dbus_we(wb_dbus_we),
                .cyc(timer_cyc),
                .irq(timer_irq),
                .rdt(timer_rdt)
            );

        end else begin

            
            assign timer_ack = 0;
            assign timer_irq = 0;
            assign timer_rdt = 0;

        end
    endgenerate