  generate
    if ((nCK_PER_CLK == 1) && ((BURST_MODE == "8") || (DRAM_TYPE == "DDR3")))
    begin : three_bumps
      reg [1:0] granted_col_d_r;
      wire [1:0] granted_col_d_ns = {sent_col, granted_col_d_r[1]};