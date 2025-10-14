      always @(posedge clk) app_wdf_rdy_r <= #TCQ wdf_rdy_ns;
      assign app_wdf_rdy = app_wdf_rdy_r;

`ifdef MC_SVA
  wr_data_buffer_full: cover property (@(posedge clk)
         (~rst && ~app_wdf_rdy_r));






`endif
    end 