always @ (posedge clk, posedge reset) begin
	if(reset) begin
		co_proc_clk <= 1'b0;
		co_count    <= 4'h0;
	end 
	else begin
		if (co_count != 4'h2) begin
			co_count    <= co_count + 1'b1 ;
			co_proc_clk <= co_proc_clk;
		end
		else begin
			co_count    <= 4'h0;
			co_proc_clk <= ~ co_proc_clk;
		end
	end
end