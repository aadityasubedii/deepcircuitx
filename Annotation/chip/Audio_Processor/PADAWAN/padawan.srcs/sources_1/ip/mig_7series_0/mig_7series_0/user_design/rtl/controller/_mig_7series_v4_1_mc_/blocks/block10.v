    else begin : ecc_on
      
      wire [CODE_WIDTH*ECC_WIDTH-1:0] h_rows;
      wire [2*nCK_PER_CLK*DATA_WIDTH-1:0] rd_merge_data;
      wire [2*nCK_PER_CLK*DQ_WIDTH-1:0] mc_wrdata_i;

      
      
      mig_7series_v4_1_ecc_merge_enc #
        (
          
          .TCQ                      (TCQ),
          .CODE_WIDTH               (CODE_WIDTH),
          .DATA_BUF_ADDR_WIDTH      (DATA_BUF_ADDR_WIDTH),
          .DATA_WIDTH               (DATA_WIDTH),
          .DQ_WIDTH                 (DQ_WIDTH),
          .ECC_WIDTH                (ECC_WIDTH),
          .PAYLOAD_WIDTH            (PAYLOAD_WIDTH),
          .nCK_PER_CLK              (nCK_PER_CLK)
        )
        ecc_merge_enc0
          (
            
            .mc_wrdata              (mc_wrdata_i),
            .mc_wrdata_mask         (mc_wrdata_mask),
            
            .clk                    (clk),
            .rst                    (rst),
            .h_rows                 (h_rows),
            .rd_merge_data          (rd_merge_data),
            .raw_not_ecc            (raw_not_ecc),
            .wr_data                (wr_data),
            .wr_data_mask           (wr_data_mask)
          );

      
      mig_7series_v4_1_ecc_dec_fix #
        (
          
          .TCQ                      (TCQ),
          .CODE_WIDTH               (CODE_WIDTH), 
          .DATA_WIDTH               (DATA_WIDTH),
          .DQ_WIDTH                 (DQ_WIDTH),
          .ECC_WIDTH                (ECC_WIDTH),
          .PAYLOAD_WIDTH            (PAYLOAD_WIDTH),
          .nCK_PER_CLK              (nCK_PER_CLK)
        )
        ecc_dec_fix0
          (
            
            .ecc_multiple           (ecc_multiple), 
            .ecc_single             (ecc_single),
            .rd_data                (rd_data),
            
            .clk                    (clk),
            .rst                    (rst),
            .correct_en             (correct_en),
            .phy_rddata             (phy_rd_data),          
            .ecc_status_valid       (ecc_status_valid),
            .h_rows                 (h_rows)
          );