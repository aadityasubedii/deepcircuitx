always @(*)
begin
	
	ns_i2c_transceiver = I2C_STATE_0_IDLE;

    case (s_i2c_transceiver)
	I2C_STATE_0_IDLE:
		begin
			if ((send_start_bit == 1'b1) && (clk_400KHz == 1'b0))
				ns_i2c_transceiver = I2C_STATE_1_PRE_START;
			else if (send_start_bit == 1'b1)
				ns_i2c_transceiver = I2C_STATE_2_START_BIT;
			else if (send_stop_bit == 1'b1)
				ns_i2c_transceiver = I2C_STATE_5_STOP_BIT;
			else if (transfer_data == 1'b1)
				ns_i2c_transceiver = I2C_STATE_3_TRANSFER_BYTE;
			else
				ns_i2c_transceiver = I2C_STATE_0_IDLE;
		end
	I2C_STATE_1_PRE_START:
		begin
			if (start_and_stop_en == 1'b1)
				ns_i2c_transceiver = I2C_STATE_2_START_BIT;
			else
				ns_i2c_transceiver = I2C_STATE_1_PRE_START;
		end
	I2C_STATE_2_START_BIT:
		begin
			if (change_output_bit_en == 1'b1)
			begin
				if ((transfer_data == 1'b1) && (I2C_BUS_MODE == 1'b0))
					ns_i2c_transceiver = I2C_STATE_3_TRANSFER_BYTE;
				else
					ns_i2c_transceiver = I2C_STATE_6_COMPLETE;
			end
			else
				ns_i2c_transceiver = I2C_STATE_2_START_BIT;
		end
	I2C_STATE_3_TRANSFER_BYTE:
		begin
			if ((current_bit == 3'h0) && (change_output_bit_en == 1'b1))
			begin
				if ((I2C_BUS_MODE == 1'b0) || (num_bits_to_transfer == 3'h6))
					ns_i2c_transceiver = I2C_STATE_4_TRANSFER_ACK;
				else
					ns_i2c_transceiver = I2C_STATE_6_COMPLETE;
			end
			else
				ns_i2c_transceiver = I2C_STATE_3_TRANSFER_BYTE;
		end
	I2C_STATE_4_TRANSFER_ACK:
		begin
			if (change_output_bit_en == 1'b1)
				ns_i2c_transceiver = I2C_STATE_6_COMPLETE;
			else
				ns_i2c_transceiver = I2C_STATE_4_TRANSFER_ACK;
		end
	I2C_STATE_5_STOP_BIT:
		begin
			if (start_and_stop_en == 1'b1)
				ns_i2c_transceiver = I2C_STATE_6_COMPLETE;
			else
				ns_i2c_transceiver = I2C_STATE_5_STOP_BIT;
		end
	I2C_STATE_6_COMPLETE:
		begin
			if (transfer_data == 1'b0)
				ns_i2c_transceiver = I2C_STATE_0_IDLE;
			else
				ns_i2c_transceiver = I2C_STATE_6_COMPLETE;
		end
	default:
		begin
			ns_i2c_transceiver = I2C_STATE_0_IDLE;
		end
	endcase
end