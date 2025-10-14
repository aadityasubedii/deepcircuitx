  mig_7series_v4_1_col_mach #
    (
      
      .TCQ                     (TCQ),
      .BANK_WIDTH              (BANK_WIDTH),
      .BURST_MODE              (BURST_MODE),
      .COL_WIDTH               (COL_WIDTH),
      .CS_WIDTH                (CS_WIDTH),
      .DATA_BUF_ADDR_WIDTH     (DATA_BUF_ADDR_WIDTH),
      .DATA_BUF_OFFSET_WIDTH   (DATA_BUF_OFFSET_WIDTH),
      .DELAY_WR_DATA_CNTRL     (DELAY_WR_DATA_CNTRL),
      .DQS_WIDTH               (DQS_WIDTH),
      .DRAM_TYPE               (DRAM_TYPE),
      .EARLY_WR_DATA_ADDR      (EARLY_WR_DATA_ADDR),
      .ECC                     (ECC),
      .MC_ERR_ADDR_WIDTH       (MC_ERR_ADDR_WIDTH),
      .nCK_PER_CLK             (nCK_PER_CLK),
      .nPHY_WRLAT              (nPHY_WRLAT),
      .RANK_WIDTH              (RANK_WIDTH),
      .ROW_WIDTH               (ROW_WIDTH)
    )
    col_mach0
      (
        
        .mc_wrdata_en         (mc_wrdata_en_ns),
        .dq_busy_data         (dq_busy_data),
        .ecc_err_addr         (ecc_err_addr[MC_ERR_ADDR_WIDTH-1:0]),
        .ecc_status_valid     (ecc_status_valid),
        .rd_data_addr         (rd_data_addr[DATA_BUF_ADDR_WIDTH-1:0]),
        .rd_data_en           (rd_data_en),
        .rd_data_end          (rd_data_end),
        .rd_data_offset       (rd_data_offset),
        .rd_rmw               (rd_rmw),
        .wr_data_addr         (wr_data_addr_ns),
        .wr_data_en           (wr_data_en_ns),
        .wr_data_offset       (wr_data_offset_ns),
        .wr_ecc_buf           (wr_ecc_buf),
        .col_read_fifo_empty  (col_read_fifo_empty),
        
        .clk                  (clk),
        .rst                  (rst),
        .col_a                (col_a[ROW_WIDTH-1:0]),
        .col_ba               (col_ba[BANK_WIDTH-1:0]),
        .col_data_buf_addr    (col_data_buf_addr[DATA_BUF_ADDR_WIDTH-1:0]),
        .col_periodic_rd      (col_periodic_rd),
        .col_ra               (col_ra[RANK_WIDTH-1:0]),
        .col_rmw              (col_rmw),
        .col_rd_wr            (col_rd_wr),
        .col_row              (col_row[ROW_WIDTH-1:0]),
        .col_size             (col_size),
        .col_wr_data_buf_addr (col_wr_data_buf_addr[DATA_BUF_ADDR_WIDTH-1:0]),
        .phy_rddata_valid     (phy_rddata_valid),
        .sent_col             (EVEN_CWL_2T_MODE == "ON" ? sent_col_r : sent_col)
      );