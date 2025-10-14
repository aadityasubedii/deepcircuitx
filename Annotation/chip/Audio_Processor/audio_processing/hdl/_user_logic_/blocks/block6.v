always @(*) begin
  for (i=0;i<=C_NUM_MEM-1;i=i+1) begin
    for (byte_index=0;byte_index<=NUM_BYTE_LANES-1;byte_index=byte_index+1) begin
      write_enable[i][byte_index] <= Bus2IP_WrCE[i] && Bus2IP_BE[byte_index];
      data_in[i][byte_index] <= Bus2IP_Data[(byte_index*8) +: 8];
    end
  end
end