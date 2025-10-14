  assign active_bank = {active_addr[21],active_addr[8]};
  assign csn_match = active_cs_n == f_cs_n;
  assign rnw_match = active_rnw == f_rnw;
  assign bank_match = active_bank == f_bank;
  assign row_match = {active_addr[20 : 9]} == {f_addr[20 : 9]};
  assign pending = csn_match && rnw_match && bank_match && row_match && !f_empty;