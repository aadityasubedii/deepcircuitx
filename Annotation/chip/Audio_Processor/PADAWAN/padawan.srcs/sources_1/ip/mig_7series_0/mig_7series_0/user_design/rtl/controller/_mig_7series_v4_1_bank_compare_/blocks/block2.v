  always @(act_wait_r or req_row_r_lcl) begin
    row_addr = req_row_r_lcl;

    if (~act_wait_r) row_addr[10] = 1'b0;
  end
