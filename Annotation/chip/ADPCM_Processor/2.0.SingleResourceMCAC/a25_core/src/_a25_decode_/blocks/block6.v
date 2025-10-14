always @ ( posedge reset, posedge clk ) begin
	if (reset) begin
		irq   <= 'd0;
		firq  <= 'd0;
		dabt_reg  <= 'd0;
		dabt_reg_d1  <= 'd0;
	end else begin
		if ( !i_core_stall ) begin
			irq   <= i_irq;
			firq  <= i_firq;
			if ( control_state == INT_WAIT1 && status_bits_mode_r == SVC ) begin
				dabt_reg  <= 1'd0;
			end else begin
				dabt_reg  <= dabt_reg || i_dabt;
			end
			dabt_reg_d1  <= dabt_reg;
		end
	end
end