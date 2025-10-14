always@(*)
if (mem_en && !memwrite)
		casex (mem_addr)
			
			8'b1xxxxxxx: io_data = cr_app_data_out;
			
			8'b00000010: io_data = {24'b0, SW_I};	
			
			8'b00100000: io_data = {16'b0, mic_data, 4'b0};
			8'b00100001: io_data = {31'b0, mic_done};
			
			8'b01000001: io_data = {31'b0, spkr_update};
			
			8'b00001000: io_data = {27'b0, filter, menu_in};
			
			8'b00000000: io_data = br_memdata_out; 
			default: io_data = 0; 
		endcase