assign o_m0_wb_dat  = master_rdat;
assign o_m0_wb_ack  = current_master  ? 1'd0 : master_ack ;
assign o_m0_wb_err  = current_master  ? 1'd0 : master_err ;