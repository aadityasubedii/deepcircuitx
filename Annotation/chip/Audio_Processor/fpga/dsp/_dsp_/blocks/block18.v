`else   

    assign ram_ack = x_ack;
    assign ram_rdt = x_rdt;
    assign dma_ack = 0;
    assign dma_rdt = 0;
    assign x_cyc = wb_dbus_cyc;
    assign x_we = wb_dbus_we;
    assign x_sel = wb_dbus_sel;
    assign x_adr = wb_dbus_adr;
    assign x_dat = wb_dbus_dat;
    

`endif 