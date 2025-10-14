	always @ (posedge clk)
		if (load == 1'b1) d <= data_in;
		
endmodule