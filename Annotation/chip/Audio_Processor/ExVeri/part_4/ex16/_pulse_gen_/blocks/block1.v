	always @ (posedge clk) 
		begin	
			pulse <= 0;		 
			case (state)
			IDLE: 	if (in == 1'b1) begin
							state <= IN_HIGH;	pulse <= 1'b1; end
						else 
							state <= IDLE; 
			IN_HIGH: if (in == 1'b1) 
							state <= WAIT_LOW;
						else 
							state <= IDLE; 
			WAIT_LOW: if (in == 1'b1) 
							state <= WAIT_LOW;
						 else  
							state <= IDLE;
			default: ;
			endcase
		end			