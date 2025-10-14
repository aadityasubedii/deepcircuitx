    always @(posedge clk)
      if (rst || prbs_rdlvl_done_pulse ||
                (wr_victim_inc && prbs_rdlvl_done && complex_row_cnt_ocal <COMPLEX_ROW_CNT_BYTE-1) || 
        complex_byte_rd_done ) begin
        complex_row0_wr_done    <= #TCQ 1'b0;
      end else if (rdlvl_stg1_done_r1 && (stg1_wr_rd_cnt == 9'd2)) begin
        complex_row0_wr_done    <= #TCQ 1'b1;
    end