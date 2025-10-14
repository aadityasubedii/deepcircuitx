  always @(posedge clk)
    if (rst) begin
      wr_victim_sel_ocal <= #TCQ 'd0;
    end else if (wr_victim_inc && (complex_row_cnt_ocal == COMPLEX_ROW_CNT_BYTE-1)) begin
      wr_victim_sel_ocal <= #TCQ 'd0;
    end else if (prbs_rdlvl_done && wr_victim_inc) begin
      wr_victim_sel_ocal <= #TCQ wr_victim_sel_ocal + 1;
    end