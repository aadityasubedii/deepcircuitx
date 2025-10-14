always @ (m1_in_progress or m1_wb_adr_i or s1_wb_ack_i or s2_wb_ack_i or s1_wb_dat_i or s2_wb_dat_i or `M1_ADDRESSED_S1 or `M1_ADDRESSED_S2)
begin
  if(m1_in_progress)
    begin
      if(`M1_ADDRESSED_S1) begin
        m1_wb_ack_o <= s1_wb_ack_i;
        m1_wb_dat_o <= s1_wb_dat_i;
      end
      else if(`M1_ADDRESSED_S2) begin
        m1_wb_ack_o <= s2_wb_ack_i;
        m1_wb_dat_o <= s2_wb_dat_i;
      end
    end
  else
    m1_wb_ack_o <= 0;
end