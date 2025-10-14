  always @(posedge clk)
    if (rst || prbs_rdlvl_done_pulse) begin
      complex_num_writes <= #TCQ 'd1;
    end else if ((init_state_r == INIT_OCAL_COMPLEX_WRITE_WAIT) && (complex_wait_cnt == 'd14) && ~complex_row0_wr_done) begin
      if (stg1_wr_rd_cnt > 'd85) begin
        if (complex_num_writes < 'd6)
          complex_num_writes <= #TCQ complex_num_writes + 1;
        else
          complex_num_writes <= #TCQ 'd1;
      
      end else if (stg1_wr_rd_cnt > 'd73) begin
        if (stg1_wr_rd_cnt == 'd85) 
          complex_num_writes <= #TCQ 'd3;
        else if (complex_num_writes < 'd5)
          complex_num_writes <= #TCQ complex_num_writes + 1;
      end else if (stg1_wr_rd_cnt > 'd39) begin
        if (stg1_wr_rd_cnt == 'd73) 
          complex_num_writes <= #TCQ 'd7;
        else if (complex_num_writes < 'd10)
          complex_num_writes <= #TCQ complex_num_writes + 1;
      end else begin
        if (stg1_wr_rd_cnt == 'd39) 
          complex_num_writes <= #TCQ 'd12;
        else if (complex_num_writes < 'd14)
          complex_num_writes <= #TCQ complex_num_writes + 1;
      end 
    
    end else if ((init_state_r == INIT_RDLVL_COMPLEX_ACT_WAIT) && complex_row0_wr_done)
      complex_num_writes <= #TCQ 'd30;
    else if (init_state_r == INIT_RDLVL_COMPLEX_ACT_WAIT)
      complex_num_writes <= #TCQ 'd1;    