generate
if (DATA_PATTERN == "DGEN_PRBS"  || DATA_PATTERN == "DGEN_ALL")  begin : PRBS_PATTERN
       




data_prbs_gen #
  (
    .PRBS_WIDTH (32),  
    .SEED_WIDTH (32),
    .EYE_TEST   (EYE_TEST)
   )
   data_prbs_gen
  (
   .clk_i            (clk_i),
   .rst_i            (rst_i),
   .clk_en           (data_clk_en),
   
   .prbs_fseed_i     (prbs_fseed_i),
   .prbs_seed_init   (cmd_startE),
   .prbs_seed_i      ({m_addr_i[6],m_addr_i[31],m_addr_i[8],m_addr_i[22],m_addr_i[9],m_addr_i[24],m_addr_i[21],m_addr_i[23],
                       m_addr_i[18],m_addr_i[10],m_addr_i[20],m_addr_i[17],m_addr_i[13],m_addr_i[16],m_addr_i[12],m_addr_i[4],
                       m_addr_i[15:0]}),
   .prbs_o           (prbs_data)

  );       
end        
endgenerate