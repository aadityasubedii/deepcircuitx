    if (((nCK_PER_CLK == 2) && ((BURST_MODE == "8") || (DRAM_TYPE == "DDR3")))
    || ((nCK_PER_CLK == 1) && ((BURST_MODE == "4") || (DRAM_TYPE == "DDR2"))))
    begin : one_bump