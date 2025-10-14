assign o_s2_wb_adr  = master_adr;
assign o_s2_wb_dat  = master_wdat;
assign o_s2_wb_sel  = master_sel;
assign o_s2_wb_we   = current_slave == 4'd2 ? master_we  : 1'd0;
assign o_s2_wb_cyc  = current_slave == 4'd2 ? master_cyc : 1'd0;
assign o_s2_wb_stb  = current_slave == 4'd2 ? master_stb : 1'd0;