always@ (posedge clk, posedge reset) begin
	if (reset) begin
		o_wb_dat_d         <= 32'h00000000;
		start_read_d	   <= 1'b0;
		o_wb_ack_d         <= 1'b0;
		wb_ack2_d          <= 1'b0;
		dec_ready_for_data <= 1'b0;
	end else begin
		if(i_wb_adr_d[15:0] == CONFIG_DONE_REG) begin
			buffer_1 <= {2'b00,&(decoder_configured)}; 
			buffer_2 <= buffer_1;
		end
		else begin
			buffer_1   <= dec_ch[(i_wb_adr_d[6:0])/4];
			buffer_2   <= buffer_1;
		end
		wb_ack2_d  <= wb_ack1_d;
		o_wb_ack_d <= wb_ack2_d;

		if(i_wb_stb_d & i_wb_cyc_d & i_wb_we_d) begin 
			if(i_wb_adr_d[15:0] == CONFIG_CORE_READY) begin
				dec_ready_for_data <= 1'b1;
			end
		end

		if (i_wb_stb_d & i_wb_cyc_d & (~i_wb_we_d)) begin	
			o_wb_dat_d <= {29'h00000000, buffer_2};
			start_read_d <= 1'b1;
		end else begin
			start_read_d <= 1'b0;
		end		
	end
end