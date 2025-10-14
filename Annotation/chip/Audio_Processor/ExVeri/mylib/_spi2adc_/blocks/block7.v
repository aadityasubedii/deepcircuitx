	always @ (posedge sysclk)
		case (sr_state)
			IDLE:	if (start==1'b0) sr_state <= IDLE;
					else	begin
						sr_state <= WAIT_CSB_FALL;
						adc_start <= 1'b1;
						end  				
			WAIT_CSB_FALL: if (adc_cs==1'b1) sr_state <= WAIT_CSB_FALL;
					else sr_state <= WAIT_CSB_HIGH;
					
			WAIT_CSB_HIGH: if (adc_cs==1'b0) sr_state <= WAIT_CSB_HIGH;
					else begin
						sr_state <= IDLE;
						adc_start <= 1'b0;
						end	
			default: sr_state <= IDLE;
		endcase