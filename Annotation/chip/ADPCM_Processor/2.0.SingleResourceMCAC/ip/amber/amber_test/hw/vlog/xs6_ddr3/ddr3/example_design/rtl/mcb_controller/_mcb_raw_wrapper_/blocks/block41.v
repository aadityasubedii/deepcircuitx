              .P1RWRMASK        ( mig_p1_wr_mask[3:0]),
              .P2WRMASK        ( mig_p2_wr_mask[3:0]),
              .P3WRMASK        ( mig_p3_wr_mask[3:0]), 
              .P4WRMASK        ( mig_p4_wr_mask[3:0]),
              .P5WRMASK        ( mig_p5_wr_mask[3:0]), 
              
              .P0WRDATA      ( mig_p0_wr_data[31:0]), 
              .P1WRDATA      ( mig_p1_wr_data[31:0]),
              .P2WRDATA      ( mig_p2_wr_data[31:0]),
              .P3WRDATA      ( mig_p3_wr_data[31:0]), 
              .P4WRDATA      ( mig_p4_wr_data[31:0]),
              .P5WRDATA      ( mig_p5_wr_data[31:0]),  
              
              .P0WRERROR     (mig_p0_wr_error),
              .P1WRERROR     (mig_p1_wr_error),
              .P0RDERROR     (mig_p0_rd_error),
              .P1RDERROR     (mig_p1_rd_error),
              
              .P2ERROR       (mig_p2_error),
              .P3ERROR       (mig_p3_error),
              .P4ERROR       (mig_p4_error),
              .P5ERROR       (mig_p5_error),
              
              
              
              .P0WRCLK            ( mig_p0_wr_clk  ),
              .P1WRCLK            ( mig_p1_wr_clk  ),
              .P0RDCLK            ( mig_p0_rd_clk  ),
              .P1RDCLK            ( mig_p1_rd_clk  ),
              .P2CLK              ( mig_p2_clk  ),
              .P3CLK              ( mig_p3_clk  ),
              .P4CLK              ( mig_p4_clk  ),
              .P5CLK              ( mig_p5_clk) 
              