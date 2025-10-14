      always @(posedge clk_ref[1] or posedge rst_tmp_idelay)
        if (rst_tmp_idelay)
          rst_ref_sync_r[1] <= #TCQ {RST_SYNC_NUM{1'b1}};
        else
          rst_ref_sync_r[1] <= #TCQ rst_ref_sync_r[1] << 1;
 
      assign rst_ref[1]  = rst_ref_sync_r[1][RST_SYNC_NUM-1];
    end