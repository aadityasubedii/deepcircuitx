	always @ (*)	begin			
		dac_cs = 1'b0;  dac_ld = 1'b1;
		case (state)
			5'd0: 	dac_cs = 1'b1;
			5'd17: 	begin dac_cs = 1'b1; dac_ld = 1'b0; end
			default: begin dac_cs = 1'b0;	dac_ld = 1'b1;	end
			endcase
		end 