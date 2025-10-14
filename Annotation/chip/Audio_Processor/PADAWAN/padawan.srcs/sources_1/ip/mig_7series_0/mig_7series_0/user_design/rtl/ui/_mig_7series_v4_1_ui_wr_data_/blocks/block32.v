  generate begin : write_data_control

      wire wr_data_addr_le = (wr_data_end && wdf_rdy_ns) ||
                             (rd_data_upd_indx_r && ~app_wdf_rdy_r_copy1);
