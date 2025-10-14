	always @ (posedge clk)
		case (sr_state)
			IDLE:	if (load==1'b0) sr_state <= IDLE;
					else	begin
						sr_state <= WAIT_CSB_FALL;
						dac_start <= 1'b1;
						end  				
			WAIT_CSB_FALL: if (dac_cs==1'b1) sr_state <= WAIT_CSB_FALL;
					else sr_state <= WAIT_CSB_HIGH;
					
			WAIT_CSB_HIGH: if (dac_cs==1'b0) sr_state <= WAIT_CSB_HIGH;
					else begin
						sr_state <= IDLE;
						dac_start <= 1'b0;
						end	
			default: sr_state <= IDLE;
		endcase