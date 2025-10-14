	always @(posedge clk_1MHz)  begin
		
		dac_cs <= 1'b0; dac_ld <= 1'b1; 
		state <= state + 1'b1;	
		case (state)
			5'd0:	if (dac_start == 1'b0)  begin  
						state <= 5'd0; 				
						dac_cs <= 1'b1; 
						end
			5'd16: begin  
						dac_cs <= 1'b1; dac_ld <= 1'b0; 
						state <= 5'd0;  
					end
			default:   begin					
					dac_cs <= 1'b0; dac_ld <= 1'b1; 
					state <= state + 1'b1;	
					end
			endcase
		end	