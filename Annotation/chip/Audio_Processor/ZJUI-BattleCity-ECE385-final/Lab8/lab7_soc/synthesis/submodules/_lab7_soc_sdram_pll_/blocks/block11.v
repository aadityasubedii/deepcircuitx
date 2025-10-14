	assign
		clk = {wire_pll7_clk[4:0]},
		locked = (wire_pll7_locked & pll_lock_sync);