    always @(posedge ck) begin
        if (wb_dbus_ack) begin
            wb_dbus_adr <= 32'hZ;
            wb_dbus_dat <= 32'hZ;
            wb_dbus_sel <= 0;
            wb_dbus_we <= 0;
            wb_dbus_cyc <= 0;
        end
    end