always @(posedge clk)
	last_test_clk	<= cur_test_clk;






assign rising_edge	= found_edge & cur_test_clk;
assign falling_edge	= found_edge & last_test_clk;


assign found_edge	= last_test_clk ^ cur_test_clk;





endmodule