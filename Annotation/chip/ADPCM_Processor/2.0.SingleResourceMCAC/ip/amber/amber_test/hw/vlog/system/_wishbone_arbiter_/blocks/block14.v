assign master_adr   = current_master ? i_m1_wb_adr : i_m0_wb_adr ;
assign master_sel   = current_master ? i_m1_wb_sel : i_m0_wb_sel ;
assign master_wdat  = current_master ? i_m1_wb_dat : i_m0_wb_dat ;
assign master_we    = current_master ? i_m1_wb_we  : i_m0_wb_we  ;
assign master_cyc   = current_master ? i_m1_wb_cyc : i_m0_wb_cyc ;
assign master_stb   = current_master ? i_m1_wb_stb : i_m0_wb_stb ;