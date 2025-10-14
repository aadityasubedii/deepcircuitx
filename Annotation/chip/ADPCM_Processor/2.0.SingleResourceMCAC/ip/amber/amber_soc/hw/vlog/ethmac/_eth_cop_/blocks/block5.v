always @ (m2_in_progress or m2_wb_adr_i or s1_wb_err_i or s2_wb_err_i or `M2_ADDRESSED_S1 or `M2_ADDRESSED_S2 or
          m2_wb_cyc_i or m2_wb_stb_i)
begin
  if(m2_in_progress)  begin
    if(`M2_ADDRESSED_S1)
      m2_wb_err_o <= s1_wb_err_i;
    else if(`M2_ADDRESSED_S2)
      m2_wb_err_o <= s2_wb_err_i;
  end
  else if(m2_wb_cyc_i & m2_wb_stb_i & ~`M2_ADDRESSED_S1 & ~`M2_ADDRESSED_S2)
    m2_wb_err_o <= 1'b1;
  else
    m2_wb_err_o <= 1'b0;
end