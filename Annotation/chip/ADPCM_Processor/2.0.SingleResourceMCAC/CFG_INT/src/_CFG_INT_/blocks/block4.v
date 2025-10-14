always@ (posedge clk, posedge reset) begin	
	if (reset) begin
		o_wb_dat_e         <= 32'h00000000;
		start_read_e	   <= 1'b0;
		o_wb_ack_e         <= 1'b0;
		wb_ack2_e          <= 1'b0;
		enc_ready_for_data <= 1'b0;
	end else begin
		if(i_wb_adr_e[15:0] == CONFIG_DONE_REG) begin
			buffer_3 <= {2'b00,&(encoder_configured)}; 
			buffer_4 <= buffer_3;
		end
		else begin 
			buffer_3   <= enc_ch[(i_wb_adr_e[6:0])/4];
			buffer_4   <= buffer_3;
		end		
		wb_ack2_e  <= wb_ack1_e;
		o_wb_ack_e <= wb_ack2_e;
		
		if(i_wb_stb_e & i_wb_cyc_e & i_wb_we_e) begin 
			if(i_wb_adr_e[15:0] == CONFIG_CORE_READY) begin
				enc_ready_for_data <= 1'b1;
			end
		end

		if (i_wb_stb_e & i_wb_cyc_e & (~i_wb_we_e)) begin	
			o_wb_dat_e <= {29'h00000000, buffer_4};
			start_read_e <= 1'b1;
		end else begin
			start_read_e <= 1'b0;
		end
	end
end