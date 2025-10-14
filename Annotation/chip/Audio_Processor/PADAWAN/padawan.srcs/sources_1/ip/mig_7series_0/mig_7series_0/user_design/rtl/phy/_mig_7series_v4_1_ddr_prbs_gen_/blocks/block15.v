  always @(posedge clk_i)
  begin
    if (rst_i || ~clk_en_i) begin
      sample_cnt_r    <= #TCQ 'b0;
      reseed_prbs_r   <= #TCQ 1'b0;
    end else if (clk_en_i && (~phy_if_empty_r || ~prbs_rdlvl_start)) begin
      
      sample_cnt_r    <= #TCQ sample_cnt_r + 1;
      
      
      if (sample_cnt_r == PRBS_SEQ_LEN_CYCLES - 2)
        reseed_prbs_r <= #TCQ 1'b1;
      else
        reseed_prbs_r <= #TCQ 1'b0;
    end
  end