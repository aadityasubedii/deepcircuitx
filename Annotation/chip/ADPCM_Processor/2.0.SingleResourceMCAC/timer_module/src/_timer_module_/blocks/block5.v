	    if ( wb_start_write && i_wb_adr[15:0] == AMBER_TM_TIMER1_CLR)
		  timer1_int_reg <= 1'd0;
	    else if ( timer1_value_reg == 24'd0 )