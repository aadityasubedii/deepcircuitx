      always @(posedge clk) rd_data_upd_indx_r <= #TCQ new_rd_data;
    end