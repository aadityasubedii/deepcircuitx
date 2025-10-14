always @(*)
begin
	
	ns_i2c_auto_init = AUTO_STATE_0_CHECK_STATUS;

    case (s_i2c_auto_init)
	AUTO_STATE_0_CHECK_STATUS:
		begin
			if (finished_auto_init == 1'b1)
				ns_i2c_auto_init = AUTO_STATE_7_DONE;
			else if (rom_data[25] == 1'b1)
				ns_i2c_auto_init = AUTO_STATE_1_SEND_START_BIT;
			else
				ns_i2c_auto_init = AUTO_STATE_3_TRANSFER_BYTE_2;
		end
	AUTO_STATE_1_SEND_START_BIT:
		begin
			if (change_state == 1'b1)
				ns_i2c_auto_init = AUTO_STATE_2_TRANSFER_BYTE_1;
			else
				ns_i2c_auto_init = AUTO_STATE_1_SEND_START_BIT;
		end
	AUTO_STATE_2_TRANSFER_BYTE_1:
		begin
			if (change_state == 1'b1)
				ns_i2c_auto_init = AUTO_STATE_3_TRANSFER_BYTE_2;
			else
				ns_i2c_auto_init = AUTO_STATE_2_TRANSFER_BYTE_1;
		end
	AUTO_STATE_3_TRANSFER_BYTE_2:
		begin
			if ((change_state == 1'b1) && (rom_data[24] == 1'b1))
				ns_i2c_auto_init = AUTO_STATE_4_WAIT;
			else if (change_state == 1'b1)
				ns_i2c_auto_init = AUTO_STATE_6_INCREASE_COUNTER;
			else
				ns_i2c_auto_init = AUTO_STATE_3_TRANSFER_BYTE_2;
		end
	AUTO_STATE_4_WAIT:
		begin
			if (transfer_complete == 1'b0)
				ns_i2c_auto_init = AUTO_STATE_5_SEND_STOP_BIT;
			else
				ns_i2c_auto_init = AUTO_STATE_4_WAIT;
		end
	AUTO_STATE_5_SEND_STOP_BIT:
		begin
			if (transfer_complete == 1'b1)
				ns_i2c_auto_init = AUTO_STATE_6_INCREASE_COUNTER;
			else
				ns_i2c_auto_init = AUTO_STATE_5_SEND_STOP_BIT;
		end
	AUTO_STATE_6_INCREASE_COUNTER:
		begin
			ns_i2c_auto_init = AUTO_STATE_0_CHECK_STATUS;
		end
	AUTO_STATE_7_DONE:
		begin
			ns_i2c_auto_init = AUTO_STATE_7_DONE;
		end
	default:
		begin
			ns_i2c_auto_init = AUTO_STATE_0_CHECK_STATUS;
		end
	endcase
end