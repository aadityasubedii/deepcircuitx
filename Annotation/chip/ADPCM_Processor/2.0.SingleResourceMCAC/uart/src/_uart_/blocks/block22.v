always @( posedge reset, posedge clk ) begin
	if (reset) begin
		uart0_cts_n_d <= 4'hf;
	end else begin
		uart0_cts_n_d <= {uart0_cts_n_d[2:0], i_uart_cts_n};
	end
end                                  