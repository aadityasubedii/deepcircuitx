generate
if (DATA_PATTERN == "DGEN_PRBS"  || DATA_PATTERN == "DGEN_ALL")  begin : PRBS_PATTERN
       





assign data_clk_en = fifo_rdy_i && data_rdy_i && user_burst_cnt > 6'd1;


data_prbs_gen #
  (
    .TCQ        (TCQ),
    .PRBS_WIDTH (32),  
    .SEED_WIDTH (32)
   )
   data_prbs_gen
  (
   .clk_i            (clk_i),
   .clk_en           (data_clk_en),
   .rst_i            (rst_i),
   .prbs_fseed_i     (prbs_fseed_i),
   .prbs_seed_init   (cmd_startE),
   .prbs_seed_i      (addr_i[31:0]),
   .prbs_o           (prbs_data)

  );       
end        
endgenerate