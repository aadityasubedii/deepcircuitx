              .P5COUNT           ( mig_p5_count  ),
              
              
              
              .P0RDEMPTY        ( mig_p0_rd_empty), 
              .P0RDFULL         ( mig_p0_rd_full), 
              .P0RDOVERFLOW     ( mig_p0_rd_overflow), 
              .P0WREMPTY        ( mig_p0_wr_empty), 
              .P0WRFULL         ( mig_p0_wr_full), 
              .P0WRUNDERRUN     ( mig_p0_wr_underrun), 
              
              .P1RDEMPTY        ( mig_p1_rd_empty), 
              .P1RDFULL         ( mig_p1_rd_full), 
              .P1RDOVERFLOW     ( mig_p1_rd_overflow),  
              .P1WREMPTY        ( mig_p1_wr_empty), 
              .P1WRFULL         ( mig_p1_wr_full), 
              .P1WRUNDERRUN     ( mig_p1_wr_underrun),  
              
              
              .P2EMPTY          ( mig_p2_empty),
              .P2FULL           ( mig_p2_full),
              .P2RDOVERFLOW        ( mig_p2_overflow), 
              .P2WRUNDERRUN       ( mig_p2_underrun), 
              
              .P3EMPTY          ( mig_p3_empty ),
              .P3FULL           ( mig_p3_full ),
              .P3RDOVERFLOW        ( mig_p3_overflow), 
              .P3WRUNDERRUN       ( mig_p3_underrun ),
              
              .P4EMPTY          ( mig_p4_empty),
              .P4FULL           ( mig_p4_full),
              .P4RDOVERFLOW        ( mig_p4_overflow), 
              .P4WRUNDERRUN       ( mig_p4_underrun), 
              
              .P5EMPTY          ( mig_p5_empty ),
              .P5FULL           ( mig_p5_full ),
              .P5RDOVERFLOW        ( mig_p5_overflow), 
              .P5WRUNDERRUN       ( mig_p5_underrun), 
              
              
              .P0WREN        ( mig_p0_wr_en), 
              .P0RDEN        ( mig_p0_rd_en),                         
              .P1WREN        ( mig_p1_wr_en), 
              .P1RDEN        ( mig_p1_rd_en), 
              .P2EN          ( mig_p2_en),
              .P3EN          ( mig_p3_en), 
              .P4EN          ( mig_p4_en), 
              .P5EN          ( mig_p5_en), 
              
              .P0RWRMASK        ( mig_p0_wr_mask[3:0]), 
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