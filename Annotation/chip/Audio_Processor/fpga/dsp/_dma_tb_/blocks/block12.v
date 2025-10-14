    task read_wait;

        begin
            wait(dbus_ack);
            wait(!dbus_ack);
        end

    endtask