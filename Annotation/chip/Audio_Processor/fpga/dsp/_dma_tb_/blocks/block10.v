    task write_wait;

        begin
            wait(dbus_ack);
            wait(!dbus_ack);
            @(posedge wb_clk);
        end

    endtask