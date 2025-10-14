  always @(posedge mmcm_ps_clk  or posedge rst_tmp) begin
    if (rst_tmp) begin
      rst_sync_r  <= #TCQ {RST_DIV_SYNC_NUM-1{1'b1}};
      rst_sync_r1 <= #TCQ 1'b1 ;
    end else begin
      rst_sync_r  <= #TCQ rst_sync_r << 1;
      rst_sync_r1 <= #TCQ rst_sync_r[RST_DIV_SYNC_NUM-2];
    end
  end