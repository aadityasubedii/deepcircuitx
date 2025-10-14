	always @ (posedge clk)
		if (spkr_done)
			spkr_update <= 1;
		else if(buffer_updated)
			spkr_update <= 0;
			
		
			
		

endmodule