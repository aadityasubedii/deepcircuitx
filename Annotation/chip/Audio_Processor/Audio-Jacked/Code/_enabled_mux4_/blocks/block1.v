always @(*)
	if (reset)	e = 0;
	else if (enable) e = e_o;

endmodule