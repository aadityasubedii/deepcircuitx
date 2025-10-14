always @(posedge clk)
begin
	if (reset == 1'b1)
		current_bit	<= 3'h0;
	else if ((s_i2c_transceiver == I2C_STATE_3_TRANSFER_BYTE) && 
			(change_output_bit_en == 1'b1))
		current_bit <= current_bit - 3'h1;
	else if (s_i2c_transceiver != I2C_STATE_3_TRANSFER_BYTE)
		current_bit <= num_bits_to_transfer;
end