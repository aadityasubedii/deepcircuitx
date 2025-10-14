picoblaze pblaze(
	.port_id(pb_port_id),
	.read_strobe(pb_read_strobe), 
	.in_port(pb_in_port),
	.write_strobe(pb_write_strobe), 
	.out_port(pb_out_port),
	.interrupt(pb_interrupt),
	.interrupt_ack(),
	.reset(pb_reset),
	.clk(clk100mhz)
 );