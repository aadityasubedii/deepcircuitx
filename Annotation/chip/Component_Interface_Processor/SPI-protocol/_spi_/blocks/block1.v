always @(posedge sclk_ref_i) begin
if (prst_i != 1) begin
case (state)
	S_IDLE: begin
		sclk_running = 0;
		if (ctrl_reg[0]) begin
			ctrl_reg[0] = 0;
			cur_tfr_idx = ctrl_reg[6:4]; 
			total_txs = ctrl_reg[3:1] + 1;  
			addr_to_drive = addr_regA[cur_tfr_idx];
			data_to_drive = data_regA[cur_tfr_idx];
			count = 0;
			next_state = S_ADDR;
		end
	end
	S_ADDR: begin
		sclk_running = 1;
		mosi = addr_to_drive[count];	
		count = count+1;         
		if (count == 8) begin     
			next_state = S_IDLE_BW_ADDR_DATA;
			count = 0;
		end
	end
	S_IDLE_BW_ADDR_DATA: begin
		sclk_running = 0;
		count = count+1;     
		if (count == 4) begin  
			next_state = S_DATA;
			count = 0;
		end
	end
	S_DATA: begin
		sclk_running = 1;
		if (addr_to_drive[7] == 1) mosi = data_to_drive[count];	
		else data_collected[count] = miso;	
		count = count+1;
		if (count == 8) begin
			total_txs = total_txs - 1;  
			cur_tfr_idx = cur_tfr_idx + 1; 
			ctrl_reg[6:4] = cur_tfr_idx;  
			addr_to_drive = 0;
			data_to_drive = 0;
			if (total_txs == 0) begin      
				next_state = S_IDLE; 
			end
			else begin
				next_state = S_IDLE_BW_TXS;  
			end
			count = 0;
		end
	end
	S_IDLE_BW_TXS: begin
		sclk_running = 0;
		count = count+1;
		if (count == 8) begin                               
			addr_to_drive = addr_regA[cur_tfr_idx];
			data_to_drive = data_regA[cur_tfr_idx];
			next_state = S_ADDR;
			count = 0;
		end
	end
endcase