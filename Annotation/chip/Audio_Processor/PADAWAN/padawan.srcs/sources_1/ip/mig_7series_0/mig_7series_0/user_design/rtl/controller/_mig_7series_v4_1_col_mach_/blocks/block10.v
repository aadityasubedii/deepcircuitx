        always @(phy_rddata_valid or fifo_out_data_r) begin
          {rd_data_end,
           periodic_rd,
           rd_data_addr,
           rd_data_offset} = fifo_out_data_r[FIFO_WIDTH-1:0];
          ecc_err_addr = {MC_ERR_ADDR_WIDTH{1'b0}};
          rd_data_en = phy_rddata_valid && ~periodic_rd;
          ecc_status_valid = 1'b0;
          wr_ecc_buf = 1'b0;
        end