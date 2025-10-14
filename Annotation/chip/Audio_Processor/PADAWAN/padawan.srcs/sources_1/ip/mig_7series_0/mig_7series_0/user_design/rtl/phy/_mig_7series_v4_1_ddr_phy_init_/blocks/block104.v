    always @(posedge clk)
      if (rst || (wr_victim_inc && (complex_row_cnt_ocal == COMPLEX_ROW_CNT_BYTE-1)) || ~rdlvl_stg1_done_r1 || prbs_rdlvl_done_pulse || complex_byte_rd_done)
        complex_row_cnt_ocal <= #TCQ 'd0;
      else if ( prbs_rdlvl_done && (((stg1_wr_rd_cnt == 'd30) && (init_state_r == INIT_RDLVL_COMPLEX_PRECHARGE)) || 
             (complex_sample_cnt_inc_r2) || wr_victim_inc)) begin
        
        if (complex_row_cnt_ocal < COMPLEX_ROW_CNT_BYTE-1)  begin
          complex_row_cnt_ocal <= #TCQ complex_row_cnt_ocal + 1;
    end
    end    