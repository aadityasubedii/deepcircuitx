always @(posedge clk)begin
	if(cnt256_n == 8'd1)begin
		ch1_out <= ch1_buf;
		ch2_out <= ch2_buf;
	end
end