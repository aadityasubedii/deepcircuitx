assign master_rdat  = current_slave == 4'd0  ? i_s0_wb_dat  :
                      current_slave == 4'd1  ? i_s1_wb_dat  :
                      current_slave == 4'd2  ? i_s2_wb_dat  :
                      current_slave == 4'd3  ? i_s3_wb_dat  :
                      current_slave == 4'd4  ? i_s4_wb_dat  :
                      current_slave == 4'd5  ? i_s5_wb_dat  :
                      current_slave == 4'd6  ? i_s6_wb_dat  :
                      current_slave == 4'd7  ? i_s7_wb_dat  :
                                               i_s2_wb_dat  ;