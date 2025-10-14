always @ (m2_in_progress or m2_wb_adr_i or s1_wb_ack_i or s2_wb_ack_i or s1_wb_dat_i or s2_wb_dat_i or `M2_ADDRESSED_S1 or `M2_ADDRESSED_S2)
begin
  if(m2_in_progress)
    begin
      if(`M2_ADDRESSED_S1) begin
        m2_wb_ack_o <= s1_wb_ack_i;
        m2_wb_dat_o <= s1_wb_dat_i;
      end
      else if(`M2_ADDRESSED_S2) begin
        m2_wb_ack_o <= s2_wb_ack_i;
        m2_wb_dat_o <= s2_wb_dat_i;
      end
    end
  else
    m2_wb_ack_o <= 0;
end