    always @(posedge clk)
      if (rst || (wr_victim_inc && (complex_row_cnt == DQ_PER_DQS*2-1)) || ~rdlvl_stg1_done_r1 || prbs_rdlvl_done)
      complex_row_cnt <= #TCQ 'd0;
    else if ((((stg1_wr_rd_cnt == 'd22) && ((init_state_r == INIT_RDLVL_COMPLEX_PRECHARGE) || 
	                                        (complex_rdlvl_int_ref_req && (init_state_r == INIT_REFRESH_WAIT) && (cnt_cmd_r == 'd127)))) || 
             complex_victim_inc || (complex_sample_cnt_inc_r2 && ~complex_victim_inc) || wr_victim_inc || reset_rd_addr_r1)) begin
      
      if ((complex_row_cnt < DQ_PER_DQS*2-1) && ~stg1_wr_done)
        complex_row_cnt <= #TCQ complex_row_cnt + 1;
      
      else if (stg1_wr_done) begin
          if (reset_rd_addr_r1)
            complex_row_cnt <= #TCQ 'd0; 
        
        else if (complex_sample_cnt_inc_r2 && ~complex_victim_inc)
          complex_row_cnt <= #TCQ rd_victim_sel*2;
        
        else if (complex_row_cnt < DQ_PER_DQS*2-1)
          complex_row_cnt <= #TCQ complex_row_cnt + 1;
        
        else
          complex_row_cnt <= #TCQ 'd0; 
      end
    end