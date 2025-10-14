always @ (posedge clk) begin
		s_max <= (FPGA_CLK*LR_SAM)/(2*Fs*DIN_W); 
	end