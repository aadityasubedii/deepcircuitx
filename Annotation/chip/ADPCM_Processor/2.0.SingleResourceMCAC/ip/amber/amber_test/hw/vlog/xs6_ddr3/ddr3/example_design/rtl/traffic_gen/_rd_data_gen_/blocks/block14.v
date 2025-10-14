always @ (posedge clk_i)
begin
      data_rdy_r1 <= #TCQ data_rdy_i;
      data_rdy_r2 <= #TCQ data_rdy_r1;
      cmd_valid_r1 <= #TCQ cmd_valid_i;
end      