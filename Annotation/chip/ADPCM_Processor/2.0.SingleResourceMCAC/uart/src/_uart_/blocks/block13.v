always @( posedge reset, posedge clk ) begin
	if (reset) begin
		uart_rsr_reg <= 'd0;
		uart_lcrh_reg <= 'd0;
		uart_lcrm_reg <= 'd0;
		uart_lcrl_reg <= 'd0;
		uart_cr_reg <= 'd0;
	end else begin
	    if ( wb_start_write )
		  case ( i_wb_adr[15:0] )
		      
		      AMBER_UART_RSR:  uart_rsr_reg      <= wb_wdata32[7:0];
		      
		      AMBER_UART_LCRH: uart_lcrh_reg     <= wb_wdata32[7:0];
		      
		      AMBER_UART_LCRM: uart_lcrm_reg     <= wb_wdata32[7:0];
		      
		      AMBER_UART_LCRL: uart_lcrl_reg     <= wb_wdata32[7:0];
		      
		      AMBER_UART_CR:   uart_cr_reg       <= wb_wdata32[7:0];
		  endcase
	end
end