      always @(posedge clk) periodic_rd_grant_r = upd_last_master_ns
                                                   ? periodic_rd_grant_ns
                                                   : periodic_rd_grant_r;