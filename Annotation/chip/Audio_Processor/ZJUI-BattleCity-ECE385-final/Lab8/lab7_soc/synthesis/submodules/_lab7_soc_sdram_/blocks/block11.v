  assign active_bank = {active_addr[24],active_addr[10]};
  assign csn_match = active_cs_n == f_cs_n;
  assign rnw_match = active_rnw == f_rnw;
  assign bank_match = active_bank == f_bank;
  assign row_match = {active_addr[23 : 11]} == {f_addr[23 : 11]};
  assign pending = csn_match && rnw_match && bank_match && row_match && !f_empty;
  assign cas_addr = f_select ? { {3{1'b0}},f_addr[9 : 0] } : { {3{1'b0}},active_addr[9 : 0] };