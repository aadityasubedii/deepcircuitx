  always @(posedge clk_ref[0] or posedge rst_tmp_idelay)
    if (rst_tmp_idelay)
      rst_ref_sync_r[0] <= #TCQ {RST_SYNC_NUM{1'b1}};
    else
      rst_ref_sync_r[0] <= #TCQ rst_ref_sync_r[0] << 1;