	always @ (posedge sysclk)  
		case (sr_state)
			IDLE:	if (load==1'b1) sr_state <= WAIT_CSB_FALL;
			WAIT_CSB_FALL: if (dac_cs==1'b0) sr_state <= WAIT_CSB_HIGH;
			WAIT_CSB_HIGH: if (dac_cs==1'b1) sr_state <= IDLE;
			default: sr_state <= IDLE;
		endcase