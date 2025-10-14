always @ (posedge UI_CLK )begin
  if (STATE == START_DYN_CAL_PRE)
     pre_sysrst_cnt <= pre_sysrst_cnt + 1;
  else
     pre_sysrst_cnt <= 4'b0;
end