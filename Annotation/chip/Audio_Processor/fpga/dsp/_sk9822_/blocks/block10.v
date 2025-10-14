    assign wr_lo_dat = wb_dbus_dat[15:0];
    assign wr_hi_dat = wb_dbus_dat[31:16];
    assign ram_data[15:0]  = rd_lo_dat;
    assign ram_data[31:16] = rd_hi_dat;