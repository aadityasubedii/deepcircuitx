always @ (posedge clk_i)
begin
  rd_v6_mdata_r1 <= rd_v6_mdata;
  rd_v6_mdata_r2 <= rd_v6_mdata_r1;
  rd_v6_mdata_r3 <= rd_v6_mdata_r2;
  rd_v6_mdata_r4 <= rd_v6_mdata_r3;
end