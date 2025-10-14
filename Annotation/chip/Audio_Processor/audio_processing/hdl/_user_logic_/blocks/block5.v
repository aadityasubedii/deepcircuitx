always @(posedge Bus2IP_Clk) 
begin
  for (i=0;i<=C_NUM_MEM-1;i=i+1)
  begin
    for (byte_index=0;byte_index<=NUM_BYTE_LANES-1;byte_index=byte_index+1)
    begin
      if(write_enable[i][byte_index] == 1)
      begin
			INPUT[i][byte_index][mem_address] <= data_in[i][byte_index];
			
			
			
      end
      read_address <= mem_address;
    end
  end
end