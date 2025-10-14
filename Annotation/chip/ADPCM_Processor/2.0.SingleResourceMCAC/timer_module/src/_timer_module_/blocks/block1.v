always @(posedge reset, posedge clk) begin
	if (reset) begin
		timer0_int_reg_d1 <= 'd0;
		timer1_int_reg_d1 <= 'd0;
		timer2_int_reg_d1 <= 'd0;
	end else begin
	    timer0_int_reg_d1 <= timer0_int_reg;
	    timer1_int_reg_d1 <= timer1_int_reg;
	    timer2_int_reg_d1 <= timer2_int_reg;
	    
	    if ( timer0_int_reg && !timer0_int_reg_d1 )
		  begin
		  `TB_DEBUG_MESSAGE
		  $display("Timer Module Timer 0 Interrupt"); 
		  end
	    if ( timer1_int_reg && !timer1_int_reg_d1 )
		  begin
		  `TB_DEBUG_MESSAGE
		  $display("Timer Module Timer 1 Interrupt"); 
		  end
	    if ( timer2_int_reg && !timer2_int_reg_d1 )
		  begin
		  `TB_DEBUG_MESSAGE
		  $display("Timer Module Timer 2 Interrupt"); 
		  end
	end
end   