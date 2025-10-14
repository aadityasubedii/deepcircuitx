    always @(posedge ck) begin
        if (!wb_dbus_cyc) begin
            tb_assert(wb_dbus_rdt == 0);
        end
    end