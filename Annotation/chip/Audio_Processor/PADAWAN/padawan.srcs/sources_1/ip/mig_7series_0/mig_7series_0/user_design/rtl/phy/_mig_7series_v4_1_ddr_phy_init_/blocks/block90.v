  always @ (posedge clk)
    if (rst || prbs_rdlvl_done_pulse) complex_row1_rd_cnt <= #TCQ 'd0;
    else 
      complex_row1_rd_cnt <= #TCQ (complex_row1_rd_done & ~complex_row1_rd_done_r1) ? 
                                  ((complex_row1_rd_cnt == (COMPLEX_RD-1))? 0:complex_row1_rd_cnt + 'd1) 
				  : complex_row1_rd_cnt;