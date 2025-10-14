    task write(input [31:0] addr, input [31:0] data);

        begin

            wb_dbus_cyc <= 1;
            wb_dbus_adr <= addr;
            wb_dbus_we <= 1;
            wb_dbus_dat <= data;

        end

    endtask