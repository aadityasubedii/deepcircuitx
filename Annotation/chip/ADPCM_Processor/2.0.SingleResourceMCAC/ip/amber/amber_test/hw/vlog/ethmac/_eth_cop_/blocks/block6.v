always @ (m1_in_progress or m1_wb_adr_i or s1_wb_err_i or s2_wb_err_i or `M2_ADDRESSED_S1 or `M2_ADDRESSED_S2 or
          m1_wb_cyc_i or m1_wb_stb_i)
begin
  if(m1_in_progress)  begin
    if(`M1_ADDRESSED_S1)
      m1_wb_err_o <= s1_wb_err_i;
    else if(`M1_ADDRESSED_S2)
      m1_wb_err_o <= s2_wb_err_i;
  end
  else if(m1_wb_cyc_i & m1_wb_stb_i & ~`M1_ADDRESSED_S1 & ~`M1_ADDRESSED_S2)
    m1_wb_err_o <= 1'b1;
  else
    m1_wb_err_o <= 1'b0;
end