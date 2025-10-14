    task write(input [31:0] addr, input [31:0] data);
        begin
            wb_dbus_adr <= addr;
            wb_dbus_dat <= data;
            wb_dbus_sel <= 4'b1111;
            wb_dbus_we <= 1;
            wb_dbus_cyc <= 1;
            @(posedge ck);
            wait(!wb_dbus_cyc);
            @(posedge ck);
        end
    endtask