   always @(posedge clk)
     if (rst)
       complex_sample_cnt_inc <= #TCQ 1'b0;
     else if ((stg1_wr_rd_cnt == 9'd1) && complex_row1_rd_done)
       complex_sample_cnt_inc <= #TCQ 1'b1;
     else
       complex_sample_cnt_inc <= #TCQ 1'b0;