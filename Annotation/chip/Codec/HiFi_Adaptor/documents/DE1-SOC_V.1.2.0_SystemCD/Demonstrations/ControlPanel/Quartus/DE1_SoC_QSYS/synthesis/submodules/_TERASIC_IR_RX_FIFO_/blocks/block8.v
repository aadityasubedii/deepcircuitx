always @ (posedge clk or negedge reset_n)
begin
	if (~reset_n)
		pre_data_ready <= 1'b0;
	else
		pre_data_ready <= data_ready;
end