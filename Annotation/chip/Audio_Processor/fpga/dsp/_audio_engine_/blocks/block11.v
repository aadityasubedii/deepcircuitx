    assign status_addr = wb_dbus_adr[4:2];
    assign status_we = status_cyc & wb_dbus_we;
    assign status_re = status_cyc & !wb_dbus_we;