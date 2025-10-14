else if (HIGHEST_BANK == 2) begin : banks_2
  assign byte_rd_en_oth_banks[1:0] = {byte_rd_en_v[1],1'b1};
  assign byte_rd_en_oth_banks[3:2] = {byte_rd_en_v[0],1'b1};
end
else begin : banks_1
  assign byte_rd_en_oth_banks[1:0] = {1'b1,1'b1};