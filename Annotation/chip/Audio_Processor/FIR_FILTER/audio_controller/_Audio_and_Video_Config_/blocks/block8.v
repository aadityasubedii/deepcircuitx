always @(*)
begin
	
	ns_alavon_slave = I2C_STATE_0_IDLE;

    case (s_alavon_slave)
	I2C_STATE_0_IDLE:
		begin
			if ((valid_operation == 1'b1) && (auto_init_complete == 1'b1))
			begin
				ns_alavon_slave = I2C_STATE_1_START;
			end
			else
			begin
				ns_alavon_slave = I2C_STATE_0_IDLE;
			end
		end
	I2C_STATE_1_START:
		begin
			ns_alavon_slave = I2C_STATE_2_TRANSFERING;
		end
	I2C_STATE_2_TRANSFERING:
		begin
			if (transfer_complete == 1'b1)
			begin
				ns_alavon_slave = I2C_STATE_3_COMPLETE;
			end
			else
			begin
				ns_alavon_slave = I2C_STATE_2_TRANSFERING;
			end
		end
	I2C_STATE_3_COMPLETE:
		begin
			ns_alavon_slave = I2C_STATE_0_IDLE;
		end
	default:
		begin
			ns_alavon_slave = I2C_STATE_0_IDLE;
		end
	endcase
end