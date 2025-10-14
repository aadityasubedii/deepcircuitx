    always @(posedge wb_clk) begin
        if (cyc) begin
            enabled <= wb_dbus_adr[5:2] != 4'hF;
        end
    end