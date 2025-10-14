generate

if (HIGHEST_BANK == 3) begin : banks_3
  assign byte_rd_en_oth_banks[1:0] = {byte_rd_en_v[1],byte_rd_en_v[2]};
  assign byte_rd_en_oth_banks[3:2] = {byte_rd_en_v[0],byte_rd_en_v[2]};
  assign byte_rd_en_oth_banks[5:4] = {byte_rd_en_v[0],byte_rd_en_v[1]};
end