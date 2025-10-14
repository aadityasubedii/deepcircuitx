    task read(input [31:0] addr);

        begin

            wb_dbus_cyc <= 1;
            wb_dbus_adr <= addr;

        end

    endtask