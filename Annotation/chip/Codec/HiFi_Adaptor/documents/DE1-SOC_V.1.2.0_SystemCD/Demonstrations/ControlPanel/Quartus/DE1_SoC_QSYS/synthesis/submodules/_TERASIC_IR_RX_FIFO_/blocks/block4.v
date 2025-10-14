always @ (clk)
begin
	if (~reset_n)
		 s_readdata <=32'b0;
	else if (s_read && (s_address == `IR_RX_CS_REG))
		s_readdata <= use_dw;
	
	else if (read && (s_address == `IR_RX_DATA_REG ))
	   s_readdata <= readdata;
		
	else
		 s_readdata <=32'b0;


end