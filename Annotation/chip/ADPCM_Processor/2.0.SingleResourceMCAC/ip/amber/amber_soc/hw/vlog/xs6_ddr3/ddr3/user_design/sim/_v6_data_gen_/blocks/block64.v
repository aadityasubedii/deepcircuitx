always @ (posedge clk_i)
begin
  data_mode_rr_a <= #TCQ data_mode_i;
  data_mode_rr_b <= #TCQ data_mode_i;
  data_mode_rr_c <= #TCQ data_mode_i;
 
end  