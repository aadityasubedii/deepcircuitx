  always @(posedge clk)
    if (rst || (wr_victim_inc && (complex_row_cnt == DQ_PER_DQS*2-1))) begin  
      wr_victim_sel <= #TCQ 'd0;
    end else if (rdlvl_stg1_done_r1 && wr_victim_inc) begin
      wr_victim_sel <= #TCQ wr_victim_sel + 1;
    end