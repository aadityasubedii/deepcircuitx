always @(posedge pclk_i) begin
	if (prst_i == 1) begin
		
		prdata_o = 0;
		pready_o = 0; 
		pslverr_o = 0;
		addr_to_drive = 0;
		data_to_drive = 0;
		total_txs = 0;
		cur_tfr_idx = 0;
		for (i = 0; i < MAX_TXS; i=i+1) begin
			addr_regA[i] = 0;
			data_regA[i] = 0;
		end
		ctrl_reg = 0;
		mosi = 1;
		sclk = 1;
		sclk_running = 0;
		cs = 0;
		state = S_IDLE;
		next_state = S_IDLE;
	end
	else begin
		if (penable_i == 1) begin 
			pready_o = 1;  
			if (pwrite_i == 1) begin
				if (paddr_i >= 8'h0 && paddr_i <= 8'h07) begin      
					addr_regA[paddr_i] = pwdata_i;
				end
				if (paddr_i >= 8'h10 && paddr_i <= 8'h17) begin   
					data_regA[paddr_i-8'h10] = pwdata_i;   
				end
				if (paddr_i == 8'h20) begin
					ctrl_reg[3:0] = pwdata_i[3:0];       
					
				end
			end
			else begin
				if (paddr_i >= 8'h0 && paddr_i <= 8'h07) begin   
					prdata_o = addr_regA[paddr_i];
				end
				if (paddr_i >= 8'h10 && paddr_i <= 8'h17) begin  
					prdata_o = data_regA[paddr_i-8'h10];
				end
				if (paddr_i == 8'h20) begin
					prdata_o = ctrl_reg;      
				end
			end
		end
	end
end