always @(rate, law) begin
	case (rates[rate])
		"40": w_data[2:1] = 2'b00;
		"32": w_data[2:1] = 2'b01;
		"24": w_data[2:1] = 2'b10;
		"16": w_data[2:1] = 2'b11;
	endcase
	case (laws[law])
		"AA": w_data[0] = 1;
		"MM": w_data[0] = 0;
		"AM": w_data[0] = 1;
		"MA": w_data[0] = 0;
	endcase
	for (next_channel = 0; next_channel<32; next_channel=next_channel+1) begin
		addrs[4:0] = next_channel;
		ws = 1'b1;
		@(posedge clk);
		ws = 1'b0;
		@(posedge clk);
	end
	config_done = 1'b1;
end