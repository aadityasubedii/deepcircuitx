always @ (posedge clk) begin
	if (rst) PS <= IDLE;
	else PS <= NS;
end