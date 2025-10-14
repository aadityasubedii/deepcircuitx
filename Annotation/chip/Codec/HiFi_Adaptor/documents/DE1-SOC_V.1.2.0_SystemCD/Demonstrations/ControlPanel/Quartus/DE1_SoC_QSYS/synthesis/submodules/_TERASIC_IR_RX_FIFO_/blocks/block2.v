ir_fifo ir_fifo_inst(
	.aclr(fifo_clear),
	
	.data(writedata),
	.wrclk(clk),
	.wrreq(write),

   .rdclk(clk),
	.rdreq(read),
	.q(readdata),
	.rdusedw(use_dw),
	.rdempty()
	
);