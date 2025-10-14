always@ (posedge sys_clk, posedge reset) begin

	if (reset) begin
		data_buf_1	<= 8'h00;
		data_buf_2	<= 8'h00;
		ch_buf_1	<= 5'b00000;
		ch_buf_2	<= 5'b00000;
		o_wb_dat	<= 32'h00000000;
		int_buf_1   <= 1'b0;
		int_set	<= 1'b0;
		new_data_int <= 1'b0;
		start_read <= 1'b0;
		bit_count_buf <= 3'b000;
		tdmi_begin	<= 1'b0;
	end else begin
		if (tdmi_begin) begin
			bit_count_buf <= bit_count;
			if ((~prev_frame_sync) & frame_sync) begin
				int_buf_1 <= 1'b0;
				int_set <= int_set;
			end else if ((bit_count_buf != 3'b111) || (bit_count != 3'b111)) begin
				int_set <= 1'b0;
				int_buf_1 <= int_buf_1;
			end else if (~int_set & fs_start) begin
				int_buf_1 <= 1'b1;	
				int_set <= 1'b1;
			end
			new_data_int <= int_buf_1;
			if (bit_count == 3'b111) begin
				ch_buf_1 <= ch_count;	
				data_buf_1 <= data_out_buf; 
			end
			data_buf_2 <= data_buf_1;	
			ch_buf_2 <= ch_buf_1;
		end
		if (i_wb_stb & i_wb_cyc & (~i_wb_we)) begin	
			case (i_wb_adr[15:0])				
				TDMI_ALL:
					begin
						o_wb_dat <= {19'h00000, ch_buf_2, data_buf_2};	
					end
				TDMI_CHANNEL:
					begin
						o_wb_dat <= {27'h0000000, ch_buf_2[4:0]};		
					end
				TDMI_DATA:
					begin
						o_wb_dat <= {24'h00000, data_buf_2};		
					end
				default:
					begin
						o_wb_dat <= {19'h00000, ch_buf_2, data_buf_2};	
					end
			endcase
			start_read <= 1'b1;
			int_buf_1 <= 1'b0;	
		end else if (i_wb_stb & i_wb_cyc & i_wb_we) begin
			case (i_wb_adr[15:0])
				TDMI_START:
					begin
						tdmi_begin <= i_wb_dat[0];
					end
				default:	tdmi_begin <= 1'b0;
			endcase
			start_read <= 1'b0;
		end else begin
			start_read <= 1'b0;
		end
	end
end