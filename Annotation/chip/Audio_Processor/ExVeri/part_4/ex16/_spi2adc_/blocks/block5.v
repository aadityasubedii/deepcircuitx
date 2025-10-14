	always @(posedge clk_1MHz)  begin
	
	
		adc_cs <= 1'b0;  adc_done <= 1'b0;  adc_din <= 1'b0; shift_ena <= 1'b0;
		state <= state + 1'b1;
		case (state)
			5'd0:	begin
						if (adc_start==1'b0) begin
							state <= 5'd0;			
							adc_cs <= 1'b1;		
							end
						else begin
							state <= 5'd1;			
							adc_din <= 1'b1;		
							end
					end
			5'd1:	adc_din <= SGL;				
			5'd2:	adc_din <= channel;			
			5'd3:	adc_din <= MSBF;				
			5'd4: shift_ena <= 1'b1;  			
			5'd15: begin
						shift_ena <= 1'b0;
						adc_done <= 1'b1;
					 end
			5'd16: begin  
						adc_cs <= 1'b1;		
						state <= 5'd0;  		
					 end
			default: 				
						shift_ena <= 1'b1;	
			endcase
		end	