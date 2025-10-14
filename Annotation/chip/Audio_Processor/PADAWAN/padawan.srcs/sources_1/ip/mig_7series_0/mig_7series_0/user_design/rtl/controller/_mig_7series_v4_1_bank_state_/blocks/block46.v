  localparam nRP_CLKS = (nCK_PER_CLK == 1) ? nRP : 
                        (nCK_PER_CLK == 2) ? ((nRP/2) + (nRP%2)) : 
                       ((nRP/4) + ((nRP%4) ? 1 : 0));