always @(*)
begin
  for (i=0;i<=C_NUM_MEM-1;i=i+1)
  begin
    for (byte_index=0;byte_index<=NUM_BYTE_LANES-1;byte_index=byte_index+1)
    begin
      mem_data_out[i][(byte_index*8) +: 8] <= data_out[i][byte_index];
    end
  end
end 