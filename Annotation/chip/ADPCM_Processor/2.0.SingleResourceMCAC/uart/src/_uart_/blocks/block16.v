always @( posedge reset, posedge clk ) begin
	if (reset) begin
		rxd_d <= 5'h1f;
	end else begin
		rxd_d[4:0] <= {rxd_d[3:0], i_uart_rxd};
	end
end