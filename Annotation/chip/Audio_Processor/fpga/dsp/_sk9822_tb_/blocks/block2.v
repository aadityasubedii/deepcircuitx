    always @(posedge wb_clk) begin
        if (ack) begin
            wb_dbus_cyc <= 0;
            wb_dbus_adr <= 32'hZ;
            wb_dbus_dat <= 32'hZ;
            wb_dbus_we <= 0;
        end
    end