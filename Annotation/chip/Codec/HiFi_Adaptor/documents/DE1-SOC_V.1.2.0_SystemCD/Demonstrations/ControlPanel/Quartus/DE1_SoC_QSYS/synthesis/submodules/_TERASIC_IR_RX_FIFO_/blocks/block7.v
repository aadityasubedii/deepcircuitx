always @ (posedge clk or negedge reset_n)
begin
	if (~reset_n)
		irq <= 1'b0;
	else if (~pre_data_ready & data_ready )
		irq <= 1'b1;
	else if (s_write && (s_address == `IR_RX_CS_REG))
		irq <=~s_writedata[1]; 
end