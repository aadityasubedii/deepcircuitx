  assign clk_en = 1;
  
  assign {zs_cs_n, zs_ras_n, zs_cas_n, zs_we_n} = m_cmd;
  assign zs_addr = m_addr;
  assign zs_cke = clk_en;
  assign zs_dq = oe?m_data:{16{1'bz}};
  assign zs_dqm = m_dqm;
  assign zs_ba = m_bank;
  assign f_select = f_pop & pending;
  assign f_cs_n = 1'b0;
  assign cs_n = f_select ? f_cs_n : active_cs_n;