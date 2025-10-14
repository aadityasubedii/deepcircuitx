	    if ( wb_start_write && i_wb_adr[15:0] == AMBER_TM_TIMER2_CLR)
		  timer2_int_reg <= 1'd0;
	    else if ( timer2_value_reg == 24'd0 )