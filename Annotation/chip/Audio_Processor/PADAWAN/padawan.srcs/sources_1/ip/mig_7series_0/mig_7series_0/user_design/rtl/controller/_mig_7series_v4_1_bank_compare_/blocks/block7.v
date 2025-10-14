  always @(auto_pre_r or rd_half_rmw or req_col_r
           or req_size_r_lcl) begin
    col_addr_template = req_col_r;
    col_addr_template[10] = auto_pre_r && ~rd_half_rmw;
    col_addr_template[11] = req_col_r[10];
    col_addr_template[12] = req_size_r_lcl;
    col_addr_template[13] = req_col_r[11];
  end