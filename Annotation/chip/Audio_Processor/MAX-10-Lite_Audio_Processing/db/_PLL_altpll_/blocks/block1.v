	assign
		clk = {wire_pll1_clk[4:0]},
		locked = (wire_pll1_locked & pll_lock_sync);