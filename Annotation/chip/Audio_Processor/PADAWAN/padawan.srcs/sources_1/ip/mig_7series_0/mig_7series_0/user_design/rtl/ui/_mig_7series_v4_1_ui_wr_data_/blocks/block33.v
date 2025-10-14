  always @( posedge clk ) begin
  	app_wdf_rdy_r_copy1 <= #TCQ wdf_rdy_ns;
  	app_wdf_rdy_r_copy2 <= #TCQ wdf_rdy_ns;
  	app_wdf_rdy_r_copy3 <= #TCQ wdf_rdy_ns;
  	app_wdf_rdy_r_copy4 <= #TCQ wdf_rdy_ns;
  end