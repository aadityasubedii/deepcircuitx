  always @(posedge clk_div2  or posedge rst_tmp) begin
    if (rst_tmp) begin
      rstdiv2_sync_r  <= #TCQ {RST_DIV_SYNC_NUM-1{1'b1}};
      rstdiv2_sync_r1 <= #TCQ 1'b1 ;
    end else begin
      rstdiv2_sync_r  <= #TCQ rstdiv2_sync_r << 1;
      rstdiv2_sync_r1 <= #TCQ rstdiv2_sync_r[RST_DIV_SYNC_NUM-2];
    end
  end