always @( pll_clk_beh )
    begin
    if ( pll_div_count == (
        `AMBER_CLK_DIVIDER 
        * 2 ) - 1 )
        pll_div_count <= 'd0;
    else    
        pll_div_count <= pll_div_count + 1'd1;
        
    if ( pll_div_count == 0 )
        sys_clk_beh = 1'd1;
    else if ( pll_div_count == 
        `AMBER_CLK_DIVIDER 
        )
        sys_clk_beh = 1'd0;
    end