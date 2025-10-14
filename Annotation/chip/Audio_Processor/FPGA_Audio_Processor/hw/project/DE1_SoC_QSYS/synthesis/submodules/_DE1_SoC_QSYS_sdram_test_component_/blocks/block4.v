  assign addr_col = a[9 : 0];
  assign test_addr = {addr_crb, addr_col};
  assign mem_bytes = read_data;
  assign rmw_temp[7 : 0] = dqm[0] ? mem_bytes[7 : 0] : zs_dq[7 : 0];
  assign rmw_temp[15 : 8] = dqm[1] ? mem_bytes[15 : 8] : zs_dq[15 : 8];