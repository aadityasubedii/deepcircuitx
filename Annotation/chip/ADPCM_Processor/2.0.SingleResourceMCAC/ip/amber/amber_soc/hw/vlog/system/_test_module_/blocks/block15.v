assign o_wb_ack     = i_wb_stb && ( wb_start_write || wb_start_read_d1 );
assign o_wb_err     = 1'd0;
assign o_mem_ctrl   = mem_ctrl_reg;
assign o_led        = led_reg;
assign o_phy_rst_n  = phy_rst_reg;
