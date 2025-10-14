always @( posedge reset, posedge clk ) begin
	if (reset) begin
		irq_timer <= 'd0;
	end else begin
	    if ( wb_start_write && i_wb_adr[15:0] == AMBER_TEST_IRQ_TIMER )
		  irq_timer <= wb_wdata32[7:0];
	    else if ( irq_timer > 8'd1 )
		  irq_timer <= irq_timer - 1'd1;
	end
end