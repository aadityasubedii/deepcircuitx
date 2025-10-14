    always @(posedge wb_clk) begin
        if (dbus_ack) begin
            rd_data <= dbus_rdt; 
        end
    end