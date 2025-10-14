  always @(posedge clk) begin
      app_wdf_data_r1 <= #TCQ app_wdf_data_ns1;
      app_wdf_mask_r1 <= #TCQ app_wdf_mask_ns1;
      app_wdf_wren_r1 <= #TCQ app_wdf_wren_ns1;
      app_wdf_end_r1 <= #TCQ app_wdf_end_ns1;
  end