	always @(posedge sysclk)  
		if (tick==1'b1)
		case (state)
			5'd0:	if (dac_start == 1'b1)    
						state <= state + 1'b1; 
					else 
						state <= 5'b0; 
			5'd17: 	state <= 5'd0;  
			default: state <= state + 1'b1;	
		endcase