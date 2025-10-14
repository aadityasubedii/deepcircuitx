always@(posedge clk)
if (reset)
	present_state <= `menu1;
else
	present_state <= next_state;