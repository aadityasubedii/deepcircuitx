always @( posedge reset, posedge clk_uart) begin
	if (reset) begin
		rx_state            <= 'd0;
		rx_bit              <= 'd0;
		rx_byte             <= 'd0;
		rx_tap              <= 'd0;
		rx_start_negedge_d1 <= 'd0;
	end else begin
		rx_tap <= {rx_tap[2:0], i_uart_rxd};
		case ( rx_state )
			2'd0: begin
				if (rx_start_negedge) begin
					rx_state <= 2'd1;
				end
			end
			2'd1: begin
				if (rx_bit == 3'b110) begin
					rx_state <= 2'd2; 
				end
			end
			2'd2: begin
				rx_state <= 2'd0; 
			end
		endcase
		if ((rx_state == 2'd1) || rx_start_negedge) begin
			rx_bit  <= rx_bit + 1'd1;
			
			rx_byte <= {i_uart_rxd, rx_byte[7:1]};
		end
		
		
		if (rx_state == 2'd2 && rx_byte != 8'h0d && (rx_byte != 8'h0c)) begin
			$write("%c", rx_byte);
		end
	end
end