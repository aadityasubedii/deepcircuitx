        mig_7series_v4_1_fi_xor #(
          .DQ_WIDTH (DQ_WIDTH),
          .DQS_WIDTH (DQS_WIDTH),
          .nCK_PER_CLK (nCK_PER_CLK)
        )
        fi_xor0
        (
          .clk (clk),
          .wrdata_in (mc_wrdata_i),
          .wrdata_out (mc_wrdata),
          .wrdata_en (mc_wrdata_en_i),
          .fi_xor_we (fi_xor_we),
          .fi_xor_wrdata (fi_xor_wrdata)
        );
     end