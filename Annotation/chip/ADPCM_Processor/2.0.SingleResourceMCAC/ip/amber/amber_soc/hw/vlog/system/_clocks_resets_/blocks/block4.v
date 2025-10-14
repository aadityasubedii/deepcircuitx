always @( posedge i_brd_clk_p )
    begin
    pll_clk_beh = 1'd1;
    # ( pll_clk_period / 2 )
    pll_clk_beh = 1'd0;
    # ( pll_clk_period / 2 )

    pll_clk_beh = 1'd1;
    # ( pll_clk_period / 2 )
    pll_clk_beh = 1'd0;
    # ( pll_clk_period / 2 )

    pll_clk_beh = 1'd1;
    # ( pll_clk_period / 2 )
    pll_clk_beh = 1'd0;
    # ( pll_clk_period / 2 )

    pll_clk_beh = 1'd1;
    # ( pll_clk_period / 2 )
    pll_clk_beh = 1'd0;

    end