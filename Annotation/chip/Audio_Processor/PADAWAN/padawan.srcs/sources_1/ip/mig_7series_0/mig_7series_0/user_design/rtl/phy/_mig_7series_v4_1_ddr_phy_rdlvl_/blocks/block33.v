  always @(posedge clk)
    if (rst)
      store_sr_r      <= #TCQ 1'b0;
    else begin
      if (store_sr_req_r)
        store_sr_r <= #TCQ 1'b1;
      else if ((sr_valid_r || mpr_valid_r) && store_sr_r)
        store_sr_r <= #TCQ 1'b0;
    end