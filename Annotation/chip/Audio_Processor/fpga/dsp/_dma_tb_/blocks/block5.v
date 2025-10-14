    always @(posedge wb_clk) begin
        if (!dbus_ack) begin
            tb_assert(dbus_rdt == 0);
        end
    end