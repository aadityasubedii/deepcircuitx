 always @ (posedge clk_i)
    v6_data_cmp_valid <= #TCQ rd_mdata_en;
