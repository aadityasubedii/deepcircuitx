always @ (negedge s_clk)
begin
	
	if (s_reset)
	begin
		integer i;
		for(i=0;i<SEG7_NUM*8;i=i+1)
		begin
			reg_file[i] = (DEFAULT_ACTIVE)?1'b1:1'b0; 
		end
	end
	else if (s_write)
	begin
		integer j;
		write_data = s_writedata;
		base_index = s_address;
		base_index = base_index << 3;
		for(j=0;j<8;j=j+1)
		begin
			reg_file[base_index+j] = write_data[j];
		end
	end
	else if (s_read)
	begin
		integer k;
		base_index = s_address;
		base_index = base_index << 3;
		for(k=0;k<8;k=k+1)
		begin
			read_data[k] = reg_file[base_index+k];
		end
	end	
end