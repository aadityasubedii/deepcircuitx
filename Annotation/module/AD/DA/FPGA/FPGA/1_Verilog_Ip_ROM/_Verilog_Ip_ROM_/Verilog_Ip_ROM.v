module Verilog_Ip_ROM
(
	input CLK_50M,
	input rst_n,
	input[13:0] address,
	output[7:0] readdata
);
	
	ROM	ROM_inst
	(
		.address	(address),
		.clock	(CLK_50M),
		.q			(readdata)
	);
	
endmodule
