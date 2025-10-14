always @ (posedge clk, posedge reset) begin
	if(reset) begin
		ser_clk   <= 1'b0;
		ser_count <= 8'h00;
	end 
	else begin
		if (ser_count != 8'h3B) begin
			ser_count <= ser_count + 1'b1;
			ser_clk   <= ser_clk;
		end
		else begin
			ser_count <= 8'h00;
			ser_clk   <= ~ ser_clk;
		end
	end
end