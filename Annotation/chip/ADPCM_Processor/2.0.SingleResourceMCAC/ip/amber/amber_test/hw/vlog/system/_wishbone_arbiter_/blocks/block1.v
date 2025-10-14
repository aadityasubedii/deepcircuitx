assign o_m1_wb_dat  = master_rdat;
assign o_m1_wb_ack  = current_master  ?  master_ack : 1'd0 ;
assign o_m1_wb_err  = current_master  ?  master_err : 1'd0 ;