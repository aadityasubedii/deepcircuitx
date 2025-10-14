  always @(posedge clk)begin
     if(rst || (enable_wrlvl_cnt != 5'd1)) begin
       wr_level_dqs_asrt <= #TCQ 1'd0;
     end else if ((enable_wrlvl_cnt == 5'd1) && (wrlvl_active_r1)) begin
       wr_level_dqs_asrt <= #TCQ 1'd1;
     end
  end