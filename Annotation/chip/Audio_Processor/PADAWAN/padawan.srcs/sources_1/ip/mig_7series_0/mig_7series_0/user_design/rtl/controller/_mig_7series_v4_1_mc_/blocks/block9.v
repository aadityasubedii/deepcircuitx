      
      mig_7series_v4_1_ecc_buf #
        (
          
          .TCQ                      (TCQ),
          .DATA_BUF_ADDR_WIDTH      (DATA_BUF_ADDR_WIDTH),
          .DATA_BUF_OFFSET_WIDTH    (DATA_BUF_OFFSET_WIDTH),
          .DATA_WIDTH               (DATA_WIDTH),
          .PAYLOAD_WIDTH            (PAYLOAD_WIDTH),
          .nCK_PER_CLK              (nCK_PER_CLK)
        )
        ecc_buf0
          (           
            
            .rd_merge_data          (rd_merge_data),
            
            .clk                    (clk),
            .rst                    (rst),
            .rd_data                (rd_data),
            .rd_data_addr           (rd_data_addr),
            .rd_data_offset         (rd_data_offset),
            .wr_data_addr           (wr_data_addr),
            .wr_data_offset         (wr_data_offset),
            .wr_ecc_buf             (wr_ecc_buf)
          );