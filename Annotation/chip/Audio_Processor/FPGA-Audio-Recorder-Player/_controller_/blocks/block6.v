always @(posedge clk100mhz or posedge pb_reset)
	begin
		if(pb_reset) begin
			pb_in_port <= 0;
			read_from_uart <= 0;
		end else begin
			
			case(pb_port_id)
				
				8'h02: pb_in_port <= uart_rx_data;
				8'h04: pb_in_port <= {7'b0000000,uart_data_present};
				8'h05: pb_in_port <= {7'b0000000,uart_buffer_full};
				8'h07: pb_in_port <= {7'b0000000,deletedall};
				default: pb_in_port <= 8'h00;
			endcase
			
			
			
			
			
			
			
			read_from_uart <= pb_read_strobe & (pb_port_id == 8'h04);
			if(write_to_state_reg) begin 
				record <= (pb_out_port == 8'h01); 
				play <= (pb_out_port == 8'h00);
				delete <= (pb_out_port == 8'h02);
				pause <= (pb_out_port == 8'h03);
				delete_all <= (pb_out_port == 8'h04);
			end
		end
	end