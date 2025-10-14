	always @ (*)
		case (sr_state)
			IDLE: dac_start = 1'b0;
			WAIT_CSB_FALL: dac_start = 1'b1;
			WAIT_CSB_HIGH: dac_start = 1'b0;
			default: dac_start = 1'b0;
		endcase