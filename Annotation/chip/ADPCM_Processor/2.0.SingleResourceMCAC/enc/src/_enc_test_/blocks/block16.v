always @ (posedge clk, posedge reset) begin
	if(reset) begin
		enc_s_clk <= 1'b0;
		ser_count <= 8'h00;
	end else if (ser_count != 8'h3B) begin
		ser_count <= ser_count + 1'b1;
		enc_s_clk <= enc_s_clk;
	end else if (ser_count == 8'h3B) begin
		ser_count <= 8'h00;
		enc_s_clk <= ~ enc_s_clk;
	end
end