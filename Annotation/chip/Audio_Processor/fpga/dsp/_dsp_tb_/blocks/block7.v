    task read(input [31:0] addr);

            wb_dbus_adr <= addr;
            wb_dbus_cyc <= 1;
            @(posedge ck);
            wait(!wb_dbus_cyc);
            rd_data <= wb_dbus_rdt;

    endtask