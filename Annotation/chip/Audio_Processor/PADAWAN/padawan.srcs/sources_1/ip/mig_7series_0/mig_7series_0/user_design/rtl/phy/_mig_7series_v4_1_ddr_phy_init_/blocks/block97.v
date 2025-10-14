    always @(posedge clk)
      if (rst || (wr_victim_inc && (complex_row_cnt < DQ_PER_DQS*2-1) && ~prbs_rdlvl_done) ||  
                 (wr_victim_inc && prbs_rdlvl_done && complex_row_cnt_ocal <COMPLEX_ROW_CNT_BYTE-1) || 
                     complex_byte_rd_done || prbs_rdlvl_done_pulse) begin  
      complex_row1_wr_done    <= #TCQ 1'b0;
      end else if (complex_row0_wr_done && (stg1_wr_rd_cnt == 9'd2)) begin
      complex_row1_wr_done    <= #TCQ 1'b1;
    end