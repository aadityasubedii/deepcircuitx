  always @(posedge clk_bufg or posedge rst_tmp_phaser_ref)
    if (rst_tmp_phaser_ref)
      rst_phaser_ref_sync_r <= #TCQ {RST_DIV_SYNC_NUM{1'b1}};
    else
      rst_phaser_ref_sync_r <= #TCQ rst_phaser_ref_sync_r << 1;