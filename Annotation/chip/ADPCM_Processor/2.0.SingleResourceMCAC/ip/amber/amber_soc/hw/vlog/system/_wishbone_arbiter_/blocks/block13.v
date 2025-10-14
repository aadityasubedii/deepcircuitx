assign o_s0_wb_adr  = master_adr;
assign o_s0_wb_dat  = master_wdat;
assign o_s0_wb_sel  = master_sel;
assign o_s0_wb_we   = current_slave == 4'd0 ? master_we  : 1'd0;
assign o_s0_wb_cyc  = current_slave == 4'd0 ? master_cyc : 1'd0;
assign o_s0_wb_stb  = current_slave == 4'd0 ? master_stb : 1'd0;