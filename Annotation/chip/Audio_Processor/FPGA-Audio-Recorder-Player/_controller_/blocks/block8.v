assign pb_reset = ~reset;
assign uart_reset =  ~reset;
assign pb_interrupt = 1'b0;
assign write_to_uart = pb_write_strobe & (pb_port_id == 8'h03);
assign write_to_state_reg = pb_write_strobe & (pb_port_id == 8'h06);

assign STATLED0 = record;
assign STATLED1 = play;
