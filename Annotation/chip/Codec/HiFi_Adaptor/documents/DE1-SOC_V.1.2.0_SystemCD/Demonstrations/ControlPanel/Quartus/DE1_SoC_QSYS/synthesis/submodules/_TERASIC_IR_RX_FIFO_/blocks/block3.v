always @ (posedge clk or negedge reset_n)
begin
	if (~reset_n)
		write <= 1'b0;
	else if (~pre_data_ready & data_ready )
		write <= 1'b1;
	else if (write)
		write <=0; 
end